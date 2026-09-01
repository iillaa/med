# 📱 Guide : Compilation, Durcissement & Packaging de l'APK Android

> **Quadrant Diátaxis** : *02-Guides (How-To Guides)*  
> **Statut** : Production (v1.17.0+)  
> **Composants Clés** : `package.json`, `scripts/clean_android_assets.js`, `android/app/build.gradle`, `build.js`

---

## 🎯 1. Vue d'Ensemble & Objectifs de Durcissement

La compilation du binaire Android (`.apk`) de Dr. CAT applique un protocole d'obfuscation et de durcissement anti-décompilation strict :
- **Zéro Fichier Source en Clair** : Les répertoires de développement (`components/`, `lib/`, `workspace/`, `main.js`, `api.js`) sont physiquement exclus du binaire final.
- **Bundle Unique Minifié** : Seul le bundle unifié `public/dist/app-*.js` et les dépendances d'amorçage minimales (`pdf.min.js`, `version-checker.js`) sont embarqués.
- **Minification R8 & Shrinking** : Suppression des classes et ressources natives inutilisées.

---

## 🚀 2. Procédure de Compilation Pas-à-Pas

### Étape 1 : Construction du Bundle Frontend Minifié
Générez le bundle de production optimisé via esbuild :
```bash
npm run build
```
Cette commande :
1. Minifie l'intégralité du code JavaScript client dans `public/dist/`.
2. Génère les empreintes de cache-busting dans `public/index.html` et `public/style.css`.
3. Met à jour la version de build dans les métadonnées.

---

### Étape 2 : Synchronisation & Nettoyage des Assets Android
Exécutez la commande dédiée de synchronisation Capacitor :
```bash
npm run cap:sync
```
> [!IMPORTANT]
> Cette commande exécute séquentiellement :
> 1. `npx cap sync android` (copie des fichiers Web vers Android).
> 2. `node scripts/clean_android_assets.js` (suppression immédiate des fichiers sources non compilés du dossier `android/app/src/main/assets/public/js/`).

---

### Étape 3 : Compilation du Binaire APK

Basculez dans le répertoire Android et lancez la compilation Gradle :

```bash
cd android

# Pour une version Release optimisée & obfusquée :
./gradlew assembleRelease

# Pour une version Debug de test local :
./gradlew assembleDebug
```

L'APK compilé se trouve dans :
`android/app/build/outputs/apk/release/app-release-unsigned.apk`

---

## 🔍 3. Vérification Anti-Décompilation du Binaire

Pour valider qu'aucune source en clair n'a fuité dans le binaire :

1. Décompressez l'APK compilé avec `unzip` ou ouvrez-le dans un décompilateur (`jadx` / `apktool`) :
   ```bash
   unzip -l android/app/build/outputs/apk/release/app-release-unsigned.apk "assets/public/js/*"
   ```
2. **Résultat Attendu** :
   - ✅ Présence de `assets/public/dist/app-*.js`
   - ✅ Présence de `assets/public/js/lib/pdf.min.js`
   - ✅ Présence de `assets/public/js/version-checker.js`
   - 🚫 **Absence Totale** des dossiers `components/`, `workspace/`, `dashboard/` et des fichiers `main.js`, `api.js`, `utils.js`.

---

## 🔗 Liens & Documents Associés
- 🛡️ [Architecture de Sécurité & Isolation](file:///data/data/com.termux/files/home/med/docs/01-architecture/security-isolation.md)
- 🛠️ [Guide Onboarding Développeur](file:///data/data/com.termux/files/home/med/docs/02-guides/developer-onboarding.md)
- 📜 [ADR-003 : Protection du Stockage lors du Verrouillage](file:///data/data/com.termux/files/home/med/docs/04-decisions-adr/adr-003-storage-safe-kill-switch.md)
