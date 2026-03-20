# Model Management Guide

## ⚠️ Critical Issue: Why Models Fail

**Puter.JS lists ALL models across ALL endpoints (chat, video, image, etc.)**

We only use the **chat endpoint** (`puter.ai.chat()`), so:
- ✅ Chat models work
- ❌ Video models fail ("Model not found")
- ❌ Image models fail ("Model not found")
- ❌ Other endpoint models fail

This is **why you see 27 models but many don't work** - they're for different APIs!

## Model Compatibility Table

| Model Type | Examples | Status | Reason |
|-----------|----------|--------|--------|
| Chat | `arcee-ai/trinity-large-preview:free` | ✅ Works | Chat endpoint compatible |
| Video | Vidu, Veo, Kling, Sora, Wan | ❌ Fails | Need `/video` endpoint |
| Image | Image generation models | ❌ Fails | Need `/image` endpoint |
| Other | Various models | ❌ Fails | Different endpoints |

## How To Discover Working Chat Models

1. **Try each model** from the dropdown
2. **Send test message** (e.g., "hello")
3. If it responds → ✅ **Add to fallback_models.json**
4. If "Model not found" error → ❌ **It's for a different API**

## Update fallback_models.json With Working Models

Once you identify chat-compatible models:

```json
{
  "models": [
    "arcee-ai/trinity-large-preview:free",
    "other-chat-model-that-works",
    "another-working-chat-model"
  ],
  "lastUpdated": "2026-03-20",
  "note": "Chat API compatible models only"
}
```

Then **refresh browser** - no restart needed.

## Current Status

- ✅ Confirmed chat-compatible: `arcee-ai/trinity-large-preview:free`
- ⏳ Unknown: 26 other models (test them to find more)

## Files

- **`fallback_models.json`** — List of all 27 free models (mix of APIs)
- **`index.html`** — Chat interface with error handling
- **`serve.sh`** — Python HTTP server

## Error Messages

- **"Model not found"** → Model exists in Puter.JS but NOT for chat (try different API/model)
- **"no fallback model available"** → System error (try different model or refresh)
- `claude-3-5-sonnet-20241022`
- `openrouter:deepseek/deepseek-chat`
- `codestral-latest`

## Server Setup

Run `./serve.sh` from the project directory. It:
- Finds an available port (8000–8100)
- Serves static files (HTML, JSON, CSS, JS)
- Logs which port was selected

Access the app at `http://localhost:PORT`
