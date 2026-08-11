# 🩺 CAT Generator — True V3 Architectural Blueprint & Master Plan
> **Date**: 2026-08-11 | **Branch**: `beta-test-pr` | **Author**: Dr. Kibeche Ali Dia Eddine

---

## 🎯 EXECUTIVE SUMMARY & V3 OBJECTIVES

The goal of **CAT Generator True V3** is to transition the generator from a system that relies primarily on Gemini's general pretrained knowledge into a **precision-engineered Doctor-Grade Clinical Engine** driven by:
1. **Real local Algerian PDF data** (extracted via a 2-Tier architecture without noise or substring false matches).
2. **Real online medical guideline articles** (fetching actual PubMed abstracts and MSD articles instead of search result listing pages).
3. **A Live Diagnostic Debug Panel** that allows the physician-admin to inspect every single token, retrieved snippet, parser tier, and LLM reasoning step in real time with 1-click exportable logs.

---

## ✅ PART 1 — COMPLETED WORK RECAP

### 1.1 LLM Engine (`cat_db_generator/lib/llm-engine.js`) — DONE ✅
- **Dynamic Model Discovery**: Auto-queries `/v1beta/models`, filters `generateContent` models, sorts by version (`3.6` > `3.5` > `3.0` > `2.0` > `latest`). 1h TTL cache.
- **4-Tier Robust JSON Parser**:
  - *Tier 1*: Direct native JSON.parse
  - *Tier 2*: Control characters strip + trailing comma removal
  - *Tier 3*: String-literal newline/tab repair
  - *Tier 4*: Deterministic key-boundary regex extraction
- **Dynamic Thinking Budget**: 4,096 tokens for Pro models, 2,048 for Flash models. Lite variants excluded.
- **Resilience & Timeouts**: 10s cooldown on HTTP 429 rate limits (up to 3 retries) + 60-second `AbortController` fetch timeout preventing stalled requests.
- **Clinical Schema & Prompt**: 7-Step clinical logic (`0. ABCDE -> 1. Diagnostic -> 2. Drapeaux Rouges -> 3. Examens -> 3bis. Terrain -> 4. Prise en charge -> 5. Orientation/Médico-légal`).
- **Anti-Polypharmacy 4-Section Ledger**: Enforces `1ère INTENTION`, `ALTERNATIVES [OU]`, `TRAITEMENT SYMPTOMATIQUE`, `TRAITEMENT NON MÉDICAMENTEUX`.
- **Administrative vs Clinical Lock**: Auto-detects administrative documents (certificats, CBU, lettres) and switches to 3-step medico-legal schema.
- **3-Attempt Validation Checksum Loop**: Auto-retries generation up to 3 times if schema/drug assertions fail.

### 1.2 Medical Validator & Safety Engine — DONE ✅
- **Dynamic Rules Engine (`drug-safety-rules.json`)**: Standalone JSON database covering **16 critical drugs**. Zero hardcoding.
- **Active Safety Assertions**: Daily ceiling overdose, single-dose limits, pediatric weight-based dosing (`mg/kg/prise` and `mg/kg/j`), and specific contraindications (Pregnancy > 24SA for NSAIDs, Aspirin in pediatric viral illness for Reye's syndrome, Tramadol + SSRI serotonin syndrome, Metformin DFG < 30, etc.).
- **Anti-Hallucination Forbidden Placeholders**: Rejects `lorem ipsum`, `à compléter`, `tbd`, etc.

---

## 🔬 PART 2 — THE 2-TIER PDF RAG ARCHITECTURE (V3 UPGRADE)

### 2.1 The Two Categories of PDFs in the 77-File Master Library

Our 77 PDFs in `data/pdf_masters/` fall into two radically different structural types:

```
┌─────────────────────────────────────────────────────────────────────────┐
│                           YOUR 77 PDF FILES                             │
└────────────────────────────────────┬────────────────────────────────────┘
                                     │
          ┌──────────────────────────┴──────────────────────────┐
          ▼                                                     ▼
  TIER 1: DEDICATED SHEETS                              TIER 2: BIG COMPILATIONS
  (1 to 8 pages, 100% focused)                          (50 to 160 pages, 50+ diseases)
  ────────────────────────────                          ────────────────────────────────
  • certificat accident travail.pdf (1 page)            • 150 Ordonnances types.pdf (160 pages)
  • Trt Anémie_.pdf (6 pages)                           • Urologie_.pdf (51 pages)
  • 1Anti-inflammatoires.pdf (3 pages)                  • Troubles ioniques.pdf (19 pages)
  • 1Médicaments en Pédiatrie.pdf (6 pages)             • Signes pathognomoniques.pdf (13 pages)
```

### 2.2 Tier 1: Direct File Match (Golden Reference Injection)
- **Mechanism**:
  1. When generating a CAT (e.g. *"CAT devant une Anémie"* or *"Certificat accident de travail"*), the engine checks PDF filenames and Page 1 titles.
  2. If a dedicated PDF file (length $\le 8$ pages) matches the topic:
  3. **No slicing, no token chopping.** The **entire clean document** is injected directly into the LLM context as a Primary Golden Algerian Reference.
- **Benefit**: 100% focused, pure local protocol with zero noise from unrelated diseases.

### 2.3 Tier 2: Multi-CAT Compilation RAG (Section-Aware Deep Extraction)
- **Problem with Current Substring Search**:
  - Searching for `gale` matches `é-gale-ment`, `lé-gale-ment`, `dé-légat-ion`.
  - Slicing 400 chars around the title keyword grabs the *Definition* at the top of the page, completely missing the *Treatment & Dosages* located 1,500 chars down.
- **V3 Solution**:
  1. **Strict Word-Boundary Regex (`\b`)**:
     - `\bgale\b` matches *"la gale"* or *"gale,"*, but **strictly ignores** *"également"* and *"légalement"*.
  2. **Clinical Section-Anchor Extraction**:
     - Scans the matched document for section headers: `Traitement`, `Thérapeutique`, `Prise en charge`, `Ordonnance`, `Posologie`, `Drapeaux rouges`.
     - Extracts the **entire treatment block** (1,200–2,000 chars) containing real molecules, dosages, and regimens.
  3. **Multi-Page Continuation**: If a CAT starts at the bottom of Page 4, automatically extracts Page 5 so the prescription is never cut off.

### 2.4 Dedicated `cat_pdf_index.json` Builder
- **Separation of Concerns**:
  - `pdf_index.json`: Stays raw and untouched for the general app's PDF Viewer and user search.
  - `cat_pdf_index.json`: Generated by `scripts/build_cat_pdf_index.js` specifically for AI generation:
    - Injects `{ pdf, quality, total_pages }` into every page object.
    - Classifies documents into `dedicated_sheet` vs `multi_compilation`.
    - Strips non-clinical noise pages (covers, table of contents, bibliography).

---

## 🌐 PART 3 — WEB RAG V3: REAL CLINICAL ARTICLE RETRIEVAL

### 3.1 The Current Limitation
- Currently, PubMed queries return only article metadata (title, authors, pub date) via `esummary` with **zero clinical text**.
- MSD and MedG queries return search result listing pages or RSS snippets rather than full clinical guides.

### 3.2 V3 Upgrades
1. **PubMed PMC `efetch` API**:
   - Query `https://eutils.ncbi.nlm.nih.gov/entrez/eutils/efetch.fcgi?db=pmc&id=${pmcId}&rettype=abstract&retmode=text` to extract the **real medical abstract**.
2. **MSD Direct Article URL Extraction**:
   - From the search results, parse the first clinical article link (`/fr/professional/.../article-title`), then fetch that specific article via Jina Reader.
3. **Web Cache 30-Day Staleness Check**:
   - `getCachedWebSources()` automatically ignores and re-fetches web caches older than 30 days.
4. **Dead Code Cleanup**:
   - Remove unused `fetchMSDManuals()` in `web-fetcher.js`.

---

## 🪟 PART 4 — DIAGNOSTIC & DEBUG PANEL (P1 PRIORITY)

### 4.1 Concept & Architecture
A live-streaming telemetry window embedded in `admin/cat_generator_lab.html` connected via Server-Sent Events (SSE).

```
CAT Generation Triggered
           │
           ▼
┌────────────────────────────────────────────────────────┐
│               debug-emitter.js (Singleton)             │
│   Listens to: llm-engine, web-fetcher, pdf-extractor   │
└──────────────────────────┬─────────────────────────────┘
                           │ SSE Stream
                           ▼
             GET /api/admin/cat-generator/debug-stream
                           │
                           ▼
┌────────────────────────────────────────────────────────┐
│            ADMIN LAB UI LIVE DEBUG PANEL               │
│  • Visual status of each RAG channel                   │
│  • Exact snippets & characters injected into prompt    │
│  • Raw LLM response & parser tier used                 │
│  • [📋 Copy Full JSON Logs] button for analysis        │
└────────────────────────────────────────────────────────┘
```

### 4.2 Streamed Events Catalog

| Event Name | Description |
|---|---|
| `web_fetch_start` | Keywords extracted and sources being queried |
| `web_fetch_result` | Source name, URL, content length, preview snippet |
| `pdf_tier1_hit` | Dedicated short PDF matched (Full-doc injection triggered) |
| `pdf_tier2_search` | Word-boundary tokens used, matching pages, section-anchor extracted |
| `active_learning` | Status of doctor-edited memory in `cats_db_v2_generated.json` |
| `llm_prompt_built` | Exact system & user prompt character count and estimated token load |
| `llm_model_try` | Dynamic model selected, attempt number, thinking budget applied |
| `llm_response_raw` | First 500 chars of raw LLM output text |
| `llm_parse_tier` | Which parser tier succeeded (Tier 1 native, Tier 2 clean, Tier 3 repair, Tier 4 regex) |
| `validation_result` | Medical validator outcome (valid/invalid, safety assertions triggered) |
| `generation_done` | Total execution latency, tokens consumed, final status |

---

## 📋 PART 5 — STEP-BY-STEP IMPLEMENTATION ROADMAP

| Phase | Task | Impact |
|---|---|---|
| **Phase 1 (P1)** | **Real-Time Debug Panel & SSE Telemetry**<br>• Create `cat_db_generator/lib/debug-emitter.js`<br>• Instrument `llm-engine.js`, `web-fetcher.js`, `pdf-extractor.js`<br>• Add SSE endpoint in `server/routes/cat-generator.js`<br>• Add collapsible UI panel + Copy Logs button in `admin/cat_generator_lab.html` | 🔴 CRITICAL: Complete visibility into live operations |
| **Phase 2 (P2)** | **2-Tier PDF Engine & Word-Boundary Matching**<br>• Implement `matchExactWord()` with `\b` regex in `pdf-extractor.js`<br>• Add Tier 1 Dedicated PDF direct file match detector<br>• Add Clinical Section-Anchor extraction (`Traitement:`, `Posologie:`)<br>• Create `scripts/build_cat_pdf_index.js` for dedicated `cat_pdf_index.json` | 🟠 HIGH: Eliminates PDF noise & extracts actual prescriptions |
| **Phase 3 (P3)** | **Web RAG Full Article Content**<br>• Switch PubMed to `efetch` (abstract text)<br>• Add MSD direct article link extractor<br>• Add 30-day cache staleness TTL check<br>• Delete dead `fetchMSDManuals()` code | 🟡 HIGH: Feeds genuine clinical text instead of search listings |
| **Phase 4 (P4)** | **RAG Faithfulness Test Suite & Verification**<br>• Benchmark test with injected controlled parameters<br>• Verify end-to-end V3 generation on sample CATs (#56 Gale, #57 Hémorragie digestive) | 🟢 VALIDATION: Guarantees True V3 quality standard |
