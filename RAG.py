from pinecone.grpc import PineconeGRPC as Pinecone
from langchain_community.embeddings import HuggingFaceEmbeddings
from langchain.prompts import ChatPromptTemplate
from langchain_core.output_parsers import StrOutputParser
from langchain_google_genai import ChatGoogleGenerativeAI
import os 
from dotenv import load_dotenv

load_dotenv()

# Initialize
api_key = os.getenv("PINECONE_API_KEY")
pc = Pinecone(api_key=api_key)
index = pc.Index("vivasoft")
embedding = HuggingFaceEmbeddings(model_name="sentence-transformers/all-MiniLM-L6-v2")

# Your LLM here (example: from langchain_openai import ChatOpenAI)
llm=ChatGoogleGenerativeAI(
    model="gemini-2.5-flash",
    temperature=0.9
)

# Retrieve context function
def get_context(query_text):
    query_vector = embedding.embed_query(query_text)
    results = index.query(vector=query_vector, top_k=5, include_metadata=True)
    
    context = "\n\n".join([
        f"Page Number: {match['metadata'].get('page_number', 'N/A')}\n"
        f"URL: {match['metadata'].get('url', 'N/A')}\n"
        f"Content: {match['metadata'].get('content', '')}"
        for match in results['matches']
    ])
    return context

# RAG Prompt
MessageRag = [
    ('system', 'You are a Smart AI RAG-based assistant. Please answer the query based on the question.'),
    ('human', '''Answer the Question {question} ONLY based on the provided context {context}.
    If the content is insufficient, say "I don't have enough knowledge based on the document."
    
    Provide Response in this format:
    Page Number: [number]
    Original Text: [relevant text from context]
    Answer: [your answer]''')
]

prompt = ChatPromptTemplate.from_messages(MessageRag)
chain = prompt | llm | StrOutputParser()

# Main RAG function
def rag_answer(query):
    context = get_context(query)
    result = chain.invoke({"question": query, "context": context})
    return result

# Usage

while True:
    query = input("👨‍💻: ")
    answer = rag_answer(query)
    print("🤖: ",answer)
