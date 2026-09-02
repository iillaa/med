# 💡 Manuel de Débogage Approfondi & Leçons Apprises (Hard-Won Engineering Lessons)

> **Quadrant Diátaxis** : *02-Guides (How-To Guides & Root Cause Analyses)*  
> **Statut** : Document vivant de référence (v1.19.0+)  
> **Auteur** : Dr. Kibeche Ali Dia Eddine  
> **Objectif** : Consigner de manière exhaustive et ultra-détaillée les pannes vicieuses, les bugs d'environnements et les pièges d'architecture résolus sur Dr.CAT, avec le code fautif, le diagnostic et la solution définitive.

---

## 🏛️ 1. Architecture, Système de Fichiers & Données

### 🚨 Cas 1 : Corruption de Fichier JSON par Coupure Brutale
- **Symptôme** : Au redémarrage de la tablette après une batterie vide, `cats_db.json` ou `suggestions.json` fait 0 octet et l'application plante au parsing (`SyntaxError: Unexpected end of JSON input`).
- **Cause Racine** : Un appel direct à `fs.writeFileSync('cats_db.json', data)` vide d'abord le fichier existant avant d'écrire le nouveau flux. Si le système coupe à cet instant précis, le fichier reste vide.
- **Code Fautif** :
  ```javascript
  // ❌ DANGEREUX : Tronque le fichier avant écriture
  fs.writeFileSync(filePath, JSON.stringify(data, null, 2));
  ```
- **Solution Définitive (`server/services/data-store.js`)** :
  ```javascript
  // ✅ ATOMIQUE : Écrit dans un .tmp puis renomme via le système de fichiers
  const tempPath = `${filePath}.tmp.${Date.now()}`;
  fs.writeFileSync(tempPath, JSON.stringify(data, null, 2), 'utf8');
  fs.renameSync(tempPath, filePath); // Opération atomique garantie par l'OS
  ```

---

### 🚨 Cas 2 : Perte Irrémédiable des Notes Médicales lors des Mises à Jour
- **Symptôme** : Après un forçage de mise à jour ou un affichage d'alerte, un médecin rouvre l'application et constate que toutes ses annotations personnelles sur les fiches ont disparu.
- **Cause Racine** : L'écran de verrouillage de sécurité appelait `localStorage.clear()` pour forcer le rechargement des fiches depuis le serveur, détruisant au passage les clés `dr_cat_notes_*` et `dr_cat_leitner`.
- **Règle Architecturale Immuable** :
  ```javascript
  // ❌ STRICTEMENT INTERDIT
  localStorage.clear();
  sessionStorage.clear();
  indexedDB.deleteDatabase('DrCatDB');

  // ✅ AUTORISÉ : Purge ciblée des caches HTTP uniquement
  localStorage.removeItem('dr_cat_synced_db');
  window.location.reload(); // Restaure l'interface avec 100% des données utilisateur
  ```

---

## 🎨 2. Moteurs Graphiques, Navigateurs & Transitions UI

### 🚨 Cas 3 : Flash Blanc / Noir de 16 ms sous Firefox (View Transitions API)
- **Symptôme** : Lors du clic sur le bouton de thème sombre/clair sous Firefox (Gecko 144+), l'écran clignote brutalement pendant une fraction de seconde avant que l'onde circulaire ne commence.
- **Cause Racine** : Dès que le callback DOM de `startViewTransition` se termine, le moteur Gecko monte le pseudo-élément `::view-transition-new(root)` à 100% de couverture de l'écran pendant exactement 1 frame (16 ms) avant que la méthode `animate()` de la WAAPI ne s'exécute.
- **Solution Définitive (`public/css/variables.css`)** :
  ```css
  /* ✅ Pré-clip invisible à 0px pour que la vue naisse totalement masquée */
  html.is-firefox ::view-transition-new(root) {
    clip-path: circle(0px at var(--theme-x, 50%) var(--theme-y, 50%));
  }
  ```

---

### 🚨 Cas 4 : Écrasement des Modales contre la Barre Chrome Android (`100vh` vs `100dvh`)
- **Symptôme** : Sur tablette Android sous Chrome, les fenêtres modales (Ajout de CAT, Mode Lecture) sont étirées de force et viennent s'écraser contre la barre d'adresse du haut sans aucun espace d'aération (0 pixel de marge).
- **Cause Racine** : Sur mobile, Chrome calcule `100vh` comme si sa barre d'outils était masquée (en plein écran virtuel). La modale reçoit une hauteur plus grande que l'espace réel visible et pousse le contenu hors de la vue.
- **Solution Définitive (`public/css/modal.css`)** :
  ```css
  /* ✅ Utilisation du Dynamic Viewport Height avec marge de sécurité garantie */
  .modal-card, .reader-modal-content {
    height: auto;
    max-height: min(680px, calc(100dvh - 48px));
    margin: auto;
    padding: max(20px, env(safe-area-inset-top)) 16px max(20px, env(safe-area-inset-bottom));
  }
  ```

---

### 🚨 Cas 5 : Sursaut de Texte Brut au Rechargement (Anti-FOUC)
- **Symptôme** : Lors de l'actualisation (F5 / Refresh) sous Chrome, le site affiche pendant 100 ms une page blanche avec tous les textes empilés en vrac sur la droite avant de basculer sur le design final.
- **Cause Racine** : L'utilisation de l'attribut `media="print" onload="this.media='all'"` sur les balises `<link rel="stylesheet">` poussait Chrome à peindre le premier pixel sans aucune feuille de style.
- **Solution Définitive (`public/index.html`)** :
  1. Chargement synchrone standard des feuilles de styles CSS.
  2. Couverture totale de la première frame par l'overlay `#app-loading-overlay` verrouillé à `z-index: 999999`.
  3. Fondu de sortie (*fade-out*) en 320 ms lorsque le JavaScript confirme que l'interface est prête.

---

### 🚨 Cas 6 : Délai Tactile de 300 ms sous WebView Android
- **Symptôme** : Les clics sur les boutons de la barre latérale ou sur les cartes de CAT semblent "mous" et réagissent avec un temps de retard perceptible par rapport à une app native.
- **Cause Racine** : Le moteur WebView d'Android attend $\approx 300\text{ ms}$ après un appui pour déterminer si l'utilisateur va effectuer un second tap pour zoomer.
- **Solution Définitive (`public/css/utilities.css`)** :
  ```css
  /* ✅ Élimination du délai double-tap pour une réponse tactile immédiate à 0 ms */
  .cat-item, .tab-btn, .action-btn, .filter-btn, .calc-btn {
    touch-action: manipulation;
    -webkit-tap-highlight-color: transparent;
  }
  ```

---

## 📱 3. Socle Mobile Android APK, Capacitor & Termux

### 🚨 Cas 7 : Crash Immédiat de Wrangler sous Termux arm64 (`workerd`)
- **Symptôme** : `npx wrangler deploy` ou `npx wrangler whoami` crashe immédiatement sous Termux avec l'erreur : `Unsupported platform: android arm64 LE`.
- **Cause Racine** : Le binaire compilé `workerd` de Cloudflare n'est pas compilé pour l'architecture Android arm64.
- **Solution Définitive (`scripts/termux-wrangler-fix.sh`)** :
  - Un hook `postinstall` dans `package.json` patche automatiquement le module `@cloudflare/workerd-linux-arm64` pour injecter un stub compatible.
  - Les commandes distantes (`whoami`, `secret put`, `deploy`) fonctionnent parfaitement sans nécessiter l'émulateur local.

---

### 🚨 Cas 8 : Interception de Page HTML d'Avertissement Ngrok
- **Symptôme** : Lors des requêtes AJAX distantes vers Termux via un tunnel Ngrok gratuit, l'application reçoit du HTML au lieu du JSON attendu et plante avec `Unexpected token <`.
- **Cause Racine** : Ngrok affiche une page intermédiaire d'avertissement aux nouveaux visiteurs si un en-tête spécifique n'est pas fourni.
- **Solution Définitive (`public/js/api.js`)** :
  ```javascript
  // ✅ Injection automatique de l'en-tête de contournement Ngrok
  function getHeaders(extra = {}) {
    const headers = { 'Content-Type': 'application/json', ...extra };
    if (window.location.hostname.includes('ngrok') || remoteUrl.includes('ngrok')) {
      headers['ngrok-skip-browser-warning'] = 'true';
    }
    return headers;
  }
  ```

---

### 🚨 Cas 9 : Fuite du Code Source Brut dans l'APK Compilé
- **Symptôme** : Une décompilation de l'APK Android avec `apktool` permet de lire les fichiers JavaScript de développement non obfusqués dans `assets/public/js/components/`.
- **Cause Racine** : `npx cap sync` copie l'intégralité du répertoire `public/` sans filtrer les fichiers sources pré-bundle.
- **Solution Définitive (`android/app/build.gradle` & `clean_android_assets.js`)** :
  - `clean_android_assets.js` supprime les répertoires sources de développement après chaque synchronisation.
  - Gradle applique `aaptOptions.ignoreAssetsPattern` pour exclure définitivement les sources de l'archive binaire release.
