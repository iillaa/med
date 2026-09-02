# 💡 Grand Registre des Retours d'Expérience & Post-Mortems (lessons-learned-postmortems.md)

> **Quadrant Diátaxis** : *01-Architecture (Explanations & Post-Mortems)*  
> **Statut** : Document Vivant de Référence Technique  
> **Auteur** : Dr. Kibeche Ali Dia Eddine & Équipe IA

---

## 🧭 Introduction & Philosophie
Ce document consigne l'historique exhaustif des incidents critiques, anomalies de conception, limitations d'environnements et arbitrages techniques rencontrés lors du développement de **Dr. CAT**. 

L'objectif est d'empêcher toute régression future en conservant la mémoire des causes profondes (*Root Cause Analysis*) et des solutions éprouvées.

---

## 📋 Sommaire des Post-Mortems & Leçons Apprises

1. [Post-Mortem 1 : L'Illusion des Tests Automatisés & L'Incident `installId`](#1-post-mortem-1--lillusion-des-tests-automatisés--lincident-installid)
2. [Post-Mortem 2 : Le Bug d'Écriture sur Chemin Mort lié au Nommage Versionné de la DB](#2-post-mortem-2--le-bug-décriture-sur-chemin-mort-lié-au-nommage-versionné-de-la-db)
3. [Post-Mortem 3 : L'Incompatibilité ARM64 de `workerd` dans l'Environnement Termux](#3-post-mortem-3--lincompatibilité-arm64-de-workerd-dans-lenvironnement-termux)
4. [Post-Mortem 4 : La Destruction Accidentelle des Données Médicales Utilisateur via le Lock Screen](#4-post-mortem-4--la-destruction-accidentelle-des-données-médicales-utilisateur-via-le-lock-screen)
5. [Post-Mortem 5 : Dérives de Qualité des Modèles LLM Expérimentaux (`GEMINI_BLOCKLIST`)](#5-post-mortem-5--dérives-de-qualité-des-modèles-llm-expérimentaux-gemini_blocklist)
6. [Post-Mortem 6 : Validation Pharmacologique & Molécules Hors-Nomenclature](#6-post-mortem-6--validation-pharmacologique--molécules-hors-nomenclature)
7. [Post-Mortem 7 : Race Conditions sur l'Append Sérialisé dans Cloudflare KV](#7-post-mortem-7--race-conditions-sur-lappend-sérialisé-dans-cloudflare-kv)

---

### 1. Post-Mortem 1 : L'Illusion des Tests Automatisés & L'Incident `installId`
* **Date** : Septembre 2026 (v1.22.0)
* **Symptôme** : Un test master 100% vert (`11/11 Passed`), mais un crash silencieux au démarrage du client (`Unhandled Promise Rejection: installId is not defined`).
* **Cause Profonde** :
  - Les tests unitaires sous Node.js mockent des flux d'API backend isolés.
  - Ils n'exécutent pas le cycle de vie réel du DOM / WebView Capacitor dans le bundle client (`public/dist/app-*.js`).
  - L'omission d'une variable (`const installId = getInstallId()`) dans le module de télémétrie client n'était visible qu'au moment de l'exécution réelle dans le navigateur.
* **Leçon Apprise** :
  - **Les tests automatisés ne remplacent JAMAIS la revue de code manuelle et le traçage statique des variables.**
  - Avant de déclarer une tâche terminée, chaque variable, paramètre, import et accès `localStorage` doit être manuellement inspecté et simulé à blanc (*mental dry-run*).

---

### 2. Post-Mortem 2 : Le Bug d'Écriture sur Chemin Mort lié au Nommage Versionné de la DB
* **Date** : Versions v1.10 à v1.12
* **Symptôme** : Des modifications validées dans le générateur administratif ne se répercutaient pas dans l'application mobile.
* **Cause Profonde** :
  - La base de données avait été renommée de `cats_db.json` en `cats_db_v2.json`, puis `cats_db_v3.json`.
  - Plusieurs scripts (générateur IA, validateur, moteur RAG, build APK) lisaient et écrivaient dans des chemins discordants.
* **Leçon Apprise & Règle Définitive** :
  - **Ne JAMAIS versionner les noms de fichiers physiques.**
  - La base canonique est immuablement nommée `cats_db.json` (production) et `cat_db_generator/cats_db_staged.json` (staging).
  - La version de schéma (`schema_version: "3.5"`) vit **à l'intérieur** de la métadonnée (`cats_db_staged.meta.json`), jamais dans le nom du fichier.

---

### 3. Post-Mortem 3 : L'Incompatibilité ARM64 de `workerd` dans l'Environnement Termux
* **Date** : v1.12.0
* **Symptôme** : Crash immédiat de toute commande `npx wrangler` sous Termux Android arm64 (`Unsupported platform: android arm64 LE`).
* **Cause Profonde** :
  - Le binaire précompilé du runtime Cloudflare `workerd` n'existe pas pour l'architecture `android-arm64`.
  - L'installation standard de `wrangler` provoquait l'échec total de `npm install`.
* **Leçon Apprise & Solution** :
  - `wrangler` a été déplacé dans `optionalDependencies` (pour ne jamais bloquer `npm install`).
  - Un hook automatique `"postinstall": "bash scripts/termux-wrangler-fix.sh"` patche le binaire `workerd` sur architecture Android sans impacter les environnements CI ou serveurs x86/Linux.

---

### 4. Post-Mortem 4 : La Destruction Accidentelle des Données Médicales Utilisateur via le Lock Screen
* **Date** : Versions pré-v1.12.0
* **Symptôme** : Lors du déclenchement du Kill Switch ou de la mise à jour forcée, les notes médicales personnelles et la progression Leitner des étudiants étaient effacées.
* **Cause Profonde** :
  - L'écran de verrouillage de sécurité (`version-checker.js`) exécutait un `localStorage.clear()` destructeur.
* **Leçon Apprise & Règle Définitive** :
  - **Le Kill Switch ne doit JAMAIS purger le stockage utilisateur.**
  - Seules les clés de cache réseau temporaires (`dr_cat_synced_db`) peuvent être invalidées. Les clés utilisateur (`dr_cat_notes_*`, `dr_cat_user_progress`, `dr_cat_leitner`, `dr_cat_streak`) sont strictement sanctuarisées.

---

### 5. Post-Mortem 5 : Dérives de Qualité des Modèles LLM Expérimentaux (`GEMINI_BLOCKLIST`)
* **Date** : v1.12.0+
* **Symptôme** : Des modèles expérimentaux (`flash-preview`, `exp-model`) retournaient des formats JSON hallucinés ou des posologies tronquées.
* **Cause Profonde** :
  - L'algorithme de découverte dynamique sélectionnait automatiquement le numéro de version le plus élevé, captant des versions preview instables.
* **Leçon Apprise & Solution** :
  - Mise en place de la variable d'environnement `GEMINI_BLOCKLIST` (ex: `flash-preview, exp-model`) filtrant les versions expérimentales en amont du tri.
  - Exécution systématique de suites de contrôle qualité *Canaries* (parsing de posologies) et *Golden Set* (5 cas cliniques immuables).

---

### 6. Post-Mortem 6 : Validation Pharmacologique & Molécules Hors-Nomenclature
* **Date** : v1.12.0+
* **Symptôme** : Blocage du générateur IA lors de l'utilisation de spécialités récentes ou locales non encore indexées dans la base BDPM de base.
* **Cause Profonde** :
  - Le validateur rejetait comme erreur fatale toute molécule non retrouvée dans l'index statique.
* **Leçon Apprise & Solution** :
  - Une molécule non répertoriée produit désormais un avertissement explicite `[DCI Non Référencée]` (Warning informatif) laissant le médecin décideur final dans le Générateur Lab, sans bloquer le pipeline.

---

### 7. Post-Mortem 7 : Race Conditions sur l'Append Sérialisé dans Cloudflare KV
* **Date** : v1.17.0+
* **Symptôme** : Perte intermittente de suggestions ou de pings lorsque plusieurs utilisateurs interagissaient simultanément avec le Edge Worker.
* **Cause Profonde** :
  - L'écriture dans Cloudflare KV effectuait une lecture de l'ensemble du tableau JSON, un push local, puis une réécriture globale (`KV.put`), écrasant les écritures concurrentes.
* **Leçon Apprise & Solution** :
  - Stockage par clés discrètes ou fusion basée sur l'horodatage (`lastSeen` le plus récent l'emporte), garantissant l'intégrité des flux de télémétrie multi-appareils.

---

## 🔗 Documents Liés
- 🛡️ [Architecture de Sécurité & Isolation](file:///data/data/com.termux/files/home/med/docs/01-architecture/security-isolation.md)
- 🐛 [Grand Registre des Failles & Audits](file:///data/data/com.termux/files/home/med/docs/bugs-doc.md)
- 📜 [Architecture Decision Records (ADRs)](file:///data/data/com.termux/files/home/med/docs/04-decisions-adr/)
