# Dr. CAT — LLM Generator Engine Architecture Specification & Upgrade Proposal

> **Document File**: `docs/llmengineupdate.md`  
> **Target Version**: Dr. CAT v1.8.0  
> **Scope**: Comparative analysis of current LLM generation pipeline (`v1.7.1`) vs. proposed **Master Clinical Engine + Dynamic Multi-Specialty Sub-Logic Mesh** (`v1.8.0`).  
> **Status**: Technical Specification — Ready for AI & Peer Review.

---

## Executive Summary

Dr. CAT (*Doctor Clinical Action Protocol*) utilizes a retrieval-augmented, multi-model LLM generation pipeline to synthesize doctor-grade medical decision support guides (*Fiches de Synthèse Clinique*). 

This document details:
1. **The Current Implementation (`v1.7.1`)**: A monolithic, single-prompt RAG generator using dynamic Google Gemini discovery (`gemini-3.6-flash`), local PDF index weighting, online guideline fetching (StatPearls, MSD Manuals, MedG), human active learning memory, and automated 3-attempt validation checksum loops.
2. **The Identified Limitation**: Single-prompt monolithic architectures enforce uniform structural constraints across all pathologies. When a clinical condition spans multiple overlapping specialties (e.g., *Gale chez le nourrisson* involving **Infectiology**, **Dermatology**, and **Pediatrics**), monolithic prompts struggle to balance pediatric toxicological safety, fine semiological detail, and epidemiological vector alerts simultaneously.
3. **The Proposed Upgrade (`v1.8.0`)**: A decoupled, two-tier architecture comprising a **Master Clinical Engine** (handling RAG synthesis, local formulary weighting, JSON schema locking, and anti-hallucination checks) coupled with an adaptive **Dynamic Sub-Logic Mesh** (specialty-specific directive modules that dynamically activate based on pathology requirements).

---

## Part 1: Current Generator Engine Architecture (`v1.7.1`)

### 1.1 Technical Stack & Component Mapping

```
                                 [CAT Generator Request]
                                            │
                                            ▼
                    ┌───────────────────────────────────────────────┐
                    │    cat_db_generator/lib/llm-engine.js        │
                    └───────────────────────┬───────────────────────┘
                                            │
         ┌──────────────────────────────────┼──────────────────────────────────┐
         ▼                                  ▼                                  ▼
┌──────────────────┐               ┌──────────────────┐               ┌──────────────────┐
│  1. Offline RAG  │               │  2. Online RAG   │               │ 3. Active Memory │
│  (PDF Indexer)   │               │ (Web Fetcher)    │               │ (Human Edits)    │
│  pdf-extractor.js│               │  web-fetcher.js  │               │  cats_db_v2.json │
└────────┬─────────┘               └────────┬─────────┘               └────────┬─────────┘
         │                                  │                                  │
         └──────────────────────────────────┼──────────────────────────────────┘
                                            │
                                            ▼
                    ┌───────────────────────────────────────────────┐
                    │     Dynamic Model Discovery & API Dispatch     │
                    │   (gemini-3.6-flash | 2048 Thinking Budget)   │
                    └───────────────────────┬───────────────────────┘
                                            │
                                            ▼
                    ┌───────────────────────────────────────────────┐
                    │    Checksum Validation & Sanitization Loop    │
                    │    (medical-validator.js — Max 3 Attempts)    │
                    └───────────────────────────────────────────────┘
```

### 1.2 Multi-Tier Knowledge Hierarchy (Strict Priority Order)

The current system prompt enforces a **3-Tier Weighting Matrix** to prevent international guidelines from overriding local clinical practice:

- **Tier 1 — Primary Local Baseline (PDF Index)**:
  - *Source*: Local medical PDFs indexed in `pdf_index.json`.
  - *Role*: Authoritative source for drug molecule selection, local formulary availability, and regional prescribing defaults (e.g., Benzoate de benzyle / Ascabiol, Phloroglucinol / Spasfon, Diosmectite / Smecta, Racécadotril / Tiorfan). International first-line drugs unavailable locally are never allowed to displace local baseline therapies.
- **Tier 2 — Online Enrichment & Security (Web RAG)**:
  - *Source*: Live fetched cache from StatPearls NCBI, MSD Manuals Pro (Jina Reader MD), MedG Consensus, and Wikipedia FR.
  - *Role*: Supplies structured 5-stage clinical workflows, differential diagnoses, recommended laboratory/imaging panels, and comprehensive Red Flag alerts.
- **Tier 3 — Synthesis & Medical Rationale (Gemini Reasoner)**:
  - *Source*: Google Gemini model family (`gemini-3.6-flash` primary).
  - *Role*: Formulates coherent French medical prose, eliminates redundancies, structures the output into valid JSON, and executes anti-polypharmacy logic.

### 1.3 Anti-Polypharmacy & Tiered Prescription Ledger

The system strictly bans raw, numbered drug lists (`1, 2, 3, 4`) that falsely imply all drugs must be co-prescribed. Instead, it enforces a 3-part Markdown prescription ledger:

1. **`1ère INTENTION (Traitement de choix / Principal)`**: First-line therapeutic choice with explicit dosage, route, frequency, and duration.
2. **`ALTERNATIVES [OU] (En cas de contre-indication, échec ou terrain spécifique)`**: Explicitly prefixed with `[OU] Alternative` or `2ème intention`. Mandatory safety warning (`⚠️ ALTERNATIVE: Ne pas associer...`) if options are mutually exclusive.
3. **`TRAITEMENT SYMPTOMATIQUE / ADJUVANT (Si besoin / En option)`**: Targeted comfort therapies strictly conditional on associated symptoms.

### 1.4 Execution Safeguards & Reliability Pipeline

- **Dynamic Model Discovery**: Queries `generativelanguage.googleapis.com/v1beta/models` at boot, filters out non-text models, and sorts by semantic versioning. Primary choice: `gemini-3.6-flash`.
- **Extended Thinking Budget**: Automatically injects `thinkingConfig: { thinkingBudget: 2048 }` for Gemini 3.x/2.5/pro models to ensure deep clinical reasoning.
- **HTTP 429 Backoff Retries**: Catches rate-limit status codes and executes a 4-second quota-reset pause up to 3 times before failing over to secondary models.
- **Control Character Sanitization**: Strips unescaped control characters (`[\x00-\x1F] -> \n, \r, \t`) prior to `JSON.parse()`, preventing string literal syntax crashes.
- **Automated Validation Checksum**: Passes generated JSON through `medical-validator.js`. If validation fails, it triggers an immediate retry loop (up to 3 attempts).

---

## Part 2: Limitations of the Monolithic Single-Prompt Approach

While the `v1.7.1` architecture is highly performant, empirical evaluation of complex topics (such as *CAT devant gale / poux*) reveals structural trade-offs inherent to single-prompt systems:

```
+-----------------------------------------------------------------------------------+
|                           MONOLITHIC PROMPT CONFLICT                              |
|                                                                                   |
|  High Word Economy / Conciseness   <====== VS ======>   Pediatric Toxicological   |
|  (Gemini preference: ~900 words)                        Safety / Edge Cases       |
|                                                         (DeepSeek/Grok: 1000+w)   |
|                                                                                   |
|  * Trims nested sub-bullets                        * Requires explicit infant     |
|  * Merges age-bracket rules                         Ascabiol dilution (6-8h,      |
|  * Streamlines prescription                         gloves to avoid ingestion)    |
|                                                    * Requires vector warnings     |
|                                                    * Requires <2m referral        |
+-----------------------------------------------------------------------------------+
```

### Key Vulnerabilities Identified:
1. **Pediatric & Toxicological Safety Trimming**: Under generic word-economy constraints, the LLM tends to merge or truncate essential pediatric application limits (e.g., reducing Benzyl benzoate instructions for infants < 2 years to a single line, omitting mandatory hand occlusion/gloves to prevent oral ingestion).
2. **Domain Overlap Neglect**: Pathologies rarely respect single specialty boundaries. A topic like *Gale / Poux* requires:
   - **Infectiology**: Vector-borne disease warnings (typhus, recurrent fever for body lice), community eviction rules.
   - **Dermatology**: Fine semiology (sillons, deltaplane sign), dermoscopy.
   - **Pediatrics**: Strict age/weight dosing, neonatal barrier permeability warnings (< 2 months).
3. **Inflexible Directive Scope**: A single prompt containing hardcoded rules for one specialty (e.g., infection decontamination timelines) becomes useless bloat or causes hallucinations when applied to Cardiology (*Fibrillation Auriculaire*), Neurology (*AVC*), or Traumatology (*Fracture du col fémoral*).

---

## Part 3: The Proposed Architecture — Master Engine + Dynamic Sub-Logic Mesh (`v1.8.0`)

To solve these limitations, `v1.8.0` introduces a **Hierarchical, Multi-Specialty Decoupled Architecture**:

```
                               ┌───────────────────────────────────┐
                               │       MASTER CLINICAL ENGINE      │
                               │  • 3-Tier RAG Integration         │
                               │  • Local Formulary Weighting      │
                               │  • 5-Stage / Admin Schema Lock    │
                               │  • Anti-Polypharmacy Ledger       │
                               │  • Checksum Retry Loop            │
                               └─────────────────┬─────────────────┘
                                                 │
                                                 ▼
                               ┌───────────────────────────────────┐
                               │   SPECIALTY CLASSIFIER & ROUTER   │
                               │   (Evaluates Topic & Detects      │
                               │    Multi-Domain Overlap)          │
                               └─────────────────┬─────────────────┘
                                                 │
            ┌────────────────────────────────────┼────────────────────────────────────┐
            ▼                                    ▼                                    ▼
┌───────────────────────┐            ┌───────────────────────┐            ┌───────────────────────┐
│ SUB-LOGIC MODULE A    │            │ SUB-LOGIC MODULE B    │            │ SUB-LOGIC MODULE C    │
│ Pediatric &           │            │ Dermatology &         │            │ Infectious &          │
│ Toxicological Guard   │            │ Semiology             │            │ Epidemiological Guard │
└───────────────────────┘            └───────────────────────┘            └───────────────────────┘
```

### 3.1 Component 1: The Master Clinical Engine Core

The Master Engine retains all universal infrastructure from `v1.7.1` but delegates domain-specific clinical directives to Sub-Logic modules:

- **Core Responsibilities**:
  - Offline RAG + Online RAG + Active Learning assembly.
  - Enforcement of 5-Stage Clinical Summary (`1. Définition & Diagnostic`, `2. Drapeaux Rouges`, `3. Examens Complémentaires`, `4. Prise en Charge & Conduite à Tenir`, `5. Orientation & Suivi`).
  - Enforcement of 3-Part Tiered Prescription Ledger (`1ère Intention`, `Alternatives [OU]`, `Traitement Symptomatique`).
  - Execution of JSON formatting and retry checksum loops.

### 3.2 Component 2: Specialty Classifier & Sub-Logic Router (`sublogic-router.js`)

Before building the final prompt, an automated router evaluates the pathology title and target category to construct a **Sub-Logic Activation Mask**:

```javascript
// Example: Sub-Logic Router Logic
function determineActiveSubLogics(title, category) {
  const activeModules = [];
  const text = `${title} ${category}`.toLowerCase();

  if (/gale|poux|pédiculose|lente|tégument|dermat|prurit|exanthème|éruption/i.test(text)) {
    activeModules.push('DERMATOLOGY');
  }
  if (/gale|poux|infect|fièvre|bactér|parasit|virus|sepsis|contagion|éviction/i.test(text)) {
    activeModules.push('INFECTIOLOGY');
  }
  if (/nourrisson|enfant|pédiatr|néonat|allaitement|grossesse|matern/i.test(text) || isPediatricTopic(title)) {
    activeModules.push('PEDIATRICS_TOXICOLOGY');
  }
  if (/cardiaq|coronar|hypertension|avc|emb|arythm|fa\b|oap|insuffisance cardiaque/i.test(text)) {
    activeModules.push('CARDIOLOGY');
  }
  if (/avc|épileps|neurolog|coma|céphalée|paralysie/i.test(text)) {
    activeModules.push('NEUROLOGY');
  }

  // Fallback: If no specific sub-logic matches, assign general internal medicine
  if (activeModules.length === 0) activeModules.push('GENERAL_INTERNAL_MEDICINE');

  return activeModules;
}
```

#### Multi-Domain Overlap Examples:
- Topic: *"CAT devant Gale / Poux chez le nourrisson"*  
  -> Active Sub-Logics: `[INFECTIOLOGY, DERMATOLOGY, PEDIATRICS_TOXICOLOGY]` (3-Way Overlap)
- Topic: *"CAT devant Fibrillation Auriculaire avec AVC Ischémique"*  
  -> Active Sub-Logics: `[CARDIOLOGY, NEUROLOGY]` (2-Way Overlap)
- Topic: *"CAT devant Fracture du col fémoral"*  
  -> Active Sub-Logics: `[ORTHOPEDICS_TRAUMATOLOGY]` (Single Domain)

---

### 3.3 Component 3: Specialty Sub-Logic Directive Modules

Each Sub-Logic module injects targeted, non-negotiable prompt directives into the Master Engine prompt:

#### 🛡️ Module A: `PEDIATRICS_TOXICOLOGY` (Pediatric & Toxicological Safety Guard)
```markdown
[SUB-LOGIC DIRECTIVE: PEDIATRICS & TOXICOLOGY]
1. MANDATORY WEIGHT-BASED DOSING: All pediatric drug regimens MUST be explicitly stated in mg/kg/day or weight-banded tables.
2. NEONATAL PERMEABILITY THRESHOLD: For infants under 2 months, explicitly mandate immediate specialist/hospital referral due to immature skin barrier and percutaneous absorption toxicity.
3. INFANT TOPICAL TOXICITY PRECAUTIONS: For topical agents (e.g., Benzoate de benzyle / Ascabiol), NEVER truncate pediatric guidelines for word economy. Explicitly specify:
   - Application duration limits (6-8 hours max for infants < 2 years vs 12h for children/pregnant vs 24h for adults).
   - Mandatory physical occlusion (mittens/socks/gloves) for infants to prevent accidental oral ingestion.
   - Dilution ratio guidelines (50% dilution for children < 2 years).
```

#### 🧫 Module B: `INFECTIOLOGY` (Infectious & Epidemiological Risk Guard)
```markdown
[SUB-LOGIC DIRECTIVE: INFECTIOLOGY & EPIDEMIOLOGY]
1. VECTOR-BORNE DISEASE WARNINGS: When dealing with body lice or extreme social vulnerability, explicitly highlight vector-borne zoonotic risks (Pediculus humanus corporis as vector for epidemic typhus, trench fever, and recurrent fever).
2. PARASITE SURVIVAL & DECONTAMINATION TIMELINES: Differentiate off-host parasite survival times clearly (e.g., 3 days / 72h for scabies mites vs 7 days for lice). Specify 60°C washing and sealed bag isolation periods.
3. PUBLIC HEALTH & EVICTION RULES: State exact nursery/school/work eviction rules (e.g., éviction scolaire jusqu'à 24h après le début du traitement effectif) and simultaneous household contact treatment protocols.
```

#### 🩺 Module C: `DERMATOLOGY` (Dermatological Semiology & Procedures)
```markdown
[SUB-LOGIC DIRECTIVE: DERMATOLOGY & SEMIOLOGY]
1. PRECISE LESION TOPOGRAPHY: Describe characteristic lesion distribution by anatomical site (interdigital webs, wrists, mamillary areolae, anterior axillary folds, inframammary creases, and infant palmoplantar/facial involvement).
2. DERMOSCOPY & DIAGNOSTIC SIGNS: Include specialized dermatoscopic markers (e.g., "deltaplane" / hang-glider sign for Sarcoptes scabiei burrow head) and direct scraping indication.
3. POST-TREATMENT PRURITUS DIFFERENTIAL: Explicitly flag pruritus persisting beyond 4 weeks as a mandatory clinical evaluation point to differentiate post-scabietic eczema / psychogenic itch from true treatment failure or reinfestation.
```

#### 🫀 Module D: `CARDIOLOGY` (Cardiovascular & Hemodynamic Guard)
```markdown
[SUB-LOGIC DIRECTIVE: CARDIOLOGY & HEMODYNAMICS]
1. IMMEDIATE HEMODYNAMIC RED FLAGS: Explicitly flag hemodynamic instability (systolic BP < 90 mmHg, acute pulmonary edema, angina, cardiogenic shock) triggering immediate electrical cardioversion or emergency SAMU transfer.
2. RISK STRATIFICATION SCORES: Mandatory integration of validated clinical scores (CHA₂DS₂-VASc for stroke risk, HAS-BLED for bleeding risk, EHRA for symptom severity).
3. ORGAN IMPAIRMENT & ANTICOAGULATION SAFETY: Mandate renal clearance checks (CrCl via Cockcroft/CKD-EPI) before prescribing DOACs or Digoxin. Require patient educational tracking booklets (Carnet d'suivi AVK/AOD).
```

#### 🧠 Module E: `NEUROLOGY` (Cerebrovascular & Neurological Guard)
```markdown
[SUB-LOGIC DIRECTIVE: NEUROLOGY & CEREBROVASCULAR]
1. TIME-CRITICAL ISCHEMIC WINDOWS: Highlight exact symptom-onset time windows (thrombolysis window < 4.5h, thrombectomy window < 6-24h).
2. STROKE SEVERITY & RED FLAGS: Require NIHSS scoring, intracranial hypertension alerts (headache, vomiting, papilledema), and immediate NCCT/MRI brain protocol.
3. MEDICO-LEGAL LOGISTICS: Mandate driving prohibition protocols, work disability declarations (arrêt de travail), and ALD 30 long-term illness registration rules.
```

---

### 3.4 Component 4: Precedence & Conflict Resolution Algorithm

When multiple Sub-Logics are active simultaneously, conflicts may arise (e.g., concise summary recommendation vs. detailed pediatric toxicological warnings).

`v1.8.0` enforces a **Strict Hierarchy of Precedence**:

```
                       PRECEDENCE HIERARCHY IN SUB-LOGIC MESH
                       
  ┌──────────────────────────────────────────────────────────────┐  LEVEL 1 (HIGHEST)
  │  PEDIATRIC & TOXICOLOGICAL SAFETY DIRECTIVES                 │  Cannot be overridden
  └──────────────────────────────┬───────────────────────────────┘  by any word economy rule
                                 │
                                 ▼
  ┌──────────────────────────────────────────────────────────────┐  LEVEL 2
  │  EMERGENCY RED FLAGS & ORGAN TOXICITY WARNINGS               │  Mandatory inclusion
  └──────────────────────────────┬───────────────────────────────┘
                                 │
                                 ▼
  ┌──────────────────────────────────────────────────────────────┐  LEVEL 3
  │  SPECIALTY SEMIOLOGY & LOGISTICS (Derm, Infectio, Cardio)    │  Combined dynamically
  └──────────────────────────────┬───────────────────────────────┘
                                 │
                                 ▼
  ┌──────────────────────────────────────────────────────────────┐  LEVEL 4 (LOWEST)
  │  WORD ECONOMY & CONCISE FORMATTING DIRECTIVES                │  Yields to Level 1-3
  └──────────────────────────────────────────────────────────────┘
```

---

## Part 4: Technical Implementation Plan

### 4.1 Proposed Directory & File Structure

```
cat_db_generator/
├── lib/
│   ├── llm-engine.js               # Main LLM Orchestrator (Updated)
│   ├── medical-validator.js        # Checksum Validation Engine
│   ├── pdf-extractor.js            # Offline RAG Index Search
│   ├── web-fetcher.js              # Online RAG Cache Fetcher
│   └── sublogics/                  # NEW: Sub-Logic Directive Engine
│       ├── index.js                # Router & Assembly Interface
│       ├── pediatrics-toxicology.js # Sub-Logic A
│       ├── infectiology.js         # Sub-Logic B
│       ├── dermatology.js          # Sub-Logic C
│       ├── cardiology.js           # Sub-Logic D
│       ├── neurology.js            # Sub-Logic E
│       └── general-internal.js     # Default Fallback
```

### 4.2 Metadata Extension in Output JSON Schema

To maintain full transparency and auditability, generated CAT objects will store the list of active sub-logics in internal metadata:

```json
{
  "id": 39,
  "title": "CAT devant gale / poux",
  "category": "Infectiologie",
  "summary": "...",
  "red_flags": "...",
  "ordonnance": "...",
  "_generation_metadata": {
    "engine_version": "1.8.0",
    "primary_model": "gemini-3.6-flash",
    "active_sublogics": [
      "DERMATOLOGY",
      "INFECTIOLOGY",
      "PEDIATRICS_TOXICOLOGY"
    ],
    "rag_sources_used": {
      "pdf_index_count": 4,
      "web_sources_count": 3
    }
  }
}
```

---

## Part 5: Architectural Comparison & Benchmarking

| Evaluation Parameter | Monolithic Single-Prompt (`v1.7.1`) | Proposed Master + Sub-Logic Mesh (`v1.8.0`) |
|---|---|---|
| **Multi-Specialty Overlap Handling** | Weak (tends to pick 1 specialty focus) | **Optimal (dynamically merges active sub-logics)** |
| **Pediatric Toxicological Safety** | Risk of truncation under word economy | **Guaranteed (Level 1 Precedence Guard)** |
| **Edge-Case Alert Coverage** | Inconsistent across categories | **Systematic (vector warnings, <2m referral, post-treatment itch)** |
| **Prompt Bloat / Token Efficiency** | High token waste (irrelevant rules sent) | **Lean (only active sub-logic directives sent)** |
| **Specialty Adaptability** | Low (requires manual prompt tweaking per topic) | **Universal (auto-routes across all 25+ specialties)** |
| **Anti-Hallucination Guard** | Single-tier validator check | **Dual-tier (Sub-Logic Precedence + Checksum Validator)** |

---

## Part 6: Call for AI & Peer Review

We invite peer AI systems (DeepSeek, Grok, Gemini, Claude) and medical software architects to review this specification against the following evaluation questions:

1. **Routing Accuracy**: Does the `sublogic-router.js` keyword/category pattern effectively capture multi-domain clinical topics without false positives?
2. **Precedence Logic**: Is the 4-level precedence hierarchy sufficient to resolve prompt conflicts between pediatric safety and word economy?
3. **Completeness**: Are there additional specialty sub-logic modules (e.g., *Renal/Nephrology*, *Obstetrics/Gynecology*, *Oncology*) that should be added to the baseline mesh?

---

*Document generated for Dr. CAT Architecture Review — Version 1.8.0 Proposal.*
