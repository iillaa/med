# 🏛️ Architecture Documentation: CAT Database V3.5 Generator & PDF Lab 2.0 Suite

## 1. Executive Overview

The **CAT Database V3.5 Generator & PDF Lab 2.0 Suite** is an advanced AI-powered clinical protocol synthesis and document curation engine designed for **Dr. CAT**. It converts raw medical lessons and clinical topics into structured 5-step clinical protocols and 3-step administrative protocols.

The system combines:
1. **Gemini 3.7 / 3.6 Flash** primary reasoning engine.
2. **PDF Lab 2.0 Curation Workbench (`admin/pdf_lab.html`)**: Interactive visual slicer (+15px safety margins), Sommaire GPS page parser (+90 pts), Markdown and Text uploader, and staging draft sandbox (`data/pdf_staging_index.json`).
3. **Step 1 Live Web Research Fetcher (`web-fetcher.js`)**: Scrapes target medical guidelines from PubMed, MSD Manuals, MedG, and Vidal, with Doctor Custom URL override.
4. **Step 2 5-Field Precision RAG Engine (`pdf-extractor.js`)**: Multi-tiered RAG querying *Title, Specialty, Keywords, TOC GPS, and Page Content*, with **Pure Signal Isolation** (muting 500-page textbooks when a dedicated slice exists).
5. **8-Layer Deterministic Medical Validator (`medical-validator.js`)**: Ingests **15,857 French BDPM medicines** + **4,627 Algerian registered drugs**, enforcing GPIP pediatric weight bounds (`mg/kg/j`), CRAT teratogenic blacklists, and lethal unit typo interceptors (`500g` vs `500mg`).
6. **Human Active Learning Memory**: Stores manual doctor edits (`_human_edited: true`) and prioritizes doctor formulations in future AI synthesis prompts.
7. **Production Asset Sanitization Firewall (`build.js` & `cats.js`)**: Strips proprietary AI tokens, latency metrics, rollback history, and web query URLs from the mobile APK and client-facing API.

---

## 2. Component Diagram

```
+-----------------------------------------------------------------------------------+
|                        ADMIN LAB WORKBENCHES (WEB UI)                             |
|       [1. PDF Lab 2.0 (pdf_lab.html)]   |   [2. Generator Lab V3.5 (cat_lab.html)]|
+------------------------------------------+----------------------------------------+
                                           |
                                 REST HTTP / SSE Stream
                                           |
                                           v
+-----------------------------------------------------------------------------------+
|                           SERVER API ROUTES & GUARDS                              |
|                           (server/routes/cat-generator.js & pdfs.js)              |
+------------------------------------------+----------------------------------------+
                                           |
                    +----------------------+----------------------+
                    |                                             |
                    v                                             v
+--------------------------------------+       +------------------------------------+
|  STEP 1: LIVE WEB FETCHER            |       |  STEP 2: 5-FIELD DUAL RAG ENGINE   |
|  (cat_db_generator/lib/web-fetcher.js)|       |  (cat_db_generator/lib/llm-engine.js)|
+------------------+-------------------+       +-----------------+------------------+
                   |                                             |
                   v                                             v
       Disk Cache JSON Files                      - Gemini 3.6 / 3.7 Flash
       data/web_cache/<title>/                    - pdf_index.json & staging slices
                                                  - Clinical Guidelines Library (HAS/MedG)
                                                  - Big Data Pharmacopeias (BDPM & Algeria)
                                                  - Human Active Learning Memory
```

---

## 3. Data Flow & Lifecycles

1. **Document Ingestion & Slicing (PDF Lab 2.0)**:
   - Doctor uploads raw `.pdf`, `.md`, or `.txt` file, or crops a section using the visual slicer.
   - Slices are saved to `data/pdf_staging_index.json` with metadata (*Title, Specialty, Keywords, TOC*).
   - In-browser editor allows direct text modification and live RAG search simulation.
   - 1-click promotion moves validated drafts into `pdf_index.json`.

2. **Step 1 Web Fetching**:
   - Query build: `title + " site:" + domain`
   - Content fetch: HTTP GET with custom Medical User-Agent and 8s timeout.
   - Text cleaning: Strips HTML tags, navigation, scripts, styles.
   - Storage: Saved to `data/web_cache/<sanitized_title>/<source_id>_<timestamp>.json`.

3. **Step 2 5-Field Precision RAG Synthesis**:
   - Evaluates *Title, Specialty, Keywords, TOC GPS, and Page Content*.
   - If a dedicated slice exists, mutes noisy general textbooks to maximize prompt signal-to-noise ratio.
   - Combines Web Cache + Local Slices + Clinical Library + Active Learning Memory into Master System Prompt.
   - Calls Gemini with dynamic model discovery and response MIME type JSON.
   - Enforces 8-layer validation checks: if failed, feeds exact error into prompt for auto-correction (up to 3 attempts).
   - Persistence: Writes output to `cat_db_generator/cats_db_v3_generated.json`.

4. **Human Active Learning Loop**:
   - User opens Lab UI -> Clicks `[ ✏️ Éditer ]` on a CAT row -> Modifies clinical text -> Clicks `[ 💾 Enregistrer ]`.
   - Backend endpoint `POST /api/admin/cat-generator/update` stamps `_human_edited: true` and `_last_edited_at`.
   - On future regenerations of this CAT, `llm-engine.js` loads the user's manual edits and instructs Gemini to preserve all user corrections.

5. **Production Database Promotion & Sanitization**:
   - User clicks `[ 💾 Promote V3.5 to Production ]` or `[ 💾 Promouvoir (1) ]`.
   - Backend creates `cats_db.json.bak` backup and atomically updates `cats_db.json`.
   - Sanitizer immediately strips AI execution metrics, rollback logs, and search queries before saving `public/data/cats_db.json` for offline PWA and Android APK packaging.
