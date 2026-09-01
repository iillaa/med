# 📐 Référence : Spécification de la Matrice 60 Master-CATs & 63 Sub-CATs

> **Quadrant Diátaxis** : *03-Reference (Specifications)*  
> **Statut** : Production (v1.17.0+)  
> **Fichiers Associés** : `data/official_master_subcats_matrix.json`, `data/master_subcats_report.json`

---

## 🎯 1. Vue d'Ensemble de la Taxonomie Médicale

La matrice officielle de Dr. CAT structure le savoir médical en **60 Master CATs** réparties sur **15 spécialités cliniques majeures**, comportant **63 Sub-CATs** dédiées aux situations d'urgence, sous-types cliniques ou populations spécifiques.

---

## 📊 2. Répartition par Spécialité Médicale

| Spécialité | Master CATs | Sub-CATs | Thématiques Majeures |
| :--- | :---: | :---: | :--- |
| **Cardiologie** | 6 | 8 | SCA, OAP, HTA Urgence, Fibrillation Auriculaire, Syncope, IC Décompensée |
| **Pneumologie** | 5 | 7 | Asthme aigu, BPCO exacerbation, PAC, Embolie pulmonaire, Pleurésie |
| **Gastro-entérologie** | 5 | 6 | Hémorragie digestive, GEA / Déshydratation, Appendicite, Lithiase, Ulcère |
| **Neurologie** | 4 | 5 | AVC ischémique / hémorragique, Crise comitiale / État de mal, Céphalées aiguës, Méningite |
| **Endocrinologie** | 4 | 5 | Diabète type 2 (Pied/Acidocétose), Hypoglycémie sévère, Dysthyroïdie aiguë |
| **Infectiologie** | 5 | 6 | Sepsis, Fièvre au retour de voyage, Paludisme, Brucellose, Zona / Varicelle |
| **Pédiatrie** | 5 | 6 | Convulsion fébrile, Bronchiolite, Déshydratation aiguë du nourrisson, Purpura |
| **Dermatologie** | 4 | 4 | Érysipèle, Urticaire aiguë / Anaphylaxie, Gale, Eczéma surinfecté |
| **Néphrologie / Urologie** | 4 | 4 | Colique néphrétique, Pyélonéphrite aiguë, Rétention aiguë d'urine, IRA |
| **Rhumatologie** | 3 | 3 | Arthrite septique, Goutte aiguë, Lomboradiculalgie paralysante |
| **ORL** | 4 | 3 | Angines / Phlegmon péri-amygdalien, Épistaxis cataclysmique, Otite moyenne aiguë |
| **Ophtalmologie** | 3 | 2 | Œil rouge douloureux, Glaucome aigu par fermeture de l'angle, Corps étranger |
| **Gynécologie / Obstétrique**| 3 | 2 | Métrorragies T1 / GEU, Pré-éclampsie, Menace d'accouchement prématuré |
| **Psychiatrie** | 2 | 2 | Agitation aiguë / Psychose, Crise suicidaire / Évaluation RUD |
| **Urgences Médico-Chirurgicales**| 3 | 0 | Choc anaphylactique, Intoxication CO / Médicamenteuse, Brûlures étendues |
| **TOTAL** | **60** | **63** | **Couverture Globale de la Pratique Médicale Générale & d'Urgence** |

---

## 🏷️ 3. Format de Nommage des Identifiants (IDs)

- **Master CAT ID** : Entier positif unique (ex: `1`, `12`, `45`).
- **Sub-CAT ID** : Chaîne normalisée composée de l'ID Master et de l'index de la sous-fiche :  
  `sub_<master_id>_<sub_index>` (ex: `sub_12_1`, `sub_12_2`).
- **Lien d'ancrage URL** : `#cat-<master_id>-<sub_id>` (ex: `#cat-12-sub_12_1`).

---

## 🔗 Liens & Documents Associés
- 🌳 [Architecture Hiérarchique Sub-CATs](file:///data/data/com.termux/files/home/med/docs/01-architecture/hierarchical-subcats-engine.md)
- 🛠️ [Guide du Pipeline Sub-CATs](file:///data/data/com.termux/files/home/med/docs/02-guides/subcats-matrix-pipeline.md)
- 📐 [Schéma de Données des Fiches](file:///data/data/com.termux/files/home/med/docs/03-reference/schema-cats-db.md)
