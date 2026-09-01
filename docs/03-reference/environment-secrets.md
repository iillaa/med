# 📐 Référence : Inventaire des Variables d'Environnement & Secrets

> **Quadrant Diátaxis** : *03-Reference (Specifications)*  
> **Statut** : Production (v1.17.0+)  
> **Fichiers Associés** : `.env`, `wrangler.jsonc`, `server/services/auth-service.js`

---

## 🎯 1. Inventaire des Variables du Serveur Local Termux (`.env`)

| Variable | Type | Sensibilité | Description & Rôle | Valeur par Défaut / Exemple |
| :--- | :--- | :--- | :--- | :--- |
| `PORT` | Entier | Non sensible | Port d'écoute du serveur Express | `3000` |
| `NODE_ENV` | Chaîne | Non sensible | Environnement d'exécution (`development` / `production`) | `production` |
| `ADMIN_PASSWORD` | Chaîne | 🔴 Secret Critique | Mot de passe pour la connexion d'administration `/api/login` | *Défini à l'installation* |
| `GEMINI_API_KEY` | Chaîne | 🔴 Secret Critique | Clé d'API Google AI pour le moteur de génération LLM | `AIzaSy...` |
| `GEMINI_BLOCKLIST` | Chaîne | Modérée | Liste des sous-chaînes de modèles à exclure du tri automatique | `preview,exp,experimental` |
| `SYNC_SECRET` | Chaîne Hex | 🔴 Secret Critique | Clé partagée avec le Cloudflare Worker pour la synchro KV | *64 caractères hexadécimaux* |
| `APP_API_KEY` | Chaîne | Modérée | Clé d'application transmise par le client pour la lecture | `drcat-client-app-key` |
| `LOG_DIR` | Chemin | Non sensible | Répertoire de stockage des logs d'exécution et de crash | `server/logs` |

---

## ⚡ 2. Secrets du Cloudflare Edge Worker (Wrangler Secrets)

| Secret | Commande de Définition | Sensibilité | Rôle |
| :--- | :--- | :--- | :--- |
| `SYNC_SECRET` | `npx wrangler secret put SYNC_SECRET --name drcat` | 🔴 Critique | Protège l'exportation des suggestions et télémétries accumulées dans KV |

---

## 📱 3. Constantes & Métadonnées Client (`public/`)

| Clé / Sélecteur | Fichier | Rôle |
| :--- | :--- | :--- |
| `meta[name="app-version"]` | `public/index.html` | Version sémantique de l'application cliente (`1.17.0`) |
| `meta[name="app-build-version"]` | `public/index.html` | Timestamp de build pour le cache-busting (`2026.09.01.13.22`) |
| `dr_cat_install_id` | `localStorage` | Identifiant anonyme d'installation pour la télémétrie |
| `dr_cat_notes_*` | `localStorage` | Notes médicales personnelles privées de l'utilisateur (**Sanctuarisé**) |

---

## 🔗 Liens & Documents Associés
- 🛡️ [Architecture de Sécurité & Isolation](file:///data/data/com.termux/files/home/med/docs/01-architecture/security-isolation.md)
- ⚡ [Guide de Déploiement Cloudflare](file:///data/data/com.termux/files/home/med/docs/02-guides/cloudflare-wrangler-deploy.md)
- 🛠️ [Guide Onboarding Développeur](file:///data/data/com.termux/files/home/med/docs/02-guides/developer-onboarding.md)
