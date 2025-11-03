# query_by_table.py
from pinecone import Pinecone
from langchain_community.embeddings import HuggingFaceEmbeddings
from dotenv import load_dotenv
import os
# 1. Initialize Pinecone

load_dotenv()
api_key = os.getenv("PINECONE_API_KEY")

if not api_key:
    raise ValueError("❌ Missing Pinecone API key. Please set PINECONE_API_KEY in your environment.")

pc = Pinecone(api_key=api_key)
# 2. Connect to your index
index_name = "startsmartz"
index = pc.Index(index_name)

# 3. Load embedding model (optional if you want semantic search later)
embedding = HuggingFaceEmbeddings(model_name="sentence-transformers/all-MiniLM-L6-v2")

# 4. Table name you want to fetch
table_name_query = "technology_product"

# 5. Use a dummy vector for filtering by metadata only
dummy_vector = [0.0] * 384

results = index.query(
    vector=dummy_vector,
    top_k=100,  # number of records to return
    filter={"table": table_name_query},  # metadata filter
    include_metadata=True
)

# 6. Print results
print(f"Results for table: {table_name_query}\n")
for i, match in enumerate(results.matches):
    print(f"Record {i+1}:\n{match.metadata['content']}\n{'-'*50}")
