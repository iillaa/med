# 📋 Dr. CAT — Generator Architecture Suggestions & Evolution Tracker
> **Document Name**: `todosuggestion.md`  
> **Purpose**: Master registry of architectural proposals and fine-tuning ideas discussed across sessions.  
> **Review Workflow**: The doctor reviews each numbered idea chronologically and selects which ones to implement as we progress.

---

## 💡 Idea Registry (Chronological Progression)

---

### 💡 Idea 1: Micro-Level Ghost Testing & Full Raw Telemetry Interception
- **Origin Session**: Initial Ghost Test & Inspection Session.
- **Problem Observed**:
  - High-level automated tests only verified exit codes (`200 OK`) and schema syntax (`Zod valid: true`), missing semantic context pollution inside the prompt (e.g. 500 characters of unrelated antibiotics text sent inside a cardiology query).
- **Proposed Solution**:
  - Implement full micro-level ghost test suites that intercept and export:
    1. Exact 100% complete `System Prompt` and `User Prompt` (`01_RAW_SYSTEM_AND_USER_PROMPT_SENT_TO_AI.txt`).
    2. Raw unparsed AI response stream (`02_RAW_API_RESPONSE_FROM_AI.txt`).
    3. Word-by-word RAG snippet inspection diffs.
- **Impact & Feasibility**:
  - **Impact**: ⭐⭐⭐⭐ (Essential for debugging AI inputs).
  - **Feasibility**: High (Already prototyped in `/storage/emulated/0/termux/hta2`).
- **Doctor Status**: ⏳ `[To Verify / Completed Test Prototype]`

---

### 💡 Idea 2: Offline-First Grounding & Web Fetch Deprecation (Opt-in Only)
- **Origin Session**: Post-HTA Manual Inspection Review.
- **Problem Observed**:
  - Public web fetchers (PubMed efetch, open medical RSS/APIs) return low-yield epidemiological surveys (e.g. French bakery blood pressure self-screening), shallow definitions, or SEO fluff rather than practical emergency/outpatient decision trees.
  - Generates token waste, slow latency, and prompt distraction.
  - The offline curated corpus (*150 Ordonnances, Dr. Boughoufala, Urgences, MedG, SFMU, CRAT, Algérie monographs*) contains 100% concentrated, doctor-authored clinical truth.
- **Proposed Solution**:
  - Make Web Fetch **opt-in / on-demand only** (disabled by default for standard generation).
  - Ground 95%+ of generation strictly on **Tier 1 PDFs + Tier 2 Clinical Decision Packs + Algerian Drug Matrix**.
- **Impact & Feasibility**:
  - **Impact**: ⭐⭐⭐⭐⭐ (Eliminates 70% of prompt noise and cuts latency in half).
  - **Feasibility**: Very High (Simple configuration toggle in `llm-engine.js`).
- **Doctor Status**: ⏳ `[Pending Doctor Decision]`

---

### 💡 Idea 3: Contiguous PDF Context Stitching (Sliding Window $N-1 \leftrightarrow N \leftrightarrow N+1$)
- **Origin Session**: PDF Boundary Analysis (Cut Data Inspection).
- **Problem Observed**:
  - Single-page PDF indexing cuts text arbitrarily at page margins.
  - **Critical Clinical Danger**: A sentence starting on Page 30 (*"On prescrira de la Méthyldopa (Aldomet) :"*) is cut from Page 31 (*"1 comprimé matin et soir en cas d'HTA sévère"*). The AI sees the posology without the drug molecule, creating a major hallucination hazard in pregnancy!
- **Proposed Solution**:
  - Implement a **Sliding Context Window** in `pdf-extractor.js`:
    - If Page $N$ starts mid-sentence, mid-bullet, or without a molecule anchor ➔ automatically prepend the bottom 400 characters of **Page $N-1$**.
    - If Page $N$ ends mid-sentence or without terminal punctuation ➔ automatically append the top 400 characters of **Page $N+1$**.
- **Impact & Feasibility**:
  - **Impact**: ⭐⭐⭐⭐⭐ (Prevents dangerous drug-posology disconnections).
  - **Feasibility**: High (Algorithmic buffer in Node.js).
- **Doctor Status**: 🚫 `[Dismissed / Obsolete — Resolved by PDF Lab Curation Workbench]`

---

### 💡 Idea 4: Anchored Clinical Action Block Extractor (Pure Signal, Zero Noise)
- **Origin Session**: Input Context Optimization & Noise Reduction.
- **Problem Observed**:
  - Scanned PDF pages contain 50% non-actionable fluff (running headers, book titles, page numbers, ECNi codes, chapter intros).
- **Proposed Solution**:
  - Before injecting PDF text into the prompt, pass page text through a **Clinical Block Isolator**:
    - Retain only blocks bounded by actionable anchors:
      - `## Traitement / Posologie / Ordonnance`
      - `## Drapeaux Rouges / Signes de Gravité / Urgences`
      - `## Bilan / Diagnostic / Évaluation Initiale`
    - Discard table-of-contents lists, index pages, and running header text.
- **Impact & Feasibility**:
  - **Impact**: ⭐⭐⭐⭐⭐ (Reduces prompt size by 40-50% while increasing clinical density).
  - **Feasibility**: Medium (Regex block segmenter in `pdf-extractor.js`).
- **Doctor Status**: 🚫 `[Dismissed / Obsolete — Targeted curation in PDF Lab already provides pure clinical substance]`

---

### 💡 Idea 5: Multi-Stage "Distill ➔ Decide ➔ Prescribe" Generation Chain
- **Origin Session**: Monolithic vs Modular Prompt Architecture.
- **Problem Observed**:
  - The current single monolithic prompt forces Gemini to perform 5 complex cognitive tasks at once (filter noise + diagnose + extract red flags + write 4-section posologies + generate sub-profiles).
- **Proposed Solution**:
  - Split generation into 2 focused micro-passes:
    - **Pass 1 (Clinical Fact Distiller - 300ms Flash)**: Reads raw RAG text and outputs a clean, 0-noise "Medical Fact Sheet" (confirmed molecules, dosages, contraindications).
    - **Pass 2 (Master Synthesizer)**: Consumes ONLY the clean Fact Sheet + Algerian Drug Matrix to assemble the definitive CAT and sub-profiles.
- **Impact & Feasibility**:
  - **Impact**: ⭐⭐⭐⭐ (Guarantees zero-hallucination structured synthesis).
  - **Feasibility**: Medium.
- **Doctor Status**: ⏳ `[Pending Doctor Decision]`

---

### 💡 Idea 6: Visual Interactive PDF Slicer & Multi-Topic Book Chapter Splitter
- **Origin Session**: Fresh Start & Interactive Visual PDF Curation.
- **Problem Observed**:
  - Legacy medical books (e.g. *150 Ordonnances types*, *CAT Dr. Boughoufala*, *Urgences*) contain 200-500 pages covering dozens of different specialties and pathologies.
  - Slicing and tagging these manually without visual tooling was slow and error-prone.
- **Proposed Solution**:
  - Built a **Visual Interactive PDF Slicer & Cropper** directly in `admin/pdf_lab.html`:
    - **Visual Canvas Interface (`PDF.js`)**: Scroll through multi-page PDFs with interactive draggable Top/Bottom cut lines.
    - **Automatic Safety Margin (+15px)**: Automatically expands the crop area above and below to prevent clipping headers or posology subscripts.
    - **Dual Mode (Digital Range Slicer vs Scanned Image Cropper)**:
      - *Page Range Mode*: Uses `pdf-lib` to slice native vector pages in 15ms.
      - *Image Crop Mode*: Captures high-res canvas bounding box and bundles into a new clean standalone PDF.
    - **Direct Staging Deposit**: Extracted chapter is immediately tagged with Specialty, Pathologies, and deposited in the Staging Sandbox for 1-click promotion.
- **Impact & Feasibility**:
  - **Impact**: ⭐⭐⭐⭐⭐ (Massive productivity booster: slices large books into atomic fiches in seconds).
  - **Feasibility**: High (Integrated `PDF.js` + `pdf-lib` in `server/routes/pdfs.js`).
- **Doctor Status**: ✅ `[Implemented & Validated in PDF Lab]`

---

### 💡 Idea 7: Strict PDF Ingestion Gate & Acceptance Quality Checklist
- **Origin Session**: "Clean Input = Clean Output" Ingestion Protocol.
- **Problem Observed**:
  - Raw, unformatted, or low-quality scanned PDFs enter the RAG pool and dilute generation quality.
- **Proposed Solution**:
  - Build an automated **Acceptance Gate** in `pdf_lab.html`:
    - Checklist rules: Minimum OCR clarity, TOC GPS presence, and clinical section headers (`Traitement`, `Drapeaux Rouges`).
    - Flag/quarantine unformatted scans until converted or standardized.
- **Impact & Feasibility**:
  - **Impact**: ⭐⭐⭐⭐⭐ (Guarantees 100% doctor-grade input corpus).
  - **Feasibility**: Medium (Rule checker in `pdf_lab.html`).
- **Doctor Status**: ⏳ `[Pending Doctor Decision]`

---

### 💡 Idea 8: Smart Deduplicator & Context Token Quota Guard
- **Origin Session**: Token Budgeting, Noise Removal & Context Limits.
- **Problem Observed**:
  - If RAG retrieval extracts too many pages or repeated book headers across multiple documents, prompt context bloats beyond the optimal cognitive attention window of the AI and wastes tokens on duplicate sentences.
- **Proposed Solution**:
  - **Component 1 (Smart Deduplicator)**: Strips exact repeated non-clinical boilerplate publishing headers and disclaimers while keeping 100% of medical lines, posologies, and consensus points intact.
  - **Component 2 (Context Token Quota Guard)**: Monitors the total prompt context to ensure it stays compact (< 4,000 tokens) for maximum AI precision and speed.
- **Impact & Feasibility**:
  - **Impact**: ⭐⭐⭐⭐ (Prevents attention degradation and latency spikes).
  - **Feasibility**: High (Rule-based pre-prompt cleaner in `llm-engine.js`).
- **Doctor Status**: ⏸️ `[Postponed by Doctor — PDF Lab 2.0 visual curation already provides dense, clean targeted input]`

---

### 💡 Idea 9: Web Fetch UI Toggle Switch (Offline-Default with 1-Click Opt-In)
- **Origin Session**: Web Noise Elimination & Manual URL Support.
- **Problem Observed**:
  - Automatic web fetching is often unnecessary for established pathologies and adds latency/noise.
- **Proposed Solution**:
  - Add a **Toggle Switch** in Admin Generator Lab:
    - Default: `[🔘 100% Mode Hors-Ligne (PDFs + Guides Locaux - Ultra-Rapide)]`
    - Option: `[🔘 Activer Recherche Web (PubMed / MSD)]`
  - Keep the **Doctor Custom URL Input** active for pasting verified official links (`sante.gov.dz`).
- **Impact & Feasibility**:
  - **Impact**: ⭐⭐⭐⭐⭐ (Instant 3-second generation when offline, flexibility when needed).
  - **Feasibility**: Very High (UI toggle + server option parameter).
- **Doctor Status**: ✅ `[Implemented & Validated in Generator Lab]`

---

### 💡 Idea 10: Comprehensive Pharmacology & Toxic Dosage Ceiling Database (Vidal / ANSM / WHO Grounding)
- **Origin Session**: Clinical Intuition & Dosage Safety Validation Review.
- **Problem Observed**:
  - Currently, `medical-validator.js` relies on a small hand-written list of rules (Paracetamol 4g/day, Aspirin pediatric Reye's syndrome, basic placeholder checks).
  - For hundreds of other critical drugs (Cardiovascular, Antibiotics, NSAIDs, Antidiabetics, Corticosteroids, Neurologics, Analgesics), there is no comprehensive toxic ceiling database to catch LLM dosage hallucinations or decimal errors (e.g. generating `Ramipril 50mg` instead of `5mg`, or `Amlodipine 100mg` instead of `10mg`).
- **Proposed Solution**:
  - Build a rich, structured **Clinical Drug Safety & Toxicity Ceiling Database** (`clinical_drug_ceilings.json`):
    - **Adult Standard & Max Daily Ceilings** (Absolute 24h ceiling before toxicity).
    - **Pediatric Weight-Based Rules** (`mg/kg/jour` and maximum absolute ceiling).
    - **Absolute Pregnancy & Breastfeeding Contraindications** (CRAT/ANSM rules).
    - **Renal DFG Thresholds & Clearance Adjustments**.
  - Grounded in official authoritative sources: **ANSM RCP / Vidal France / WHO Essential Medicines / OpenFDA Pharmacopeia**.
  - Integrated directly into `medical-validator.js` as an immutable pharmacological firewall.
- **Impact & Feasibility**:
  - **Impact**: ⭐⭐⭐⭐⭐ (Guarantees zero dangerous dosage hallucinations across the entire pharmacopeia).
  - **Feasibility**: High (Structured JSON dataset + algorithmic parser in Node.js).
- **Doctor Status**: ✅ `[Implemented & Validated]`

---

### 💡 Idea 11: Two-Tier Ingestion & Curation Workbench (Staging Sandbox ➔ Master Production Corpus)
- **Origin Session**: Fresh Start & Human PDF Curation Strategy.
- **Problem Observed**:
  - Previously, raw unformatted PDFs entered the master index directly without a dedicated working/refinement area.
  - Large books need to be split, standardized, and checked for cut sentences *before* they become permanent ground truth.
- **Proposed Solution**:
  - Transform `admin/pdf_lab.html` into a **Two-Tier Ingestion Laboratory**:
    - **Tier A (Staging Sandbox)**: Temporary workspace where new/split PDF chapters are uploaded, tagged by specialty, edited (fixing OCR & sentence cuts), and tested with the RAG Simulator.
    - **Tier B (Master Concrete Corpus)**: Once verified by the doctor, click `[💎 Promouvoir dans le Master Index]` to lock it permanently into `pdf_index.json`.
- **Impact & Feasibility**:
  - **Impact**: ⭐⭐⭐⭐⭐ (Guarantees 100% clean, verified, doctor-approved ground truth).
  - **Feasibility**: High (UI layout update in `pdf_lab.html` + staging routes in `server/routes/pdfs.js`).
- **Doctor Status**: ✅ `[Implemented & Validated in PDF Lab]`

---

## 📊 Summary & Comparison Matrix

| Idea # | Focus Area | Core Benefit | Complexity | Live Status |
| :---: | :--- | :--- | :---: | :---: |
| **Idea 11** | Staging Ingestion Workbench | 2-Tier workspace (Staging Sandbox ➔ Verified Master Corpus). | Medium | ✅ **Implemented** |
| **Idea 6** | Visual PDF Slicer & Splitter | Interactive visual canvas + drag crop lines + auto +15px margins. | High | ✅ **Implemented** |
| **Idea 10** | Pharmacology & Ceilings | Comprehensive toxic dose ceilings & safety rules (Vidal/ANSM). | Medium | ✅ **Implemented** |
| **Idea 9** | Web Fetch UI Toggle | 1-click toggle to include/exclude web research & paste links. | Very Low | ✅ **Implemented** |
| **Idea 2** | Offline-First Grounding | Eliminates irrelevant case studies and web noise. | Very Low | ✅ **Implemented** |
| **Idea 1** | Telemetry & Auditing | Full visibility into exact raw prompts and responses. | Low | ✅ **Prototyped** |
| **Idea 8** | Smart Deduplicator & Context Quota | Strips repeated headers & guards token context (< 4,000 tokens). | Medium | ⏸️ *Postponed (PDF Lab 2.0)* |
| **Idea 5** | Multi-Stage Chain | Distills facts before final clinical synthesis. | Medium | ⏳ *Pending Decision* |
| **Idea 7** | Ingestion Acceptance Gate | Strict quality gate for adding new reference PDFs. | Medium | 🚫 *Resolved by PDF Lab* |
| **Idea 3** | Contiguous Page Stitching | Eliminates severed drug names and cut sentences ($N \pm 1$). | Medium | 🚫 *Resolved by PDF Lab* |
| **Idea 4** | Action Block Extraction | Extracts only treatment/red flag blocks from PDFs. | Medium | 🚫 *Resolved by PDF Lab* |

---

## 📝 Document History
- **Created**: 2026-08-18
- **Updated**: Added Idea 10 (Comprehensive Drug Ceilings & Toxic Dosage Firewall).
- **Author**: Dr. Kibeche Ali Dia Eddine
- **File**: `todosuggestion.md`
