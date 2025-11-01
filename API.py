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
from datetime import datetime
import uvicorn
import os
from dotenv import load_dotenv

load_dotenv()

# Initialize FastAPI app
app = FastAPI(
    title="Startsmartz RAG Chat API",
    description="Interactive RAG-powered chat API with conversational AI and knowledge retrieval",
    version="2.0.0"
)

# CORS middleware
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

# Configuration
class AppConfig:
    PROVIDER = "gemini"
    CREDENTIAL = os.getenv("GOOGLE_API_KEY")
    TOP_K = int(os.getenv("TOP_K", "10"))
    PINECONE_API_KEY = os.getenv("PINECONE_API_KEY")
    PINECONE_INDEX_NAME = "startsmartz"
    EMBEDDING_MODEL = "sentence-transformers/all-MiniLM-L6-v2"

# Request Models
class ChatRequest(BaseModel):
    query: str = Field(..., description="User query", min_length=1)
    session_id: Optional[str] = Field(None, description="Optional session ID for conversation tracking")

class ChatHistoryRequest(BaseModel):
    session_id: str = Field(..., description="Session ID to retrieve history")

# Response Models
class SourceInfo(BaseModel):
    page: str
    score: float
    preview: str

class ChatResponse(BaseModel):
    response: str = Field(..., description="AI assistant response in Markdown format")
    query_type: str = Field(..., description="Type of query: conversational or knowledge_based")
    sources: Optional[List[SourceInfo]] = Field(None, description="Source references for knowledge-based queries")
    timestamp: str = Field(..., description="Response timestamp")
    session_id: Optional[str] = Field(None, description="Session identifier")

class HistoryItem(BaseModel):
    timestamp: str
    user_message: str
    assistant_response: str
    query_type: str

class ChatHistoryResponse(BaseModel):
    session_id: str
    history: List[HistoryItem]
    total_messages: int

# Global variables
embedding_model = None
pinecone_index = None
llm = None
conversation_sessions = {}  # Store conversation history by session_id

@app.on_event("startup")
async def startup_event():
    """Initialize Pinecone, embeddings, and LLM on startup"""
    global embedding_model, pinecone_index, llm
    
    try:
        # Check credentials
        if not AppConfig.PINECONE_API_KEY:
            raise ValueError("❌ PINECONE_API_KEY not found in environment variables")
        
        if not AppConfig.CREDENTIAL:
            raise ValueError(f"❌ {AppConfig.PROVIDER.upper()}_API_KEY not found")
        
        # Initialize Pinecone
        pc = Pinecone(api_key=AppConfig.PINECONE_API_KEY)
        pinecone_index = pc.Index(AppConfig.PINECONE_INDEX_NAME)
        
        # Initialize embeddings
        embedding_model = HuggingFaceEmbeddings(
            model_name=AppConfig.EMBEDDING_MODEL,
            model_kwargs={'device': 'cpu'},
            encode_kwargs={'normalize_embeddings': True}
        )
        
        # Initialize LLM
        if AppConfig.PROVIDER == "gemini":
            llm = ChatGoogleGenerativeAI(
                model="gemini-2.0-flash-exp",
                google_api_key=AppConfig.CREDENTIAL,
                temperature=0.9
            )
        elif AppConfig.PROVIDER == "openai":
            llm = ChatOpenAI(
                model="gpt-4o-mini",
                api_key=AppConfig.CREDENTIAL,
                temperature=0.7
            )
        elif AppConfig.PROVIDER == "cohere":
            llm = ChatCohere(
                model="command-r-plus",
                cohere_api_key=AppConfig.CREDENTIAL,
                temperature=0.7
            )
        
        print("\n" + "="*60)
        print("✅ RAG Chat components initialized successfully")
        print(f"✅ Pinecone index '{AppConfig.PINECONE_INDEX_NAME}' connected (gRPC)")
        print(f"✅ Embedding model: {AppConfig.EMBEDDING_MODEL}")
        print(f"✅ LLM provider: {AppConfig.PROVIDER}")
        print("="*60 + "\n")
        
    except Exception as e:
        print(f"❌ Initialization error: {e}")
        raise

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

def get_context(query_text: str, top_k: int = 10):
    """Retrieve relevant context from Pinecone"""
    try:
        if embedding_model is None or pinecone_index is None:
            raise HTTPException(
                status_code=500,
                detail="RAG components not initialized"
            )
        
        query_vector = embedding_model.embed_query(query_text)
        results = pinecone_index.query(
            vector=query_vector,
            top_k=top_k,
            include_metadata=True
        )
        
        if not results.get('matches'):
            return "No relevant context found.", []
        
        context_parts = []
        sources = []
        
        for match in results['matches']:
            metadata = match.get('metadata', {})
            page_number = metadata.get('page_number', 'N/A')
            url = metadata.get('url', 'N/A')
            content = metadata.get('content', '')
            
            if content:
                context_parts.append(
                    f"Page Number: {page_number}\n"
                    f"URL: {url}\n"
                    f"Content: {content}"
                )
                sources.append(SourceInfo(
                    page=str(page_number),
                    score=round(match.get('score', 0.0), 4),
                    preview=content[:150] + "..." if len(content) > 150 else content
                ))
        
        context = "\n\n".join(context_parts) if context_parts else "No relevant context found."
        return context, sources
        
    except HTTPException:
        raise
    except Exception as e:
        raise HTTPException(
            status_code=500,
            detail=f"Context retrieval error: {str(e)}"
        )

def generate_conversational_response(query: str):
    """Generate conversational response"""
    prompt = ChatPromptTemplate.from_messages([
        ('system', '''You are an intelligent, friendly AI assistant for Startsmartz Technologies.

Response Format - ABSOLUTELY CRITICAL:
YOU MUST FORMAT YOUR ENTIRE RESPONSE IN PURE MARKDOWN WITH EMOJIS/ICONS.

Required Markdown Format with Icons:
Use emojis and icons strategically to make responses engaging and visual:
- 🎯 for key points or focus areas
- ✨ for features or highlights
- 💡 for insights or tips
- 🚀 for capabilities or services
- 📊 for data/analytics related
- 🔧 for technical details
- 💼 for business aspects
- 🌟 for special mentions
- ✅ for confirmations
- 📝 for documentation/details
- 🤝 for partnerships/collaboration
- 💻 for technology
- 🎨 for design/creative
- 📱 for mobile/apps
- 🔒 for security
- ⚡ for performance/speed

Structure your response with proper markdown:
# Main Title (when appropriate)
## Section Title
### Subsection

Use **bold** for emphasis
Use *italic* for subtle emphasis
Use `code` for technical terms

Use bullet points with icons:
- 🎯 **Point title:** Description
- ✨ **Another point:** More details

Core Identity:
- You represent Startsmartz Technologies with warmth and professionalism
- You were developed by Startsmartz Technologies' AI team
- You help with questions about products, services, policies, and operations

Personality & Tone:
- Be conversational, warm, and personable - like talking to a helpful colleague
- Use natural language with emojis and icons to make it visual and engaging
- Show enthusiasm and genuine interest in helping
- Be concise but thorough - aim for 2-4 sentences for greetings, more for detailed questions
- Add personal touches like "I'd love to help you with that!" or "Great question!"

Response Guidelines:
- For greetings: Respond warmly and offer help
- For identity questions: Explain who you are with personality
- For capability questions: Share what you can do enthusiastically  
- For thanks: Be gracious and offer continued assistance
- For goodbyes: Be warm and welcoming for future conversations

IMPORTANT: End conversational responses with a natural closing question or offer to help.

Always sound like a real person having a genuine conversation, not a scripted bot.
Output PURE MARKDOWN - no HTML, no terminal codes.'''),
        ('human', '{question}')
    ])
    
    chain = prompt | llm | StrOutputParser()
    response = chain.invoke({"question": query})
    
    return response, []

def generate_knowledge_response(query: str):
    """Generate knowledge-based response using RAG"""
    context, sources = get_context(query, AppConfig.TOP_K)
    
    prompt = ChatPromptTemplate.from_messages([
        ('system', '''You are a knowledgeable, insightful AI assistant for Startsmartz Technologies.

Response Format - ABSOLUTELY CRITICAL:
YOU MUST FORMAT YOUR ENTIRE RESPONSE IN PURE MARKDOWN WITH STRATEGIC USE OF EMOJIS/ICONS.

Icon Guide (use these strategically):
- 🎯 Key points/focus areas
- ✨ Features/highlights
- 💡 Insights/understanding
- 🚀 Services/capabilities
- 📊 Data/analytics
- 🔧 Technical details
- 💼 Business aspects
- 🌟 Special mentions
- ✅ Confirmations/positives
- 📝 Documentation
- 🤝 Partnerships
- 💻 Technology
- 🎨 Design/creative
- 📱 Mobile/apps
- 🔒 Security
- ⚡ Performance/speed
- 🏢 Company/organization
- 🌍 Global/reach
- 👥 Team/people
- 📈 Growth/progress

Required Markdown Structure:
# Main Title

Opening paragraph introducing the topic.

## Section Title

Use bullet points with icons and bold text:
- 🎯 **Key concept:** Explanation with supporting details that provide depth and context.
- ✨ **Another aspect:** More information here with thorough coverage.

Continue with natural paragraphs for analysis and insights.

### Subsection Title

More detailed breakdown here.

Use numbered lists when showing steps or priorities:
1. 🔧 **First thing:** Details about this aspect
2. 📊 **Second area:** More information here

## My Assessment

Final thoughts, analysis, and interpretation.

If you'd like, I can [specific offer 1], [specific offer 2], or [specific offer 3]. Would any of that be helpful?

Response Style:
- Write in a natural, analytical yet conversational tone
- Structure your response with clear markdown headers (#, ##, ###)
- Use bullet points with icons for visual appeal and clarity
- Use **bold** for emphasis on key terms and concepts
- Balance factual information with thoughtful analysis
- Be thorough but not overwhelming

Critical Requirements:
- Base your response ONLY on the provided context from the knowledge base
- If information is incomplete, acknowledge it honestly and suggest areas to explore
- Don't cite sources or mention "according to documentation"
- Use proper markdown formatting throughout
- Add relevant emojis/icons to section headers and bullet points
- ALWAYS end with a thoughtful paragraph offering to dig deeper
- Output PURE MARKDOWN - no HTML tags, no terminal color codes

ENTIRE RESPONSE MUST BE PURE MARKDOWN WITH STRATEGIC EMOJI USE.'''),
        ('human', '''Question: "{question}"

Context from our knowledge base:
{context}

Please provide a comprehensive, insightful answer in pure Markdown format with natural follow-up suggestions at the end.''')
    ])
    
    chain = prompt | llm | StrOutputParser()
    response = chain.invoke({
        "question": query,
        "context": context
    })
    
    return response, sources

@app.post("/query", response_model=ChatResponse)
async def query(request: ChatRequest):
    """Process query and return AI response"""
    try:
        if llm is None:
            raise HTTPException(
                status_code=500,
                detail="LLM not initialized"
            )
        
        # Classify query type
        query_type = classify_query(request.query)
        
        # Generate response based on query type
        if query_type == "conversational":
            response, sources = generate_conversational_response(request.query)
        else:
            response, sources = generate_knowledge_response(request.query)
        
        # Store in conversation history if session_id provided
        timestamp = datetime.now().isoformat()
        if request.session_id:
            if request.session_id not in conversation_sessions:
                conversation_sessions[request.session_id] = []
            
            conversation_sessions[request.session_id].append({
                'timestamp': timestamp,
                'user_message': request.query,
                'assistant_response': response,
                'query_type': query_type
            })
        
        return ChatResponse(
            response=response,
            query_type=query_type,
            sources=sources if sources else None,
            timestamp=timestamp,
            session_id=request.session_id
        )
        
    except HTTPException:
        raise
    except Exception as e:
        raise HTTPException(
            status_code=500,
            detail=f"Error processing chat: {str(e)}"
        )

@app.post("/history", response_model=ChatHistoryResponse)
async def get_chat_history(request: ChatHistoryRequest):
    """Retrieve chat history for a session"""
    if request.session_id not in conversation_sessions:
        raise HTTPException(
            status_code=404,
            detail=f"No conversation history found for session: {request.session_id}"
        )
    
    history = conversation_sessions[request.session_id]
    
    return ChatHistoryResponse(
        session_id=request.session_id,
        history=[
            HistoryItem(
                timestamp=item['timestamp'],
                user_message=item['user_message'],
                assistant_response=item['assistant_response'],
                query_type=item['query_type']
            )
            for item in history
        ],
        total_messages=len(history)
    )

@app.delete("/history/{session_id}")
async def clear_chat_history(session_id: str):
    """Clear chat history for a session"""
    if session_id in conversation_sessions:
        del conversation_sessions[session_id]
        return {"message": f"History cleared for session: {session_id}"}
    else:
        raise HTTPException(
            status_code=404,
            detail=f"No conversation history found for session: {session_id}"
        )

@app.get("/sessions")
async def list_sessions():
    """List all active conversation sessions"""
    return {
        "active_sessions": list(conversation_sessions.keys()),
        "total_sessions": len(conversation_sessions)
    }

@app.get("/health")
async def health_check():
    """Health check endpoint"""
    return {
        "status": "healthy",
        "embedding_model": "loaded" if embedding_model else "not loaded",
        "pinecone_index": "connected" if pinecone_index else "not connected",
        "llm": "initialized" if llm else "not initialized",
        "config": {
            "provider": AppConfig.PROVIDER,
            "top_k": AppConfig.TOP_K,
            "index_name": AppConfig.PINECONE_INDEX_NAME,
            "client_type": "gRPC"
        },
        "active_sessions": len(conversation_sessions)
    }

@app.get("/")
async def root():
    """Root endpoint with API information"""
    return {
        "message": "Startsmartz RAG Chat API",
        "version": "2.0.0",
        "description": "Interactive RAG-powered conversational AI with knowledge retrieval",
        "features": [
            "Conversational AI with personality",
            "Knowledge-based RAG retrieval",
            "Session-based chat history",
            "Markdown-formatted responses with emojis",
            "Multi-source context retrieval"
        ],
        "endpoints": {
            "/query": "POST - Send a query message",
            "/history": "POST - Get chat history for a session",
            "/history/{session_id}": "DELETE - Clear chat history",
            "/sessions": "GET - List active sessions",
            "/health": "GET - Health check",
            "/docs": "GET - Interactive API documentation"
        }
    }

if __name__ == "__main__":
    port = int(os.getenv("PORT", "8020"))
    local_port = int(os.getenv("LOCAL_PORT", str(port)))

    # Optional ngrok for local development
    if os.getenv("USE_NGROK", "true").lower() in ("1", "true", "yes"):
        try:
            from pyngrok import ngrok
            import nest_asyncio

            public_url = ngrok.connect(local_port)
            print("\n" + "="*60)
            print("🌐 Startsmartz RAG Chat API")
            print("="*60)
            print(f"🔗 Public URL: {public_url.public_url}")
            print(f"📚 API Docs: {public_url.public_url}/docs")
            print(f"💬 Query Endpoint: {public_url.public_url}/query")
            print(f"🔍 Health Check: {public_url.public_url}/health")
            print("="*60 + "\n")

            nest_asyncio.apply()
        except Exception as e:
            print("ngrok setup skipped or failed:", e)

    uvicorn.run(app, host="0.0.0.0", port=port, log_level="info")