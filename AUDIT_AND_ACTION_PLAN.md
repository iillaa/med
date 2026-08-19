# 🛠️ Dr. CAT — Master Audit & Architectural Action Plan
> **Author**: Dr. Kibeche Ali Dia Eddine  
> **Environment**: Android / Termux Local Environment (APK compilation via GitHub Actions)  
> **Status**: Active Execution  

---

## 🎯 Executive Summary
This document synthesizes findings from `todo4catgenerator.md`, the AI architecture audit, and local codebase analysis into a structured execution roadmap for **Dr. CAT** and **Generator V3**.

---

## 🗺️ Master Implementation Tracks

### 📱 Track 1: Client Runtime, Storage & Memory Hardening (Frontend)
- [ ] **1.1 Quiz & Asynchronous Timer Lifecycle**:
  - Expose `cleanupQuizTimers()` in `public/js/components/quiz/ui.js`.
  - Clean up active timers/intervals when navigating away from the Quiz or Debug Console.
- [ ] **1.2 LRU Storage Protection (`public/js/lib/safeStorage.js`)**:
  - Implement an LRU eviction policy for ephemeral items (`dr_cat_synced_database`, transient search caches, debug logs).
  - Strictly protect critical persistent user data:
    - Notes: `dr_cat_notes_*`
    - Progress: `dr_cat_user_progress`
    - Leitner Spaced Repetition: `dr_cat_leitner`
    - Study Streaks: `dr_cat_streak`
- [ ] **1.3 Defensive Schema Accessors & Normalizer**:
  - Add optional chaining (`?.`) and safe default fallbacks across `public/js/components/workspace/summary.js`, `prescription.js`, and `dashboard/stats.js`.
  - Add a client-side schema normalizer in `public/js/state.js` to seamlessly support both legacy flat CATs and hierarchical `sub_cats`.
- [ ] **1.4 Event Listener Lifecycle & Delegation**:
  - Audit `workspace.js`, `sidebar.js`, and `dashboard.js` to ensure DOM event listeners do not accumulate across repetitive view transitions in mobile WebViews.

---

### ⚙️ Track 2: Generator V3 & Posology Engine (`cat_db_generator/`)
- [ ] **2.1 Dual-Strategy Web Fetcher (`cat_db_generator/lib/web-fetcher.js`)**:
  - Exact multi-word search phrase prioritization.
  - Strict rejection of SERP / search result listing shells (`SearchResults?`, `search?q=`).
  - Jina Reader integration with DOM sanitization for full French clinical guidelines.
- [ ] **2.2 Algerian Drug Matrix (`cat_db_generator/lib/algerian_drug_matrix.json`)**:
  - DCI to local trade names and galenic market formulations mapping (*Augmentin, Clavulin, Amoclan, Tiorfan, Smecta, Spasfon, Ascabiol*, etc.).
- [ ] **2.3 Strictly Typed Posology Schema**:
  - Enforce structured posology objects (`molecule`, `forme`, `dosage`, `posologie`, `duree`, `regle_poids`, `contre_indications`).
- [ ] **2.4 Source Grounding & Citation Anchoring**:
  - Require validated `source_ref` per therapeutic recommendation anchored to ingested PDFs/guidelines.
- [ ] **2.5 Safety Firewall & Automated Prompt Retry**:
  - Hook `medical-validator.js` directly into the generation loop to trigger automated prompt retries upon dosage or contraindication violations.

---

### 🔒 Track 3: Security, Build & Validation
- [ ] **3.1 Credential & API Isolation**:
  - Verify zero AI provider keys/endpoints are bundled into `public/dist/` or Capacitor assets.
- [ ] **3.2 Test Suite Execution**:
  - Run headless test harness (`npm test`) and full suite (`npm run test:suite`).
- [ ] **3.3 Production Asset Preparation**:
  - Run `npm run build` and verify production bundles and Capacitor asset hardening.
  - Ready for GitHub Actions APK build.

---
