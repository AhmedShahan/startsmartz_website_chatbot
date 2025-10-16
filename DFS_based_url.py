import time
import requests
from urllib.parse import urljoin, urldefrag, urlparse
from urllib.robotparser import RobotFileParser
from bs4 import BeautifulSoup

def normalize_url(base, href):
    if not href:
        return None
    abs_url = urljoin(base, href)
    # Remove fragment (#...) to avoid duplicates
    abs_url, _ = urldefrag(abs_url)
    return abs_url

def same_origin(u1, u2):
    p1, p2 = urlparse(u1), urlparse(u2)
    return (p1.scheme, p1.netloc) == (p2.scheme, p2.netloc)

def load_robots(start_url, user_agent="MyDFSCrawler/1.0"):
    parsed = urlparse(start_url)
    robots_url = f"{parsed.scheme}://{parsed.netloc}/robots.txt"
    rp = RobotFileParser()
    try:
        rp.set_url(robots_url)
        rp.read()
    except Exception:
        # If robots can't be fetched, be conservative or proceed per your policy
        pass
    return rp

def dfs_crawl(start_url, max_depth=3, user_agent="MyDFSCrawler/1.0", delay=0.5, timeout=15):
    headers = {"User-Agent": user_agent}
    robots = load_robots(start_url, user_agent=user_agent)
    start_origin = f"{urlparse(start_url).scheme}://{urlparse(start_url).netloc}"

    visited = set()
    stack = [(start_url, 0)]
    all_internal_links = set()

    while stack:
        url, depth = stack.pop()
        if url in visited:
            continue
        visited.add(url)

        # Respect robots.txt
        try:
            if hasattr(robots, "can_fetch") and not robots.can_fetch(user_agent, url):
                continue
        except Exception:
            # If robots parsing fails, skip or proceed per your policy
            continue

        try:
            resp = requests.get(url, headers=headers, timeout=timeout)
            # Only parse HTML content
            ctype = resp.headers.get("Content-Type", "")
            if "text/html" not in ctype:
                continue
        except requests.RequestException:
            continue

        soup = BeautifulSoup(resp.text, "html.parser")
        # Optionally honor canonical URL to reduce duplicates
        canonical_tag = soup.find("link", rel="canonical")
        if canonical_tag and canonical_tag.get("href"):
            canon = normalize_url(url, canonical_tag["href"])
            if canon and same_origin(start_url, canon):
                url = canon  # treat canonical as the page identity

        # Extract and process links
        page_links = []
        for a in soup.find_all("a", href=True):
            href = a.get("href")
            abs_url = normalize_url(url, href)
            if not abs_url:
                continue
            if not same_origin(start_url, abs_url):
                continue
            all_internal_links.add(abs_url)
            if abs_url not in visited and depth < max_depth:
                page_links.append(abs_url)

        # DFS: push children onto stack
        for child in reversed(page_links):
            stack.append((child, depth + 1))

        # Be polite
        time.sleep(delay)

    # Always include the start page
    all_internal_links.add(start_url)
    return sorted(all_internal_links)

if __name__ == "__main__":
    start = "https://www.langchain.com/"
    links = dfs_crawl(start, max_depth=4, user_agent="MyDFSCrawler/1.0", delay=0.3)
    print(len(links))
    for l in links:
        print(l)
    
    with open ("all_link.txt", "w") as file:
        file.write(str(links))
        file.close()
