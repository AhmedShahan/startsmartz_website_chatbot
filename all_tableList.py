import re

# Read the SQL file
with open('db_latest.sql', 'r', encoding='utf-8') as file:
    sql_content = file.read()

# Extract table names using regex pattern for CREATE TABLE statements
table_pattern = r'CREATE\s+TABLE\s+(?:IF\s+NOT\s+EXISTS\s+)?[`"]?(\w+)[`"]?'
tables = re.findall(table_pattern, sql_content, re.IGNORECASE)

# Print all table names
print("Table names found:")
for table in tables:
    print(table)

# Optional: Print count
print(f"\nTotal tables: {len(tables)}")
