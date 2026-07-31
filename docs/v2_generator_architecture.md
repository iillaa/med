# 🏛️ Architecture Documentation: CAT Database V2 Generator & Active Learning System

## 1. Executive Overview

The **CAT Database V2 Generator System** is an AI-powered clinical protocol synthesis engine designed for **Dr. CAT**. It converts clinical titles into structured 5-step clinical protocols and 3-step administrative protocols.

The system combines:
1. **Gemini 3.6 Flash** primary reasoning engine.
2. **Step 1 Live Web Research Fetcher (`web-fetcher.js`)**: Scrapes target medical guidelines from Algerian (`sante.gov.dz`, `cnpm.org.dz`, `samidz.com`), French (`vidal.fr`, `has-sante.fr`, `sfmu.org`), and International domains (`who.int`, `msdmanuals.com`).
3. **Step 2 Offline RAG (`pdf-extractor.js`)**: Queries in-memory `pdf_index.json` containing 77 local medical reference books.
4. **Human Active Learning Loop**: Stores manual user edits (`_human_edited: true`) and feeds human corrections into future AI synthesis prompts.
5. **Standalone Admin Lab UI (`/cat_generator_lab.html`)**: Allows side-by-side V1 vs V2 inspection, manual human editing, single & batch generation, and 1-click database promotion.

---

## 2. Component Diagram

```
+-----------------------------------------------------------------------------------+
|                                 ADMIN LAB UI                                      |
|                          (cat_generator_lab.html)                                 |
+------------------------------------------+----------------------------------------+
                                           |
                                 REST HTTP API
                                           |
                                           v
+-----------------------------------------------------------------------------------+
|                           SERVER API ROUTES & GUARDS                              |
|                           (server/routes/cat-generator.js)                        |
+------------------------------------------+----------------------------------------+
                                           |
                   +-----------------------+-----------------------+
                   |                                               |
                   v                                               v
+--------------------------------------+       +------------------------------------+
|  STEP 1: LIVE WEB FETCHER            |       |  STEP 2: DUAL RAG LLM ENGINE       |
|  (cat_db_generator/lib/web-fetcher.js)|       |  (cat_db_generator/lib/llm-engine.js)|
+------------------+-------------------+       +-----------------+------------------+
                   |                                             |
                   v                                             v
       Disk Cache JSON Files                      - Gemini 3.6 Flash
       web_cache/<title>/                         - pdf_index.json (77 PDFs)
                                                  - Human Edit Memory
```

---

## 3. Data Flow & Lifecycles

1. **Step 1 Web Fetching**:
   - Query build: `title + " site:" + domain`
   - Content fetch: HTTP GET with custom Medical User-Agent and 8s timeout.
   - Text cleaning: Strips HTML tags, navigation, scripts, styles.
   - Storage: Saved to `cat_db_generator/web_cache/<sanitized_title>/<source_id>_<timestamp>.json`.

2. **Step 2 Dual RAG Synthesis**:
   - Prompt assembly: Combines Web Cache RAG + PDF Index RAG + Human Edit Memory.
   - LLM Call: REST POST to `generativelanguage.googleapis.com/v1beta/models/gemini-3.6-flash:generateContent`.
   - Checksum Validation: Evaluates schema locks, placeholder checks, pediatric dosage rules.
   - Persistence: Writes output to `cat_db_generator/cats_db_v2_generated.json`.

3. **Human Active Learning Loop**:
   - User opens Lab UI -> Clicks `[ ✏️ Éditer ]` on a CAT row -> Modifies clinical text -> Clicks `[ 💾 Enregistrer ]`.
   - Backend endpoint `POST /api/admin/cat-generator/update` stamps `_human_edited: true` and `_last_edited_at`.
   - On future regenerations of this CAT, `llm-engine.js` loads the user's manual edits and instructs Gemini 3.6 Flash to preserve all user corrections.

4. **Production Database Promotion**:
   - User clicks `[ 💾 Promote V2 to Production ]`.
   - Endpoint `POST /api/admin/cat-generator/promote` creates `cats_db.json.bak` and atomic-writes `cats_db_v2_generated.json` to `cats_db.json`.
