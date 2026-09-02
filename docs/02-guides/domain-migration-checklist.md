# 🌐 Guide de Migration & Checklist Domaine Cloudflare

Ce guide récapitule tous les emplacements de configuration où l'URL du Worker Cloudflare est référencée, ainsi que l'utilisation du script automatique de migration.

---

## ⚡ Méthode Rapide : Migration en 1 Seule Commande

Pour changer de sous-domaine ou associer un nouveau domaine personnalisé (ex: `drcat.mon-domaine.com`), exécutez simplement :

```bash
npm run set:domain -- nouveau-domaine.workers.dev
```
ou directement :
```bash
node scripts/update_domain.js nouveau-domaine.workers.dev
```

### Ce que le script fait automatiquement :
1. ✅ Analyse et remplace l'ancienne URL dans les 12 fichiers cibles.
2. 🎨 Régénère la bannière Open Graph HD 1200x630 (`public/og-banner.png`).
3. 📦 Lance la recompilation du bundle de production (`build.js`).
4. 🚀 Prépare le déploiement Cloudflare (`npx wrangler deploy`).

---

## 📋 Checklist Complète des 12 Fichiers Cibles

Si vous effectuez un audit manuel ou souhaitez vérifier l'intégrité du projet, voici la liste exhaustive des fichiers :

| # | Fichier | Rôle & Paramètres |
| :-: | :--- | :--- |
| **1** | [`public/index.html`](../../public/index.html) | Balises SEO `canonical`, `og:image`, `og:url`, `twitter:image`, `Schema.org`, et URL de secours de la télémétrie de crashs. |
| **2** | [`public/js/remote_config.js`](../../public/js/remote_config.js) | Registre client `REMOTE_SERVER_URL` et `REMOTE_SERVER_URLS` pour l'APK Android et la PWA. |
| **3** | [`public/js/version-checker.js`](../../public/js/version-checker.js) | Liste de secours `candidateUrls` pour le vérificateur de version et la porte de sécurité. |
| **4** | [`remote_server_config.json`](../../remote_server_config.json) | Configuration serveur centrale utilisée par `build.js` pour synchroniser le multi-rail. |
| **5** | [`server/services/sync-suggestions.js`](../../server/services/sync-suggestions.js) | `CLOUDFLARE_URL` & `CLOUDFLARE_TELEMETRY_URL` pour le relais Node/Termux `SYNC_SECRET`. |
| **6** | [`worker/routes/static-alias.js`](../../worker/routes/static-alias.js) | Endpoint `/api/server-providers` du Worker Cloudflare. |
| **7** | [`public/robots.txt`](../../public/robots.txt) | URL absolue du sitemap pour les robots d'indexation. |
| **8** | [`public/sitemap.xml`](../../public/sitemap.xml) | Balises `<loc>` pour le référencement naturel des moteurs de recherche. |
| **9** | [`public/llms.txt`](../../public/llms.txt) | Métadonnées pour les modèles d'intelligence artificielle et moteurs de recherche IA. |
| **10** | [`shortcuts/start_med.sh`](../../shortcuts/start_med.sh) | Script de démarrage Termux du multi-rail (Rail 1 Edge Cloudflare). |
| **11** | [`.github/workflows/build-apk.yml`](../../.github/workflows/build-apk.yml) | Workflow GitHub Actions de compilation de l'APK Android (injection dans `remote_server_config.json`). |
| **12** | [`.agents/AGENTS.md`](../../.agents/AGENTS.md) | Documentation du protocole de parité `SYNC_SECRET` et règles d'audit. |

---

## 🚀 Étape Finale : Déploiement & Validation

Après avoir exécuté le script :

1. **Déployer sur Cloudflare** :
   ```bash
   npx wrangler deploy
   ```
2. **Tester les endpoints en direct** :
   ```bash
   curl -s https://<votre-domaine>/api/version
   curl -s -I https://<votre-domaine>/og-banner.png
   ```
3. **Mettre à jour GitHub Secret (pour l'APK)** :
   - Dépôt GitHub $\rightarrow$ **Settings** $\rightarrow$ **Secrets and variables** $\rightarrow$ **Actions**.
   - Modifier **`REMOTE_SERVER_URL`** avec le nouveau domaine.
