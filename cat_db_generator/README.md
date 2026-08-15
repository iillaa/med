# 🩺 Dr. CAT — Database V3 Generator Engine & Lab UI

Welcome to the **Database V3 Generator Engine** for **Dr. CAT (Doctor Clinical Action Protocol)**.

This engine converts raw clinical definitions into rich, production-grade 5-step clinical protocols using **Gemini 3.7 / 3.6 Flash**, **Live Web Research RAG**, **Offline PDF RAG (`pdf_index.json`)**, and **Human Active Learning Memory**.

---

## 🌟 Key Features

1. **2-Step Live Web Research & Caching (`lib/web-fetcher.js`)**:
   - **Step 1**: Scrapes live clinical guidelines from target authorities:
     - 🇩🇿 **Algeria**: `sante.gov.dz`, `cnpm.org.dz`, `samidz.com`
     - 🇫🇷 **France**: `vidal.fr`, `has-sante.fr`, `sfmu.org`, `ansm.sante.fr`, `medicalguidelines.msf.org`
     - 🇬🇧 **International**: `who.int`, `msdmanuals.com`, `guideline.care`
   - Cleans HTML text and saves structured JSON files locally under `cat_db_generator/web_cache/<sanitized_title>/`.
   - Supports 1-click **"Force Re-fetch Web Data"**.

2. **Dual RAG Synthesis Engine (`lib/llm-engine.js`)**:
   - Powered by **`Gemini 3.7 / 3.6 Flash`** with dynamic model discovery and automatic failover.
   - Assembles 3 knowledge channels into every prompt payload:
     - **Offline PDF RAG**: Matches pages from 77 indexed local medical reference books in `pdf_index.json`.
     - **Online Web Cache RAG**: Freshly scraped guidelines from Step 1 (`web_cache/`).
     - **Human Edit Memory**: Loads your previous manual edits (`_human_edited: true`) as high-priority instructions so Gemini 3.6 Flash **learns from human corrections over time**.

3. **Strict Medical & Administrative Schema Locks (`lib/medical-validator.js`)**:
   - **5-Step Clinical Lock**:
     1. `1. Évaluation initiale & Diagnostic`
     2. `2. Conduite à tenir`
     3. `3. Traitement`
     4. `4. Examens complémentaires`
     5. `5. Orientation / Avis Spécialisé`
   - **3-Step Administrative Lock** (for certificates, attestations, liaison letters):
     1. `1. Principes de rédaction`
     2. `2. Structure type`
     3. `3. Cadre réglementaire`
   - **Automated Anti-Hallucination Checksum**: Rejects placeholder text (`lorem ipsum`, `todo`, `à compléter`, `sample text`), verifies pediatric dosage compliance (`mg/kg/j` or `dose-poids`), and logs token metrics.

4. **Standalone Admin Generator Lab UI (`/cat_generator_lab.html`)**:
   - Accessible via local admin dashboard link at `http://localhost:3000/cat_generator_lab.html`.
   - Side-by-side V1 vs V3 inspector modal.
   - **Human-in-the-Loop Editor Modal (`#edit-modal`)**: Manually edit and polish generated CATs with 1-click update API.
   - **1-Click Production Promoter**: Promotes `cats_db_v3_generated.json` into `cats_db.json` with automated backup (`cats_db.json.bak`).

---

## 🚀 CLI Usage Commands

Run commands from the project root directory:

```bash
# 1. Generate or update a single CAT
node cat_db_generator/generate_cat_db_v2.js --title "CAT devant insolation" --category "Urgences"

# 2. Force re-fetch Step 1 Web Data before AI synthesis
node cat_db_generator/generate_cat_db_v2.js --title "CAT devant insolation" --fetch-web

# 3. Batch generate all 55 CATs
node cat_db_generator/generate_cat_db_v2.js --batch

# 4. Discover unindexed PDF topics and propose new CAT candidates
node cat_db_generator/generate_cat_db_v2.js --discover
```

---

## 📁 File Structure Overview

```text
cat_db_generator/
├── lib/
│   ├── web-fetcher.js         # Step 1 Live Web Research & Disk Cacher
│   ├── llm-engine.js          # Gemini Dual RAG & Active Learning Engine
│   ├── medical-validator.js   # 5-step clinical lock, admin lock & checksum validator
│   ├── pdf-extractor.js       # Fast in-memory pdf_index.json RAG search
│   └── medical-sources.js     # Target medical domains & online query builders
├── web_cache/                 # Local disk cache for scraped web guidelines
├── cats_db_v3_generated.json  # Complete 55 CAT V3 database output
├── generate_cat_db_v2.js      # Main CLI tool
└── generate_all_55_v2.js      # Real batch wrapper
```

---

## 🛡️ Security & Access Control

The Generator Lab UI and API routes are strictly protected by localhost connection guards (`isLocalhostConnection`) and admin authentication middleware in `server/routes/cat-generator.js`.
