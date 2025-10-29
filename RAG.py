import os
from dotenv import load_dotenv
from langchain.prompts import ChatPromptTemplate
from langchain_core.output_parsers import StrOutputParser
from langchain_community.embeddings import HuggingFaceEmbeddings
from langchain_google_genai import ChatGoogleGenerativeAI
from pinecone.grpc import PineconeGRPC as Pinecone

# =======================
#   Load Environment
# =======================
load_dotenv()

api_key = os.getenv("PINECONE_API_KEY")
if not api_key:
    raise ValueError("Missing PINECONE_API_KEY in .env file")

pc = Pinecone(api_key=api_key)
index = pc.Index("startsmartz")

# =======================
#   Embedding + LLM setup
# =======================
embedding = HuggingFaceEmbeddings(model_name="sentence-transformers/all-MiniLM-L6-v2")

llm = ChatGoogleGenerativeAI(
    model="gemini-2.5-flash",
    temperature=0.9
)

# =======================
#   RAG Query Function
# =======================
def rag_query(question: str) -> str:
    """Perform a Retrieval-Augmented Generation query with a natural, user-friendly response."""
    
    # 1. Create embedding for the query
    query_embedding = embedding.embed_query(question)

    # 2. Retrieve similar docs
    search_results = index.query(
        vector=query_embedding,
        top_k=3,
        include_metadata=False
    )

    if not search_results.matches:
        return "Thank you for your question. Unfortunately, I don't have enough knowledge based on the available documents to answer that."

    # 3. Build context for the LLM
    context = ""
    for match in search_results.matches:
        snippet = match.metadata.get("content", "")
        context += snippet + "\n"

    # 4. Create a conversational prompt
    prompt_template = ChatPromptTemplate.from_messages([
        (
            "system",
            "You are a helpful AI assistant. Read the given context carefully and answer the user question naturally and clearly. "
            "Do not mention page numbers, document names, or any technical metadata. "
            "Respond as if you are explaining the answer to a friend."
        ),
        (
            "human",
            """Question: {question}
Context: {context}

Start your response with:
"Thank you for your question."

Then provide a concise, clear, and friendly answer based only on the context. If you are unsure, say you don't have enough information."""
        ),
    ])

    formatted_prompt = prompt_template.format(context=context, question=question)

    # 5. Run the model
    output_parser = StrOutputParser()
    response = llm.invoke(formatted_prompt)
    final_output = output_parser.parse(response)

    return final_output


# =======================
#   Run Interactively
# =======================
if __name__ == "__main__":
    print("=== Smart RAG Assistant ===")
    print("Ask a question based on your SQL documents.\n")

    while True:
        question = input("Question (or 'exit' to quit): ").strip()
        if question.lower() in {"exit", "quit"}:
            print("Goodbye.")
            break

        answer = rag_query(question)
        print("\n=== Response ===\n")
        print(answer)
        print("\n" + "="*50 + "\n")
