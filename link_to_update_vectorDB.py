import json
import re
from langchain_community.document_loaders import WebBaseLoader
from langchain.text_splitter import RecursiveCharacterTextSplitter
from sentence_transformers import SentenceTransformer
from dotenv import load_dotenv
import os
from pinecone.grpc import PineconeGRPC as Pinecone
from transformers import pipeline

load_dotenv()

# Initialize summarization pipeline
print("🔄 Loading summarization model...")
summarizer = pipeline("summarization", model="facebook/bart-large-cnn", device=-1)  # device=-1 for CPU, 0 for GPU

# Load URLs
with open("/home/shahanahmed/startsmartz_website_chatbot/startsmartz_crawl_results.json", "r") as file:
    data = json.load(file)

# Merge and filter links
all_pages = list(
    set(data['all_links']) | 
    set(data['failed_pages']) | 
    set(data['categorized_links']['internal']) |
    set(data['categorized_links']['external'])
)

# Setup
splitter = RecursiveCharacterTextSplitter(chunk_size=3000, chunk_overlap=300)
model = SentenceTransformer("all-MiniLM-L6-v2")

def clean_text(text):
    text = re.sub(r'[\n\t\r]+', ' ', text)
    text = re.sub(r'\s{2,}', ' ', text)
    return text.strip()

def summarize_if_needed(text, max_length=2000):
    """
    Summarizes text if it exceeds max_length, otherwise returns original text.
    """
    if len(text) <= max_length:
        return text
    
    try:
        # BART model works best with text between 56-1024 tokens
        # Split into chunks if text is too long
        max_input_length = 1024
        words = text.split()
        
        if len(words) > max_input_length:
            # Take first part for summarization
            text_to_summarize = ' '.join(words[:max_input_length])
        else:
            text_to_summarize = text
        
        # Generate summary
        summary = summarizer(
            text_to_summarize,
            max_length=400,  # Target summary length
            min_length=100,
            do_sample=False,
            truncation=True
        )
        
        return summary[0]['summary_text']
    
    except Exception as e:
        print(f"⚠️ Summarization failed: {e}, using truncation")
        return text[:max_length] + "..."

# Initialize Pinecone
api_key = os.getenv("PINECONE_API_KEY")
pc = Pinecone(api_key)
index_name = "startsmartz"
index = pc.Index(index_name)

# Get existing vector IDs to track what needs to be deleted later
print("📊 Fetching existing vectors...")
existing_ids = set()
try:
    # Fetch all existing IDs (you may need to adjust based on your index size)
    stats = index.describe_index_stats()
    print(f"Current vectors in index: {stats['total_vector_count']}")
except Exception as e:
    print(f"⚠️ Could not fetch stats: {e}")

# Process all pages
all_data = []
new_vector_ids = set()

for url in all_pages:
    try:
        # Load and chunk
        loader = WebBaseLoader(url)
        docs = loader.load()
        splits = splitter.split_documents(docs)
        
        # Clean and prepare for embedding
        for i, chunk in enumerate(splits):
            cleaned_content = clean_text(chunk.page_content)
            vector_id = f"{url}_{i}"
            new_vector_ids.add(vector_id)
            
            all_data.append({
                "id": vector_id,
                "url": url,
                "chunk_id": i,
                "content": cleaned_content
            })
        
        print(f"✅ Processed: {url} ({len(splits)} chunks)")
    except Exception as e:
        print(f"❌ Error loading {url}: {e}")

# Batch embed all chunks at once
print("\n🔄 Generating embeddings...")
texts = [d["content"] for d in all_data]
embeddings = model.encode(
    texts,
    batch_size=64,
    show_progress_bar=True,
    convert_to_numpy=True,
    normalize_embeddings=True
)

# Prepare vectors for upsert (upsert will update existing or create new)
vectors = []
print("\n📝 Preparing metadata (summarizing where needed)...")
for data_item, emb in zip(all_data, embeddings):
    # Summarize content if over 2000 characters
    metadata_content = summarize_if_needed(data_item["content"], max_length=2000)
    
    vectors.append({
        "id": data_item["id"],
        "values": emb.tolist(),
        "metadata": {
            "url": data_item["url"],
            "chunk_id": data_item["chunk_id"],
            "content": metadata_content,
            "original_length": len(data_item["content"]),
            "is_summarized": len(data_item["content"]) > 2000
        }
    })

# Batch upsert (this will UPDATE existing vectors with same ID)
print(f"\n🔄 Upserting {len(vectors)} vectors...")
batch_size = 100
for i in range(0, len(vectors), batch_size):
    batch = vectors[i:i + batch_size]
    index.upsert(vectors=batch)
    print(f"✅ Upserted batch {i//batch_size + 1} ({len(batch)} vectors)")

# Optional: Delete vectors that no longer exist in the source
print("\n🧹 Checking for orphaned vectors...")
# Note: To identify orphaned vectors, you'd need to list all IDs in the index
# This is a simplified approach - you may want to implement namespace-based cleanup
# or maintain a separate tracking mechanism for production use

print(f"\n✅ Update complete!")
print(f"📊 Total vectors processed: {len(vectors)}")
final_stats = index.describe_index_stats()
print(f"📊 Total vectors in index: {final_stats['total_vector_count']}")