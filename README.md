# Provider API Key Validator

This repository provides a small FastAPI service that validates API keys for different LLM providers (OpenAI, Google/Gemini, Cohere) by making a minimal test call to the provider's chat client.

Files of interest
- `main.py` — provider validation logic (function `check_api_key(provider_name, api_key)`).
- `API.py` — FastAPI app exposing POST `/validate` which accepts `{ provider, api_key }` and returns a normalized `status`.
- `postman_collection.json` — Postman collection you can import to test the API quickly.

Quick start

1. Activate the project's virtualenv:

```bash
source myvenv/bin/activate
```

2. Install/verify dependencies (if not already installed):

```bash
pip install -r requirements.txt  # if you maintain one, or:
pip install fastapi uvicorn
```

3. Start the server (from project root):

```bash
myvenv/bin/uvicorn API:app --host 0.0.0.0 --port 8000 --reload
```

4. Open the interactive docs in your browser:

- Swagger UI: http://localhost:8000/docs
- ReDoc: http://localhost:8000/redoc
- Raw OpenAPI JSON: http://localhost:8000/openapi.json

Endpoint: POST /validate

Description: Validate a provider API key and return a normalized status.

Request
- Content-Type: application/json
- Body JSON:

```json
{
  "provider": "cohere",
  "api_key": "YOUR_API_KEY"
}
```

Response (examples)

- Success

```json
{
  "status": "success",
  "message": "✅ COHERE API key is valid and working!",
  "details": "Test response received: Hello! How can I assist you today?..."
}
```

- Limit / quota

```json
{
  "status": "limit_exceeded",
  "message": "⚠️ COHERE API key is valid but quota/rate limit exceeded.",
  "details": "..."
}
```

- Invalid key

```json
{
  "status": "invalid",
  "message": "❌ COHERE API key is invalid.",
  "details": "Please check your API key."
}
```

- Generic error

```json
{
  "status": "error",
  "message": "❌ COHERE API key validation failed.",
  "details": "Full exception or provider response..."
}
```

Using Postman

1. Start the server.
2. Import the included `postman_collection.json` (File → Import → File) or create a request:
   - POST `http://localhost:8000/validate`
   - Header: `Content-Type: application/json`
   - Body (raw JSON): `{"provider":"cohere","api_key":"YOUR_KEY"}`

Security & production notes

- Do not send raw API keys over plain HTTP in production. Use HTTPS and secure channels.
- Add authentication to `/validate` (API token, JWT) before exposing publicly.
- Consider logging scrubbers that remove or hash API keys before they are written to logs.
- Consider rate-limiting and request quotas for callers.

Customization

- If you prefer the endpoint to return specific HTTP status codes (401 for invalid keys, 429 for rate limits), I can update `API.py` to raise `HTTPException` with the appropriate status codes.
- I can also add an API token requirement (header) and sample `.env` support to read admin tokens.

Troubleshooting

- If an imported provider client throws a model-deprecation or 404 error, update `main.py` to use a currently supported model.
- If you see import errors (e.g., `fastapi` not found), ensure you're running with the project's virtualenv Python: `myvenv/bin/python` or `myvenv/bin/uvicorn`.

Contact

If you'd like I can add automated tests, CI checks, or a Dockerfile for deployment.
