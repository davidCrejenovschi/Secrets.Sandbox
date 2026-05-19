# 🧪 Secrets.Sandbox

This repository is the **sandbox target** for the [MCP Secrets Detector](https://github.com/davidCrejenovschi/MCP.Secrets.Detector) project — an AI-powered tool that scans GitHub Pull Requests for hardcoded secrets and posts inline review comments automatically.

---

## 🔗 Connection with MCP.Secrets.Detector

| Detail | Value |
|---|---|
| **Detector Repo** | [MCP.Secrets.Detector](https://github.com/davidCrejenovschi/MCP.Secrets.Detector) |
| **Sandbox Repo** | `davidCrejenovschi/Secrets.Sandbox` (this repo) |
| **Branch with secrets** | `add-dummy-secrets` |
| **File with dummy secrets** | [`file.py`](https://github.com/davidCrejenovschi/Secrets.Sandbox/blob/add-dummy-secrets/file.py) |
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

## 📂 Branch Structure

- **`main`** branch — clean, contains only this README. No secrets, no `file.py`.
- **`add-dummy-secrets`** branch — contains the dummy `file.py` with fake credentials used for detector testing. A Pull Request is opened from this branch into `main` so the MCP Secrets Detector can scan the diff and post inline review comments.
