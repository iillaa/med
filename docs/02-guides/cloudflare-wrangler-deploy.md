# ⚡ Guide : Déploiement Cloudflare Worker & Gestion des Secrets (Wrangler)

> **Quadrant Diátaxis** : *02-Guides (How-To Guides)*  
> **Statut** : Production (v1.17.0+)  
> **Composants Clés** : `worker.js`, `wrangler.jsonc`, `scripts/termux-wrangler-fix.sh`, `server/services/sync-suggestions.js`

---

## 🎯 1. Vue d'Ensemble du Rail Edge Cloudflare

Le Cloudflare Worker (`worker.js`) assure la haute disponibilité mondiale de Dr. CAT (Rail 1). Il distribue la base de fiches cliniques (`cats_db.json`), les assets statiques de l'application PWA, et sert de tampon pour les suggestions et la télémétrie.

---

## 📱 2. Le Shim Termux pour `workerd` (Android arm64)

> [!IMPORTANT]
> **Règle Fondamentale pour Termux** :  
> Le paquet npm officiel `workerd` ne fournit aucun binaire pour la plateforme `android-arm64`. Sans patch, toute commande `wrangler` crashe avec l'erreur :  
> `Unsupported platform: android arm64 LE`.

### Mécanisme de Résolution Automatique
Depuis la version v1.12.0, le script `scripts/termux-wrangler-fix.sh` est exécuté automatiquement après chaque `npm install` (via le hook `postinstall`).
- Il intercepte l'absence de binaire et injecte un shim non-bloquant.
- Les commandes de déploiement distant (`wrangler deploy`, `wrangler whoami`, `wrangler secret put`) fonctionnent ainsi parfaitement depuis la tablette Android.
- Si nécessaire, exécutez manuellement :
  ```bash
  bash scripts/termux-wrangler-fix.sh
  ```

---

## 🔑 3. Configuration & Parité des Secrets (`SYNC_SECRET`)

Le secret de synchronisation `SYNC_SECRET` doit être **strictement identique** des deux côtés :

### 1. Sur Cloudflare (Worker Secret)
```bash
npx wrangler secret put SYNC_SECRET --name drcat
# Saisissez la clé hexadécimale de 64 caractères
```

### 2. Sur le Serveur Local Termux (`.env`)
```env
SYNC_SECRET=<MEME_CLE_HEXADECIMALE>
```

### 3. Test de Vérification de Parité
```bash
# Sans secret : doit retourner 403 Forbidden
curl -s -o /dev/null -w "%{http_code}\n" https://drcat.is-an-app.workers.dev/api/suggestions
# Doit renvoyer : 403

# 2. Test avec secret (doit réussir) :
curl -s -H "x-sync-secret: $(grep '^SYNC_SECRET=' .env | cut -d= -f2)" \
  https://drcat.is-an-app.workers.dev/api/suggestions
# Doit renvoyer : 200 [] (ou la liste des suggestions)
```

---

## 🚀 4. Procédure de Déploiement en Production

### Étape 1 : Construction et Estampillage de Version
La commande de build injecte automatiquement la version de `package.json` dans les assets et le Worker :
```bash
npm run build
```

### Étape 2 : Déploiement Wrangler
```bash
npx wrangler deploy
```

La sortie confirme l'upload du worker et des assets statiques :
```text
Uploaded drcat (1.23 sec)
Deployed drcat triggers (0.15 sec)
  https://drcat.is-an-app.workers.dev
Current Version ID: xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx
```

---

## 🔒 5. Activation du Kill Switch / Mise à Jour Forcée

Pour obliger tous les clients obsolètes à se mettre à jour :
1. Dans `worker.js`, ajustez `minVersion` dans la réponse `/api/version`.
2. Déployez via `npx wrangler deploy`.
3. Les clients dont la version est inférieure à `minVersion` afficheront immédiatement l'écran de verrouillage sécurisé.

---

## 🔗 Liens & Documents Associés
- 🌐 [Architecture du Modèle Dual-Rail](file:///data/data/com.termux/files/home/med/docs/01-architecture/dual-rail-network.md)
- 🛡️ [Architecture de Sécurité & Kill Switch](file:///data/data/com.termux/files/home/med/docs/01-architecture/security-isolation.md)
- 📐 [Inventaire des Secrets & Environnements](file:///data/data/com.termux/files/home/med/docs/03-reference/environment-secrets.md)
