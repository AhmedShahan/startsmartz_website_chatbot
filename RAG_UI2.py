import streamlit as st
from pinecone.grpc import PineconeGRPC as Pinecone
from langchain_community.embeddings import HuggingFaceEmbeddings
from langchain.prompts import ChatPromptTemplate
from langchain_core.output_parsers import StrOutputParser
from langchain_google_genai import ChatGoogleGenerativeAI
import os
import time
from dotenv import load_dotenv


load_dotenv()


# Page Configuration
st.set_page_config(
    page_title="RAG Assistant",
    page_icon="💬",
    layout="centered"
)


# Custom CSS for black text and blue title
st.markdown("""
    <style>
    .stApp {
        background-color: #f5f5f5;
    }
    
    /* Make chat message text black */
    div[data-testid="stChatMessageContent"] p {
        color: #000000 !important;
    }
    
    /* Make all text black */
    .stMarkdown, .stText {
        color: #000000 !important;
    }
    </style>
""", unsafe_allow_html=True)


# Initialize session state
if 'messages' not in st.session_state:
    st.session_state.messages = []


# Initialize components
@st.cache_resource
def init_rag():
    try:
        api_key = os.getenv("PINECONE_API_KEY")
        pc = Pinecone(api_key=api_key)
        index = pc.Index("vivasoft")
        embedding = HuggingFaceEmbeddings(model_name="sentence-transformers/all-MiniLM-L6-v2")
        llm = ChatGoogleGenerativeAI(model="gemini-2.0-flash-exp", temperature=0.7)  # streaming=False
        return index, embedding, llm
    except Exception as e:
        st.error(f"Initialization Error: {e}")
        return None, None, None


index, embedding, llm = init_rag()


def classify_query(question):
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
    
    # Check if it's a simple greeting or conversational query
    if any(pattern in question_lower for pattern in conversational_patterns):
        return "conversational"
    
    # If query is very short (1-3 words) and matches greeting patterns
    if len(question_lower.split()) <= 3:
        for pattern in ['hi', 'hello', 'hey', 'thanks', 'bye', 'ok', 'okay']:
            if pattern == question_lower:
                return "conversational"
    
    return "knowledge_based"


def get_context(query_text, top_k=3):
    """Retrieve relevant context from Pinecone"""
    query_vector = embedding.embed_query(query_text)
    results = index.query(vector=query_vector, top_k=top_k, include_metadata=True)
    
    context = "\n\n".join([
        f"Content: {match['metadata'].get('content', '')}"
        for match in results['matches']
    ])
    return context, results['matches']


def typewriter_effect(text, delay):
    """Generator that yields characters one by one for typewriter effect"""
    for char in text:
        yield char
        time.sleep(delay)


# Sidebar
with st.sidebar:
    st.title("⚙️ Settings")
    top_k = st.slider("Sources to retrieve", 1, 5, 3)
    
    # Add streaming speed control
    st.divider()
    st.subheader("Typing Speed")
    speed = st.select_slider(
        "Typewriter speed",
        options=["Slow", "Medium", "Fast", "Instant"],
        value="Medium"
    )
    
    # Map speed to delay values (in seconds per character)
    speed_map = {
        "Slow": 0.05,
        "Medium": 0.02,
        "Fast": 0.01,
        "Instant": 0.001
    }
    st.session_state.typing_delay = speed_map[speed]
    
    st.divider()
    
    if st.button("🗑️ Clear Chat", use_container_width=True):
        st.session_state.messages = []
        st.rerun()


# Main UI with blue title
st.markdown("<h1 style='color: #0066CC;'>💬 RAG Assistant</h1>", unsafe_allow_html=True)


if not (index and embedding and llm):
    st.error("System initialization failed. Check your API keys.")
    st.stop()


# Display chat messages
for message in st.session_state.messages:
    with st.chat_message(message["role"]):
        st.markdown(message["content"])


# Chat input
if query := st.chat_input("Ask me anything..."):
    # Add user message
    st.session_state.messages.append({"role": "user", "content": query})
    with st.chat_message("user"):
        st.markdown(query)
    
    # Classify query type
    query_type = classify_query(query)
    
    # Stream assistant response
    with st.chat_message("assistant"):
        
        if query_type == "conversational":
            # Conversational response WITHOUT context retrieval and sources
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
            
            chain = conversational_prompt | llm | StrOutputParser()
            
            # Get full response (no streaming)
            full_response = chain.invoke({"question": query})
            
            # Display with typewriter effect
            response = st.write_stream(typewriter_effect(full_response, st.session_state.typing_delay))
        
        else:
            # Knowledge-based response WITH context retrieval and sources
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
1. Use ONLY the provided context to answer.
2. Structure your response clearly - use bullet points for multi-part answers.
3. If the context doesn't contain the answer, state: "I don't have that information in the company documents. Please reach out to the relevant contact for assistance."
4. Never make assumptions or provide information not present in the context.
5. Keep responses concise, accurate, and enterprise-appropriate.''')
            ])
            
            chain = knowledge_prompt | llm | StrOutputParser()
            context, matches = get_context(query, top_k)
            
            # Get full response (no streaming)
            full_response = chain.invoke({"question": query, "context": context})
            
            # Add sources to response
            sources_text = "\n\n---\n"
            for i, match in enumerate(matches[:2], 1):
                metadata = match.get('metadata', {})
                score = match.get('score', 0)
                sources_text += f"\n**Source {i}** (Score: {score:.2f})"
                if metadata.get('url'):
                    sources_text += f"\n- URL: {metadata['url']}"
                if metadata.get('page_number'):
                    sources_text += f"\n- Page: {metadata['page_number']}"
            
            complete_response = full_response + sources_text
            
            # Display with typewriter effect
            response = st.write_stream(typewriter_effect(complete_response, st.session_state.typing_delay))
    
    # Save assistant message
    st.session_state.messages.append({"role": "assistant", "content": response})
