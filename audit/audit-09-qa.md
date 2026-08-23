# 🧪 Audit 09 — QA & Edge-Case Testing
> Date: 2026-08-01 | Role: QA Engineer | Mode: Audit-Only

---

## QA-01
- **File/area:** `server/routes/suggestions.js` line 24 — `parseInt(catId)` with no validation
- **Severity:** 🟠 HIGH
- **Reproduction steps:**
  1. POST to `/api/suggestions` with `{ "type": "edit", "catId": "abc", "data": { "title": "Test" } }`
  2. `parseInt("abc")` returns `NaN`
  3. `targetCatId = NaN` is stored in the suggestion
  4. When admin approves, `parseInt(sug.catId)` = `NaN`
  5. `cache.catsCache.find(c => c.id === NaN)` never matches → admin gets "CAT not found" error
  6. Suggestion stuck in pending state forever (cannot be approved or provides misleading error)
- **Fix:** Validate `catId` is a valid positive integer before creating the suggestion: `if (catId && isNaN(parseInt(catId))) return res.status(400).json({ error: 'Invalid catId.' });`
- **Suggested test case:** `POST /api/suggestions` with `catId: "not-a-number"` → expect 400 response.

---

## QA-02
- **File/area:** `server/routes/cats.js` line 60 — bulk-import with empty array
- **Severity:** 🟡 MEDIUM
- **Reproduction steps:**
  1. Admin sends `POST /api/cats/bulk-import` with body `[]` (empty array)
  2. `importList` passes the `!Array.isArray` check
  3. The for loop runs 0 iterations
  4. `importedCount = 0`, no write occurs
  5. Response: `{ success: true, count: 0, skippedCount: 0 }` — misleading success
- **Fix:** Return 400 if the import array is empty: `if (importList.length === 0) return res.status(400).json({ error: 'Liste d\'importation vide.' });`
- **Suggested test case:** `POST /api/cats/bulk-import` with `[]` → expect 400, not 200.

---

## QA-03
- **File/area:** `server/routes/search.js` line 158-168 — `?since` with negative value
- **Severity:** 🟡 MEDIUM
- **Reproduction steps:**
  1. GET `/api/pdf-index?since=-1`
  2. `Number.isFinite(-1) && -1 > 0` → `false` (the `> 0` check saves us here)
  3. Returns full index (correct behavior)
  4. BUT: GET `/api/pdf-index?since=0` → `Number.isFinite(0) && 0 > 0` → `false` → full index (correct)
  5. GET `/api/pdf-index?since=NaN` → `parseInt('NaN', 10)` = `NaN` → `Number.isFinite(NaN)` = `false` → full index (correct)
  - These edge cases are actually handled correctly — this is a **positive finding**.
- **Suggested test case:** Confirm behavior is consistent across `since=-1`, `since=0`, `since=NaN`, `since=abc`.

---

## QA-04
- **File/area:** `server/services/data-store.js` line 53 — temp file cleanup on write failure
- **Severity:** 🟡 MEDIUM
- **Reproduction steps:**
  1. Fill the filesystem to 100% while a write is in progress
  2. `fs.promises.writeFile(tempPath, ...)` throws ENOSPC
  3. The catch block tries to `access(tempPath)` — may also fail with ENOSPC
  4. `fs.promises.unlink(tempPath)` is attempted — may also fail if the file was partially written
  5. The original error is re-thrown, but `tempPath` may remain on disk (partial file), corrupting future reads that check for `.tmp` files
- **Fix:** In the catch block, use `try { await fs.promises.unlink(tempPath) } catch(_) {}` (already done — but verify the temp file name is unique per write to prevent collision between concurrent writes from different dbLock queue entries).
- **Suggested test case:** Mock a disk-full scenario in unit tests by temporarily writing a very large file, then verify no `.tmp` orphans remain after a failed write.

---

## QA-05
- **File/area:** `server/routes/cats.js` line 110 — `parseInt(req.params.id)` with string ID
- **Severity:** 🟡 MEDIUM
- **Reproduction steps:**
  1. POST `/api/cats/abc` with admin token
  2. `parseInt('abc')` → `NaN`
  3. `isNaN(NaN)` → returns 400 "Invalid CAT ID" ✅ — correctly handled
  4. But POST `/api/cats/1e5` → `parseInt('1e5')` → `1` (scientific notation truncated)
  5. Cat ID `1` gets modified when the intent was `100000` — wrong target
- **Fix:** Use strict integer check: `const catId = Number.isInteger(Number(req.params.id)) ? parseInt(req.params.id, 10) : NaN;`
- **Suggested test case:** `POST /api/cats/1e5` with valid admin token → should return 400 "Invalid CAT ID".

---

## QA-06
- **File/area:** `server/routes/suggestions.js` — suggestion data field has no schema
- **Severity:** 🟡 MEDIUM
- **Reproduction steps:**
  1. POST `/api/suggestions` with `{ "type": "add", "data": {} }` — empty data object
  2. `!data` is false (empty object is truthy)
  3. Suggestion stored with `data: {}`
  4. Admin approves → `sug.data.category` is `undefined` → new CAT created with `category: undefined`
  5. `cats_db.json` now contains `"category": undefined` which is lost in JSON serialization → stored as `"category": null`
- **Fix:** Validate `data.title` and `data.category` for `type: 'add'` suggestions at submission time.
- **Suggested test case:** POST suggestion with `type: 'add', data: {}` → expect 400 with required fields listed.

---

## QA-07
- **File/area:** `server/middleware/rate-limit.js` lines 44-53 — WAF path inspection false positives
- **Severity:** 🟡 MEDIUM
- **Reproduction steps:**
  1. A CAT with a title like "Traitement du .php Web Injection" is created in the DB
  2. Search endpoint called with query `?q=.php`
  3. The WAF path inspector checks `req.path` (not query string for path keywords)
  4. Path is `/api/search-pdfs` — no `.php` match ✅ safe
  5. BUT: a user searching for `etc/passwd` in the search box triggers: query string WAF check (`SUSPICIOUS_QUERY_REGEX`) — wait, this is a path keyword not a regex → checked against `req.path` not `req.query` ✅
  - Actually safe. The path keyword check uses `req.path` and the query check uses `SUSPICIOUS_QUERY_REGEX` separately. No false positives found.
- **Fix:** No fix needed — this is a **positive finding**. Document this design decision in the code.
- **Suggested test case:** Search for "etc/passwd" via the normal search box and confirm the search works (returns results or empty, no 403).

---

## QA-08
- **File/area:** `public/js/main.js` — service worker registration on dev localhost
- **Severity:** 🟡 MEDIUM
- **Reproduction steps:**
  1. Developer runs server on localhost:3000
  2. `isDev` check passes (hostname is localhost) → SW NOT registered ✅
  3. Developer deploys to ngrok URL and tests — ngrok URL is NOT localhost → SW IS registered
  4. SW caches the old bundle from the first ngrok session
  5. Next day, bundle changes, new ngrok URL used → but old SW from yesterday's URL is still active
  6. User sees stale JS with old bugs
- **Fix:** Tie SW registration to a build hash or version number in the cache name so stale SWs are automatically invalidated.
- **Suggested test case:** Change a JS file, rebuild, and confirm the SW serves the new bundle within one page reload.

---

## QA-09
- **File/area:** `server/index.js` lines 46-51 — double-slash URL normalization
- **Severity:** 🟡 LOW
- **Reproduction steps:**
  1. Client sends `GET ///api/cats`
  2. Middleware replaces leading `//+` → `/api/cats` ✅ (works for double slash)
  3. Client sends `GET ////api/cats`
  4. The regex `/^\/+/` matches ALL leading slashes → `/api/cats` ✅ (works)
  5. Client sends `GET /\api/cats` (backslash)
  6. Not handled — Express may normalize this differently on different OS
- **Fix:** Also strip leading backslashes: `req.url = req.url.replace(/^[\/\\]+/, '/');`
- **Suggested test case:** Send a request with `////api/cats` and `/\api/cats` and confirm both return the same response as `/api/cats`.

---

## QA-10
- **File/area:** Tests directory — missing coverage for key scenarios
- **Severity:** 🟡 LOW
- **Reproduction steps:** Run `npm run test:suite` and note which scenarios are NOT covered:
  - ❌ Rate limiter bypass via X-Forwarded-For spoofing
  - ❌ Unauthenticated `POST /api/suggestions` with oversized payload  
  - ❌ Admin API key version lock endpoint
  - ❌ PDF upload with non-PDF content disguised as PDF
  - ❌ CAT deletion of core ID ≤ 55
  - ❌ Invalid `catId: "NaN"` in suggestion approval
- **Fix:** Add dedicated regression tests for each of the above scenarios as part of `test_auth.js` or a new `test_security.js`.
- **Suggested test case:** All of the above scenarios should have passing test cases before any production deployment.

