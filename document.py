import re
import ast
from collections import defaultdict
from langchain.schema import Document

path_to_sql = "db_latest.sql"

with open(path_to_sql, encoding="utf-8") as f:
    sql_text = f.read()

# 1. Extract Table Names and Field Names
table_pattern = re.compile(r'CREATE TABLE [`"]?([\w]+)[`"]?\s*\((.*?)\);', re.DOTALL)
tables = {}  # {table_name: [field1, field2, ...]}
for match in table_pattern.findall(sql_text):
    table, cols_spec = match
    # Split by lines and take the field name before 1st space/`/(
    fields = []
    for line in cols_spec.splitlines():
        line = line.strip()
        if line and not line.startswith("PRIMARY") and not line.startswith("KEY") and not line.startswith(")") and not line.startswith("CONSTRAINT"):
            fname_match = re.match(r'[`"]?(\w+)[`"]?\s', line)
            if fname_match:
                fields.append(fname_match.group(1))
    tables[table] = fields

# 2. Extract INSERT statements per table, parse values per field
insert_pattern = re.compile(r'INSERT INTO [`"]?([\w]+)[`"]?\s+VALUES\s+(.*?);', re.DOTALL)
table_inserts = defaultdict(list)
for match in insert_pattern.findall(sql_text):
    table, values_blob = match
    values = re.findall(r'\([^)]+\)', values_blob)
    for val_tuple in values:
        try:
            # Cleanup SQL tuple for Python: replace NULL with None, escape quotes
            cleaned = val_tuple.replace('NULL', 'None')
            fields_tuple = ast.literal_eval(cleaned)
            # pad or trim to table length
            fields_tuple = fields_tuple[:len(tables[table])]
            field_dict = dict(zip(tables[table], fields_tuple))
            table_inserts[table].append(field_dict)
        except Exception as ex:
            continue  # skip malformed

# 3. Build LangChain Documents with readable content
# List of table names to exclude
exclude_tables = ['_prisma_migrations', 'contact_form', 'job_application', 'otp']

# 3. Build LangChain Documents with readable content
documents = []
for table, records in table_inserts.items():
    if table in exclude_tables:
        continue  # Skip sensitive tables
    for record in records:
        entries = [f"{k}: {str(v)}" for k, v in record.items()]
        doc_text = f"Table: {table}\n" + "\n".join(entries)
        documents.append(Document(page_content=doc_text, metadata={"table": table}))


# Convert structured record into a human-readable paragraph
entries = []
for k, v in record.items():
    if v not in [None, "None", ""]:
        entries.append(f"{k.replace('_', ' ')} is {v}")

doc_text = f"This record belongs to the table '{table}'. " + " ".join(entries)

# Output: Each document is a readable chunk, per-row, per-table.
# print(f"Document count: {len(documents)}")
# print("Sample document:\n")

# for i,doc in enumerate(documents):
#     print(f"======================== Document {i} ==================== ")
#     print(doc)
#     print("\n\n")


######## Embedding andd vectorization store
from pinecone.grpc import PineconeGRPC as Pinecone
from langchain_community.embeddings import HuggingFaceEmbeddings
from langchain.prompts import ChatPromptTemplate
from langchain_core.output_parsers import StrOutputParser
from langchain_google_genai import ChatGoogleGenerativeAI
import os 
from dotenv import load_dotenv

load_dotenv()
#  --- Pinecone setup ---
from pinecone.grpc import PineconeGRPC as Pinecone
from pinecone import ServerlessSpec

api_key = os.getenv("PINECONE_API_KEY")
pc = Pinecone(api_key=api_key)

index_name = "startsmartz"

# Check if index already exists
existing_indexes = [idx["name"] for idx in pc.list_indexes().indexes]

if index_name not in existing_indexes:
    print(f"Creating Pinecone index: {index_name}")
    pc.create_index(
        name=index_name,
        dimension=384,  # dimension of 'all-MiniLM-L6-v2' embeddings
        metric="cosine",
        spec=ServerlessSpec(
            cloud="aws",       # or "gcp" depending on your account
            region="us-east-1" # pick your preferred region
        )
    )
    print("✅ Index created successfully.")
else:
    print("Index already exists.")

# Now connect
index = pc.Index(index_name)

embedding = HuggingFaceEmbeddings(model_name="sentence-transformers/all-MiniLM-L6-v2")




# Continue from your code above
from tqdm import tqdm

# 1. Create embeddings for all documents
print(f"Total Documents to Embed: {len(documents)}")

# Compute embeddings
texts = [doc.page_content for doc in documents]
metadatas = [doc.metadata for doc in documents]

embeddings = embedding.embed_documents(texts)

# 2. Prepare vectors for Pinecone
vectors = []
for i, (vec, meta, doc) in enumerate(zip(embeddings, metadatas, documents)):
    vectors.append({
        "id": f"doc-{i}",  # unique id for each document
        "values": vec,     # embedding vector
        "metadata": {
            "table": meta.get("table", ""),
            "content": doc.page_content
        }
    })

# 3. Upsert to Pinecone
print("Uploading embeddings to Pinecone...")

# Check if index exists (optional safety)
existing_indexes = [index["name"] for index in pc.list_indexes().indexes]
if "startsmartz" not in existing_indexes:
    raise ValueError("Index 'startsmartz' not found in your Pinecone account.")

# Insert in batches
batch_size = 100
for i in tqdm(range(0, len(vectors), batch_size)):
    batch = vectors[i : i + batch_size]
    index.upsert(vectors=batch)

print(f"✅ Successfully uploaded {len(vectors)} vectors to Pinecone index 'startsmartz'.")