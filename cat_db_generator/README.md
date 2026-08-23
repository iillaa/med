# 🩺 Dr. CAT — Database V3.5 Generator Engine & Clinical Knowledge Lab

Welcome to the **Database V3.5 Generator Engine** for **Dr. CAT (Doctor Clinical Action Protocol)**.

This engine converts raw clinical definitions into rich, production-grade 5-step clinical protocols using **Gemini 3.7 / 3.6 Flash**, **Dual-Tier Offline Clinical Knowledge Libraries**, **5-Field Metadata Precision RAG**, **Pure Signal Slicing Isolation**, **Official French & Algerian Big Data Pharmacopeias**, and **Human Active Learning Memory**.

---

## 🌟 Architecture & 5 Knowledge Streams

```mermaid
graph TD
    A["Stream 1: Doctor Custom Links<br/>(Pasted URLs via Jina Reader)"] --> E["Gemini Flash<br/>Synthesis Engine"]
    B["Stream 2: Automated Web Fetch<br/>(PubMed, MSD Manuals, Vidal, HAS)"] --> E
    C["Stream 3a: Tier 1 Core Corpus (PDF Index + Slices)<br/>Stream 3b: Tier 2 Clinical Decision Library<br/>(MedG, Antibioclic, SFMU, Pédiadol, MSF, CRAT)"] --> E
    D["Stream 4: Active Learning Memory<br/>(Doctor's Previous Manual Edits)"] --> E
    H["Stream 5: Big Data Pharmacopeias<br/>(French BDPM 15.8k + Algerian Nomenclature 4.6k)"] --> F
    
    E --> F["Deterministic 8-Layer Medical Validator<br/>(Drug Safety Rules, Dosage Ceilings, Anti-Hallucination, Unit Typos)"]
    F -->|Pass| G["✨ Validated CAT Database (Sanitized for APK)"]
    F -->|Fail (Self-Correction)| E
```

---

## 🚀 Key Modules & Capabilities

### 1. 🏛️ Dual-Tier Offline Clinical Knowledge Architecture (`lib/knowledge-library.js`)
- **Tier 1: Core Reference Corpus (`pdf_index.json` & `data/pdf_staging_index.json`)**:
  - Full-text page indexing across medical textbooks, university course manuals, and dedicated PDF Lab 2.0 slices.
  - **5-Field Metadata Scoring**: Evaluates *Title, Specialty, Keywords, TOC GPS Page Pointers, and Page Content*.
  - **Pure Signal Isolation**: Mutes general 500-page textbooks when a high-confidence dedicated slice exists.
- **Tier 2: Standard Clinical Decision Library (`clinical_library/`)**:
  - 📑 **`medg_fiches_cat/`**: MedG.fr Diagnostic & Therapeutic CAT Decision Trees.
  - 💊 **`antibioclic_decision_trees/`**: Antibioclic / SPILF 1st/2nd-line antibiotic regimens.
  - 🚨 **`sfmu_emergency_reflex/`**: SFMU Emergency & Resuscitation Reflex Cards.
  - 👶 **`pediadol_pediatric_protocols/`**: Pédiadol Weight-Based Pediatric Emergency Memos.
  - 🏥 **`msf_pocket_clinical_guides/`**: MSF Dispensary & Primary Care Action Protocols.
  - 🧬 **`orphanet_urgences_reflex/`**: Orphanet On-Call Complex & Genetic Reflex Cards.
  - 🤰 **`crat_pregnancy_lactation/`**: CRAT Pregnancy & Breastfeeding Safety Rules.

### 2. 🇩🇿 Official Algerian Drug Nomenclature (`data/algerian_nomenclature.json`)
- Ingested from the Ministère de la Santé / Chifa database: **4,627 registered pharmaceutical products** and **1,358 DCIs** with commercial brand names (*Saidal, El Kendi, Biogalenic, HUP...*), dosages, galenic forms, and CNAS reimbursement status.

### 3. 🇫🇷 Official French Pharmacopeia (`data/bdpm_pharmacology.json`)
- Ingested from the Base de Données Publique des Médicaments (ANSM): **15,857 authorized medications**, **4,474 DCIs**, and **8,206 generic group mappings**.

### 4. 🛡️ Clinical Drug Posology & Toxic Ceilings Database (`lib/clinical_drug_ceilings.json`)
- Offline pharmacological ceiling matrix compiled from authoritative clinical databases:
  - **`FDAMDD` (EPA / PubChem MRDD)**: Maximum Recommended Daily Dose thresholds for active pharmaceutical ingredients.
  - **`ANSM RCP`**: Official maximum posologies, contraindications, and organ clearance warnings.
  - **`CRAT`**: Absolute teratogenic blacklists (Valproate, Méthotrexate, Isotrétinoïne, NSAIDs at T2/T3, ACEi/ARBs).
  - **`GPIP / Antibioclic`**: Pediatric weight-based safety bounds (`mg/kg/jour` and single-dose limits).

### 5. 🌐 Web Research & Doctor Link Injector (`lib/web-fetcher.js`)
- **Exact Full-Phrase Matching**: Searches for complete clinical entities (e.g. `"colique hépatique"`) rather than fragmented keywords.
- **SERP Listing Shell Rejection**: Automatically discards empty search engine listing pages (`SearchResults?`, `search?q=`).
- **Doctor Link Input**: Custom URL input field in Admin Lab (`#single-custom-urls`) that processes pasted links via **Jina Reader** (`r.jina.ai`) into clean markdown.

### 6. 🔁 Self-Correcting 8-Layer Medical Validator (`lib/medical-validator.js`)
- **Deterministic JavaScript & JSON Rules**: The AI never grades its own work. Codebase rules evaluate dosage limits, contraindications, and schema.
- **Unit Typo Interceptor**: Detects lethal typing errors (e.g. `500g` or `1000g` of oral medications).
- **Automated Feedback Loop**: If validation fails (e.g. Paracetamol > 4g/day or Aspirin in pediatric varicella), the exact rule error is injected into the next prompt for automatic self-correction (up to 3 attempts).

---

## 🚀 CLI Usage Commands

Run commands from the project root directory:

```bash
# 1. Generate or update a single CAT
node cat_db_generator/generate_cat_db_v2.js --title "CAT devant insolation" --category "Urgences"

# 2. Force re-fetch Step 1 Web Data before AI synthesis
node cat_db_generator/generate_cat_db_v2.js --title "CAT devant insolation" --fetch-web

# 3. Batch generate all CATs
node cat_db_generator/generate_cat_db_v2.js --batch

# 4. Discover unindexed PDF topics and propose new CAT candidates
node cat_db_generator/generate_cat_db_v2.js --discover
```

---

## 📁 File Structure Overview

```text
cat_db_generator/
├── clinical_library/          # Tier 2 Action-Oriented Decision Libraries
│   ├── medg_fiches_cat/       # MedG.fr CAT Trees
│   ├── antibioclic_decision_trees/ # Antibioclic SPILF Regimens
│   ├── sfmu_emergency_reflex/ # SFMU Emergency Reflex Cards
│   ├── pediadol_pediatric_protocols/ # Pédiadol Pediatric Memos
│   ├── msf_pocket_clinical_guides/   # MSF Primary Care Guides
│   ├── orphanet_urgences_reflex/     # Orphanet On-Call Complex Reflex Cards
│   └── crat_pregnancy_lactation/     # CRAT Pregnancy & Lactation Pharmacology
├── lib/
│   ├── knowledge-library.js   # Fast sub-millisecond local clinical library reader
│   ├── algerian_drug_matrix.json # Algerian trade names & posology matrix
│   ├── drug-safety-rules.json # Dynamic drug toxicity ceilings & contraindication rules
│   ├── web-fetcher.js         # Anti-SERP web scraper & Jina Reader link processor
│   ├── llm-engine.js          # Gemini Flash Dual-RAG & Self-Correcting Prompt Engine
│   ├── medical-validator.js   # Deterministic safety checksum & dosage validator
│   ├── pdf-extractor.js       # Fast in-memory pdf_index.json RAG search
│   └── medical-sources.js     # Target medical domains & online query builders
├── web_cache/                 # Local disk cache for scraped web guidelines
├── cats_db_v3_generated.json  # Complete V3 database output
├── generate_cat_db_v2.js      # Main CLI tool
└── generate_all_55_v2.js      # Real batch wrapper
```

---

## 🛡️ Security & Access Control

The Generator Lab UI and API routes are strictly protected by localhost connection guards (`isLocalhostConnection`) and admin authentication middleware in `server/routes/cat-generator.js`.
