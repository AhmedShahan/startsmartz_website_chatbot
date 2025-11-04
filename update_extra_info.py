import os
from dotenv import load_dotenv
from langchain.schema import Document
from langchain_community.embeddings import HuggingFaceEmbeddings
from pinecone.grpc import PineconeGRPC as Pinecone

# =====================================================
# 1. Load environment variables
# =====================================================
load_dotenv()
api_key = os.getenv("PINECONE_API_KEY")

if not api_key:
    raise ValueError("❌ Missing Pinecone API key. Please set PINECONE_API_KEY in your environment.")

# =====================================================
# 2. Connect to Pinecone
# =====================================================
pc = Pinecone(api_key=api_key)
index_name = "startsmartz"

existing_indexes = [idx["name"] for idx in pc.list_indexes().indexes]
if index_name not in existing_indexes:
    raise ValueError(f"❌ Index '{index_name}' does not exist. Please create it first.")

index = pc.Index(index_name)

# =====================================================
# 3. Create the extra document
# =====================================================
extra_text = """
Company Information:
Locations:
1. Dubai Office:
   Office No. 203, Business Bay, Dubai, UAE

2. Bangladesh Office:
   1st Floor, BHSK Shun Shing Tower,
   KA 49-50, Shahid Abdul Aziz Road, Jogonathpur,
   Vatara, Dhaka-1229, Bangladesh

Office Hours:
Saturday to Thursday, from 9 AM to 6 PM




Website Technology Stack (StartSmartz):
Programming Languages:
- JavaScript (Front-end)

Front-end:
- HTML/CSS/JavaScript
- Possibly React or Vue (not clearly identified)

Backend / Server-side:
- Unknown (no public indicators)

Databases:
- Unknown (likely MySQL/PostgreSQL or MongoDB if MERN stack)

Artificial Intelligence:
- No obvious AI modules on the public site

"""

extra_doc = Document(
    page_content=extra_text.strip(),
    metadata={
        "table": "company_info",
        "source": "manual_entry",
        "record_id": "company_details"
    }
)

# =====================================================
# 4. Embed the document
# =====================================================
embedding = HuggingFaceEmbeddings(model_name="sentence-transformers/all-MiniLM-L6-v2")
extra_vector = embedding.embed_documents([extra_doc.page_content])[0]

# =====================================================
# 5. Upsert into Pinecone
# =====================================================
extra_entry = {
    "id": f"{extra_doc.metadata['table']}-{extra_doc.metadata['record_id']}",
    "values": extra_vector,
    "metadata": {
        "table": extra_doc.metadata["table"],
        "content": extra_doc.page_content[:1000],  # Limit to 1000 chars
        "record_id": extra_doc.metadata["record_id"]
    }
}

index.upsert(vectors=[extra_entry])
print("✅ Successfully appended company info to Pinecone index.")

# =====================================================
# 6. Optional: Verify
# =====================================================
stats = index.describe_index_stats()
print(f"📊 Total vectors now: {stats['total_vector_count']}")
