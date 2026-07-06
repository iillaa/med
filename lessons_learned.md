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
* **Solution**: Filter out element-level errors by checking `if (event.target && event.target !== window) return;` to only process real JavaScript runtime execution crashes.

### 10. Static Caching of App Modes
* **Problem**: Caching the app mode statically at launch (e.g., locking the app mode to `ANDROID_OFFLINE` on standalone Capacitor boot) prevents background sync handlers from ever retrieving remote server updates, even if they detect the server is reachable. Calling `api.fetchCats()` continues to load local bundle copies.
* **Solution**: Implement dynamic setter interfaces (`api.setAppMode()`) that dispatch custom DOM events (`drcat-app-mode-changed`) so that relevant UI elements automatically re-evaluate their state (e.g., toggling edit controls or refreshing data grids).

### 11. Invoking Promise Catch Handlers on Synchronous Methods
* **Problem**: Attempting to attach `.catch()` directly to synchronous functions (like asset builders that return `undefined`) throws a `TypeError: Cannot read properties of undefined (reading 'catch')` which blocks thread execution and crashes the boot phase.
* **Solution**: Standardize synchronous wrapper callbacks or wrap synchronous tasks inside a try/catch block inside a non-blocking `setImmediate()` or next-tick deferral.

