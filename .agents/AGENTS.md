# Planning & Full-Auto Execution Protocol

## 1. Plan-First Alignment Rule
- **CRITICAL**: Before executing non-trivial architectural changes, refactors, feature implementations, or complex bug fixes, Gemini MUST FIRST present a structured, concise **Step-by-Step Plan** to the user.
- **Content of the Plan**:
  1. **Root Cause Analysis & Diagnosis**: Clearly explain what is happening and why.
  2. **Proposed Solution & Exact Steps**: Detail the files to be touched and the exact changes to be made.
  3. **Verification Strategy**: How the changes will be tested and proven.

## 2. Full-Auto Mode Upon User Approval
- **Rule**: Once the user agrees to the plan (e.g. responds with "ok", "go", "proceed", "agreed"), Gemini MUST enter **Full Autonomous Execution Mode**.
- **No Unclear Micro-Permissions**:
  - Do NOT interrupt the flow with piecemeal, cryptic, or low-level permission questions that confuse the user.
  - Autonomously complete all code edits, run automated builds, execute test suites, and verify end-to-end.
- **Reporting**: Report back to the user with a concise summary of results and test evidence once all steps are fully completed.

# Verification Discipline: Manual Review & Static Tracing Protocol

## Mandatory Manual Code Review & Anti-Laziness Rule
- **CRITICAL**: Automated test suites (`npm run test:suite`, `test_*.js`) are a **safety net for backend/API regressions, NOT a substitute for manual verification and static code analysis**.
- **Automated Test Blind Spots**:
  1. Automated tests run in headless Node.js, NOT in a real browser DOM / Capacitor WebView.
  2. Automated tests execute isolated backend functions with mocked inputs; they DO NOT exercise client runtime scopes, lifecycle imports, or event-driven UI state in `public/js/`.
  3. A 100% green test suite (`11/11 Passed`) does NOT guarantee that the frontend runtime is bug-free (e.g., missing variable declarations like `installId is not defined`).
- **Mandatory Manual Checklist Before Declaring Any Task Done**:
  1. **Variable Scope & Import Trace**: Manually inspect all modified functions line-by-line. Ensure every referenced identifier, parameter, imported symbol, and `localStorage` accessor is explicitly defined in scope.
  2. **Mental Dry-Run & Runtime Simulation**: Mentally step through the call stack on both cold app startup (fresh install / empty storage) and warm re-entry (existing storage).
  3. **Dual-Environment Validation**: Verify that platform-conditional branches correctly isolate `android_apk` (native Capacitor), `web_pwa` (`display-mode: standalone`), and `web_browser` (standard tab).
  4. **No Premature Victory**: Never present a green automated test pass as proof that frontend UI code works without having completed the manual line-by-line review.

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

# Living Documentation & Codebase Map Protocol

## Mandatory Proactive Documentation Maintenance Rule
- **CRITICAL**: Code changes and documentation MUST NEVER drift apart.
- **Trigger**: Whenever completing work on new architectural features, CLI scripts, UI components, database schemas, API endpoints, or infrastructure (Cloudflare / Android / CI):
  1. **Proactive Documentation Sync**: Gemini MUST proactively identify and update the corresponding documentation files in `docs/`, `README.md`, `llms.txt`, and architecture diagrams without waiting for the user to remind it.
  2. **Living Codebase Map**: Maintain [`docs/01-architecture/codebase-map.md`](file:///data/data/com.termux/files/home/med/docs/01-architecture/codebase-map.md) as the single source of truth for repository structure, module roles, CLI commands, and data flow.
  3. **Mandatory Documentation Sync Status**: At the conclusion of every non-trivial task (alongside the App Version Proposal), Gemini MUST explicitly report documentation status:
     > 📚 **Documentation Status**:
     > - **Updated**: `README.md`, `docs/01-architecture/codebase-map.md` (Updated with new features / CLI scripts)
     > - *All documentation is 100% in sync with the codebase.*

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

# Cloudflare Wrangler & Termux Invariants Protocol

## SYNC_SECRET Parity Rule
- **CRITICAL**: The Worker suggestion and active devices relay (`worker.js`) is gated behind a shared secret. `SYNC_SECRET` MUST remain IDENTICAL in BOTH locations:
  1. Local Termux: `.env` → `SYNC_SECRET=<hex>` (read by `server/services/sync-suggestions.js`)
  2. Cloudflare: Worker secret → `npx wrangler secret put SYNC_SECRET --name drcat`

## Termux workerd Shim Guard
- `wrangler` is located in `optionalDependencies` and patched automatically via `scripts/termux-wrangler-fix.sh` during `npm install` on Android ARM64 Termux.

## Wrangler Deploy & Version Rules
- Deploy = `npx wrangler deploy` (uploads `worker.js` + `public/` assets together per `wrangler.jsonc`).
- App and worker version numbers are auto-stamped by `build.js` from `package.json` on every build. Never hand-edit versions across split targets.

# Database Staging & LLM Safety Invariants

## Fixed Canonical Database Names
- Canonical names are strictly immutable:
  - Production: `cats_db.json` (auto-generated copy in `public/data/` for APK/web)
  - Staging: `cat_db_generator/cats_db_staged.json` (MUST remain a pure JSON array)
  - Metadata sidecar: `cat_db_generator/cats_db_staged.meta.json` (`schema_version: "3.5"`)
- Never version database filenames (e.g. `cats_db_v2.json` is retired).

## LLM Safety Knobs
- **`GEMINI_BLOCKLIST`**: Optional environment variable in `.env` filtering out preview/experimental models before auto-sorting.
- **DCI Warning Gate**: Unknown molecules in generated CATs produce informative `[DCI Non Référencée]` warnings for the physician without breaking execution.

---

# 📚 Historical Lessons Learned & Incident Post-Mortems
For technical details, root cause analyses, past security audit ledgers, and architectural post-mortems, consult the living register:
👉 [`docs/01-architecture/lessons-learned-postmortems.md`](file:///data/data/com.termux/files/home/med/docs/01-architecture/lessons-learned-postmortems.md)
