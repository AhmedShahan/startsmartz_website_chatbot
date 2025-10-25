import cohere
from langchain_google_genai import ChatGoogleGenerativeAI
from langchain_openai import ChatOpenAI
from langchain_cohere import ChatCohere

# provider name lists (avoid shadowing module names)
gemini_providers = ["google", 'gemini']
openai_providers = ['chatgpt', 'chat-gpt', 'openai']
cohere_providers = ['cohere', 'chatcohere']


def check_api_key(provider_name, api_key):
    """
    Validate API key for different LLM providers and check if it's working.
    
    Args:
        provider_name: "openai", "anthropic", or "google"
        api_key: your API key string
    
    Returns:
        dict with status, message, and details
    """
    try:
        provider = provider_name.lower()

        # OpenAI / ChatGPT
        if provider in openai_providers:
            llm = ChatOpenAI(
                openai_api_key=api_key,
                temperature=0,
                model="gpt-3.5-turbo"  # Use cheaper model for testing
            )
            response = llm.invoke("Hi")

        # Google Gemini
        elif provider in gemini_providers:
            llm = ChatGoogleGenerativeAI(
                google_api_key=api_key,
                model="gemini-2.5-flash",
                temperature=0
            )
            response = llm.invoke("Hi")

        # Cohere chat
        elif provider in cohere_providers:
            # ChatCohere normally expects a `cohere_api_key` kwarg
            # Use a currently supported Cohere chat model
            llm = ChatCohere(
                cohere_api_key=api_key,
                model="command-xlarge-nightly",
            )
            response = llm.invoke("Hi")

        else:
            return {
                "status": "error",
                "message": f"❌ Provider '{provider_name}' not supported.",
                "details": "Supported providers: openai, google/gemini, cohere"
            }
        
        # Normalize response text for display (many wrappers differ)
        resp_text = ""
        if hasattr(response, "content"):
            resp_text = response.content
        elif hasattr(response, "text"):
            resp_text = response.text
        else:
            try:
                resp_text = str(response)
            except Exception:
                resp_text = "(no text)"

        return {
            "status": "success",
            "message": f"✅ {provider_name.upper()} API key is valid and working!",
            "details": f"Test response received: {resp_text[:50]}..."
        }
        
    except Exception as e:
        error_message = str(e).lower()
        
        # Check for common error types
        if "authentication" in error_message or "invalid" in error_message or "api key" in error_message:
            return {
                "status": "error",
                "message": f"❌ {provider_name.upper()} API key is invalid.",
                "details": "Please check your API key."
            }
        elif "quota" in error_message or "rate limit" in error_message or "limit exceeded" in error_message:
            return {
                "status": "error",
                "message": f"⚠️ {provider_name.upper()} API key is valid but quota/rate limit exceeded.",
                "details": str(e)
            }
        elif "insufficient" in error_message or "credits" in error_message or "billing" in error_message:
            return {
                "status": "error",
                "message": f"⚠️ {provider_name.upper()} API key is valid but insufficient credits/billing issue.",
                "details": str(e)
            }
        else:
            return {
                "status": "error",
                "message": f"❌ {provider_name.upper()} API key validation failed.",
                "details": str(e)
            }

# Example usage
def test_api_keys(provider_name, api):
    """Test multiple API keys"""
    google=["google", "gemini"]
    openai=["chatgpt", "chatGPT","ChatGPT","openai"]
    cohere_list = ["cohere", "chatcohere", "cohereai"]
    api_provider=""
    if provider_name.lower() in google:
        api_provider="google"
    elif provider_name.lower() in openai:
        api_provider="openai"
    elif provider_name.lower() in cohere_list:
        api_provider = "cohere"
    else:
        print("Only OpenAI, Gemini or Cohere provider")
    
    result = check_api_key(api_provider,api)
    print(f"\n{result['status']}")
    print(f"\n{result['message']}")
    print(f"Details: {result['details']}")

if __name__ == "__main__":
    test_api_keys("google","AIzaSyAI3zUaAfUEC29Rt78Tm3Sgl9Eg_A82kfg")