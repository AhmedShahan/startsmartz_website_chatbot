from pinecone.grpc import PineconeGRPC as Pinecone
from langchain_community.embeddings import HuggingFaceEmbeddings
import os 
from dotenv import load_dotenv
load_dotenv()
# Initialize Pinecone
api_key = os.getenv("PINECONE_API_KEY")
pc = Pinecone(api_key=api_key)
index = pc.Index("langchain-docs")

# Initialize embeddings
embedding = HuggingFaceEmbeddings(model_name="sentence-transformers/all-MiniLM-L6-v2")

# Query using HuggingFaceEmbeddings
query_text = "How to use LangChain?"
query_vector = embedding.embed_query(query_text)  # Returns List[float]

# Search Pinecone
results = index.query(
    vector=query_vector,
    top_k=5,
    include_metadata=True
)

# Print results
for match in results['matches']:
    print(f"Score: {match['score']}")
    print(f"URL: {match['metadata']['url']}")
    print(f"Content: {match['metadata']['content']}...")
    print("-" * 80)
