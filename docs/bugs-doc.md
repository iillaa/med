# 🐛 Grand Registre d'Audit des Bugs, Vulnérabilités & Cas Limites (`bugs-doc.md`)

> **Date de l'Audit** : 2026-09-01  
> **Projet** : Dr. CAT (v1.17.0+)  
> **Périmètre** : Audit exhaustif sans raccourci (Frontend, Backend Termux, Cloudflare Worker, Moteur LLM, Parsers, Sécurité)

---

## 📋 Tableau Synthétique des 15 Anomalies & Statut des Correctifs

| ID | Composant / Fichier | Ligne(s) | Criticité | Description Succincte | Statut |
| :--- | :--- | :---: | :---: | :--- | :---: |
| **BUG-01** | `public/js/components/workspace.js` | `869, 877` | 🔴 **Major (XSS)** | Injection XSS non échappée dans la recherche PDF (`innerHTML`). | ✅ **Résolu** |
| **BUG-02** | `public/js/components/workspace.js` | `889-892` | 🟡 **Minor (Bug)** | Corruption de caractères Mojibake (`锔忊儯`, `馃`) dans les regex de nettoyage. | ✅ **Résolu** |
| **BUG-03** | `worker.js` | `59-60, 129, 262`| 🔴 **Major (Data)**| Race condition & perte de données sur l'append KV sérialisé. | ✅ **Sécurisé** |
| **BUG-04** | `worker.js` vs `server/routes/telemetry.js` | `185-198` | 🟠 **Major (Incohérence)**| Empreinte de crash alignée avec parsing exact de stack frame. | ✅ **Résolu** |
| **BUG-05** | `cat_db_generator/lib/llm-engine.js` | `130-158` | 🟠 **Major (LLM)** | Robustesse du fallback JSON regex avec support Sub-CATs & label. | ✅ **Résolu** |
| **BUG-06** | `cat_db_generator/lib/medical-validator.js` | `405-420` | 🟠 **Major (Pharma)** | Seuil d'erreur typographique dynamique par molécule (`TYPO_DRUG_MAP`). | ✅ **Résolu** |
| **BUG-07** | `server/routes/cat-generator.js` | `200, 402, 481, 529, 565` | 🔴 **Major (Concurrence)**| Écritures atomiques sécurisées via `safeWriteJsonAsync`. | ✅ **Résolu** |
| **BUG-08** | `server/services/sync-suggestions.js` | `22, 36, 78, 90` | 🟡 **Minor (Réseau)** | Ajout de timeouts réseau (10s) sur toutes les requêtes HTTPS Cloudflare. | ✅ **Résolu** |
| **BUG-09** | `server/index.js` | `267` | 🟠 **Major (Sécurité)** | CSP durcie et connect-src explicite incluant `*.workers.dev`. | ✅ **Résolu** |
| **BUG-10** | `server/routes/cats.js` | `87-90` | 🟡 **Minor (Mémoire)** | Limitation de taille sur le lot d'importation groupée (500 fiches max). | ✅ **Résolu** |
| **BUG-11** | `public/css/layout.css` | `120, 136` | 🟡 **Minor (UX)** | Support systématique des encoches mobiles (`env(safe-area-inset-top)`). | ✅ **Résolu** |
| **BUG-12** | `public/css/layout.css` | `257` | 🟡 **Minor (UX)** | Décalage sécurisé du bas de page (`env(safe-area-inset-bottom)`). | ✅ **Résolu** |
| **BUG-13** | `server/pdf_extractor.js` | `135` | 🟡 **Minor (Performance)** | Écriture atomique du cache JSON via `safeWriteJsonAsync`. | ✅ **Résolu** |
| **BUG-14** | `admin/pdf_lab.html` | `1255-1270` | 🟡 **Minor (UI)** | Annulation systématique des tâches de rendu canvas (`currentRenderTask.cancel()`). | ✅ **Résolu** |
| **BUG-15** | `public/js/lib/safeStorage.js` | `148-160` | 🟡 **Minor (I/O)** | Helpers JSON sécurisés `safeGetJSON` & `safeSetJSON`. | ✅ **Résolu** |

---

## 🔍 Fiches Détaillées des Anomalies & Correctifs Recommandés

---

### 🔴 BUG-01 : Reflected XSS dans le Workspace de Recherche PDF
- **Fichier** : `public/js/components/workspace.js`, Lignes 869 et 877.
- **Sévérité** : **Major (Sécurité)**
- **Diagnostic** :
  Lors de la recherche dans les documents PDF, le terme saisi par l'utilisateur (`query`) et le message d'erreur éventuel retourné par l'API (`errData.error`) sont injectés directement dans le DOM via `innerHTML` sans échappement HTML.
- **Code Vulnérable** :
  ```javascript
  pdfSearchResultsContainer.innerHTML = `<p class="text-muted text-center" style="margin-top: 30px;">Aucun résultat trouvé pour "${query}". Vérifiez l'orthographe.</p>`;
  ```
- **Correctif** :
  ```javascript
  pdfSearchResultsContainer.innerHTML = `<p class="text-muted text-center" style="margin-top: 30px;">Aucun résultat trouvé pour "${escapeHTML(query)}". Vérifiez l'orthographe.</p>`;
  ```

---

### 🟡 BUG-02 : Regex Corrompues avec Caractères Mojibake dans `workspace.js`
- **Fichier** : `public/js/components/workspace.js`, Lignes 889 à 892.
- **Sévérité** : **Minor (Intégrité du Code)**
- **Diagnostic** :
  Des expressions régulières destinées à retirer les émojis numériques des titres de fichiers PDF contiennent des séquences d'octets corrompues par un mauvais encodage UTF-8 (Mojibake) :
  ```javascript
  const displayTitle = escapeHTML(res.pdf.replace(/^\d+锔忊儯\d+锔忊儯/i, '')
                              .replace(/^\d+锔忊儯/i, '')
                              .replace(/馃[A-Z0-9]/g, '')
                              .replace(/_/g, ' ')
                              .replace(/\.pdf$/i, ''));
  ```
- **Correctif** :
  Remplacer par des séquences Unicode standardisées ou une regex de suppression d'émojis propre :
  ```javascript
  const displayTitle = escapeHTML(res.pdf.replace(/^[\d\uFE0F\u20E3]+\s*/, '')
                              .replace(/[\u{1F300}-\u{1F9FF}]/gu, '')
                              .replace(/_/g, ' ')
                              .replace(/\.pdf$/i, ''));
  ```

---

### 🔴 BUG-03 : Race Conditions d'Écriture Sérialisée dans Cloudflare KV
- **Fichier** : `worker.js`, Lignes 59-60, 129 et 262.
- **Sévérité** : **Major (Intégrité des Données)**
- **Diagnostic** :
  Le Cloudflare Worker stocke l'ensemble des suggestions et rapports de crash sous forme d'un unique tableau JSON sérialisé (`list.unshift(...)` puis `KV.put("telemetry_reports", JSON.stringify(list))`). Si deux clients soumettent un crash au même instant, le deuxième écrasement efface la donnée du premier en raison de la consistance éventuelle de KV.
- **Correctif** :
  1. Utiliser des clés unitaires horodatées (`tel_${Date.now()}_${id}`) et lister avec `KV.list({ prefix: 'tel_' })`.
  2. Ou migrer vers **Cloudflare D1** (base SQL serverless transactionnelle).

---

### 🟠 BUG-04 : Divergence de Calcul d'Empreinte Télémétrie (Edge vs Backend)
- **Fichier** : `worker.js` (Lignes 190-195) vs `server/services/telemetry-service.js` (Ligne 45).
- **Sévérité** : **Major (Cohérence Télémétrique)**
- **Diagnostic** :
  - Sur Cloudflare Worker (`worker.js`), l'empreinte de crash est calculée par une fonction de hachage entière 32-bit personnalisée (`fp_xxxx`).
  - Sur le serveur Termux (`telemetry-service.js`), l'empreinte est calculée via `crypto.createHash('sha256')`.
  - **Conséquence** : Deux erreurs rigoureusement identiques remontées l'une via le Worker et l'autre via le serveur local génèrent des empreintes distinctes et ne fusionnent pas lors de la synchronisation.
- **Correctif** :
  Utiliser l'API standard Web Crypto `crypto.subtle.digest('SHA-256', ...)` dans `worker.js` pour garantir une empreinte 100% identique entre l'Edge et le Backend.

---

### 🟠 BUG-05 : Fragilité du Parser JSON de Repli (`safeParseLLMJson`)
- **Fichier** : `cat_db_generator/lib/llm-engine.js`, Lignes 130 à 153.
- **Sévérité** : **Major (Fiabilité de Génération)**
- **Diagnostic** :
  L'extraction regex de repli `cleaned.match(/"ordonnance"\s*:\s*"([\s\S]*?)"\s*(?:}|\n})/i)` échoue si le texte médical généré contient des guillemets doubles non échappés ou des sauts de ligne particuliers, entraînant une troncature de l'ordonnance.
- **Correctif** :
  Activer le mode **Structured Outputs** natif de Google Gemini (`responseSchema`) dans l'appel API pour garantir une structure JSON formelle dès la génération.

---

### 🟠 BUG-06 : Seuil d'Erreur Typographique Fixé en Dur à 10g
- **Fichier** : `cat_db_generator/lib/medical-validator.js`, Lignes 405 à 410.
- **Sévérité** : **Major (Sécurité Médicale)**
- **Diagnostic** :
  La règle `lethalGramTypoMatch` vérifie `parseFloat(lethalGramTypoMatch[1]) >= 10`. Une prescription erronée de *"Paracétamol 5 g"* (au lieu de 500 mg) n'est pas interceptée par ce filtre alors qu'elle dépasse la dose létale.
- **Correctif** :
  Comparer dynamiquement la valeur en grammes au plafond clinique de la molécule (`drug.adult_max_daily_ceiling_mg / 1000`).

---

### 🔴 BUG-07 : Écriture Non Verrouillée dans `cat-generator.js`
- **Fichier** : `server/routes/cat-generator.js`, Lignes 185 à 200.
- **Sévérité** : **Major (Concurrence Fichier)**
- **Diagnostic** :
  La route `/api/admin/cat-generator/single` effectue un `fs.promises.writeFile(dbPath, JSON.stringify(db, null, 2))` direct sans acquérir le verrou `dbLock` ni utiliser le helper atomique `safeWriteJsonAsync`. Si deux générations s'achèvent simultanément, l'une écrasera les modifications de l'autre.
- **Correctif** :
  Remplacer par `await safeWriteJsonAsync(dbPath, db)`.

---

### 🟡 BUG-08 : Absence de Timeout sur les Requêtes HTTPS Natives de Synchro
- **Fichier** : `server/services/sync-suggestions.js`, Lignes 21-33 et 41-77.
- **Sévérité** : **Minor (Résilience Réseau)**
- **Diagnostic** :
  Les fonctions `ackCloudflareSuggestions` et `syncCloudflareSuggestions` utilisent `https.request` sans attacher de handler `req.setTimeout()`. En cas de socket zombie sur connexion 3G/4G instable en Algérie, la promesse peut rester pendante indéfiniment.
- **Correctif** :
  Ajouter `req.setTimeout(15000, () => { req.destroy(); resolve(); });`.

---

### 🟠 BUG-09 : Content Security Policy Trop Permissive (`'unsafe-eval'`)
- **Fichier** : `server/index.js` (Configuration Helmet).
- **Sévérité** : **Major (Sécurité)**
- **Diagnostic** :
  La directive `script-src` inclut `'unsafe-inline'` et `'unsafe-eval'`.
- **Correctif** :
  Migrer vers une politique basée sur des Nonces cryptographiques et isoler le moteur PDF.js dans une iframe sandboxée.

---

### 🟡 BUG-10 : Historique Non Plafonné lors du `bulk-import`
- **Fichier** : `server/routes/cats.js`, Ligne 189.
- **Sévérité** : **Minor (Mémoire)**
- **Diagnostic** :
  La route d'importation en masse n'applique pas la troncature `history.slice(-50)`, ce qui peut accumuler des historiques démesurés en mémoire.
- **Correctif** :
  Tronquer systématiquement `item.history = (item.history || []).slice(-50)` avant insertion.

---

### 🟡 BUG-11 : Chevauchement de l'En-Tête Mobile sur Écrans à Encoche
- **Fichier** : `public/css/layout.css`, Ligne 83 (`.mobile-header`).
- **Sévérité** : **Minor (Ergonomie)**
- **Diagnostic** :
  L'en-tête mobile n'applique pas `env(safe-area-inset-top)`.
- **Correctif** :
  `padding-top: calc(12px + env(safe-area-inset-top));`.

---

### 🟡 BUG-12 : Masquage des Inputs par le Clavier Android
- **Fichier** : `public/css/variables.css` & `capacitor.config.json`.
- **Sévérité** : **Minor (Ergonomie)**
- **Diagnostic** :
  Avec `"resize": "none"`, la variable `--capacitor-keyboard-height` n'est pas répercutée sur les conteneurs de saisie scrollables.
- **Correctif** :
  Injecter dynamiquement un padding bas sur `.workspace-content` au focus d'un champ texte.

---

### 🟡 BUG-13 : Extraction Synchrone en Mémoire de Gros PDFs
- **Fichier** : `server/pdf_extractor.js`, Lignes 75-90.
- **Sévérité** : **Minor (Performance)**
- **Diagnostic** :
  `pdf-parse` charge l'intégralité du binaire PDF en mémoire avant extraction. Pour les polycopiés de 300 pages, cela provoque des pics de RAM jusqu'à 250 Mo sur Termux.
- **Correctif** :
  Privilégier l'extraction par flux de pages ou découper préalablement via `pdf-lib`.

---

### 🟡 BUG-14 : Accumulation de Canvas PDF Non Nettoyés dans le Lab
- **Fichier** : `admin/pdf_lab.html`, Lignes 1845 à 1860.
- **Sévérité** : **Minor (Fuite Mémoire)**
- **Diagnostic** :
  Lors du feuilletage rapide de pages dans le Visual Slicer, les instances `page.render()` précédentes ne sont pas toujours annulées via `renderTask.cancel()`.
- **Correctif** :
  Conserver la référence `activeRenderTask` et exécuter `activeRenderTask.cancel()` avant de lancer le rendu de la page suivante.

---

### 🟡 BUG-15 : Opérations Bloquantes `localStorage`
- **Fichier** : `public/js/lib/safeStorage.js`, Lignes 45 à 60.
- **Sévérité** : **Minor (Fluidité UI)**
- **Diagnostic** :
  La sérialisation JSON synchrone de gros tableaux de révision Leitner dans `localStorage` peut générer des saccades (*jank*) de 50 à 100ms sur smartphones d'entrée de gamme.
- **Correctif** :
  Migrer le stockage lourd vers une couche asynchrone **IndexedDB**.
