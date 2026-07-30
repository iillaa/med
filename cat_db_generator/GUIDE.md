# 🩺 Dr. CAT — Database Generator v2 (Medical Engine Guide)

Welcome to the **CAT Database Generator v2** (`cat_db_generator/`). This module is a state-of-the-art, anti-hallucination medical content generator designed to compile, validate, and manage clinical *Conduites à Tenir* (CATs) tailored for an **Algerian & French medical practice context**.

---

## 🏛️ Architecture Overview

The v2 generator combines **local deep PDF extraction** (76 local textbooks), **official Algerian & French medical authority verification**, and **strict automated medical schema validation**:

```
cat_db_generator/
├── generate_cat_db_v2.js       # Main CLI & Generator Executable Engine
├── GUIDE.md                    # Detailed User & Developer Guide
└── lib/
    ├── medical-sources.js      # Registry of reputable medical authorities (Algerian, French, International)
    ├── pdf-extractor.js        # High-performance local PDF deep content scanner
    └── medical-validator.js    # Strict Anti-Hallucination & 5-step schema validator
```

---

## 🛡️ Anti-Hallucination & Medical Safety System

Because Dr. CAT contains clinical information used at the bedside, **data integrity is critical**. Generator v2 enforces strict safety rules:

1. **Mandatory 5-Step Clinical Structure**:
   - `1. Évaluation initiale & Diagnostic`
   - `2. Conduite à tenir`
   - `3. Traitement`
   - `4. Examens complémentaires`
   - `5. Orientation / Avis Spécialisé`
2. **Mandatory Red Flags (`red_flags`)**:
   - Every CAT must explicitly list emergency danger signs (e.g., high fever, severe dyspnea, anaphylactic shock, neurological deficits, severe bleeding).
3. **Valid Prescription Models (`ordonnance`)**:
   - Every prescription model must contain explicit drug names, exact dosages, and unit measurements (`mg`, `gélule`, `sachet`, `comprimé`, `flacon`, `UI`, `gouttes`).
4. **Placeholder Rejection**:
   - Automatically rejects dummy text ("Lorem ipsum", "TODO", "à compléter", "non disponible").

---

## 🌐 Integrated Reputable Medical Sources

Generator v2 references and scores sources across 3 geographic tiers:

### 🇩🇿 1. Algerian National Resources (Legal & Local Context)
- **Ministère de la Santé (Algérie)** (`sante.gov.dz`): Official Algerian legal guidelines, AMM drug approvals, maternal/neonatal protocols, and oncology guides.
- **Centre National de Pharmacovigilance (CNPM)** (`cnpm.org.dz`): Algerian drug safety monitoring & national immunization schedules.
- **Société Algérienne de Médecine Interne (SAMI)** (`samidz.com`): Local consensus for cardiovascular risk & metabolic syndromes in Algeria.

### 🇫🇷 2. French Clinical Resources (Direct Bedside Practice)
- **Manuel MSD** (`msdmanuals.com`): Comprehensive global clinical decision manual in French.
- **Guideline.care** (`guideline.care`): Streamlined clinical decision algorithms for 400+ emergency & outpatient care issues.
- **MedG** (`medg.fr`): Collaborative medical encyclopedia for diagnostic steps.
- **Vidal France** (`vidal.fr`): Official pharmaceutical database for drug dosages and contraindications.
- **HAS (Haute Autorité de Santé)** (`has-sante.fr`): Official French clinical practice guidelines.
- **SFMU (Société Française de Médecine d'Urgence)** (`sfmu.org`): Emergency care protocols.
- **ANSM** (`ansm.sante.fr`): Drug safety alerts.
- **MSF Medical Guides** (`medicalguidelines.msf.org`): Outpatient primary care.

### 🇬🇧 3. English & International Resources
- **UpToDate** (`uptodate.com`): Gold-standard peer-reviewed clinical support.
- **BMJ Best Practice** (`bestpractice.bmj.com`): Step-by-step presentation & differential diagnosis algorithms.
- **Medscape Reference** (`reference.medscape.com`): Clinical calculators & drug interaction checkers.
- **WHO / OMS** (`who.int`): Global disease management protocols.

---

## 🚀 Usage Commands & Workflows

### 1. Single CAT Generation / Prompting
Generate or update a specific CAT topic:
```bash
node cat_db_generator/generate_cat_db_v2.js --title "CAT devant insolation" --category "Urgences"
```
Or run in **Dry Run mode**:
```bash
node cat_db_generator/generate_cat_db_v2.js --title "CAT devant crise d'angoisse" --category "Neurologie / Psychiatrie" --dry-run
```

### 2. Topic Discovery Mode
Scan your local PDF textbook collection (`.cat-med/reference-pdfs/` and `public/pdfs/`) to discover unmapped clinical topics:
```bash
node cat_db_generator/generate_cat_db_v2.js --discover
```

### 3. Full Database Validation & Rebuild
Validate all 55 CATs in your active `cats_db.json` database against the strict medical schema:
```bash
node cat_db_generator/generate_cat_db_v2.js --rebuild-all
```
