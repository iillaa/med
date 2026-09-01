# 🤖 Architecture : Moteur de Génération Médicale LLM V3.5

> **Quadrant Diátaxis** : *01-Architecture (Explanations)*  
> **Statut** : Production (v1.17.0+)  
> **Composants Clés** : `cat_db_generator/generate_cat_db.js`, `cat_db_generator/lib/llm-engine.js`, `cat_db_generator/lib/medical-validator.js`

---

## 🎯 1. Vue d'Ensemble & Défis de l'IA Clinique

La génération automatisée de Conduites à Tenir (CAT) médicales exige un niveau de fiabilité, de rigueur pharmacologique et de sécurité absolue qu'un simple appel LLM non encadré ne peut garantir.

Le moteur **Dr. CAT LLM Engine V3.5** repose sur une architecture multi-flux garantissant :
1. **Zéro Hallucination Pharmacologique** : Validation systématique contre la base BDPM et la nomenclature locale algérienne.
2. **Découverte Dynamique Robuste** : Sélection automatique du meilleur modèle Google Gemini disponible avec liste noire de protection (`GEMINI_BLOCKLIST`).
3. **Double Filet de Sécurité Clinique** : Tests auto-diagnostiques Canaries (parsers de dosage) et suite de régression clinique Golden Set.

```mermaid
flowchart TD
    Request["🎯 Demande de Génération (ex: CAT Pneumonie Aiguë)"]
    
    subgraph StreamEngine["Les 5 Flux de Connaissances & Règles"]
        Stream1["📄 1. Extraits RAG Corpus PDF Réel (Polycopiés/Consensus)"]
        Stream2["💊 2. Nomenclature Algérienne & Dictionnaires BDPM"]
        Stream3["⚡ 3. Directives Cliniques & Arbre Décisionnel d'Urgence"]
        Stream4["🛡️ 4. Plafonds de Posologie & Règles Gériatriques/Pédiatriques"]
        Stream5["📝 5. Règles Pragmatismes (Ordonnance 3 Lignes Max)"]
    end

    subgraph LLMExecution["Exécution & Découverte de Modèles"]
        GeminiDiscovery["🔍 Dynamic Model Discovery (Gemini Pro / Flash)"]
        BlocklistFilter["🚫 GEMINI_BLOCKLIST Filter (Exclusion preview/exp)"]
        GenerationPrompt["🧠 Synthesis Prompt Execution"]
        GeminiDiscovery --> BlocklistFilter --> GenerationPrompt
    end

    subgraph ValidationGates["Barrières de Validation (medical-validator.js)"]
        SchemaGate["1. Validation Schéma JSON Strict"]
        CanaryGate["2. Test Canaries (Parser de Posologie)"]
        DoseGate["3. Vérification des Plafonds Posologiques (Section 7f)"]
        MoleculeGate["4. Unknown-Molecule Gate (DCI Non Référencée)"]
        GoldenGate["5. Golden Set Clinical Regression Score"]
    end

    Output["✅ Fiche Clinique Certifiée (cats_db_staged.json)"]

    Request --> StreamEngine --> GenerationPrompt
    GenerationPrompt --> ValidationGates --> Output
```

---

## 🔍 2. Découverte Dynamique des Modèles & `GEMINI_BLOCKLIST`

Le module `cat_db_generator/lib/llm-engine.js` implémente un système intelligent de sélection de modèles Gemini :

1. **Interrogation Dynamique de l'API Google AI** :
   - Récupération de la liste des modèles actifs associés à la clé API (`gemini-2.5-pro`, `gemini-2.5-flash`, etc.).
   - Tri automatique selon la version sémantique la plus récente et les capacités de raisonnement.
2. **Filtre `GEMINI_BLOCKLIST`** :
   - Variable d'environnement facultative `.env` permettant d'exclure des modèles expérimentaux instables ou sujets aux hallucinations.
   - Exemple : `GEMINI_BLOCKLIST=preview,exp,experimental`
   - Si tous les modèles découverts sont filtrés, le système lève une exception claire et explicite au lieu d'échouer silencieusement.
3. **Mécanisme de Repli (Fallback Chain)** :
   - En cas d'erreur de quota (HTTP 429) ou d'indisponibilité momentanée, le moteur bascule automatiquement sur le modèle de repli configuré.

---

## 🛡️ 3. Les Barrières de Validation Médicale (`medical-validator.js`)

Chaque fiche générée est soumise à un audit rigoureux en 7 sections :

### 1. Structure Formelle & Sections Obligatoires
- Découpage strict : **1. Diagnostic**, **2. Conduite Pratique**, **3. Traitement**, **4. Examens Complémentaires**, **5. Orientation**.
- Présence impérative des drapeaux rouges (`red_flags`) et d'une proposition d'ordonnance type (`ordonnance`).

### 2. Contrôle Pharmacologique & Plafonds Posologiques (Section 7f)
- Analyse lexicale de chaque ligne de l'ordonnance.
- Vérification des doses unitaires et journalières contre les plafonds cliniques définis dans `lib/clinical-ceilings.js` (ex: Paracétamol max 4g/j adulte, Amoxicilline max 3g/j adulte).
- Détection des associations contre-indiquées (ex: AINS + Anticoagulant oral, double macrolide).

### 3. Unknown-Molecule Validator Gate
- Tout médicament prescrit est confronté au registre des molécules connues (DCI BDPM + Dénominations algériennes).
- Si une molécule n'est pas reconnue dans les dictionnaires officiels, le validateur émet un avertissement explicite :
  `[DCI Non Référencée] <NOM_MOLECULE>`
- Cet avertissement permet à l'administrateur médical d'inspecter manuellement la prescription dans le Staging Lab avant validation finale.

---

## 🧪 4. Canaries de Dosage & Régression Golden Set

Pour garantir qu'une modification de prompt ou de regex ne détériore pas silencieusement la qualité des générations :

### 🐤 1. Canaries de Dosage (`--canary`)
- Auto-test exécuté au démarrage de chaque génération (`npm run generate -- --canary`).
- Analyse 15 formulations posologiques complexes (ex: *"1 sachet 3x/j à dissoudre dans un verre d'eau"*, *"50 mg/kg/j en 3 prises orales"*).
- Si le parser de dosage échoue sur un seul cas test, la génération globale est interrompue pour éviter toute corruption de données.

### 🏆 2. Suite Clinique Golden Set (`--golden`)
- Évalue 5 cas cliniques types immuables définis dans `cat_db_generator/golden_set.json` (ex: Colique néphrétique, Crise d'asthme aiguë, Érysipèle).
- Compare la sortie générée aux attentes cliniques formelles (mots-clés thérapeutiques indispensables, contre-indications signalées, score de concision).

---

## 🔗 Liens & Documents Associés
- 📄 [Pipeline RAG & Découpage PDF](file:///data/data/com.termux/files/home/med/docs/01-architecture/pdf-rag-pipeline.md)
- 🛠️ [Guide de Génération des CATs](file:///data/data/com.termux/files/home/med/docs/02-guides/generating-validating-cats.md)
- 📐 [Nomenclature Médicale & Règles BDPM](file:///data/data/com.termux/files/home/med/docs/03-reference/drug-nomenclature-algeria.md)
