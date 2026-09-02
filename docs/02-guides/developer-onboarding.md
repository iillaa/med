# 🛠️ Guide : Onboarding Développeur & Environnement Local (Termux / Linux)

> **Quadrant Diátaxis** : *02-Guides (How-To Guides)*  
> **Statut** : Production (v1.17.0+)  
> **Cibles** : Environnement Termux (Android arm64) & Postes de développement Linux / macOS

---

## 🎯 1. Prérequis Système

| Composant | Version Minimale | Notes & Spécificités |
| :--- | :--- | :--- |
| **Node.js** | `v20.0.0+` (Recommandé `v24.x`) | Runtimes natifs ESM et CommonJS supportés |
| **npm** | `v10.x+` (ou `v11.x` / `v12.x`) | Gestionnaire de dépendances |
| **Termux (Android)** | Version F-Droid récente | Nécessite `pkg install nodejs-lts git ghostscript` |
| **Ghostscript** | `gs 10.x+` | Requis pour la compression haute performance des PDFs |
| **Wrangler** | Géré via `npm install` | Patch automatique pour Termux via `termux-wrangler-fix.sh` |

---

## 🚀 2. Installation Pas-à-Pas

### Étape 1 : Cloner le Répertoire
```bash
git clone https://github.com/iillaa/med.git
cd med
```

### Étape 2 : Configuration du Fichier d'Environnement (`.env`)
Copiez le modèle et renseignez vos clés :
```bash
cp .env.example .env # ou créez votre fichier .env
```
Contenu minimal recommandé pour le développement :
```env
PORT=3000
NODE_ENV=development
ADMIN_PASSWORD=votre_mot_de_passe_securise
GEMINI_API_KEY=votre_cle_api_google_gemini
GEMINI_BLOCKLIST=preview,exp,experimental
SYNC_SECRET=votre_cle_hex_identique_au_worker
```

### Étape 3 : Définition du Mot de Passe Administrateur
Vous pouvez définir ou réinitialiser le mot de passe admin via la ligne de commande :
```bash
# Option A : Prompt interactif sécurisé
npm run set:password

# Option B : Définition directe en ligne de commande (hachage PBKDF2 automatique)
node set_admin_password.js mon_mot_de_passe_123
```

### Étape 4 : Installation des Dépendances
```bash
npm install
```
> [!NOTE]
> Le script de post-installation (`scripts/termux-wrangler-fix.sh`) s'exécute automatiquement pour neutraliser le binaire `workerd` incompatible avec Android arm64 et permettre l'utilisation sans crash de `wrangler`.

---

## 🏃 3. Démarrage du Serveur & Commandes Utiles

### Démarrage Simple (Mode Développement)
```bash
npm start
# Le serveur démarre sur http://localhost:3000
```

### Démarrage en Arrière-Plan avec PM2 (Recommandé sur Tablette Termux)
```bash
# Démarrer le daemon
npm run pm2:start

# Consulter l'état
npm run pm2:status

# Afficher les 50 dernières lignes de logs
npm run pm2:logs

# Arrêter ou redémarrer
npm run pm2:restart
npm run pm2:stop
```

---

## 🧪 4. Exécution des Suites de Tests

Pour valider l'intégrité de l'ensemble du système :

```bash
# Exécution de la suite complète (11 suites de tests automatisées)
npm run test:suite

# Test unitaire de validation médicale & pharmacologique
node tests/test_medical_validator.js

# Test unitaire d'isolation et de sécurité des tokens
node tests/test_auth_security.js

# Test unitaire de la télémétrie et déduplication des crashs
node tests/test_telemetry.js
```

---

## 📱 5. Synchronisation & Compilation Mobile (Android APK)

Si vous développez pour l'application Android :
```bash
# Synchronisation Capacitor + Nettoyage automatique des assets non compilés
npm run cap:sync

# Compilation Release APK avec obfuscation R8
cd android && ./gradlew assembleRelease
```

---

## 🔗 Liens & Documents Associés
- 💻 [Référence Complète des Commandes CLI](file:///data/data/com.termux/files/home/med/docs/03-reference/cli-commands-reference.md)
- 🛡️ [Sécurité & Isolation Localhost](file:///data/data/com.termux/files/home/med/docs/01-architecture/security-isolation.md)
- 📐 [Inventaire des Secrets & Variables d'Environnement](file:///data/data/com.termux/files/home/med/docs/03-reference/environment-secrets.md)
- 📜 [Registre des Suites de Tests](file:///data/data/com.termux/files/home/med/docs/03-reference/test-suites-ledger.md)
