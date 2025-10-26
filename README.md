# RAG Assistant API — Render deployment helper

This repository contains a FastAPI-based RAG assistant (`main.py`). The files added here help deploy the app to Render (or other PaaS).

Files added
- `requirements.txt` — Python dependencies for Render to install.
- `Procfile` — Start command: `uvicorn main:app --host 0.0.0.0 --port $PORT`.
- `.env.example` — Example environment variables. Copy to `.env` for local development.

Quick steps to deploy on Render (Web Service)

1. Push this repository to a Git provider (GitHub, GitLab).
2. On Render, create a new Web Service and connect your repo.
3. Select the branch you want to deploy (e.g., `knowledge_base_retriever`).
4. Set the following build settings:
   - Environment: `Python 3` (choose 3.10+)
   - Build Command: `pip install -r requirements.txt`
   - Start Command: `uvicorn main:app --host 0.0.0.0 --port $PORT`

5. Add environment variables in the Render dashboard (Environment → Environment Variables):
   - `PINECONE_API_KEY` — your Pinecone API key
   - `PINECONE_INDEX_NAME` — index name (defaults to `vivasoft`)
   - `GOOGLE_API_KEY` / `OPENAI_API_KEY` / `COHERE_API_KEY` — whichever provider(s) you use
   - `VALIDATOR_URL` — optional credential validator URL
   - `TOP_K` — optional (defaults to 5)

Notes and small code changes made
- `main.py` was updated to:
  - Avoid importing `pyngrok` and `nest_asyncio` at module import time (so the module can be imported on Render even if ngrok is not installed).
  - Make ngrok optional via `USE_NGROK` environment variable for local dev.
  - Use `PORT` environment variable if present when running locally with `python main.py`.

Local testing

1. Create a `.env` from `.env.example` and fill in your keys.
2. Create a virtualenv and install deps:

```bash
python -m venv .venv
source .venv/bin/activate
pip install -r requirements.txt
```

3. Run locally (development):

```bash
# Run with uvicorn directly
uvicorn main:app --reload --host 0.0.0.0 --port 8000
```

Or use the built-in runner (which supports optional ngrok):

```bash
python main.py
```

Troubleshooting
- If Render fails during install, check the build logs for missing packages and pin versions in `requirements.txt`.
- If an import error references `langchain_*` helper packages, you may need to adjust dependency names to match the packages you actually use (some of the `langchain_*` libraries are community/third-party and may have different package names).

If you want, I can:
- add a `render.yaml` to define the service and environment in-code,
- create a Dockerfile for a containerized Render service,
- or pin exact dependency versions based on your current virtualenv.
