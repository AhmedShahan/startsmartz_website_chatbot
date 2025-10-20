import streamlit as st
from pinecone.grpc import PineconeGRPC as Pinecone
from langchain_community.embeddings import HuggingFaceEmbeddings
from langchain.prompts import ChatPromptTemplate
from langchain_core.output_parsers import StrOutputParser
from langchain_google_genai import ChatGoogleGenerativeAI
import os 
from dotenv import load_dotenv
from datetime import datetime

load_dotenv()

# Page Configuration
st.set_page_config(
    page_title="🤖 RAG Assistant",
    page_icon="🤖",
    layout="wide",
    initial_sidebar_state="expanded"
)

# Simplified Custom CSS
st.markdown("""
    <style>
    .stApp {
        background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
    }
    
    .user-msg {
        background-color: #667eea;
        padding: 15px;
        border-radius: 10px;
        margin: 10px 0;
        color: white;
    }
    
    .bot-msg {
        background-color: white;
        padding: 15px;
        border-radius: 10px;
        margin: 10px 0;
        color: #333;
    }
    </style>
""", unsafe_allow_html=True)

# Initialize session state
if 'messages' not in st.session_state:
    st.session_state.messages = []
if 'query_count' not in st.session_state:
    st.session_state.query_count = 0

# Initialize components
@st.cache_resource
def init_rag():
    try:
        api_key = os.getenv("PINECONE_API_KEY")
        pc = Pinecone(api_key=api_key)
        index = pc.Index("vivasoft")
        embedding = HuggingFaceEmbeddings(model_name="sentence-transformers/all-MiniLM-L6-v2")
        llm = ChatGoogleGenerativeAI(model="gemini-2.5-flash", temperature=0.9)
        return index, embedding, llm
    except Exception as e:
        st.error(f"Initialization Error: {e}")
        return None, None, None

index, embedding, llm = init_rag()

def get_context(query_text, top_k=5):
    query_vector = embedding.embed_query(query_text)
    results = index.query(vector=query_vector, top_k=top_k, include_metadata=True)
    
    context = "\n\n".join([
        f"Page Number: {match['metadata'].get('page_number', 'N/A')}\n"
        f"URL: {match['metadata'].get('url', 'N/A')}\n"
        f"Content: {match['metadata'].get('content', '')}"
        for match in results['matches']
    ])
    return context, results['matches']

def rag_answer(query, top_k=5):
    MessageRag = [
        ('system', 'You are a Smart AI RAG-based assistant. Please answer the query based on the question.'),
        ('human', '''Answer the Question {question} ONLY based on the provided context {context}.
        If the content is insufficient, say "I don't have enough knowledge based on the document."
        
        Provide Response in this format point bby ppoint is short but brief
         ''')
    ]
    
    prompt = ChatPromptTemplate.from_messages(MessageRag)
    chain = prompt | llm | StrOutputParser()
    
    context, matches = get_context(query, top_k)
    result = chain.invoke({"question": query, "context": context})
    
    return result, matches

# Sidebar
with st.sidebar:
    st.title("⚙️ Settings")
    
    top_k = st.slider("Context Results", 1, 10, 5)
    
    st.divider()
    
    st.subheader("📊 Stats")
    st.metric("Total Queries", st.session_state.query_count)
    st.metric("Messages", len(st.session_state.messages))
    
    st.divider()
    
    if st.button("🗑️ Clear Chat", use_container_width=True):
        st.session_state.messages = []
        st.session_state.query_count = 0
        st.success("Chat cleared!")
    
    st.divider()
    st.info("**Powered by:**\n- Pinecone 🌲\n- HuggingFace 🤗\n- Gemini ✨")

# Main area
st.title("🤖 Smart RAG Assistant")
st.markdown("Ask me anything about your documents!")

if index and embedding and llm:
    st.success("✅ System Ready")
else:
    st.error("❌ System Error - Check your API keys")
    st.stop()

# Display chat messages
for msg in st.session_state.messages:
    if msg['role'] == 'user':
        st.markdown(f"""
            <div class="user-msg">
                <strong>👨‍💻 You:</strong> {msg['content']}
            </div>
        """, unsafe_allow_html=True)
    else:
        st.markdown(f"""
            <div class="bot-msg">
                <strong>🤖 Assistant:</strong><br>{msg['content']}
            </div>
        """, unsafe_allow_html=True)
        
        if 'sources' in msg and msg['sources']:
            with st.expander("📚 View Sources"):
                for i, match in enumerate(msg['sources'], 1):
                    metadata = match.get('metadata', {})
                    st.write(f"**Source {i}** (Score: {match.get('score', 0):.3f})")
                    st.write(f"- Page: {metadata.get('page_number', 'N/A')}")
                    st.write(f"- URL: {metadata.get('url', 'N/A')}")
                    st.write(f"- Content: {metadata.get('content', '')[:150]}...")
                    st.divider()

# Chat input
st.divider()

query = st.chat_input("Type your question here...")

if query:
    # Add user message
    st.session_state.messages.append({
        'role': 'user',
        'content': query
    })
    
    # Get response
    with st.spinner("🔍 Searching..."):
        try:
            answer, sources = rag_answer(query, top_k)
            
            st.session_state.messages.append({
                'role': 'assistant',
                'content': answer,
                'sources': sources
            })
            
            st.session_state.query_count += 1
            st.rerun()
            
        except Exception as e:
            st.error(f"Error: {e}")

# Quick examples
st.divider()
st.markdown("### 🎯 Try these examples:")

col1, col2, col3 = st.columns(3)

with col1:
    if st.button("💡 What are the main features?", use_container_width=True):
        st.session_state.messages.append({'role': 'user', 'content': 'What are the main features?'})
        with st.spinner("Processing..."):
            answer, sources = rag_answer('What are the main features?', top_k)
            st.session_state.messages.append({'role': 'assistant', 'content': answer, 'sources': sources})
            st.session_state.query_count += 1
        st.rerun()

with col2:
    if st.button("📝 Explain the process", use_container_width=True):
        st.session_state.messages.append({'role': 'user', 'content': 'Explain the process'})
        with st.spinner("Processing..."):
            answer, sources = rag_answer('Explain the process', top_k)
            st.session_state.messages.append({'role': 'assistant', 'content': answer, 'sources': sources})
            st.session_state.query_count += 1
        st.rerun()

with col3:
    if st.button("🔍 Show requirements", use_container_width=True):
        st.session_state.messages.append({'role': 'user', 'content': 'Show me the requirements'})
        with st.spinner("Processing..."):
            answer, sources = rag_answer('Show me the requirements', top_k)
            st.session_state.messages.append({'role': 'assistant', 'content': answer, 'sources': sources})
            st.session_state.query_count += 1
        st.rerun()
