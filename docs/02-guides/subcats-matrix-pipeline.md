# 🌳 Guide : Pipeline de Construction & Validation de la Matrice Sub-CATs

> **Quadrant Diátaxis** : *02-Guides (How-To Guides)*  
> **Statut** : Production (v1.17.0+)  
> **Composants Clés** : `data/official_master_subcats_matrix.json`, `scripts/corpus_density_scanner.js`, `scripts/master_subcats_scanner.js`

---

## 🎯 1. Vue d'Ensemble

Le pipeline de gestion taxonomique permet de maintenir, scanner et valider la matrice des **60 Master CATs** et **63 Sub-CATs** officielles de Dr. CAT. Il s'assure qu'aucune sous-fiche n'est déclarée sans que le corpus PDF local ne dispose de la densité documentaire suffisante pour la documenter cliniquement.

---

## 📊 2. Étapes d'Exécution du Pipeline

### Étape 1 : Scanner la Densité du Corpus PDF
Ce script parcourt l'ensemble des polycopiés et fiches PDF locales pour mesurer la fréquence d'apparition de chaque pathologie et sous-thème :
```bash
node scripts/corpus_density_scanner.js
```
- **Sortie** : Génère `data/corpus_density_report.json` avec les scores de densité vectorielle par spécialité.

---

### Étape 2 : Scanner et Valider les Associations Master ↔ Sub-CATs
Vérifiez la consistance des relations hiérarchiques entre fiches mères et sous-fiches :
```bash
node scripts/master_subcats_scanner.js
```
- **Sortie** : Génère `data/master_subcats_report.json` avec les taux de couverture et les éventuelles fiches orphelines.

---

### Étape 3 : Mise à Jour de la Matrice Officielle Canonique
Pour recompiler la matrice officielle validée :
```bash
node scripts/build_official_cats_roadmap.js
```
- **Sortie** : Met à jour `data/official_master_subcats_matrix.json` et la documentation de référence associée (`docs/03-reference/official-master-subcats-roadmap.md`).

---

### Étape 4 : Test d'Échantillonnage de Génération
Pour tester la génération d'un lot représentatif de sous-fiches sans impacter la base de production :
```bash
node scripts/test_subcats_sample.js
```
- **Sortie** : Produit un rapport détaillé dans `data/test_generation_sample_report.json`.

---

## 📐 3. Structure de la Matrice Canonique (`official_master_subcats_matrix.json`)

Chaque entrée de la matrice respecte le format standardisé :

```json
{
  "master_id": 1,
  "master_title": "Asthme de l'Adulte & de l'Enfant",
  "category": "Pneumologie",
  "priority": "HIGH",
  "subcats": [
    {
      "sub_id": "sub_1_1",
      "sub_title": "Exacerbation Aiguë & Crise d'Asthme Grave",
      "clinical_focus": "Urgence vitale, nébulisations, corticothérapie IV",
      "pdf_sources": ["Pneumologie_.pdf", "Urgences1.pdf"]
    },
    {
      "sub_id": "sub_1_2",
      "sub_title": "Asthme du Nourrisson (< 36 mois)",
      "clinical_focus": "Diagnostic différentiel bronchiolite, chambre d'inhalation",
      "pdf_sources": ["Pédiatrie_.pdf"]
    }
  ]
}
```

---

## 🔗 Liens & Documents Associés
- 🌳 [Architecture Hiérarchique Sub-CATs](file:///data/data/com.termux/files/home/med/docs/01-architecture/hierarchical-subcats-engine.md)
- 📐 [Spécification de la Matrice 60-Master / 63-Sub-CAT](file:///data/data/com.termux/files/home/med/docs/03-reference/master-subcats-matrix-spec.md)
- 📜 [ADR-006 : Modèle Taxonomique 2-Tiers](file:///data/data/com.termux/files/home/med/docs/04-decisions-adr/adr-006-hierarchical-subcats.md)
