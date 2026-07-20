# Static Analysis Audit Report — Dr.CAT

**Date:** 2026-07-19
**Tooling:** `knip` (static export/dependency analysis) + manual cross-reference verification
**Scope:** Node.js Express backend (`server/`, `server.js`, root scripts) + vanilla JS PWA frontend (`public/js/`) running under Capacitor for Android

---

## Method

1. Ran `knip` with a **corrected temporary config** that added the real backend entry chain (`server.js → server/index.js`) and the standalone CLI scripts, which the committed `knip.json` was missing (it only listed `public/js/main.js` as entry). Without this fix, knip would have produced false positives across the entire server tree.
2. Manually verified **every one of the 48 knip-flagged exports** against the whole codebase — JS, HTML, the build-generated `.cjs` file, and `build.js` itself — to separate:
   - **Completely dead code** (0 static or dynamic references), from
   - **Internal-only exports** (called only within the defining file), and to
   - eliminate false positives caused by dynamic / build-time references.
3. Assessed code duplication manually (`jscpd` does not run on this `android/arm64` platform).

### Key structural findings that shaped the audit

- **`build.js` generates `public/js/server-providers.cjs`** from `server-providers.js` by stripping the `export` keyword and appending a hardcoded `module.exports` list. This is a **build-time dynamic reference** — handled specially below so deletions never break the generated file.
- **`quiz.js` uses barrel re-exports** (`export * from './quiz/ui.js'`). knip therefore reports `ui.js` internal helpers as "unused exports" even though they are called *within* `ui.js`. These are **internal-only**, not dead.
- **CommonJS server modules** export via `module.exports = {...}`. "Remove export" there means deleting the property from that object literal (the underlying `const`/`function` stays because it is used internally).
- **No completely unused files** were found; **no unused dependencies** (the Capacitor plugins were correctly excluded from consideration).

---

## Table 1 — Completely Dead Code (0 static or dynamic references) → DELETE

| File Path | Function / Symbol | Recommended Action | Safety Rationale |
|---|---|---|---|
| public/js/api.js | `canEditDirectly` | Delete | Only occurrence is its definition; no import, string, or `window.*` reference anywhere. |
| public/js/api.js | `canSuggest` | Delete | Single definition-only occurrence across js/html/server. |
| public/js/api.js | `canSync` | Delete | Same. |
| public/js/api.js | `isAdminMode` | Delete | Same. |
| public/js/api.js | `checkIsLocal` | Delete | Same. |
| public/js/api.js | `updateCatOverrides` | Delete | Same. |
| public/js/api.js | `hasRemoteServerConfigured` | Delete | Same. |
| public/js/api.js | `checkRealConnection` | Delete | Same. NOT part of the protected offline search-highlight code. |
| public/js/api.js | `fetchDiagnosticsRemoteUrl` | Delete | Same. |
| public/js/server-providers.js | `getProviderById` | Delete function **and** its line in the `build.js` `module.exports` block | Only build.js re-lists it; nothing requires it from the `.cjs`. Server consumes only `PROVIDERS` + `detectProvider`. Must edit build.js in the same change or the generated `.cjs` breaks. |
| public/js/server-providers.js | `getTunnelProviderName` | Delete function **and** its line in `build.js` `module.exports` | Build-listed but never consumed. |
| public/js/server-providers.js | `getTunnelManagementInfo` | Delete function **and** its line in `build.js` `module.exports` | Same. Also duplicates server `getManagementEndpoint` (see Table 3). |
| public/js/server-providers.js | `isOriginAllowedByProvider` | Delete | Not consumed and **not even in** build.js's export list → fully orphaned. |
| server/config/providers.js | `getProviderHeaders` | Delete (remove function + its `module.exports` entry) | Defined + exported but never called internally or imported (0 external refs). |
| server/services/auth-service.js | `checkLoginRateLimit` | Delete (remove function + `module.exports` entry) | Dead: `routes/auth.js` re-implements rate-limiting inline instead (see Table 3). |
| server/services/auth-service.js | `recordLoginAttempt` | Delete (remove function + `module.exports` entry) | Dead — superseded by inline logic in `routes/auth.js`. |
| server/services/auth-service.js | `createTokenEntry` | Delete (remove function + `module.exports` entry) | Dead — `routes/auth.js` builds the token entry inline. |

---

## Table 2 — Internal-Only Exports (used only in the defining file) → REMOVE EXPORT

| File Path | Function / Symbol | Recommended Action | Safety Rationale |
|---|---|---|---|
| public/js/api.js | `getRemoteServerUrl` | Remove `export` | Called internally (line 159); no cross-file import. |
| public/js/api.js | `getPrimaryRemoteUrl` | Remove `export` | Called internally (line 146); no cross-file import. |
| public/js/components/quiz/generator.js | `parseClinicalSigns` | Remove `export` | Called internally (line 116); only "exposed" via `quiz.js` barrel, which nothing consumes. |
| public/js/components/quiz/generator.js | `extractKeywords` | Remove `export` | Called internally (line 162); barrel-only exposure. |
| public/js/components/quiz/ui.js | `showQuizSetup` | Remove `export` | Internal handler call (5 occurrences in file); only `initQuiz` is used externally. |
| public/js/components/quiz/ui.js | `startQuizSession` | Remove `export` | Internal call; barrel-only exposure. |
| public/js/components/quiz/ui.js | `renderQuestion` | Remove `export` | Internal (6 uses). The one "external" hit is a string label `'quiz.renderQuestion'` in performance.js, not a call. |
| public/js/components/quiz/ui.js | `generateQCMOptions` | Remove `export` | Internal call only. |
| public/js/components/quiz/ui.js | `showQCMFeedback` | Remove `export` | Internal call only. |
| public/js/components/quiz/ui.js | `startQuestionTimer` | Remove `export` | Internal call only. |
| public/js/components/quiz/ui.js | `updateTimerUI` | Remove `export` | Internal call only. |
| public/js/components/quiz/ui.js | `handleTimerExpiration` | Remove `export` | Internal call only. |
| public/js/components/quiz/ui.js | `showHint` | Remove `export` | Internal call only. |
| public/js/components/quiz/ui.js | `showResults` | Remove `export` | Internal call only. |
| public/js/components/quiz/ui.js | `advanceQuestion` | Remove `export` | Internal call only. |
| public/js/components/quiz/ui.js | `retryFailedQuestions` | Remove `export` | Internal call only. |
| public/js/components/sidebar.js | `getStatusLabel` | Remove `export` | Internal call only (3 uses). |
| public/js/components/sidebar.js | `filterCats` | Remove `export` | Internal call only (4 uses). |
| public/js/components/dashboard/admin.js | `disableAdminTabsForDev` | Remove `export` | Called internally at line 10. |
| public/js/debug-console.js | `startDebugConsole` | Remove `export` | Called internally at line 415. |
| public/js/utils.js | `showLoadingOverlay` | Remove `export` | Called internally at line 720. |
| server/services/auth-service.js | `ADMIN_TOKEN_TTL` | Remove from `module.exports` | Used internally (line 90); no importer. |
| server/services/auth-service.js | `MAX_LOGIN_ATTEMPTS` | Remove from `module.exports` | Used internally (line 64); no importer. |
| server/services/auth-service.js | `LOGIN_RATE_LIMIT_MS` | Remove from `module.exports` | Used internally (lines 64-65); no importer. |
| server/services/auth-service.js | `PASSWORD_FILE` | Remove from `module.exports` | Used internally (lines 19-43). The "external" hits are separate local `const PASSWORD_FILE` redeclarations in `set_admin_password.js` / `test_auth.js`, not imports. |
| server/services/data-store.js | `AsyncLock` | Remove from `module.exports` | Instantiated internally (line 29); consumers import `dbLock`, not the class. |
| server/services/data-store.js | `safeWriteAsync` | Remove from `module.exports` | Used internally (lines 62, 66); consumers use the wrappers. |
| server/services/data-store.js | `AUDIT_LOG_FILE` | Remove from `module.exports` | Used internally (line 75). |
| server/services/data-store.js | `BACKUPS_DIR` | Remove from `module.exports` | Used internally (lines 83-105). |

---

## Table 3 — Code Duplication

| Location A | Location B | Recommended Action | Safety Rationale |
|---|---|---|---|
| `server/routes/auth.js` (inline rate-limit, magic numbers `5`, `5*60*1000`, `12*60*60*1000`) | `server/services/auth-service.js` (`checkLoginRateLimit`, `recordLoginAttempt`, `createTokenEntry`, `MAX_LOGIN_ATTEMPTS`, `LOGIN_RATE_LIMIT_MS`, `ADMIN_TOKEN_TTL`) | Consolidate: either call the service helpers from the route, or delete the dead helpers (Table 1) and keep constants centralized | The route reinvents logic that already exists as (currently dead) helpers. Consolidating removes drift risk on security-sensitive login throttling. |
| `set_admin_password.js` (`hashPassword` via PBKDF2) | `server/services/auth-service.js` (`hashPassword`) | Consider importing the shared `hashPassword` from auth-service into the script | Two independent PBKDF2 implementations must stay algorithm-compatible or admin login breaks; sharing one source removes that hazard. Verify the script remains runnable standalone. |
| `public/js/server-providers.js` `getTunnelManagementInfo` | `server/config/providers.js` `getManagementEndpoint` | LOW PRIORITY / leave as-is | Client-side vs server-side split, analogous to the intentional offline duplication. Flagged for awareness only; no refactor recommended. |

---

## Explicitly Respected Safety Rules

- **Capacitor plugins** (`@capacitor/haptics`, `@capacitor/filesystem`, `@capacitor/share`, plus `@capacitor/android` / `@capacitor/core`): confirmed statically "unused" but **excluded from all recommendations** — required for the Android native build via `window.Capacitor.Plugins`.
- **Offline search-highlighting duplication** between `api.js` and `search.js`: **not touched**. None of the deletions above involve highlight logic (verified `checkRealConnection` and the api.js deletions are unrelated connectivity/permission helpers).
- The `server-providers.js` → `.cjs` build-generation relationship is respected: any deletion there is paired with the corresponding `build.js` `module.exports` edit so the generated file never references undefined symbols.

---

## Notes / Caveats

- No source files were modified during this audit. The temporary knip config used for accurate entry-graph analysis was removed afterward.
- The committed `knip.json` currently only declares `public/js/main.js` as an entry and omits the backend entry chain and CLI scripts. Consider updating it so future `knip` runs analyze the whole project correctly.
- `jscpd` could not run on this platform (`Unsupported platform android/arm64`); duplication findings in Table 3 are from manual inspection and may not be exhaustive.
