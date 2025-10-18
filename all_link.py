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
from requests.exceptions import RequestException, Timeout, ConnectionError
import xml.etree.ElementTree as ET
import re


def parse_sitemap(base_url, visited_sitemaps=None, max_depth=5, current_depth=0):
    """Parse sitemap.xml to get all listed pages"""
    if visited_sitemaps is None:
        visited_sitemaps = set()
    
    # Safety check: prevent too deep recursion
    if current_depth >= max_depth:
        print(f"Maximum sitemap depth ({max_depth}) reached, stopping recursion")
        return []
    
    sitemap_urls = []
    
    # Handle both direct sitemap URL and base URL
    if base_url.endswith('.xml'):
        sitemap_url = base_url
    else:
        sitemap_url = urljoin(base_url, '/sitemap.xml')
    
    # Normalize the sitemap URL
    normalized_sitemap = sitemap_url.strip().lower()
    
    # Check if we've already visited this sitemap
    if normalized_sitemap in visited_sitemaps:
        return []
    
    # Mark this sitemap as visited
    visited_sitemaps.add(normalized_sitemap)
    
    try:
        print(f"Checking sitemap (depth {current_depth}): {sitemap_url}")
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
                    sub_sitemap_url = sitemap_elem.text.strip()
                    normalized_sub = sub_sitemap_url.lower()
                    
                    # Only recurse if we haven't visited this sitemap
                    if normalized_sub not in visited_sitemaps:
                        # Recursively parse sub-sitemaps, passing the visited set
                        sub_urls = parse_sitemap(
                            sub_sitemap_url, 
                            visited_sitemaps, 
                            max_depth, 
                            current_depth + 1
                        )
                        sitemap_urls.extend(sub_urls)
            
            print(f"Found {len(sitemap_urls)} URLs in sitemap")
            return sitemap_urls
    except Exception as e:
        print(f"Could not parse sitemap: {e}")
    
    return []


def discover_pattern_based_urls(base_url):
    """Discover URLs based on common patterns - OPTIMIZED VERSION"""
    base_domain = urlparse(base_url).netloc
    discovered_pages = []
    
    print("Discovering pattern-based URLs (testing limited patterns)...")
    
    # Reduced patterns - only test the most common ones
    patterns = [
        '/feature/{id}',
        '/product/{id}',
        '/service/{id}',
        '/blog/{id}',
        '/post/{id}'
    ]
    
    # Much smaller ID range for faster testing
    test_ids = [1, 2, 3, 5, 10]  # Just test a few specific IDs
    
    for pattern in patterns:
        for test_id in test_ids:
            test_url = urljoin(base_url, pattern.format(id=test_id))
            try:
                response = requests.head(test_url, timeout=2, allow_redirects=True)
                if response.status_code == 200:
                    if urlparse(response.url).netloc == base_domain:
                        discovered_pages.append(response.url)
                        print(f"  ✓ Found: {response.url}")
            except (Timeout, ConnectionError, RequestException):
                continue  # Skip timeouts and errors
    
    print(f"Pattern discovery completed. Found {len(discovered_pages)} URLs.")
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
            response = requests.head(test_url, timeout=3, allow_redirects=True)
            if response.status_code == 200:
                # Verify it's the same domain after redirects
                if urlparse(response.url).netloc == base_domain:
                    discovered_pages.append(response.url)
                    print(f"  ✓ Found: {response.url}")
        except (Timeout, ConnectionError, RequestException):
            continue  # Skip timeouts and errors
    
    return discovered_pages


def extract_links_from_page(driver, url, max_retries=3):
    """Extract all links from a single page with retry logic"""
    
    for attempt in range(max_retries):
        try:
            # Set page load timeout to 30 seconds
            driver.set_page_load_timeout(30)
            
            # Try to load the page
            driver.get(url)
            
            # Wait for body to be present (basic check that page loaded)
            try:
                WebDriverWait(driver, 10).until(
                    EC.presence_of_element_located((By.TAG_NAME, "body"))
                )
            except TimeoutException:
                print(f"  ⚠ Body element not found, but continuing...")
            
            # Wait for React to render
            time.sleep(3)  # Reduced from 5 seconds
            
            # Simplified scrolling - just scroll to bottom once
            try:
                driver.execute_script("window.scrollTo(0, document.body.scrollHeight);")
                time.sleep(1)
                driver.execute_script("window.scrollTo(0, 0);")
                time.sleep(1)
            except:
                pass
            
            links = set()
            
            # Find all anchor tags
            anchor_elements = driver.find_elements(By.TAG_NAME, 'a')
            
            # Also look for links in other elements (buttons with onclick, etc.)
            try:
                clickable_elements = driver.find_elements(By.CSS_SELECTOR, '[data-href], [onclick*="location"], [onclick*="window.open"]')
                for element in clickable_elements:
                    data_href = element.get_attribute('data-href')
                    onclick = element.get_attribute('onclick')
                    if data_href:
                        links.add(urljoin(url, data_href))
                    elif onclick and ('location' in onclick or 'window.open' in onclick):
                        url_match = re.search(r'["\']([^"\']+)["\']', onclick)
                        if url_match:
                            links.add(urljoin(url, url_match.group(1)))
            except:
                pass
            
            # Look for JavaScript-generated URLs in page source
            try:
                page_source = driver.page_source
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
                        absolute_url = urljoin(url, href)
                        links.add(absolute_url)
                except:
                    continue
            
            return links
            
        except TimeoutException as e:
            print(f"  ⚠ Timeout on attempt {attempt + 1}/{max_retries} for {url}")
            if attempt < max_retries - 1:
                # Try to stop loading the page
                try:
                    driver.execute_script("window.stop();")
                except:
                    pass
                time.sleep(2)
                continue
            else:
                print(f"  ✗ Failed to load {url} after {max_retries} attempts")
                return set()
                
        except WebDriverException as e:
            print(f"  ✗ WebDriver error on attempt {attempt + 1}/{max_retries}: {str(e)[:100]}")
            if attempt < max_retries - 1:
                time.sleep(2)
                continue
            else:
                print(f"  ✗ Giving up on {url}")
                return set()
        
        except Exception as e:
            print(f"  ✗ Unexpected error: {str(e)[:100]}")
            return set()
    
    return set()


def normalize_url(url):
    """Normalize URL by removing fragments and query parameters for crawling purposes"""
    parsed = urlparse(url)
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
            options.add_argument('--headless')
            options.add_argument('--no-sandbox')
            options.add_argument('--disable-dev-shm-usage')
            options.add_argument('--disable-gpu')
            options.add_argument('--window-size=1920,1080')
            options.add_argument('--disable-blink-features=AutomationControlled')
            options.add_argument('user-agent=Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36')
            
            # Try to set the binary location
            import os
            if os.path.exists(chrome_path):
                options.binary_location = chrome_path
            
            driver = webdriver.Chrome(options=options)
            
            # Set timeouts for the driver
            driver.set_page_load_timeout(30)  # 30 seconds max for page load
            driver.set_script_timeout(30)  # 30 seconds max for scripts
            
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
            driver.set_page_load_timeout(30)
            driver.set_script_timeout(30)
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
        
        # Failed pages
        failed_pages = []
        
        print(f"Starting comprehensive crawl of website: {base_domain}")
        print(f"Maximum pages to crawl: {max_pages}")
        print("-" * 50)
        
        # Step 1: Parse sitemap.xml to get official page list
        sitemap_urls = parse_sitemap(start_url)
        
        # Step 2: Discover common pages that might not be in sitemap
        discovered_urls = discover_common_pages(start_url)
        
        # Step 3: Discover pattern-based URLs (limited testing)
        print("\nNote: Pattern-based discovery is limited to avoid hanging.")
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
        
        print(f"\nInitial page discovery:")
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
            
            print(f"Crawling page {len(visited_pages) + 1}/{max_pages}: {current_url}")
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
                failed_pages.append(current_url)
            
            print()
            
            # Small delay to be respectful to the server
            time.sleep(0.5)
        
        # Log remaining pages in queue
        if pages_to_visit:
            print(f"\n⚠ Stopped crawling at max_pages limit ({max_pages})")
            print(f"⚠ Remaining pages in queue: {len(pages_to_visit)}")
            print(f"⚠ To crawl all pages, increase max_pages parameter")
        
        print("-" * 50)
        print(f"Crawling completed!")
        print(f"Pages successfully crawled: {len(crawled_pages)}")
        print(f"Pages failed: {len(failed_pages)}")
        print(f"Total unique links found: {len(all_links)}")
        
        return {
            'all_links': list(all_links),
            'crawled_pages': crawled_pages,
            'failed_pages': failed_pages,
            'base_domain': base_domain,
            'remaining_queue_size': len(pages_to_visit)
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
    print(f"Pages failed: {len(results.get('failed_pages', []))}")
    print(f"Remaining in queue: {results.get('remaining_queue_size', 0)}")
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
    start_url = "https://selisegroup.com/"
    
    # IMPORTANT: Increase max_pages to crawl all 787+ pages in queue
    # Start with a reasonable number, then increase if needed
    max_pages = 200  # Increased from 50 to handle the large queue
    
    print("Starting website crawl...")
    print(f"Target website: {start_url}")
    print(f"Maximum pages to crawl: {max_pages}")
    print()
    
    # Crawl the entire website
    results = crawl_entire_website(start_url, max_pages)
    
    # Print summary
    print_summary(results)
    
    # Save results to file
    save_results_to_file(results, 'selisegroup_all_links.json')
    
    # Also save just the links as a simple text file
    with open('all_link_langchain.txt', 'w', encoding='utf-8') as f:
        f.write(f"All links found on {results['base_domain']}\n")
        f.write(f"Crawled on: {time.strftime('%Y-%m-%d %H:%M:%S')}\n")
        f.write(f"Total links: {len(results['all_links'])}\n")
        f.write(f"Pages crawled: {len(results['crawled_pages'])}\n")
        f.write(f"Pages failed: {len(results.get('failed_pages', []))}\n")
        f.write("-" * 50 + "\n\n")
        
        for link in sorted(results['all_links']):
            f.write(f"{link}\n")
    
    print("Links also saved to all_link_selise.txt")
