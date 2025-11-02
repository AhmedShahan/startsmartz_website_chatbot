import streamlit as st
import requests
from fpdf import FPDF
from io import BytesIO

st.set_page_config(page_title="Chatbot", page_icon="💬", layout="centered")
st.title("💬 Simple Chatbot")

# ✅ Your FastAPI endpoint via ngrok
API_URL = "https://768447384733.ngrok-free.app/query"

# Initialize session history
if "messages" not in st.session_state:
    st.session_state.messages = []

# Show previous chat messages
for chat in st.session_state.messages:
    with st.chat_message(chat["role"]):
        st.markdown(chat["content"])

# User input box
if prompt := st.chat_input("Ask me anything..."):
    # Add user message
    st.session_state.messages.append({"role": "user", "content": prompt})
    with st.chat_message("user"):
        st.markdown(prompt)

    # Send request to FastAPI
    try:
        payload = {"query": prompt}
        response = requests.post(API_URL, json=payload)
        response.raise_for_status()

        # Extract only the "content" field
        data = response.json()
        reply = data.get("content", "⚠️ No content returned from API.")
    except Exception as e:
        reply = f"❌ Error: {e}"

    # Display bot message
    st.session_state.messages.append({"role": "assistant", "content": reply})
    with st.chat_message("assistant"):
        st.markdown(reply)

# ---------------- PDF Export ----------------
def create_pdf(chat_history):
    pdf = FPDF()
    pdf.add_page()
    pdf.set_auto_page_break(auto=True, margin=15)

    pdf.set_font("Arial", "B", 16)
    pdf.cell(0, 10, "Chat Transcript", ln=True, align="C")
    pdf.ln(10)
    pdf.set_font("Arial", size=12)

    for chat in chat_history:
        role = "You" if chat["role"] == "user" else "Bot"
        pdf.set_text_color(0, 0, 255) if chat["role"] == "user" else pdf.set_text_color(0, 128, 0)
        pdf.multi_cell(0, 8, f"{role}: {chat['content']}")
        pdf.ln(4)

    pdf_buffer = BytesIO()
    pdf.output(pdf_buffer)
    pdf_buffer.seek(0)
    return pdf_buffer

# Download chat as PDF
if st.session_state.messages:
    st.markdown("---")
    st.subheader("📄 Export Chat History")
    if st.button("💾 Generate PDF"):
        pdf_buffer = create_pdf(st.session_state.messages)
        st.download_button(
            label="⬇️ Download Chat Transcript",
            data=pdf_buffer,
            file_name="chat_transcript.pdf",
            mime="application/pdf",
        )
