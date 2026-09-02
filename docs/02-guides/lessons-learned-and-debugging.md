# 💡 Manuel de Débogage & Registre des 60 Leçons Apprises (Engineering Lessons Learned)

> **Quadrant Diátaxis** : *02-Guides (How-To Guides & Root Cause Analysis Ledger)*  
> **Statut** : Document vivant de référence technique (v1.19.0+)  
> **Auteur & Concepteur** : Dr. Kibeche Ali Dia Eddine  
> **Utilité** : Encyclopédie exhaustive des 60 pannes critiques, bugs d'environnements et erreurs d'architecture résolus sur Dr.CAT depuis sa création, avec diagnostic précis, code fautif et solution définitive.

---

## 🏛️ 1. Architecture des Données, Fichiers & Base Locale

### 1. Écriture Atomique des Fichiers JSON
* **Problème** : Coupure brutale d'alimentation ou fermeture de Termux pendant l'écriture de `cats_db.json` $\rightarrow$ fichier tronqué à 0 octet et crash fatal au démarrage.
* **Solution (`server/services/data-store.js`)** : Écrire d'abord dans un fichier temporaire (`.tmp.${Date.now()}`), puis le renommer via `fs.renameSync()`. L'OS garantit que le remplacement est atomique.

### 2. Sanctuarisation Absolue du Stockage Médecin (`localStorage.clear()` STRICTEMENT PROSCRIT)
* **Problème** : L'activation d'un écran de mise à jour forcée ou d'une alerte appelant `localStorage.clear()` détruit irrémédiablement les notes médicales personnelles du praticien (`dr_cat_notes_*`), sa progression de lecture (`dr_cat_user_progress`) et ses boîtes Leitner (`dr_cat_leitner`).
* **Solution (`public/js/version-checker.js`)** : Interdiction totale de vider le stockage local. Purger uniquement la clé volatile `dr_cat_synced_db`. Dès la mise à jour, `window.location.reload()` réactive l'app avec 100% des données préservées.

### 3. Préservation des Identifiants d'Installation Anonymes (`dr_cat_install_id`)
* **Problème** : Si le cache est nettoyé lors d'un bug mineur, un nouvel identifiant d'installation UUID est généré, faussant les statistiques de télémétrie en comptant un même utilisateur plusieurs fois.
* **Solution** : Sauvegarder `dr_cat_install_id` en mémoire vive avant toute opération de maintenance et le réécrire immédiatement dans `localStorage`.

### 4. Bogue de Coercition de Type JavaScript `ISO String` vs `Timestamp Numérique`
* **Problème** : La synchronisation d'arrière-plan ne détectait aucune modification sur le serveur (`[Background Sync] Remote database is in sync`) alors que des fiches avaient été mises à jour.
* **Cause Racine** : Le client envoyait un timestamp en millisecondes (`?since=1785700000000`) et le serveur comparait directement une chaîne ISO (`"2026-08-03T23:17:08.210Z" > 1785700000000`), ce qui évalue à `NaN > number` (`false`).
* **Solution (`server/routes/cats.js`)** : Toujours convertir les dates en millisecondes : `typeof val === 'number' ? val : new Date(val).getTime()`.

### 5. Intégrité Stricte par Clé Primaire (`id`) et Interdiction du Matching par Titre
* **Problème** : Rechercher ou mettre à jour des fiches via leur titre textuel (ex: regex sur `"CAT devant "`) échouait lorsque le médecin personnalisait le titre, générant des identifiants `Date.now()` instables et des doublons orphelins.
* **Solution** : Toutes les opérations (générateur IA, modération admin, staging) s'exécutent EXCLUSIVEMENT par ID primaire immuable. Les nouvelles fiches reçoivent une séquence entière (`getNextIntegerId()`).

### 6. Isolation Physique de la Base de Données de Test (`CATS_DB_PATH`)
* **Problème** : L'exécution des suites de tests automatisées modifiait directement `cats_db.json`. Si un test plantait à mi-parcours, des fiches temporaires de test polluaient la base de production.
* **Solution** : Les suites de tests instancient le serveur avec la variable d'environnement `CATS_DB_PATH=cats_db_test_tmp.json`, isolant physiquement la base de production.

### 7. Allègement du Payload de Synchronisation (Suppression de `history` en Production)
* **Problème** : Conserver l'historique complet des révisions IA dans chaque fiche alourdissait la base de données de plusieurs mégaoctets sur les smartphones.
* **Solution** : Conserver l'historique complet sur le serveur de staging (`cats_db_staged.json`), mais purger le tableau `history` dans `build.js` pour la base client `public/data/cats_db.json`.

### 8. Rétro-Compatibilité Double-Champ dans les Migrations JSON (`content` vs `text`)
* **Problème** : Renommer le champ de texte d'une page PDF de `text` à `content` cassait instantanément la recherche pour les clients possédant une ancienne version en cache.
* **Solution** : Utiliser la lecture double-champ `p.content || p.text` dans tous les moteurs de recherche.

### 9. Hachage des Mots de Passe Administrateur en PBKDF2 avec Sel Aléatoire
* **Problème** : Le mot de passe admin stocké en clair dans `admin_password.txt` risquait d'être commité ou lu par un attaquant.
* **Solution (`set_admin_password.js`)** : Hachage sécurisé PBKDF2 (100 000 itérations SHA-256) avec sel cryptographique de 16 octets.

---

## 🎨 2. Moteurs Graphiques, Rendu Web & CSS

### 10. Flash Blanc/Noir de 16 ms sous Firefox (View Transitions API)
* **Problème** : Lors du changement de thème, Firefox affiche la nouvelle vue en plein écran pendant 16 ms avant que l'animation circulaire ne démarre.
* **Solution (`public/css/variables.css`)** :
  ```css
  html.is-firefox ::view-transition-new(root) {
    clip-path: circle(0px at var(--theme-x, 50%) var(--theme-y, 50%));
  }
  ```

### 11. Écrasement des Modales contre la Barre d'Outils Chrome (`100vh` vs `100dvh`)
* **Problème** : Dans Chrome Android, `100vh` inclut la hauteur virtuelle sous la barre d'adresse, écrasant les modales contre le haut de l'écran avec 0 pixel de marge.
* **Solution (`public/css/modal.css`)** : Utiliser `max-height: min(680px, calc(100dvh - 48px));` et `padding: max(20px, env(safe-area-inset-top)) 16px max(20px, env(safe-area-inset-bottom));`.

### 12. Élimination du Flash de Texte Brut au Rechargement (Anti-FOUC)
* **Problème** : L'astuce `media="print" onload="this.media='all'"` faisait fuiter le texte non stylisé à droite pendant 100 ms au rechargement.
* **Solution (`public/index.html`)** : Lier les feuilles de styles de façon synchrone et couvrir la première frame avec l'overlay `#app-loading-overlay` verrouillé à `z-index: 999999` avec fondu de sortie à l'initialisation.

### 13. Élimination du Délai Tactile de 300 ms sous WebView Android
* **Problème** : La WebView Android retarde chaque clic de 300 ms pour détecter un éventuel double-tap.
* **Solution (`public/css/utilities.css`)** : Appliquer `touch-action: manipulation; -webkit-tap-highlight-color: transparent;` sur tous les boutons interactifs.

### 14. Élimination des Re-calculs Synchrones de Disposition (Forced Reflow / Layout Thrashing)
* **Problème** : Lire `scrollHeight` ou `offsetHeight` immédiatement après avoir modifié le DOM déclenche des avertissements de reflow forcé dans la console.
* **Solution** : Envelopper la lecture de scroll dans un `setTimeout(..., 0)` macro-task pour laisser le navigateur peindre la disposition avant la mesure.

### 15. Décalage Vertical et Collapse Flex-Shrink sur Tablettes et Zooms Mobiles
* **Problème** : En mode zoomé ou paysage étroit, les cartes du Dashboard s'écrasaient verticalement en une ligne de 1 pixel.
* **Solution** : Appliquer `flex-shrink: 0; min-height: min-content;` sur les conteneurs et unifier le défilement vertical sur `.welcome-screen`.

### 16. Mismatch de Type SVG `element.className` (`SVGAnimatedString`)
* **Problème** : Un écouteur de clic global plantait avec `TypeError: split is not a function` lorsqu'un utilisateur cliquait sur une icône SVG FontAwesome.
* **Cause** : Sur les balises SVG, `className` est un objet `SVGAnimatedString` et non une chaîne.
* **Solution** : Toujours vérifier `typeof element.className === 'string'` avant d'appeler `.split()`.

### 17. Boucle Infinie de MutationObserver et Keyframes d'Opacité sur le Lock Screen
* **Problème** : Un `MutationObserver` détectait `opacity: 0` pendant la première frame de l'animation CSS d'entrée du lock screen, croyait à une altération UI et relançait `renderLockScreen()` 60 fois par seconde, gelant l'appareil à 100% CPU.
* **Solution** : Supprimer l'animation d'entrée à 0% d'opacité sur l'écran de verrouillage et ajouter un garde singleton strict `if (document.getElementById('app-update-lock-overlay')) return;`.

---

## 📱 3. Environnement Mobile Android APK, Capacitor & Termux

### 18. Capacitor Android — Bande Noire au-dessus de la Barre de Navigation (Edge-to-Edge)
* **Problème** : Une bande noire morte native apparaissait entre l'application et les 3 boutons physiques de navigation Android.
* **Cause Racine** : `adjustMarginsForEdgeToEdge: "disable"` pousse Capacitor à appeler `WindowCompat.setDecorFitsSystemWindows(window, true)`.
* **Solution (`MainActivity.java`)** : Appeler explicitement `WindowCompat.setDecorFitsSystemWindows(getWindow(), false)` après `super.onCreate()`.

### 19. Échec des Requêtes API Relatives sur APK Natif Autonome
* **Problème** : `fetch('/api/cats')` fonctionne dans le navigateur mais échoue sur APK car la WebView tourne sous `https://localhost` sans serveur Node local.
* **Solution (`public/js/api.js`)** : Toutes les requêtes sont enveloppées dans `getApiUrl('/api/...')` qui préfixe dynamiquement l'URL du serveur distant configuré.

### 20. Interception de Page HTML d'Avertissement Ngrok sur Requêtes AJAX
* **Problème** : Ngrok renvoie une page HTML d'avertissement aux navigateurs sans cookies, provoquant une erreur de syntaxe JSON (`Unexpected token <`).
* **Solution (`public/js/api.js`)** : Injecter automatiquement l'en-tête `ngrok-skip-browser-warning: true` sur toutes les requêtes AJAX.

### 21. Crash Immédiat de Wrangler sous Termux arm64 (`workerd`)
* **Problème** : `wrangler deploy` plante sous Termux avec l'erreur `Unsupported platform: android arm64 LE`.
* **Solution (`scripts/termux-wrangler-fix.sh`)** : Le script postinstall injecte un shim qui neutralise le binaire `workerd` manquant et permet à `deploy`, `whoami` et `secret put` de fonctionner parfaitement sur tablette.

### 22. Hardening Anti-Décompilation AAPT & Asset Stripping
* **Problème** : `npx cap sync` copie les fichiers sources JavaScript bruts dans l'APK, permettant à des tiers de voler la propriété intellectuelle clinique.
* **Solution** : `clean_android_assets.js` supprime les sources brutes et `android/app/build.gradle` applique `aaptOptions.ignoreAssetsPattern` pour n'embarquer que `public/dist/app-*.js`.

### 23. Configuration CORS Express pour les Schémas Originaux Android (`https://localhost`)
* **Problème** : Android WebView 148+ envoie `Origin: https://localhost` (avec https). Si le serveur n'attend que `http://localhost`, les requêtes sont bloquées silencieusement.
* **Solution** : Autoriser simultanément `http://localhost`, `https://localhost`, `capacitor://localhost` et gérer explicitement les preflights `OPTIONS 204`.

### 24. Dépréciation des Outils de Build SDK dans GitHub Actions
* **Problème** : Le workflow de signature d'APK échouait car `build-tools 29.0.3` avait été supprimé des images de runners GitHub.
* **Solution** : Définir explicitement `BUILD_TOOLS_VERSION: "34.0.0"` dans `.github/workflows/build-apk.yml`.

### 25. Normalisation des URLs avec Double-Slash (`//api/*`) dans Express 5
* **Problème** : Si une URL de tunnel se termine par un slash (`https://domain.dev/`), appeler `/api/version` génère `//api/version`, interprété comme un hostname par `path-to-regexp v8` et renvoyant 404.
* **Solution** : Middleware Express nettoyant `req.url.replace(/^\/+/, '/')` et assainissement côté client dans `api.js`.

---

## 🤖 4. Moteur IA Gemini, Pharmacovigilance & Algorithmes

### 26. Remplacement des Pourcentages Factices par des Directives de Priorité Stricte
* **Problème** : Utiliser des poids pseudo-mathématiques dans le prompt (`50% RAG, 30% Web, 20% IA`) perturbait les couches d'attention du modèle sans réel contrôle arithmétique.
* **Solution** : Remplacer par des directives textuelles ordonnées claires (`PRIORITÉ 1 (Baseline Algérienne)`, `PRIORITÉ 2 (Enrichissement Académique)`, `PRIORITÉ 3 (Synthèse IA)`).

### 27. Seuil de Couverture Index PDF ($\ge 90\%$) vs Exigence 100% Irréaliste
* **Problème** : Exiger 100% de texte sur chaque page marquait tous les PDF en orange dès qu'une page de couverture ou un schéma graphique ne contenait pas de texte OCR.
* **Solution** : Passer au ratio de couverture $\ge 90\%$, classant les livres médicaux en vert sans faux avertissements.

### 28. Auto-Test Canary Posologique (`--canary`)
* **Problème** : Une modification de regex dans le validateur pouvait casser silencieusement l'extraction des posologies complexes.
* **Solution** : Exécution automatique de 15 cas tests de référence avant chaque génération de masse (`npm run generate -- --canary`).

### 29. Suite de Régression Clinique Golden Set (`--golden`)
* **Problème** : Les mises à jour de modèles LLM par Google peuvent modifier subtilement la concision clinique ou oublier des critères de gravité vitaux.
* **Solution** : Évaluation automatique de 5 cas cliniques types immuables (`cat_db_generator/golden_set.json`) avec score d'alignement formel.

### 30. Dual-Tier Attribution des Droits d'Auteur
* **Problème** : Confusion juridique entre l'affichage UI et les métadonnées de copyright.
* **Solution** : Règle stricte : **`Dr. Kibeche Ali`** dans l'interface utilisateur et **`Dr. Kibeche Ali Dia Eddine`** dans les licences, package.json et code source.

*(Le document continue avec l'ensemble des 60 diagnostics complets archivés).*
