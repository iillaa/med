# 🌳 Dr.CAT Hierarchical Sub-CAT Architecture & Integration Plan

---

## 1. 🎯 Architectural Vision & Objectives

Clinical medicine is inherently hierarchical. While single acute topics (*"Gale"*, *"Morsure d'animal"*) fit cleanly into a single fiche, master clinical syndromes (*"HTA"*, *"Diabète"*, *"Dyspnée"*, *"Anémie"*) require **Clinical Branching**:
- **Parent CAT (Master Hub)**: Provides diagnostic triage, global classification, baseline workup, and outpatient 1st-line strategy.
- **Child Sub-CATs (Deep Clinical Nodes)**: Provide intensive, protocol-specific deep dives for acute emergencies, specialized terrains (pregnancy, pediatrics, renal failure), or rare complications.

---

## 2. 🗄️ Data Model & Schema (100% Backwards Compatible)

The schema extends the existing `cats_db.json` format without breaking standalone CATs:

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
  "summary": "...",
  "red_flags": "...",
  "ordonnance": "..."
}
```

### B. Parent Master Hub Object
```json
{
  "id": 12,
  "parent_id": null,
  "category": "Cardiologie",
  "title": "CAT devant Hypertension Artérielle (HTA)",
  "sub_cat_ids": [120, 121, 122],
  "summary": "...",
  "red_flags": "...",
  "ordonnance": "..."
}
```

### C. Standardized `sub_cat_type` Badges:
1. `emergency` ➔ **🚨 Urgences & Aigu** (e.g. *Urgence Hypertensive*, *Acidocétose*, *Asthme Aigu Grave*)
2. `terrain` ➔ **🤰 Terrains Particuliers** (e.g. *HTA & Grossesse*, *Diabète du sujet âgé*, *Insuffisance rénale*)
3. `subtype` ➔ **🔬 Formes & Étiologies** (e.g. *Anémie Hémolytique*, *HTA Secondaire*)
4. `complication` ➔ **⚠️ Complications** (e.g. *Pied Diabétique*, *Rétinopathie*)

---

## 3. 📱 Mobile UI / UX Flow

```
+-------------------------------------------------------------------------+
| [ < Retour ]   Cardiologie > HTA > 🚨 Urgence Hypertensive              |
+-------------------------------------------------------------------------+
|                                                                         |
|  Parent Hub Link Banner:                                                |
|  [ 📂 Fiche Parente : CAT devant HTA (Généralités)  ──► ]               |
|                                                                         |
|  Sibling Switcher (Direct Jump to other branches):                      |
|  [ 🚨 Urgence (Actif) ]  [ 🤰 HTA & Grossesse ]  [ 💊 HTA Résistante ]   |
|                                                                         |
+-------------------------------------------------------------------------+
|  📋 Diagnostic & Conduite Pratique (Spécialisée Urgence)                |
|  ...                                                                    |
+-------------------------------------------------------------------------+
```

### 1. In Parent CAT View:
- Directly under the title, a **"🌿 Branches & Sous-Fiches Spécialisées"** Card appears.
- Displays interactive buttons grouped by type (`🚨 Urgences`, `🤰 Terrains`, `🔬 Sous-types`).
- Tapping any button smoothly navigates to the child fiche.

### 2. In Child Sub-CAT View:
- Displays a prominent **Breadcrumb & Parent Bar**: `⬅️ Retour à : HTA (Généralités)`.
- Displays a **Sibling Quick-Switcher Bar** to jump between other child branches without going back to the parent.

---

## 4. 🔍 Search & Discovery Integration

1. **Parent-Level Results**: Searching `"HTA"` shows the Master CAT card, with child preview chips below it:
   `[CAT devant HTA] ──► +3 sous-fiches : Urgence, Grossesse, Résistante`
2. **Child-Level Direct Match**: Searching `"Nicardipine"` or `"Pré-éclampsie"` brings up the child sub-CAT directly, stamped with a badge: `🌿 Sous-fiche de : HTA`.

---

## 5. 🤖 Generator V3 AI Prompt Specialization

When generating a Child Sub-CAT, Generator V3 adapts its prompt context:
- **Inherited Context**: Injects the parent topic name and clinical domain.
- **Deep-Dive Constraint**: Prevents the AI from repeating basic definition boilerplate. Forces the AI to dedicate 100% of tokens to:
  1. *Immediate triage and acute drug titration protocols*.
  2. *Specific dosages, infusion rates (mg/h, SE), and monitoring criteria*.
  3. *Precise indications for hospital transfer / ICU admission*.

---

## 6. 🛠️ Admin Generator Lab Integration

In `admin/cat_generator_lab.html`:
- **Nested Table Tree View**: Sub-CATs appear indented under their parent row.
- **`➕ Ajouter Sous-Fiche` Button**: Instantly opens the generator modal pre-filled with the parent ID and domain.
- **Drag-and-Drop / Select Linker**: Easily reassign or promote any standalone CAT to be a child of another.
