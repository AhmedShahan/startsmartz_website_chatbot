import json
import re
from langchain_community.document_loaders import WebBaseLoader
from langchain.text_splitter import RecursiveCharacterTextSplitter
from sentence_transformers import SentenceTransformer
from dotenv import load_dotenv
load_dotenv()
# Load URLs
with open("/home/shahanahmed/startsmartz_website_chatbot/langchain_all_link.json", "r") as file:
    data = json.load(file)

# Merge and filter links
all_pages = list(set(data['all_links']) | set(data['crawled_pages']))
keywords = ["langchain", "langgraph", "langsmith"]
filtered_links = [link for link in all_pages if any(kw in link.lower() for kw in keywords)]

# Setup
splitter = RecursiveCharacterTextSplitter(chunk_size=800, chunk_overlap=150)
model = SentenceTransformer("all-MiniLM-L6-v2")

def clean_text(text):
    text = re.sub(r'[\n\t\r]+', ' ', text)
    text = re.sub(r'\s{2,}', ' ', text)
    return text.strip()

# Process all pages in one loop
all_data = []

for url in filtered_links:
    try:
        # Load and chunk
        loader = WebBaseLoader(url)
        docs = loader.load()
        splits = splitter.split_documents(docs)
        
        # Clean and prepare for embedding
        for i, chunk in enumerate(splits):
            cleaned_content = clean_text(chunk.page_content)
            all_data.append({
                "url": url,
                "chunk_id": i,
                "content": cleaned_content
            })
        
        print(f"✅ Processed: {url} ({len(splits)} chunks)")
    except Exception as e:
        print(f"❌ Error loading {url}: {e}")

# Batch embed all chunks at once (most efficient)
texts = [d["content"] for d in all_data]
embeddings = model.encode(
    texts,
    batch_size=64,  # Optimize based on your GPU memory
    show_progress_bar=True,
    convert_to_numpy=True,
    normalize_embeddings=True
)

# Merge embeddings with metadata
embedded_data = []
for data_item, emb in zip(all_data, embeddings):
    embedded_data.append({
        **data_item,
        "embedding": emb.tolist()
    })

print(f"✅ Embedding successful: {len(embedded_data)} chunks processed")

# Save output
# with open("embedded_chunks.json", "w") as f:
#     json.dump(embedded_data, f)

import os 
from pinecone.grpc import PineconeGRPC as Pinecone
api_key = os.getenv("PINECONE_API_KEY")
# Initialize Pinecone
pc = Pinecone(api_key)

# Create index (do this once)
from pinecone import ServerlessSpec

index_name = "langchain-docs"
if not pc.has_index(index_name):
    pc.create_index(
        name=index_name,
        dimension=384,  # all-MiniLM-L6-v2 dimension
        metric="cosine",
        spec=ServerlessSpec(cloud="aws", region="us-east-1")
    )

# Connect to index
index = pc.Index(index_name)

# Prepare vectors for upsert
vectors = []
for item in embedded_data:
    vectors.append({
        "id": f"{item['url']}_{item['chunk_id']}",  # unique ID
        "values": item["embedding"],
        "metadata": {
            "url": item["url"],
            "chunk_id": item["chunk_id"],
            "content": item["content"][:1000]  # Pinecone metadata limit
        }
    })

# Batch upsert (100-200 vectors at a time)
batch_size = 100
for i in range(0, len(vectors), batch_size):
    batch = vectors[i:i + batch_size]
    index.upsert(vectors=batch)
    print(f"✅ Upserted batch {i//batch_size + 1} ({len(batch)} vectors)")

print(f"\n✅ Total vectors in index: {index.describe_index_stats()['total_vector_count']}")