# Dr.CAT — Project Roadmap & Feature TODO

---

## 🚨 Top Priority
- [ ] **1. Fix App Logo** — Audit and fix logo rendering/asset resolutions across desktop header, mobile header, PWA manifest, and Android APK launcher icon to ensure sharp visual display without distortion.

---

## 📌 Phase 1: Versioning & Version Enforcement (Force Update)
- [ ] **2. Formalize Semantic App Versioning**
  - Increment `package.json` version beyond `1.0.0` (e.g. `1.1.0-beta.1`).
  - Wire build script to automatically propagate app version to Android `build.gradle` (`versionCode` & `versionName`), `public/index.html`, and server APIs.
- [ ] **3. Mandatory Force-Update System**
  - **Server Endpoint:** `GET /api/v1/version-check?client_version=X.Y.Z&platform=android|web`.
  - **Client Guard:** On app boot (or resume), check server minimum required version.
  - **Blocking Modal:** If client version < `minimum_required_version`, display a non-dismissible modal ("Mise à jour obligatoire requis") with a direct "Télécharger la mise à jour" button linking to APK download / Store page.

---

## 👥 Phase 2: Active User Analytics & Presence Tracker
- [ ] **4. Real-time Active User & Session Counter**
  - **Server Heartbeat System:** Implement `POST /api/v1/heartbeat` (or lightweight WebSocket/SSE) to track active Web and Android sessions (with privacy-preserving anonymous session ID).
  - **Platform Split:** Distinguish between active Web desktop users vs. native Android APK users.
  - **Admin & Dashboard Metrics:** Display real-time active user count ("X utilisateurs en ligne") on admin dashboard / telemetry panel.

---

## 🐛 Phase 3: Consent-Based One-Tap Bug & Log Reporting
- [ ] **5. One-Tap Consent-Based Error Reporter**
  - **In-App Error Collector:** Capture uncaught errors, failed fetches, and console error logs into an in-memory buffer.
  - **User Feedback & Bug Modal:** Provide a "Signaler un problème" button in sidebar/settings.
  - **One-Tap Email / Endpoint Dispatch:** User reviews logs, taps once, and sends debug log package via `mailto:` pre-filled draft or direct server endpoint with explicit consent toggle.

---

## 🛡️ Phase 4: Server, Security & Proprietary Engine Hardening
- [ ] **6. Proprietary Engine Privacy & Architecture Safeguards**
  - **IP/Mechanism Confidentiality:** Maintain strict confidentiality surrounding internal search index and PDF view rendering strategies. Never expose implementation hints or internal mechanisms in user-facing UI or public logs.
  - **Dr.CAT v2 Architecture Planning:** Evaluate relocation and enhanced obfuscation/gating for indexing and view data endpoints when scaling to v2 with expanded content libraries.
- [ ] **7. Rate-Limiting & Anti-Abuse Shield**
  - Add Express rate-limiting (`express-rate-limit`) to `/api/*` and `/data/*` routes to prevent DDoS and API spam.
- [ ] **8. Automated Server Database Backups**
  - Implement automated periodic rotation and compression backups for `cats_db.json` and user data stores.
- [ ] **9. Security Audit & Header Hardening**
  - Add `Helmet.js` security headers (`X-Content-Type-Options`, `X-Frame-Options`, `Strict-Transport-Security`, CSP rules).

---

## 📋 Completed Tasks ✅
- [x] Centralize `APP_DATA_KEY` verification across server middleware (`server/config/constants.js`).
- [x] Protect `/data/*` files and `/api/cats` from direct unauthorized curl/scraping.
- [x] Ship 78 compressed master PDFs in `public/pdfs/`.
- [x] Polish navigation tab bar with sticky glassmorphism, horizontal width stretch, and top gradient scroll edge fade.
- [x] Add smooth scroll gradient edge masks to sidebar list items and modal dialogs.
