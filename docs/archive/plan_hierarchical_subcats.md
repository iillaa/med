# 🌳 Dr.CAT Dynamic Sub-CAT & Retractable Step Architecture Plan

---

## 1. 🎯 Core Principle: 100% Dynamic, Zero Hardcoding

Both the **Retractable Step Accordions** and the **Hierarchical Sub-CAT Branches** are completely dynamic:
- **Zero hardcoded IDs or title lists**: Works out-of-the-box for all existing CATs, newly AI-generated CATs, doctor-edited CATs, and manually created admin CATs.
- **Pure Relational Runtime Graph**: Relationships and UI cards are computed on-the-fly from data fields (`parent_id` and Markdown step markers).

---

## 2. 🗂️ Dynamic Data Model & Relational Graph

### A. Sub-CAT Child Object (`cats_db.json`)
```json
{
  "id": 120,
  "parent_id": 12,
  "category": "Cardiologie",
  "title": "CAT devant Urgence Hypertensive",
  "sub_cat_type": "emergency",
  "sub_cat_label": "🚨 Urgence Hypertensive & Crise",
  "search_keywords": ["urgence hypertensive", "nicardipine", "loxen", "HTA maligne"],
  "summary": "**0. Stabilisation Vitale :** ... \n\n**1. Triage :** ...",
  "red_flags": "...",
  "ordonnance": "..."
}
```

### B. Dynamic Runtime Inverted Index (In `state.js` / Client Store)
On app load or database sync, the client builds an in-memory graph in $O(N)$ time:
```javascript
function buildCatRelationshipGraph(allCats) {
  const childrenMap = new Map(); // parent_id -> [childCats]
  const parentMap = new Map();   // child_id -> parentCat

  allCats.forEach(cat => {
    if (cat.parent_id) {
      if (!childrenMap.has(cat.parent_id)) childrenMap.set(cat.parent_id, []);
      childrenMap.get(cat.parent_id).push(cat);
      
      const parent = allCats.find(p => p.id === cat.parent_id);
      if (parent) parentMap.set(cat.id, parent);
    }
  });

  return { childrenMap, parentMap };
}
```

---

## 3. 📑 Dynamic Retractable Step Parser (`renderDynamicAccordions`)

Instead of rendering plain continuous text, the client uses a **generic Markdown step parser**:

### How It Works Dynamically:
1. Regex matches numbered clinical step headers:
   `/(?:\*\*|#{2,4}\s*)([0-9]+(?:bis)?\.\s*[^:\n*]+)(?:\*\*)?:?/gi`
2. Automatically splits the summary into modular blocks:
   - `0. Stabilisation Vitale (ABCDE)` ➔ Auto-expanded by default (`open`) if present.
   - `1. Diagnostic & Bilan Triage` ➔ Auto-expanded (`open`).
   - `2. Traitement Immédiat & Conduite` ➔ Auto-expanded (`open`).
   - `3bis. Terrain, Grossesse & Comorbidités` ➔ Collapsed by default (tap to expand).
   - `4. Critères d'Hospitalisation / Transfert` ➔ Collapsed by default (tap to expand).
3. If a fiche has no numbered steps, it renders as a clean standard card (100% safe fallback).

---

## 4. 📱 Dynamic Sub-CAT UI Rendering

When viewing ANY fiche (`currentCat`):

### A. If `currentCat` has Children (`childrenMap.get(currentCat.id)`):
The UI dynamically generates the **"🌿 Branches & Sous-Fiches Spécialisées"** Card:
- Iterates over children and groups them by `sub_cat_type`:
  - 🚨 **Urgences & Formes Aiguës**
  - 🤰 **Terrains Particuliers (Grossesse, Âge, Rénal)**
  - 🔬 **Sous-Types Cliniques**
  - ⚠️ **Complications**
- Clicking any child chip opens that fiche instantly.

### B. If `currentCat` is a Child (`currentCat.parent_id != null`):
The UI dynamically renders:
- **Parent Hub Header**: `⬅️ Retour au Master Hub : [Titre du Parent]`
- **Dynamic Sibling Switcher**: Automatically lists all other children of the same parent so the doctor can flip between branches with a single tap.

---

## 5. 🤖 AI Generator V3 Dynamic Sub-CAT Integration

1. In `admin/cat_generator_lab.html`, clicking **`➕ Ajouter Sous-Fiche`** on any row:
   - Sets `parent_id: targetRow.id`.
   - Sends payload `{ parent_id: 12, title: "CAT devant Urgence Hypertensive", category: "Cardiologie" }`.
2. Generator V3 automatically injects the parent's context:
   - Prompt: *"You are generating a specialized deep-dive child sub-fiche for [Parent: CAT devant HTA]. Focus 100% on acute management, intravenous drug titration, and emergency triage for this specific scenario."*
3. The generated child JSON is saved with `parent_id: 12` in `cats_db.json`.
4. The main app and Admin Lab immediately discover the relationship **without touching a single line of application code**.

---

## 6. 🧩 Targeted Sub-CATs Micro-Engine & Option C Pre-Configuration (v1.10.0)

### Evolution & Decoupling
In v1.10.0, the Sub-CAT system evolved to support both **pre-configured single-pass synthesis** and **on-demand post-creation generation**:

1. **Option C Pre-Configuration Panel**:
   - During creation, doctors select either **⚡ Standard (1-Tab)** or **🧩 Multi-Profils & Sous-Fiches**.
   - 6 1-click clinical presets: `🤰 Grossesse CRAT`, `👴 Sujet Âgé (Start low go slow)`, `👶 Pédiatrie (mg/kg/j)`, `🚨 Urgence`, `🫘 Rénal`, `🧠 Psychiatrie RUD (Loi 18-11)`.
   - Saisies libres personnalisées (ex: *Salmonella*, *Résistante*).
2. **Targeted Micro-Engine (`generateSubCATWithLLM`)**:
   - Generates sub-fiches using a 4-step summary (`0. Spécificités`, `1. Diagnostic`, `2. Prise en Charge`, `3. Surveillance`) and 4-section ordonnance without modifying parent summary text.
3. **Segmented Pill Navigation Bar (`subcat-selector-bar`)**:
   - Fluid horizontal pills (`⭐ Fiche Principale`, `🤰 Grossesse`, etc.) dynamically switching view contexts with zero DOM redraw delays.
4. **Automated 8-Layer Medical Checksum**:
   - Tests every generated sub-CAT against pharmacological ceilings and drug interactions with a 3-attempt automated retry loop.
