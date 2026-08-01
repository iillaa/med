# 🔍 Lightweight Quick Scan — Dr.CAT v1.4.6
> Date: 2026-08-01 | Auditor: Principal Engineer (AI) | Mode: Audit-Only

---

## Top 10 Critical Issues

### 1. 🔴 Hardcoded API Keys & Fallback Secrets — Multiple Files
- **File/area:** `.env` + `server/config/constants.js` + `server/routes/version.js`
- **Severity:** 🔴 CRITICAL
- **Impact:** Two AI API keys sit in `.env` but `require('dotenv').config()` is never called in the server — keys are unused but exposed in plaintext. `constants.js` hardcodes `drcat_pub_2f7a91c4e8` as APP_DATA_KEY fallback. `version.js:39` hardcodes `drcat_secret_api_key_2026` as ADMIN_API_KEY fallback — anyone who reads the source or decompiles the APK can call `PUT /api/admin/version` to force-lock all users.
- **Fix:** Call `require('dotenv').config()` at top of `server/index.js`, remove ALL hardcoded secret fallbacks, rotate the exposed LLAMAPARSE + GOOGLE keys immediately.

---

### 2. 🔴 Public `POST /api/suggestions` — Zero Auth, No Payload Size Limit
- **File/area:** `server/routes/suggestions.js` lines 17-58
- **Severity:** 🔴 CRITICAL
- **Impact:** Any anonymous actor worldwide (no token, no localhost restriction) can POST unlimited suggestions. The `data` field is stored verbatim with zero size limit — repeated large payloads grow the in-memory cache and disk indefinitely causing OOM/disk exhaustion.
- **Fix:** Add per-IP burst rate limit on this route and cap the `data` payload at ≤ 5 KB server-side.

---

### 3. 🔴 CSP `unsafe-eval` + `unsafe-inline` — Content Security Policy Is Useless
- **File/area:** `server/index.js` lines 241-242
- **Severity:** 🔴 CRITICAL
- **Impact:** `script-src 'self' 'unsafe-inline' 'unsafe-eval'` nullifies the entire CSP. Any XSS injection (DOM or otherwise) executes freely. The header exists but offers zero protection.
- **Fix:** Remove `unsafe-eval`; apply nonce-based or hash-based CSP for inline scripts.

---

### 4. 🔴 `X-Forwarded-For` Spoofing Bypasses Rate Limiter Entirely
- **File/area:** `server/middleware/rate-limit.js` lines 74-78
- **Severity:** 🔴 CRITICAL
- **Impact:** The rate limiter reads `X-Forwarded-For` from the raw request header. An attacker can send `X-Forwarded-For: 127.0.0.1` and the `isLocalAddress()` check returns `true`, completely skipping all rate limits and IP bans from any external IP.
- **Fix:** Only accept `X-Forwarded-For` when `req.socket.remoteAddress` is a known trusted proxy; otherwise use `req.socket.remoteAddress` directly.

---

### 5. 🟠 `global.perfServer` Called Without Null Guard on Every Request
- **File/area:** `server/index.js` line 264
- **Severity:** 🟠 HIGH
- **Impact:** `global.perfServer.recordRequest(...)` runs on every API response finish event. If `perfServer` module fails to initialize (import error, cold start race), every single request triggers an uncaught TypeError that silently goes through the uncaughtException handler — breaking perf logging invisibly.
- **Fix:** Add `if (global.perfServer)` guard on line 264 (already done in `data-store.js` but missing here).

---

### 6. 🟠 `showToast()` Injects Raw Message via `innerHTML` — Client-Side XSS
- **File/area:** `public/js/utils.js` line 21
- **Severity:** 🟠 HIGH
- **Impact:** `showToast` inserts the `message` string directly into a template literal assigned to `innerHTML`. Any server error message containing HTML or `<script>` tags (e.g., from a compromised server response) executes in the browser. DOMPurify is in `package.json` but not used here.
- **Fix:** Use `textContent` for the message `<span>`, or sanitize with `DOMPurify.sanitize(message)` before injection.

---

### 7. 🟠 No Log Rotation — `server.log` at 27 MB and Growing
- **File/area:** `server.log` (root), `audit.log` (root)
- **Severity:** 🟠 HIGH
- **Impact:** The server writes continuously to `server.log` (27 MB) and `audit.log` (176 KB) with no rotation. On a Termux device with limited storage, the server will eventually crash or slow dramatically when the filesystem fills. Backup files also accumulate (10-file limit exists but audit.log is unbounded).
- **Fix:** Add PM2 with `--log-date-format` + log-rotate plugin, or add a daily `logrotate` cron via Termux.

---

### 8. 🟠 No External Monitoring — Crashes Go Undetected
- **File/area:** Infrastructure
- **Severity:** 🟠 HIGH
- **Impact:** `/health` endpoint exists but nothing polls it externally. The server runs as a bare `node` process — if it crashes or the ngrok tunnel drops, users get no service and the admin gets no alert. `server.log` has evidence of previous unhandled rejections.
- **Fix:** Set up PM2 with `--watch` + restart policy, and point a free UptimeRobot monitor at your ngrok health URL.

---

### 9. 🟠 PDF Upload Writes Files Before Auth Response Returns — TOCTOU Risk
- **File/area:** `server/routes/pdfs.js` lines 38-54
- **Severity:** 🟠 HIGH
- **Impact:** PDF is written to disk and `res.json({ success: true })` is sent BEFORE the background `extractPdfData` completes. If extraction fails, the file is partially indexed, but the client already received success. Worse: `cleanFilename = path.basename(filename)` is validated for `.pdf` extension but no MIME-type check is done — a file renamed `.pdf` with malicious content (e.g., a ZIP bomb or script) gets stored.
- **Fix:** Add file size limit + MIME-type verification using the magic bytes of the uploaded buffer before writing to disk.

---

### 10. 🟡 Admin Login Restricted to Localhost Only — Remote Admin Impossible
- **File/area:** `server/routes/auth.js` lines 16-17
- **Severity:** 🟡 LOW (by design) / 🟠 HIGH (if intentional remote use is needed)
- **Impact:** `POST /api/login` returns 403 for all non-localhost connections. The admin must physically be on the device running the server. While this is a security feature, it means remote admin management (e.g., via the ngrok tunnel from a tablet) is completely impossible. The `isAdmin` flag used for token validation on other routes does accept remote tokens — creating an inconsistency.
- **Fix:** If remote admin is desired, add TOTP/MFA before allowing remote login. If localhost-only is intentional, document it clearly and review the inconsistency with `x-admin-token` accepted remotely on other routes.

---

## Verdict

> ## ❌ NOT PRODUCTION READY

### Progress Since Last Audit ✅
The project has improved significantly:
- Modular server architecture (routes, middleware, services)
- Atomic writes with backup + lock system
- Rate limiting + WAF middleware present
- CI/CD pipeline via GitHub Actions
- Graceful shutdown handlers
- Audit logging to file
- Automated DB backups (10-file rotation)
- Lazy-loading + code splitting on frontend
- Version gate / kill switch system

### Must Fix Before Public Exposure 🔴
1. Remove hardcoded `drcat_secret_api_key_2026` ADMIN_API_KEY fallback
2. Fix X-Forwarded-For spoofing in rate limiter
3. Add auth/size limit to `/api/suggestions` POST
4. Sanitize `showToast` innerHTML injection
