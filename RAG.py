from pinecone.grpc import PineconeGRPC as Pinecone  # Changed to gRPC client
from langchain_community.embeddings import HuggingFaceEmbeddings
from langchain.prompts import ChatPromptTemplate
from langchain_core.output_parsers import StrOutputParser
from langchain_google_genai import ChatGoogleGenerativeAI
from langchain_openai import ChatOpenAI
from langchain_cohere import ChatCohere
from fastapi import FastAPI, HTTPException, status
from fastapi.middleware.cors import CORSMiddleware
from pydantic import BaseModel, Field
from typing import Optional, List, Dict
from enum import Enum
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

# Request Models
class QueryRequest(BaseModel):
    query: str = Field(..., description="User query text", min_length=1)

# Response Models
class SourceMatch(BaseModel):
    id: str
    page_number: str  # Changed from url
    score: float
    preview: str

class QueryResponse(BaseModel):
    status: str = Field(..., description="Status from validator or processing")
    message: str = Field(..., description="Message describing the status")
    content: str = Field(default="", description="Generated response content")
    sources: Optional[List[SourceMatch]] = Field(default=None, description="Retrieved context sources")

# Global variables for RAG components
embedding_model = None
pinecone_index = None

# CONSTANT CONFIGURATION
class AppConfig:
    PROVIDER = "gemini"
    CREDENTIAL = os.getenv("GOOGLE_API_KEY")
    VALIDATOR_URL = "https://provider-credential-validdator.onrender.com/validate"
    TOP_K = int(os.getenv("TOP_K", "10"))
    PINECONE_API_KEY = os.getenv("PINECONE_API_KEY")
    PINECONE_INDEX_NAME = "startsmartz-web"
    EMBEDDING_MODEL = "sentence-transformers/all-MiniLM-L6-v2"

@app.on_event("startup")
async def startup_event():
    """Initialize Pinecone and embedding model on startup"""
    global embedding_model, pinecone_index
    
    try:
        if not AppConfig.PINECONE_API_KEY:
            raise ValueError("❌ PINECONE_API_KEY not found in environment variables")
        
        if not AppConfig.CREDENTIAL:
            raise ValueError(f"❌ {AppConfig.PROVIDER.upper()}_API_KEY not found in environment variables")
        
        # Initialize Pinecone with gRPC
        pc = Pinecone(api_key=AppConfig.PINECONE_API_KEY)  # Now using gRPC client
        pinecone_index = pc.Index(AppConfig.PINECONE_INDEX_NAME)
        
        # Initialize HuggingFace embeddings
        embedding_model = HuggingFaceEmbeddings(
            model_name=AppConfig.EMBEDDING_MODEL,
            model_kwargs={'device': 'cpu'},
            encode_kwargs={'normalize_embeddings': True}
        )
        
        print("\n" + "="*60)
        print("✅ RAG components initialized successfully")
        print(f"✅ Pinecone index '{AppConfig.PINECONE_INDEX_NAME}' connected (gRPC)")
        print(f"✅ Embedding model: {AppConfig.EMBEDDING_MODEL}")
        print(f"✅ Default provider: {AppConfig.PROVIDER}")
        print(f"✅ Validator URL: {AppConfig.VALIDATOR_URL}")
        print("="*60 + "\n")
        
    except Exception as e:
        print(f"❌ Initialization error: {e}")
        raise

async def validate_credential(provider: str, credential: str, validator_url: str) -> dict:
    """Call external validator API to check if credential is valid"""
    try:
        async with httpx.AsyncClient(timeout=30.0) as client:
            response = await client.post(
                validator_url,
                json={
                    "provider": provider,
                    "api_key": credential
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
    except httpx.RequestError as e:
        return {
            "status": "error",
            "message": "❌ Failed to connect to validator API",
            "details": str(e)
        }
    except Exception as e:
        return {
            "status": "error",
            "message": "❌ Unexpected error during validation",
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
    """
    Retrieve relevant context from Pinecone using embeddings
    
    Args:
        query_text: User query string
        top_k: Number of top results to retrieve
        
    Returns:
        tuple: (context_string, list_of_matches)
    """
    try:
        if embedding_model is None:
            raise HTTPException(
                status_code=500,
                detail="Embedding model not initialized"
            )
        
        if pinecone_index is None:
            raise HTTPException(
                status_code=500,
                detail="Pinecone index not initialized"
            )
        
        # Generate query embedding
        query_vector = embedding_model.embed_query(query_text)
        
        # Query Pinecone
        results = pinecone_index.query(
            vector=query_vector,
            top_k=top_k,
            include_metadata=True
        )
        
        # Check if we got results
        if not results.get('matches'):
            return "No relevant context found.", []
        
        # Format context MATCHING STREAMLIT LOGIC
        context_parts = []
        matches_list = []
        
        for i, match in enumerate(results['matches']):
            metadata = match.get('metadata', {})
            
            # Use the CORRECT field names from your Pinecone data
            page_number = metadata.get('page_number', 'N/A')
            url = metadata.get('url', 'N/A')
            content = metadata.get('content', '')  # Changed from 'text' to 'content'
            
            if content:
                # Format context exactly like Streamlit
                context_parts.append(
                    f"Page Number: {page_number}\n"
                    f"URL: {url}\n"
                    f"Content: {content}"
                )
                
                matches_list.append(
                    SourceMatch(
                        id=match.get('id', 'Unknown'),
                        page_number=str(page_number),  # Changed from url to page_number
                        score=round(match.get('score', 0.0), 4),
                        preview=content[:200] + "..." if len(content) > 200 else content
                    )
                )
        
        context = "\n\n".join(context_parts) if context_parts else "No relevant context found."
        
        return context, matches_list
        
    except HTTPException:
        raise
    except Exception as e:
        raise HTTPException(
            status_code=500,
            detail=f"Context retrieval error: {str(e)}"
        )

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
            raise HTTPException(
                status_code=400,
                detail=f"Unsupported provider: {provider}"
            )
        
        return llm
        
    except HTTPException:
        raise
    except Exception as e:
        raise HTTPException(
            status_code=500,
            detail=f"LLM initialization failed: {str(e)}"
        )

@app.post("/query", response_model=QueryResponse)
async def process_query(request: QueryRequest):
    """Process query with RAG pipeline"""
    
    provider = AppConfig.PROVIDER
    credential = AppConfig.CREDENTIAL
    validator_url = AppConfig.VALIDATOR_URL
    top_k = AppConfig.TOP_K
    
    # Validate credential
    validation_result = await validate_credential(
        provider=provider,
        credential=credential,
        validator_url=validator_url
    )
    
    if validation_result["status"] != "success":
        return QueryResponse(
            status=validation_result["status"],
            message=validation_result["message"],
            content="",
            sources=None
        )
    
    try:
        llm = initialize_llm(provider, credential)
        query_type = classify_query(request.query)
        output_parser = StrOutputParser()
        
        if query_type == "conversational":
            conversational_prompt = ChatPromptTemplate.from_messages([
                ('system', '''You are an intelligent, enterprise-grade AI assistant for Startsmartz Technologies.

Core Identity:
- You represent Startsmartz Technologies and provide helpful assistance.
- You were developed by Startsmartz Technologies' AI team.
- Your primary purpose is to answer questions about the company's products, services, policies, and operations.

Response Guidelines for Greetings & Conversational Queries:
- Respond warmly and professionally to greetings like "Hi", "Hello", "How are you".
- When asked "Who are you?": Explain you're an AI assistant for Startsmartz Technologies Ltd designed to help with company-related information.
- When asked "Who developed you?": Mention you were developed by Startsmartz Technologies.
- When asked about your capabilities: Explain you can answer questions about Startsmartz Technologies's products, services, policies, and general company information.

Tone & Style:
- Professional yet conversational and friendly.
- Clear and concise.
- Helpful and welcoming.'''),
                ('human', '{question}')
            ])
            
            chain = conversational_prompt | llm | output_parser
            response = chain.invoke({"question": request.query})
            
            return QueryResponse(
                status="success",
                message="✅ Query processed successfully",
                content=response,
                sources=None
            )
        
        else:
            # UPDATED PROMPT TO MATCH STREAMLIT FORMAT
            knowledge_prompt = ChatPromptTemplate.from_messages([
                ('system', 'You are a Smart AI RAG-based assistant. Please answer the query based on the question.'),
                ('human', '''Answer the question "{question}" based **only** on the provided context: {context}.
            If the content is insufficient, say "I don't have enough knowledge based on the document."''')
            ])

            
            chain = knowledge_prompt | llm | output_parser
            
            # Get context from Pinecone
            context, matches = get_context(request.query, top_k)
            
            # Generate response
            response = chain.invoke({
                "question": request.query,
                "context": context
            })
            
            return QueryResponse(
                status="success",
                message="✅ Query processed successfully",
                content=response,
                sources=matches if matches else None
            )
    
    except HTTPException as he:
        raise he
    
    except Exception as e:
        print(f"Error processing query: {str(e)}")
        raise HTTPException(
            status_code=500,
            detail=f"An error occurred while processing your query: {str(e)}"
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
            "top_k": AppConfig.TOP_K,
            "index_name": AppConfig.PINECONE_INDEX_NAME,
            "client_type": "gRPC"
        }
    }

@app.get("/")
async def root():
    """Root endpoint with API information"""
    return {
        "message": "RAG Assistant API with Credential Validation",
        "version": "1.0.0",
        "vector_database": "Pinecone (gRPC)",
        "embedding_model": AppConfig.EMBEDDING_MODEL,
        "default_provider": AppConfig.PROVIDER,
        "endpoints": {
            "/query": "POST - Process user query with RAG (only 'query' field required)",
            "/health": "GET - Health check",
            "/docs": "GET - Interactive API documentation"
        }
    }

if __name__ == "__main__":
    # Determine server port first so ngrok (if used) forwards to the
    # actual port the server will listen on. You can override PORT or
    # LOCAL_PORT via environment variables. LOCAL_PORT takes precedence
    # for the ngrok tunnel if explicitly set, otherwise it defaults to
    # the server PORT.
    port = int(os.getenv("PORT", "8010"))
    # If LOCAL_PORT is set, use it for ngrok; otherwise default to server port
    local_port = int(os.getenv("LOCAL_PORT", str(port)))

    # Optional ngrok for local development. Enable by setting USE_NGROK=true
    if os.getenv("USE_NGROK", "true").lower() in ("1", "true", "yes"):
        try:
            from pyngrok import ngrok
            import nest_asyncio

            public_url = ngrok.connect(local_port)
            print("\n" + "="*60)
            print(f"🌐 Public URL: {public_url.public_url}")
            print(f"📚 API Docs: {public_url.public_url}/docs")
            print(f"🔍 Health Check: {public_url.public_url}/health")
            print("="*60 + "\n")

            nest_asyncio.apply()
        except Exception as e:
            print("ngrok setup skipped or failed:", e)

    uvicorn.run(app, host="0.0.0.0", port=port, log_level="info")