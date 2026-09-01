# 📐 Référence : Spécification du Schéma de Données des Fiches Médicales (v3.5)

> **Quadrant Diátaxis** : *03-Reference (Specifications)*  
> **Statut** : Production (v1.17.0+)  
> **Fichiers Associés** : `cats_db.json`, `public/data/cats_db.json`, `cat_db_generator/cats_db_staged.json`, `cat_db_generator/cats_db_staged.meta.json`

---

## 🎯 1. Spécification Formelle JSON Schema

Le schéma ci-dessous définit la structure stricte d'une entrée de la base clinique :

```json
{
  "$schema": "http://json-schema.org/draft-07/schema#",
  "title": "DrCAT_Medical_Record_V3_5",
  "type": "object",
  "required": ["id", "category", "title", "summary", "red_flags", "ordonnance", "pdf_keywords"],
  "properties": {
    "id": {
      "type": "integer",
      "minimum": 1,
      "description": "Identifiant numérique unique et immuable de la fiche."
    },
    "category": {
      "type": "string",
      "description": "Spécialité médicale de rattachement (ex: Cardiologie, Pneumologie, Pédiatrie)."
    },
    "title": {
      "type": "string",
      "minLength": 3,
      "description": "Intitulé clinique officiel de la CAT (ex: 'Pneumonie Aiguë Communautaire')."
    },
    "summary": {
      "type": "string",
      "description": "Corps structuré de la conduite à tenir en 5 sections numérotées en Markdown."
    },
    "red_flags": {
      "type": "string",
      "description": "Signes de gravité immédiate et critères d'hospitalisation urgente."
    },
    "ordonnance": {
      "type": "string",
      "description": "Proposition de prescription médicamenteuse type (3 lignes max recommandées)."
    },
    "pdf_keywords": {
      "type": "array",
      "items": { "type": "string" },
      "description": "Mots-clés discriminants pour le matching RAG et la recherche vectorielle."
    },
    "updatedAt": {
      "type": "integer",
      "description": "Horodatage Unix (millisecondes) de la dernière mise à jour."
    },
    "history": {
      "type": "array",
      "items": {
        "type": "object",
        "required": ["timestamp", "action", "detail"],
        "properties": {
          "timestamp": { "type": "integer" },
          "action": { "type": "string", "enum": ["create", "update", "approve_suggestion", "migrate"] },
          "detail": { "type": "string" }
        }
      },
      "description": "Piste d'audit des modifications (uniquement en Staging/Admin)."
    },
    "subcats": {
      "type": "array",
      "items": {
        "type": "object",
        "required": ["id", "title", "summary", "red_flags", "ordonnance", "pdf_keywords"],
        "properties": {
          "id": { "type": "string", "pattern": "^sub_[0-9]+_[0-9]+$" },
          "title": { "type": "string" },
          "summary": { "type": "string" },
          "red_flags": { "type": "string" },
          "ordonnance": { "type": "string" },
          "pdf_keywords": { "type": "array", "items": { "type": "string" } }
        }
      },
      "description": "Tableau des sous-fiches cliniques rattachées (Hiérarchie Master-SubCATs)."
    }
  }
}
```

---

## 🔍 2. Structure Standardisée du Champ `summary`

Le champ `summary` doit obligatoirement respecter l'ordonnancement en 5 étapes :

```markdown
1. Diagnostic Positif & Différentiel :
- Critères cliniques majeurs, interrogatoire et constantes vitales.

2. Conduite Pratique & Gestes d'Urgence :
- Mise en condition, oxygénothérapie, voie veineuse si nécessaire.

3. Traitement Médicamenteux & Non-Médicamenteux :
- Molécules de 1ère intention, posologies adaptées au poids/âge, durée.

4. Examens Complémentaires :
- Bilan biologique, imagerie ciblée (sans retarder le traitement).

5. Orientation & Suivi :
- Critères de retour à domicile, signaux d'alerte patient, délai de réévaluation.
```

---

## 🗄️ 3. Différences entre Base Production et Staging

| Propriété | Production (`public/data/cats_db.json`) | Staging (`cats_db_staged.json`) |
| :--- | :--- | :--- |
| **Champ `history`** | ❌ Purgé (réduction de taille APK) | ✅ Conservé pour traçabilité |
| **Validation Médicale** | ✅ Certifiée 100% | ⏳ En attente ou en cours d'évaluation |
| **Fichier Métadonnées** | Intégré dans l'entête HTTP | Sidecar `cats_db_staged.meta.json` |

---

## 🔗 Liens & Documents Associés
- 🤖 [Architecture du Moteur LLM](file:///data/data/com.termux/files/home/med/docs/01-architecture/llm-generation-engine.md)
- 🌳 [Architecture des Sous-Fiches Hiérarchiques](file:///data/data/com.termux/files/home/med/docs/01-architecture/hierarchical-subcats-engine.md)
- 📜 [ADR-002 : Abandon du Versionnage par Nom de Fichier](file:///data/data/com.termux/files/home/med/docs/04-decisions-adr/adr-002-fixed-database-filenames.md)
