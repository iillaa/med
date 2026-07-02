# Lessons Learned (lessons_learned.md) 📝

A log of engineering choices, debug logs, and architectural mistakes to avoid when developing **Dr. CAT**.

---

## 🪵 Key Lessons & Good Choices

### 1. Atomic DB Writes
* **Choice**: Writing to JSON databases via a `.tmp` file and then renaming it.
* **Benefit**: Prevents database truncation/corruption. If Termux is closed, or the phone runs out of battery mid-write, the existing file remains intact.

### 2. Localhost Verification via Raw Sockets
* **Choice**: Locking the login route by matching `req.socket.remoteAddress` and evaluating proxy headers (`X-Forwarded-For`).
* **Benefit**: Guarantees that remote users accessing the app via port-forwarding (e.g., ngrok tunnels) cannot access the admin login page or brute-force administrative credentials.

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
* **Problem**: When accessing the server remotely via an ngrok public tunnel, browsers without existing cookies or with strict privacy shield configurations (e.g. Brave, Firefox Private) intercept AJAX JSON calls and receive the ngrok HTML landing warning page. Parsing this HTML as JSON throws SyntaxErrors (unexpected '<') and breaks application startup (empty list rendering).
* **Solution**: Updated `getHeaders()` to check if `window.location.hostname` contains `ngrok` dynamically. This automatically injects the `ngrok-skip-browser-warning: true` header to bypass the warning for all browser/app users.

### 6. Misaligned Closing Elements causing UI Leaks
* **Problem**: Misplaced closing `</div>` tags in the HTML can break layout containers. If an admin-only block is closed too early, succeeding admin components spill outside the container and bypass the admin state check, rendering visible to ordinary guest users.
* **Solution**: Enforce strict validation of DOM hierarchy. Ensure all admin-only modules are fully encapsulated inside `#admin-moderation-panel`.

