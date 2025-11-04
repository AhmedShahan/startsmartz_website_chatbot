from pinecone.grpc import PineconeGRPC as Pinecone
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
import re
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
    page_number: str
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
    TOP_K = int(os.getenv("TOP_K", "20"))
    PINECONE_API_KEY = os.getenv("PINECONE_API_KEY")
    PINECONE_INDEX_NAME = "startsmartz"
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
        pc = Pinecone(api_key=AppConfig.PINECONE_API_KEY)
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

def expand_query_with_synonyms(query: str) -> str:
    """
    Expand query with business synonyms and abbreviations for better retrieval
    """
    query_lower = query.lower()
    
    # Executive title expansions
    title_mappings = {
        r'\bcto\b': 'CTO Chief Technology Officer Chief Technological Officer',
        r'\bceo\b': 'CEO Chief Executive Officer',
        r'\bmd\b': 'MD Managing Director',
        r'\bed\b': 'ED Executive Director',
        r'\bcfo\b': 'CFO Chief Financial Officer',
        r'\bcoo\b': 'COO Chief Operating Officer',
        r'\bcmo\b': 'CMO Chief Marketing Officer',
    }
    
    # Location/Address synonyms
    location_mappings = {
        r'\boffice address\b': 'office address office location headquarters address company address',
        r'\boffice location\b': 'office location office address headquarters location company location',
        r'\bheadquarters\b': 'headquarters office address office location main office',
    }
    
    # Technology synonyms
    tech_mappings = {
        r'\btech stack\b': 'tech stack technology stack technology products technical stack',
        r'\btechnology stack\b': 'technology stack tech stack technology products technical products',
        r'\btechnology products\b': 'technology products tech stack technology stack products',
    }
    
    # Job/Career synonyms
    job_mappings = {
        r'\bjob\b': 'job vacancy position opening career opportunity employment',
        r'\bvacancy\b': 'vacancy job opening position available role',
        r'\bhiring\b': 'hiring recruiting job opening vacancy position',
        r'\bcareer\b': 'career job opportunity position employment',
    }
    
    expanded_query = query
    
    # Apply all mappings
    all_mappings = {**title_mappings, **location_mappings, **tech_mappings, **job_mappings}
    
    for pattern, expansion in all_mappings.items():
        if re.search(pattern, query_lower):
            expanded_query += f" {expansion}"
    
    return expanded_query

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

def clean_metadata_content(content: str) -> str:
    """
    Clean content to remove table names, SQL artifacts, and technical identifiers
    """
    if not content:
        return content
    
    # Remove SQL statements
    content = re.sub(r'LOCK TABLES.*?;', '', content, flags=re.IGNORECASE | re.DOTALL)
    content = re.sub(r'UNLOCK TABLES.*?;', '', content, flags=re.IGNORECASE | re.DOTALL)
    content = re.sub(r'INSERT INTO.*?;', '', content, flags=re.IGNORECASE | re.DOTALL)
    
    # Remove table name patterns
    content = re.sub(r'\b[a-z_]+_table\b', '', content, flags=re.IGNORECASE)
    content = re.sub(r'\btable:`[^`]+`', '', content)
    content = re.sub(r'from `[^`]+`', '', content, flags=re.IGNORECASE)
    
    # Remove technical artifacts
    content = re.sub(r'`[a-z_]+`\s+WRITE', '', content, flags=re.IGNORECASE)
    content = re.sub(r'\bid\s*:\s*\d+', '', content, flags=re.IGNORECASE)
    
    # Clean up extra whitespace
    content = re.sub(r'\s+', ' ', content)
    content = content.strip()
    
    return content

def get_context(query_text: str, top_k: int = 3) -> tuple:
    """
    Retrieve relevant context from Pinecone using embeddings with query expansion
    
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
        
        # Expand query with synonyms for better retrieval
        expanded_query = expand_query_with_synonyms(query_text)
        
        # Generate query embedding using expanded query
        query_vector = embedding_model.embed_query(expanded_query)
        
        # Query Pinecone
        results = pinecone_index.query(
            vector=query_vector,
            top_k=top_k,
            include_metadata=True
        )
        
        # Check if we got results
        if not results.get('matches'):
            return "No relevant context found.", []
        
        # Format context with cleaned content
        context_parts = []
        matches_list = []
        
        for i, match in enumerate(results['matches']):
            metadata = match.get('metadata', {})
            
            page_number = metadata.get('page_number', 'N/A')
            url = metadata.get('url', 'N/A')
            content = metadata.get('content', '')
            
            # Clean the content to remove technical artifacts
            cleaned_content = clean_metadata_content(content)
            
            if cleaned_content:
                context_parts.append(
                    f"Source {i+1}:\n"
                    f"Page: {page_number}\n"
                    f"Reference: {url}\n"
                    f"Information: {cleaned_content}"
                )
                
                matches_list.append(
                    SourceMatch(
                        id=match.get('id', 'Unknown'),
                        page_number=str(page_number),
                        score=round(match.get('score', 0.0), 4),
                        preview=cleaned_content[:200] + "..." if len(cleaned_content) > 200 else cleaned_content
                    )
                )
        
        context = "\n\n---\n\n".join(context_parts) if context_parts else "No relevant context found."
        
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
                model="gemini-2.5-pro",
                google_api_key=credential,
                temperature=0.9
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
- When asked "Who are you?": Explain you're an AI assistant for Startsmartz Technologies designed to help with company-related information.
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
            # ENHANCED KNOWLEDGE-BASED PROMPT
            knowledge_prompt = ChatPromptTemplate.from_messages([
                ('system', '''You are a Smart AI RAG-based assistant for Startsmartz Technologies.

CRITICAL INSTRUCTIONS - READ CAREFULLY:

1. **Use ONLY the provided context** to answer questions. Do not use external knowledge.

2. **Executive Title Understanding:**
   - CEO = Chief Executive Officer
   - CTO = Chief Technology Officer / Chief Technological Officer
   - MD = Managing Director
   - ED = Executive Director
   - CFO = Chief Financial Officer
   Always recognize these abbreviations and their full forms as equivalent.

3. **Location Terminology:**
   - "Office address", "office location", "headquarters", and "company address" all refer to the SAME thing
   - When asked about any of these, provide the complete address information

4. **Technology/Product Terminology:**
   - "Technology products", "tech stack", "technology stack", and "technical stack" all refer to the SAME thing
   - These terms are interchangeable - treat them as synonyms
   - **IMPORTANT**: When asked about technologies/tech stack/products, ALWAYS present them as a bulleted list, one per line
   - Format: "Startsmartz Technologies uses the following technologies:\n- Technology 1\n- Technology 2\n- Technology 3"

5. **Job/Career Terminology:**
   - "Job openings", "vacancies", "positions", "career opportunities", and "hiring" all refer to the SAME thing
   - When asked about any job-related query, reference available positions

6. **NEVER mention or include:**
   - Table names (e.g., "our_leadership_team_member", "team_member", "job_offer", "technology_product")
   - Database identifiers or IDs
   - SQL statements or technical artifacts
   - Any backend system references

7. **Data Source Distinction:**
   - Different data sources contain different types of information
   - Do not confuse leadership information with general team member information
   - Do not mix job posting data with employee data

8. **Response Style:**
   - Provide natural, conversational answers
   - Be specific and accurate
   - For technology listings: Use bulleted lists (markdown format with "- " prefix)
   - If the context doesn't contain the answer, clearly state: "I don't have that information in the available documents."
   - Never fabricate or hallucinate information not in the context'''),
                ('human', '''Question: {question}

Context Information:
{context}

Instructions:
- Answer based ONLY on the context above
- Understand synonym relationships (CEO/Chief Executive Officer, office address/office location, tech stack/technology products, jobs/vacancies)
- **CRITICAL**: If the question is about technologies/tech stack/technology products, format your response as a bulleted list with each technology on a separate line
- Do not mention any technical database terms or table names
- If insufficient information, say "I don't have enough information about that in the available documents."

Example format for technology questions:
"Startsmartz Technologies uses the following technologies:
- Technology A
- Technology B
- Technology C"''')
            ])
            
            chain = knowledge_prompt | llm | output_parser
            
            # Get context from Pinecone with expanded query
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
    port = int(os.getenv("PORT", "8010"))
    local_port = int(os.getenv("LOCAL_PORT", str(port)))

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