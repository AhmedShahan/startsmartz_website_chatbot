from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
from selenium.common.exceptions import TimeoutException, WebDriverException
from urllib.parse import urljoin, urlparse, urlunparse
import time
import json
from collections import deque
import requests
import xml.etree.ElementTree as ET
import re

def parse_sitemap(base_url):
    """Parse sitemap.xml to get all listed pages"""
    sitemap_urls = []
    sitemap_url = urljoin(base_url, '/sitemap.xml')
    
    try:
        print(f"Checking sitemap: {sitemap_url}")
        response = requests.get(sitemap_url, timeout=10)
        if response.status_code == 200:
            root = ET.fromstring(response.content)
            
            # Handle different sitemap namespaces
            namespaces = {
                'sitemap': 'http://www.sitemaps.org/schemas/sitemap/0.9',
                'sitemap_index': 'http://www.sitemaps.org/schemas/sitemap/0.9'
            }
            
            # Look for URL entries
            for url_elem in root.findall('.//sitemap:url/sitemap:loc', namespaces):
                if url_elem.text:
                    sitemap_urls.append(url_elem.text.strip())
            
            # Also check for sitemap index files
            for sitemap_elem in root.findall('.//sitemap:sitemap/sitemap:loc', namespaces):
                if sitemap_elem.text:
                    # Recursively parse sub-sitemaps
                    sub_urls = parse_sitemap(sitemap_elem.text.strip())
                    sitemap_urls.extend(sub_urls)
            
            print(f"Found {len(sitemap_urls)} URLs in sitemap")
            return sitemap_urls
    except Exception as e:
        print(f"Could not parse sitemap: {e}")
    
    return []


def discover_pattern_based_urls(base_url):
    """Discover URLs based on common patterns"""
    base_domain = urlparse(base_url).netloc
    discovered_pages = []
    
    print("Discovering pattern-based URLs...")
    
    # Common URL patterns to test
    patterns = [
        # Feature pages
        '/web-development/feature/{id}',
        '/mobile-app-development/feature/{id}',
        '/software-development/feature/{id}',
        '/digital-marketing/feature/{id}',
        '/seo-search-engine-optimization/feature/{id}',
        # Product pages
        '/products/feature/{id}',
        '/services/feature/{id}',
        # Blog posts
        '/blog/post/{id}',
        '/blog/article/{id}',
        # Portfolio items
        '/portfolio/project/{id}',
        '/work/project/{id}',
        # Team members
        '/team/member/{id}',
        # Case studies
        '/case-study/{id}',
        '/case-studies/{id}'
    ]
    
    # Test different ID ranges
    id_ranges = [
        range(1, 51),    # 1-50
        range(100, 151), # 100-150
        range(200, 251)  # 200-250
    ]
    
    for pattern in patterns:
        for id_range in id_ranges:
            found_in_range = 0
            for i in id_range:
                test_url = urljoin(base_url, pattern.format(id=i))
                try:
                    response = requests.head(test_url, timeout=3, allow_redirects=True)
                    if response.status_code == 200:
                        if urlparse(response.url).netloc == base_domain:
                            discovered_pages.append(response.url)
                            found_in_range += 1
                            print(f"  ✓ Found: {response.url}")
                except:
                    continue
            
            # If we found some URLs in this range, continue to next range
            if found_in_range == 0:
                break  # No URLs found in this range, skip other ranges for this pattern
    
    return discovered_pages


def discover_common_pages(base_url):
    """Try to discover common pages that might exist"""
    base_domain = urlparse(base_url).netloc
    common_pages = [
        '/about', '/about-us', '/about.html',
        '/contact', '/contact-us', '/contact.html',
        '/services', '/service', '/our-services',
        '/products', '/product', '/our-products',
        '/portfolio', '/work', '/projects',
        '/blog', '/news', '/articles',
        '/career', '/careers', '/jobs',
        '/team', '/our-team',
        '/privacy', '/privacy-policy',
        '/terms', '/terms-of-service', '/terms-and-conditions',
        '/sitemap', '/sitemap.html',
        '/faq', '/help', '/support',
        '/testimonials', '/reviews',
        '/gallery', '/images',
        '/downloads', '/resources'
    ]
    
    discovered_pages = []
    print("Discovering common pages...")
    
    for page in common_pages:
        test_url = urljoin(base_url, page)
        try:
            response = requests.head(test_url, timeout=5, allow_redirects=True)
            if response.status_code == 200:
                # Verify it's the same domain after redirects
                if urlparse(response.url).netloc == base_domain:
                    discovered_pages.append(response.url)
                    print(f"  ✓ Found: {response.url}")
        except:
            continue
    
    return discovered_pages


def extract_links_from_page(driver, url):
    """Extract all links from a single page"""
    try:
        driver.get(url)
        
        # Wait for React to render - adjust timeout as needed
        time.sleep(5)  # Give React time to fully render
        
        # Scroll to load lazy-loaded content multiple times
        last_height = driver.execute_script("return document.body.scrollHeight")
        while True:
            driver.execute_script("window.scrollTo(0, document.body.scrollHeight);")
            time.sleep(2)
            new_height = driver.execute_script("return document.body.scrollHeight")
            if new_height == last_height:
                break
            last_height = new_height
        
        # Scroll back to top to ensure all content is loaded
        driver.execute_script("window.scrollTo(0, 0);")
        time.sleep(2)
        
        # Try to trigger any lazy loading by scrolling through the page
        for i in range(0, 100, 10):
            driver.execute_script(f"window.scrollTo(0, document.body.scrollHeight * {i/100});")
            time.sleep(0.5)
        
        links = set()
        
        # Find all anchor tags
        anchor_elements = driver.find_elements(By.TAG_NAME, 'a')
        
        # Also look for links in other elements (buttons with onclick, etc.)
        try:
            # Look for buttons or divs with data-href or onclick navigation
            clickable_elements = driver.find_elements(By.CSS_SELECTOR, '[data-href], [onclick*="location"], [onclick*="window.open"]')
            for element in clickable_elements:
                data_href = element.get_attribute('data-href')
                onclick = element.get_attribute('onclick')
                if data_href:
                    links.add(urljoin(url, data_href))
                elif onclick and ('location' in onclick or 'window.open' in onclick):
                    # Extract URL from onclick
                    url_match = re.search(r'["\']([^"\']+)["\']', onclick)
                    if url_match:
                        links.add(urljoin(url, url_match.group(1)))
        except:
            pass
        
        # Look for JavaScript-generated URLs in page source
        try:
            page_source = driver.page_source
            # Look for URL patterns in JavaScript
            js_url_patterns = [
                r'["\']([^"\']*\/feature\/\d+)["\']',
                r'["\']([^"\']*\/product\/\d+)["\']',
                r'["\']([^"\']*\/blog\/[^"\']+)["\']',
                r'["\']([^"\']*\/service\/\d+)["\']',
                r'["\']([^"\']*\/portfolio\/\d+)["\']'
            ]
            
            for pattern in js_url_patterns:
                matches = re.findall(pattern, page_source)
                for match in matches:
                    if match.startswith('/') or match.startswith('http'):
                        links.add(urljoin(url, match))
        except:
            pass
        
        print(f"Found {len(anchor_elements)} anchor tags on {url}")
        
        for element in anchor_elements:
            try:
                href = element.get_attribute('href')
                if href and href.strip():
                    # Convert relative URLs to absolute URLs
                    absolute_url = urljoin(url, href)
                    links.add(absolute_url)
            except:
                continue
        
        return links
        
    except WebDriverException as e:
        print(f"Error loading page {url}: {e}")
        return set()


def normalize_url(url):
    """Normalize URL by removing fragments and query parameters for crawling purposes"""
    parsed = urlparse(url)
    # Remove fragment and query for crawling (but keep them in the final list)
    normalized = urlunparse((parsed.scheme, parsed.netloc, parsed.path, '', '', ''))
    return normalized


def is_same_domain(url, base_domain):
    """Check if URL belongs to the same domain"""
    return urlparse(url).netloc == base_domain


def should_crawl_url(url, base_domain):
    """Determine if we should crawl this URL"""
    parsed = urlparse(url)
    
    # Skip if not same domain
    if parsed.netloc != base_domain:
        return False
    
    # Skip common file extensions that aren't web pages
    skip_extensions = {'.pdf', '.jpg', '.jpeg', '.png', '.gif', '.svg', '.ico', 
                      '.css', '.js', '.zip', '.doc', '.docx', '.xls', '.xlsx'}
    
    if any(parsed.path.lower().endswith(ext) for ext in skip_extensions):
        return False
    
    # Skip mailto, tel, javascript links
    if parsed.scheme in {'mailto', 'tel', 'javascript'}:
        return False
    
    return True


def crawl_entire_website(start_url, max_pages=100):
    """Crawl the entire website starting from start_url"""
    
    # Try to setup Chrome/Chromium driver with fallback options
    driver = None
    
    # Try different Chrome/Chromium paths
    chrome_paths = [
        '/usr/bin/google-chrome',
        '/usr/bin/chromium-browser',
        '/usr/bin/chromium',
        '/snap/bin/chromium'
    ]
    
    for chrome_path in chrome_paths:
        try:
            options = webdriver.ChromeOptions()
            options.add_argument('--headless')  # Run without opening browser
            options.add_argument('--no-sandbox')
            options.add_argument('--disable-dev-shm-usage')
            options.add_argument('--disable-gpu')
            options.add_argument('--window-size=1920,1080')
            options.add_argument('user-agent=Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36')
            
            # Try to set the binary location
            import os
            if os.path.exists(chrome_path):
                options.binary_location = chrome_path
            
            driver = webdriver.Chrome(options=options)
            print(f"Successfully initialized Chrome driver with binary: {chrome_path}")
            break
        except Exception as e:
            print(f"Failed to initialize Chrome with {chrome_path}: {e}")
            continue
    
    # If Chrome fails, try Firefox
    if driver is None:
        try:
            from selenium.webdriver.firefox.options import Options as FirefoxOptions
            firefox_options = FirefoxOptions()
            firefox_options.add_argument('--headless')
            driver = webdriver.Firefox(options=firefox_options)
            print("Successfully initialized Firefox driver")
        except Exception as e:
            print(f"Failed to initialize Firefox: {e}")
            raise Exception("Could not initialize any web driver. Please install Chrome, Chromium, or Firefox.")
    
    try:
        base_domain = urlparse(start_url).netloc
        
        # Track visited pages (normalized URLs to avoid duplicates)
        visited_pages = set()
        
        # All links found across the entire website
        all_links = set()
        
        # Pages successfully crawled
        crawled_pages = []
        
        print(f"Starting comprehensive crawl of website: {base_domain}")
        print(f"Maximum pages to crawl: {max_pages}")
        print("-" * 50)
        
        # Step 1: Parse sitemap.xml to get official page list
        sitemap_urls = parse_sitemap(start_url)
        
        # Step 2: Discover common pages that might not be in sitemap
        discovered_urls = discover_common_pages(start_url)
        
        # Step 3: Discover pattern-based URLs (like /feature/43)
        pattern_urls = discover_pattern_based_urls(start_url)
        
        # Step 4: Combine all discovered URLs with the start URL
        initial_urls = [start_url] + sitemap_urls + discovered_urls + pattern_urls
        
        # Remove duplicates and normalize
        unique_initial_urls = []
        seen_normalized = set()
        for url in initial_urls:
            normalized = normalize_url(url)
            if normalized not in seen_normalized:
                seen_normalized.add(normalized)
                unique_initial_urls.append(url)
        
        print(f"Initial page discovery:")
        print(f"  - Sitemap URLs: {len(sitemap_urls)}")
        print(f"  - Common page URLs: {len(discovered_urls)}")
        print(f"  - Pattern-based URLs: {len(pattern_urls)}")
        print(f"  - Total unique initial URLs: {len(unique_initial_urls)}")
        print("-" * 50)
        
        # Queue of pages to visit (start with discovered pages)
        pages_to_visit = deque(unique_initial_urls)
        
        while pages_to_visit and len(visited_pages) < max_pages:
            current_url = pages_to_visit.popleft()
            normalized_current = normalize_url(current_url)
            
            # Skip if already visited
            if normalized_current in visited_pages:
                continue
            
            print(f"Crawling page {len(visited_pages) + 1}: {current_url}")
            visited_pages.add(normalized_current)
            
            # Extract links from current page
            page_links = extract_links_from_page(driver, current_url)
            
            if page_links:
                crawled_pages.append(current_url)
                
                # Add all links to our master set
                all_links.update(page_links)
                
                # Add same-domain pages to crawl queue
                for link in page_links:
                    if should_crawl_url(link, base_domain):
                        normalized_link = normalize_url(link)
                        if normalized_link not in visited_pages:
                            pages_to_visit.append(link)
                
                print(f"  → Found {len(page_links)} links on this page")
                print(f"  → Total unique links so far: {len(all_links)}")
                print(f"  → Pages in queue: {len(pages_to_visit)}")
            else:
                print(f"  → No links found or page failed to load")
            
            print()
            
            # Small delay to be respectful to the server
            time.sleep(1)
        
        print("-" * 50)
        print(f"Crawling completed!")
        print(f"Pages successfully crawled: {len(crawled_pages)}")
        print(f"Total unique links found: {len(all_links)}")
        
        return {
            'all_links': list(all_links),
            'crawled_pages': crawled_pages,
            'base_domain': base_domain
        }
        
    finally:
        driver.quit()


def categorize_links(links, base_domain):
    """Categorize links into internal, external, and special types"""
    internal_links = []
    external_links = []
    email_links = []
    phone_links = []
    file_links = []
    
    for link in links:
        parsed = urlparse(link)
        
        if parsed.scheme == 'mailto':
            email_links.append(link)
        elif parsed.scheme == 'tel':
            phone_links.append(link)
        elif parsed.netloc == base_domain:
            internal_links.append(link)
        elif parsed.netloc and parsed.netloc != base_domain:
            external_links.append(link)
        else:
            # Check for file extensions
            file_extensions = {'.pdf', '.jpg', '.jpeg', '.png', '.gif', '.svg', 
                             '.css', '.js', '.zip', '.doc', '.docx', '.xls', '.xlsx'}
            if any(link.lower().endswith(ext) for ext in file_extensions):
                file_links.append(link)
            else:
                internal_links.append(link)
    
    return {
        'internal': sorted(set(internal_links)),
        'external': sorted(set(external_links)),
        'email': sorted(set(email_links)),
        'phone': sorted(set(phone_links)),
        'files': sorted(set(file_links))
    }


def save_results_to_file(results, filename='website_links.json'):
    """Save crawling results to a JSON file"""
    with open(filename, 'w', encoding='utf-8') as f:
        json.dump(results, f, indent=2, ensure_ascii=False)
    print(f"Results saved to {filename}")


def print_summary(results):
    """Print a nice summary of the crawling results"""
    all_links = results['all_links']
    base_domain = results['base_domain']
    
    # Categorize links
    categorized = categorize_links(all_links, base_domain)
    
    print("\n" + "="*60)
    print("WEBSITE CRAWLING SUMMARY")
    print("="*60)
    print(f"Base domain: {base_domain}")
    print(f"Pages crawled: {len(results['crawled_pages'])}")
    print(f"Total unique links found: {len(all_links)}")
    print()
    
    print("LINK BREAKDOWN:")
    print(f"  Internal links: {len(categorized['internal'])}")
    print(f"  External links: {len(categorized['external'])}")
    print(f"  Email links: {len(categorized['email'])}")
    print(f"  Phone links: {len(categorized['phone'])}")
    print(f"  File links: {len(categorized['files'])}")
    print()
    
    # Show crawled pages
    print("PAGES CRAWLED:")
    for i, page in enumerate(results['crawled_pages'], 1):
        print(f"  {i:2d}. {page}")
    print()
    
    # Show internal links
    if categorized['internal']:
        print("INTERNAL LINKS:")
        for link in categorized['internal']:
            print(f"  • {link}")
        print()
    
    # Show external links (limited to first 20)
    if categorized['external']:
        print("EXTERNAL LINKS:")
        for i, link in enumerate(categorized['external'][:20], 1):
            print(f"  • {link}")
        if len(categorized['external']) > 20:
            print(f"  ... and {len(categorized['external']) - 20} more external links")
        print()
    
    # Show email links
    if categorized['email']:
        print("EMAIL LINKS:")
        for link in categorized['email']:
            print(f"  • {link}")
        print()
    
    # Show phone links
    if categorized['phone']:
        print("PHONE LINKS:")
        for link in categorized['phone']:
            print(f"  • {link}")
        print()


if __name__ == "__main__":
    # Start crawling from the homepage for complete coverage
    start_url = "https://www.langchain.com/"
    max_pages = 50  # Adjust based on website size
    
    print("Starting website crawl...")
    print(f"Target website: {start_url}")
    print(f"Maximum pages to crawl: {max_pages}")
    print()
    
    # Crawl the entire website
    results = crawl_entire_website(start_url, max_pages)
    
    # Print summary
    print_summary(results)
    
    # Save results to file
    save_results_to_file(results, 'startsmartz_all_links.json')
    
    # Also save just the links as a simple text file
    with open('all_link_langchain.txt', 'w', encoding='utf-8') as f:
        f.write(f"All links found on {results['base_domain']}\n")
        f.write(f"Crawled on: {time.strftime('%Y-%m-%d %H:%M:%S')}\n")
        f.write(f"Total links: {len(results['all_links'])}\n")
        f.write("-" * 50 + "\n\n")
        
        for link in sorted(results['all_links']):
            f.write(f"{link}\n")
    
    # print("Links also saved to startsmartz_links.txt")