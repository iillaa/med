# Lessons Learned (lessons_learned.md) 📝

A log of engineering choices, debug logs, and architectural mistakes to avoid when developing **Dr. CAT**.

---

## 🪵 Key Lessons & Good Choices

### 1. Atomic DB Writes
* **Choice**: Writing to JSON databases via a `.tmp` file and then renaming it.
* **Benefit**: Prevents database truncation/corruption. If Termux is closed, or the phone runs out of battery mid-write, the existing file remains intact.

### 2. Localhost Verification via Raw Sockets
* **Choice**: Locking the login route by matching `req.socket.remoteAddress` and evaluating proxy headers (`X-Forwarded-For`).
* **Benefit**: Guarantees that remote users accessing the app via port-forwarding (e.g., tunnel tunnels) cannot access the admin login page or brute-force administrative credentials.

### 3. Frozen Startup Connection State
* **Choice**: Reading connection state once at load time (`state.isOnlineAtStartup = navigator.onLine`).
* **Benefit**: Avoids constant layout changes and popups when doctors move through parts of a hospital with fluctuating Wi-Fi coverage.

---

## ⚠️ Mistakes & Pitfalls to Avoid

### 1. Requiring 100% Page Index Coverage
* **Problem**: Marking PDFs as partially indexed (Orange badge) if even a single page was empty or contained only images. This turned almost all PDFs Orange.
* **Solution**: Switched to a coverage ratio threshold. If $\ge 90\%$ of pages contain text, the document is marked Green (Fully searchable).

### 2. Standard Relative URLs in Capacitor
* **Problem**: Writing relative API fetches like `/api/suggestions`. In standard browsers, this works because the app is served by the Node server. In Capacitor, the app is served by a local loopback server (`http://localhost/`), meaning relative fetches go to `http://localhost/api/...` and throw 404 errors.
* **Solution**: Introduced `isOfflineApp` checking in `api.js` to redirect all queries to local state and added a `REMOTE_SERVER_URL` config variable to route calls to a hosted domain when needed.

### 3. Outdated Action Steps in GitHub CI
* **Problem**: Using `actions/checkout@v3` and `actions/upload-artifact@v3` in workflows. These run on deprecated runner versions, leading to compilation failures on modern Ubuntu build containers.
* **Solution**: Always lock GitHub Actions workflows to modern, supported versions (e.g. `@v4`).

### 4. Absolute Local System Paths in WebViews
* **Problem**: Attempting to link local system files directly using `file:///storage/emulated/...` inside browser pages. Android WebViews block direct file scheme requests for security.
* **Solution**: Bundle resources into the application assets folder during development compilation, or fetch files through Capacitor filesystem modules.

### 5. Ngrok HTML Interception in AJAX Calls
* **Problem**: When accessing the server remotely via an tunnel public tunnel, browsers without existing cookies or with strict privacy shield configurations (e.g. Brave, Firefox Private) intercept AJAX JSON calls and receive the tunnel HTML landing warning page. Parsing this HTML as JSON throws SyntaxErrors (unexpected '<') and breaks application startup (empty list rendering).
* **Solution**: Updated `getHeaders()` to check if `window.location.hostname` contains `tunnel` dynamically. This automatically injects the `tunnel-skip-browser-warning: true` header to bypass the warning for all browser/app users.

### 6. Misaligned Closing Elements causing UI Leaks
* **Problem**: Misplaced closing `</div>` tags in the HTML can break layout containers. If an admin-only block is closed too early, succeeding admin components spill outside the container and bypass the admin state check, rendering visible to ordinary guest users.
* **Solution**: Enforce strict validation of DOM hierarchy. Ensure all admin-only modules are fully encapsulated inside `#admin-moderation-panel`.

### 7. ES Module Syntax Constraints in WebView Environments
* **Problem**: Attempting to conditionally toggle module logic on Android by nesting `export` statements inside blocks (like `if` / `else` blocks) is syntactically invalid under ECMAScript Module specifications. Some strict JavaScript engines (like Android WebView's V8) will fail at parse-time with a `SyntaxError`, killing the entire import graph and freezing the application on startup without throwing runtime caught exceptions.
* **Solution**: Keep all `export` statements at the top level of the file. Use ternary assignments or local variable pointers initialized at runtime to conditionally choose implementation structures before exporting them.

### 8. Race Conditions on Ultra-Fast Page Boots
* **Problem**: Setting delayed simulated progress bar timers (e.g. `setTimeout(..., 600)`) in the loading overlay to make loading feel smooth can cause race conditions when the app loads extremely quickly (e.g. under 100ms on localhost). The app completes loading, hides the loading banner, but then the delayed timeout fires *afterward*, re-showing the overlay and leaving the app permanently covered.
* **Solution**: Unify the loader logic into a single event-driven progress manager (`window.setLoaderProgress()`). Track successful boot via a boolean flag (`window.__drCatBooted = true`) and verify it inside all loader timers and event handlers to discard stale tasks.

### 9. Capturing-Phase Error Listeners Trapping Non-Fatal Asset 404s
* **Problem**: Listening to `error` events in the capturing phase (`true`) to catch early startup module crashes also traps normal resource loading failures (like a `404 Not Found` for `capacitor.js` on localhost). If the error handler automatically locks the loading screen visible on any error, these harmless warnings will freeze the app.
### 10. Express 5 & Capacitor Android CORS Preflight Handling
* **Problem**: Native Android Capacitor WebViews send `Origin: http://localhost` or `Origin: capacitor://localhost` with custom headers (`X-App-Version`, `X-Install-ID`, `ngrok-skip-browser-warning`). Standard Express CORS configurations dropped these custom headers or failed OPTIONS preflights, causing WebViews to block requests.
* **Solution**: Integrated explicit `cors` middleware with `app.options('{*path}', cors(corsOptions))` preflight handling and whitelisted all custom headers in both `server/index.js` and `server/middleware/cors.js`.

### 11. Double-Slash URL Normalization (`//api/*`)
* **Problem**: When a configured tunnel base URL has a trailing slash (`https://domain.dev/`), appending `/api/search-status` produces a double slash (`//api/search-status`). In Express 5 / `path-to-regexp` v8, `//api` is parsed as the hostname, causing routes to return `404 Not Found`.
* **Solution**: Implemented top-level Express middleware (`req.url.replace(/^\/+/, '/')` and `delete req._parsedUrl`) to clean double slashes before routing, while sanitizing client-side base URLs in `api.js` and `main.js`.

### 12. Android `build.gradle` & Capacitor `localhost` Versioning
* **Problem**: Android OS Settings reads `versionName` directly from `android/app/build.gradle` (which was hardcoded to `"1.0"`). Furthermore, Capacitor WebViews run under `location.hostname === 'localhost'`, causing `isLocalhost` version checker guards to mistakenly bypass Kill Switch force updates.
* **Solution**: Synchronized `android/app/build.gradle` (`versionCode 10110`, `versionName "1.1.10"`) with `package.json`, and updated `version-checker.js` so `isLocalhost` exemption only applies to desktop web browser developers (`!isNativeApk`).

---

### 13. Static Caching of App Modes
* **Problem**: Caching the app mode statically at launch (e.g., locking the app mode to `ANDROID_OFFLINE` on standalone Capacitor boot) prevents background sync handlers from ever retrieving remote server updates, even if they detect the server is reachable. Calling `api.fetchCats()` continues to load local bundle copies.
* **Solution**: Implement dynamic setter interfaces (`api.setAppMode()`) that dispatch custom DOM events (`drcat-app-mode-changed`) so that relevant UI elements automatically re-evaluate their state (e.g., toggling edit controls or refreshing data grids).

### 14. Invoking Catch Handlers on Synchronous Methods
* **Problem**: Attempting to attach `.catch()` directly to synchronous functions (like asset builders that return `undefined`) throws a `TypeError` which blocks thread execution and crashes the boot phase.
* **Solution**: Standardize synchronous wrapper callbacks or wrap synchronous tasks inside a try/catch block inside a non-blocking `setImmediate()` or next-tick deferral.

### 12. Temporal Dead Zone (TDZ) in Fallback Variables
* **Problem**: Referencing a block-scoped `const` variable (like a fallback config array) inside a catch statement *before* the variable's declaration line causes a `ReferenceError` TDZ violation.
* **Solution**: Always declare fallback variables at the very top of the function scope so they are fully initialized and accessible from all catch blocks.

### 13. Capacitor Mobile WebView CORS Origin Limits
* **Problem**: Standalone mobile apps running in Capacitor use custom webview origin schemes (e.g., `http://localhost` on Android or `capacitor://localhost` on iOS) without any port designation. If the backend CORS configurations only allowed origins with ports (e.g., `http://localhost:3000`), mobile client requests were blocked by the browser engine.
* **Solution**: Explicitly add the portless schemes (`http://localhost`, `capacitor://localhost`) and wildcards as allowed origins by default on the server.

### 14. False Positives in Server Pings using `no-cors`
* **Problem**: Using `mode: 'no-cors'` in network pings returns an opaque response with status `0` even if the server is unreachable or intercepts the request with a warning HTML page (like Ngrok's phishing interstitial). This triggers false-positive "online" transitions.
* **Solution**: Perform standard CORS requests for connectivity checks and dynamically inject the active provider's skip headers to verify true API availability.

### 15. Capacitor Android WebView Sends `https://localhost`, Not `http://localhost`
* **Problem**: All CORS allowlists were written assuming `http://localhost` as the Capacitor app's origin. On real Android tablets running Chrome WebView 148+, the Capacitor context sends `Origin: https://localhost` (with **https**). The server rejected this origin silently, set no CORS headers on the OPTIONS preflight, and the browser blocked every real request — showing "Failed to fetch" on the GET, never on the OPTIONS.
* **Discovery**: Only visible by reading raw request headers from the Ngrok inspector (`http://localhost:4040/inspect/http`). The origin field read `https://localhost`, not `http://localhost`.
* **Solution**: Always add both `http://localhost` **and** `https://localhost` (plus their port variants) to every CORS allowlist and origin check. Never assume the protocol of a Capacitor WebView origin.

### 16. CORS Preflight (`OPTIONS`) Must Set Headers Before Returning 204
* **Problem**: The CORS middleware set response headers inside an `if (allowAll)` block, but returned `res.sendStatus(204)` **outside** that block. If the origin wasn't recognized, the 204 came back with zero CORS headers. The browser treated the bare 204 as a CORS rejection and blocked the actual GET — even though the OPTIONS itself "succeeded" with 204.
* **Solution**: The `OPTIONS` early return must be placed **inside** the `if (allowAll)` block, or placed after all headers are unconditionally set. A 204 without `Access-Control-Allow-Origin` is a CORS block from the browser's perspective.

### 17. SVG Element `className` Type Mismatch in Event Listeners
* **Problem**: A global click listener tracking user interaction latency crashed when users clicked on SVG icons (like FontAwesome `<i>` or `<svg>` tags). In JavaScript, the `className` of an HTML element is a string, but the `className` of an SVG element is an instance of `SVGAnimatedString` (an object). Calling `.split(' ')` directly on this object throws a `TypeError: split is not a function`, killing the click event bubble.
* **Solution**: Before performing string operations like `.split()` or `.includes()` on `element.className`, always check that its type is a string using `typeof element.className === 'string'`.

### 18. Git-Ignored Configuration Files in CI Pipelines
* **Problem**: Storing local server parameters (like private Ngrok links) in git-ignored config files (e.g. `remote_server_config.json`) is great for local security, but causes the remote build container (GitHub Actions) to compile the APK with empty configurations. This left the generated standalone APK stuck in local offline mode upon fresh install.
* **Solution**: Modify the CI workflow file to check for a repository secret (e.g., `REMOTE_SERVER_URL`) and dynamically generate the required config files inside the runner's workspace before executing the build. This maintains credential confidentiality while ensuring builds boot up online out-of-the-box.

### 19. GitHub Actions Release Signing SDK Build-Tools Deprecation
* **Problem**: The `r0adkll/sign-android-release@v1` step fails on newer Ubuntu runner environments if it defaults to build-tools `29.0.3` because older Android SDK versions are regularly deprecated and purged from GitHub-hosted runner images to conserve space.
* **Solution**: Always specify the `BUILD_TOOLS_VERSION` environment variable (e.g. `BUILD_TOOLS_VERSION: "34.0.0"`) to match the project target SDK version, ensuring the signing tool looks for a package guaranteed to be pre-installed on the runner.

### 20. Android Adaptive Launcher Icons with Solid Backgrounds (JPEG)
* **Problem**: Generating adaptive foreground layers directly from a JPEG logo containing a solid background creates a smaller opaque square in the center of the foreground layer. When launchers apply masks, this leaves an ugly colored "square inside a circle" shape instead of a seamless icon.
* **Solution**: Clean the logo on-the-fly inside `generate_icons.sh` using ImageMagick keying (`-fuzz 5% -transparent "white"`) to make the background transparent before scaling and padding. This outputs a clean, transparent logo foreground that matches any adaptive shape beautifully.

### 21. DB Revision History Bloat vs Sync Network Payload
* **Problem**: Storing old field snapshots in each database item's `history` field builds a valuable change log, but loading this log on client apps wastes local memory and increases sync download size (causing network bloat for normal users).
* **Solution**: Keep the history array inside the server's master `cats_db.json` but strip it dynamically in `server.js` when responding to public sync requests, and inside `build.js` when packaging the offline app resources. This keeps the client payloads lightweight while keeping server archives intact.

### 22. Plain-Text Admin Password Storage
* **Problem**: Storing admin passwords in plain text in `admin_password.txt` exposes credentials if the file is accidentally committed or accessed.
* **Solution**: Migrated to PBKDF2 hashing with random salt using `set_admin_password.js`. The server auto-generates a strong random password on first run if no credentials exist, and developers can set custom passwords via the CLI tool.

### 23. Inline Event Handlers in Static HTML
* **Problem**: Inline `onclick=` attributes in `index.html` mix behavior with structure, making the code harder to maintain and audit.
* **Solution**: Extracted all inline handlers into modular JavaScript components and removed them entirely from the HTML. Admin actions now use event delegation and `showToast()` instead of `alert()`.

### 24. Duplicate State Calculations
* **Problem**: `calculateStats()` was called redundantly in multiple places, causing unnecessary CPU work on low-end Android devices.
* **Solution**: Centralized stats calculation and removed duplicate invocations.

### 25. Memory Leaks in Diagnostics Panel
* **Problem**: The diagnostics panel registered `beforeunload` and interval timers without cleanup, causing memory accumulation during long sessions.
* **Solution**: Added explicit cleanup functions and `beforeunload` handlers to clear intervals and prevent leaks.

### 26. Forced Reflow & Layout Thrashing (Browser Performance Violations)
* **Problem**: Modifying the DOM (e.g., updating `.innerHTML` or toggling CSS classes) followed immediately by reading a layout property (like `scrollHeight`, `offsetHeight`, or `offsetWidth`) forced the browser to run synchronous layout reflow calculations, causing performance stutters and browser console warnings.
* **Solution**: 
  1. For scroll containers, wrapped the `scrollTop = scrollHeight` assignment in a `setTimeout(..., 0)` to defer execution to a future macro-task. Since the browser performs style recalculation and layout updates before the next macro-task executes, reading `scrollHeight` is layout-safe and does not trigger synchronous forced reflow (unlike `requestAnimationFrame`, which runs *before* paint and still forces reflow if DOM updates are pending).
  2. For animation resets, replaced the synchronous `offsetWidth` read trick with a double `requestAnimationFrame` wrapper, allowing the browser to render the class removal frame first, and then add the animation class back cleanly in the next frame.

### 27. Hash Caching vs. Quality Updates in Offline Generators
* **Problem**: When a master index bundler uses file hashes (SHA-256) to skip redundant parsing of massive files (e.g., PDFs), it will ignore explicit user requests to "upgrade" a specific file to a higher-quality parser, because the underlying source file hash hasn't changed.
* **Solution**: The bundler's skip-logic must evaluate *both* the source file hash *and* the cached extraction quality tier. If the extraction quality metadata upgrades (e.g. from `offline` to `llamaparse`), the bundler must regenerate the master index even if the source file is identical.

### 28. Dual-Field Backward Compatibility in JSON Migrations
* **Problem**: Changing a core data property in a heavily cached environment (e.g., changing PDF page content fields from `text` to `content`) immediately breaks the search engine for clients holding old cached data, while new clients break when reading old data.
* **Solution**: Implement dual-field reading (`p.content || p.text`) in the search loops. This allows the system to seamlessly bridge old and new JSON schemas without requiring forced cache purges across thousands of Android client devices.

### 29. Securing Admin HTML Pages (Beyond API Protection)
* **Problem**: Protecting API routes (`/api/admin/*`) with admin tokens prevents unauthorized data access, but leaving the static HTML interface (e.g. `pdf_lab.html`) in the `public/` folder exposes the admin UI layout to anyone guessing the URL. 
* **Solution**: Use Express middleware to intercept requests to the specific HTML file and assert `isLocalhostConnection`. If the request originates remotely, block it with a 403 Forbidden. This ensures the admin UI is truly invisible to the public internet without requiring complex cookie/session configurations on static files.

### 30. Capacitor Android — Navigation Bar Dark Gap (Edge-to-Edge)
* **Problem**: A dark empty space appears between app content and the 3-button Android navigation bar in the Capacitor APK. The gap cannot be selected by Eruda/DOM inspector, proving it is native (outside the WebView). `window.innerHeight` is smaller than expected — more than just status bar + nav bar height.
* **Root Cause**: `adjustMarginsForEdgeToEdge: "disable"` in `capacitor.config.json` causes Capacitor's `BridgeActivity.super.onCreate()` to internally call `WindowCompat.setDecorFitsSystemWindows(window, true)`, reverting edge-to-edge mode and shrinking the window — leaving a native dead zone between the WebView and the nav bar. Important: `"none"` is NOT a valid value (silently falls back to `"auto"`). Valid values are `"auto"`, `"force"`, `"disable"`.
* **Diagnostic**: Inject a JS overlay into `index.html` printing `screen.h - win.h` and `env(safe-area-inset-bottom)`. If `safe-bot = 0px`, Capacitor has reverted edge-to-edge and the window is smaller than the screen.
* **Fix**: In `android/app/src/main/java/com/drcat/app/MainActivity.java`, call `WindowCompat.setDecorFitsSystemWindows(getWindow(), false)` **after** `super.onCreate()` to override Capacitor's revert:
  ```java
  import androidx.core.view.WindowCompat;
  public class MainActivity extends BridgeActivity {
      @Override
      protected void onCreate(Bundle savedInstanceState) {
          super.onCreate(savedInstanceState);
          WindowCompat.setDecorFitsSystemWindows(getWindow(), false);
      }
  }
  ```
* **Also required**: `activity_main.xml` must use `FrameLayout` (not `CoordinatorLayout`), and `Keyboard.resize: "none"` in `capacitor.config.json`. Add `padding-bottom: max(16px, env(safe-area-inset-bottom))` to scrollable content containers in CSS.
* **Do NOT try**: `adjustMarginsForEdgeToEdge: "none"` (invalid), `windowSoftInputMode="adjustNothing"` (breaks top insets / pushes header down), or overriding `ViewCompat.setOnApplyWindowInsetsListener` on the WebView parent (doesn't help when Capacitor reverts at window level).

---

### 31. Relative API URL Failures on Standalone Native Capacitor Android Builds
* **Problem**: Calling relative API paths (e.g. `fetchWithTimeout('/api/server-providers')`) works cleanly on local web browsers (where the origin is `http://localhost:3000`), but fails completely on native standalone Android APKs. In Capacitor Android, the WebView origin is `https://localhost` (a local webview container). The browser engine attempts to fetch `https://localhost/api/server-providers` which returns 404 / Connection Refused because the local Android WebView has no backend server listening on `/api`.
* **Solution**: Every client API call targeting `/api/*` MUST be wrapped with `getApiUrl('/api/...')` (defined in `public/js/api.js`). On native standalone Capacitor builds, `getApiUrl()` automatically prepends the configured remote server URL (e.g. `https://ngrok-tunnel-url/...`), routing network requests correctly to the backend server.

### 32. Version Guard Route Exclusion Deadlocks (Admin Lockout)
* **Problem**: When a server-controlled Kill Switch (`forceUpdateActive: true`) is enabled on the server, the version guard middleware intercepts incoming data endpoints and responds with `HTTP 426 Upgrade Required`. If administrative endpoints (such as `PUT /api/admin/version`) or server discovery routes (`GET /api/server-providers`) are not excluded from the version guard, administrative requests are blocked with HTTP 426, creating a deadlock where the admin can never log in or disable the Kill Switch.
* **Solution**: Explicitly add administrative configuration routes (`/api/admin/version`), server discovery routes (`/api/server-providers`), static resources, and health endpoints to the route exclusion list in `server/middleware/version-guard.js` before evaluating version limits.

### 33. Target-Specific Version Guarding (Android APK vs. Web/PWA)
* **Problem**: Applying a strict hard Kill Switch lock to web browser visitors (`http://localhost` or web domains) blocks web users and developers unnecessarily. Web browsers receive live, updated code directly from the server on page load and do not run compiled device binaries.
* **Solution**: Differentiate client environments. Native Android APKs send the `X-App-Version` header on every request; web browsers do not. In `version-guard.js`, if `X-App-Version` is missing, the request is allowed through as a web client. In `version-checker.js`, checking `if (!isNativeApk) return;` ensures web users experience zero lockouts or version checks, keeping hard Kill Switch enforcement strictly focused on compiled native mobile APKs.

### 34. Preserving Anonymous Installation IDs Across Storage Purges
* **Problem**: When a Kill Switch force update triggers a hard storage purge (`localStorage.clear()`), non-essential caches are wiped. If an anonymous client Installation ID (`dr_cat_install_id`) is stored in `localStorage` without protection, the storage clear erases the ID. When the user opens the updated app, a new UUID is generated, creating a false metric inflation (counting 1 user as multiple new users).
* **Solution**: In `version-checker.js` (`wipeStorageOnLock()`), back up `dr_cat_install_id` before calling `localStorage.clear()` and immediately restore it back to `localStorage` after the wipe completes. This guarantees token persistence across app updates and purges.

### 35. Deep Multi-Token CAT Content Search vs. Title-Only Filtering
* **Problem**: Filtering CAT clinical items solely by `title` or `category` fails when doctors search for specific symptoms, prescriptions, posologies, or diagnostic criteria (e.g., searching for `"otomycose"`, which lives inside the `ordonnance` or `summary` of CAT #22 "Otite Externe").
* **Solution**: Upgrade `filterCats()` in `public/js/components/sidebar.js` to construct a unified searchable text space (`title`, `summary`, `ordonnance`, `red_flags`, `category`, `pdf_keywords`, `notes`). Tokenize the search query by whitespace and assert that *every* query token appears somewhere within the unified text space. This enables instant deep content search across all clinical fiches.

### 36. Omission of Utility Stylesheets in HTML String Manipulations
* **Problem**: Editing `index.html` via string replacements can accidentally remove core CSS link tags (such as `css/utilities.css`). This causes subtle, hard-to-debug layout shifts across the dashboard, breaking flex button alignments and dark/light mode button positioning without throwing JavaScript exceptions.
* **Solution**: Always audit stylesheet link tags in `index.html` after major HTML updates, and run UI layout verification checks to confirm component alignments remain pristine.

### 37. Complete Prohibition of Destructive `localStorage.clear()` in Version Lock Gates
* **Problem**: In early implementations of the Security Lock Gate (`version-checker.js`), triggering a Kill Switch or Force Update called `localStorage.clear()`. This permanently destroyed the doctor's personal clinical notes (`dr_cat_notes_*`), reading history (`dr_cat_user_progress`), Leitner spaced repetition stats (`dr_cat_leitner`), and study streaks (`dr_cat_streak`), even if the admin turned off the Kill Switch later.
* **Solution**: Completely remove `localStorage.clear()`, `sessionStorage.clear()`, and `indexedDB.deleteDatabase()` from `version-checker.js`. Lock gates must strictly block UI interaction while leaving 100% of user data intact. Only temporary network HTTP cache keys (`dr_cat_synced_db`) should ever be cleared.

### 38. Native AAPT Exclusions & Production Asset Hardening for Capacitor APKs
* **Problem**: Standard `capacitor sync android` copies the entire `public/` web directory into `android/app/src/main/assets/public/`. This accidentally packages unbundled raw ES module source files (`public/js/components/`, `public/js/lib/`, `main.js`, `api.js`, `utils.js`) alongside the compiled bundle (`dist/app-*.js`). Decompiling tools (`apktool`, `jadx`) can extract these raw source files.
* **Solution**: Implement a 2-stage hardening architecture: (1) Add `clean_android_assets.js` to `"cap:sync"` in `package.json`, and (2) Configure `aaptOptions.ignoreAssetsPattern` in `android/app/build.gradle` to permanently exclude raw JS source folders (`components`, `lib`, `workspace`, `dashboard`, `main.js`, `api.js`, `utils.js`, `state.js`). Any APK built by Android Studio or GitHub Actions will contain ONLY `dist/app-*.js` and zero readable source files.

### 39. Dual-Tier Author Credit Attribution (UI vs. Metadata)
* **Problem**: Inconsistent author credits across app interfaces, legal disclaimers, and metadata files creates confusion for copyright licensing, app store publishing, and legal liability.
* **Solution**: Enforce a strict dual-tier attribution standard across the project: (1) **User-Facing UI Credit**: Display **`Dr. Kibeche Ali`** (in Dashboard footer, About modal, Legal/CGU disclaimer); (2) **Code & Legal Metadata**: Display **`Dr. Kibeche Ali Dia Eddine`** (in `package.json`, `LICENSE`, `server/index.js`, and `android/app/build.gradle`).

### 40. JavaScript `ISO String` vs `Numeric Milliseconds` Type Coercion Bug in Data Sync Filtering
* **Problem**: Newly promoted or updated CATs on the server were not being detected by client devices (Android APK or PWA) during background sync. The client received an empty update list `[]` and logged `[Background Sync] Remote database is in sync. No action needed.` despite active server database changes.
* **Root Cause**: The client sends a numeric timestamp in milliseconds (`?since=1785700000000`). When CATs were saved or promoted in the database, `updatedAt` was formatted as an ISO Date String (`"2026-08-03T23:17:08.210Z"`). In JavaScript array filtering, comparing a string directly to a number (`"2026-08-03T23:17:08.210Z" > 1785700000000`) converts the string to `NaN`. Since `NaN > number` evaluates to `false`, the server silently filtered out all updated records.
* **Fix (`server/routes/cats.js`)**: All timestamp filters in API routes MUST explicitly parse date fields using `typeof val === 'number' ? val : new Date(val).getTime()` to prevent silent type coercion failures between ISO strings and epoch numbers.

### 41. Replacing Pseudo-Numeric Prompt Weighting Placebos with Strict Priority Directives
* **Problem**: Early system prompts used pseudo-numeric percentage weights (e.g. `50% PDF Index`, `30% Web RAG`, `20% AI reasoning`). LLM Transformer models do not perform internal floating-point arithmetic on prompt text. Pseudo-numeric weights can distract attention heads by introducing artificial math tokens.
* **Solution**: Replace pseudo-numeric percentages with an explicit, unambiguous **Strict Priority Order Directive** (`PRIORITÉ 1 (Baseline Locale)`, `PRIORITÉ 2 (Enrichissement Web)`, `PRIORITÉ 3 (Synthèse IA)`). This maintains 100% of the local Algerian drug priority (*Ascabiol*, *Spasfon*, *Smecta*) and doctor-grade Web RAG enrichment while delivering a clean, placebo-free prompt.



