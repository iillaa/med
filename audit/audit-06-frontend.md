# 🖥️ Audit 06 — Frontend Architecture & Code Quality
> Date: 2026-08-01 | Role: Frontend Engineer | Mode: Audit-Only

---

## FE-01
- **File/area:** `public/js/utils.js` line 21 — `showToast` innerHTML injection
- **Severity:** 🔴 CRITICAL
- **Problem:** `toast.innerHTML` receives the `message` string directly inside a template literal. This is an XSS sink — if any server-controlled or user-controlled string reaches `showToast()`, it executes as HTML/JS.
- **Evidence:** `toast.innerHTML = \`<i class="fa-solid ${icon}"></i><span class="t-msg">${message}</span>...\``.
- **Fix:** Use DOM methods: create the span, set `span.textContent = message`, then append — or call `DOMPurify.sanitize(message)` before injection.

---

## FE-02
- **File/area:** `public/js/api.js` lines 13-44 — global `window.fetch` monkey-patch
- **Severity:** 🟠 HIGH
- **Problem:** The entire `window.fetch` function is replaced globally at module load time. This means: (a) any library loaded later that uses `fetch` goes through Dr.CAT's perf logger; (b) if the monkey-patch throws (e.g., `CustomEvent` fails), ALL fetch calls break for the entire session; (c) error handling in the monkey-patch catches errors but re-throws them, so the original error propagation is preserved — but the wrapper adds latency to every single fetch call.
- **Evidence:** `window.fetch = async function(...args) { ... }` replaces global fetch.
- **Fix:** Use a narrower approach — intercept only Dr.CAT API calls by wrapping the specific `apiFetch()` utility function; leave `window.fetch` untouched.

---

## FE-03
- **File/area:** `public/js/main.js` lines 7-8 — duplicate named imports
- **Severity:** 🟠 HIGH
- **Problem:** `setupHardwareBackButton`, `setupAppLifecycle`, and `setupKeyboardHandling` are all imported from `'./components/native.js'` in THREE separate import statements (lines 7, 8, 9 per the file header). Each import line re-imports from the same module — while JS module caching prevents actual re-execution, this is dead code that the bundler may or may not tree-shake, and it makes the imports misleading.
- **Evidence:** Lines 7-9 in `main.js`.
- **Fix:** Combine into one import: `import { setupHardwareBackButton, setupAppLifecycle, setupKeyboardHandling } from './components/native.js';`.

---

## FE-04
- **File/area:** `public/js/main.js` — `window.handleAdminError` global pollution
- **Severity:** 🟠 HIGH
- **Problem:** `window.handleAdminError` is attached to `window` as a global function (line 61). This pattern leaks internal application logic into the global scope, making it callable/overridable by any script on the page (third-party libraries, injected scripts, browser extensions). It also creates a `prompt()` call that blocks the UI thread.
- **Evidence:** `window.handleAdminError = async function(err)` — line 61.
- **Fix:** Keep this as a module-private function and call it directly; remove the `window.` assignment.

---

## FE-05
- **File/area:** `public/js/api.js` — `_cachedAppMode` persists across app-mode changes incorrectly
- **Severity:** 🟠 HIGH
- **Problem:** `getAppMode()` caches `_cachedAppMode` permanently after the first call. `setAppMode()` can override it, but if `getAppMode()` is called before `setAppMode()` completes (race condition on init), the wrong mode is cached forever for that session. This can cause the app to incorrectly stay in `ANDROID_OFFLINE` mode when a server is reachable.
- **Evidence:** `if (_cachedAppMode) return _cachedAppMode;` — early return prevents re-evaluation.
- **Fix:** Allow `setAppMode()` to fully clear and reset the cache, and ensure mode detection runs after server reachability is confirmed.

---

## FE-06
- **File/area:** `public/js/main.js` lines 100-102 — generic error handlers swallow all errors
- **Severity:** 🟠 HIGH
- **Problem:** The global `window.addEventListener('error', ...)` and `window.addEventListener('unhandledrejection', ...)` show a generic toast but do not log the error details to the debug console or the audit log. Users see a non-actionable toast; developers see nothing useful unless they check the Eruda/debug console.
- **Evidence:** Lines 96-102: event listeners with `showToast(...)` and no `console.error` or structured error capture.
- **Fix:** Add `console.error('[UnhandledError]', event.error || event.reason)` inside both handlers before showing the toast.

---

## FE-07
- **File/area:** `public/js/components/workspace.js` (37 KB — largest component)
- **Severity:** 🟡 MEDIUM
- **Problem:** The workspace component is 37,691 bytes — the largest JS file in the project. This suggests it is doing too many things (violating single responsibility). Without reading it fully, the sheer size is a maintainability red flag and likely causes difficult-to-trace state bugs and memory leaks if event listeners are not cleaned up on component destroy.
- **Evidence:** File size: 37 KB for a single component.
- **Fix:** Audit `workspace.js` for event listeners — ensure all `addEventListener` calls have matching `removeEventListener` calls when the workspace closes. Consider splitting into sub-components.

---

## FE-08
- **File/area:** `public/js/api.js` lines 51-58 — `isOfflineApp` uses unreliable UA sniffing
- **Severity:** 🟡 MEDIUM
- **Problem:** `navigator.userAgent.toLowerCase().includes('capacitor')` is used as one of several conditions for offline mode detection. User-Agent strings can be spoofed; more importantly, Termux's browser does not include 'capacitor' in its UA, so a Termux browser session on the local server might be incorrectly detected as offline.
- **Evidence:** Line 57: `navigator.userAgent.toLowerCase().includes('capacitor')`.
- **Fix:** The `!!window.Capacitor` check (line 56) is the reliable signal — the UA sniff is redundant and confusing. Remove the UA-based check.

---

## FE-09
- **File/area:** `public/js/lib/safeStorage.js` + `public/js/lib/helpers.js`
- **Severity:** 🟡 MEDIUM
- **Problem:** `safeStorage.js` wraps localStorage with try/catch. However, `public/js/api.js` line 58 still directly calls `localStorage.getItem('dr_cat_force_offline')` without using the safe wrapper — bypassing the protection it provides. This inconsistency means one localStorage access in a private browsing session (where localStorage can throw) could break offline mode detection.
- **Evidence:** `localStorage.getItem('dr_cat_force_offline')` in `api.js` line 58 — direct access.
- **Fix:** Import and use `safeGetItem` from `safeStorage.js` at this line.

---

## FE-10
- **File/area:** `public/index.html` (87 KB)
- **Severity:** 🟡 MEDIUM
- **Problem:** `index.html` is 87 KB — very large for an HTML file. This suggests inline styles, inline scripts, or massive HTML structure is embedded. Large HTML files delay First Contentful Paint (FCP) and Time to Interactive (TTI) — especially on mobile connections. Without seeing the full file, the size alone indicates critical CSS or JS is inlined unnecessarily.
- **Evidence:** File size: 87,972 bytes.
- **Fix:** Audit `index.html` for inlined styles/scripts that could be extracted to external files cached by the browser. Defer non-critical JS.

