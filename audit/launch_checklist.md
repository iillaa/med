# 🚀 Non-Technical Launch & Verification Checklist
> **App Version:** 1.5.0  
> **Date:** 2026-08-01  
> **Audience:** Founder Manual Sanity Check

---

## 📱 Quick Manual Tests (Do on your phone / browser)

### 1. 🏥 Server Health Check
- Open browser and go to: `http://localhost:3000/health` (or your ngrok URL `/health`)
- **Expected:** Page displays `{"status":"ok",...}` with current timestamp and memory metrics.

### 2. 🔒 Version Lock Guard Test
- Open browser and go to: `http://localhost:3000/api/version-check`
- **Expected:** Returns JSON showing `minVersion` (1.2.4) and `forceUpdateActive` status.

### 3. 🛡️ Unauthenticated Suggestion Spam Protection
- Try posting a suggestion without app keys via terminal/curl or dev tools.
- **Expected:** Server blocks request with `403 Forbidden` (`Accès interdit`).

### 4. 🔑 Admin API Secret Protection
- Try calling `PUT /api/admin/version` with header `x-api-key: drcat_secret_api_key_2026` (the old hardcoded key).
- **Expected:** Returns `401 Unauthorized`. Access is strictly blocked unless the new secure env key is provided.

### 5. 🍞 Toast XSS Safety Test
- Open the app UI and cause a network error or invalid input.
- **Expected:** Toasts display formatted error text safely without interpreting HTML/JS tags.

### 6. 📁 Environment File Security Check
- Run `git status` in Termux.
- **Expected:** `.env` is listed under `.gitignore` and never committed to version control.

---

## 🎯 Status Summary

- **Critical Fixes:** Complete & Verified (6/6) ✅
- **App Version:** 1.5.0 Stamped ✅
- **Local Fix Roadmap:** `audit/todo_audit_fix.md` Ready ✅
- **Cloud Migration Roadmap:** `audit/migration_audit.md` Ready ✅
