# Full Clean Specifications Report

This report outlines the exact changes required to perform a **Full Clean** of dead code and redundant exports in the project. 

---

## Summary of Cleanable Items by File

| Target File | Symbol / Function | Line Range | Action | Description / Verification |
| :--- | :--- | :--- | :--- | :--- |
| **Frontend API**<br>[api.js](file:///data/data/com.termux/files/home/med/public/js/api.js) | `canEditDirectly()` | [L101-103](file:///data/data/com.termux/files/home/med/public/js/api.js#L101-L103) | **Delete** | Leftover permission helper; no references in codebase. |
| | `canSuggest()` | [L104-106](file:///data/data/com.termux/files/home/med/public/js/api.js#L104-L106) | **Delete** | Unused permission helper. |
| | `canSync()` | [L107-109](file:///data/data/com.termux/files/home/med/public/js/api.js#L107-L109) | **Delete** | Unused permission helper. |
| | `isAdminMode()` | [L110-112](file:///data/data/com.termux/files/home/med/public/js/api.js#L110-L112) | **Delete** | Unused permission helper. |
| | `checkIsLocal()` | [L261-263](file:///data/data/com.termux/files/home/med/public/js/api.js#L261-L263) | **Delete** | Dead endpoint helper; not called. |
| | `updateCatOverrides()` | [L566-568](file:///data/data/com.termux/files/home/med/public/js/api.js#L566-L568) | **Delete** | Unused database utility. |
| | `checkRealConnection()` | [L823-832](file:///data/data/com.termux/files/home/med/public/js/api.js#L823-L832) | **Delete** | Network checker; replaced by inline fetch calls in [main.js](file:///data/data/com.termux/files/home/med/public/js/main.js). |
| | `fetchDiagnosticsRemoteUrl()` | [L934-936](file:///data/data/com.termux/files/home/med/public/js/api.js#L934-L936) | **Delete** | Leftover diagnostics hook; unused. |
| **Admin Component**<br>[admin.js](file:///data/data/com.termux/files/home/med/public/js/components/dashboard/admin.js) | `disableAdminTabsForDev` | [L13](file:///data/data/com.termux/files/home/med/public/js/components/dashboard/admin.js#L13) | **Remove `export`** | Used internally at line 10; make private to file. |
| **Quiz Generator**<br>[generator.js](file:///data/data/com.termux/files/home/med/public/js/components/quiz/generator.js) | `parseClinicalSigns` | [L73](file:///data/data/com.termux/files/home/med/public/js/components/quiz/generator.js#L73) | **Remove `export`** | Used internally at line 116. |
| | `extractKeywords` | [L142](file:///data/data/com.termux/files/home/med/public/js/components/quiz/generator.js#L142) | **Remove `export`** | Used internally at line 162. |
| **Quiz UI Component**<br>[ui.js](file:///data/data/com.termux/files/home/med/public/js/components/quiz/ui.js) | `showQuizSetup`, `startQuizSession`, `renderQuestion`, `generateQCMOptions`, `showQCMFeedback`, `startQuestionTimer`, `updateTimerUI`, `handleTimerExpiration`, `showHint`, `showResults`, `advanceQuestion`, `retryFailedQuestions` | Multiple | **Remove `export`** | These functions are only called internally in the quiz UI module. Removing `export` restricts public visibility. |
| **Sidebar Component**<br>[sidebar.js](file:///data/data/com.termux/files/home/med/public/js/components/sidebar.js) | `getStatusLabel` | [L7](file:///data/data/com.termux/files/home/med/public/js/components/sidebar.js#L7) | **Remove `export`** | Used internally on lines 136/166 to print status badges. |
| | `filterCats` | [L170](file:///data/data/com.termux/files/home/med/public/js/components/sidebar.js#L170) | **Remove `export`** | Used internally inside search operations. |
| **Debug Console**<br>[debug-console.js](file:///data/data/com.termux/files/home/med/public/js/debug-console.js) | `startDebugConsole` | [L31](file:///data/data/com.termux/files/home/med/public/js/debug-console.js#L31) | **Remove `export`** | Called internally at line 415. |
| **Server Providers Registry**<br>[server-providers.js](file:///data/data/com.termux/files/home/med/public/js/server-providers.js) | `getProviderById`, `isDevHostname`, `isTunnelOrigin`, `getTunnelProviderName`, `getTunnelManagementInfo`, `isOriginAllowedByProvider` | Multiple | **Remove `export`** | Only utilized inside `server-providers.js` and parsed dynamically on backend build. Remove client `export` identifiers. |
| **General Utilities**<br>[utils.js](file:///data/data/com.termux/files/home/med/public/js/utils.js) | `showLoadingOverlay` | [L637](file:///data/data/com.termux/files/home/med/public/js/utils.js#L637) | **Remove `export`** | Only used internally. |
| **Backend Provider Configuration**<br>[providers.js](file:///data/data/com.termux/files/home/med/server/config/providers.js) | `getProviderHeaders` | [L67](file:///data/data/com.termux/files/home/med/server/config/providers.js#L67) | **Remove from `module.exports`** | Unused helper function on backend configuration. |
| **Backend Auth Service**<br>[auth-service.js](file:///data/data/com.termux/files/home/med/server/services/auth-service.js) | `PASSWORD_FILE`, `ADMIN_TOKEN_TTL`, `MAX_LOGIN_ATTEMPTS`, `LOGIN_RATE_LIMIT_MS`, `createTokenEntry` | [L93-106](file:///data/data/com.termux/files/home/med/server/services/auth-service.js#L93-L106) | **Remove from `module.exports`** | Constants and generators used only inside [auth-service.js](file:///data/data/com.termux/files/home/med/server/services/auth-service.js) itself. |
| | `checkLoginRateLimit` | [L61](file:///data/data/com.termux/files/home/med/server/services/auth-service.js#L61) | **Delete** | Unused helper function. |
| | `recordLoginAttempt` | [L70](file:///data/data/com.termux/files/home/med/server/services/auth-service.js#L70) | **Delete** | Unused helper function. |
| **Data Store Service**<br>[data-store.js](file:///data/data/com.termux/files/home/med/server/services/data-store.js) | `AsyncLock`, `safeWriteAsync`, `AUDIT_LOG_FILE`, `BACKUPS_DIR` | [L114-124](file:///data/data/com.termux/files/home/med/server/services/data-store.js#L114-L124) | **Remove from `module.exports`** | Only referenced within the datastore module. |
