import requests
from bs4 import BeautifulSoup
from urllib.parse import urljoin

def extract_links(url):
    headers = {'User-Agent': 'Mozilla/5.0'}
    response = requests.get(url, headers=headers)
    response.raise_for_status()

    soup = BeautifulSoup(response.text, 'html.parser')
    # print("Fetched HTML:")
    # print(soup.prettify())  # Debug line

    links = set()
    for a_tag in soup.find_all('a', href=True):
        full_url = urljoin(url, a_tag['href'])
        links.add(full_url)

    return links


if __name__ == "__main__":
    url = "https://docs.langchain.com/oss/python/langchain/overview"
    all_links = extract_links(url)

    print("\nExtracted Links:")
    for link in all_links:
        print(link)