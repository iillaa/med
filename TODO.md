# Dr.CAT — Project Roadmap & Feature TODO

---

## 🚨 Active Confidentiality & IP Safeguards

- [x] **Proprietary Engine Privacy & IP Safeguards (Active)**: Maintain strict confidentiality surrounding internal search index and PDF view rendering strategies. Never expose implementation hints or internal mechanisms in user-facing UI or public logs.

---

## 🛠️ Dr. CAT Version 2 & Future Architecture Plan

### 1. One-Tap Consent-Based Error & Log Reporter
- **In-App Error Collector:** Capture uncaught errors, failed fetches, and console error logs into an in-memory buffer.
- **User Feedback & Bug Modal:** Provide a "Signaler un problème" button in sidebar/settings.
- **One-Tap Dispatch:** User reviews logs, taps once, and sends debug log package via `mailto:` pre-filled draft or direct server endpoint with explicit consent toggle.

### 2. Proprietary Engine Privacy & V2 Architecture Safeguards
- **Dr.CAT v2 Architecture Planning:** Evaluate relocation and enhanced obfuscation/gating for indexing and view data endpoints when scaling to v2 with expanded content libraries.

### 3. Interactive Clinical Decision Trees (Arbre Décisionnel)
- Integrate interactive decision flowcharts (`todo/arbre_decisionnelle_project.md`) into the workspace view for diagnostic guidance.

### 4. Interactive Quiz Engine V2 Upgrade (`quiz_generator.js`)
- **Dynamic QCM Distractor & Vignette Synthesis V2**: Expand `public/js/components/quiz/quiz_generator.js` with multi-stage clinical vignette generation, differential diagnosis options, and AI-driven question variations (just like CAT Generator V2!).

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

### Phase 5: Advanced Medical RAG & Local Formulary Upgrades (V2 Scaling)
- **Local DCI/Brand Dictionary (`local_drugs.json`)**: Lightweight mapping of INN (DCI) to local Algerian commercial brands (e.g., *Benzoate de benzyle* ↔ *Ascabiol*, *Phloroglucinol* ↔ *Spasfon*, *Racécadotril* ↔ *Tiorfan*, *Diosmectite* ↔ *Smecta*).
- **Hybrid RAG Reranker (BM25 + Keyword Priority)**: Rank local PDF extracts containing exact trade names or primary treatment protocols higher than generic diagnostic background text.
- **Automated Validation Re-Prompting Guardrail**: If `validateCAT()` detects unseparated alternative drugs or missing 1ère INTENTION headers, feed validation errors back into Attempt 2 of LLM synthesis.

### 🩺 Dr.CAT Generator Master Implementation Plan (`cat_db_generator/todo4catgenerator.md`)
> *Detailed architecture, strategy, and execution steps are consolidated in [todo4catgenerator.md](file:///data/data/com.termux/files/home/med/cat_db_generator/todo4catgenerator.md).*

- [x] **Phase A: Web Fetcher Precision & Fast AI Discoverer (`cat_db_generator/lib/web-fetcher.js`)**:
  - Implement dynamic token & synonym expansion for pathologies.
  - Implement dual-tier cumulative search (Dedicated PDFs + Multi-Topic Compilations in parallel).
  - Add strict word-boundary regex matching (`hasExactWord` with `\b`) to eliminate partial word false hits.
  - Add clinical section anchor extraction (`extractSubstantiveClinicalBlock` for Treatment, Posologies, Red Flags).
- [x] **Web RAG V3 Full Article Content (`cat_db_generator/lib/web-fetcher.js`)**:
  - PubMed PMC `efetch` API integration for downloading real peer-reviewed clinical abstracts.
  - MSD Manuals Professional article scraper via Jina Reader & DDG discovery.
  - High clinical density check (`isHighClinicalDensity`) and 30-day cache freshness TTL (`CACHE_TTL_DAYS = 30`).
- [x] **Real-Time Diagnostic SSE Telemetry & Debug Panel (`cat_db_generator/lib/debug-emitter.js`)**:
  - Connect `DebugEmitter` singleton to stream live RAG events, token counts, and LLM reasoning steps to `/api/admin/cat-generator/debug-stream`.
- [x] **Human-in-the-Loop Custom Link Injector**:
  - Add custom URL input in Admin Generator Lab (`cat_generator_lab.html`) for doctors to paste niche/local medical links (`sante.gov.dz`, `cnpm.org.dz`, specific PDFs/blogs).
  - Fetch custom links via Jina Reader and store them in the CAT web cache.
  - Pass human-provided links and AI-discovered links with **equal weight** into Gemini Flash context for smart medical synthesis.
- [x] **PDF RAG Fitness Inspector & Human TOC Indexer (`admin/pdf_lab.html`)**:
  - Add live RAG Fitness Score badges (+90 pts TOC, +60 pts exact title, +20 pts anchors) in PDF Lab.
  - Add 1-Click AI Prompt Generator from `GUIDE_PDF_RAG_STANDARDIZATION.md`.
  - Add Human TOC GPS Indexer so doctors can paste index pages directly into `pdf_index.json`.
- [x] **Dual-Tier Offline Clinical Knowledge Library (`cat_db_generator/clinical_library/`)**:
  - Integrated 7 specialized decision support packs: MedG.fr, Antibioclic/SPILF, SFMU Urgences, Pédiadol, MSF, Orphanet, CRAT.
- [x] **Algerian Clinical Drug Matrix (`cat_db_generator/lib/algerian_drug_matrix.json`)**:
  - Mapped DCIs to local Algerian commercial trade names (*Augmentin, Clavulin, Tiorfan, Spasfon, Ascabiol, Smecta, Solupred, Célestène, Ventoline*).
- [x] **PDF Lab 2.0 Visual Slicer, GPS Sommaire & Staging Ingestion (v1.8.9)**:
  - Interactive Visual Slicer with canvas boundary sliders and +15px visual margins.
  - Automatic Sommaire GPS parser with dotted leader page matching (+90 pts).
  - Direct `.md` and `.txt` ingestion with in-browser Markdown editor and RAG simulator.
  - Staging draft sandbox (`pdf_staging_index.json`) with 1-click promotion to Master.

- [x] **Official European (BDPM) & Algerian Pharmacopeia Ingestion (v1.8.9)**:
  - Ingested 15,857 authorized pharmaceutical products & 4,474 DCIs from French BDPM (`data/bdpm_pharmacology.json`).
  - Ingested 4,627 registered Algerian products from Ministère de la Santé / Chifa (`data/algerian_nomenclature.json`).

- [x] **5-Field Metadata Precision RAG & Pure Signal Slicing (v1.8.9)**:
  - Evaluates Title, Specialty, Keywords, TOC GPS, and Page Text simultaneously.
  - Pure Signal Isolation: Mutes noisy 500-page textbooks when a dedicated slice exists.

- [x] **Deterministic 8-Layer Medical Validator & IP Protection Firewall (v1.8.9)**:
  - Strict daily drug ceilings, GPIP pediatric weight bounds (`mg/kg/j`), CRAT teratogenic firewall, lethal unit typo interceptor.
  - Production Sanitizer: Strips proprietary AI tokens, latency metrics, and search queries from public client database.

- [ ] **Dedicated Cloudflare Deploy Branch (`cloudflare-deploy`)**:
  - Create a separate `cloudflare-deploy` branch linked exclusively to Cloudflare Workers deployment.
  - Workflow: when ready to sync DB to Cloudflare, force-push `beta-test-pr` → `cloudflare-deploy`.
  - Add `npm run cf-deploy` script: build → amend single commit → force push (zero git history pollution).

- [x] **Database File & Reference Version Update (`v2` → `v3`)**:
  - Safely migrated `cats_db_v2_generated.json` to `cats_db_v3_generated.json` and updated backend, generator, and UI references.

### 📚 Open-Source Medical AI Inspiration & Reference Projects (For V2 Research)
- **[MedRAG](https://github.com/MedRAG/MedRAG)**: Academic benchmark framework for medical retrieval over PubMed, StatPearls & textbooks. *Key takeaway: Hybrid BM25 + dense vector reranking for drug name precision.*
- **[Meditron](https://github.com/epfl-dlab/meditron)**: EPFL open-source medical LLMs fine-tuned on Clinical Practice Guidelines (CPGs). *Key takeaway: Prompting around clinical decision trees (Reasoning -> Red Flags -> 1st Line -> Alternatives).*
- **[Instructor](https://github.com/jxnl/instructor)** & **[Guardrails AI](https://github.com/guardrails-ai/guardrails)**: Enforces strict Pydantic/JSON schemas on LLM outputs with automated validation retry loops. *Key takeaway: Automatic re-prompting on schema validation errors.*
- **[RxNorm](https://www.nlm.nih.gov/research/umls/rxnorm/)** & **[OpenEHR](https://www.openehr.org/)**: International standards for localizing drug databases and mapping International Nonproprietary Names (INN / DCI) to commercial brand names (ATC coding). *Key takeaway: DCI to local trade brand mapping.*
- **[OpenSRP](https://smartregister.org/)** & **[CommCare](https://www.dimagi.com/commcare/)**: WHO-backed offline-first mobile field health apps for low-bandwidth environments. *Key takeaway: Delta syncing and local storage isolation.*

---

## 🔐 Security — Deferred Until > 10,000 Users

> These items are intentionally deferred. Implementing them prematurely on a small project adds complexity without proportional benefit. Revisit when monthly active users exceed 10,000.

- [ ] **Nonce-Based Content Security Policy (CSP)**
  - **Why deferred:** The current CSP has `unsafe-inline` which already makes XSS via CSP theoretically possible. Removing it requires injecting a unique cryptographic nonce into every `<script>` tag server-side, changing the build pipeline, and auditing all inline event handlers in `index.html`. This is a significant refactor.
  - **Why NOT to do it now:** At < 10K users, no real attacker is hunting for XSS in Dr.CAT. The bigger XSS risk (raw `innerHTML` with user data) is already fixed. The CSP effort/risk ratio is unfavorable for a small app.
  - **What to do when the time comes:** Generate a random nonce per request in `server/index.js`, inject it into every `<script>` tag via the HTML template, and replace `unsafe-inline` + `unsafe-eval` with `'nonce-{random}'` + `'wasm-unsafe-eval'` (for PDF.js WebAssembly).

---


- [x] **1-Tap AI Shortcuts, Centralized Pipeline & Strict Priority Order Directive (v1.7.0)** — Upgraded AI architecture (`cat_db_generator/lib/llm-engine.js`, `server/routes/cat-generator.js`, `index.html`):
  - **1-Tap AI Auto-Fill Modal Button**: Added `⚡ IA Auto` shortcut button to Add CAT modal (`index.html` & `admin.js`) to auto-populate all 5 fields using live Dual RAG.
  - **Centralized Pipeline Endpoint**: Created `POST /api/admin/cat-generator/pipeline-full` executing Web Fetch -> Dual RAG LLM -> Auto Approve in 1 call.
  - **Strict Priority Order Directive**: Replaced pseudo-numeric percentage weights with explicit priority directives (`PRIORITÉ 1 Baseline`, `PRIORITÉ 2 Supplement`, `PRIORITÉ 3 Synthesis`).
  - **Therapeutic Safety Assertions**: Programmatically intercepts Paracetamol > 4g/day, pediatric single doses > 15 mg/kg, and Aspirin Reye's syndrome risk.

- [x] **Master Batch Web Cache Purge Fix (v1.6.2)** — Generator Lab backend route hardening (`server/routes/cat-generator.js`):
  - **Route Validation Fix**: Resolved parameter check bug on `POST /api/admin/cat-generator/clear-web-cache` to allow global purging (`all: true` or missing title) without returning HTTP 400 errors.

- [x] **Dynamic LLM Model Discovery & Extended Thinking Engine (v1.6.1)** — Upgraded AI execution engine (`cat_db_generator/lib/llm-engine.js`):
  - **Dynamic Model Discovery (`discoverDynamicModels`)**: Queries Google AI Studio API (`GET /v1beta/models`) dynamically to discover active models, sorting them by semantic version numbers so future models (`gemini-3.7`, `gemini-4.0`) are automatically adopted without hardcoded code edits.
  - **Extended Thinking Budget (`thinkingConfig: { thinkingBudget: 2048 }`)**: Forces 2048-token extended reasoning for clinical decision logic.
  - **HTTP 429 Backoff & Retries**: Automatically pauses 4 seconds and retries primary models when rate-limited, keeping batch generations on high-performing primary models.

- [x] **Doctor-Grade Web RAG Engine V2 (v1.6.0)** — Upgraded multi-channel web research module (`cat_db_generator/lib/web-fetcher.js`):
  - **StatPearls NCBI & MSD Pro Jina Reader**: Queries PubMed PMC REST API and Manuel MSD Professional via Jina MD Reader for bedside clinical guidelines.
  - **Clinical Density Guard (`isHighClinicalDensity`)**: Auto-filters retrieved web text to reject consumer fluff and retain physician posologies.

- [x] **Incremental Web Fetch Top-Up & Cache Purge Controls (v1.5.4)** — Upgraded Web RAG acquisition pipeline (`cat_db_generator/lib/web-fetcher.js` & `cat_generator_lab.html`):
  - **Incremental Top-Up Mode**: Subsequent Web Fetches automatically keep existing cached sources and query online only for missing guidelines up to target max (`maxSources: 6`).
  - **Force Online Refetch Control**: Added `🔄 Recharger Web` button in Generator Lab UI to trigger fresh online fetches.
  - **1-Click Web Cache Purging**: Added `🗑️ Vider Cache` UI button and protected backend endpoint `POST /api/admin/cat-generator/clear-web-cache`.

- [x] **Real-Time Live Telemetry, IP Whitelisting & Auto-Version Stamping (v1.5.3)** — Comprehensive Analytics Lab & Telemetry hardening:
  - **Real-Time 5-Min Live Users**: Displays 🟢 `En Ligne (< 5 min)` live active users card and table badges alongside 24h DAU and 30j MAU.
  - **Dev/Admin IP Auto-Whitelisting**: Automatically identifies developer requests (Localhost, Admin Token, or Server IP) and groups them as `👑 Dev / Admin`, eliminating self-testing noise from external beta metrics without affecting route security.
  - **Manual Dev/External Toggle Button**: 1-click `[ -> Dev ]` / `[ -> Externe ]` toggle directly in the Analytics Lab table.
  - **Universal Platform & Version Headers**: Client (`public/js/api.js`) transmits explicit `x-device-platform` (`android_apk` vs `web_pwa`) and dynamic `x-app-version` (`1.5.3`).
  - **Automatic Meta Version Stamping**: `build.js` automatically stamps `<meta name="app-version">` from `package.json` into `index.html` on every build.
  - **Telemetry Reset with Confirmation Modal**: Added safe reset modal dialog guarding `POST /api/admin/active-devices/reset`.

- [x] **Doctor-Grade Tiered Prescription & Local-First Weighting Engine (v1.5.2)** — Upgraded synthesis engine (`cat_db_generator/lib/llm-engine.js` & `web-fetcher.js`) featuring:
  - **Tiered Ordonnance Formatting**: Enforces 3 distinct clinical tiers (`1ère INTENTION`, `ALTERNATIVES [OU]`, `TRAITEMENT SYMPTOMATIQUE / ADJUVANT`) to prevent flat list dumping and accidental polypharmacy.
  - **Local-First Weighting**: Prioritizes Algerian/Maghreb drug availability (Ascabiol/Benzoate de benzyle, Spasfon, Tiorfan, Smecta) over purely international molecules.
  - **Anti-Polypharmacy Warnings**: Auto-injects explicit `⚠️ ALTERNATIVE` warnings when topicals vs orals or competing alternatives should not be combined in 1st line treatment.
  - **Web RAG Relevance Filtering**: Strict accent normalization, test-query rejection, and multi-keyword source gathering across Wikipedia FR, MedG, and MSD Manuals.
  - **Lab UI Target Display**: Dynamically lists ungenerated production CATs as targets without polluting database files.

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
