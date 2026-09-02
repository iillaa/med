# Engineering Post-Mortems & Debugging Ledger (lessons_learned.md)

> **Document Type**: Technical Reference & Root-Cause Ledger  
> **Target Audience**: Senior Engineers & Autonomous AI Agents  
> **Status**: Production Stable (v1.19.0+)

---

## 1. Storage, File Systems & State Persistence

### 1.1 Atomic JSON File Persistence
* **Impacted Components**: `server/services/data-store.js`, `server/services/sync-suggestions.js`
* **Runtime Environment**: Node.js 20+ (Linux Termux on Android)
* **Symptom**: Process killed mid-write (device power-off, battery cut, or Termux kill) results in a 0-byte JSON file, throwing fatal parse exceptions on boot (`SyntaxError: Unexpected end of JSON input`).
* **Root Cause**: `fs.writeFileSync(path, data)` truncates the destination file prior to flushing buffer contents. If interrupted between truncation and flush, the file descriptor closes empty.
* **Code Implementation**:
```javascript
// FAULTY
fs.writeFileSync(targetPath, JSON.stringify(data, null, 2), 'utf8');

// FIXED (Atomic Swap Pattern)
const tempPath = `${targetPath}.tmp.${Date.now()}.${Math.random().toString(36).slice(2, 8)}`;
fs.writeFileSync(tempPath, JSON.stringify(data, null, 2), 'utf8');
fs.renameSync(tempPath, targetPath); // POSIX atomic file replacement
```

---

### 1.2 User Data Protection & Lock Screen Storage Invariant
* **Impacted Components**: `public/js/version-checker.js`, `public/js/components/modals.js`
* **Runtime Environment**: Browser (Web) & Capacitor WebView (Android)
* **Symptom**: Calling `localStorage.clear()` upon triggering an update barrier permanently purges user-generated medical annotations, Leitner progress, and reading history.
* **Root Cause**: Destructive storage purges conflate volatile network cache with persistent user state.
* **Storage Namespace Invariant**:
  - **Persistent User State (NEVER PURGED)**: `dr_cat_notes_*`, `dr_cat_user_progress`, `dr_cat_leitner`, `dr_cat_streak`, `dr_cat_install_id`.
  - **Volatile Cache (Purgeable)**: `dr_cat_synced_db`.
```javascript
// FAULTY
function lockApplication() {
  localStorage.clear(); // Destroys all clinical notes and user history
  showLockScreen();
}

// FIXED
function lockApplication() {
  localStorage.removeItem('dr_cat_synced_db'); // Evict transient data cache only
  showLockScreen(); // Renders blocking overlay while leaving IndexedDB and notes intact
}
```

---

### 1.3 JavaScript ISO 8601 vs. Epoch Timestamp Sync Coercion
* **Impacted Components**: `server/routes/cats.js`, `public/js/api.js`
* **Runtime Environment**: V8 Engine (Node.js & Chrome WebView)
* **Symptom**: Incremental background sync requests return empty arrays `[]` despite database modifications on the server.
* **Root Cause**: Client passes integer timestamp query (`?since=1785700000000`). Database records contain ISO 8601 strings (`"2026-08-03T23:17:08.210Z"`). In JavaScript, `"2026-08-03T23:17:08.210Z" > 1785700000000` evaluates to `false` because string-to-number coercion returns `NaN`, and `NaN > number` is always `false`.
```javascript
// FAULTY
const updated = items.filter(i => i.updatedAt > req.query.since);

// FIXED
const since = Number(req.query.since) || 0;
const updated = items.filter(i => {
  const itemTime = typeof i.updatedAt === 'number' ? i.updatedAt : new Date(i.updatedAt).getTime();
  return !isNaN(itemTime) && itemTime > since;
});
```

---

### 1.4 Primary Key (`id`) Data Integrity vs. Title String Matching
* **Impacted Components**: `cat_db_generator/generate_cat_db.js`, `server/routes/cat-generator.js`
* **Symptom**: Customizing or cleaning a CAT title caused database lookups to fail, generating duplicate cards with epoch IDs (`Date.now()`).
* **Root Cause**: Relying on mutable text strings (`title`) for entity identification.
* **Invariant**: All mutations, generator prompts, and curation workflows must address records via immutable sequential integer IDs (`id: 1, 2, ...`). Titles are treated as arbitrary human-readable metadata.

---

### 1.5 Database Isolation via Environment Injection
* **Impacted Components**: `tests/run_all_tests.js`, `server/index.js`, `server/routes/cats.js`
* **Symptom**: Test suite crashes leave test records in `cats_db.json`.
* **Fix**: Backend modules read database path from `process.env.CATS_DB_PATH || path.join(__dirname, '../data/cats_db.json')`. Test harnesses spawn server instances with isolated test files (`cats_db_test_*.json`).

---

## 2. UI/UX Rendering, CSS Engine & View Transitions

### 2.1 Gecko Engine 16ms Snapshot Flash (View Transitions API)
* **Impacted Components**: `public/css/variables.css`, `public/js/components/header.js`
* **Runtime Environment**: Gecko 144+ (Mozilla Firefox)
* **Symptom**: Clicking theme switch causes a 1-frame (16ms) full-screen flash of the destination state before the circular expand animation begins.
* **Root Cause**: When `document.startViewTransition()` callback resolves, Gecko paints `::view-transition-new(root)` at 100% viewport coverage during compositor frame initialization before the Web Animations API `animate()` call takes over.
* **Fix**:
```css
html.is-firefox ::view-transition-new(root) {
  clip-path: circle(0px at var(--theme-x, 50%) var(--theme-y, 50%));
}
```

---

### 2.2 Mobile Chrome Viewport Calculation (`100vh` vs `100dvh`)
* **Impacted Components**: `public/css/modal.css`, `public/css/update-modal.css`
* **Runtime Environment**: Chrome Mobile on Android Tablets
* **Symptom**: Modal dialogs stretch past visible viewport, pressing directly against the browser address bar with 0px margin.
* **Root Cause**: `100vh` computes height using the maximum possible viewport (as if the dynamic browser URL bar was fully retracted).
* **Fix**:
```css
.modal-card, .reader-modal-content {
  max-height: min(680px, calc(100dvh - 48px));
  padding: max(20px, env(safe-area-inset-top)) 16px max(20px, env(safe-area-inset-bottom));
}
```

---

### 2.3 Mobile WebView 300ms Click Delay
* **Impacted Components**: `public/css/utilities.css`, `public/css/sidebar.css`
* **Runtime Environment**: Android WebView (Chromium Blink)
* **Symptom**: 300ms delay between touch release and event execution on buttons.
* **Root Cause**: Browser waits for potential double-tap gesture.
* **Fix**:
```css
.cat-item, .tab-btn, .action-btn, .filter-btn, .calc-btn {
  touch-action: manipulation;
  -webkit-tap-highlight-color: transparent;
}
```

---

### 2.4 Flash of Unstyled Content (FOUC) on Reload
* **Impacted Components**: `public/index.html`, `public/style.css`
* **Symptom**: Browser briefly renders raw unstyled HTML elements on reload.
* **Root Cause**: Asynchronous stylesheet loading (`media="print" onload="this.media='all'"`) allows the browser to paint before CSSOM construction completes.
* **Fix**: Synchronous CSS linking paired with an inline `#app-loading-overlay` splash veil locked at `z-index: 999999` in critical head CSS, faded out via class trigger when `window.__drCatBooted = true`.

---

### 2.5 Layout Thrashing via Synchronous DOM Reads
* **Impacted Components**: `public/js/components/workspace.js`
* **Symptom**: Console warnings: `[Violation] Forced reflow while executing JavaScript`.
* **Root Cause**: Reading `scrollHeight` immediately after mutating `.innerHTML`.
* **Fix**: Defer layout property reads to next macro-task via `setTimeout(..., 0)` or double `requestAnimationFrame()`.

---

### 2.6 SVG Element `className` Type Mismatch
* **Impacted Components**: `public/js/main.js` (Global Click Dispatcher)
* **Symptom**: `TypeError: element.className.split is not a function`.
* **Root Cause**: On SVG elements, `className` is an instance of `SVGAnimatedString`, not `String`.
* **Fix**:
```javascript
// FAULTY
const classes = element.className.split(' ');

// FIXED
const classStr = typeof element.className === 'string' 
  ? element.className 
  : (element.className?.baseVal || '');
const classes = classStr.split(' ');
```

---

## 3. Mobile Platform (Capacitor & Android Native)

### 3.1 Edge-to-Edge Navigation Bar Inset Dead Zone
* **Impacted Components**: `android/app/src/main/java/com/drcat/app/MainActivity.java`, `capacitor.config.json`
* **Runtime Environment**: Android 14+ (API Level 34)
* **Symptom**: Dark unselectable gap between WebView and system 3-button navigation bar.
* **Root Cause**: Capacitor `BridgeActivity` calls `WindowCompat.setDecorFitsSystemWindows(window, true)` when `adjustMarginsForEdgeToEdge` is disabled, shrinking the window.
* **Fix**:
```java
// MainActivity.java
package com.drcat.app;
import android.os.Bundle;
import androidx.core.view.WindowCompat;
import com.getcapacitor.BridgeActivity;

public class MainActivity extends BridgeActivity {
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        WindowCompat.setDecorFitsSystemWindows(getWindow(), false);
    }
}
```

---

### 3.2 Standalone APK Relative API URL Routing
* **Impacted Components**: `public/js/api.js`
* **Runtime Environment**: Android WebView (Origin `https://localhost`)
* **Symptom**: `fetch('/api/version')` fails with 404 / Connection Refused on standalone APK.
* **Root Cause**: On native Android builds, the app is served from the internal asset loader (`https://localhost`). Relative requests target `https://localhost/api/...` where no backend server exists.
* **Fix**: All client fetch operations pass through `getApiUrl(endpoint)`:
```javascript
export function getApiUrl(endpoint) {
  const cleanEndpoint = endpoint.startsWith('/') ? endpoint : `/${endpoint}`;
  if (window.Capacitor && window.Capacitor.isNativePlatform()) {
    const base = window.REMOTE_SERVER_URL || 'https://drcat.is-an-app.workers.dev';
    return `${base.replace(/\/+$/, '')}${cleanEndpoint}`;
  }
  return cleanEndpoint;
}
```

---

### 3.3 Android WebView CORS Origin Matching (`https://localhost`)
* **Impacted Components**: `server/index.js`, `server/services/server-providers-config.js`
* **Symptom**: Android APK network requests fail CORS checks while desktop browser requests succeed.
* **Root Cause**: Chrome WebView on Android 148+ sets `Origin: https://localhost` (HTTPS scheme), whereas desktop dev environments send `http://localhost:3000`.
* **Fix**: Express CORS configuration must explicitly whitelist:
  - `http://localhost`
  - `https://localhost`
  - `capacitor://localhost`
  - `http://127.0.0.1`

---

### 3.4 Production APK Asset Stripping & Anti-Decompilation
* **Impacted Components**: `android/app/build.gradle`, `scripts/clean_android_assets.js`
* **Symptom**: Reverse engineering tools (`jadx`, `apktool`) extract unbundled ES module sources from `.apk` binaries.
* **Fix**:
  1. `package.json` `"cap:sync"` executes `node scripts/clean_android_assets.js` to delete raw JS development directories.
  2. `android/app/build.gradle` enforces AAPT ignore patterns:
```groovy
aaptOptions {
    ignoreAssetsPattern '!.svn:!.git:!.ds_store:!*.scc:.*:!CVS:!thumbs.db:!picasa.ini:!*~:components:lib:workspace:dashboard:main.js:api.js:config.js:utils.js:state.js:install-id.js:debug-console.js'
}
```

---

## 4. Cloudflare Worker Edge & Termux Tooling

### 4.1 Termux arm64 `workerd` Binary Missing Shim
* **Impacted Components**: `package.json`, `scripts/termux-wrangler-fix.sh`
* **Runtime Environment**: Termux on Android ARM64
* **Symptom**: `npx wrangler deploy` or `npx wrangler whoami` fails with `Error: Unsupported platform: android arm64 LE`.
* **Root Cause**: `@cloudflare/workerd` does not distribute pre-compiled Android ARM64 binaries.
* **Fix**: `package.json` executes `"postinstall": "bash scripts/termux-wrangler-fix.sh"`, which detects the Android environment and injects a shim for workerd dependencies, allowing remote API commands (`deploy`, `whoami`, `secret put`) to operate normally.

---

### 4.2 Ngrok Phishing Interstitial Interception
* **Impacted Components**: `public/js/api.js`
* **Symptom**: AJAX endpoints return HTML error pages (`Unexpected token < in JSON`).
* **Root Cause**: Ngrok free tier displays an interstitial consent landing page on fresh browser origins.
* **Fix**: `api.js` appends `ngrok-skip-browser-warning: true` to all outgoing HTTP request headers.

---

### 4.3 Express 5 Double-Slash URL Normalization
* **Impacted Components**: `server/index.js`
* **Symptom**: Requests to `/api/version` return 404 when tunnel URL ends with a trailing slash (`https://domain.dev/`).
* **Root Cause**: Express 5 uses `path-to-regexp` v8, which interprets `//api/version` as a hostname rather than a root path.
* **Fix**: Middleware normalizes paths at the server root:
```javascript
app.use((req, res, next) => {
  req.url = req.url.replace(/^\/+/, '/');
  next();
});
```

---

## 5. Medical LLM Engine & Pharmacological Safety

### 5.1 Elimination of Pseudo-Numeric Prompt Weights
* **Impacted Components**: `cat_db_generator/lib/prompt-builder.js`
* **Symptom**: Prompt instructions containing `"50% PDF RAG, 30% Web, 20% AI"` caused unpredictable output formatting.
* **Root Cause**: LLM attention heads do not perform arithmetic balancing on percentage tokens; numbers introduce token noise.
* **Fix**: Replaced with strict discrete priority blocks:
  - `PRIORITY 1 (Local Clinical Baseline)`
  - `PRIORITY 2 (Academic RAG Knowledge)`
  - `PRIORITY 3 (Synthesis & Posology Formatting)`

---

### 5.2 Dosage Parser Validation via Canary Suites (`--canary`)
* **Impacted Components**: `cat_db_generator/lib/medical-validator.js`
* **Symptom**: Regex changes caused silent dosage parsing failures.
* **Fix**: `npm run generate -- --canary` executes a unit test across 15 standard clinical formulations prior to any database batch build. If any canary fails, the batch is aborted.
