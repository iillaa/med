# Dr. CAT — Test Suite Documentation

## Overview

The Dr. CAT test suite consists of **49 automated tests** across three modules covering build verification, API endpoint testing, and client-side functionality. All tests are designed to run in a headless environment (Termux/CI) without external dependencies beyond Node.js 22+ and Chromium.

### Quick Start

```bash
# Run all tests (server must be running on port 3000)
node tests/run-thorough.mjs

# Or run individual suites:
node tests/thorough-build.mjs    # Build verification (11 tests)
node tests/thorough-api.mjs      # API endpoint tests (23 tests)
node tests/thorough-client.mjs   # Client-side tests (15 tests)
```

### Prerequisites

- **Node.js** ≥ 22.0.0 (for built-in `WebSocket` support)
- **Chromium** at `/usr/bin/chromium` (or set `CHROME_BIN` env var)
- **Server** running on `localhost:3000` (auto-started if not running)

---

## Test Suite Architecture

```
tests/
├── run-thorough.mjs          # Master orchestrator — runs all suites sequentially
├── thorough-api.mjs          # API endpoint tests (23 tests)
├── thorough-build.mjs        # Build verification tests (11 tests)
├── thorough-client.mjs       # Client-side unit tests (15 tests)
├── TEST_DOCUMENTATION.md     # This file
└── headless/
    └── harness.mjs           # Legacy headless test harness (deprecated)
```

### Orchestrator: `run-thorough.mjs`

The master orchestrator runs all three test suites in sequence and aggregates results. It does **not** auto-start the server (server must be running). Exit code is 0 only if all 49 tests pass.

```bash
node tests/run-thorough.mjs
```

Expected output:
```
🧪 Dr.CAT Thorough Test Suite — Master Orchestrator
============================================================
🚀 Running: Build Verification
📊 Results: 11 passed, 0 failed
🚀 Running: API Endpoint Tests
📊 Results: 23 passed, 0 failed
🚀 Running: Client-Side Unit Tests
📊 Results: 15 passed, 0 failed
============================================================
📊 FINAL RESULTS
   ✅ Passed:  49
   ❌ Failed:  0
============================================================
```

---

## 1. Build Verification Tests (`thorough-build.mjs`)

**File:** `tests/thorough-build.mjs`  
**Tests:** 11  
**Dependencies:** None (filesystem only)  
**Runtime:** ~30-60 seconds  

### What It Tests

#### Phase 4.1: Build Bundle (5 tests)
| # | Test | What It Verifies |
|---|------|------------------|
| 1 | `npm run build:bundle` completes | Build exits with code 0, output mentions "Bundled app" |
| 2 | `dist/` contains `app-*.js` | Bundle file exists and is non-empty |
| 3 | `dist/` contains `chunk-*.js` | Code-splitting chunks exist and are non-empty |
| 4 | `index.html` points to `dist/app-*.js` | Script tag references the correct bundle path |
| 5 | No direct `js/main.js` reference | Old module script reference is removed |

#### Phase 4.2: Build Cleanup (3 tests)
| # | Test | What It Verifies |
|---|------|------------------|
| 6 | Old `chunk-*.js` cleaned | Stale chunk files are removed on rebuild |
| 7 | Old `app-*.js` cleaned | Stale app bundles are removed on rebuild |
| 8 | Non-bundle files preserved | Other files in `dist/` (e.g., config) survive rebuild |

#### Phase 4.3: Build Output Quality (3 tests)
| # | Test | What It Verifies |
|---|------|------------------|
| 9 | Bundle is valid JS | Contains expected patterns (`import`, `function`, `const`) |
| 10 | Bundle is minified | Average line length > 200 chars, total lines < 2000 |
| 11 | Chunks are valid JS | Each chunk file has substantial content (> 50 bytes) |

### How It Works

1. Runs `npm run build:bundle` via `execSync` with a 60-second timeout
2. Inspects `public/dist/` directory contents using `fs.readdirSync`
3. Creates stale files to verify cleanup logic
4. Validates bundle content characteristics (size, line count, patterns)

### Common Failures

- **Build fails**: Check `esbuild` version, JavaScript syntax errors in source
- **No chunks**: Code-splitting may be disabled; check `build-bundle.js` for `splitting: true`
- **Cleanup fails**: Build script may not include cleanup step; check `build-bundle.js` for `clean: true`

---

## 2. API Endpoint Tests (`thorough-api.mjs`)

**File:** `tests/thorough-api.mjs`  
**Tests:** 23  
**Dependencies:** Server running on `PORT` (default 3000)  
**Runtime:** ~10-20 seconds  

### What It Tests

#### Phase 1: Server Startup (6 tests)
| # | Test | What It Verifies |
|---|------|------------------|
| 1 | `GET /health` returns 200 | Server is alive, `status: "healthy"`, has `timestamp` and `uptime` |
| 2 | CSP headers on HTML | `Content-Security-Policy` present with `default-src`, `script-src`, `style-src`, `connect-src`, `img-src` |
| 3 | CSP headers on API | Same CSP header present on `/api/cats` response |
| 4 | CORS headers | `access-control-allow-origin` present on API responses |
| 5 | Rate limit headers | `x-ratelimit-limit` or `retry-after` present on API responses |
| 6 | `GET /api/server-providers` | Returns `{ primaryProvider, servers }` with valid types |

#### Phase 2: API Endpoints (17 tests)
| # | Test | What It Verifies |
|---|------|------------------|
| 7 | `GET /api/pdf-index` (no since) | Returns full index, `incremental: false`, `count` and `entries` arrays |
| 8 | `GET /api/pdf-index?since=<future>` | Returns empty entries, `incremental: true`, `count: 0` |
| 9 | `GET /api/pdf-index?since=<past>` | Returns entries matching `mtime > since` filter |
| 10 | `GET /api/pdf-index?since=invalid` | Falls back to non-incremental mode gracefully |
| 11 | `POST /api/server-providers` (no auth) | Returns 403 for unauthenticated request |
| 12 | `POST /api/server-providers` (malformed) | Returns 400/500 for invalid JSON payload |
| 13 | `GET /api/cats` | Returns array with `X-Active-Cat-IDs` header (comma-separated numeric IDs) |
| 14 | `GET /api/cats?since=<future>` | Returns empty array |
| 15 | `GET /api/cats?since=<past>` | Returns full array (epoch since=0) |
| 16 | `GET /api/search-status` | Returns `{ isIndexing, totalFiles, indexedFiles }` |
| 17 | `GET /api/pdf-index-status` | Returns object with PDF status map (keys = filenames, values = `{ status, pagesWithText, totalPages }`) |
| 18 | `GET /api/is-admin` (no token) | Returns `{ isAdmin: false }` |
| 19 | `POST /api/logout` (no auth) | Returns 200 with `success` field |
| 20 | `POST /api/suggestions` (valid) | Accepts suggestion payload (200/201/400/403 all valid) |
| 21 | `GET /api/suggestions` (no auth) | Returns 403 with error message (admin-only) |
| 22 | `GET /api/diagnostics/system` (no auth) | Returns 403 (admin-only) |
| 23 | `GET /api/performance/server-metrics` (no auth) | Returns 403 with error message (admin-only) |

### How It Works

1. Uses Node.js built-in `http` module (no `fetch` API dependency)
2. `request()` helper wraps HTTP requests with timeout and JSON parsing
3. `ensureServer()` checks if server is running, starts it if not (via `spawn`)
4. Retry loop waits up to 10 seconds for server readiness
5. Each test is wrapped in `test()` which catches errors and tracks pass/fail counts

### Key Implementation Details

- **Rate limit headers**: The middleware sets `X-RateLimit-Limit`, `X-RateLimit-Remaining`, and `X-RateLimit-Reset` **before** the local IP whitelist check, ensuring headers are present even for localhost requests
- **PDF index `since` parameter**: Uses `doc.mtime > since` comparison; `since=0` returns all entries, `since=1` also returns all (since all mtimes > 1ms)
- **Server-providers validation**: The `server-providers-config.js` module validates payloads before persisting; malformed JSON is caught by Express's `express.json()` error handler

### Common Failures

- **Rate limit headers missing**: Check `server/middleware/rate-limit.js` — headers must be set before the `LOCAL_IPS.has(ip)` early return
- **PDF index `since=0` returns empty**: Check the filter logic — should use `doc.mtime > since` (strictly greater), not `>=`
- **Server-metrics returns 200 instead of 403**: The endpoint may not have admin auth middleware; check `server/routes/performance.js`

---

## 3. Client-Side Tests (`thorough-client.mjs`)

**File:** `tests/thorough-client.mjs`  
**Tests:** 15  
**Dependencies:** Server running, Chromium at `/usr/bin/chromium`  
**Runtime:** ~15-30 seconds  

### What It Tests

#### Phase 3.1: safeStorage.js (6 tests)
| # | Test | What It Verifies |
|---|------|------------------|
| 1 | `safeGetItem` returns null for missing key | `localStorage.getItem('__test_nonexistent_key__')` returns `null` |
| 2 | `safeSetItem` stores and retrieves | Round-trip store/retrieve works correctly |
| 3 | `safeRemoveItem` removes keys | Key is `null` after removal |
| 4 | `safeParseJSON` parses valid JSON | `JSON.parse('{"a":1,"b":"test"}')` returns correct object |
| 5 | `safeParseJSON` handles invalid JSON | `JSON.parse('not-json')` throws error |
| 6 | localStorage quota exceeded handled | Large string storage doesn't crash (may throw `QuotaExceededError`) |

#### Phase 3.2: api.js Fetch Interceptor (3 tests)
| # | Test | What It Verifies |
|---|------|------------------|
| 7 | `drcat-fetch-event` fires on success | Custom event dispatched with `url`, `method`, `status`, `duration` |
| 8 | `drcat-fetch-event` includes error info | Failed fetch (404) captured with error details |
| 9 | Interceptor doesn't break app | CAT list renders normally (items in `#cat-list`) |

#### Phase 3.3: debug-console.js (4 tests)
| # | Test | What It Verifies |
|---|------|------------------|
| 10 | Debug console initializes | `#debug-toggle-btn` exists in DOM, `console.log` still works |
| 11 | Panel opens and closes | Click toggle → panel visible (`display: flex`), click close → hidden (`display: none`) |
| 12 | No double-patching | `console.log` called exactly once per invocation |
| 13 | Captures network events | `drcat-fetch-event` logs appear in debug console content |

#### Phase 3.4: config.js (2 tests)
| # | Test | What It Verifies |
|---|------|------------------|
| 14 | Config constants defined | App loads with config values (CAT list renders) |
| 15 | DEBUG flag toggleable | `localStorage.setItem('drCatDebug', 'true')` persists across navigation |

### How It Works

1. **CDPClient class**: Custom Chrome DevTools Protocol client using Node.js built-in `WebSocket`
2. **Chromium launch**: Spawns headless Chromium with `--remote-debugging-port=9334`
3. **Page connection**: Discovers page WebSocket URL via `http://127.0.0.1:9334/json`
4. **`cdpEval()`**: Executes JavaScript in the browser context via `Runtime.evaluate` CDP command
5. **Event capture**: Listens for `drcat-fetch-event` custom events dispatched by `api.js` fetch interceptor
6. **Navigation**: Uses `Page.navigate` CDP command instead of `location.reload()` to avoid WebSocket disconnection

### Key Implementation Details

- **No puppeteer**: Uses native CDP over WebSocket (Node 22+ built-in `WebSocket`)
- **`cdpEval()` returns `{ type, value, description }`**: The CDP `Runtime.evaluate` result is nested — `resp.result` contains the actual value
- **`cdpWait()`**: Helper that evaluates `new Promise(r => setTimeout(r, ms))` for timing
- **Debug console toggle**: 10 consecutive taps on brand logo (within 2 seconds) toggles debug mode; test simulates this via button click

### Common Failures

- **WebSocket connection fails**: Check Node.js version (≥ 22 required), or install `ws` module
- **Chromium not found**: Set `CHROME_BIN` environment variable to custom path
- **Page navigation timeout**: Increase wait time in `cdpWait()` calls
- **Debug console panel not found**: The panel may not be rendered if debug mode is disabled; check `initDebugConsole()` logic

---

## Test Infrastructure

### Assertion Helpers

All test files use a shared set of assertion functions:

```javascript
function assert(condition, msg)        // Throws if condition is falsy
function assertEq(actual, expected, msg) // Throws if actual !== expected
function assertIn(actual, expectedArr, msg) // Throws if actual not in expectedArr
function assertMatch(str, regex, msg)   // Throws if regex doesn't match str
```

### Test Runner Pattern

Each test file follows the same pattern:

```javascript
let passed = 0;
let failed = 0;

function test(name, fn) {
  return Promise.resolve().then(fn).then(() => {
    console.log(`  ✅ ${name}`);
    passed++;
  }).catch((err) => {
    console.log(`  ❌ ${name}: ${err.message}`);
    failed++;
  });
}

async function main() {
  // Setup
  // Run test phases
  // Teardown
  console.log(`📊 Results: ${passed} passed, ${failed} failed`);
  if (failed > 0) process.exitCode = 1;
}
```

### Environment Variables

| Variable | Default | Used By | Purpose |
|----------|---------|---------|---------|
| `PORT` | `3000` | All | Server port |
| `CHROME_BIN` | `/usr/bin/chromium` | Client | Chromium binary path |
| `CHROME_TEST_START_SERVER` | — | API | Auto-start server (legacy) |

---

## Adding New Tests

### Adding an API Test

1. Add a new `await test('description', async () => { ... })` block in the appropriate phase
2. Use `request(method, path, body, headers)` helper
3. Assert on `res.status`, `res.headers`, and `res.body`

Example:
```javascript
await test('GET /api/cats returns sorted by title', async () => {
  const res = await request('GET', '/api/cats?sort=title');
  assertEq(res.status, 200);
  const titles = res.body.map(c => c.title);
  const sorted = [...titles].sort();
  assertEq(titles, sorted, 'Titles are sorted alphabetically');
});
```

### Adding a Client Test

1. Add a new `await test('description', async () => { ... })` block in the appropriate phase
2. Use `cdpEval(client, jsCode)` to execute JavaScript in the browser
3. Assert on the returned `result.value`

Example:
```javascript
await test('Sidebar search filters CAT list', async () => {
  await cdpEval(client, `document.querySelector('#search-input').value = 'migraine'`);
  await cdpEval(client, `document.querySelector('#search-input').dispatchEvent(new Event('input'))`);
  await cdpWait(client, 500);
  const result = await cdpEval(client, `document.querySelectorAll('#cat-list .cat-item').length`);
  assert(result.value > 0, 'Search returns results');
});
```

### Adding a Build Test

1. Add a new `await test('description', async () => { ... })` block in the appropriate phase
2. Use `execSync()` for CLI commands, `fs` module for file inspection

Example:
```javascript
await test('Source maps are generated', async () => {
  const files = fs.readdirSync(DIST_DIR);
  const maps = files.filter(f => f.endsWith('.map'));
  assert(maps.length > 0, 'Source map files exist');
});
```

---

## Troubleshooting

### All tests fail with connection refused
```bash
# Ensure server is running
curl http://localhost:3000/health
# Should return: {"status":"healthy",...}
```

### Client tests fail with "WebSocket not available"
```bash
# Check Node.js version
node --version  # Must be >= 22.0.0
# Or install ws module:
npm install ws
```

### Build tests fail with timeout
```bash
# Run build manually to see errors
npm run build:bundle
```

### API tests fail with rate limit errors
```bash
# Check rate limit middleware
cat server/middleware/rate-limit.js | head -30
# Verify headers are set before LOCAL_IPS check
```

---

## CI/CD Integration

The test suite is designed for GitHub Actions or similar CI systems:

```yaml
jobs:
  test:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - uses: actions/setup-node@v4
        with:
          node-version: '22'
      - run: npm ci
      - run: node server.js &
      - run: node tests/run-thorough.mjs
```

Expected CI runtime: ~60-90 seconds for all 49 tests.

---

## Test Coverage Summary

| Area | Tests | What's Covered |
|------|-------|----------------|
| **Server Startup** | 6 | Health check, CSP headers, CORS, rate limit headers, provider list |
| **PDF Index** | 4 | Full index, incremental sync (future/past/invalid) |
| **Server Providers** | 2 | Auth rejection, malformed payload handling |
| **CAT Database** | 3 | Full list, incremental sync (future/past) |
| **Search/Index Status** | 2 | Search status, PDF index status map |
| **Auth** | 2 | is-admin (no token), logout |
| **Suggestions** | 2 | Submit suggestion, list requires admin |
| **Admin Endpoints** | 2 | Diagnostics system, server metrics (both 403 without auth) |
| **Build Bundle** | 5 | Build success, bundle/chunk existence, HTML reference, no old refs |
| **Build Cleanup** | 3 | Stale chunk/app cleanup, non-bundle preservation |
| **Build Quality** | 3 | Valid JS, minification, chunk validity |
| **safeStorage.js** | 6 | Get/set/remove, JSON parse, quota handling |
| **api.js Interceptor** | 3 | Success/error events, app functionality preserved |
| **debug-console.js** | 4 | Initialization, panel toggle, no double-patch, network capture |
| **config.js** | 2 | Constants defined, DEBUG toggle |
| **Total** | **49** | |

---

## Maintenance Notes

- **Test files use ES modules** (`import`/`export`) — ensure `package.json` has `"type": "module"` or use `.mjs` extension
- **Client tests require Chromium** — the CDP-based approach is faster than puppeteer but requires the binary
- **API tests use `http` module** — avoids `fetch` API inconsistencies across Node versions
- **Build tests modify `dist/`** — stale files are created and cleaned; ensure `dist/` is in `.gitignore`
- **Test timeouts** are generous (10-20s for API, 60s for build) to accommodate slow Termux environments
