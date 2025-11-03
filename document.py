import re
from collections import defaultdict
from langchain.schema import Document
from tqdm import tqdm
import os
from dotenv import load_dotenv
from pinecone.grpc import PineconeGRPC as Pinecone
from pinecone import ServerlessSpec
from langchain_community.embeddings import HuggingFaceEmbeddings


# =====================================================
# 1. Load SQL File
# =====================================================

path_to_sql = "/home/shahanahmed/startsmartz_website_chatbot/db.sql"

with open(path_to_sql, encoding="utf-8") as f:
    sql_text = f.read()


# =====================================================
# 2. Extract Table Structures
# =====================================================

create_pattern = re.compile(
    r'CREATE TABLE `(\w+)`\s*\((.*?)\)\s*ENGINE',
    re.DOTALL | re.IGNORECASE
)

tables = {}
for match in create_pattern.findall(sql_text):
    table_name, columns_def = match
    fields = []
    for line in columns_def.split('\n'):
        line = line.strip().rstrip(',')
        if line.startswith('`') and not any(
            kw in line.upper() for kw in ['PRIMARY KEY', 'KEY', 'CONSTRAINT', 'UNIQUE']
        ):
            col_match = re.match(r'`(\w+)`', line)
            if col_match:
                fields.append(col_match.group(1))
    if fields:
        tables[table_name] = fields

print(f"📊 Total tables found: {len(tables)}")
print(f"📋 Tables: {', '.join(sorted(tables.keys()))}\n")


# =====================================================
# 3. Define Exclusion List (Sensitive/System Tables)
# =====================================================

exclude_tables = [
    '_prisma_migrations',
    'otp',
    'emailverification',
    'file',
    'contact_form',
    'notification',
    'user',
    'job_application',
]

# Tables that will be processed
included_tables = [t for t in tables.keys() if t not in exclude_tables]
print(f"✅ Tables to process: {len(included_tables)}")
print(f"🚫 Excluded tables: {len(exclude_tables)}")
print(f"\n📝 Processing: {', '.join(sorted(included_tables))}\n")


# =====================================================
# 4. Extract INSERT Data
# =====================================================

table_data = defaultdict(list)
insert_blocks = re.split(r'INSERT INTO `(\w+)` VALUES', sql_text)

for i in range(1, len(insert_blocks), 2):
    if i + 1 >= len(insert_blocks):
        break
    table_name = insert_blocks[i]
    
    # Skip excluded tables
    if table_name not in included_tables:
        continue
        
    values_block = insert_blocks[i + 1]
    if table_name not in tables:
        continue
    values_block = values_block.split(';')[0]

    # Parse tuples
    depth = 0
    current_tuple = []
    tuples = []
    for char in values_block:
        if char == '(':
            depth += 1
            if depth == 1:
                current_tuple = []
            else:
                current_tuple.append(char)
        elif char == ')':
            depth -= 1
            if depth == 0:
                tuples.append(''.join(current_tuple))
                current_tuple = []
            else:
                current_tuple.append(char)
        elif depth > 0:
            current_tuple.append(char)

    # Parse each tuple
    for tuple_str in tuples:
        try:
            values = []
            current_value = []
            in_string = False
            escape_next = False
            quote_char = None
            i = 0
            while i < len(tuple_str):
                char = tuple_str[i]
                if escape_next:
                    current_value.append(char)
                    escape_next = False
                    i += 1
                    continue
                if char == '\\':
                    escape_next = True
                    i += 1
                    continue
                if char in ["'", '"']:
                    if not in_string:
                        in_string = True
                        quote_char = char
                    elif char == quote_char:
                        in_string = False
                        quote_char = None
                    else:
                        current_value.append(char)
                    i += 1
                    continue
                if char == ',' and not in_string:
                    value_str = ''.join(current_value).strip()
                    if value_str.upper() == 'NULL' or value_str == '':
                        values.append(None)
                    elif value_str.isdigit():
                        values.append(int(value_str))
                    else:
                        values.append(value_str)
                    current_value = []
                    i += 1
                    continue
                current_value.append(char)
                i += 1
            if current_value:
                value_str = ''.join(current_value).strip()
                if value_str.upper() == 'NULL' or value_str == '':
                    values.append(None)
                elif value_str.isdigit():
                    values.append(int(value_str))
                else:
                    values.append(value_str)

            # Map field names to values
            table_fields = tables[table_name]
            record = {}
            for idx, field_name in enumerate(table_fields):
                record[field_name] = values[idx] if idx < len(values) else None
            table_data[table_name].append(record)
        except Exception as e:
            print(f"⚠️  Error parsing tuple in {table_name}: {str(e)[:100]}")
            continue

# Print statistics
print("\n" + "="*60)
print("📊 DATA EXTRACTION SUMMARY")
print("="*60)
for table in sorted(included_tables):
    count = len(table_data.get(table, []))
    print(f"  {table:40s} : {count:4d} records")
print("="*60 + "\n")


# =====================================================
# 5. Create Documents (Human-readable form)
# =====================================================

documents = []

# Fields to exclude from document content (IDs and metadata)
exclude_fields = ["id", "file_id", "user_id", "created_at", "updated_at"]

for table, records in table_data.items():
    for record in records:
        # Build readable content
        entries = []
        for k, v in record.items():
            # Skip excluded fields and empty values
            if k.lower() in exclude_fields:
                continue
            if v in [None, "", "None"]:
                continue
            
            # Clean field name
            field_name = k.replace('_', ' ').title()
            
            # Handle long text fields
            if isinstance(v, str) and len(v) > 500:
                v = v[:500] + "..."
            
            entries.append(f"{field_name}: {v}")
        
        if entries:
            # Create readable document
            doc_text = f"Table: {table.replace('_', ' ').title()}\n" + "\n".join(entries)
            
            documents.append(Document(
                page_content=doc_text,
                metadata={
                    "table": table,
                    "source": "database",
                    "record_id": record.get("id", "unknown")
                }
            ))

print(f"✅ Created {len(documents)} clean, human-readable documents for embedding.\n")


# =====================================================
# 6. Embed and Upload to Pinecone
# =====================================================

load_dotenv()
api_key = os.getenv("PINECONE_API_KEY")

if not api_key:
    raise ValueError("❌ Missing Pinecone API key. Please set PINECONE_API_KEY in your environment.")

pc = Pinecone(api_key=api_key)
index_name = "startsmartz"

existing_indexes = [idx["name"] for idx in pc.list_indexes().indexes]
if index_name not in existing_indexes:
    print(f"🔨 Creating Pinecone index '{index_name}'...")
    pc.create_index(
        name=index_name,
        dimension=384,
        metric="cosine",
        spec=ServerlessSpec(cloud="aws", region="us-east-1")
    )
    print("✅ Index created successfully.")
else:
    print(f"✅ Index '{index_name}' already exists.")

index = pc.Index(index_name)
embedding = HuggingFaceEmbeddings(model_name="sentence-transformers/all-MiniLM-L6-v2")

print(f"\n🔄 Embedding {len(documents)} documents...")
texts = [doc.page_content for doc in documents]
metadatas = [doc.metadata for doc in documents]
embeddings = embedding.embed_documents(texts)

vectors = []
for i, (vec, meta, doc) in enumerate(zip(embeddings, metadatas, documents)):
    vectors.append({
        "id": f"{meta['table']}-{meta['record_id']}-{i}",
        "values": vec,
        "metadata": {
            "table": meta.get("table", ""),
            "content": doc.page_content[:1000],  # Limit content size
            "record_id": str(meta.get("record_id", ""))
        }
    })

print("📤 Uploading to Pinecone...")
batch_size = 100
for i in tqdm(range(0, len(vectors), batch_size), desc="Uploading batches"):
    batch = vectors[i:i + batch_size]
    index.upsert(vectors=batch)

print(f"\n✅ Successfully uploaded {len(vectors)} vectors to Pinecone index '{index_name}'.")

# Verification
stats = index.describe_index_stats()
print(f"\n📊 FINAL STATISTICS")
print("="*60)
print(f"  Total vectors in Pinecone: {stats['total_vector_count']}")
print(f"  Documents processed: {len(documents)}")
print(f"  Tables processed: {len([t for t in included_tables if t in table_data])}")
print("="*60)
print("\n🎉 Database embedding completed successfully!")