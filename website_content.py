import json
import re
from playwright.sync_api import sync_playwright
from bs4 import BeautifulSoup
import time
from urllib.parse import urlparse

# Load URLs from JSON
json_path = "/home/shahanahmed/startsmartz_website_chatbot/website_links.json"
with open(json_path, "r") as file:
    data = json.load(file)

def is_valid_url(url):
    """Filter out images and assets"""
    parsed = urlparse(url)
    excluded = ('.png', '.jpg', '.jpeg', '.gif', '.svg', '.ico', '.css', '.js', '.woff', '.pdf')
    return not parsed.path.lower().endswith(excluded)

# Get all valid URLs
all_pages = list(set(
    url for url in (data.get('crawled_pages', []) + data.get('all_links', [])) 
    if is_valid_url(url)
))

print(f"📚 Total URLs to process: {len(all_pages)}")

def extract_full_content(page, url):
    """Extract ALL content from URL"""
    try:
        # Navigate to URL
        page.goto(url, wait_until="networkidle", timeout=30000)
        
        # Wait for content to load
        page.wait_for_timeout(2000)
        
        # Scroll to load lazy content
        page.evaluate("window.scrollTo(0, document.body.scrollHeight)")
        page.wait_for_timeout(1000)
        page.evaluate("window.scrollTo(0, 0)")
        page.wait_for_timeout(500)
        
        # Get page content
        html_content = page.content()
        
        # Parse with BeautifulSoup
        soup = BeautifulSoup(html_content, 'html.parser')
        
        # Remove unwanted elements
        for element in soup(['script', 'style', 'nav', 'footer', 'header', 'aside', 'iframe']):
            element.decompose()
        
        # Extract text from HTML
        html_text = soup.get_text(separator=' ', strip=True)
        
        # Get JavaScript rendered text
        js_text = page.evaluate("document.body.innerText || document.body.textContent")
        
        # Get title and meta
        title = page.title()
        meta_desc = page.evaluate("""
            () => {
                const meta = document.querySelector('meta[name="description"]');
                return meta ? meta.content : '';
            }
        """)
        
        # Get all visible text using advanced selector
        all_text = page.evaluate("""
            () => {
                const elements = document.querySelectorAll('p, h1, h2, h3, h4, h5, h6, li, td, th, span, div, a, button, label');
                return Array.from(elements)
                    .map(el => el.innerText || el.textContent)
                    .filter(text => text && text.trim().length > 0)
                    .join(' ');
            }
        """)
        
        # Take screenshot and OCR (optional, requires pytesseract)
        ocr_text = ""
        try:
            import pytesseract
            from PIL import Image
            import io
            
            screenshot = page.screenshot(full_page=True)
            image = Image.open(io.BytesIO(screenshot))
            ocr_text = pytesseract.image_to_string(image, lang='eng')
        except:
            pass  # Skip OCR if not available
        
        # Combine all content
        full_content = f"{title}\n\n{meta_desc}\n\n{html_text}\n\n{js_text}\n\n{all_text}\n\n{ocr_text}"
        
        return full_content
        
    except Exception as e:
        print(f"  ❌ Error: {e}")
        return ""

def clean_text(text):
    """Basic cleaning"""
    text = re.sub(r'[\n\t\r]+', ' ', text)
    text = re.sub(r'\s{2,}', ' ', text)
    return text.strip()

# Extract all content
all_documents = []

print(f"\n🔄 Extracting content from {len(all_pages)} URLs...\n")

with sync_playwright() as p:
    # Launch browser
    browser = p.chromium.launch(headless=True)
    context = browser.new_context(
        viewport={'width': 1920, 'height': 1080},
        user_agent='Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36'
    )
    page = context.new_page()
    
    for idx, url in enumerate(all_pages, 1):
        try:
            print(f"[{idx}/{len(all_pages)}] {url}")
            
            # Extract full content
            content = extract_full_content(page, url)
            
            if not content or len(content.strip()) < 100:
                print(f"  ⚠️ No content extracted")
                continue
            
            # Clean content
            cleaned_content = clean_text(content)
            
            all_documents.append({
                "url": url,
                "content": cleaned_content
            })
            
            print(f"  ✅ Extracted {len(cleaned_content)} characters")
            
            time.sleep(1)
            
        except Exception as e:
            print(f"  ❌ Error: {e}")
    
    browser.close()

print(f"\n📊 Total pages extracted: {len(all_documents)}")

# Save to JSON
output_path = "extracted_content.json"
with open(output_path, "w", encoding="utf-8") as f:
    json.dump(all_documents, f, indent=2, ensure_ascii=False)

print(f"\n✅ Saved all content to {output_path}")

# # Show sample
# if all_documents:
#     print(f"\n📝 Sample from first page:")
#     print(f"  URL: {all_documents[0]['url']}")
#     print(f"  Content length: {len(all_documents[0]['content'])} characters")
#     print(f"  Preview: {all_documents[0]['content'][:500]}...")
# else:
#     print("\n⚠️ No content was extracted. Check your URLs and internet connection.")

