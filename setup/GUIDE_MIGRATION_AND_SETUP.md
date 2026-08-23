# 📖 Dr. CAT — Guide de Migration & Installation sur Nouvel Appareil
> **Auteur & Architecte** : Dr. Kibeche Ali Dia Eddine  
> **Application** : Dr. CAT (Doctor Clinical Action Protocol)  
> **Version** : v1.10.1+ | **Branche** : `beta-test-pr`

---

## 🎯 Objectif de ce Guide
Ce document vous donne **la procédure exacte étape par étape** pour transférer et faire tourner l'ensemble du projet Dr. CAT sur un **nouveau téléphone Android (Termux)** ou sur un **PC (Linux / macOS / Windows WSL)** après avoir cloné le code depuis GitHub.

---

## ⚡ 1. La Méthode Ultra-Rapide (Assistant Automatisé en 1 Commande)

Une fois le projet cloné, un **assistant d'installation interactif** configure tout automatiquement :

```bash
# 1. Cloner le projet depuis GitHub (Branche de travail)
git clone -b beta-test-pr https://github.com/votre-compte/med.git
cd med

# 2. Lancer l'assistant d'installation tout-en-un
node setup/setup_new_device.js
```

### 🪄 Ce que fait le script automatiquement :
1. ✅ Vérifie la version de Node.js (>= v18).
2. ✅ Installe toutes les dépendances (`npm install`).
3. ✅ Configure les clés d'API et le mot de passe Administrateur.
4. ✅ Compile et minifie les bundles de production (`npm run build`).
5. ✅ Télécharge et configure les tunnels réseau (`cloudflared` & `ngrok`).
6. ✅ Installe les raccourcis Termux:Widget et les commandes CLI globales (`med`).
7. ✅ Exécute la suite de tests médicaux pour valider que tout est 100% opérationnel.

---

## 🛠️ 2. La Méthode Manuelle (Étape par Étape)

Si vous préférez exécuter les commandes une par une :

### Étape 1 : Prérequis selon votre système
* **Sur Android (Termux)** :
  ```bash
  pkg update && pkg install nodejs git cloudflared -y
  ```
* **Sur Linux (Ubuntu / Debian)** :
  ```bash
  sudo apt update && sudo apt install nodejs npm git -y
  ```
* **Sur macOS** :
  ```bash
  brew install node git
  ```
* **Sur Windows** :
  * Utilisez **WSL2** (Windows Subsystem for Linux avec Ubuntu) ou Node.js pour Windows.

---

### Étape 2 : Cloner et Installer les Dépendances
```bash
git clone -b beta-test-pr https://github.com/votre-compte/med.git
cd med
npm install
```

---

### Étape 3 : Créer le Fichier `.env` (Clé d'API Gemini)
Créez le fichier `.env` à la racine du projet avec votre clé Google AI Studio :
```bash
echo "GEMINI_API_KEY=AIzaSy...VotreCleGeminiIci" > .env
echo "SESSION_SECRET=$(node -e 'console.log(require("crypto").randomBytes(32).toString("hex"))')" >> .env
```
> 💡 *Obtenez votre clé gratuite sur : [Google AI Studio](https://aistudio.google.com/app/apikey)*

---

### Étape 4 : Définir votre Mot de Passe Administrateur
```bash
npm run set:password
# ou directement :
node set_admin_password.js "MonSuperMotDePasse"
```

---

### Étape 5 : Compiler les Assets & Bundles
```bash
npm run build
```

---

### Étape 6 : Lancer Dr. CAT !
* **Mode Standard** :
  ```bash
  npm start
  ```
* **Mode Production avec PM2 (Redémarrage automatique en cas de crash)** :
  ```bash
  npm run pm2:start
  ```
* Accédez ensuite à l'application dans votre navigateur : **`http://localhost:3000`** ou **`http://localhost:8080`**.

---

## 🌐 3. Configuration des Tunnels & Réseau (Ngrok & Cloudflare)

### A. Tunnel Ngrok (Pour accéder à l'Admin Lab depuis l'extérieur)
1. Téléchargez Ngrok pour votre OS ([ngrok.com](https://ngrok.com)).
2. Ajoutez votre authtoken :
   ```bash
   ngrok config add-authtoken <VOTRE_TOKEN_NGROK>
   ```
3. Lancez votre tunnel vers le port 3000 :
   ```bash
   ngrok http 3000
   # ou avec votre domaine réservé :
   ngrok http --domain=rendition-duchess-dry.ngrok-free.dev 3000
   ```
4. Déclarez l'URL active dans Dr. CAT :
   ```bash
   npm run set:provider
   # Collez l'URL HTTPS de Ngrok
   ```

---

### B. Déploiement sur Cloudflare Workers (Rail Public OTA)
Pour publier la base de données et l'application sur votre sous-domaine Cloudflare (`drcat.dr-cat.workers.dev`) :

```bash
# 1. Vous connecter à votre compte Cloudflare (une seule fois)
npx wrangler login

# 2. Déployer en 1 clic
npx wrangler deploy
```

---

## 🧪 4. Commandes Utiles au Quotidien

| Commande | Action |
| :--- | :--- |
| `node setup/setup_new_device.js` | Assistant d'installation automatique pour nouvel appareil. |
| `npm start` | Démarre le serveur localement. |
| `npm run pm2:start` | Démarre sous supervision PM2 (arrière-plan + auto-restart). |
| `npm run pm2:status` | Affiche l'état du serveur (RAM, uptime, redémarrages). |
| `npm run pm2:logs` | Affiche les logs en direct. |
| `npm run pm2:stop` | Arrête le serveur PM2. |
| `npm run build` | Recompile les bundles JS/CSS et synchronise les bases minifiées. |
| `npm run setup:shortcuts` | Configure les raccourcis Termux:Widget et commandes CLI (`med`). |
| `med start` | Démarre les tunnels (Ngrok + Cloudflare) + serveur + navigateur. |
| `med local` | Démarre en local uniquement (mode éco-batterie). |
| `med stop` | Arrête proprement le serveur Node.js et les tunnels. |
| `med status` | Affiche l'état du serveur et des tunnels actifs. |
| `med inspect` | Ouvre le tableau de bord d'inspection Ngrok. |
| `npm run set:password` | Modifie le mot de passe d'accès Administrateur. |
| `npm run set:provider` | Met à jour l'URL du tunnel Ngrok / Cloudflare. |
| `npm run log:rotate` | Archive et nettoie les fichiers de logs volumineux. |

---

## 🛡️ 5. Que faire de vos données personnelles ?
* **Vos fiches de notes et historique** sont protégés par le stockage local du navigateur (`localStorage`/`IndexedDB`).
* **La base de données principale (`cats_db.json`)**, les **77 PDFs compressés (`public/pdfs/`)**, les **fiches de référence RAG**, et les **banques de données pharmacologiques (28 000 médicaments)** sont **déjà inclus dans le dépôt Git** et seront immédiatement présents dès le `git clone` !
