# Audit Fixes — Implementation Tracker

## 12 Issues to Fix

### [x] 1. Storage.prototype — Create safeStorage.js utility + remove duplicate patches
- ✅ Created `public/js/lib/safeStorage.js` with safe `getItem`/`setItem` wrappers
- ✅ Removed patches from `main.js:50-70`
- ✅ Removed patches from `performance.js:79-92`

### [x] 2. window.fetch — Consolidate into single interceptor in api.js
- ✅ api.js now dispatches `drcat-fetch-event` custom events
- ✅ debug-console.js listens for events instead of overriding window.fetch

### [x] 3. global.perfServer — Replace with explicit globalThis
- ✅ Updated `server/services/cache.js:20` — `globalThis.perfServer`

### [x] 4. FETCH_TIMEOUT_MS — Extract to config
- ✅ Created `public/js/config.js` with constants
- ✅ Imported in `api.js`, replaced all magic number timeouts

### [x] 5. APP_DATA_KEY — Remove redundant server-side validation
- ✅ Removed `x-app-key` validation middleware from `server/index.js`
- ✅ Added explanatory comment about why it was removed

### [x] 6. loginAttempts Map — Add TTL cleanup
- ✅ Added `LOGIN_ATTEMPT_TTL_MS` constant (24h)
- ✅ Added `setInterval` cleanup in `auth-service.js`

### [x] 7. console.log reassignment — Stop mutating global console
- ✅ Refactored `debug-console.js` to use Proxy wrapper + `Reflect.apply`

### [x] 8. build-bundle.js — Clean chunk-*.js too
- ✅ Updated regex from `/^app-.*\.js$/` to `/^(?:app|chunk)-.*\.js$/`

### [x] 9. CSP headers — Add to server/index.js
- ✅ Added CSP middleware with restrictive baseline policy

### [x] 10. Schema validation — Add to POST /api/server-providers
- ✅ Added `validateConfig()` function in `server-providers-config.js`
- ✅ `saveConfig()` now rejects malformed payloads with clear error messages

### [x] 11. console.log calls — Gate behind DEBUG env var
- ✅ Created `public/js/lib/logger.js` — client-side conditional logger
- ✅ Created `server/utils/logger.js` — server-side conditional logger
- Both wrap console.log/warn/error behind a DEBUG flag

### [x] 12. pdf_index.json APK staleness — Add incremental sync
- ✅ Added `GET /api/pdf-index?since=<unix_ms>` endpoint in `server/routes/search.js`
- ✅ Returns only entries with `mtime > since` for incremental sync
- ✅ Reduces bandwidth for Capacitor APK updates
