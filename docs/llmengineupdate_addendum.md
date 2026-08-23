# Addendum to `llmengineupdate.md`: Strategic Architectural Simplification (v1.8.0-Refined)

**Document File:** `docs/llmengineupdate_addendum.md`  
**Target Version:** Dr. CAT v1.8.0  
**Scope:** Architectural simplification of the LLM Generation Engine through database atomic decoupling and targeted single-pathology prompts.  
**Status:** Approved Technical Addendum  

---

## 1. Executive Summary & Rationale

The original `v1.8.0` specification (`llmengineupdate.md`) proposed a 2-tier architecture using dynamic regex routers (`sublogic-router.js`) to merge multiple specialty prompt directives at runtime.

Following clinical and architectural review, **that runtime prompt-merging approach is officially superseded by a simpler, zero-error strategy: Database Atomic Decoupling.**

### The Core Problem: Horizontal Breadth vs. Vertical Depth

Compound entries (e.g., combining *Gale* and *Poux* into a single CAT: `"CAT devant gale / poux"`) force the LLM into horizontal breadth—maintaining parallel, unrelated clinical threads within a single generation window. Under token economy constraints, the LLM inevitably trims critical pediatric, toxicological, or vector warnings.

In real-world clinical practice, a *Conduite À Tenir* (CAT) is a bedside action protocol. A clinician needs **vertical depth** for a specific condition (e.g., *HTA $\rightarrow$ Grade/Classification $\rightarrow$ Target Organ Damage $\rightarrow$ Tiered Monotherapy/Bitherapy*), not a comparative textbook chapter merging two distinct pathologies.

---

## 2. Key Architectural Decisions

```
                           OLD APPROACH (v1.7.1 / Early v1.8.0)
                  ┌──────────────────────────────────────────────┐
                  │      Compound Entry: "Gale / Poux"           │
                  └──────────────────────┬───────────────────────┘
                                         │
                         [Complex Regex Sub-Logic Router]
                         [Runtime Prompt-Merging Engine]
                                         │
                                         ▼
                     High Prompt Bloat & Risk of Omissions


───────────────────────────────────────────────────────────────────────────────────


                          NEW REFINED APPROACH (v1.8.0)
                  ┌──────────────────────────────────────────────┐
                  │   Database Atomic Decoupling (cats_db_v2)    │
                  └──────────────┬────────────────┬──────────────┘
                                 │                │
                                 ▼                ▼
                           CAT 1: "Gale"    CAT 2: "Poux"
                                 │                │
                                 └────────┬───────┘
                                          │
                        [Single Focused Master Engine]
                                          │
                                          ▼
                      Deep, Accurate, Single-Pathology CAT
```

### Decision 1: 1 CAT = 1 Clinical Condition (Atomic Standard)

- **Action:** All compound database entries in `cats_db_v2.json` will be split into individual, dedicated CAT files (e.g., `Gale (Scabiose)` and `Pédiculose (Poux)`).
- **Benefit:** Completely eliminates the need for dynamic regex routing scripts, runtime prompt-merging conflicts, and middle-prompt attention drift. Each CAT receives 100% of the token and reasoning budget for its specific clinical vertical.

### Decision 2: The LLM as a Structured Aggregator

- **Action:** Re-anchor the LLM’s role strictly as a **synthesis and formatting engine** for Tier-1 local PDF sources and Tier-2 live web searches.
- **Benefit:** Prevents the AI from acting as an unconstrained autonomous author. Truth remains strictly anchored in the indexed sources.

### Decision 3: Vertical Decision Trees

- **Action:** Prompts will instruct the LLM to structure sub-branches vertically for single pathologies (e.g., Severity Grade $\rightarrow$ Patient Profile $\rightarrow$ Action Protocol).

---

## 3. Simplified System Requirements for `cat_db_generator`

By decoupling the data layer, the technical implementation in `cat_db_generator/` is reduced to two streamlined steps:

### 1. Refactoring `cats_db_v2.json`

- Split all compound topics into standalone entries.
- Assign explicit age/specialty metadata tags directly in the database JSON structure rather than using runtime text parsing.

### 2. Streamlined Master Prompt (`llm-engine.js`)

Maintain a single, robust System Prompt focused on:

- **Strict Source Hierarchy:** Local PDF Index (Tier 1) > Web RAG (Tier 2) > Model Weights (Tier 3).
- **Tiered Prescription Ledger:**
  1. `1ère INTENTION (Traitement de choix)`
  2. `ALTERNATIVES [OU] (En cas de contre-indication / échec)`
  3. `TRAITEMENT SYMPTOMATIQUE / ADJUVANT`
- **Pediatric Safety Minimums:** Weight-based dosing (`mg/kg/j`), explicit application duration limits for topicals, and mandatory neonatal permeability warnings (< 2 months).

---

## 4. Verification & Validation Protocol

To guarantee zero clinical errors, `medical-validator.js` will enforce:

1. **JSON Schema Integrity:** Rejection of unescaped control characters or broken structures.
2. **Prescription Ledger Rules:** Verification that alternatives are explicitly marked with `[OU]` or `2ème intention` to prevent co-prescription hallucinations.
3. **Deterministic Dosing Ranges:** Range-checking critical pediatric molecules against hardcoded safety limits before committing the entry to the production database.
