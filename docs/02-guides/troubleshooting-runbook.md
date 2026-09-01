# 🚒 Guide : Runbook de Résolution d'Incidents & Dépannage (Troubleshooting)

> **Quadrant Diátaxis** : *02-Guides (How-To Guides)*  
> **Statut** : Production (v1.17.0+)  
> **Composants Clés** : `server.js`, `worker.js`, `scripts/termux-wrangler-fix.sh`, `pm2`

---

## 🎯 1. Procédures d'Urgence & Runbooks Opérationnels

---

### 🚨 Incident 1 : Échec de Synchronisation des Suggestions (HTTP 403 Forbidden)
- **Symptôme** : Le serveur Termux affiche `[CloudSync] Warning: Échec de la récupération des suggestions distantes (Status: 403)`.
- **Cause Racine** : Le `SYNC_SECRET` configuré dans le `.env` local ne correspond pas au secret enregistré sur Cloudflare Workers.
- **Résolution Immédiate** :
  1. Vérifiez la valeur locale dans `.env` :
     ```bash
     grep '^SYNC_SECRET=' .env
     ```
  2. Mettez à jour le secret sur Cloudflare avec la même valeur :
     ```bash
     npx wrangler secret put SYNC_SECRET --name drcat
     ```
  3. Relancez le test avec curl :
     ```bash
     curl -s -o /dev/null -w "%{http_code}\n" \
       -H "x-sync-secret: $(grep '^SYNC_SECRET=' .env | cut -d= -f2)" \
       https://drcat.dr-cat.workers.dev/api/suggestions
     # Doit retourner 200 OK
     ```

---

### 🚨 Incident 2 : Crash Immédiat de Wrangler sous Termux (`workerd`)
- **Symptôme** : L'exécution de `wrangler deploy` ou `wrangler --version` échoue avec :  
  `Error: Unsupported platform: android arm64 LE`.
- **Cause Racine** : Le paquet `workerd` ne fournit pas de binaire natif pour Android arm64.
- **Résolution Immédiate** :
  Exécutez le script de patch automatique de la plateforme :
  ```bash
  bash scripts/termux-wrangler-fix.sh
  ```
  Vérifiez que wrangler fonctionne : `npx wrangler whoami`.

---

### 🚨 Incident 3 : Port 3000 Déjà Utilisé / Serveur PM2 Bloqué
- **Symptôme** : `Error: listen EADDRINUSE: address already in use :::3000`.
- **Cause Racine** : Une instance précédente de Node.js est restée active en arrière-plan.
- **Résolution Immédiate** :
  ```bash
  # Arrêt et redémarrage propre via PM2
  npm run pm2:restart

  # En cas de blocage persistant :
  pkill -f "node server.js" || true
  npm run pm2:start
  ```

---

### 🚨 Incident 4 : Écran de Verrouillage de Sécurité Inopiné sur l'App Mobile
- **Symptôme** : L'application Android ou PWA affiche un écran rouge de verrouillage d'urgence alors qu'aucune maintenance n'est prévue.
- **Cause Racine** : La valeur `minVersion` dans `worker.js` a été configurée avec un numéro supérieur à la version de l'APK installée.
- **Résolution Immédiate** :
  1. Vérifiez la version courante de l'application dans `package.json` (ex: `1.17.0`).
  2. Dans `worker.js`, alignez `minVersion` (ex: `"1.17.0"` ou antérieure).
  3. Redéployez le Worker : `npx wrangler deploy`.
  4. L'application déverrouille immédiatement l'interface au prochain cycle de vérification sans aucune perte de données utilisateur.

---

### 🚨 Incident 5 : Désynchronisation de l'Index PDF / Recherche Incomplète
- **Symptôme** : Certains PDFs présents dans `public/pdfs/` n'apparaissent pas dans les résultats de recherche ou retournent 0 page.
- **Résolution Immédiate** :
  Recompilez l'index vectoriel complet :
  ```bash
  npm run reindex
  ```

---

### 🚨 Incident 6 : Erreur de Quota Gemini API (HTTP 429) ou Modèle Non Trouvé
- **Symptôme** : La génération de CAT échoue avec `Resource has been exhausted (e.g. check quota)` ou `Model not found`.
- **Résolution Immédiate** :
  1. Vérifiez que votre clé `GEMINI_API_KEY` est valide.
  2. Vérifiez que la liste noire `GEMINI_BLOCKLIST` dans `.env` n'exclut pas tous les modèles actifs disponibles.
  3. Testez la connectivité du moteur LLM :
     ```bash
     npm run generate -- --canary
     ```

---

## 🔗 Liens & Documents Associés
- 🛠️ [Guide Onboarding Développeur](file:///data/data/com.termux/files/home/med/docs/02-guides/developer-onboarding.md)
- ⚡ [Guide de Déploiement Cloudflare](file:///data/data/com.termux/files/home/med/docs/02-guides/cloudflare-wrangler-deploy.md)
- 🚨 [Architecture de Télémétrie](file:///data/data/com.termux/files/home/med/docs/01-architecture/telemetry-crash-intelligence.md)
