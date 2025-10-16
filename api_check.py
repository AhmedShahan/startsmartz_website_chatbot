from langchain_google_genai import ChatGoogleGenerativeAI, GoogleGenerativeAI
from langchain_openai import ChatOpenAI

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
        if provider_name.lower() == "openai":
            llm = ChatOpenAI(
                openai_api_key=api_key, 
                temperature=0,
                model="gpt-3.5-turbo"  # Use cheaper model for testing
            )
            # Try a minimal API call
            response = llm.invoke("Hi")
            
        elif provider_name.lower() == "google":
            llm = ChatGoogleGenerativeAI(
                google_api_key=api_key,
                model="gemini-2.5-flash",
                temperature=0
            )
            # Try a minimal API call
            response = llm.invoke("Hi")
            
        else:
            return {
                "status": "error",
                "message": f"❌ Provider '{provider_name}' not supported.",
                "details": "Supported providers: openai, anthropic, google"
            }
        
        return {
            "status": "success",
            "message": f"✅ {provider_name.upper()} API key is valid and working!",
            "details": f"Test response received: {response.content[:50]}..."
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
    api_provider=""
    if provider_name.lower() in google:
        api_provider="google"
    elif provider_name.lower() in openai:
        api_provider="openai"
    else:
        print("Only OpenAI or Gemini provider")
    
    result = check_api_key(api_provider,api)
    print(f"\n{result['status']}")
    print(f"\n{result['message']}")
    print(f"Details: {result['details']}")

    # # Test OpenAI
    # result = check_api_key("openai", "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")
    # print(f"\n{result['message']}")
    # print(f"Details: {result['details']}")
    
    # # Test Anthropic
    # result = check_api_key("anthropic", "YOUR_ANTHROPIC_KEY")
    # print(f"\n{result['message']}")
    # print(f"Details: {result['details']}")
    
    # Test Google
    # result = check_api_key("google", "AIzaSyAI3zUaAfUEC29Rt78Tm3Sgl9Eg_A82kfg")
    # print(f"\n{result['message']}")
    # print(f"Details: {result['details']}")

if __name__ == "__main__":
    test_api_keys("google","AIzaSyAI3zUaAfUEC29Rt78Tm3Sgl9Eg_A82kfg")