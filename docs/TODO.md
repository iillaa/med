# TODO — Dr. CAT Feature Backlog & Ideas

This is the living backlog of planned features, improvements, and ideas for **Dr. CAT**.
Items are grouped by category and priority. Completed items are marked `[x]`.

---

## 🚢 Beta Ship Checklist (Immediate)

- `[ ]` Distribute APK to beta testers
- `[ ]` Collect and triage first bug reports
- `[ ]` Set up a simple feedback channel (WhatsApp group / Telegram / email)

---

## 🌐 Sync & Offline Improvements

- `[x]` **Local PDF Index Caching**: Bundle the full `pdf_index.json` inside the Capacitor APK during `npm run build` so full-text PDF search works in `android_offline` mode without ever needing a server connection.
- `[x]` **Incremental Sync**: Instead of a full `cats_db.json` pull on every sync, send a `?since=<timestamp>` query param to the server so only modified CATs are transferred, reducing bandwidth for mobile testers.


---

## 🗄️ Database & Content

- `[x]` **Database Schema Validation**: Add a JSON schema validator that runs on server boot to verify `cats_db.json` structure. If a field is missing or has the wrong type (e.g., a manual edit typo), log a clear warning instead of crashing silently.
- `[x]` **CAT Version History**: Store a changelog array inside each CAT object so the admin can see who modified what and when, and revert to a previous version.
- `[x]` **Bulk CAT Import**: Allow importing a batch of CATs from a JSON file upload via the Admin Panel, instead of creating them one by one.
- `[x]` **CAT Export per Specialty**: Allow downloading all CATs of a specific specialty as a standalone JSON file for sharing with other doctors.

---

## 📱 Mobile UX & Android-Specific

- `[x]` **Haptic Feedback**: Use Capacitor's `Haptics` plugin to add short vibration pulses on correct quiz answers and long pulses on wrong answers — creates a physical feedback loop for learning.
- `[x]` **Swipe Navigation**: Implement swipe-left/right gestures on the workspace detail view to navigate between consecutive CATs in the current filter list.
- `[x]` **App Update Notification**: When background sync detects a new version of `cats_db.json`, show a subtle toast ("Nouvelles fiches disponibles — Actualiser?") instead of auto-reloading.
- `[x]` **Screen Wake Lock**: Keep the screen awake while in quiz mode using the `WakeLock` API so doctors don't need to keep tapping the screen to stay in quiz mode.

---

## 🎯 Quiz & Learning System

- `[x]` **Spaced Repetition**: Track the last time each CAT was quizzed and prioritize CATs that haven't been reviewed in the longest time using an SM-2 or Leitner algorithm.
- `[x]` **Weak Points Report**: After a quiz session, show a breakdown of which specialties had the lowest scores and offer a "Refaire les erreurs" quick-fire round.
- `[x]` **Timed Mode**: Add an optional countdown timer per question to simulate real exam pressure.
- `[x]` **Quiz Streak**: Track daily quiz streaks and show a streak counter on the dashboard to encourage habit building.
- `[x]` **Keyword Hint Mode**: During redaction questions, add an optional "Show 3 keyword hints" button that reveals a few key terms at the cost of a score penalty.

---

## 🛠️ Developer & Admin Tooling

- `[x]` **Admin URL Updater UI**: Add a form in the Admin Diagnostics panel to update the server URL in `remote_server_config.json` directly from the browser, triggering a hot-reload of the providers list without a server restart.
- `[x]` **Rate Limit Dashboard**: Display the current rate-limit counters (failed logins per IP) in the Admin panel so the admin can see if someone is attempting to brute-force the login.
- `[x]` **PDF Upload via Admin Panel**: Allow uploading new PDF files directly from the browser Admin panel to the `.cat-med/reference-pdfs/` directory, triggering automatic re-indexing.
- `[x]` **Test Suite CI Integration**: Run `node test_api.js` automatically as part of the GitHub Actions build to catch API regressions before the APK is compiled.

---

## 💅 UI Polish & Animations

- `[x]` **Micro-Animations**: Add subtle entrance animations (fade-in + slide-up) for CAT detail cards, quiz panels, and dashboard stats using CSS `@keyframes`.
- `[x]` **Skeleton Loading Screens**: Replace blank loading flashes with shimmer skeleton placeholders while CAT data is being fetched.
- `[x]` **Progress Ring Animation**: Animate the specialty completion rings on the dashboard using SVG stroke-dashoffset transitions.
- `[x]` **Dark/Light Mode Persistence**: Remember the user's chosen theme across sessions using `localStorage`.

---

## ✅ Completed (Archived)

- `[x]` Fix startup connectivity freeze on Android (fast-fail offline detection)
- `[x]` Implement provider-agnostic sync (replace hardcoded Ngrok constant)
- `[x]` Fix CORS blocks for Capacitor WebView origins
- `[x]` Add Diagnostics panel (endpoint latency, sync status, PDF coverage)
- `[x]` Add Performance/Telemetry panel with in-UI journal console
- `[x]` Add mobile 🐛 debug console with network interceptor
- `[x]` Fix dashboard layout fusion bug (admin panel swallowing dashboard cards)
- `[x]` Add Copy & Clear buttons to telemetry journal
- `[x]` Full codebase audit and AUDIT_REPORT_2.md
- `[x]` Sync all documentation (README, codemap, developer_guide, technical_architecture, lessons_learned, plan-progress)
