# 🩺 Dr. CAT — Database Generator v3.5 (Medical Engine Guide)

Welcome to the **CAT Database Generator v3.5** (`cat_db_generator/`). This module is a state-of-the-art, anti-hallucination medical content generator designed to compile, validate, and manage clinical *Conduites à Tenir* (CATs) tailored for an **Algerian & French medical practice context**.

---

## 🏛️ Architecture Overview

The v3.5 generator combines **5-field metadata precision RAG** (PDF Index, dedicated PDF Lab 2.0 slices, and staging drafts), **official French BDPM (15.8k medicines) and Algerian Nomenclature (4.6k medicines)**, **live web guidelines**, and **strict 8-layer deterministic medical schema validation**:

```
cat_db_generator/
├── generate_cat_db_v2.js       # Main CLI & Generator Executable Engine
├── GUIDE.md                    # Detailed User & Developer Guide
├── clinical_library/           # Tier 2 Action-Oriented Decision Libraries (HAS, SFMU, Pédiadol, MedG)
└── lib/
    ├── medical-sources.js      # Registry of reputable medical authorities (Algerian, French, International)
    ├── pdf-extractor.js        # 5-field metadata precision scanner with Pure Signal isolation
    ├── web-fetcher.js          # Web RAG scraper with Doctor Custom URL injector
    ├── llm-engine.js           # Gemini Flash reasoning engine with self-correcting feedback loops
    └── medical-validator.js    # 8-Layer deterministic validator with BDPM & Algerian Big Data
```

---

## 🛡️ Anti-Hallucination & Medical Safety System (8 Layers)

Because Dr. CAT contains clinical information used at the bedside, **data integrity is critical**. Generator v3.5 enforces strict safety rules:

1. **Modular 5-Step Clinical Structure (Zero Filler)**:
   - `0. Stabilisation Immédiate & ABCDE` *(Omettre si non-urgent)*
   - `1. Évaluation initiale & Diagnostic`
   - `2. Conduite immédiate si drapeau rouge` *(Mesures urgentes, pas de redondance avec le champ red_flags)*
   - `3. Examens complémentaires`
   - `3bis. Terrain, Comorbidités & Contrôle Iatrogène` *(Omettre si sans objet)*
   - `4. Prise en charge & Stratégie Thérapeutique` *(DCI cibles académiques)*
   - `5. Orientation, Suivi & Volet Médico-Légal`
2. **Mandatory Danger Signs (`red_flags`)**:
   - Every CAT must explicitly list emergency signs requiring urgent specialized intervention.
3. **Structured 4-Section Prescription Pad (`ordonnance`)**:
   - `TRAITEMENT NON MÉDICAMENTEUX & RHD`
   - `1ère INTENTION` (DCI, posologie journalière concrète)
   - `ALTERNATIVES [OU]` (Motifs d'allergie ou intolérance)
   - `TRAITEMENT SYMPTOMATIQUE / ADJUVANT`
4. **Pharmacological Ceilings & Big Data Cross-Check**:
   - Evaluated in < 0.1ms against **15,857 French medicines (BDPM)** + **4,627 Algerian medicines (Chifa)**.
5. **GPIP Pediatric Weight Dose Ceilings**:
   - Enforces `mg/kg/j` targets and age contraindications (*Cyclines < 8 ans, Céfixime < 6 mois*).
6. **CRAT Teratogenic Firewall**:
   - Blocks high-risk molecules (*Valproate, Méthotrexate, Isotrétinoïne, NSAIDs at 24 SA, ACEi/ARBs*).
7. **Lethal Unit Typo Interceptor**:
   - Intercepts accidental keyboard typos (*500g* instead of *500mg*).
8. **Automated 3-Attempt Retry Feedback Loop**:
   - Injects pointed validator feedback into Gemini for automated self-correction.

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
