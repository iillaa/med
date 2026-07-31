# Dr. CAT — Rappel Clinique de Poche 🩺

**Dr. CAT** est une application web de révision clinique légère et premium, conçue pour tourner localement sur un smartphone Android via **Termux** et s'ouvrir directement dans votre navigateur mobile.

Elle permet à un médecin généraliste de maîtriser 55+ cas pratiques de **Conduite à Tenir (CAT)**, de s'entraîner avec un système de quiz interactif, de conserver des notes cliniques personnelles, de gérer des ordonnances types adaptatives, et d'accéder instantanément à ses cours PDF de référence.

---

## 🚀 Fonctionnalités Clés

### 📚 Fiches Cliniques (CAT)
- **55 fiches pré-remplies** en français : Diagnostic, Clinique, Red Flags, Orientation spécialisée.
- Chaque fiche est enrichie de règles claires d'**Orientation et Avis Spécialisé** (quand et vers quel spécialiste référer le patient).
- Filtres rapides par **statut d'apprentissage** (`À faire`, `En cours`, `Maîtrisé`) et filtre prioritaire ⚠️ **Red Flags** pour les urgences critiques.
- Barre de recherche full-text : filtre par titre, spécialité, contenu de synthèse, et signes de gravité.

### 🧠 Mode Quiz & Entraînement
- **Questions QCM** : Identifier la spécialité médicale d'un cas clinique parmi plusieurs propositions.
- **Questions Rédaction (write-in)** : Rédiger de mémoire les Red Flags / signes de gravité, ou l'ordonnance type complète — simule la réalité du cabinet.
- **Panel de correction automatique** : Comparaison côte-à-côte entre votre réponse et la fiche de référence officielle.
- **Navigation contextuelle persistante** : Bouton **"Ouvrir la Fiche Référence"** qui permet de quitter le quiz pour aller réviser la fiche associée, et de revenir instantanément au quiz sans perdre vos réponses en cours grâce au bouton **"Retour au Quiz"**.
- **Détection de mots-clés** : Identification et mise en valeur des termes médicaux importants trouvés dans votre réponse.
- **Auto-évaluation honnête** : Système de notation en 3 niveaux (100% / Partiel / Revoir).
- **Score final & historique détaillé** : Tableau de résultats par question avec bouton "Ouvrir la fiche de référence" directement depuis le quiz.
- **Configuration flexible** : Choix de la spécialité, du nombre de questions (5/10/15/20), et des types de questions.


### 💊 Ordonnances Types Multiples & Adaptatives
- Modèles d'ordonnances réalistes éditables.
- Support des **variantes** via séparateurs `--- Nom de la Variante ---` (ex: `--- Adulte ---` / `--- Enfant ---`). Les boutons de navigation sont générés automatiquement.
- Bouton de **copie en 1 clic** de la variante active dans le presse-papier.

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

### 👤 Système Collaboratif & Lab Admin
- Les **utilisateurs non-admin** peuvent proposer des modifications ou ajouts de fiches (via un système de suggestions).
- L'**administrateur** valide ou rejette les suggestions depuis le panneau de modération sur le tableau de bord.
- **Dr. CAT PDF Inspector** : Un laboratoire admin pour inspecter l'index PDF, voir et télécharger les structures JSON extraites, et forcer une ré-extraction AI ciblée.
- Mode admin activé par un token de session sécurisé, jamais stocké en clair côté serveur.

---

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

## 📄 Documentation de Référence

Consultez les fichiers suivants pour plus de détails techniques :
* [Architecture Technique](file:///data/data/com.termux/files/home/med/docs/technical_architecture.md) — Choix techniques, sécurité et gestion des données hors-ligne.
* [Guide du Développeur](file:///data/data/com.termux/files/home/med/docs/developer_guide.md) — Workflow Git, commandes CLI et configuration.
* [Plan du Code (Codemap)](file:///data/data/com.termux/files/home/med/docs/codemap.md) — Organisation des fichiers et dossiers.
* [Leçons Apprises](file:///data/data/com.termux/files/home/med/docs/lessons_learned.md) — Erreurs évitées et astuces techniques de débogage.
