import json
import re
from langchain_community.document_loaders import WebBaseLoader
from langchain.text_splitter import RecursiveCharacterTextSplitter
from sentence_transformers import SentenceTransformer
from dotenv import load_dotenv
import os
from pinecone.grpc import PineconeGRPC as Pinecone
from pinecone import ServerlessSpec
from urllib.parse import urlparse

load_dotenv()

# Configuration
INDEX_NAME = "startsmartz"
# NAMESPACE = "website"

print("🔄 Loading embedding model...")
model = SentenceTransformer("sentence-transformers/all-MiniLM-L6-v2")

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

# Text processing
splitter = RecursiveCharacterTextSplitter(chunk_size=3000, chunk_overlap=300)

def clean_text(text):
    text = re.sub(r'[\n\t\r]+', ' ', text)
    text = re.sub(r'\s{2,}', ' ', text)
    return text.strip()

# Initialize Pinecone
api_key = os.getenv("PINECONE_API_KEY")
pc = Pinecone(api_key=api_key)

# Create index if needed
existing_indexes = [idx["name"] for idx in pc.list_indexes().indexes]
if INDEX_NAME not in existing_indexes:
    print(f"🔨 Creating index: {INDEX_NAME}")
    pc.create_index(
        name=INDEX_NAME,
        dimension=384,
        metric="cosine",
        spec=ServerlessSpec(cloud="aws", region="us-east-1")
    )

index = pc.Index(INDEX_NAME)

# Process all pages
all_documents = []

print(f"\n🔄 Processing {len(all_pages)} URLs...\n")

for idx, url in enumerate(all_pages, 1):
    try:
        print(f"[{idx}/{len(all_pages)}] {url}")
        
        loader = WebBaseLoader(url)
        docs = loader.load()
        
        if not docs:
            continue
            
        splits = splitter.split_documents(docs)
        
        for i, chunk in enumerate(splits):
            cleaned_content = clean_text(chunk.page_content)
            
            if len(cleaned_content.strip()) < 50:
                continue
            
            all_documents.append({
                "id": f"web-{idx}-{i}",
                "url": url,
                "content": cleaned_content
            })
        
        print(f"  ✅ {len(splits)} chunks")
        
    except Exception as e:
        print(f"  ❌ Error: {e}")

print(f"\n📊 Total chunks: {len(all_documents)}")
print(all_documents[0])




# # Generate embeddings
# print("\n🔄 Generating embeddings...")
# texts = [d["content"] for d in all_documents]
# embeddings = model.encode(texts, batch_size=64, show_progress_bar=True)

# # Prepare vectors
# vectors = []
# for doc, emb in zip(all_documents, embeddings):
#     vectors.append({
#         "id": doc["id"],
#         "values": emb.tolist(),
#         "metadata": {
#             "url": doc["url"],
#             "content": doc["content"][:2000]  # Pinecone metadata limit
#         }
#     })

# # Upsert to Pinecone
# print(f"\n🔄 Upserting {len(vectors)} vectors...")
# batch_size = 100
# for i in range(0, len(vectors), batch_size):
#     batch = vectors[i:i + batch_size]
#     index.upsert(vectors=batch)
#     print(f"✅ Batch {i//batch_size + 1}")

# print(f"\n✅ Done! {len(vectors)} vectors uploaded to '{INDEX_NAME}' index")