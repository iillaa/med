# 🏁 Migration & Session Handoff Guide

Welcome to the next session of **Dr. CAT — Rappel Clinique** development! This document serves as a complete resume and guide so you can pick up exactly where the previous agent left off without starting from scratch.

---

## 🩺 Project Overview
**Dr. CAT** is a premium, offline-first medical clinical helper and review application designed for GPs. It operates in two environments:
1. **Node.js/Express Backend** (running locally on Termux/Linux server) serving a web interface.
2. **Capacitor wrapper Android app** (standalone offline-first APK built automatically via GitHub Actions CI/CD).

---

## 🌿 Git Branching & Active State
* **Active Branch**: `light-android` (holds the Capacitor wrappers, build workflows, and static JSON data dumps).
* **Remote Repository**: `https://github.com/iillaa/med.git`
* **Sync Status**: Both `master` and `light-android` branches are fully synchronized and pushed to GitHub.
* **Master Sync Strategy**: Non-database files are kept aligned. When committing changes on `light-android`, make sure to merge or check out the code files (`.gitignore`, `build.js`, `public/js/api.js`, `server.js`) into `master` to avoid database merge conflicts (`cats_db.json` / `pdf_index.json`).

---

## 🚀 Key Accomplishments & Major Bug Fixes
The following critical bugs have been successfully audited and resolved in the current workspace:

### 1. Zero-Setup Mobile/Tablet Server Connectivity (tunnel)
* **Problem**: In Capacitor/APK standalone mode, the app was entirely isolated. It couldn't fetch server updates or send suggestions because `REMOTE_SERVER_URL` was empty. Setting it manually via the Admin Diagnostics panel was impossible on mobile because the admin button was hidden for security.
* **Fix**: 
  - **Dynamic Compiler Injection**: The build script `build.js` reads the target URL from `remote_server_config.json` and bakes it directly into the static bundle at `public/js/remote_config.js` during compilation.
  - **Git-ignored config (no secret leak)**: `remote_server_config.json` stays git-ignored so the live tunnel URL is never committed. In CI, the `REMOTE_SERVER_URL` repository secret is written to that file just before the build runs, so cloud builds still compile the APK with the active URL. The server is the single source of truth at runtime; the client learns the list via `GET /api/server-providers` and the APK seeds from the baked `remote_config.js`.
  - **No stale localStorage override**: the client no longer keeps a device `localStorage` copy of the server URL that could diverge from the server — it uses the server-authoritative list (with priority-based failover and health-based load-balancing).

### 2. Website/App Silent Crashes
* **Problem**: AJAX network syntax errors (e.g. tunnel HTML warnings parsed as JSON) would silently freeze the app and show blank lists.
* **Fix**: Implemented global error boundaries, unhandled promise rejection interceptors, and fallback static fetches in `public/js/main.js` and `api.js` to isolate errors and prevent full crashes.

### 3. Aggressive Browser Caching
* **Problem**: Updates made on the server were not reflecting in browsers without manually clearing site data or using incognito mode due to aggressive PWA caching rules.
* **Fix**:
  - Replaced the *Cache-First* service worker strategy in `public/service-worker.js` with a **Network-First** strategy.
  - Bumped the cache version to `dr-cat-v2` to force immediate invalidation on user devices.
  - Configured `server.js` (`express.static`) to inject `Cache-Control: no-store, no-cache, must-revalidate` headers for `.html` files in addition to `.js` and `.css`.

### 4. Ngrok Warning & CORS Interception
* **Problem**: Browsers remote-connecting via tunnel were redirected to a landing page warning, breaking JSON parsing.
* **Fix**: `getHeaders()` dynamically checks if the hostname contains `tunnel` and automatically injects the `tunnel-skip-browser-warning: true` header to bypass the warning. The server explicitly allows this custom header in its CORS preflight options.

### 5. Secure Offline Suggestion Handling
* **Problem**: When offline or if the server was unreachable, proposed new CATs or modifications (meant as suggestions from guest users) fell back to local admin-like overrides (`createCatOnServer`/`saveCatDataToServer`). This generated ghost data in local storage and allowed guests to act like admins, while falsely notifying them that the suggestion was successfully sent to the server.
* **Fix**: Updated `public/js/api.js` (`submitSuggestion()`) to strictly attempt remote transmission. If the server is unreachable, the operation fails cleanly with an error message returned to the user instead of polluting local storage. Only authentic local admins using the app can modify the local workspace offline.

### 6. Premium Loading overlay & 3-Attempt Connection Retries
* **Problem**: When users sent suggestions, the UI offered no feedback until the operation completed, and connection timeouts on mobile networks would instantly crash/fail the submission without a second chance.
* **Fix**:
  - **3-Attempt Loop**: Programmed a retry mechanism in `public/js/api.js` (`submitSuggestion()`) that automatically attempts to deliver the suggestion up to 3 times before failing.
  - **Visual Loading Spinner**: Developed a glassmorphism loading overlay in `public/js/utils.js` (`showLoadingOverlay()`) with a rotating cyan spinner. It updates with the current attempt number (e.g. `Tentative 2/3`) and runs for a minimum of 2 seconds to prevent layout flashes.

### 7. Resolved Parse-Time ES Module SyntaxError in performance.js
* **Problem**: Nesting `export` statements inside `if`/`else` blocks is invalid ES Module syntax. Strict JS engines (like Android WebView's V8) fail with a parse-time `SyntaxError`, freezing the app on a black/blank screen before any logs can capture.
* **Fix**: Restructured `public/js/performance.js` to declare all measurements variables top-level and conditionally export either active measurements or no-op handlers in a single top-level `perf` object.

### 8. Dynamic Offline App Sync & Mode Transitions
* **Problem**: Caching `ANDROID_OFFLINE` statically on boot blocked Capacitor sync tasks. Even when background pings confirmed the ngrok server was reachable, the local database was loaded and the moderation queue buttons remained hidden.
* **Fix**: Implemented `api.setAppMode()` which dispatches custom `drcat-app-mode-changed` events. The app now listens for these and dynamically updates UI buttons, running background checks every 30s to sync local storage edits once the server comes online.

### 9. Unified Event-Driven Loader Overlay
* **Problem**: Using simulated progress bar timers (600ms/1600ms) caused race conditions. If the page loaded in under 300ms on localhost, the app finished and closed the loader banner, only for the 600ms timer to fire afterward, re-opening the banner and freezing the screen.
* **Fix**: Unified the boot progress bar inside `public/index.html` and `public/js/main.js` into a single event-driven `window.setLoaderProgress()` function. It automatically closes the banner exactly 350ms after progress reaches 100%, and verifies `window.__drCatBooted` to ignore stale timers.

### 10. Verbose Debug Console with Light Mode Contrast
* **Problem**: The floating bug log console (`🐛`) hardcoded light grey text (`#e2e8f0`) inline for log messages. When the app switched to light mode, the text was completely invisible against the white/light background panel.
* **Fix**: Migrated log rendering to CSS classes. Created high-contrast, theme-aware CSS configurations for logs, timestamps, and levels (e.g., deep red for errors, amber for warnings, and dark slate for messages in light mode).

### 11. Safe Next-Tick Asset Rebuilding
* **Problem**: The startup auto-builder in `server.js` tried to run `.catch()` on a synchronous function, throwing a `TypeError` and crashing server initialization.
* **Fix**: Deployed the synchronous asset builder task inside a deferred `setImmediate()` container with standard try-catch blocks.

### 12. Admin Password Hashing Migration
* **Problem**: Admin passwords were stored in plain text in `admin_password.txt`, posing a security risk if the file was exposed.
* **Fix**: Created `set_admin_password.js` using PBKDF2 hashing (100,000 iterations, random 16-byte salt) identical to server verification logic. Added `npm run set:password` script for easy setup. Existing plain-text passwords are auto-migrated on first server run.

### 13. Code Quality Tooling
* **Problem**: Inconsistent code style and lack of linting made maintenance harder.
* **Fix**: Added `.eslintrc.json`, `.prettierrc`, and `.eslintignore` to enforce consistent code style across the project.

### 14. Inline Handler & Alert Removal
* **Problem**: `index.html` contained inline `onclick=` handlers and admin actions used `alert()` for user feedback.
* **Fix**: Extracted 22 CSS utility classes into `public/css/utilities.css`, removed all inline `onclick=` handlers, replaced `alert()` with `showToast()` in admin code paths, and extracted shared helpers (`isOfflineCat()`, `mergeCatsWithLocalState()`) into `public/js/lib/helpers.js`.

---

## 🛠️ CLI Operations & Building
To perform local development or compile resources:

```bash
# 1. Run local web server
npm start

# 2. Set admin password (optional)
node set_admin_password.js mypassword
# Or use npm script:
npm run set:password

# 3. Compile static assets (bundles databases & writes public/js/remote_config.js)
npm run build

# 4. Synchronize Capacitor assets to Android project files
npx cap sync
```
*The debug APK is compiled automatically in the cloud on every push to the `light-android` branch via `.github/workflows/build-apk.yml`.*

---

## 📍 Next Steps & Outstanding Tasks
When you begin the next session, you should focus on the following roadmap objectives:

1. **Verify Connectivity**: Download the latest build from the GitHub Action output and verify that it connects, receives database updates, and successfully sends suggestions to your server moderation queue.
2. **Phase 4: UI/Animation Polish & Performance**:
   - Implement hardware-accelerated CSS transitions for sidebar drawers.
   - Perform DOM element pruning in workspaces.
   - Polish interactive quiz transitions.
3. **Phase 2 Roadmap: Database Migration** (if the user decides to proceed):
   - Move from the local JSON files (`cats_db.json` / `suggestions.json`) to a hosted SQL/NoSQL cloud database (e.g., Supabase / MongoDB).
   - Configure cloud bucket storage (S3/Supabase Storage) for PDF directories.
4. **Framework Migration Consideration**: Evaluate migrating to Vue 3 + Vite for better maintainability (SvelteKit was audited but Vue 3 recommended as more practical for solo dev medical apps).
5. **Set Actual Admin Password**: Run `node set_admin_password.js <chosen-password>` to replace the auto-generated password with a memorable one, then restart the server.
