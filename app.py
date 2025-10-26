from typing import Optional

from fastapi import FastAPI, HTTPException
from fastapi.middleware.cors import CORSMiddleware
from pydantic import BaseModel

from main import check_api_key


class ValidateRequest(BaseModel):
    provider: str
    api_key: str


app = FastAPI(title="Provider API Key Validator")

# Allow simple CORS during development
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)


@app.get("/")
async def root():
    return {"message": "Provider API key validator. POST /validate with provider+api_key"}


@app.post("/validate")
async def validate(req: ValidateRequest):
    """Validate a provider API key and return a normalized status.

    Request body: { "provider": "cohere", "api_key": "..." }

    Response JSON will include one of these status values:
      - status: "success"
      - status: "limit_exceeded"
      - status: "invalid"
      - status: "error"
    """
    if not req.provider or not req.api_key:
        raise HTTPException(status_code=400, detail="provider and api_key are required")

    # Delegate to existing validation logic in main.py
    result = check_api_key(req.provider, req.api_key)

    status = result.get("status", "error")

    # Normalize and add more specific status codes
    if status == "success":
        return {"status": "success", "message": result.get("message"), "details": result.get("details")}

    details = (result.get("details") or "").lower()
    message = (result.get("message") or "").lower()

    if "quota" in details or "rate limit" in details or "limit exceeded" in details or "limit" in details:
        return {"status": "limit_exceeded", "message": result.get("message"), "details": result.get("details")}

    if "invalid" in message or "invalid" in details or "api key is invalid" in message:
        return {"status": "invalid", "message": result.get("message"), "details": result.get("details")}

    # Fallback
    return {"status": "error", "message": result.get("message"), "details": result.get("details")}


if __name__ == "__main__":
    from pyngrok import ngrok
    import uvicorn

    # Start an ngrok tunnel to the FastAPI app
    public_url = ngrok.connect(8000)
    print(f"Public URL: {public_url}")

    # Run the FastAPI app
    uvicorn.run("API:app", host="0.0.0.0", port=8000, log_level="info")

