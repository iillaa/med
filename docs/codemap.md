# Codebase Map (codemap.md) 🗺️

This document outlines the file layout, key data modules, and logic flows of **Dr. CAT — Rappel Clinique**. It serves as a structural map for developers and AI agents to quickly locate files and understand their responsibilities.

---

## 📂 Project Directory Structure

```text
/data/data/com.termux/files/home/med/
├── server.js                    # Express.js backend entry point (REST API, local auth, data cache)
├── index_pdfs.js                # PDF parser & text indexer script (LlamaParse/Gemini AI pipeline)
├── build.js                     # Static site compilation & minifier for cats_db, pdf_index & pdf_list
├── set_admin_password.js        # Admin password setter (PBKDF2 hash)
├── set_server_provider.js       # Server-provider list setter (writes remote_server_config.json)
├── cats_db.json                 # JSON database of clinical fiches (CATs)
├── cats_db.json.bak             # Automatic database backup (created before writes)
├── suggestions.json             # Moderation suggestions queue
├── pdf_index.json               # Master indexed PDF page text database
├── cats_db.json                 # JSON database of clinical fiches (CATs)
├── cats_db.json.bak             # Automatic database backup (created before writes)
├── suggestions.json             # Moderation suggestions queue
├── pdf_index.json               # Master indexed PDF page text database
├── package.json                 # Node dependencies, version (1.15.0), and build scripts
├── todo0xalpha.md               # Security audit ledger: bugs found → fixes → commits → verify commands (v1.12.0)
├── README.md                    # Project landing, features, security and performance overview
│
├── admin/                       # Standalone Full-Page Administrative Studios (Localhost Only)
│   ├── cat_generator_lab.html   # Studio V3.5 Dual-RAG CAT Generator & Validation
│   ├── quiz_lab.html            # Studio V2 Clinical Quiz Lab & Staging Inspector
│   ├── pdf_lab.html             # Studio PDF Master Slicer & OCR OCR Workbench
│   └── analytics_lab.html       # Audience and performance analytics monitor
│
├── cat_db_generator/            # Database V3.5 & Quiz Docimology Engine
│   ├── generate_cat_db.js       # CLI CAT generator engine (--canary + --golden regression)
│   ├── golden_set.json          # 5 fixed clinical cases scored after prompt changes (--golden)
│   ├── cats_db_staged.json      # Staging CAT DB (pure array, version in sidecar meta)
│   ├── quiz_db_staged.json      # Staging Quiz DB (vignettes, QCMs, rationales, prescriptions)
│   ├── GUIDE.md                 # V3.5 Generator & Validator documentation
│   ├── clinical_library/        # Tier 2 Action Decision Trees (MedG, Antibioclic, SFMU, Pédiadol, MSF, CRAT)
│   ├── scripts/
│   │   └── generate_quiz_cli.js # CLI tool for quiz suite generation & staging publishing
│   └── lib/
│       ├── quiz-generator-v2.js # Doctor-grade docimology engine (KFQs, SCTs, differential distractors)
│       ├── llm-engine.js        # Gemini Flash Dual RAG & Active Learning engine
│       ├── db-paths.js          # Canonical staging path resolver + schema-version sidecar reader
│       ├── pdf-extractor.js     # 5-field metadata precision RAG scanner with Pure Signal isolation
│       ├── web-fetcher.js       # Web RAG scraper with Doctor Custom URL injector
│       ├── medical-validator.js # Deterministic 8-layer medical & dosage ceiling validator
│       └── knowledge-library.js # Sub-millisecond clinical library reader
│
├── data/                        # Server Data & Pharmacopeias
│   ├── pdf_masters/             # Uncompressed master original PDFs for AI indexing
│   ├── pdf_staging_index.json   # Staging drafts and sliced fiches sandbox
│   ├── bdpm_pharmacology.json   # French BDPM Database (15,857 authorized drugs, 4,474 DCIs)
│   ├── algerian_nomenclature.json# Algerian Nomenclature (4,627 registered commercial brands)
│   └── web_cache/               # Cached medical web guidelines and doctor links
│
├── server/                      # Server Modules & Services Architecture
│   ├── index.js                 # Server routes & middleware bootstrap
│   ├── routes/
│   │   ├── cat-generator.js     # V3.5 Generator Lab endpoints & SSE telemetry
│   │   ├── quiz-lab.js          # Studio V2 Quiz staging, generation & publish routes
│   │   ├── pdfs.js              # PDF Lab 2.0 Ingestion, Visual Slicer, GPS Sommaire & Staging API
│   │   ├── cats.js              # CAT CRUD API with client IP protection sanitization
│   │   ├── search.js            # High-speed PDF search routes
│   │   └── version.js           # Version checker & Kill Switch API
│   └── services/
│       └── data-store.js        # Safe async JSON read/write queues
│
├── scripts/                     # Utility & Optimization Scripts
│   ├── clean_android_assets.js  # Android asset stripper (anti-decompilation protection)
│   ├── compress_pdfs.js         # Ghostscript ultra-compressor
│   ├── termux-wrangler-fix.sh   # Patches workerd for Termux/ARM after npm install (wrangler CLI fix)
│   └── upgrade_db_schema.js     # Safe staging-DB migration + schema_version stamping (backups included)
│
├── docs/security-hardening-v1.12.0.md  # 0x-alpha audit technical write-up
│
├── tests/                       # Automated Verification & Test Suite
│   ├── run_all_tests.js         # Master test runner (10 sub-suites)
│   ├── test_api.js              # Server API smoke tests
│   ├── test_auth.js             # Authentication tests
│   └── test_suggestions.js      # Suggestion lifecycle tests
│
├── docs/                        # Active Core Documentation
│   ├── codemap.md               # Structural codebase map (this file)
│   ├── developer_guide.md       # Developer setup, commands, testing & CI/CD workflow
│   ├── technical_architecture.md# Deep-dive system architecture, security & telemetry specs
│   ├── v2_generator_architecture.md # V3.5 Generator & PDF Lab 2.0 technical blueprint
│   └── lessons_learned.md       # Engineering log: pitfalls, fixes, bugs avoided
│
└── public/                      # App Frontend Root (Packaged into APK)
    ├── index.html               # Main single-page application structure
    ├── pdf_viewer.html          # Custom offline-ready PDF.js-based reader
    ├── style.css                # CSS entry point
    ├── dist/                    # Production minified JS bundle (app-*.js)
    └── data/                    # Sanitized offline database copies (stripped of AI metrics)
        ├── cats_db.json
        ├── pdf_index.json
        └── pdf_list.json
    ├── manifest.json            # PWA app description file
    ├── service-worker.js        # PWA asset cacher and offline routing service
    │
    └── js/
        ├── main.js              # Initial orchestration, PWA SW config, app mode detection
        ├── api.js               # API client (online server/offline Capacitor/localStorage router)
        ├── install-id.js        # Anonymous Installation ID (UUIDv4) token manager
        ├── version-checker.js   # Client version checker & Kill Switch lock gate (IIFE scope)
        ├── state.js             # Client-side state manager (active fiches, scores, filters)
        ├── utils.js             # Shared helpers (markdown parser, toaster alerts, swipe controls)
        ├── performance.js       # Telemetry engine: milestones, click profiling, API timing
        ├── debug-console.js     # Floating 🐛 debug console with network request interceptor
        ├── server-providers.js  # Remote tunnel provider registry (Ngrok, Cloudflare, custom)
        ├── remote_config.js     # Generated server URLs baked at build time (⚠️ Git-ignored)
        ├── lib/                 # Shared utility modules
        │   └── helpers.js       # Shared helpers: isOfflineCat(), mergeCatsWithLocalState()
        │
        └── components/
            ├── sidebar.js       # Deep content search filter & sidebar rendering
            ├── workspace.js     # Detail view workspace (Summary, Prescriptions, PDFs tab)
            ├── dashboard.js     # Stats dashboard & admin moderation manager
            ├── quiz.js          # Interactive QCM & text writing evaluation system
            ├── diagnostics.js   # Live server diagnostics panel
            └── dashboard/
                ├── admin.js     # Admin Moderation Panel tab router
                └── admin_version.js # Kill Switch control panel & Analytics Lab launcher
```

---

## 🔩 Core API Endpoints

### 1. Versioning & Force Update System
* `GET /api/version`: Returns active version configuration (`minVersion`, `latestVersion`, `forceUpdateActive`, `updateMessage`, `downloadLinks`).
* `PUT /api/admin/version`: Protected by `x-api-key`. Allows toggling the Kill Switch and updating min version numbers.

### 2. Device Telemetry & Analytics
* `GET /api/admin/active-devices`: Protected by `x-api-key`. Returns aggregated device analytics (Total Devices, DAU 24h, MAU 30d, Version Distribution).

### 3. Standalone Admin Labs
* `/pdf_lab.html`: PDF page indexer, quality inspector, and LlamaParse/Gemini lab (Localhost protected).
* `/analytics_lab.html`: Active device telemetry lab with search/filters, version progress bars, modal inspection, and CSV export (Localhost protected).
