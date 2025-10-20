import json
import re
import asyncio
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
CHROMA_PERSIST_DIR = "./chroma_db"  # Where to save ChromaDB

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

print(f"Total URLs to process: {len(all_pages)}")

# ============================================================================
# SETUP
# ============================================================================
splitter = RecursiveCharacterTextSplitter(chunk_size=CHUNK_SIZE, chunk_overlap=CHUNK_OVERLAP)
model = SentenceTransformer("all-MiniLM-L6-v2")

def clean_text(text):
    """Clean and normalize text"""
    text = re.sub(r'[\n\t\r]+', ' ', text)
    text = re.sub(r'\s{2,}', ' ', text)
    return text.strip()

# ============================================================================
# PARALLEL WEB SCRAPING
# ============================================================================
def load_and_chunk_url(url):
    """Load single URL and return chunks (runs in thread)"""
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

# Use ThreadPoolExecutor for parallel I/O-bound web scraping
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
                print(f"❌ {result['url']}: {result['error'][:50]}")
            
            pbar.update(1)

print(f"\n✅ Scraping complete!")
print(f"   Total chunks: {len(all_data)}")
print(f"   Failed URLs: {len(failed_urls)}")

# ============================================================================
# OPTIMIZED BATCH EMBEDDING
# ============================================================================
print(f"\n{'='*70}")
print("PHASE 2: Batch Embedding Generation")
print(f"{'='*70}")

# Sort by length for efficient batching
print("Sorting texts by length for optimal batching...")
texts = [d["content"] for d in all_data]
indexed_texts = [(i, text) for i, text in enumerate(texts)]
indexed_texts.sort(key=lambda x: len(x[1].split()))

sorted_texts = [text for _, text in indexed_texts]
original_indices = [i for i, _ in indexed_texts]

print(f"Generating embeddings for {len(sorted_texts)} chunks...")

# Generate embeddings
embeddings = model.encode(
    sorted_texts,
    batch_size=EMBEDDING_BATCH_SIZE,
    show_progress_bar=True,
    convert_to_numpy=True,
    normalize_embeddings=True
)

# Restore original order
embeddings_ordered = np.empty_like(embeddings)
for new_idx, orig_idx in enumerate(original_indices):
    embeddings_ordered[orig_idx] = embeddings[new_idx]

print(f"✅ Embedding complete!")

# ============================================================================
# CHROMADB STORAGE - NO CONTENT LIMITATION!
# ============================================================================
print(f"\n{'='*70}")
print("PHASE 3: Storing in ChromaDB")
print(f"{'='*70}")

# Initialize ChromaDB client with persistent storage
client = chromadb.PersistentClient(path=CHROMA_PERSIST_DIR)

# Delete existing collection if it exists (optional - remove if you want to append)
try:
    client.delete_collection(name=COLLECTION_NAME)
    print(f"Deleted existing collection: {COLLECTION_NAME}")
except:
    pass

# Create new collection
collection = client.create_collection(
    name=COLLECTION_NAME,
    metadata={"description": "Vivasoft website content with full text"}
)

print(f"Created collection: {COLLECTION_NAME}")

# Prepare data for ChromaDB (NO content limitation!)
print("Preparing documents for storage...")
ids = []
documents = []
metadatas = []
embeddings_list = []

for i, (item, emb) in enumerate(tqdm(zip(all_data, embeddings_ordered), total=len(all_data), desc="Preparing docs")):
    ids.append(f"{item['url']}_{item['chunk_id']}")
    documents.append(item['content'])  # FULL CONTENT - NO TRUNCATION!
    metadatas.append({
        "url": item['url'],
        "chunk_id": item['chunk_id'],
        "content_length": len(item['content'])
    })
    embeddings_list.append(emb.tolist())

# Batch upload to ChromaDB
print(f"\nUploading {len(ids)} documents to ChromaDB...")
batch_size = 500  # ChromaDB can handle larger batches

for i in tqdm(range(0, len(ids), batch_size), desc="Uploading batches"):
    batch_ids = ids[i:i + batch_size]
    batch_docs = documents[i:i + batch_size]
    batch_metadata = metadatas[i:i + batch_size]
    batch_embeddings = embeddings_list[i:i + batch_size]
    
    collection.add(
        ids=batch_ids,
        documents=batch_docs,
        metadatas=batch_metadata,
        embeddings=batch_embeddings
    )

# ============================================================================
# FINAL STATISTICS
# ============================================================================
print(f"\n{'='*70}")
print("✅ PROCESSING COMPLETE!")
print(f"{'='*70}")
print(f"Total pages processed: {len(all_pages) - len(failed_urls)}/{len(all_pages)}")
print(f"Total chunks created: {len(all_data)}")
print(f"Total documents in ChromaDB: {collection.count()}")
print(f"ChromaDB location: {CHROMA_PERSIST_DIR}")
print(f"Failed URLs: {len(failed_urls)}")

if failed_urls:
    print(f"\nFailed URLs:")
    for url in failed_urls[:10]:
        print(f"  - {url}")
    if len(failed_urls) > 10:
        print(f"  ... and {len(failed_urls) - 10} more")
