# 🩺 Dr.CAT Generator — Master Architecture, Strategy & Actionable TODO
> **Document Name**: `todo4catgenerator.md`
> **Author**: Dr. Kibeche Ali Dia Eddine
> **Status**: Active Master Plan

---

## 🎯 1. Overview & Architectural Goals

The Dr.CAT Generator is designed to produce **Doctor-Grade Clinical Action Templates (CATs)** and fiches synthèses using a multi-layered Dual-RAG engine combining local Algerian PDF textbooks, live web clinical articles, and doctor-in-the-loop custom inputs.

---

## 🚀 2. Actionable Implementation TODO List

### 🌐 Phase A: Web Fetcher Precision & Fast AI Discoverer
- [x] **Full Phrase Search Priority (`cat_db_generator/lib/web-fetcher.js`)**:
  - Prioritize exact multi-word medical terms (e.g. `"colique hépatique"`, `"otite moyenne aiguë"`) instead of chopping into single words (`"colique"`, `"otite"`).
- [x] **Shell Page & Search Result Rejection**:
  - Strictly reject empty search listing shells (URLs matching `SearchResults?query=`, `search?q=`) to ensure only direct article/chapter content is saved into `web_cache/`.
- [x] **Fast AI Discoverer (`gemini-2.0-flash`)**:
  - Use fast light AI (~300ms) to dynamically generate doctor-grade search queries for PubMed/MSD.
  - Run a 1-pass fast AI quality check on fetched web pages to filter out off-topic text before passing context to heavy synthesis AI.

---

### 👨‍⚕️ Phase B: Human-in-the-Loop Custom Link Injector
- [x] **Doctor URL Input in Lab & Modal**:
  - Add custom URL input in Admin Generator Lab (`cat_generator_lab.html`) and Add CAT modal for doctors to paste niche/local medical links (`sante.gov.dz`, `cnpm.org.dz`, specific PDFs/blogs).
- [x] **Jina Reader Processing**:
  - Automatically fetch pasted custom links via Jina Reader and store them in `data/web_cache/`.
- [x] **Equal Weight Context Injection**:
  - Inject doctor-provided links alongside AI-discovered web context into Gemini Flash synthesis prompt with equal priority.

---

### 📑 Phase C: PDF RAG Fitness Inspector & Human TOC Indexer
- [x] **RAG Fitness Score Badges (`admin/pdf_lab.html`)**:
  - Display live RAG Fitness Score badges (+90 pts TOC presence, +60 pts exact title, +20 pts section anchors) in PDF Lab.
- [x] **1-Click AI Prompt Generator**:
  - Include 1-click prompt generator based on `GUIDE_PDF_RAG_STANDARDIZATION.md` to standardize new PDF guides.
- [x] **Human TOC GPS Indexer**:
  - Provide UI for doctors to paste table of contents pages directly into `pdf_index.json` to anchor chapter locations.

---

### 🧩 Phase E: Human-in-the-Loop Targeted Sub-CATs & Option C Architecture (v1.10.0)
- [x] **Option C Pre-Configuration Panel (`admin/cat_generator_lab.html`)**:
  - Radio toggle between Standard (1-Tab Rapide) and Multi-Profils (Master + Sous-Fiches).
  - 6 1-click clinical presets (CRAT, Start Low Go Slow, mg/kg/j, Urgence, DFG, RUD) + custom text input.
- [x] **Targeted Sub-CAT Micro-Prompt Engine (`generateSubCATWithLLM`)**:
  - Strict 4-step summary (`0. Spécificités`, `1. Diagnostic`, `2. Prise en Charge`, `3. Surveillance`) and 4-section ordonnance with non-contradiction rules.
- [x] **8-Layer Automated Medical Checksum Loop**:
  - Verifies daily drug ceilings, dangerous interactions, CRAT safety, and pediatric dosing with 3-attempt automated retry loop.
- [x] **Segmented Pill Navigation Bar (`public/js/components/workspace.js`)**:
  - Interactive top pill bar dynamically switching summary, red flags, and ordonnance in real time.

---

### ☁️ Phase D: Dedicated Cloudflare Snapshot Rail (`cloudflare-deploy`)
- [ ] **Publish-Only Deploy Branch**:
  - Create a separate `cloudflare-deploy` branch linked exclusively to Cloudflare Workers deployment.
  - This branch acts as a snapshot rail — completely decoupled from `beta-test-pr` (work branch).
- [ ] **Flat Amending Deploy Script (`npm run cf-deploy`)**:
  - Script compiles production bundle → amends a single commit on `cloudflare-deploy` → force-pushes to GitHub.
  - **Benefit**: Zero git commit pollution on the main work branch while allowing instant Cloudflare updates.

---

## 🛠️ 3. Core Engine Architecture Specifications

### 3.1 Dual-Rail Network Boundary
- **90% Mass Content (Cloudflare Worker - `drcat.dr-cat.workers.dev`)**:
  - Serves static database packs (`cats_db.json`, `pdf_list.json`, `pdf_index.json`).
  - Mobile apps fetch updates over-the-air (OTA) without needing new APK releases.
- **10% Admin Control Rail (Ngrok / Termux - `rendition-duchess-dry.ngrok-free.dev`)**:
  - Serves Security Lock Gate, Kill Switch (`/api/version`), Admin Lab endpoints, and live suggestion polling.

### 3.2 Clinical Posology & Drug Safety Engine
- **4-Section Prescriptions**: Enforces `1ère INTENTION`, `ALTERNATIVES [OU]`, `TRAITEMENT SYMPTOMATIQUE`, and `NON MÉDICAMENTEUX`.
- **Local Availability Weighting**: Prioritizes Algerian/Maghreb commercial trade names (*Ascabiol*, *Spasfon*, *Tiorfan*, *Smecta*).
- **Safety Assertions**: Active overdose ceilings (Paracetamol 4g/day max), pediatric weight-based dosing (`mg/kg/prise`), NSAID pregnancy warnings (> 24SA), and Aspirin Reye's syndrome risk assertions.

---

## 📜 4. Document History
- **Created**: 2026-08-17
- **Location**: `cat_db_generator/todo4catgenerator.md`
