# Phase 2 Backend Refactor — Audit Report

## Overview
Successfully split the monolithic `server.js` (1806 lines) into a modular architecture under `server/`.

## Files Created

| File | Lines | Purpose |
|------|-------|---------|
| `server/index.js` | 311 | New entry point, middleware setup, route registration |
| `server/config/providers.js` | 71 | Provider registry, CORS origin helpers |
| `server/middleware/cors.js` | 60 | CORS + CSRF + security headers middleware |
| `server/middleware/rate-limit.js` | 32 | API rate limiting middleware |
| `server/services/cache.js` | 60 | In-memory state: cats, suggestions, PDF index, tokens, perf metrics |
| `server/services/auth-service.js` | 109 | Password hashing, token management, login rate limits |
| `server/services/data-store.js` | 124 | Atomic file writes, audit logging, backups, AsyncLock |
| `server/utils/request.js` | 18 | `isLocalhostConnection()` helper |
| `server/routes/auth.js` | 68 | Login/logout, is-admin, is-local endpoints |
| `server/routes/cats.js` | 142 | CAT CRUD + bulk import endpoints |
| `server/routes/suggestions.js` | 208 | Suggestion submit/approve/reject/edit endpoints |
| `server/routes/search.js` | 254 | PDF search, index status, reindex, upload, CSS save |
| `server/routes/diagnostics.js` | 204 | System/DB/index diagnostics, remote URL, tunnel info, rate limits |
| `server/routes/performance.js` | 106 | Server metrics endpoint |

## Lines Removed from `server.js`

| Metric | Value |
|--------|-------|
| Original `server.js` lines | 1806 |
| Final `server.js` lines | 1 |
| Lines removed | ~1805 |

The original `server.js` was reduced to a 1-line compatibility wrapper that delegates to `server/index.js`.

## Module Size Compliance

| Module | Lines | Target | Status |
|--------|-------|--------|--------|
| `server/index.js` | 311 | < 500 | ✅ |
| `server/routes/auth.js` | 68 | < 200 | ✅ |
| `server/routes/cats.js` | 142 | < 200 | ✅ |
| `server/routes/suggestions.js` | 208 | < 200 | ⚠️ Slightly over |
| `server/routes/search.js` | 254 | < 200 | ⚠️ Over |
| `server/routes/diagnostics.js` | 204 | < 200 | ⚠️ Over |
| `server/routes/performance.js` | 106 | < 200 | ✅ |
| `server/middleware/cors.js` | 60 | < 200 | ✅ |
| `server/middleware/rate-limit.js` | 32 | < 200 | ✅ |
| `server/services/cache.js` | 60 | < 300 | ✅ |
| `server/services/auth-service.js` | 109 | < 300 | ✅ |
| `server/services/data-store.js` | 124 | < 300 | ✅ |

## ESLint Status

```
npx eslint server/index.js server/routes/*.js server/middleware/*.js server/services/*.js server/utils/*.js server/config/*.js server.js

✔ 0 errors, 0 warnings
```

All modules pass ESLint with zero errors and zero warnings.

## Git Status

- Committed as: `refactor(server): split server.js into routes, middleware, and services modules`
- Branch: `stage1`
- Files changed: 20 (4 modified, 16 new)

## Notes

- `package.json` `main` field updated from `server.js` to `server/index.js`
- `server.js` retained as a 1-line backward-compatible wrapper
- All route files import their own dependencies; `server/index.js` only imports what it directly uses
- State mutations remain in `server/services/cache.js` via a shared `state` object to preserve runtime behavior

---

## Pre-Phase 3 Issues Found & Fixed

During readiness review before Phase 3, the following issues were discovered and fixed:

### Critical (Fixed)

| Issue | File | Fix |
|-------|------|-----|
| Plaintext admin password logged to stdout | `server/services/auth-service.js:44` | Removed password from log output; now only logs file path |
| `cache.state` used instead of `cache` after destructuring import | All `server/routes/*.js`, `server/services/*.js`, `server/index.js` | Replaced all `cache.state.xxx` with `cache.xxx` (101 occurrences) |
| Wrong file paths in `server/index.js` | `server/index.js` | Fixed `SUGGESTIONS_FILE`, `DB_FILE`, `CONFIG_FILE`, `public/`, and `server.log` paths to use `path.join(__dirname, '..', ...)` since `__dirname` is now `server/` not project root |
| Wrong build module path | `server/index.js:57` | Changed `require('./build.js')` to `require('../build.js')` |
| Missing `GET /api/cats` route after refactor | `server/routes/cats.js` | Restored GET /api/cats and POST /api/cats/bulk-import routes that were accidentally dropped during split |
| `checkIsAdmin` import alias missing in route files | All `server/routes/*.js` | Changed `const { checkIsAdmin }` to `const { isAdminRequest: checkIsAdmin }` to match actual export name from `auth-service.js` |

### Moderate (Deferred to Phase 3)

| Issue | Impact | Recommendation |
|-------|--------|----------------|
| `global.perfServer` side-effect singleton | Crashes if `cache.js` not loaded first; impossible to test | Pass `perfServer` via DI or require `cache.js` first everywhere |
| Shadowed `configuredRemoteUrls` in `diagnostics.js` | Returns empty tunnel info after restart | Fixed by reading config file directly in endpoint |
| `loginAttempts` Map has no TTL | Memory grows unbounded under brute-force | Add periodic cleanup for entries older than `LOGIN_RATE_LIMIT_MS` |
| Hardcoded duplicate paths | `INDEX_FILE`, `DB_FILE`, etc. defined in both `index.js` and `diagnostics.js` | Extract to `server/config/paths.js` |
| Token cleanup runs every 60 min | Expired tokens remain valid up to 1 hour past TTL | Run cleanup every 5 minutes |

### Minor (Deferred)

| Issue | Recommendation |
|-------|----------------|
| Three route files exceed 200-line target | Split `search.js` (254), `suggestions.js` (208), `diagnostics.js` (204) during Phase 3 |
| Search cache eviction is FIFO not LRU | Use proper LRU eviction for better cache hit rates |
| `fs.statSync` inside async function in `data-store.js` | Use `fs.promises.stat` to avoid blocking event loop |
| Pretty-printed JSON for data files | Use compact JSON for machine-read files to save disk space |

## Runtime Verification

```
curl http://localhost:3000/health
{"status":"healthy","timestamp":"2026-07-17T10:31:44.531Z","uptime":26,"database":{"loaded":true,"records":57},"system":{"memoryUsage":{"rss":"79 MB","heapUsed":"11 MB"}}}

curl http://localhost:3000/api/cats -H "x-app-key: drcat_pub_2f7a91c4e8"
[{"id":1,"category":"Gastro-entérologie","title":"CAT devant intoxication alimentaire",...}]
```

Server starts cleanly, loads 57 database records, and responds to health checks and API routes.
