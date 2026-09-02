# Dr. CAT — Rappel Clinique de Poche 🩺 (v1.15.0)

**Dr. CAT** est une application web et mobile de révision clinique haute performance (PWA & APK Capacitor), conçue pour tourner localement sur un smartphone Android via **Termux** et s'ouvrir directement dans votre navigateur mobile ou en APK natif 60 FPS.

Elle permet à un médecin généraliste de maîtriser **62 cas pratiques de Conduite à Tenir (CAT)**, de s'entraîner avec un système de **cas cliniques réels et docimologie médicale avancée**, de conserver des notes cliniques personnelles, de gérer des ordonnances types adaptatives, et d'accéder instantanément à son corpus de **84 manuels PDF de référence indexés**.

---

## 🚀 Fonctionnalités Clés

### 📚 Fiches Cliniques (CAT)
- **62 fiches de pratique médicale quotidienne** en français : Diagnostic, Examen clinique, Signes de gravité (Red Flags), Prise en charge thérapeutique et Orientation spécialisée.
- Chaque fiche est enrichie de règles claires d'**Orientation et Avis Spécialisé** (quand et vers quel spécialiste référer le patient).
- Filtres rapides par **statut d'apprentissage** (`À faire`, `En cours`, `Maîtrisé`) et filtre prioritaire ⚠️ **Red Flags** pour les urgences vitales.
- Barre de recherche omni-search instantanée (Ctrl+K / Cmd+K) : recherche full-text dans les fiches, les 84 livres PDF et la pharmacopée.

### 🧠 Mode Quiz Docimologique & Cas Cliniques Réels (v1.15.0)
- **Cas Cliniques Multi-Étapes (KFQs & SCTs)** : Simulation de cas réels progressifs (Anamnèse ➔ Examen physique & Constantes ➔ Examens complémentaires ➔ Décision thérapeutique).
- **QCMs Diagnostics & Sémiologie** : Distracteurs plausibles et pièges cliniques contextualisés.
- **QCMs d'Ordonnances & Posologies** : Validation des schémas posologiques, adaptation rénale/hépatique, et contre-indications formelles.
- **Justifications & Rationale Détaillés** : Explication systématique du raisonnement médical pour chaque question.
- **Questions Rédactionnelles (Free Recall)** : Rédiger de mémoire les Red Flags critiques et les ordonnances complètes.
- **Architecture à Double Base Découplée** : Séparation stricte entre le Staging Studio (`quiz_db_staged.json`) et la production minifiée client (`public/data/quiz_db.json`).

### 🧪 Command Center des Laboratoires & IA
- Accès centralisé aux 3 grands studios de développement et d'administration :
  - 🩺 **CAT Generator Lab** (`/admin/cat_generator_lab.html`) : Moteur de synthèse IA Dual-RAG V3.5, validation anti-hallucination et ordonnances conformes.
  - 🧠 **Quiz Lab & Staging Studio** (`/admin/quiz_lab.html`) : Studio dédié 1440px de génération IA en 1-clic et modération des banques de questions.
  - 📄 **PDF Master Lab & Slicer** (`/admin/pdf_lab.html`) : Découpage de pages, extraction OCR haute précision et synchronisation GPS du sommaire.


### 💊 Ordonnances Types Multiples & Adaptatives
- Modèles d'ordonnances réalistes éditables.
- Support des **variantes** via séparateurs `--- Nom de la Variante ---` (ex: `--- Adulte ---` / `--- Enfant ---`). Les boutons de navigation sont générés automatiquement.
- Bouton de **copie en 1 clic** de la variante active dans le presse-papier.

### 🩺 Prescriptions de Grade Médical & Moteur Local-First (v1.5.2)
- **Hiérarchisation à 3 Niveaux** : Distinction stricte entre traitement de 1ère intention, alternatives thérapeutiques (`[OU]`), et traitements symptomatiques adjuvants.
- **Pondération Thérapeutique Locale** : Priorisation des molécules disponibles et courantes en pratique locale (ex: Ascabiol, Spasfon, Tiorfan, Smecta).
- **Sécurité Anti-Polypharmacie** : Alertes et garde-fous intégrés pour éviter les sur-prescriptions et interactions médicamenteuses.

### 📝 Notes Personnelles & Observations
- Zone de prise de notes persistantes, sauvegardées localement dans `localStorage`.
- Idéal pour documenter vos protocoles locaux ou adaptations spécifiques.

### 📄 Architecture PDF 2-Dossiers & Compression Ultra Ghostscript
- **Pipeline 2-Dossiers (`data/pdf_masters/` vs `public/pdfs/`)** : Découple l'extraction IA haute précision de l'empaquetage mobile APK.
  - `data/pdf_masters/` : Stocke les originaux non-compressés pour une extraction IA à 100% de précision (LlamaParse / Gemini). Dossier exclu de Git.
  - `public/pdfs/` : Stocke les PDFs ultra-compressés pour le web mobile et le bundle APK.
- **Moteur de Compression Ghostscript (`npm run compress:pdfs`)** : Réductions de taille de fichier jusqu'à **80%** (96 DPI + JPEGQ 60 + filtrage bicubique) tout en conservant la netteté des schémas cliniques sur mobile.
- **Recherche plein texte** dans les PDFs indexés avec ouverture directe à la bonne page.
- **Minification des données client** : `build.js` minifie automatiquement `pdf_index.json`, `pdf_list.json` et `cats_db.json` (-35% de poids de transfert JSON).

### 📱 Optimisation Capacitor Mobile APK (60 FPS Native Feel)
- Acceleration matérielle GPU (`hardwareAccelerated="true"` & `largeHeap="true"` dans `AndroidManifest.xml`).
- Schéma sécurisé HTTPS (`androidScheme: "https"`) dans `capacitor.config.json`.
- Neutralisation des délais tactiles (300ms) via CSS touch rules & `requestAnimationFrame` gesture throttling.
- Event Delegation sur la liste des fiches (`#cat-list`) pour minimiser la consommation RAM/CPU.

### 🧩 Générateur de Sous-Fiches Ciblées & Architecture Option C (v1.10.0)
- **Pré-Sélection Multi-Profils (Option C)** : Choix dès la fenêtre de création entre le **Mode ⚡ Standard (1-Tab Rapide)** et le **Mode 🧩 Multi-Profils & Sous-Fiches**.
- **6 Presets Cliniques Recommandés en 1-Clic** :
  - `🤰 Grossesse & Allaitement` : Pharmacologie CRAT exclusive, alternatives sécures (Sertraline, Paracétamol), élimination formelle des AINS et IEC/ARA2.
  - `👴 Sujet Âgé / Gériatrie` : Règle *"Start low, go slow"*, adaptation au DFG Cockcroft, proscription des anticholinergiques (Hydroxyzine) et BZD sédatives à demi-vie longue.
  - `👶 Pédiatrie & Nourrisson` : Posologies impératives en dose-poids (`mg/kg/j`) et formes galéniques sirops/gouttes.
  - `🚨 Forme Aiguë & Complication Urgente` : Détresse vitale, réanimation immédiate et seuils d'orientation SMUR.
  - `🫘 Insuffisance Rénale & Hépatique` : Ajustement posologique selon les paliers de clairance et toxicité d'élimination.
  - `🧠 Psychiatrie & Santé Mentale` : Grille RUD (Risque/Urgence/Dangerosité), plafonds de prescription des BZD (12 sem / 4 sem), et terminologie de la Loi sanitaire algérienne n° 18-11 (*Hospitalisation Libre* vs *Soins sans consentement*).
- **Profils Personnalisés Sur-Mesure** : Saisie libre d'un terrain spécifique (ex: *Salmonella, Dépression résistante, Patient sous AVK*).
- **Génération Ciblée à la Demande (Tiroir Inspecteur)** : Bouton `➕ Générer Sous-Fiche IA` directement dans la fenêtre d'inspection pour enrichir n'importe quelle fiche existante sans toucher au Master Hub.
- **Barre de Navigation Segmentée (Segmented Pills)** : Pilules interactives en haut de chaque fiche (`⭐ Fiche Principale`, `🤰 Grossesse`, etc.) permettant une bascule instantanée du *Summary*, des *Drapeaux Rouges* et de l'ordonnance dédiée.
- **Boucle de Validation Médicale Automatisée** : Checksum 8 couches avec boucle de rétro-action et 3 tentatives de correction en cas d'anomalie posologique.

### 🔬 PDF Lab 2.0 — Visual Ingestion & Curation Workbench (v1.13.0)
- **✂️ Découpage Visuel Interactif (Visual Slicer)** : Découpe de chapitres médicaux en fiches dédiées de 1 à 3 pages avec ajustement des curseurs haut/bas (+15px de marge de sécurité visuelle).
- **⚡ Découpage Zéro-Token (Héritage Direct Cache LlamaParse)** : Les sous-PDFs découpés héritent immédiatement du texte markdown de leur Master (`data/pdf_cache/`) et s'enregistrent dans `pdf_index.json` (`quality: llama_cached_slice`) sans consommer de tokens d'API.
- **🤖 Assistant IA Guidé par Squelette Déterministe** : Détection des chapitres et molécules par scanner d'en-têtes et DCI pour une segmentation chirurgicale sans hallucinations de limites.
- **🛠️ Workbench Human-in-the-Loop** : Cartes IA éditables en ligne (titre, spécialité, pathologie, pages), ajout manuel (`➕ Ajouter Fiche`), division de segments (`✂️ Scinder`), et navigation synchronisée vers le Canvas.
- **📦 Cycle de Vie & Archivage des Masters** : Archivage propre des livres sources traités vers `data/pdf_done/` pour éliminer le bruit du corpus, avec restauration en 1-clic à tout moment.
- **🎯 Sommaire GPS & Pointeur de Page (+90 pts)** : Algorithme de navigation directe reliant les pointillés du sommaire (`..... p.48`) aux pages exactes du chapitre.
- **📄 Ingestion Directe Markdown & Texte** : Import direct de cours et fiches de synthèse `.md` ou `.txt` créées avec le prompt de standardisation IA.
- **🧪 Espace Staging & Brouillons (`pdf_staging_index.json`)** : Sandbox sécurisée permettant d'éditer, auditer et tester les documents découpés avant leur promotion en production.
- **🏆 Évaluation Clinique par Golden Set** : Suite de 5 cas cliniques de référence pour détecter les dérives de qualité médicale avec boucle de correction automatique.

### 🏛️ Architecture RAG & Moteur de Synthèse V3.5 (v1.10.0)
- **🎯 Isolation "Pure Signal"** : Priorité absolue aux fiches dédiées et découpées. Lorsqu'un extrait précis existe, le moteur met en sourdine les gros manuels généralistes de 500 pages pour éliminer le bruit.
- **🧬 Précision RAG à 5 Champs Métadonnées** : Évaluation conjointe du *Titre*, de la *Spécialité*, des *Mots-clés médicaux*, des *Pointeurs Sommaire GPS*, et du *Contenu textuel*.
- **🌐 Recherche Web RAG & Mémorisation Persistante** : Mode Dual RAG activé par défaut avec mémorisation locale (`localStorage`), lien personnalisé praticien, et bascule fluide vers le mode 100% hors-ligne (3s).
- **🧠 Mémoire Active Learning** : Réinjection systématique des corrections et formulations manuelles du médecin dans le prompt Gemini lors des régénérations.

### 🛡️ Moteur de Validation Médicale & Big Data Pharmacopées (v1.10.0)
- **🇫🇷 Base de Données Publique des Médicaments (BDPM)** : Indexation de **15 857 spécialités pharmaceutiques autorisées** et **4 474 DCI** officielles.
- **🇩🇿 Nomenclature Algérienne des Médicaments (MSPRH / Chifa)** : Indexation de **4 627 médicaments commercialisés** (*Saidal, El Kendi, Biogalenic...*) avec formes galéniques et statut de remboursement.
- **👶 Plafonds Posologiques Pédiatriques (GPIP / HAS / Antibioclic)** : Contrôle strict des posologies au poids (`mg/kg/j`) et des limites d'âge (*Cyclines < 8 ans, Céfixime < 6 mois*).
- **🤰 Pare-feu Tératogène CRAT** : Blocage immédiat des prescriptions à risque majeur (*Valproate, Méthotrexate, Isotrétinoïne, AINS dès 24 SA, IEC/ARA2*).
- **⚠️ Intercepteur de Coquilles Létales** : Détection des erreurs de frappe mortelles (ex: *"500g"* au lieu de *"500mg"*).
- **🔒 Assainissement des Données de Production** : Filtrage strict de la télémétrie IA et de l'historique dans `cats_db.json` client pour protéger la propriété intellectuelle.

### 💾 SafeStorage & Protection des Données Utilisateur (v1.10.0)
- **Protection Anti-Suppression** : Les notes personnelles (`dr_cat_notes_*`), la progression d'apprentissage (`dr_cat_user_progress`), les révisions espacées Leitner (`dr_cat_leitner`) et les streaks de révision (`dr_cat_streak`) sont protégées par regex et **ne sont jamais effacées**.
- **Éviction LRU Automatique** : En cas de saturation du quota `localStorage` (5 MB), le système purge silencieusement les caches réseau transitoires (`dr_cat_synced_database*`) sans affecter les données cliniques du médecin.

### ⚡ Recherche Instantanée Pré-Indexée (v1.10.0)
- **Zéro Allocation Mémoire** : Pré-calcul de `cat._searchTokenStr` sur l'ensemble des 55+ fiches et sous-profils.
- **Recherche Multi-Mots Fluide à 60 FPS** : Filtrage sans saccades ni saccades tactiles lors de la frappe de requêtes composées (ex: *"colique spasfon"*, *"otite orl"*).

### 👤 Système Collaboratif & Lab Admin V3.5
- Les **utilisateurs non-admin** peuvent proposer des modifications ou ajouts de fiches (via un système de suggestions).
- L'**administrateur** valide ou rejette les suggestions depuis le panneau de modération sur le tableau de bord.
- **Dr. CAT Generator Lab V3.5 (`admin/cat_generator_lab.html`)** : Télémétrie SSE temps réel, éditeur Markdown interactif, sélecteur de sous-fiches Option C, et promotion 1-clic vers la production.
- **1-Tap Prompt Copy** : Boutons intégrés pour copier instantanément le Prompt Maître ou le Prompt de Standardisation dans le presse-papier.
- **Dr. CAT PDF Inspector** : Un laboratoire admin pour inspecter l'index PDF, voir et télécharger les structures JSON extraites, et forcer une ré-extraction AI ciblée.
- Mode admin activé par un token de session sécurisé, jamais stocké en clair côté serveur.

---

### ⚙️ Process Management & Reliability (v1.5.1)
- **PM2 Process Supervisor**: Server runs under PM2 for automatic crash recovery (restarts in 3 sec). See `ecosystem.config.js` for all tunable parameters.
- **Log Rotation** (`npm run log:rotate`): Auto-rotates server logs when they exceed 10 MB. Archives pruned after 7 days.
- **Key PM2 Commands**: `npm run pm2:start` / `pm2:stop` / `pm2:restart` / `pm2:status` / `pm2:logs`.

### 🔒 Sécurité & Hardening APK Production (Anti-Décompilation)
- **Hardening Assets APK (`npm run cap:sync`)** : Filtrage automatique des fichiers sources de développement non-minifiés (`components/`, `lib/`, `workspace/`, `dashboard/`, `main.js`, `api.js`, `utils.js`). Les outils de rétro-ingénierie (`apktool`, `jadx`, `unzip`) ne trouvent **que** le bundle de production minifié `dist/app-*.js`.
- **Exclusion AAPT Native (`build.gradle`)** : Règle `ignoreAssetsPattern` au niveau du compilateur Android empêchant tout empaquetage de code source brut dans le fichier `.apk`.
- **Obfuscation Bytecode Android R8** : `minifyEnabled true` et `shrinkResources true` activés pour obscurcir le code Java native.
- **Protection des Données Utilisateur (`version-checker.js`)** : Le système de Kill Switch / Lock Screen bloque strictement l'interface lors des mises à jour obligatoires **sans jamais effacer le `localStorage`** (les notes personnelles `dr_cat_notes_*`, la progression `dr_cat_user_progress`, et les statistiques Leitner restent 100% conservées).
- **Hachage Mot de Passe PBKDF2** : Stockage du mot de passe admin avec hachage salé PBKDF2 (100 000 itérations).
- **Auteur & Droits d'Auteur** : Conçu et développé par **Dr. Kibeche Ali** (Affichage UI) / **Dr. Kibeche Ali Dia Eddine** (Métadonnées & Mentions Légales).

### Authentification Admin
- **Mot de passe sécurisé** salé et haché via PBKDF2.
- **Token de session aléatoire** (32 caractères hex) généré à chaque connexion. Stocké côté serveur en mémoire (`Set`), envoyé par header `x-admin-token`.
- **Toutes les routes d'administration** (modification/suppression de fiches, approbation de suggestions, ré-indexation PDF) vérifient ce token.
- La route `/api/login` est **restreinte à localhost uniquement** via vérification de l'adresse IP du socket TCP — impossible à usurper via le header `Host`.

### Visibilité du Bouton Admin (Localhost-Only UI)
- Le bouton **"Connexion Admin"** est **invisible par défaut** pour tous les utilisateurs distants.
- Au chargement de la page, le client interroge `/api/is-local` : le serveur vérifie l'IP réelle de la connexion TCP.
- Si `isLocal: false` → le bouton reste masqué. Si `isLocal: true` (appareil physique qui héberge le serveur) → le bouton apparaît.
- Un fallback client-side (`window.location.hostname`) s'active si le serveur ne répond pas.

### Protection XSS
- Toutes les données utilisateur (suggestions soumises) sont **échappées HTML** avant rendu dans le panneau de modération admin.
- Les titres de fiches et noms de catégories sont également assainis lors de leur injection dans le DOM.

---

## ⚡ Performance & Scalabilité (20+ Utilisateurs Simultanés)

- **Caches mémoire** : `cats_db.json`, `suggestions.json`, et `pdf_index.json` (~1 MB) sont chargés en RAM au démarrage. Les requêtes GET n'accèdent jamais au disque.
- **I/O Asynchrone** : Toutes les opérations fichier utilisent `fs.promises` (non-bloquant) pour ne pas geler le serveur pendant une sauvegarde.
- **Verrou d'écriture (`AsyncLock`)** : Les écritures en base sont sérialisées via une file d'attente légère pour éviter les corruptions en cas d'accès concurrents.
- **Cache PDF statique** : Les PDFs sont servis avec un cache HTTP `max-age=7d` pour réduire la consommation de données mobiles.
- *Résultat testé : 25 requêtes de recherche parallèles traitées en ~200 ms.*

---

## 📂 Architecture du Projet

```text
/data/data/com.termux/files/home/med/
├── server.js                    # Serveur Express.js (Backend, API, Auth, Cache)
├── index_pdfs.js                # Module d'indexation asynchrone du contenu des PDFs
├── build.js                     # Compilation des assets statiques
├── set_admin_password.js        # Script de définition du mot de passe admin
├── cats_db.json                 # Base de données des fiches CAT (JSON)
├── cats_db.json.bak             # Sauvegarde automatique (créée avant chaque écriture)
├── suggestions.json             # File d'attente des suggestions en attente de modération
├── admin_password.txt           # Mot de passe admin hashed (⚠️ hors git)
├── package.json                 # Dépendances Node.js
├── data/
│   └── pdf_cache/               # Cache local des structures PDF JSON extraites par l'AI
├── server/
│   ├── pdf_extractor.js         # Routeur 3-tiers (LlamaParse -> Google -> Offline)
│   └── parsers/                 # Modules d'extraction par API tierce
└── public/                      # Interface Frontend statique
    ├── index.html               # Structure HTML5 de l'application
    ├── pdf_viewer.html          # Visionneuse PDF intégrée avec surbrillance
    ├── pdf_lab.html             # Dr. CAT PDF Inspector (Admin Localhost uniquement)
    ├── pdfs/                    # Vos fichiers PDF de cours médicaux
    ├── manifest.json            # Manifest PWA pour installation mobile
    ├── service-worker.js        # Service Worker gérant le cache offline du client web
    └── js/
        ├── main.js              # Point d'entrée, orchestration, admin auth
        ├── api.js               # Couche de communication avec l'API serveur
        ├── state.js             # État global de l'application
        ├── utils.js             # Utilitaires globaux (escapes HTML, toasts, clipboard)
        ├── debug-console.js     # Console de débogage mobile (l'icône insecte 🐛)
        ├── performance.js       # Module de télémétrie et de suivi de performance
        ├── server-providers.js  # Registre et détection des tunnels serveurs
        ├── remote_config.js     # Config générée avec les URLs distantes (⚠️ hors git)
        ├── lib/                 # Modules partagés réutilisables
        │   └── helpers.js       # Helpers partagés (isOfflineCat, mergeCatsWithLocalState)
        └── components/
            ├── sidebar.js       # Sidebar, recherche, filtres, liste des fiches
            ├── workspace.js     # Vue détaillée d'une fiche CAT (tabs, éditeurs)
            ├── dashboard.js     # Tableau de bord, stats, modération admin
            ├── quiz.js          # Moteur du système de quiz (QCM + rédaction)
            ├── diagnostics.js   # Panneau d'outils de diagnostics cliniques
            └── performance.js   # Panneau de télémétrie et journal d'événements
    ```

---

## 🛠️ Lancement

### Manuel (Termux)

```bash
cd ~/med
npm start
```

Ouvrez ensuite [http://localhost:3000](http://localhost:3000) dans votre navigateur.

### Raccourci Écran d'Accueil

L'application est pré-configurée avec le widget Termux. Cliquez sur le widget **`start_med.sh`** pour démarrer le serveur et ouvrir automatiquement le navigateur.

---

## 🔒 Intégrité des Données

- **Sauvegarde automatique `.bak`** : Le fichier original est copié avant chaque écriture.
- **Écriture atomique** : Les données transitent d'abord par un fichier `.tmp`, puis sont renommées — garantissant que le fichier principal n'est jamais corrompu en cas de coupure.

---

## 📱 Standalone Android App (Offline Mobile Mode)

For offline clinical usage without running the Termux server:
1. Build assets on the active branch: `node build.js && npx cap sync`.
    * **Note on Server URL**: During the build, the compiler reads the target server URL from `remote_server_config.json` and bakes it into the app via `public/js/remote_config.js`, so the offline APK can fetch updates and send suggestions when online. At runtime the server is the single source of truth for the provider list: configure it once with `node set_server_provider.js "https://your-tunnel.ngrok-free.dev"` (or the `REMOTE_SERVER_URL` CI secret), and the app learns the authoritative list from `GET /api/server-providers` with automatic failover/load-balancing across servers.

---

## 🚀 Server Providers & Shortcuts

### Managing remote server URLs

The app supports multiple remote server URLs for failover and load balancing. The single source of truth is `remote_server_config.json`.

**Add URLs (merge — keeps existing):**
```bash
node set_server_provider.js "https://new-tunnel.ngrok-free.dev"
```

**Replace all URLs (reset):**
```bash
node set_server_provider.js --reset "https://only.ngrok-free.dev"
```

**Multiple URLs (comma-separated):**
```bash
node set_server_provider.js "https://a.ngrok-free.dev,https://b.trycloudflare.com"
```

**Interactive mode:**
```bash
node set_server_provider.js
# Paste URLs (comma or newline separated)
```

> ⚠️ After changing URLs, rebuild with `node build.js` so the client-side config (`public/js/remote_config.js`) is updated.

### Shortcut scripts (`shortcuts/`)

| Script | Purpose |
|--------|---------|
| `shortcuts/start_med.sh` | Start ngrok + server. Auto-detects ngrok (PATH or `./ngrok`), syncs new tunnel URL to config, then starts server. |
| `shortcuts/stop_med.sh` | Stop server and ngrok tunnel. |
| `shortcuts/status_med.sh` | Show running status and public URL. |
| `shortcuts/open_app.sh` | Start server locally only (no tunnel). |
| `shortcuts/inspect_med.sh` | Open ngrok inspect UI (requires ngrok running). |

**Recommended workflow:**
```bash
shortcuts/start_med.sh   # Start everything (ngrok + server + open browser)
# ... use the app ...
shortcuts/stop_med.sh     # Clean shutdown
```

> The `start_med.sh` script automatically updates `remote_server_config.json` with the ngrok-assigned URL each time it runs. No manual config editing needed.

---

## ⚡ Architecture Serverless Cloudflare Edge & Protocole ACK (v1.19.0)

### ☁️ Moteur Edge Cloudflare Workers (`worker.js` & `wrangler.jsonc`)
- **Execution 24/7 sur Edge Cloudflare** : `https://drcat.is-an-app.workers.dev` exécute nativement les endpoints `/api/suggestions`, `/api/server-providers`, `/api/search-status`, et `/api/version` en ~90ms (**HTTP 200 OK**) sans nécessiter que le serveur Termux soit en ligne.
- **Stockage Cloudflare KV (`SUGGESTIONS_KV`)** : Les suggestions soumises par les utilisateurs du monde entier sont enregistrées 24h/24 dans la base clé-valeur Cloudflare (`d569bf8299a545f182c9e6acedd4d6aa`).
- **Serveurs Multi-Fournisseurs avec Basculement** :
  - **Priorité 1 (Primaire)** : `https://drcat.is-an-app.workers.dev` (Edge Cloudflare, permanent 24/7)
  - **Priorité 2 (Secondaire)** : `https://rendition-duchess-dry.ngrok-free.dev` (Tunnel Ngrok Termux — serveur dynamique complet)
  - **Priorité 3 (Tertiaire)** : Tunnel `trycloudflare.com` (backup Termux)
- **Version Kill-Switch Auto-Timbrée** : `build.js` met automatiquement à jour le champ `version` de `/api/version` dans `worker.js` depuis `package.json` à chaque build. Le champ `minVersion` reste contrôlé manuellement (levier de mise à jour forcée).
- **Passerelle Domaine Public & Redirection** : `http://www.drcat.qd.je` (et `http://drcat.qd.je`) redirige en mode cloqué vers `https://drcat.is-an-app.workers.dev` via FreeDNS / DigitalPlat.

### 🔒 Sécurisation du Relay Cloudflare (v1.12.0 — Audit 0x-alpha)
- **Routes serveur-à-serveur verrouillées** : `GET /api/suggestions`, `POST /api/suggestions/ack` et `DELETE /api/suggestions/:id` exigent l'en-tête `x-sync-secret` (comparaison timing-safe SHA-256). Sans lui → **403**.
- **Soumission client préservée** : `POST /api/suggestions` reste ouvert (chemin de basculement quand ngrok est hors ligne) mais exige désormais l'en-tête `x-app-key` public.
- **Secret partagé en 2 endroits** : `.env` local (`SYNC_SECRET=...`) ET variable secrète du Worker Cloudflare (`npx wrangler secret put SYNC_SECRET --name drcat`). Ils doivent rester identiques.

### 🔄 Protocole de Synchronisation 2-Voies & Handshake ACK
1. **Sync Automatique au Démarrage** : Dès le lancement de `shortcuts/start_med.sh` (ou à l'ouverture du Panneau Admin), Termux interroge `GET /api/suggestions` sur Cloudflare KV (avec `x-sync-secret`) et fusionne automatiquement les nouvelles propositions dans `suggestions.json`.
2. **Accusé de Réception ACK (`POST /api/suggestions/ack`)** : Immédiatement après la mise en cache locale, Termux envoie la liste des identifiants reçus (`{ ids: [...] }`) à Cloudflare. Le Worker nettoie la file cloud pour garantir qu'aucune proposition n'est envoyée en double.
3. **Purge Cloud lors de l'Approbation/Rejet (`DELETE /api/suggestions/:id`)** : Lorsque l'administrateur valide ou rejette une proposition dans Termux, le serveur envoie un signal DELETE à Cloudflare KV pour purger définitivement la fiche du cloud.
4. **Approbation Intelligente Anti-Doublons (Upsert)** : Lors de l'approbation d'une fiche, le serveur vérifie la présence d'une CAT existante par ID ou titre identique et met à jour la fiche existante in-place au lieu de créer une carte orpheline en double.

---

## 🛡️ Journal d'Audit Sécurité (0x-alpha)

L'audit sécurité complet (13 vulnérabilités corrigées : clé API codée en dur, SSE non authentifié, relay Worker ouvert, APK release non signé en CI, perte de notes, XSS, cibles tactiles, validation Zod…) est documenté ici :
* [Ledger de vérification](file:///data/data/com.termux/files/home/med/todo0xalpha.md) — tableau bug → fix → commit → commande de vérification.
* [Détail technique](file:///data/data/com.termux/files/home/med/docs/security-hardening-v1.12.0.md) — analyse par surface (backend, edge, client, CI).

---

## 📄 Documentation de Référence & Architecture

Consultez la documentation complète organisée selon le modèle Diátaxis :
* 🗺️ **[Carte du Codebase (Living Codebase Map)](file:///data/data/com.termux/files/home/med/docs/01-architecture/codebase-map.md)** — Arborescence vivante, rôles des composants et flux de données.
* 🌐 **[Guide de Migration de Domaine](file:///data/data/com.termux/files/home/med/docs/02-guides/domain-migration-checklist.md)** — Checklist et automatisation `set:domain`.
* ⚡ **[Déploiement Cloudflare Wrangler](file:///data/data/com.termux/files/home/med/docs/02-guides/cloudflare-wrangler-deploy.md)** — Guide de déploiement Edge 24/7.
* 📱 **[Compilation Android APK](file:///data/data/com.termux/files/home/med/docs/02-guides/compiling-android-apk.md)** — Build Capacitor et hardening des assets.
* 🩺 **[Génération & Validation des CATs](file:///data/data/com.termux/files/home/med/docs/02-guides/generating-validating-cats.md)** — Pipeline IA et canaries de posologie.
