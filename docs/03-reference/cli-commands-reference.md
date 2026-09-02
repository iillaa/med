# 💻 Référence Complète des Commandes CLI (cli-commands-reference.md)

> **Quadrant Diátaxis** : *03-Reference (Specifications)*  
> **Statut** : Production (v1.21.0+)  
> **Cibles** : Administrateurs système, Développeurs Termux / Linux & Agents IA

---

## 🧭 Vue d'Ensemble

Ce document constitue le **référentiel exhaustif et centralisé** de toutes les lignes de commande disponibles dans le projet Dr. CAT. Il couvre l'administration des accès, la gestion du serveur démon (PM2), le pipeline d'IA médicale, la manipulation des PDFs maîtres, la compilation Android et les tests automatisés.

---

## 🔐 1. Administration, Sécurité & Identifiants

### 🔑 1.1 Réinitialisation du Mot de Passe Administrateur (`set:password`)
Génère un hachage cryptographique **PBKDF2-SHA512** (100 000 itérations avec un sel aléatoire de 16 octets) et l'écrit dans `admin_password.txt`.

```bash
# Mode interactif (invite sécurisée masquée dans le terminal)
npm run set:password

# Mode direct (définition en une seule commande)
node set_admin_password.js "mon_nouveau_mot_de_passe"
```
> [!TIP]
> Vous pouvez aussi simplement créer le fichier `admin_password.txt` en texte brut via `echo "mon_mot_de_passe" > admin_password.txt` ; au premier démarrage du serveur, celui-ci sera automatiquement converti en hachage salé PBKDF2.

### 🌐 1.2 Démarrage avec Mot de Passe Prédéfini (`start:admin`)
Démarre le serveur local en injectant les identifiants de développement par défaut (`ADMIN_PASSWORD=admin123`).
```bash
npm run start:admin
# Équivalent direct :
ADMIN_PASSWORD=mon_mot_de_passe npm start
```

### 🌍 1.3 Migration & Configuration du Domaine Cloudflare (`set:domain`)
Met à jour en une seule commande le domaine du Cloudflare Worker dans tous les fichiers de configuration, scripts client, manifestes SEO (`robots.txt`, `sitemap.xml`, `llms.txt`) et déclenche un `npm run build`.
```bash
npm run set:domain -- drcat.dr-cat.workers.dev
# Ou via le script :
node scripts/update_domain.js drcat.dr-cat.workers.dev
```

### 📡 1.4 Configuration de la Liste des Serveurs Distants (`set:provider`)
Gère la priorité et la liste des passerelles distantes (Ngrok, Cloudflare, tunnels) dans `remote_server_config.json`.
```bash
# Mode interactif
npm run set:provider

# Mode direct (fusion sans doublons)
node set_server_provider.js "https://mon-tunnel.ngrok.dev,https://drcat.workers.dev"

# Remplacement total (flag --reset)
node set_server_provider.js --reset "https://mon-tunnel-unique.ngrok.dev"
```

### 🏷️ 1.5 Incrémentation Atomique de Version (`bump`)
Synchronise la version sémantique à travers `package.json`, `android/app/build.gradle` (`versionName` et `versionCode`), `server/config/version.json`, `public/index.html` et `worker.js`.
```bash
npm run bump 1.22.0
# Ou directement :
node scripts/bump_version.js 1.22.0
```

### 📱 1.6 Configuration Initiale & Raccourcis Système
```bash
# Configuration d'un nouveau terminal ou tablette Android
npm run setup:device

# Installation des raccourcis Termux Widget (lancement / arrêt en un clic)
npm run setup:shortcuts

# Installation des utilitaires de tunnels distants
npm run install:tunnels
```

---

## 🏃 2. Serveur Local & Gestionnaire de Processus (PM2)

### 🖥️ 2.1 Mode Avant-Plan (Développement direct)
```bash
# Démarre l'application Express 5 sur le port 3000 (http://localhost:3000)
npm start
```

### 🔄 2.2 Mode Démon Arrière-Plan (Recommandé sur Tablette / Serveur)
Supervisé via **PM2** avec redémarrage automatique en cas de crash et persistance.

```bash
# Démarrer le serveur en arrière-plan
npm run pm2:start

# Consulter le statut (CPU, mémoire, uptime, restarts)
npm run pm2:status

# Afficher les 50 dernières lignes de logs en direct
npm run pm2:logs

# Redémarrer le serveur (après modification de code backend ou .env)
npm run pm2:restart

# Stopper le serveur
npm run pm2:stop

# Rotation et archivage des journaux de logs
npm run log:rotate
```

---

## 🤖 3. Pipeline IA Médicale & Génération de Fiches (`cat_db_generator/`)

Le moteur de génération IA (`cat_db_generator/generate_cat_db.js`) est protégé par 3 barrières de sécurité indispensables avant toute promotion en production.

```bash
# 1. Validation Canaries : Test unitaire du parseur de posologies sur formulations pièges
npm run generate -- --canary

# 2. Golden Set : Régression clinique sur 5 cas cliniques étalons avec notation LLM
npm run generate -- --golden

# 3. Génération d'une Conduite à Tenir spécifique par sujet
npm run generate -- --topic "Pneumonie Aiguë Communautaire"

# 4. Génération ciblée par spécialité médicale
npm run generate -- --category "Cardiologie"

# 5. Reconstitution complète de la base de staging avec canaries obligatoires
npm run generate -- --rebuild-all

# 6. Mise à niveau et re-tamponnage du schéma de base (v3.5)
node scripts/upgrade_db_schema.js --clean --version 3.5
```

### 🧠 3.1 Générateur Docimologique & Quiz Médicaux
Génère des vignettes cliniques à étapes progressives et des QCMs posologiques (`cat_db_generator/scripts/generate_quiz_cli.js`).

```bash
# Générer le quiz pour une CAT donnée (ex: CAT #1)
node cat_db_generator/scripts/generate_quiz_cli.js --cat 1

# Générer et publier directement dans public/data/quiz_db.json
node cat_db_generator/scripts/generate_quiz_cli.js --cat 1 --publish

# Générer en lot l'ensemble des quiz pour les 62 CATs
node cat_db_generator/scripts/generate_quiz_cli.js --all --publish
```

### 💊 3.2 Ingestion des Dictionnaires Pharmacologiques
```bash
# Ingestion et compilation de la base officielle BDPM
node scripts/ingest_bdpm.js

# Ingestion de la nomenclature pharmaceutique algérienne
node scripts/ingest_algerian_nomenclature.js
```

---

## 📄 4. PDF Lab, Indexation & Compression

Dr. CAT utilise un pipeline dual-folder : les originaux haute définition restent dans `data/pdf_masters/` pour l'IA RAG, tandis que les versions compressées sont servies dans l'APK.

```bash
# Ré-indexer tous les PDFs maîtres dans public/data/pdf_index.json
npm run reindex

# Compression Ultra Ghostscript (96 DPI + JPEGQ 60 + Bicubic downsampling)
npm run compress:pdfs

# Suppression intégrale et sécurisée d'un PDF (originaux, public, cache RAG et index)
node scripts/delete_pdf.js "nom_du_fichier.pdf"

# Synchronisation et balisage automatique des spécialités sur les PDFs
node scripts/sync_pdf_index.js
node scripts/tag_pdf_specialties.js
```

---

## 📱 5. Compilation, Bundling & Déploiement

### 📦 5.1 Compilation des Données & Bundles Web
```bash
# Recompile les bases minifiées public/data/cats_db.json et auto-tamponne worker /api/version
npm run build

# Génère le bundle JS minifié autonome de production (public/dist/app-*.js)
npm run build:bundle
```

### 📱 5.2 Synchronisation & Compilation Android APK
```bash
# Synchronise Capacitor et exécute le durcissement de sécurité (suppression des JS bruts)
npm run cap:sync

# Compilation Release de l'APK Android (avec obfuscation R8)
cd android && ./gradlew assembleRelease
# L'APK compilé se trouve dans : android/app/build/outputs/apk/release/app-release.apk
```

### ⚡ 5.3 Déploiement Cloudflare Worker (Edge)
```bash
# Déploie le worker.js et les assets statiques vers Cloudflare Edge
npx wrangler deploy

# Patch anti-crash Termux pour wrangler (exécuté automatiquement au postinstall)
bash scripts/termux-wrangler-fix.sh
```

---

## 🧪 6. Suites de Tests Automatisées

Dr. CAT intègre 11 suites de tests automatisées garantissant la robustesse médicale, la sécurité et la stabilité de l'interface.

```bash
# Exécution de la suite complète maîtresse (11 suites de tests unitaires et d'intégration)
npm run test:suite

# Tests unitaires spécifiques :
node tests/test_medical_validator.js   # Validation des posologies & plafonds DCI
node tests/test_auth_security.js       # Isolation localhost, tokens & rate-limiting
node tests/test_telemetry.js           # Déduplication SHA-256 des rapports de crash
node tests/test_pdf_compression.js     # Intégrité des flux PDF

# Tests headless Puppeteer (Interface utilisateur) :
npm run test                           # Smoke tests rapides
npm run test:safe                      # Vérification des safe-areas (encoches & barres d'état)
npm run test:console                   # Détection des erreurs JavaScript console
npm run test:theme                     # Rendu du thème sombre / clair
```

---

## 📊 Matrice Récapitulative des Commandes npm

| Commande npm | Script Sous-Jacent | Domaine d'Application |
| :--- | :--- | :--- |
| `npm start` | `server.js` | Démarrage serveur avant-plan |
| `npm run start:admin` | `server.js` (`ADMIN_PASSWORD=admin123`) | Démarrage direct mode admin |
| `npm run set:password` | `set_admin_password.js` | Réinitialisation mot de passe admin |
| `npm run set:domain` | `scripts/update_domain.js` | Migration de domaine Cloudflare |
| `npm run set:provider` | `set_server_provider.js` | Configuration des URLs distantes |
| `npm run pm2:start` | `ecosystem.config.js` | Démarrage démon arrière-plan |
| `npm run pm2:status` | `pm2 list` | Statut du démon |
| `npm run pm2:logs` | `pm2 logs drcat --lines 50` | Logs en direct |
| `npm run pm2:restart` | `pm2 restart drcat` | Redémarrage du serveur |
| `npm run pm2:stop` | `pm2 stop drcat` | Arrêt du serveur |
| `npm run generate` | `cat_db_generator/generate_cat_db.js` | Génération & validation IA de CATs |
| `npm run reindex` | `index_pdfs.js` | Indexation des PDFs maîtres |
| `npm run compress:pdfs`| `scripts/compress_pdfs.js` | Compression haute performance PDFs |
| `npm run build` | `build.js` | Compilation statique & estampillage |
| `npm run build:bundle` | `build-bundle.js` | Minification JS production |
| `npm run cap:sync` | `@capacitor/cli` + `clean_android_assets.js` | Sync & durcissement assets Android |
| `npm run bump` | `scripts/bump_version.js` | Incrémentation de version globale |
| `npm run test:suite` | `tests/run_all_tests.js` | Suite complète de 11 tests |

---

## 🔗 Documents Liés
- 🚀 [Guide d'Onboarding Développeur](file:///data/data/com.termux/files/home/med/docs/02-guides/developer-onboarding.md)
- 🛡️ [Architecture de Sécurité & Isolation](file:///data/data/com.termux/files/home/med/docs/01-architecture/security-isolation.md)
- 🤖 [Moteur LLM & Validation Canaries](file:///data/data/com.termux/files/home/med/docs/01-architecture/llm-generation-engine.md)
- 🧪 [Registre des Suites de Tests](file:///data/data/com.termux/files/home/med/docs/03-reference/test-suites-ledger.md)
