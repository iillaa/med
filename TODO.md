# TODO — connectivity freeze surgical fixes

- [ ] Gather exact current implementation (api.js, main.js) and identify where startup blocks
- [x] Repo audit: ripgrep unavailable; used direct file reads instead
- [x] Implement Fix A: `public/js/api.js` add `quickPing()` + reduce `FETCH_TIMEOUT_MS` to 3000
- [x] Implement Fix B: `public/js/api.js` update `getAppMode()` to default Capacitor/Android to ANDROID_OFFLINE (do not trust `navigator.onLine`)
- [x] Implement Fix C: `public/js/api.js` update `fetchCats()` to fast-fail remote attempts; fall back to bundled `data/cats_db.json` quickly
- [x] Implement Fix D: `public/js/main.js` make initApp connection check fast-fail for Android/Capacitor (avoid awaiting `checkRealConnection()`)

- [x] Update TODO progress and run sanity checks

- [ ] Manual verification steps (user-driven):
  - [ ] Android: internet OFF → open APK, confirm no freeze
  - [ ] Android: internet ON but remote/ngrok down → confirm no freeze
  - [ ] Mobile browser: localhost on 4G → confirm no logo freeze
