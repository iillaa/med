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

### 📄 Intégration PDF de Référence
- Association automatique des fichiers PDF de votre répertoire `reference-pdfs` avec la fiche active selon des mots-clés configurables.
- Section *Manuels Généraux* pour un accès permanent à vos gros ouvrages (guides d'ordonnances, manuels).
- **Recherche plein texte** dans le contenu des 78 PDFs indexés, avec affichage des extraits de contexte pertinents.

### 👤 Système Collaboratif (Admin / Utilisateurs)
- Les **utilisateurs non-admin** peuvent proposer des modifications ou ajouts de fiches (via un système de suggestions).
- L'**administrateur** valide ou rejette les suggestions depuis le panneau de modération sur le tableau de bord.
- Mode admin activé par un token de session sécurisé, jamais stocké en clair côté serveur.

---

## 🔐 Sécurité

### Authentification Admin
- **Mot de passe sécurisé** stocké dans `admin_password.txt` (exclu du git via `.gitignore`).
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
├── cats_db.json                 # Base de données des fiches CAT (JSON)
├── cats_db.json.bak             # Sauvegarde automatique (créée avant chaque écriture)
├── suggestions.json             # File d'attente des suggestions en attente de modération
├── pdf_index.json               # Index de recherche plein texte des PDFs (~1 MB)
├── admin_password.txt           # Mot de passe admin (⚠️ hors git)
├── package.json                 # Dépendances Node.js
├── cat-med/
│   └── reference-pdfs/          # Vos fichiers PDF/DOCX de cours médicaux (78 fichiers)
└── public/                      # Interface Frontend statique
    ├── drcat_logo.png           # Logo officiel (stéthoscope & croix médicale en C)
    ├── index.html               # Structure HTML5 de l'application
    ├── style.css                # Design sombre clinique (glassmorphism, responsive)
    └── js/
        ├── main.js              # Point d'entrée, orchestration, admin auth
        ├── api.js               # Couche de communication avec l'API serveur
        ├── state.js             # État global de l'application
        └── components/
            ├── sidebar.js       # Sidebar, recherche, filtres, liste des fiches
            ├── workspace.js     # Vue détaillée d'une fiche CAT (tabs, éditeurs)
            ├── dashboard.js     # Tableau de bord, stats, modération admin
            └── quiz.js          # Moteur du système de quiz (QCM + rédaction)
```

---

## 🛠️ Lancement

### Manuel (Termux)

```bash
cd ~/med
node server.js
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
1. Switch to the `light-android` branch.
2. Build assets: `node build.js && npx cap sync`.
   * **Note on Server URL**: During the build, the compiler reads the target server URL from `remote_server_config.json` and automatically bakes it into the app via `public/js/remote_config.js`. This allows the offline APK to fetch updates and send suggestions to your server when online.
3. The standalone APK is built automatically on push to the `light-android` branch via GitHub Actions workflows and can be downloaded from the Actions Run page.

---

## 📄 Documentation de Référence

Consultez les fichiers suivants pour plus de détails techniques :
* [Architecture Technique](file:///data/data/com.termux/files/home/med/technical_architecture.md) — Choix techniques, sécurité et gestion des données hors-ligne.
* [Guide du Développeur](file:///data/data/com.termux/files/home/med/developer_guide.md) — Workflow Git, commandes CLI et configuration.
* [Plan du Code (Codemap)](file:///data/data/com.termux/files/home/med/codemap.md) — Organisation des fichiers et dossiers.
* [Leçons Apprises](file:///data/data/com.termux/files/home/med/lessons_learned.md) — Erreurs évitées et astuces techniques de débogage.
