# TODO — surgical fixes

- [x] FIX 1 (server.js): remove startup freeze by running rebuildClientAssets() in background (fire-and-forget)

- [x] FIX 2 (public/js/api.js): add APP_MODES + getAppMode() and permission helpers

- [x] FIX 3 (public/js/api.js): rewrite submitSuggestion() with mode logic (offline android read-only, admin_local read-only)



- [x] FIX 4 (public/js/api.js): rewrite fetchCats() with mode logic + remote failover


- [x] FIX 5 (public/js/main.js): rewrite updateEditButtonsVisibility() with mode logic


- [x] FIX 6 (public/js/main.js): replace initApp() ping block with mode-aware check


- [x] Restart server and run basic sanity checks (node + browser console)



