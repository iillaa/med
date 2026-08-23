# ⚙️ Audit 05 — Backend Architecture & Reliability
> Date: 2026-08-01 | Role: Backend Engineer | Mode: Audit-Only

---

## BE-01
- **File/area:** `server/index.js` line 264 — `global.perfServer` null dereference
- **Severity:** 🔴 CRITICAL
- **Impact:** `global.perfServer.recordRequest(...)` is called on EVERY request's `res.on('finish')` event. There is no null guard. If `perfServer` is not attached (which can happen during the startup race between `initializeData()` and the first requests), this crashes silently — not killing the server (uncaughtException catches it) but producing thousands of uncaught errors per minute in the log.
- **Evidence:** Line 264: `global.perfServer.recordRequest(...)` with no `if (global.perfServer)` check.
- **Fix:** `if (global.perfServer) global.perfServer.recordRequest(...)`.

---

## BE-02
- **File/area:** `server/routes/cat-generator.js` lines 94, 32-37
- **Severity:** 🟠 HIGH
- **Impact:** The cat-generator route uses `fs.writeFileSync` (synchronous, blocking) on line 94 to save the V2 database. This blocks the entire Node.js event loop while writing — during this time, no other requests can be processed. For large V2 databases (e.g., 500 CATs × 5 KB each = 2.5 MB), this can freeze the server for 100-500ms.
- **Evidence:** `fs.writeFileSync(V2_DB_PATH, JSON.stringify(db, null, 2), 'utf8')` — line 94.
- **Fix:** Replace with `await fs.promises.writeFile(V2_DB_PATH, ...)` (async) wrapped in a try/catch.

---

## BE-03
- **File/area:** `server/routes/search.js` — Linear O(n×m) search with no index
- **Severity:** 🟠 HIGH
- **Impact:** The PDF search endpoint performs a full linear scan of every document and every page in `cache.pdfIndex` (1.6 MB, potentially thousands of pages). Search results are cached in a simple 100-entry LRU Map. A cold search (cache miss) on a large index with a short, common query term could take 200-500ms, blocking the event loop during that time.
- **Evidence:** `server/routes/search.js` lines 49-93: double-nested for loop over all docs and pages.
- **Fix:** Pre-build an inverted index (word → [docId, page]) on startup and use it for O(1) lookups; or run the search in a worker thread to avoid blocking the event loop.

---

## BE-04
- **File/area:** `server/routes/cat-generator.js` lines 32-37 — synchronous JSON read
- **Severity:** 🟠 HIGH
- **Impact:** `fs.readFileSync` calls for loading both `cats_db.json` (144 KB) and `cats_db_v2_generated.json` block the event loop on every `GET /api/admin/cat-generator/data` call. If the file is large (e.g., 2 MB V2 DB), this causes visible latency for concurrent users during admin operations.
- **Evidence:** Lines 33, 37: `JSON.parse(fs.readFileSync(..., 'utf8'))`.
- **Fix:** Use `await fs.promises.readFile(...)` and make the route handler async.

---

## BE-05
- **File/area:** `server/routes/suggestions.js` lines 26-32 — O(n) duplicate check
- **Severity:** 🟡 MEDIUM
- **Impact:** The duplicate suggestion check iterates the entire `suggestionsCache` array on every POST. With a growing cache (see DB-05 — no size cap), this becomes progressively slower. At 10,000 entries, each suggestion POST requires scanning 10,000 entries.
- **Evidence:** `cache.suggestionsCache.find(s => ...)` — full array scan.
- **Fix:** Use a `Set` or `Map` keyed on `type+catId+hash(data)` for O(1) duplicate detection.

---

## BE-06
- **File/area:** `server/services/active-devices.js` — unbounded deviceMap growth
- **Severity:** 🟡 MEDIUM
- **Impact:** Every unique `X-Install-ID` creates a new entry in `deviceMap`. There is no eviction policy for old devices. Over time (years), thousands of stale device entries accumulate in memory. Each entry is ~200 bytes; 10,000 devices = 2 MB RAM; 100,000 devices = 20 MB RAM.
- **Evidence:** `deviceMap.set(installId, existing)` — line 74, no eviction.
- **Fix:** Add an eviction policy: remove devices not seen in 90 days during the periodic persistence flush.

---

## BE-07
- **File/area:** `server/index.js` lines 402-409 — Token cleanup every 60 minutes
- **Severity:** 🟡 MEDIUM
- **Impact:** `activeTokens` Map cleanup runs every 60 minutes. An attacker who receives a token and then abuses it (e.g., via stolen `x-admin-token` header) has up to 60 minutes before the expired token is pruned — though the `isAdminRequest()` function does check `expiresAt` on use and deletes expired tokens immediately. The interval cleanup is defense-in-depth but the 60-minute interval is fine.
- **Evidence:** Token TTL is 12 hours (`ADMIN_TOKEN_TTL = 12 * 60 * 60 * 1000`). Cleanup runs every 60 minutes.
- **Fix:** No fix needed — the `isAdminRequest()` inline expiry check makes this safe.

---

## BE-08
- **File/area:** `server/routes/pdfs.js` lines 42, 47-54 — fire-and-forget background tasks without tracking
- **Severity:** 🟡 MEDIUM
- **Impact:** PDF compression (`compressPdfFile`) and extraction (`extractPdfData`) are launched as background promises after `res.json()` is sent. If either fails, the client has already received "success" and will never know the PDF is not properly indexed. Errors are only logged to console — no admin alert, no retry mechanism.
- **Evidence:** `.then(...)` and `.catch(err => console.error(...))` after response is already sent.
- **Fix:** Track background task status in a small in-memory state map and expose a `/api/admin/task-status` endpoint for the admin lab to poll.

---

## BE-09
- **File/area:** `server/index.js` — no API versioning
- **Severity:** 🟡 MEDIUM
- **Impact:** All API routes are at `/api/...` with no version prefix (`/api/v1/...`). When breaking changes are needed (e.g., changing the CAT response format), all clients (web PWA + Android APK) must be updated simultaneously — there is no backward-compatible migration path. The version guard exists for forcing APK updates, which partially mitigates this.
- **Evidence:** All routes registered at `/api/cats`, `/api/search-pdfs`, etc.
- **Fix:** For a new breaking change, prefix new routes with `/api/v2/` and maintain v1 routes during the APK transition period.

---

## BE-10
- **File/area:** `server/routes/auth.js` — login endpoint allows timing oracle
- **Severity:** 🟡 LOW
- **Impact:** When login fails due to missing `adminPasswordHash` (e.g., before `initAdminPassword` completes on first boot), the response returns immediately without the PBKDF2 hash comparison delay. This creates a minor timing difference between "hash not initialized" and "wrong password" states — a sophisticated attacker with sub-millisecond timing could distinguish startup states.
- **Evidence:** Lines 31-38: if `cache.adminPasswordHash` is falsy, `isPasswordCorrect` stays false without running `hashPassword()`.
- **Fix:** Run a dummy `hashPassword('', 'salt')` computation even when hash is not loaded to normalize response time.

