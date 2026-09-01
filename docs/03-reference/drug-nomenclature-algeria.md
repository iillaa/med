# 📐 Référence : Règles Pharmacologiques, BDPM & Nomenclature Algérienne

> **Quadrant Diátaxis** : *03-Reference (Specifications)*  
> **Statut** : Production (v1.17.0+)  
> **Fichiers Associés** : `cat_db_generator/lib/medical-validator.js`, `cat_db_generator/lib/medical-sources.js`, `cat_db_generator/lib/clinical-ceilings.js`

---

## 🎯 1. Cadre Pharmacologique de Dr. CAT

L'application Dr. CAT s'adresse aux médecins généralistes, résidents et urgentistes exerçant en Algérie et au Maghreb. Les ordonnances générées doivent concilier les consensus internationaux avec la **disponibilité réelle des molécules** et les dénominations commerciales locales.

---

## 💊 2. Dictionnaires & Sources de Référence

Le validateur médical (`cat_db_generator/lib/medical-validator.js`) croise chaque prescription avec :
1. **DCI Officielles Internationales (OMS / BDPM)** : Référentiel des Dénominations Communes Internationales.
2. **Nomenclature Nationale Algérienne** : Dénominations commerciales couramment prescrites (ex: *Tiorfan*, *Spasfon*, *Flagyl*, *Amoxydar*, *Augmentin*, *Zithromax*).
3. **Plafonds Posologiques d'Urgence** : Définis dans `cat_db_generator/lib/clinical-ceilings.js`.

---

## 🛑 3. Plafonds Posologiques Cliniques Adultes & Pédiatriques

| Molécule (DCI) | Dose Unitaire Max (Adulte) | Dose Journalière Max (Adulte) | Vigilance Pédiatrique / Gériatrique |
| :--- | :--- | :--- | :--- |
| **Paracétamol** | `1000 mg` (1g) | `4000 mg` (4g/j) | `15 mg/kg/prise` (max 60 mg/kg/j) |
| **Amoxicilline** | `1000 mg` (1g) | `3000 mg` (3g/j) | `80-100 mg/kg/j` en 3 prises (OMA/Pneumo) |
| **Amox + Ac. Clavulanique** | `1000 mg` (1g) | `3000 mg` (3g/j) | `80 mg/kg/j` (sur base Amoxicilline) |
| **Ciprofloxacine** | `500 mg` | `1500 mg` (1.5g/j) | Déconseillé chez l'enfant (sauf mucoviscidose) |
| **Ibuprofène** | `400 mg` | `1200 mg` (1.2g/j) | `20-30 mg/kg/j` - Contre-indiqué au T3 grossesse |
| **Prednisolone** | `60 mg` | `80 mg/j` (cure courte) | `1-2 mg/kg/j` cure courte 3-5 jours |

---

## ⚠️ 4. La Règle `[DCI Non Référencée]`

Lorsqu'un token médicamenteux n'est pas identifié dans les dictionnaires officiels :
- Le validateur n'interrompt pas brutalement la génération (afin de ne pas bloquer les nouvelles molécules ou galéniques spécifiques).
- Il appose le drapeau `[DCI Non Référencée] <NOM>`.
- Ce drapeau attire l'attention du médecin relecteur dans l'interface de staging pour validation humaine préalable.

---

## 📝 5. Règle des 3 Lignes d'Ordonnance Pragmatique

Pour les fiches de Conduite à Tenir d'Urgence et de Premier Recours :
- L'ordonnance type doit privilégier **3 lignes thérapeutiques majeures maximum** :
  1. *Ligne 1 : Traitement étiologique majeur* (ex: Antibiothérapie ciblée ou bronchodilatateur).
  2. *Ligne 2 : Traitement symptomatique immédiat* (ex: Antalgique / Antipyrétique / Antispasmodique).
  3. *Ligne 3 : Traitement adjuvant ou soins locaux* (ex: SRO, antiseptique, pansement).
- Cette règle évite la polymédication inutile et améliore l'observance thérapeutique du patient.

---

## 🔗 Liens & Documents Associés
- 🤖 [Architecture du Moteur LLM V3.5](file:///data/data/com.termux/files/home/med/docs/01-architecture/llm-generation-engine.md)
- 🛠️ [Guide de Génération des Fiches](file:///data/data/com.termux/files/home/med/docs/02-guides/generating-validating-cats.md)
- 📐 [Schéma de Données des Fiches](file:///data/data/com.termux/files/home/med/docs/03-reference/schema-cats-db.md)
