# 🩺 Dr. CAT Generator — Master Architecture, Strategy & Unified V3.5 Roadmap
> **Document Name**: `todo_cat_generator_v3.md`  
> **Author & Lead Architect**: Dr. Kibeche Ali Dia Eddine  
> **Current Version**: v1.10.1+ | **Branch**: `beta-test-pr`  
> **Purpose**: Master registry of completed architectural milestones, live technical specifications, and prioritized remaining tasks.

---

## 🎯 1. Architectural Philosophy & Core Paradigm

The **Dr. CAT Generator (v3.5)** is engineered as a **precision Doctor-Grade Clinical Engine** driven by a strict 4-pillar architectural foundation:

```
┌─────────────────────────────────────────────────────────────────────────────┐
│                    DR. CAT V3.5 GENERATOR ARCHITECTURE                      │
├─────────────────────────────────────────────────────────────────────────────┤
│ 1. 🧠 AI Reasoning Engine (Gemini Flash Unthrottled) :                      │
│    - Fast, unthrottled medical reasoning without cognitive clutter.         │
│    - Dynamic model discovery (Gemini 3.7 / 3.6 Flash) + 4-tier JSON parser. │
│                                                                             │
│ 2. 📐 Lean Universal Master Prompt :                                        │
│    - Universal 7-step clinical / 3-step administrative structure.           │
│    - Anti-polypharmacy 4-section ordonnance ledger.                         │
│    - Universal "Zéro Posologie Vague" rule.                                 │
│    - Transversal terrain invariants (Pédiatrie, Grossesse CRAT, Gériatrie). │
│                                                                             │
│ 3. 📚 Concrete Ground Truth (Dual RAG) :                                    │
│    - Tier 1: Local curated Algerian PDFs & Clinical Monographs.             │
│    - Tier 2: Precision Clinical Decision Library (HAS, SFMU, CRAT, MedG).   │
│    - Tier 3: Real Online Web Articles (PubMed efetch, MSD via Jina).        │
│    - Tier 4: Active Doctor Learning Memory (human edits preserved).         │
│                                                                             │
│ 4. 🛡️ Deterministic Safety Firewall (8-Layer Medical Validator) :           │
│    - Immutable drug ceilings, dangerous interactions, CRAT, typos (500g).   │
│    - 3-attempt automated checksum and correction retry loop.                │
└─────────────────────────────────────────────────────────────────────────────┘
```

---

## ✅ 2. Completed Work Record (Done Milestones)

### 2.1 LLM Engine & Reasoning Pipeline (`cat_db_generator/lib/llm-engine.js`) — DONE ✅
- [x] **Dynamic Google AI Studio Model Discovery**: Queries `/v1beta/models`, sorts by capability (`3.7` > `3.6` > `3.5` > `3.0`), 1h TTL cache.
- [x] **4-Tier Robust JSON Parser**:
  - *Tier 1*: Direct native `JSON.parse`.
  - *Tier 2*: Control characters strip + trailing comma cleanup.
  - *Tier 3*: String-literal newline/tab repair.
  - *Tier 4*: Deterministic key-boundary regex extraction.
- [x] **Dynamic Thinking Budget**: 4,096 tokens for Pro models, 2,048 for Flash models.
- [x] **Rate Limit & Timeout Resilience**: 10s cooldown on HTTP 429 errors (up to 3 retries) + 60s `AbortController` timeout.
- [x] **Lean Universal Master Prompt**:
  - Universal 7-step clinical logic (`0. ABCDE -> 1. Diagnostic -> 2. Drapeaux Rouges -> 3. Examens -> 3bis. Terrain -> 4. Prise en charge -> 5. Orientation & Suivi`).
  - Automatic administrative switch for legal documents (certificats, CBU, lettres).
  - Anti-polypharmacy 4-section ordonnance (`TRAITEMENT NON MÉDICAMENTEUX & RHD`, `1ère INTENTION`, `ALTERNATIVES [OU]`, `TRAITEMENT SYMPTOMATIQUE / ADJUVANT`).
  - **Universal "Zéro Posologie Vague" Rule**: Imposes `[DCI] + [Nom commercial] + [Forme] + [Posologie journalière explicite mg/g ou dose-poids] + [Fréquence] + [Durée]`.
  - **Clean Summary Rule**: Strict prohibition of markdown `[...](subcat:1)` links in the summary text.
  - **Specialty Clutter Removal**: Removed bulky specialty blocks from the universal prompt, keeping Gemini un-throttled.

### 2.2 Targeted Sub-CATs Micro-Engine & Option C (v1.10.0) — DONE ✅
- [x] **Option C Pre-Configuration Panel (`admin/cat_generator_lab.html`)**:
  - Radio selector: Standard (1-Tab Rapide) vs Multi-Profils (Master + Sous-Fiches).
  - 6 1-click clinical presets (*🤰 Grossesse CRAT, 👴 Gériatrie Start Low, 👶 Pédiatrie mg/kg/j, 🚨 Urgences, 🫘 Rénal DFG, 🧠 RUD*) + custom text input.
- [x] **Targeted Sub-CAT Micro-Prompt Engine (`generateSubCATWithLLM`)**:
  - Strict 4-step summary (`0. Spécificités & Urgence`, `1. Diagnostic`, `2. Prise en Charge`, `3. Surveillance`).
  - Non-contradiction and zero-repetition rules relative to the parent Master CAT.
  - 4-section prescription with "Zéro Posologie Vague" enforcement.
- [x] **Interactive Workspace Pill Bar (`public/js/components/workspace.js`)**:
  - Top segmented pill navigation bar dynamically switching summary, red flags, and ordonnance in real time.

### 2.3 Deterministic 8-Layer Medical Safety Firewall (`cat_db_generator/lib/medical-validator.js`) — DONE ✅
- [x] **Pharmacological Toxicity Ceilings (`clinical_drug_ceilings.json`)**:
  - Daily adult maximum dose ceilings, pediatric weight-based ceilings, single-dose ceilings, and CRAT safety flags.
- [x] **Dangerous Drug-Drug Interactions Matrix (`dangerous_drug_interactions.json`)**:
  - 18 ANSM/Vidal contraindicated red pairs (QT prolongation, serotonin syndrome, Triple Whammy, Statin + Fusidic acid, etc.).
- [x] **Dynamic Drug Safety Rules (`drug-safety-rules.json`)**:
  - Standalone JSON safety assertions (Aspirin pediatric viral illness Reye's syndrome, NSAIDs > 24 SA pregnancy, Metformin DFG < 30).
- [x] **Typo & Order-of-Magnitude Interceptor**:
  - Intercepts dangerous unit errors (e.g. `500g` vs `500mg`, `1000g` vs `1000mg`).
- [x] **Anti-Hallucination Placeholders Check**:
  - Rejects `lorem ipsum`, `à compléter`, `tbd`, `dose usuelle`, `selon le cas`.
- [x] **3-Attempt Automated Checksum & Correction Loop**:
  - Feeds validator error diagnostics directly back into Gemini prompt on failure for self-correction.

### 2.4 PDF Lab 2.0 & Ingestion Workbench (`admin/pdf_lab.html`) — DONE ✅
- [x] **Visual Interactive PDF Slicer & Cropper**:
  - Native canvas rendering via `PDF.js` with interactive draggable top/bottom crop lines.
  - Automatic safety margin (+15px) preventing severed headers or posology subscripts.
  - Dual-mode export: Vector slice (`pdf-lib`) in 15ms or Canvas High-Res image bundle.
- [x] **Two-Tier Ingestion Sandbox (Staging vs Master Corpus)**:
  - Staging Sandbox for testing, OCR cleanup, and metadata tagging.
  - 1-click promotion button (`[💎 Promouvoir dans le Master Index]`) locking verified slices into `pdf_index.json`.
- [x] **Live RAG Simulator & Section-Anchor Extraction**:
  - Real-time token search with strict French word-boundary (`\b`) regex.
  - Extracts full treatment blocks (`Traitement`, `Posologie`, `Signes de gravité`) over 1,200–2,000 characters.

### 2.5 Web Fetcher V3 & Jina Reader (`cat_db_generator/lib/web-fetcher.js`) — DONE ✅
- [x] **PubMed PMC `efetch` API**: Fetches authentic full medical abstracts instead of empty metadata listings.
- [x] **MSD Manuals Professional via Jina Reader**: Extracts verified clinical chapters directly.
- [x] **Custom Doctor URL Injector**: Input field in Admin Lab and Add CAT modal to paste official links (`sante.gov.dz`, `cnpm.org.dz`).
- [x] **30-Day Cache Staleness TTL**: Automatically refreshes stale cached web results.
- [x] **1-Click Offline / Online Toggle**: Instant 3-second offline generation with 1-click web opt-in.

### 2.6 Real-Time Diagnostic Debug Panel (`cat_db_generator/lib/debug-emitter.js`) — DONE ✅
- [x] **Server-Sent Events (SSE) Stream**: Live event bus streaming from `llm-engine`, `web-fetcher`, `pdf-extractor`.
- [x] **Admin Lab Telemetry Drawer**: Live visual status of each RAG channel, exact character counts, parser tiers, and latency.
- [x] **1-Click JSON Log Export**: Instant clipboard copy of the full raw telemetry payload for auditing.

### 2.7 Tier 2 Clinical Decision Library (`cat_db_generator/clinical_library/`) — DONE ✅
- [x] **Section-Aware Precision Chunking (`knowledge-library.js`)**: Dynamic token search across all specialized folders (HAS, SFMU, CRAT, MedG, MSF, Pediadol).
- [x] **Psychiatry & Mental Health Reference Guide (`has_psychiatrie_sante_mentale_urgences.md`)**:
  - Full clinical memo covering RUD suicide risk grid, BZD duration ceilings (12w/4w), SSRI delays + inhibition release, acute agitation monotherapy, and Algerian Health Law 18-11. Tested with 120-130 RAG scores.

### 2.8 Server Stability, Security & Process Supervision — DONE ✅
- [x] **PM2 Process Supervision (`ecosystem.config.js`)**: Auto-restart on crashes or memory spikes.
- [x] **Log Rotation (`scripts/rotate-logs.js`)**: Rotates logs > 10 MB and prunes older than 7 days (`npm run log:rotate`).
- [x] **Localhost Admin Auth Guard**: Restricts admin login strictly to local connections on Termux to prevent tunnel brute-forcing.
- [x] **User Storage Protection Protocol**: Lock screen and kill switch preserve 100% of user data (`dr_cat_notes_*`, reading history, Leitner stats, streaks).

---

## ⏳ 3. Active Actionable Roadmap (Pending Tasks)

### 🧱 Task 1: Architectural Decoupling & Codebase Modular Refactor (Idea 13)
* **Priority**: 🟠 HIGH | **Complexity**: Medium | **Status**: ⏳ Queued for Next Pass
* **Objective**: Decouple monolithic 1,000+ line files into cohesive, testable ES modules:
  1. **`admin/cat_generator_lab.html` (1,890 lines)**:
     - Extract client JS logic to `admin/js/cat_generator_lab.js`.
     - Extract inline styles to `admin/css/cat_generator_lab.css`.
  2. **`public/js/main.js` (1,219 lines)**:
     - Extract keyboard navigation & hotkeys to `public/js/shortcuts.js`.
     - Extract modal lifecycle & backdrop isolation to `public/js/modals.js`.
  3. **`public/js/utils.js` (1,026 lines)**:
     - Split into `public/js/utils/dom.js` (element builders, sanitizers) and `public/js/utils/formatters.js` (dates, text parsing, search tokenizers).
  4. **`public/css/workspace.css` (1,645 lines)**:
     - Partition into modular stylesheet imports (`workspace-reading.css`, `workspace-split.css`, `workspace-mobile.css`).

---

### ☁️ Task 2: Dedicated Cloudflare Snapshot Rail (`cloudflare-deploy`) (Phase D)
* **Priority**: 🟡 MEDIUM | **Complexity**: Low-Medium | **Status**: ⏳ Queued
* **Objective**: Streamline public cloud deployment without git commit pollution on the main work branch (`beta-test-pr`):
  1. Create a dedicated orphan/snapshot branch: `cloudflare-deploy`.
  2. Create a flat deployment script: `scripts/cf_deploy.js` (`npm run cf-deploy`):
     - Runs production build (`npm run build`).
     - Checks out / stages compiled assets to `cloudflare-deploy`.
     - Amends a single clean snapshot commit.
     - Force-pushes to GitHub for automated Cloudflare Workers trigger.
     - Automatically returns to the active working branch (`beta-test-pr`).

---

### 🔬 Task 3: Multi-Stage "Distill ➔ Decide ➔ Prescribe" Chain (Idea 5)
* **Priority**: 🔵 LOW / EXPLORATORY | **Complexity**: Medium | **Status**: ⏳ Pending Doctor Decision
* **Objective**: Further separate clinical fact extraction from master formatting:
  - *Pass 1 (Clinical Fact Distiller - 300ms Flash)*: Extracts raw validated molecules, dosages, and contraindications from RAG text into a 0-noise Fact Sheet.
  - *Pass 2 (Master Synthesizer)*: Formats the final CAT, sub-profiles, and 4-section ordonnance from the Fact Sheet.

---

### 🧪 Task 4: Batch Generation & Validation Audit of Core CAT Database
* **Priority**: 🟡 MEDIUM | **Complexity**: Low | **Status**: ⏳ Queued
* **Objective**: Run automated verification and batch generation across existing CATs to bring all database records to the 100% V3.5 standard.

---

## 🚫 4. Archived & Resolved Ideas (Historical Reference)

The following proposals from previous design sessions have been **fully resolved** by the introduction of the PDF Lab 2.0 Visual Curation Workbench:

- **Idea 3: Contiguous PDF Context Stitching ($N \pm 1$)**: Resolved by PDF Lab's interactive canvas range slicer which preserves complete chapters.
- **Idea 4: Action Block Extractor**: Resolved by visual chapter curation and automated section-anchor extraction.
- **Idea 7: Strict PDF Ingestion Gate**: Resolved by the Two-Tier Sandbox (Staging vs Master Corpus).
- **Idea 8: Smart Deduplicator**: Postponed/Resolved because PDF Lab slices are clean and atomic, eliminating publishing boilerplate.

---

## 📊 5. Master Roadmap Comparison Matrix

| Component | Focus Area | Technical Deliverable | Complexity | Live Status |
| :--- | :--- | :--- | :---: | :---: |
| **Task 1 (Idea 13)** | Codebase Health | Modularize `cat_generator_lab.html`, `main.js`, `utils.js`, `workspace.css`. | Medium | ⏳ **Next Priority** |
| **Task 2 (Phase D)** | DevOps & Deployment | Publish-only `cloudflare-deploy` branch + `npm run cf-deploy` script. | Low | ⏳ **Queued** |
| **Task 4** | Database Quality | Batch audit & generation of 55+ production CATs in V3.5. | Low | ⏳ **Queued** |
| **Task 3 (Idea 5)** | AI Generation Chain | 2-Pass Fact Distiller ➔ Master Synthesizer. | Medium | ⏳ *Pending Decision* |
| **LLM Engine V3.5** | Core AI Logic | Universal Master Prompt, Zero Vague Posology, Sub-CAT Option C. | High | ✅ **Completed (v1.10.1)** |
| **Medical Validator** | Drug Safety | 8-layer validator, clinical ceilings, dangerous interactions, CRAT. | High | ✅ **Completed** |
| **PDF Lab 2.0** | RAG Grounding | Visual Slicer, +15px margins, Staging Sandbox, Section Anchors. | High | ✅ **Completed** |
| **Web Fetcher V3** | Web RAG | PubMed `efetch`, MSD Jina, Custom Doctor URL, 30d TTL. | Medium | ✅ **Completed** |
| **Debug Panel** | Telemetry & Observability | SSE live event stream, token tracking, 1-click JSON log export. | Medium | ✅ **Completed** |
| **Server & Auth** | Reliability | PM2 auto-restart, log rotation, localhost admin security. | Medium | ✅ **Completed** |

---

## 📝 Document History & Attribution
- **Consolidated**: 2026-08-20 (Merged `todo4catgenerator.md`, `todosuggestion.md`, and `todo_cat_generator_v3.md`).
- **Author & Copyright**: Dr. Kibeche Ali Dia Eddine
- **Active Master File**: `cat_db_generator/todo_cat_generator_v3.md`
