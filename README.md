# 🧪 Secrets.Sandbox

This repository is the **sandbox target** for the [MCP Secrets Detector](https://github.com/davidCrejenovschi/MCP.Secrets.Detector) project — an AI-powered tool that scans GitHub Pull Requests for hardcoded secrets and posts inline review comments automatically.

---

## 🔗 Connection with MCP.Secrets.Detector

| Detail | Value |
|---|---|
| **Detector Repo** | [MCP.Secrets.Detector](https://github.com/davidCrejenovschi/MCP.Secrets.Detector) |
| **Sandbox Repo** | `davidCrejenovschi/Secrets.Sandbox` (this repo) |
| **Branch with secrets** | `add-dummy-secrets` |
| **File with dummy secrets** | [`file.py`](file.py) |
| **Target PR** | Opened from `add-dummy-secrets` into `main` |

The detector tool connects to a Pull Request opened from the `add-dummy-secrets` branch, scans the changed files, and posts line-level review comments flagging each secret.

---

## ⚠️ All Secrets Are Fake

**Every credential, token, key, password, and connection string in this repository is entirely made up.** They are designed to look realistic so the MCP Secrets Detector can be demonstrated and tested, but none of them grant access to any real system:

- The AWS keys are synthetically generated — they match the `AKIA` prefix format but are not registered with AWS
- The OpenAI API key follows the `sk-proj-` format but is not associated with any account
- The database URL points to a non-existent host (`db-prod-instance.c9xyz.eu-central-1.rds.amazonaws.com`) with fake credentials
- The username/password pair (`root` / `SuperSecretAdminPassword123!`) is fictional

---

## 📂 Repository Contents

```
Secrets.Sandbox/
├── README_SANDBOX.md    # This file — explains the sandbox setup
├── file.py              # File containing dummy secrets for detector testing
└── ...
```

---

## 🧪 What `file.py` Contains

The file intentionally includes a variety of secret patterns to test the detector's coverage:

| Line | Secret Type | What It Tests |
|---|---|---|
| `AWS_ACCESS_KEY_ID` | AWS Access Key | `AKIA` prefix pattern |
| `AWS_SECRET_ACCESS_KEY` | AWS Secret Key | 40-char base64 near `AWS_SECRET` context |
| `OPENAI_API_KEY` | LLM API Key | `sk-proj-` prefix pattern |
| `DATABASE_URL` | Connection String | `postgresql://user:pass@host` embedded credentials |
| `username = "root"` + `password = "..."` | Hardcoded Credentials | Adjacent username/password assignments |

---

## 🚀 How to Use

1. Clone the [MCP Secrets Detector](https://github.com/davidCrejenovschi/MCP.Secrets.Detector) and set it up
2. Configure its `.env` to point at this repo:
   ```env
   GITHUB_REPO=Secrets.Sandbox
   GITHUB_OWNER=davidCrejenovschi
   GITHUB_BRANCH=add-dummy-secrets
   TARGET_PR_NUMBER=<PR number>
   ```
3. Run `poetry run start` — the detector will scan the PR and post inline review comments on every flagged line

---

*Made with ☕ in Cluj, powered by MHP - A Porsche Company workshop.*
