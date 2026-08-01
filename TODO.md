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

- [ ] **4. Interactive Quiz Engine V2 Upgrade (`quiz_generator.js`)**
  - **Dynamic QCM Distractor & Vignette Synthesis V2**: Expand `public/js/components/quiz/quiz_generator.js` with multi-stage clinical vignette generation, differential diagnosis options, and AI-driven question variations.

---

## 🛠️ Dr. CAT Version 2: Hierarchical Data & Sub-Category Architecture Plan

This blueprint outlines the execution steps for introducing nested sub-categories, specific fiches synthèses, and dedicated ordonnances into your local JSON-driven data architecture without bloating the app or breaking the build pipeline.

### Phase 1: Data Schema & Generator Extension
- **Update JSON Data Structure**: Modify the schema in your local JSON database files (`cats_db.json`) and generator scripts to support nested sub-category arrays under main clinical topics.
- **Map Clinical Entities**: Ensure every sub-category object contains dedicated data blocks for its specific variables (e.g., age groups, acute vs. chronic classifications, specific pathogens).
- **Embed Sub-Assets**: Attach unique `fiche_synthese` and `ordonnance` arrays directly inside each sub-category node rather than relying on global parent-level data.

### Phase 2: Frontend UI & View Navigation
- **Build Tree-View Navigation**: Update the client-side interface logic to render expandable sub-category lists or tabbed selections whenever a user opens a complex primary topic (e.g., clicking "Diarrhea" expands sub-options like Acute Pediatric, Chronic Adult, etc.).
- **Dynamic State Handling**: Implement clean event listeners in your UI scripts to track the currently selected sub-category ID and refresh the viewport cleanly without full page reloads.

### Phase 3: Content Component Rendering
- **Isolate Template Renderers**: Write modular view-rendering functions for the sub-category payload so that selecting a sub-item instantly populates the correct, context-specific fiche synthèse and ordonnance templates.
- **Refactoring Control**: Keep these renderers cleanly separated in your codebase to prevent falling back into monolithic vanilla JavaScript DOM-manipulation spaghetti.

### Phase 4: Testing & Build Verification
- **Extend Test Suite**: Update your 5-suite Master Test Runner (`tests/run_all_tests.js`) to include schema validation checks for the new sub-category keys, ensuring no missing data fields exist across your local JSON packs.
- **Pipeline Validation**: Run a full local build check to verify that minification compiles smoothly and that Capacitor and ProGuard package the updated static data assets cleanly into the target Android APK.

---

## 📋 Completed Tasks ✅

- [x] **2-Step Live Web Research RAG & Human Active Learning Engine (`generate_cat_db_v2.js`)** — Built 2-step clinical protocol synthesis engine featuring:
  - **Step 1 Live Web Fetcher (`lib/web-fetcher.js`)**: Scrapes target medical guidelines (`sante.gov.dz`, `cnpm.org.dz`, `samidz.com`, `vidal.fr`, `has-sante.fr`, `sfmu.org`, `who.int`, `msdmanuals.com`) into structured local disk cache (`cat_db_generator/web_cache/`).
  - **Step 2 Dual RAG AI Engine (`lib/llm-engine.js`)**: Assembles 3 knowledge channels (Offline PDF RAG + Online Web RAG + Human Edit Memory) into Gemini 3.6 Flash synthesis prompts.
  - **Human Active Learning Loop**: Learns from manual user edits in the Lab UI (`cat_generator_lab.html`) and feeds human corrections into future AI synthesis prompts.
  - **Admin Generator Lab UI Upgrades (`cat_generator_lab.html`)**: Added 2-step execution buttons, manual human editor modal (`#edit-modal`), and RAG/Memory status badges.

- [x] **Standalone CAT Database V2 Generator Lab UI (`cat_generator_lab.html`)** — Built protected standalone Admin Lab interface (`/cat_generator_lab.html`) featuring side-by-side legacy V1 vs AI-synthesized V2 CAT comparison, live token & latency metric inspection, single/batch generator controls, and 1-click database promotion.

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
