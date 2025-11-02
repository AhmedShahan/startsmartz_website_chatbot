import time
import json
import re
import os
import requests
import xml.etree.ElementTree as ET
from urllib.parse import urljoin, urlparse, urlunparse
from collections import deque
from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
from selenium.common.exceptions import WebDriverException, TimeoutException

# ===============  CONFIG  =====================
MAX_PAGES = 200
REQUEST_TIMEOUT = 10
CRAWL_DELAY = 1.0
# =============================================


def normalize_url(url):
    parsed = urlparse(url)
    return urlunparse((parsed.scheme, parsed.netloc, parsed.path.rstrip('/'), '', '', ''))


def is_live_page(url):
    """Check if a URL is live and not a 404 or redirect to an error page."""
    try:
        r = requests.get(url, timeout=REQUEST_TIMEOUT, allow_redirects=True)
        if r.status_code not in range(200, 300):
            return False
        if re.search(r'(404|not\s*found|error)', r.text, re.IGNORECASE):
            return False
        return True
    except:
        return False


def parse_sitemap(base_url):
    """Parse sitemap.xml recursively"""
    urls = []
    sitemap_url = urljoin(base_url, '/sitemap.xml')
    try:
        resp = requests.get(sitemap_url, timeout=10)
        if resp.status_code != 200:
            return []
        root = ET.fromstring(resp.content)
        for loc in root.findall('.//{*}loc'):
            loc_url = loc.text.strip()
            if loc_url.startswith('http'):
                urls.append(loc_url)
    except Exception:
        pass
    return urls


def discover_common_pages(base_url):
    """Check for standard endpoints like /about, /contact, etc."""
    paths = [
        '/about', '/contact', '/services', '/products', '/portfolio', '/team',
        '/blog', '/careers', '/privacy', '/terms', '/faq', '/help'
    ]
    valid_urls = []
    for p in paths:
        full = urljoin(base_url, p)
        if is_live_page(full):
            valid_urls.append(full)
    return valid_urls


def init_driver():
    """Try to initialize Chrome or Firefox automatically."""
    options = webdriver.ChromeOptions()
    options.add_argument('--headless')
    options.add_argument('--no-sandbox')
    options.add_argument('--disable-dev-shm-usage')
    options.add_argument('--window-size=1920,1080')
    options.add_argument('--disable-gpu')
    for path in [
        '/usr/bin/google-chrome', '/usr/bin/chromium-browser', '/usr/bin/chromium', '/snap/bin/chromium'
    ]:
        if os.path.exists(path):
            options.binary_location = path
    try:
        driver = webdriver.Chrome(options=options)
        return driver
    except:
        from selenium.webdriver.firefox.options import Options as FFOptions
        ff = FFOptions()
        ff.add_argument('--headless')
        return webdriver.Firefox(options=ff)


def extract_links(driver, url):
    """Extract visible and JS-based links dynamically."""
    links = set()
    try:
        driver.get(url)
        try:
            WebDriverWait(driver, 10).until(
                EC.presence_of_element_located((By.TAG_NAME, 'a'))
            )
        except TimeoutException:
            pass

        # Scroll to load lazy elements
        for _ in range(3):
            driver.execute_script("window.scrollTo(0, document.body.scrollHeight);")
            time.sleep(1)

        anchors = driver.find_elements(By.TAG_NAME, 'a')
        for a in anchors:
            href = a.get_attribute('href')
            if href and href.startswith(('http', '/')):
                links.add(urljoin(url, href))

        # Extract JS-defined URLs
        html = driver.page_source
        for m in re.findall(r'["\'](https?://[^\s"\']+)["\']', html):
            links.add(m)
    except WebDriverException:
        pass
    return links


def crawl_entire_website(start_url, max_pages=MAX_PAGES):
    driver = init_driver()
    base_domain = urlparse(start_url).netloc
    visited = set()
    all_links = set()
    to_visit = deque()

    sitemap_urls = parse_sitemap(start_url)
    common_urls = discover_common_pages(start_url)
    seeds = [start_url] + sitemap_urls + common_urls
    for u in seeds:
        n = normalize_url(u)
        if n not in visited:
            visited.add(n)
            to_visit.append(u)

    crawled = []

    print(f"Starting crawl on {base_domain} | Max pages: {max_pages}")
    print("-" * 60)

    while to_visit and len(crawled) < max_pages:
        url = to_visit.popleft()
        if not is_live_page(url):
            continue

        print(f"[{len(crawled)+1}] Crawling: {url}")
        links = extract_links(driver, url)
        crawled.append(url)
        for link in links:
            parsed = urlparse(link)
            if parsed.netloc == base_domain:
                n = normalize_url(link)
                if n not in visited:
                    visited.add(n)
                    to_visit.append(link)
                    all_links.add(link)
        time.sleep(CRAWL_DELAY)

    driver.quit()

    return {
        'base_domain': base_domain,
        'crawled_pages': crawled,
        'all_links': list(all_links)
    }


def save_results(results, filename='website_links.json'):
    with open(filename, 'w', encoding='utf-8') as f:
        json.dump(results, f, indent=2)
    print(f"Results saved → {filename}")


if __name__ == "__main__":
    start_url = "https://startsmartz.net/"
    results = crawl_entire_website(start_url)
    save_results(results)
    print("\nCrawled pages:")
    for p in results['crawled_pages']:
        print(" •", p)
