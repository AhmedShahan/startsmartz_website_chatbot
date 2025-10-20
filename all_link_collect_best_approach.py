import asyncio
import aiohttp
from aiohttp import ClientTimeout, TCPConnector
from urllib.parse import urljoin, urlparse, urlunparse
from bs4 import BeautifulSoup
import json
import time
from typing import Set, List, Dict
import xml.etree.ElementTree as ET
from collections import deque
import re
from playwright.async_api import async_playwright
import logging

# Configure logging
logging.basicConfig(level=logging.INFO, format='%(asctime)s - %(levelname)s - %(message)s')
logger = logging.getLogger(__name__)


class AdvancedWebCrawler:
    """High-performance async web crawler with hybrid approach"""
    
    def __init__(self, start_url: str, max_pages: int = 1000, max_concurrent: int = 20):
        self.start_url = start_url
        self.max_pages = max_pages
        self.max_concurrent = max_concurrent
        self.base_domain = urlparse(start_url).netloc
        
        # State tracking
        self.visited_pages: Set[str] = set()
        self.all_links: Set[str] = set()
        self.crawled_pages: List[str] = []
        self.failed_pages: List[str] = []
        self.js_rendered_pages: Set[str] = set()
        
        # Performance tracking
        self.start_time = None
        self.stats = {
            'pages_crawled': 0,
            'links_found': 0,
            'js_pages': 0,
            'failed': 0
        }
    
    def normalize_url(self, url: str) -> str:
        """Normalize URL by removing fragments and sorting query params"""
        parsed = urlparse(url)
        # Remove fragment and normalize path
        normalized = urlunparse((
            parsed.scheme,
            parsed.netloc,
            parsed.path.rstrip('/') or '/',
            '',
            '',
            ''
        ))
        return normalized
    
    def should_crawl_url(self, url: str) -> bool:
        """Determine if URL should be crawled"""
        parsed = urlparse(url)
        
        # Must be same domain
        if parsed.netloc != self.base_domain:
            return False
        
        # Skip file extensions
        skip_extensions = {
            '.pdf', '.jpg', '.jpeg', '.png', '.gif', '.svg', '.ico',
            '.webp', '.css', '.js', '.zip', '.doc', '.docx', '.xls',
            '.xlsx', '.mp4', '.avi', '.mov', '.mp3', '.wav', '.xml'
        }
        
        if any(parsed.path.lower().endswith(ext) for ext in skip_extensions):
            return False
        
        # Skip special schemes
        if parsed.scheme in {'mailto', 'tel', 'javascript', 'data'}:
            return False
        
        # Skip common pagination/filter params to reduce queue explosion
        skip_params = ['page=', 'sort=', 'filter=', 'offset=', 'limit=']
        if any(param in url for param in skip_params):
            return False
        
        return True
    
    async def fetch_sitemap(self, session: aiohttp.ClientSession) -> List[str]:
        """Fetch and parse sitemap.xml"""
        sitemap_urls = []
        sitemap_url = urljoin(self.start_url, '/sitemap.xml')
        
        try:
            logger.info(f"Fetching sitemap: {sitemap_url}")
            async with session.get(sitemap_url, timeout=ClientTimeout(total=10)) as response:
                if response.status == 200:
                    content = await response.read()
                    root = ET.fromstring(content)
                    
                    namespaces = {'sitemap': 'http://www.sitemaps.org/schemas/sitemap/0.9'}
                    
                    # Extract URLs
                    for url_elem in root.findall('.//sitemap:url/sitemap:loc', namespaces):
                        if url_elem.text:
                            sitemap_urls.append(url_elem.text.strip())
                    
                    # Handle sitemap index
                    for sitemap_elem in root.findall('.//sitemap:sitemap/sitemap:loc', namespaces):
                        if sitemap_elem.text:
                            sub_urls = await self.fetch_sitemap_recursive(session, sitemap_elem.text.strip())
                            sitemap_urls.extend(sub_urls)
                    
                    logger.info(f"Found {len(sitemap_urls)} URLs in sitemap")
        except Exception as e:
            logger.warning(f"Could not parse sitemap: {e}")
        
        return sitemap_urls
    
    async def fetch_sitemap_recursive(self, session: aiohttp.ClientSession, url: str) -> List[str]:
        """Recursively fetch nested sitemaps"""
        urls = []
        try:
            async with session.get(url, timeout=ClientTimeout(total=10)) as response:
                if response.status == 200:
                    content = await response.read()
                    root = ET.fromstring(content)
                    namespaces = {'sitemap': 'http://www.sitemaps.org/schemas/sitemap/0.9'}
                    
                    for url_elem in root.findall('.//sitemap:url/sitemap:loc', namespaces):
                        if url_elem.text:
                            urls.append(url_elem.text.strip())
        except Exception as e:
            logger.warning(f"Error fetching nested sitemap {url}: {e}")
        
        return urls
    
    async def discover_common_pages(self, session: aiohttp.ClientSession) -> List[str]:
        """Discover common pages using HEAD requests"""
        common_paths = [
            '/about', '/about-us', '/contact', '/contact-us',
            '/services', '/products', '/portfolio', '/blog',
            '/careers', '/team', '/privacy', '/terms',
            '/faq', '/support', '/testimonials', '/gallery'
        ]
        
        discovered = []
        
        async def check_page(path: str):
            url = urljoin(self.start_url, path)
            try:
                async with session.head(url, timeout=ClientTimeout(total=5), allow_redirects=True) as response:
                    if response.status == 200 and urlparse(str(response.url)).netloc == self.base_domain:
                        return str(response.url)
            except:
                pass
            return None
        
        tasks = [check_page(path) for path in common_paths]
        results = await asyncio.gather(*tasks)
        discovered = [url for url in results if url]
        
        logger.info(f"Discovered {len(discovered)} common pages")
        return discovered
    
    async def fetch_page_async(self, session: aiohttp.ClientSession, url: str) -> tuple:
        """Fetch page content using aiohttp (fast for static pages)"""
        try:
            async with session.get(url, timeout=ClientTimeout(total=15)) as response:
                if response.status == 200:
                    html = await response.text()
                    return url, html, False  # False = not JS-rendered
                else:
                    return url, None, False
        except asyncio.TimeoutError:
            logger.warning(f"Timeout fetching {url}")
            return url, None, False
        except Exception as e:
            logger.warning(f"Error fetching {url}: {str(e)[:100]}")
            return url, None, False
    
    async def fetch_page_playwright(self, url: str) -> tuple:
        """Fetch JS-rendered page using Playwright (for dynamic content)"""
        try:
            async with async_playwright() as p:
                browser = await p.chromium.launch(headless=True)
                context = await browser.new_context(
                    user_agent='Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36'
                )
                page = await context.new_page()
                
                await page.goto(url, wait_until='networkidle', timeout=20000)
                html = await page.content()
                
                await browser.close()
                return url, html, True  # True = JS-rendered
        except Exception as e:
            logger.warning(f"Playwright error for {url}: {str(e)[:100]}")
            return url, None, True
    
    def detect_js_framework(self, html: str) -> bool:
        """Detect if page uses JavaScript framework"""
        js_indicators = [
            'react', 'vue', 'angular', 'next.js', 'nuxt',
            'data-reactroot', 'ng-app', 'v-app', '__NEXT_DATA__'
        ]
        return any(indicator in html.lower() for indicator in js_indicators)
    
    def extract_links_from_html(self, html: str, base_url: str) -> Set[str]:
        """Extract all links from HTML using BeautifulSoup"""
        links = set()
        
        try:
            soup = BeautifulSoup(html, 'lxml')
            
            # Extract from anchor tags
            for anchor in soup.find_all('a', href=True):
                href = anchor['href'].strip()
                if href:
                    absolute_url = urljoin(base_url, href)
                    links.add(absolute_url)
            
            # Extract from buttons and other elements with data-href
            for elem in soup.find_all(attrs={'data-href': True}):
                href = elem['data-href'].strip()
                if href:
                    absolute_url = urljoin(base_url, href)
                    links.add(absolute_url)
            
            # Extract from onclick attributes
            for elem in soup.find_all(onclick=True):
                onclick = elem['onclick']
                url_match = re.search(r'["\']([^"\']+)["\']', onclick)
                if url_match:
                    href = url_match.group(1)
                    if href.startswith(('/', 'http')):
                        absolute_url = urljoin(base_url, href)
                        links.add(absolute_url)
        
        except Exception as e:
            logger.error(f"Error parsing HTML: {e}")
        
        return links
    
    async def crawl_batch(self, session: aiohttp.ClientSession, urls: List[str], use_playwright: bool = False):
        """Crawl a batch of URLs concurrently"""
        semaphore = asyncio.Semaphore(self.max_concurrent)
        
        async def crawl_one(url: str):
            async with semaphore:
                normalized = self.normalize_url(url)
                
                if normalized in self.visited_pages or len(self.visited_pages) >= self.max_pages:
                    return
                
                self.visited_pages.add(normalized)
                
                # Fetch page
                if use_playwright or url in self.js_rendered_pages:
                    url_result, html, is_js = await self.fetch_page_playwright(url)
                else:
                    url_result, html, is_js = await self.fetch_page_async(session, url)
                
                if html:
                    # Check if JS rendering is needed
                    if not is_js and self.detect_js_framework(html):
                        logger.info(f"JS framework detected on {url}, re-fetching with Playwright")
                        self.js_rendered_pages.add(url)
                        url_result, html, is_js = await self.fetch_page_playwright(url)
                    
                    if html:
                        # Extract links
                        page_links = self.extract_links_from_html(html, url)
                        self.all_links.update(page_links)
                        self.crawled_pages.append(url)
                        self.stats['pages_crawled'] += 1
                        self.stats['links_found'] = len(self.all_links)
                        if is_js:
                            self.stats['js_pages'] += 1
                        
                        logger.info(f"✓ [{self.stats['pages_crawled']}/{self.max_pages}] {url} - {len(page_links)} links")
                        
                        # Return new links to crawl
                        return [link for link in page_links if self.should_crawl_url(link)]
                else:
                    self.failed_pages.append(url)
                    self.stats['failed'] += 1
                    logger.warning(f"✗ Failed: {url}")
                
                return []
        
        tasks = [crawl_one(url) for url in urls]
        results = await asyncio.gather(*tasks, return_exceptions=True)
        
        # Flatten new links
        new_links = []
        for result in results:
            if isinstance(result, list):
                new_links.extend(result)
        
        return new_links
    
    async def crawl(self):
        """Main crawling method"""
        self.start_time = time.time()
        logger.info(f"Starting crawl of {self.start_url}")
        logger.info(f"Max pages: {self.max_pages}, Concurrent: {self.max_concurrent}")
        
        # Configure aiohttp session
        timeout = ClientTimeout(total=30)
        connector = TCPConnector(limit=self.max_concurrent, limit_per_host=10)
        
        async with aiohttp.ClientSession(
            timeout=timeout,
            connector=connector,
            headers={'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36'}
        ) as session:
            # Step 1: Discover initial URLs
            logger.info("=" * 70)
            logger.info("PHASE 1: Initial URL Discovery")
            logger.info("=" * 70)
            
            sitemap_urls = await self.fetch_sitemap(session)
            common_urls = await self.discover_common_pages(session)
            
            initial_urls = list(set([self.start_url] + sitemap_urls + common_urls))
            logger.info(f"Total initial URLs to crawl: {len(initial_urls)}")
            
            # Step 2: Crawl in batches
            logger.info("=" * 70)
            logger.info("PHASE 2: Crawling Pages")
            logger.info("=" * 70)
            
            urls_to_crawl = deque(initial_urls)
            
            while urls_to_crawl and len(self.visited_pages) < self.max_pages:
                # Take a batch
                batch_size = min(self.max_concurrent * 2, len(urls_to_crawl))
                batch = [urls_to_crawl.popleft() for _ in range(batch_size)]
                
                # Crawl batch
                new_links = await self.crawl_batch(session, batch)
                
                # Add new links to queue
                for link in new_links:
                    normalized = self.normalize_url(link)
                    if normalized not in self.visited_pages:
                        urls_to_crawl.append(link)
                
                # Progress update
                elapsed = time.time() - self.start_time
                pages_per_sec = self.stats['pages_crawled'] / elapsed if elapsed > 0 else 0
                logger.info(f"Queue: {len(urls_to_crawl)} | Speed: {pages_per_sec:.2f} pages/sec")
        
        # Final results
        elapsed = time.time() - self.start_time
        logger.info("=" * 70)
        logger.info("CRAWL COMPLETE")
        logger.info("=" * 70)
        logger.info(f"Time elapsed: {elapsed:.2f} seconds")
        logger.info(f"Pages crawled: {self.stats['pages_crawled']}")
        logger.info(f"Pages failed: {self.stats['failed']}")
        logger.info(f"JS-rendered pages: {self.stats['js_pages']}")
        logger.info(f"Total unique links: {self.stats['links_found']}")
        logger.info(f"Average speed: {self.stats['pages_crawled'] / elapsed:.2f} pages/sec")
    
    def categorize_links(self) -> Dict:
        """Categorize links into internal, external, etc."""
        internal, external, email, phone, files = [], [], [], [], []
        
        for link in self.all_links:
            parsed = urlparse(link)
            
            if parsed.scheme == 'mailto':
                email.append(link)
            elif parsed.scheme == 'tel':
                phone.append(link)
            elif parsed.netloc == self.base_domain:
                internal.append(link)
            elif parsed.netloc:
                external.append(link)
        
        return {
            'internal': sorted(set(internal)),
            'external': sorted(set(external)),
            'email': sorted(set(email)),
            'phone': sorted(set(phone)),
            'files': sorted(set(files))
        }
    
    def save_results(self, filename: str = 'crawl_results.json'):
        """Save results to JSON file"""
        categorized = self.categorize_links()
        
        results = {
            'base_domain': self.base_domain,
            'start_url': self.start_url,
            'crawled_at': time.strftime('%Y-%m-%d %H:%M:%S'),
            'stats': self.stats,
            'crawled_pages': self.crawled_pages,
            'failed_pages': self.failed_pages,
            'categorized_links': categorized,
            'all_links': sorted(self.all_links)
        }
        
        with open(filename, 'w', encoding='utf-8') as f:
            json.dump(results, f, indent=2, ensure_ascii=False)
        
        logger.info(f"Results saved to {filename}")
        
        # Also save simple text file
        txt_filename = filename.replace('.json', '.txt')
        with open(txt_filename, 'w', encoding='utf-8') as f:
            f.write(f"Web Crawler Results - {self.base_domain}\n")
            f.write(f"Crawled: {time.strftime('%Y-%m-%d %H:%M:%S')}\n")
            f.write(f"Pages: {self.stats['pages_crawled']}\n")
            f.write(f"Links: {self.stats['links_found']}\n")
            f.write("=" * 70 + "\n\n")
            
            for link in sorted(self.all_links):
                f.write(f"{link}\n")
        
        logger.info(f"Links saved to {txt_filename}")


async def main():
    """Main entry point"""
    # Configuration
    START_URL = "https://vivasoftltd.com/"
    MAX_PAGES = 1000
    MAX_CONCURRENT = 20  # Adjust based on your network and target site
    
    # Create and run crawler
    crawler = AdvancedWebCrawler(
        start_url=START_URL,
        max_pages=MAX_PAGES,
        max_concurrent=MAX_CONCURRENT
    )
    
    await crawler.crawl()
    crawler.save_results('vivasoft_crawl_results.json')


if __name__ == "__main__":
    asyncio.run(main())
