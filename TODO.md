# Dr.CAT — Project Roadmap & Feature TODO

---

## 🚨 Top Priority & Active Development

- [ ] **1. One-Tap Consent-Based Error & Log Reporter**
  - **In-App Error Collector:** Capture uncaught errors, failed fetches, and console error logs into an in-memory buffer.
  - **User Feedback & Bug Modal:** Provide a "Signaler un problème" button in sidebar/settings.
  - **One-Tap Dispatch:** User reviews logs, taps once, and sends debug log package via `mailto:` pre-filled draft or direct server endpoint with explicit consent toggle.

- [ ] **2. Proprietary Engine Privacy & Architecture Safeguards**
  - **IP/Mechanism Confidentiality:** Maintain strict confidentiality surrounding internal search index and PDF view rendering strategies. Never expose implementation hints or internal mechanisms in user-facing UI or public logs.
  - **Dr.CAT v2 Architecture Planning:** Evaluate relocation and enhanced obfuscation/gating for indexing and view data endpoints when scaling to v2 with expanded content libraries.

- [ ] **3. Interactive Clinical Decision Trees (Arbre Décisionnel)**
  - Integrate interactive decision flowcharts (`todo/arbre_decisionnelle_project.md`) into the workspace view for diagnostic guidance.

---

## 📋 Completed Tasks ✅

- [x] **App Logo & Adaptive Icon Set** — Generated 2-layer Android adaptive icons (foreground/background) across all mipmap densities (mdpi to xxxhdpi) adhering to the 66% safe zone for perfect scaling on Lenovo tablets, Samsung, Pixel, and Xiaomi devices.
- [x] **Formalize Semantic App Versioning (v1.1.9)** — Incremented `package.json` and `version.json` to `v1.1.9`. Stamped build scripts to automatically propagate build version (`app-build-version`) and asset cache-busters (`?v=2607300058`).
- [x] **Mandatory Force-Update & Multi-Source Kill Switch System** — Implemented numeric version guard middleware (`server/middleware/version-guard.js`), protected version API routes (`server/routes/version.js`), and hardened IIFE client lock gate (`public/js/version-checker.js`) with 3 multi-source download options (Uptodown, Telegram, Direct Server).
- [x] **Target-Specific Lockout** — Enforced hard Kill Switch lock screen strictly for compiled native Android APKs (`X-App-Version`), while serving web browser users with live server assets.
- [x] **Anonymous Installation ID & Active Device Analytics Engine** — Built persistent client UUID generator (`public/js/install-id.js`), server active device tracker (`server/services/active-devices.js`), debounced data store (`server/data/active_devices.json`), and protected analytics API (`GET /api/admin/active-devices`).
- [x] **Standalone Analytics Lab UI (`analytics_lab.html`)** — Built protected standalone Analytics Lab page featuring DAU/MAU stats, platform distribution, live search & filtering, version progress bars, device inspection modal drawer, and 1-click CSV spreadsheet exporter.
- [x] **Deep Multi-Token CAT Content Search** — Upgraded `filterCats()` in `sidebar.js` to perform deep multi-keyword content search across titles, summaries, prescriptions (`ordonnance`), red flags, keywords, and notes.
- [x] **Rate-Limiting & Anti-Abuse WAF Shield** — Implemented Express rate-limiter middleware (`server/middleware/rate-limit.js`) with tuned limits (80 req/min critical, 180 req/min API) and WAF query inspection.
- [x] **PBKDF2 Salted Admin Password Hashing** — Migrated admin password storage to PBKDF2 hashing with random salt (`set_admin_password.js`).
- [x] **Standalone Admin Labs Route Protection** — Blocked public access to `/pdf_lab.html` and `/analytics_lab.html` via loopback IP assertion (`isLocalhostConnection`).
- [x] **PDF Compression Pipeline** — Shipped 78 compressed master PDFs in `public/pdfs/` with Ghostscript downsampling.
- [x] **Android Navbar Gap Fix** — Resolved Capacitor Android 3-button navigation bar gap via `WindowCompat.setDecorFitsSystemWindows(getWindow(), false)`.
