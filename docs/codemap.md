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
├── remote_server_config.json    # Active tunnel/provider URL config (⚠️ Git-ignored)
├── admin_password.txt           # PBKDF2-hashed admin password (⚠️ Git-ignored)
├── capacitor.config.json        # Capacitor native wrapper configuration
├── package.json                 # Node dependencies, version (1.1.6), and build scripts
├── README.md                    # Project landing, features, security and performance overview
│
├── server/                      # Server Modules & Services Architecture
│   ├── index.js                 # Server routes & middleware bootstrap
│   ├── config/
│   │   ├── constants.js         # Security keys & constants
│   │   └── version.json         # Master version config (minVersion, latestVersion, forceUpdateActive)
│   ├── data/
│   │   └── active_devices.json  # Persistent store for anonymous device tokens & telemetry
│   ├── middleware/
│   │   ├── rate-limit.js        # Express WAF & IP rate limiter (80 req/min critical, 180 req/min API)
│   │   └── version-guard.js     # Numeric version check & HTTP 426 Upgrade Required middleware
│   ├── routes/
│   │   ├── admin-analytics.js   # GET /api/admin/active-devices analytics endpoint
│   │   ├── search.js            # PDF search & index status routes
│   │   ├── server-providers.js  # Server provider discovery & CORS management routes
│   │   └── version.js           # GET /api/version & PUT /api/admin/version config endpoints
│   ├── services/
│   │   ├── active-devices.js    # Device telemetry service (DAU, MAU, version distribution)
│   │   ├── allowed-origins.js   # Dynamic CORS allowlist service
│   │   ├── auth-service.js      # Session token validation service
│   │   └── data-store.js        # Safe async JSON read/write queues
│   └── utils/
│       └── request.js           # Loopback IP & reverse-proxy request helpers
│
├── data/                        # Server Data & PDF Master Store
│   ├── pdf_masters/             # Uncompressed master original PDFs for AI indexing (⚠️ Git-ignored)
│   └── pdf_cache/               # Cached SHA-256 JSON extractions from LlamaParse/Gemini
│
├── scripts/                     # Utility & Optimization Scripts
│   └── compress_pdfs.js         # Ghostscript ultra-compressor (96 DPI + JPEGQ 60 + Bicubic downsampling)
│
├── tests/                       # Automated Verification & Test Suite
│   ├── run_all_tests.js         # Master test runner
│   ├── test_api.js              # Server API smoke tests
│   ├── test_auth.js             # Authentication & protected route tests
│   ├── test_suggestions.js      # Full suggestion lifecycle tests
│   ├── test_version.js          # Numeric version comparison & route exclusion unit tests
│   ├── test_analytics.js        # Device telemetry & DAU/MAU calculation unit tests
│   ├── test_cat_search.js       # Deep multi-token CAT content search unit tests
│   ├── test_resume.mjs          # "Reprendre la révision" tests
│   └── test_prescription.mjs    # Prescription rendering tests
│
├── todo/                        # Active Decision Trees & Flowcharts
│   ├── arbre_decisionnelle/     # Decision tree data assets
│   └── arbre_decisionnelle_project.md # Interactive Decision Tree specification
│
├── docs/                        # Active Core Documentation
│   ├── codemap.md               # Structural codebase map (this file)
│   ├── developer_guide.md       # Developer setup, commands, testing & CI/CD workflow
│   ├── technical_architecture.md# Deep-dive system architecture, security & telemetry specs
│   └── lessons_learned.md       # Engineering log: pitfalls, fixes, bugs avoided (36 items)
│
├── archive/                     # Archived Historical Specifications & Reports
│   ├── ARCHIVE_NOTICE.md        # AI agent / bot warning notice against reading obsolete specs
│   ├── README.md                # Archive directory notice
│   ├── docs/                    # Archived specs (premium-todo, plan-progress, perf-baseline, etc.)
│   └── todo/                    # Archived legacy todo items
│
├── .github/
│   └── workflows/
│       └── build-apk.yml        # CI/CD compiler to build standalone Android APK on push
│
└── public/                      # App Frontend Root
    ├── index.html               # Main single-page application structure
    ├── pdf_viewer.html          # Custom offline-ready PDF.js-based reader
    ├── pdf_lab.html             # Standalone PDF Inspector & Extraction Lab (Localhost protected)
    ├── analytics_lab.html       # Standalone Analytics & Device Telemetry Lab (Localhost protected)
    ├── style.css                # CSS entry point
    ├── css/                     # Modular CSS stylesheets
    │   ├── utilities.css        # Extracted utility classes
    │   └── update-modal.css     # Hard Kill Switch lock screen overlay styles
    ├── data/                    # Bundled offline database copies (generated by build.js)
    │   ├── cats_db.json
    │   ├── pdf_index.json
    │   └── pdf_list.json
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
