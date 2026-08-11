# 🩺 CAT Generator — True V3 Architectural Blueprint & Master Plan
> **Date**: 2026-08-11 | **Branch**: `beta-test-pr` | **Author**: Dr. Kibeche Ali Dia Eddine

---

## 🎯 EXECUTIVE SUMMARY & V3 OBJECTIVES

The goal of **CAT Generator True V3** is to transition the generator from a system that relies primarily on Gemini's general pretrained knowledge into a **precision-engineered Doctor-Grade Clinical Engine** driven by:
1. **Dynamic Cumulative Local Algerian PDF Data**: Combines dedicated short PDF guides AND multi-topic compilations (150 Ordonnances, specialty textbooks) simultaneously for *any* medical condition without artificial limits.
2. **Real Online Medical Guideline Articles**: Fetches actual PubMed medical abstracts (`efetch`) and MSD clinical articles via direct URL rather than superficial search listing pages.
3. **A Live Diagnostic Debug Panel (SSE)**: Enables the physician-admin to inspect every single token, retrieved PDF/Web snippet, parser tier, and LLM reasoning step in real time with 1-click JSON log export.

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

## 🔬 PART 2 — DYNAMIC CUMULATIVE PDF RAG ARCHITECTURE

### 2.1 The Cumulative Multi-Source Strategy (No Artificial Limits)

In clinical medicine, comprehensive knowledge is rarely found in a single document. For **any given pathology** (e.g. Asthme, Hémorragie digestive, Gale, Insuffisance cardiaque, Colique néphrétique):
- A **Dedicated Single PDF** provides specific local diagnostic nuances and drug choices.
- A **Specialty Chapter** (e.g. Urgences, Gastro, Pneumo, Infectio) provides acute stabilization, differential diagnosis, and hospital referral criteria.
- A **Prescription Compilation** (e.g. *150 Ordonnances types*) provides exact hospital prescription formulas, posologies, and durations.

**V3 Rule**: The engine **never restricts** itself to only one source. It queries **both dedicated files AND multi-topic compilations simultaneously**, merging all relevant findings into one rich RAG context.

```
                   ANY CAT TITLE (e.g. "Hémorragie digestive haute")
                                          │
                                          ▼
                   1. DYNAMIC TOKEN & SYNONYM EXPANSION
             ["hémorragie digestive", "méléna", "hématémèse", "fibroscopie", "IPP"]
                                          │
                                          ▼
                   2. PARALLEL DUAL-TIER CUMULATIVE SEARCH
         ┌────────────────────────────────┴────────────────────────────────┐
         ▼                                                                 ▼
   LAYER A: DEDICATED FILES                               LAYER B: MULTI-TOPIC COMPILATIONS
   (Matches in data/pdf_cache/ filenames/P1)              (Searches all 77 PDFs with \b regex)
   ─────────────────────────────────────────              ───────────────────────────────────
   • Extracts focused single-topic guide                  • Searches Urgences, Gastro, ECN,
   • Injects full protocol without chopping                 150 Ordonnances chapters
                                                          • Scans for Section Anchors:
                                                            "Traitement", "Posologie",
                                                            "Signes de gravité"
                                                          • Extracts 1,200–2,000 char blocks
         │                                                                 │
         └────────────────────────────────┬────────────────────────────────┘
                                          ▼
                   3. AGGREGATED UNIFIED LOCAL PDF PROMPT
         [📚 Dedicated Local Guide: ...] + [📚 Hospital Compilation: ...]
```

### 2.2 Strict French Word-Boundary Matching (`\b`)
- **Problem**: Substring searching `.includes("gale")` matches `é-gale-ment`, `lé-gale-ment`, `dé-légat-ion`. Searching `.includes("cat")` matches `certifi-cat`.
- **V3 Solution**: Strict regex matching with word boundaries:
  ```javascript
  const rx = new RegExp(`(?:^|[^a-z0-9à-ÿ])${escapedToken}(?:$|[^a-z0-9à-ÿ])`, 'i');
  ```
  Matches *"la gale"* or *"gale,"*, but **strictly ignores** *"également"* and *"légalement"*.

### 2.3 Clinical Section-Anchor Extraction
- **Problem**: Slicing 400 characters around the title keyword captures only the *Definition* at the top of the page, missing the *Treatment & Dosages* located 1,500 characters down.
- **V3 Solution**: 
  - Scans matched documents for clinical section headers: `Traitement`, `Thérapeutique`, `Prise en charge`, `Ordonnance`, `Posologie`, `Drapeaux rouges`.
  - Extracts the **entire treatment section block** (1,200–2,000 chars) containing real molecules, dosages, and regimens.
  - **Multi-Page Continuation**: Automatically extracts `page + 1` if a section continues across page boundaries.

### 2.4 Dedicated `cat_pdf_index.json` Builder
- `pdf_index.json` remains untouched for the general app's PDF Viewer and user search.
- `cat_pdf_index.json` is generated by `scripts/build_cat_pdf_index.js` specifically for AI generation:
  - Injects `{ pdf, quality, total_pages }` into every page object.
  - Classifies documents into `dedicated_sheet` vs `multi_compilation`.
  - Filters out non-clinical noise pages (covers, table of contents, bibliography).

---

## 🌐 PART 3 — WEB RAG V3: REAL CLINICAL ARTICLE RETRIEVAL

### 3.1 The Current Limitation
- Currently, PubMed queries return only article metadata (title, authors, pub date) via `esummary` with **zero clinical text**.
- MSD and MedG queries return search result listing pages or RSS snippets rather than full clinical guides.

### 3.2 V3 Upgrades
1. **PubMed PMC `efetch` API**:
   - Query `https://eutils.ncbi.nlm.nih.gov/entrez/eutils/efetch.fcgi?db=pmc&id=${pmcId}&rettype=abstract&retmode=text` to extract the **real medical abstract**.
2. **MSD Direct Article URL Extraction**:
   - From search results, parse the first clinical article link (`/fr/professional/.../article-title`), then fetch that specific article via Jina Reader.
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
| `pdf_dedicated_hit` | Dedicated short PDF matched (Full-doc injection triggered) |
| `pdf_compilation_search` | Word-boundary tokens used, matching pages, section-anchor extracted |
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
| **Phase 2 (P2)** | **Dynamic Cumulative PDF Engine & Word-Boundary Matching**<br>• Implement `matchExactWord()` with `\b` regex in `pdf-extractor.js`<br>• Add Dynamic Token/Synonym expansion<br>• Add Parallel Dedicated File Matcher + Multi-Topic Compilation Searcher<br>• Add Clinical Section-Anchor extraction (`Traitement:`, `Posologie:`)<br>• Create `scripts/build_cat_pdf_index.js` for dedicated `cat_pdf_index.json` | 🟠 HIGH: Eliminates PDF noise & extracts actual prescriptions across all sources |
| **Phase 3 (P3)** | **Web RAG Full Article Content**<br>• Switch PubMed to `efetch` (abstract text)<br>• Add MSD direct article link extractor<br>• Add 30-day cache staleness TTL check<br>• Delete dead `fetchMSDManuals()` code | 🟡 HIGH: Feeds genuine clinical text instead of search listings |
| **Phase 4 (P4)** | **RAG Faithfulness Test Suite & Verification**<br>• Benchmark test with injected controlled parameters<br>• Verify end-to-end V3 generation on sample CATs (#56 Gale, #57 Hémorragie digestive) | 🟢 VALIDATION: Guarantees True V3 quality standard |
