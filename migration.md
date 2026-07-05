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
  - **Dynamic Compiler Injection**: The build script `build.js` now reads the target URL from the tracked `remote_server_config.json` and bakes it directly into the static bundle at `public/js/remote_config.js` during compilation.
  - **Tracked Configuration**: `remote_server_config.json` was removed from `.gitignore` so that GitHub Actions cloud builds can read it and compile the APK with the active tunnel URL.
  - **Auto-Invalidation of Local Storage**: In `public/js/api.js` (`getRemoteServerUrl()`), if a new APK build is pushed with a new server URL, the client automatically detects the change, invalidates the stale URL in the device's `localStorage`, and connects to the new server instantly.

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

---

## 🛠️ CLI Operations & Building
To perform local development or compile resources:

```bash
# 1. Run local web server
node server.js

# 2. Compile static assets (bundles databases & writes public/js/remote_config.js)
npm run build

# 3. Synchronize Capacitor assets to Android project files
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
