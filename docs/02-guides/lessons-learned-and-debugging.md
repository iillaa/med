# 💡 Leçons Apprises, Pièges Évités & Manuel de Débogage (Lessons Learned)

> **Quadrant Diátaxis** : *02-Guides (How-To Guides & Hard-Won Knowledge)*  
> **Statut** : Document vivant de référence (v1.19.0+)  
> **Utilité** : Recueil d'expériences sur les bugs complexes et vicieux résolus pour ne plus jamais perdre de temps si un symptôme similaire réapparaît.

---

## 🏛️ 1. Architecture & Intégrité des Données

### ⚡ Écriture Atomique des Fichiers JSON
- **Problème** : Si la tablette s'éteint ou que Termux est fermé brutalement pendant que `cats_db.json` ou `suggestions.json` est en train d'être écrit, le fichier est tronqué ou corrompu (taille 0 octet).
- **Solution (`data-store.js`)** : Écrire d'abord dans un fichier temporaire (`.tmp`), puis le renommer de façon atomique via `fs.renameSync()`. Si une coupure survient, l'ancienne base reste 100% intacte.

### 🔒 Préservation Absolue du Stockage Médecin (`localStorage.clear()` INTERDIT)
- **Problème** : L'activation d'un écran de mise à jour forcée ou d'une alerte sécurité appelant `localStorage.clear()` détruit irrémédiablement les notes médicales personnelles du praticien (`dr_cat_notes_*`), sa progression Leitner (`dr_cat_leitner`) et ses statistiques de révision.
- **Solution** : Les écrans de verrouillage bloquent l'interface visuelle mais ne vident **JAMAIS** le stockage utilisateur. Seul le cache réseau temporaire (`dr_cat_synced_db`) peut être purgé.

---

## 🎨 2. UI/UX, Navigateurs & View Transitions

### 🌊 Sursaut & Flash de 16 ms sous Firefox (View Transitions API)
- **Problème** : Lorsque `document.startViewTransition()` est appelé sous Gecko (Firefox), le navigateur affiche la nouvelle vue en plein écran pendant 1 frame (16 ms) avant que l'animation JavaScript ne démarre, provoquant un flash blanc/noir désagréable.
- **Solution** : Ajouter un pré-clip invisible dans le CSS dès l'initialisation :
  ```css
  html.is-firefox ::view-transition-new(root) {
    clip-path: circle(0px at var(--theme-x, 50%) var(--theme-y, 50%));
  }
  ```

### 💥 Écrasement des Modales contre la barre Chrome Tablette (`100vh` vs `100dvh`)
- **Problème** : Dans Chrome Android, `100vh` calcule la hauteur totale de l'écran sans déduire la barre d'adresse de Chrome. Les boîtes de dialogue (`<dialog>`, Mode Lecture) débordent de l'écran et s'écrasent contre la barre d'outils du haut sans aucun espace de respiration.
- **Solution** : Utiliser l'unité dynamique moderne `100dvh` :
  ```css
  .modal-card {
    max-height: min(680px, calc(100dvh - 48px));
    padding: max(20px, env(safe-area-inset-top)) 16px max(20px, env(safe-area-inset-bottom));
  }
  ```

### 🏎️ Réactivité Tactile & Délai de 300 ms sous Android WebView
- **Problème** : Par défaut, la WebView Android attend 300 ms après chaque clic sur un bouton pour vérifier si l'utilisateur tente un double-tap de zoom, ce qui donne une impression de lenteur "site web".
- **Solution** : Désactiver le double-tap sur tous les éléments interactifs :
  ```css
  .cat-item, .tab-btn, .action-btn {
    touch-action: manipulation;
    -webkit-tap-highlight-color: transparent;
  }
  ```

### 🚫 Élimination du Flash de Texte Brut au Rechargement (Anti-FOUC)
- **Problème** : L'utilisation de l'astuce `media="print" onload="this.media='all'"` pour différer le chargement CSS pousse le navigateur à afficher le squelette HTML brut et déstructuré à droite pendant une fraction de seconde avant d'appliquer les styles.
- **Solution** : Lier les feuilles de styles de l'application de façon synchrone et couvrir l'écran dès la 1ère milliseconde avec le splash `#app-loading-overlay` (`z-index: 999999`) qui s'estompe en fondu lorsque l'app est prête.

---

## 📱 3. Socle Android APK, Capacitor & Termux

### 🛡️ Durcissement Anti-Piratage & AAPT Asset Stripping
- **Problème** : Par défaut, Capacitor copie tous les fichiers JavaScript de développement non minifiés (`components/`, `lib/`, `main.js`) dans le dossier des assets de l'APK. N'importe qui décompilant l'APK avec `apktool` ou `jadx` pouvait lire le code source complet.
- **Solution** : 
  1. `clean_android_assets.js` supprime les sources de dev brutes dans `android/app/src/main/assets/public/js/`.
  2. `aaptOptions.ignoreAssetsPattern` dans `android/app/build.gradle` filtre définitivement les dossiers de dev à la compilation.
  3. L'APK de production ne contient que le bundle minifié `public/dist/app-*.js`.

### ⚡ Crash de Wrangler sous Termux arm64 (`workerd`)
- **Problème** : Le binaire `workerd` de Cloudflare ne supporte pas l'architecture Android arm64 et plante immédiatement au lancement de n'importe quelle commande `wrangler`.
- **Solution** : Le script `scripts/termux-wrangler-fix.sh` (exécuté automatiquement via `postinstall` dans `package.json`) injecte un shim pour neutraliser `workerd` et permettre à `wrangler whoami`, `secret put` et `deploy` de fonctionner parfaitement sur tablette.

### 🌐 Interception de la Page d'Avertissement Ngrok
- **Problème** : Lorsque l'application interroge le serveur Termux distant via Ngrok gratuit, Ngrok intercepte les requêtes AJAX et renvoie une page HTML d'avertissement au lieu de JSON, provoquant une erreur de syntaxe (`Unexpected token <`).
- **Solution** : Injecter automatiquement l'en-tête `ngrok-skip-browser-warning: true` dans toutes les requêtes AJAX via `api.js`.
