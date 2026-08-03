# App Versioning & Mandatory Prompt Protocol

## Automatic Version Bump Proposal Requirement
Whenever completing work on code updates, bug fixes, performance improvements, or new features:
1. **Assess Change Severity & Semantic Version Bump**:
   - **PATCH (`1.0.X`)**: Bug fixes, minor styling tweaks, internal code refactoring, non-breaking asset updates.
   - **MINOR (`1.X.0`)**: New user-facing features, new UI views/modals, DB schema expansion, new API endpoints.
   - **MAJOR (`X.0.0`)**: Massive application overhaul, breaking API/schema changes, major redesign.
2. **Mandatory End-of-Task Prompt**:
   - At the conclusion of every response where code/files were modified, **Gemini MUST propose a new app version** based on the changes made.
   - Example prompt format:
     > 📌 **App Version Proposal**:
     > - **Current Version**: `1.0.0`
     > - **Proposed Version**: `1.0.1` (Patch: bug fix / minor update)
     > - **Reason**: Fixed navbar inset and updated search cache.
     > - *Would you like me to update `package.json` and stamp the build with `1.0.1` now?*
3. **Server-Controlled Force Update Gate**:
   - App update enforcement is controlled via server configuration (`version.json` / Admin API).
   - When `forceUpdateActive` is set to `true` on the server and client version < `minVersion`, the server signals a mandatory app update to clients (Android APK & PWA).

# Security Lock Gate & User Storage Protection Protocol

## Kill Switch / Force Update Storage Rule
- **CRITICAL**: The Security Lock Gate (`public/js/version-checker.js`) MUST NEVER call `localStorage.clear()`, `sessionStorage.clear()`, or `indexedDB.deleteDatabase()`.
- **Reason**: Calling `localStorage.clear()` on lock screen activation permanently destroys the user's personal medical notes (`dr_cat_notes_*`), reading history (`dr_cat_user_progress`), Leitner spaced repetition stats (`dr_cat_leitner`), and study streaks (`dr_cat_streak`).
- **Rule**: Lock screens must strictly block UI interaction. Purge ONLY temporary HTTP network cache keys (`dr_cat_synced_db`). When the lock is lifted or the user updates the app binary, `window.location.reload()` must be called to restore active UI with 100% of user data preserved.

# Production APK Asset Hardening & Anti-Decompilation Protocol

## Asset Stripping & Obfuscation Rules
- **CRITICAL**: Compiled Android APK binaries (`.apk`) MUST NEVER package unbundled raw development JavaScript source files (`components/`, `lib/`, `workspace/`, `dashboard/`, `main.js`, `api.js`, `utils.js`, `state.js`).
- **Mechanism**:
  1. **Capacitor Sync Hardener**: `"cap:sync"` script in `package.json` MUST execute `node scripts/clean_android_assets.js` to strip raw development JS files from `android/app/src/main/assets/public/js/`.
  2. **Native AAPT Exclusion**: `android/app/build.gradle` MUST enforce `aaptOptions.ignoreAssetsPattern` to permanently filter out raw JS development directories (`components:lib:workspace:dashboard:main.js:api.js:config.js:utils.js:state.js:install-id.js:debug-console.js`) during APK packaging.
  3. **Android R8 Obfuscation**: `buildTypes.release` in `android/app/build.gradle` MUST maintain `minifyEnabled true` and `shrinkResources true`.
- **Validation**: Any reverse engineering tool (`apktool`, `jadx`, `unzip`) decompiling the APK must find **ONLY** `public/dist/app-*.js` (minified production bundle) and runtime engine files (`pdf.min.js`, `version-checker.js`).

# Author Attribution & Copyright Protocol

## Author Name Display Rule
- **User-Facing UI Credit**: Display **`Dr. Kibeche Ali`** (in Dashboard footer, About modal, Legal/CGU disclaimer).
- **Code & Legal Metadata**: Display **`Dr. Kibeche Ali Dia Eddine`** (in `package.json`, `LICENSE`, `server/index.js`, and `android/app/build.gradle`).

