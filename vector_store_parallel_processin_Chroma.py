import json
import re
from concurrent.futures import ThreadPoolExecutor, as_completed
from langchain_community.document_loaders import WebBaseLoader
from langchain.text_splitter import RecursiveCharacterTextSplitter
from sentence_transformers import SentenceTransformer
from dotenv import load_dotenv
import os
from tqdm import tqdm
import numpy as np
import chromadb
from chromadb.config import Settings
import time

load_dotenv()

# ============================================================================
# CONFIGURATION
# ============================================================================
JSON_FILE = "/home/shahanahmed/startsmartz_website_chatbot/vivasoft_crawl_results.json"
COLLECTION_NAME = "vivasoft_docs"
CHUNK_SIZE = 3000
CHUNK_OVERLAP = 300
EMBEDDING_BATCH_SIZE = 128
MAX_WORKERS = 20
CHROMA_PERSIST_DIR = "./chroma_db"
UPLOAD_BATCH_SIZE = 100  # smaller batches = faster & safer writes

# ============================================================================
# KEYWORD FILTERING CONFIGURATION
# ============================================================================
# Set to True to enable filtering, False to process all URLs
ENABLE_KEYWORD_FILTER = True

# Keywords to filter URLs (case-insensitive)
# URLs containing ANY of these keywords will be INCLUDED
INCLUDE_KEYWORDS = [
    "vivasoftltd",
]

# Optional: Keywords to exclude (URLs containing these will be EXCLUDED)
EXCLUDE_KEYWORDS = [
    # Add any keywords you want to exclude, e.g.:
    # "blog",
    # "news",
]

# ============================================================================
# FILTERING FUNCTION
# ============================================================================
def should_process_url(url, include_keywords, exclude_keywords):
    """
    Determine if a URL should be processed based on keyword filters.
    
    Args:
        url: The URL to check
        include_keywords: List of keywords - URL must contain at least one
        exclude_keywords: List of keywords - URL must not contain any
    
    Returns:
        Boolean indicating whether to process the URL
    """
    url_lower = url.lower()
    
    # Check exclusion keywords first (if any)
    if exclude_keywords:
        for keyword in exclude_keywords:
            if keyword.lower() in url_lower:
                return False
    
    # Check inclusion keywords
    if include_keywords:
        for keyword in include_keywords:
            if keyword.lower() in url_lower:
                return True
        return False  # No matching include keyword found
    
    return True  # No filters, include all

# ============================================================================
# LOAD DATA
# ============================================================================
print("Loading URLs...")
with open(JSON_FILE, "r") as file:
    data = json.load(file)

all_pages = list(
    set(data['all_links']) |
    set(data['failed_pages']) |
    set(data['categorized_links']['internal']) |
    set(data['categorized_links']['external'])
)

print(f"Total URLs found: {len(all_pages)}")

# Apply keyword filtering
if ENABLE_KEYWORD_FILTER:
    print(f"\n{'='*70}")
    print("APPLYING KEYWORD FILTERS")
    print(f"{'='*70}")
    print(f"Include keywords: {INCLUDE_KEYWORDS}")
    if EXCLUDE_KEYWORDS:
        print(f"Exclude keywords: {EXCLUDE_KEYWORDS}")
    
    filtered_pages = [
        url for url in all_pages 
        if should_process_url(url, INCLUDE_KEYWORDS, EXCLUDE_KEYWORDS)
    ]
    
    print(f"\n✅ Filtered: {len(all_pages)} → {len(filtered_pages)} URLs")
    print(f"   Excluded: {len(all_pages) - len(filtered_pages)} URLs")
    
    # Show some examples of filtered URLs
    if filtered_pages:
        print(f"\nSample of filtered URLs (showing up to 5):")
        for url in filtered_pages[:5]:
            print(f"  ✓ {url}")
    
    all_pages = filtered_pages
else:
    print("⚠️  Keyword filtering is DISABLED - processing all URLs")

if not all_pages:
    print("\n❌ No URLs to process after filtering. Exiting.")
    exit(0)

print(f"\nTotal URLs to process: {len(all_pages)}")

# ============================================================================
# SETUP
# ============================================================================
splitter = RecursiveCharacterTextSplitter(chunk_size=CHUNK_SIZE, chunk_overlap=CHUNK_OVERLAP)
model = SentenceTransformer("all-MiniLM-L6-v2")

def clean_text(text):
    text = re.sub(r'[\n\t\r]+', ' ', text)
    text = re.sub(r'\s{2,}', ' ', text)
    return text.strip()

# ============================================================================
# PHASE 1: PARALLEL SCRAPING
# ============================================================================
def load_and_chunk_url(url):
    try:
        loader = WebBaseLoader(url)
        docs = loader.load()
        splits = splitter.split_documents(docs)

        chunks = []
        for i, chunk in enumerate(splits):
            cleaned_content = clean_text(chunk.page_content)
            chunks.append({
                "url": url,
                "chunk_id": i,
                "content": cleaned_content
            })
        return {"success": True, "url": url, "chunks": chunks}
    except Exception as e:
        return {"success": False, "url": url, "error": str(e)}

print(f"\n{'='*70}")
print("PHASE 1: Parallel Web Scraping")
print(f"{'='*70}")

all_data = []
failed_urls = []

with ThreadPoolExecutor(max_workers=MAX_WORKERS) as executor:
    future_to_url = {executor.submit(load_and_chunk_url, url): url for url in all_pages}
    with tqdm(total=len(all_pages), desc="Scraping pages") as pbar:
        for future in as_completed(future_to_url):
            result = future.result()
            if result["success"]:
                all_data.extend(result["chunks"])
                print(f"✅ {result['url']} ({len(result['chunks'])} chunks)")
            else:
                failed_urls.append(result["url"])
                print(f"❌ {result['url']}: {result['error'][:80]}")
            pbar.update(1)

print(f"\n✅ Scraping complete!")
print(f"   Total chunks: {len(all_data)}")
print(f"   Failed URLs: {len(failed_urls)}")

# ============================================================================
# PHASE 2: EMBEDDING GENERATION
# ============================================================================
print(f"\n{'='*70}")
print("PHASE 2: Batch Embedding Generation")
print(f"{'='*70}")

texts = [d["content"] for d in all_data]
indexed_texts = [(i, text) for i, text in enumerate(texts)]
indexed_texts.sort(key=lambda x: len(x[1].split()))

sorted_texts = [text for _, text in indexed_texts]
original_indices = [i for i, _ in indexed_texts]

print(f"Generating embeddings for {len(sorted_texts)} chunks...")

embeddings = model.encode(
    sorted_texts,
    batch_size=EMBEDDING_BATCH_SIZE,
    show_progress_bar=True,
    convert_to_numpy=True,
    normalize_embeddings=True
)

# Restore order
embeddings_ordered = np.empty_like(embeddings)
for new_idx, orig_idx in enumerate(original_indices):
    embeddings_ordered[orig_idx] = embeddings[new_idx]

print("✅ Embedding complete!")

# ============================================================================
# PHASE 3: CHROMADB STORAGE (Optimized)
# ============================================================================
print(f"\n{'='*70}")
print("PHASE 3: Storing in ChromaDB")
print(f"{'='*70}")

client = chromadb.PersistentClient(path=CHROMA_PERSIST_DIR)

# Safe delete old collection
try:
    client.delete_collection(name=COLLECTION_NAME)
    print(f"Deleted existing collection: {COLLECTION_NAME}")
except Exception:
    pass

collection = client.create_collection(
    name=COLLECTION_NAME,
    metadata={"description": "Vivasoft website content with full text"}
)

print("Preparing documents for ChromaDB...")

ids, documents, metadatas, embeddings_list = [], [], [], []

for i, (item, emb) in enumerate(tqdm(zip(all_data, embeddings_ordered),
                                     total=len(all_data),
                                     desc="Preparing docs")):
    ids.append(f"{item['url']}_{item['chunk_id']}")
    documents.append(item['content'])
    metadatas.append({
        "url": item['url'],
        "chunk_id": item['chunk_id'],
        "content_length": len(item['content'])
    })
    embeddings_list.append(emb.tolist())

# Upload in smaller, safer batches
print(f"\nUploading {len(ids)} documents in batches of {UPLOAD_BATCH_SIZE}...")
for i in tqdm(range(0, len(ids), UPLOAD_BATCH_SIZE), desc="Uploading to ChromaDB"):
    batch_ids = ids[i:i + UPLOAD_BATCH_SIZE]
    batch_docs = documents[i:i + UPLOAD_BATCH_SIZE]
    batch_meta = metadatas[i:i + UPLOAD_BATCH_SIZE]
    batch_embs = embeddings_list[i:i + UPLOAD_BATCH_SIZE]

    try:
        collection.add(
            ids=batch_ids,
            documents=batch_docs,
            metadatas=batch_meta,
            embeddings=batch_embs
        )
        print(f"✅ Uploaded batch {i // UPLOAD_BATCH_SIZE + 1}/{(len(ids) // UPLOAD_BATCH_SIZE) + 1}")
    except Exception as e:
        print(f"⚠️ Failed batch {i // UPLOAD_BATCH_SIZE + 1}: {str(e)[:100]}")
    time.sleep(0.2)  # prevent disk I/O lock

# ============================================================================
# FINAL SUMMARY
# ============================================================================
print(f"\n{'='*70}")
print("✅ PROCESSING COMPLETE!")
print(f"{'='*70}")
print(f"Total pages processed: {len(all_pages) - len(failed_urls)}/{len(all_pages)}")
print(f"Total chunks created: {len(all_data)}")
print(f"Documents stored in ChromaDB: {collection.count()}")
print(f"ChromaDB directory: {CHROMA_PERSIST_DIR}")
print(f"Failed URLs: {len(failed_urls)}")

if failed_urls:
    print("\nFailed URLs (showing up to 10):")
    for url in failed_urls[:10]:
        print(f"  - {url}")
    if len(failed_urls) > 10:
        print(f"  ... and {len(failed_urls) - 10} more")