from fastapi import FastAPI, HTTPException, status
from fastapi.middleware.cors import CORSMiddleware
from pydantic import BaseModel, Field
from typing import Optional
from sentence_transformers import SentenceTransformer
from langchain.prompts import ChatPromptTemplate
from langchain_core.output_parsers import StrOutputParser
from langchain_google_genai import ChatGoogleGenerativeAI
from langchain_openai import ChatOpenAI
from langchain_cohere import ChatCohere
from pinecone import Pinecone
from enum import Enum
import nest_asyncio
from pyngrok import ngrok
import uvicorn
import httpx
import os
from dotenv import load_dotenv

load_dotenv()


# Initialize FastAPI app
app = FastAPI(
    title="RAG Assistant API",
    description="Enterprise RAG API with multi-provider support and credential validation",
    version="1.0.0"
)


# CORS middleware
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)


# Enums
class ProviderEnum(str, Enum):
    gemini = "gemini"
    openai = "openai"
    cohere = "cohere"


# Request Models - ONLY query is required now
class QueryRequest(BaseModel):
    query: str = Field(..., description="User query text", min_length=1)


# Response Models
class QueryResponse(BaseModel):
    status: str = Field(..., description="Status from validator or processing")
    message: str = Field(..., description="Message describing the status")
    content: str = Field(default="", description="Generated response content (empty if validation fails)")
    sources: Optional[list] = Field(default=None, description="Retrieved context sources")


# Initialize RAG components (cached)
embedding_model = None
pinecone_index = None


# CONSTANT CONFIGURATION - Set your default values here
class AppConfig:
    PROVIDER = os.getenv("DEFAULT_PROVIDER", "gemini")  # gemini, openai, or cohere
    CREDENTIAL = os.getenv("DEFAULT_CREDENTIAL", "YOUR_API_KEY_HERE")
    VALIDATOR_URL = os.getenv("VALIDATOR_URL", "https://your-validator-api.com/validate")
    TOP_K = int(os.getenv("TOP_K", "3"))


@app.on_event("startup")
async def startup_event():
    """Initialize Pinecone and embedding model on startup"""
    global embedding_model, pinecone_index
    try:
        # Initialize Pinecone
        api_key = os.getenv("PINECONE_API_KEY")
        if not api_key:
            raise ValueError("PINECONE_API_KEY not found in environment variables")
        
        pc = Pinecone(api_key=api_key)
        pinecone_index = pc.Index("vivasoft")
        
        # Initialize embedding model
        embedding_model = SentenceTransformer("all-MiniLM-L6-v2")
        
        print("✅ RAG components initialized successfully")
        print(f"✅ Pinecone index 'vivasoft' connected")
        print(f"✅ Default provider: {AppConfig.PROVIDER}")
        print(f"✅ Validator URL: {AppConfig.VALIDATOR_URL}")
    except Exception as e:
        print(f"❌ Initialization error: {e}")
        raise


async def validate_credential(provider: str, credential: str, validator_url: str) -> dict:
    """
    Call external validator API to check if credential is valid
    
    Expected validator response:
    {
        "status": "success" | "limit_exceeded" | "invalid" | "error",
        "message": "...",
        "details": "..."
    }
    """
    try:
        async with httpx.AsyncClient(timeout=30.0) as client:
            response = await client.post(
                validator_url,
                json={
                    "provider": provider,
                    "credential": credential
                }
            )
            
            if response.status_code == 200:
                return response.json()
            else:
                return {
                    "status": "error",
                    "message": f"❌ Validator API returned status code {response.status_code}",
                    "details": response.text
                }
    except httpx.TimeoutException:
        return {
            "status": "error",
            "message": "❌ Validator API request timed out",
            "details": "The validator API did not respond within 30 seconds"
        }
    except Exception as e:
        return {
            "status": "error",
            "message": "❌ Failed to connect to validator API",
            "details": str(e)
        }


def classify_query(question: str) -> str:
    """Classify if query needs RAG retrieval or is conversational"""
    conversational_patterns = [
        'hi', 'hello', 'hey', 'good morning', 'good evening', 'good night',
        'how are you', "what's up", 'who are you', 'whats up',
        'who developed you', 'what can you do', 'who made you',
        'your name', 'introduce yourself', 'what is your name',
        'thanks', 'thank you', 'bye', 'goodbye', 'see you',
        'help', 'can you help', 'what do you do'
    ]
    
    question_lower = question.lower().strip()
    
    if any(pattern in question_lower for pattern in conversational_patterns):
        return "conversational"
    
    if len(question_lower.split()) <= 3:
        for pattern in ['hi', 'hello', 'hey', 'thanks', 'bye', 'ok', 'okay']:
            if pattern == question_lower:
                return "conversational"
    
    return "knowledge_based"


def get_context(query_text: str, top_k: int = 3) -> tuple:
    """Retrieve relevant context from Pinecone"""
    try:
        # Generate query embedding
        query_vector = embedding_model.encode(query_text, normalize_embeddings=True).tolist()
        
        # Query Pinecone
        results = pinecone_index.query(
            vector=query_vector,
            top_k=top_k,
            include_metadata=True
        )
        
        # Format context
        context_parts = []
        for i, match in enumerate(results['matches']):
            # Extract metadata
            metadata = match.get('metadata', {})
            url = metadata.get('url', 'Unknown')
            text = metadata.get('text', '')
            
            context_parts.append(f"[Source {i+1} from {url}]\n{text}")
        
        context = "\n\n---\n\n".join(context_parts)
        
        # Format matches for sources
        matches = []
        for match in results['matches']:
            metadata = match.get('metadata', {})
            
            matches.append({
                'id': match.get('id', 'Unknown'),
                'url': metadata.get('url', 'Unknown'),
                'score': round(match.get('score', 0.0), 4),
                'preview': metadata.get('text', '')[:200]
            })
        
        return context, matches
    except Exception as e:
        raise HTTPException(status_code=500, detail=f"Context retrieval error: {str(e)}")


def initialize_llm(provider: str, credential: str):
    """Initialize LLM based on provider and credential"""
    try:
        if provider == "gemini":
            llm = ChatGoogleGenerativeAI(
                model="gemini-2.0-flash-exp",
                google_api_key=credential,
                temperature=0.7
            )
        elif provider == "openai":
            llm = ChatOpenAI(
                model="gpt-4o-mini",
                api_key=credential,
                temperature=0.7
            )
        elif provider == "cohere":
            llm = ChatCohere(
                model="command-r-plus",
                cohere_api_key=credential,
                temperature=0.7
            )
        else:
            raise ValueError(f"Unsupported provider: {provider}")
        
        return llm
    except Exception as e:
        raise HTTPException(status_code=400, detail=f"LLM initialization failed: {str(e)}")


@app.post("/query", response_model=QueryResponse)
async def process_query(request: QueryRequest):
    """
    Process query with specified LLM provider
    Steps:
    1. Validate credential using external validator API
    2. If validation fails, return validator response
    3. If validation succeeds, process the query
    
    Note: Provider, credential, validator_url, and top_k are configured as constants
    """
    
    # Use constant configuration values
    provider = AppConfig.PROVIDER
    credential = AppConfig.CREDENTIAL
    validator_url = AppConfig.VALIDATOR_URL
    top_k = AppConfig.TOP_K
    
    # Step 1: Validate credential using external API
    validation_result = await validate_credential(
        provider=provider,
        credential=credential,
        validator_url=validator_url
    )
    
    # Step 2: Check validation status
    if validation_result["status"] != "success":
        # Validation failed - return validator response
        return QueryResponse(
            status=validation_result["status"],
            message=validation_result["message"],
            content="",
            sources=None
        )
    
    # Step 3: Validation succeeded - process the query
    try:
        # Initialize LLM with validated credential
        llm = initialize_llm(provider, credential)
        
        # Classify query type
        query_type = classify_query(request.query)
        
        # Initialize output parser
        output_parser = StrOutputParser()
        
        if query_type == "conversational":
            # Conversational response without context retrieval
            conversational_prompt = ChatPromptTemplate.from_messages([
                ('system', '''You are an intelligent, enterprise-grade AI assistant for Vivasoft Ltd. 

Core Identity:
- You represent Vivasoft Ltd and provide helpful assistance.
- You were developed by Startsmartz Technologies' AI team.
- Your primary purpose is to answer questions about the company's products, services, policies, and operations.

Response Guidelines for Greetings & Conversational Queries:
- Respond warmly and professionally to greetings like "Hi", "Hello", "How are you".
- When asked "Who are you?": Explain you're an AI assistant for Vivasoft Ltd designed to help with company-related information.
- When asked "Who developed you?": Mention you were developed by Startsmartz Technologies.
- When asked about your capabilities: Explain you can answer questions about Vivasoft's products, services, policies, and general company information.

Tone & Style:
- Professional yet conversational and friendly.
- Clear and concise.
- Helpful and welcoming.'''),
                ('human', '{question}')
            ])
            
            chain = conversational_prompt | llm | output_parser
            
            # Generate response
            response = chain.invoke({"question": request.query})
            
            return QueryResponse(
                status="success",
                message="✅ Query processed successfully",
                content=response,
                sources=None
            )
        
        else:
            # Knowledge-based response with context retrieval
            knowledge_prompt = ChatPromptTemplate.from_messages([
                ('system', '''You are an intelligent, enterprise-grade AI assistant for Vivasoft Ltd, powered by advanced RAG technology.

Core Identity:
- You represent Vivasoft Ltd and provide information based on verified company knowledge.
- You were developed by Startsmartz Technologies' AI team to help users find accurate information quickly.
- Your primary purpose is to answer questions about the company's products, services, policies, and operations.

Response Guidelines:
- Provide accurate, context-based answers using the company knowledge base.
- Structure responses in clear, concise points when appropriate.
- If information isn't available in the knowledge base, say: "I don't have that information in the company documents. Please contact the relevant department for assistance."
- Never speculate or provide information beyond what's in the verified context.

Tone & Style:
- Professional yet conversational - balance formality with approachability.
- Clear and concise - respect the user's time.
- Helpful and solution-oriented - guide users effectively.
- Maintain enterprise standards in all communications.'''),
                ('human', '''Context from company knowledge base:
{context}

User question: {question}

Instructions:
1. Read the context carefully - it contains relevant information from the company's website and documents.
2. Answer the question using ONLY information found in the context above.
3. Be specific and detailed in your answer - use the actual content provided.
4. Structure your response clearly with bullet points if there are multiple aspects.
5. If the context genuinely doesn't contain relevant information to answer the question, then say: "I don't have that specific information in the available documents. Please contact the relevant department for assistance."
6. DO NOT say you don't have information if the context actually contains relevant details - use them to answer!''')
            ])
            
            chain = knowledge_prompt | llm | output_parser
            
            # Get context from Pinecone
            context, matches = get_context(request.query, top_k)
            
            # Generate response
            response = chain.invoke({"question": request.query, "context": context})
            
            return QueryResponse(
                status="success",
                message="✅ Query processed successfully",
                content=response,
                sources=matches
            )
    
    except HTTPException as he:
        raise he
    
    except Exception as e:
        return QueryResponse(
            status="error",
            message="❌ An error occurred while processing your query",
            content="",
            sources=None
        )


@app.get("/health")
async def health_check():
    """Health check endpoint"""
    return {
        "status": "healthy",
        "embedding_model": "loaded" if embedding_model else "not loaded",
        "pinecone_index": "connected" if pinecone_index else "not connected",
        "config": {
            "provider": AppConfig.PROVIDER,
            "validator_url": AppConfig.VALIDATOR_URL,
            "top_k": AppConfig.TOP_K
        }
    }


@app.get("/")
async def root():
    """Root endpoint with API information"""
    return {
        "message": "RAG Assistant API with Credential Validation",
        "version": "1.0.0",
        "vector_database": "Pinecone",
        "default_provider": AppConfig.PROVIDER,
        "endpoints": {
            "/query": "POST - Process user query with RAG (only 'query' field required)",
            "/health": "GET - Health check",
            "/docs": "GET - Interactive API documentation"
        }
    }


if __name__ == "__main__":
    # Set your ngrok auth token (optional but recommended for longer sessions)
    # ngrok.set_auth_token("YOUR_NGROK_AUTH_TOKEN")
    
    # Start ngrok tunnel
    public_url = ngrok.connect(8000)
    print("\n" + "="*60)
    print(f"🌐 Public URL: {public_url.public_url}")
    print(f"📚 API Docs: {public_url.public_url}/docs")
    print(f"🔍 Health Check: {public_url.public_url}/health")
    print("="*60 + "\n")
    
    # Apply nest_asyncio to allow running async code in environments like Jupyter/Colab
    nest_asyncio.apply()
    
    # Run the FastAPI app
    uvicorn.run(app, host="0.0.0.0", port=8000, log_level="info")
