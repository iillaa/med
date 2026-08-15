# Technical Architecture (technical_architecture.md) 📐

This document provides a deep dive into the architectural design, security mechanisms, offline-first logic, and data flow of **Dr. CAT**.

---

## 🏗️ System Architecture Overview

Dr. CAT operates in a **Dual-Rail Hybrid Network Architecture** across edge CDN and local Node.js environments:

```text
1. ⚡ 90% Mass Content Sync Rail (Cloudflare Worker Edge)
   [Android APK / PWA Client] <--- HTTPS / Edge REST ---> [Cloudflare Worker (drcat.dr-cat.workers.dev)]
                                                                |
                                                      [Mature GitHub Production Database]
                                                      [Static CDN Assets & PDF Lists]

2. 🔒 10% Admin Control Rail (Termux Node.js Ngrok Server)
   [Android APK / Admin Lab] <--- HTTPS Tunnel ---> [Termux Express Backend (server.js)]
                                                            |
                                                  [Security Lock Gate & Kill Switch]
                                                  [Version Checker /api/version]
                                                  [Suggestion Moderation & Active Learning]
                                                  [V3 CAT Generator Engine]
```

### App Mode Detection
At startup, `main.js` evaluates the runtime context via `api.getAppMode()` and assigns one of four modes:

| Mode | Context | Data Source |
|---|---|---|
| `android_offline` | Capacitor APK, no server reachable | Bundled JSONs + localStorage |
| `android_online` | Capacitor APK, server reachable | Server API (synced) |
| `browser_local` | Browser on same device as server | Full server API + admin |
| `browser_remote` | Browser via public tunnel | Server API, read-only suggestions |

The mode can switch dynamically at runtime via `api.setAppMode()`, which dispatches a `drcat-app-mode-changed` DOM event so all components can react without a page reload.

---

## 🧠 4-Stream Knowledge & Human Active Learning Engine (v1.7.0)

Dr. CAT's V2 Dual RAG generation engine synthesizes medical protocols using 4 distinct, prioritized knowledge streams:

| Stream | Source | Role & Priority |
|---|---|---|
| **Stream 1** | **Offline PDF RAG Index (`pdf_index.json`)** | **Priority 1 (Baseline)**: Local Algerian drug monograms, brand names (Ascabiol, Spasfon, Tiorfan, Smecta), and regional emergency protocols. |
| **Stream 2** | **Web RAG Live Cache (`web_cache/`)** | **Priority 2 (Enrichment)**: Live guidelines from NCBI PubMed, MSD Manuals, MedG, HAS, and legal certificate requirements. |
| **Stream 3** | **Gemini AI Synthesis Engine** | **Priority 3 (Reasoning)**: Clinical prose formatting, posology precision, and strict Schema Lock enforcement (5-Step Clinical vs 3-Step Administrative). |
| **Stream 4** | **Human Active Learning Memory** | **Absolute Priority Over Ride**: Learns from manual doctor edits (`✏️ Éditer` in Generator Lab UI). Stamps `_human_edited: true` in V2 DB and injects previous doctor corrections into future AI synthesis prompts. |

```text
  [1. Offline PDF Index]   [2. Web RAG Cache]   [3. Gemini 3.6 Flash]   [4. Human Active Learning Memory]
             \                     |                      |                     /
              \                    |                      |                    /
               ▼                   ▼                      ▼                   ▼
           ┌──────────────────────────────────────────────────────────────────┐
           │     DUAL RAG + HUMAN ACTIVE LEARNING SYNTHESIS ENGINE           │
           │     - Enforces 5-Step Clinical / 3-Step Administrative Locks    │
           │     - Preserves 100% of Doctor Modifications & Preferences      │
           └──────────────────────────────────────────────────────────────────┘
```

---

## 💾 Data Management & Integrity

To guarantee zero data loss on device power cuts or concurrent accesses, the application implements the following write-path:

### 1. Atomic Safe Writes
When saving clinical databases or suggestions, `server.js` uses `safeWriteJsonAsync`:
1. The updated cache is converted to a JSON string.
2. The current database file is backed up by copying it to `<filename>.json.bak`.
3. The new JSON data is written to a temporary file (`<filename>.json.tmp`).
4. The temporary file is renamed to `<filename>.json`, completing the transaction.

This ensures that the main file is never truncated or corrupted if the server is interrupted mid-write.

### 2. AsyncLock Write Serializer
All database writes are queued through a lightweight `AsyncLock` promise chain, which serializes concurrent write requests. This prevents race conditions when multiple users submit suggestions simultaneously.

### 3. Client Storage Overrides
In offline Capacitor mode, data modifications cannot be saved to the read-only app package:
* **Custom CATs**: Stored as JSON arrays under `localStorage` key `dr_cat_custom_created_cats`.
* **Field Overrides**: Customized summaries, status badges, etc., are stored under `dr_cat_local_overrides`.
* These overrides are deep-merged into the bundled clinical data at startup in `main.js`.

### 4. Version History & Client-Side Pruning
To keep track of modifications without overloading client devices:
* **Change Log Archiving**: Whenever an admin directly edits a CAT or approves an edit suggestion, the server records the change type, timestamp, and a copy of the previous text values (`previousState`) inside a `history` array in `cats_db.json`.
* **Non-Admin API Stripping**: To protect bandwidth during synchronization, the GET `/api/cats` API endpoint strips the `history` fields from responses unless the request is authenticated with an admin token.
* **Offline Client Build Pruning**: During compilation (`npm run build` / `node build.js`), the build script parses the database and deletes the `history` property from all items before writing them to the web assets folder. This guarantees that the offline standalone APK package remains extremely lightweight.

---

## 📡 Provider-Agnostic Remote Sync

The sync architecture was redesigned from a single hardcoded URL constant to a **provider-agnostic registry**.

### 1. `remote_server_config.json` (Server-Side — Single Source of Truth)
The server owns the list of remote servers here. This file is Git-ignored (the tunnel URL must never be committed) and is the single source of truth, loaded once at startup. It is set via `node set_server_provider.js` (like the admin password) or the CI `REMOTE_SERVER_URL` secret, and can list multiple servers with priorities:
```json
{
  "primaryProvider": "ngrok",
  "servers": [
    { "url": "https://your-active-tunnel.ngrok-free.dev", "provider": "ngrok", "priority": 1 },
    { "url": "https://backup.cloudflare.dev", "provider": "cloudflare", "priority": 2 }
  ]
}
```
The server exposes the list via the public `GET /api/server-providers` endpoint, and derives its CORS allowlist from it (recomputed live on every change, so no restart is needed).

### 2. `build.js` Compilation (APK seed)
At build time, `build.js` reads `remote_server_config.json` and generates `public/js/remote_config.js` (Git-ignored), baking the URL(s) directly into the APK bundle as its initial seed:
```js
window.REMOTE_SERVER_URLS = ["https://your-active-tunnel.ngrok-free.dev"];
```
On first successful reach to any server, the client adopts the server's authoritative list from `GET /api/server-providers` (so servers can be added/removed at runtime without rebuilding the APK).

### 3. `server-providers.js` (Client-Side)
The provider registry detects which tunnel type each URL belongs to (Ngrok, Cloudflare, or custom domain) and returns the correct bypass headers needed for clean CORS fetches:
* **Ngrok**: injects `ngrok-skip-browser-warning: true` header.
* **Cloudflare**: standard fetch, no bypass needed.
* **Custom domain**: standard fetch.

### 4. Client Failover & Load-Balancing
The client records per-server health and orders requests by `priority` then health: the primary is tried first; if slow/down, the next healthy server is used; equal-priority siblings share load. A 60s health re-ping promotes recovered servers automatically. This provides primary→failover plus cross-provider resilience (e.g. ngrok + cloudflare) on top of a single ngrok pool URL.

### 4. Background Sync Loop
`api.js` runs a background `setInterval` loop every ~30 seconds that:
1. Reads the active provider URL from `server-providers.js`.
2. Performs a **standard CORS fetch** (not `no-cors`) with the correct provider headers.
3. On success: switches mode to `android_online`, syncs cats and suggestions.
4. On failure: keeps `android_offline` mode, loads from local bundle without blocking the UI.

> **Why not `no-cors`?** `mode: 'no-cors'` returns opaque responses with status `0` even when the server returns an HTML interstitial page (like Ngrok's phishing warning). This created false-positive "online" transitions. Standard CORS with provider bypass headers is the only reliable connectivity check.

---

## 📄 PDF Search, Dual-Folder Architecture & Hybrid Extraction Pipeline

The PDF search engine runs locally on Termux and utilizes a **2-Folder Dual-Pipeline Architecture** coupled with a robust 3-tier fallback strategy to process complex medical PDFs (which often contain scanned images or multi-column layouts) before compiling them into a fast, ultra-lightweight mobile-indexed database.

### 1. Dual-Folder Pipeline (`data/pdf_masters/` vs `public/pdfs/`)
To decouple 100% accurate AI text extraction from lightweight mobile APK packaging:
* **Master Originals Folder (`data/pdf_masters/`)**: Stores raw, uncompressed master PDFs uploaded by the Admin. This folder is Git-ignored and kept strictly on the server/Termux device. All AI extractions (LlamaParse / Gemini) read from this folder to guarantee 0% data loss.
* **Public Bundle Folder (`public/pdfs/`)**: Stores ultra-compressed display PDFs created by `scripts/compress_pdfs.js`. This folder is bundled into the standalone Android APK and served to public web users.

```text
 📁 ORIGINAL UNCOMPRESSED PDFs (data/pdf_masters/)  [Server-Only / Gitignored]
       │
       ├─► 🤖 AI Extraction Pipeline (LlamaParse / Gemini) ──► Generates 100% Accurate `pdf_index.json`
       │
       └─► ⚡ Ghostscript Ultra Compressor (`scripts/compress_pdfs.js`)
                 │
                 └─► 📱 Compressed High-Readability PDFs (public/pdfs/) ──► Bundled into APK (Dropping APK from 100MB → ~20MB)
```

### 2. Ghostscript Ultra-Compression Engine (`scripts/compress_pdfs.js`)
Triggered automatically during PDF uploads or via `npm run compress:pdfs`:
* **96 DPI Downsampling**: `-dColorImageResolution=96 -dGrayImageResolution=96 -dMonoImageResolution=96`. Downsamples high-resolution embedded graphics to 96 DPI (crisp on mobile screens).
* **JPEG Quantization**: `-dJPEGQ=60 -dColorImageFilter=/DCTEncode`. Re-encodes embedded image streams with JPEG quality factor 60.
* **Bicubic Downsampling**: `-dColorImageDownsampleType=/Bicubic`. Smooths downsampled images so small text inside clinical diagrams remains legible.
* **Font Subsetting & Stream Deduplication**: `-dSubsetFonts=true -dCompressFonts=true -dDetectDuplicateImages=true`. Strips unused glyphs and deduplicates logos/graphics repeated across pages.
* *Result: Up to **80% file size reduction** on document & image-heavy PDFs.*

### 3. The Strategy Manager (3-Tier Extraction)
To guarantee the highest quality text extraction, `pdf_extractor.js` routes files through a waterfall of parsers:
1. **LlamaParse API:** (Primary) AI-driven parser capable of reading complex medical tables and scanned imagery.
2. **Google Gemini Flash API:** (Fallback) Kicks in if LlamaParse fails or hits quota limits. Chunks large texts to prevent memory spikes.
3. **Offline `pdf-parse`:** (Ultimate Fallback) Native Node.js parser for standard text-based PDFs when offline.

### 4. SHA-256 Hash Caching
To completely eliminate wasted API credits and redundant parsing:
* Each raw PDF is hashed using SHA-256 before extraction.
* The parsed JSON output is saved to `data/pdf_cache/<filename>.json` with the hash embedded.
* On subsequent restarts, `index_pdfs.js` checks the hash. If the hash hasn't changed *and* the quality hasn't been upgraded, it loads instantly from cache.

### 5. The Master Index Bundler & Asset Minification
* `index_pdfs.js` acts as a compiler, merging all individual cached JSONs into one master `pdf_index.json`.
* During `node build.js`, `pdf_index.json`, `pdf_list.json`, and `cats_db.json` are minified (stripping indentation whitespace), saving ~35% of JSON file size on mobile clients.
* The Android APK directly bundles this minified master index, allowing lightning-fast offline search with zero server load.
* Searches leverage `p.content || p.text` dual-field reads for backward compatibility.

### 6. Admin PDF Inspector & Deletion Engine (`public/pdf_lab.html`)
* **Advanced Metrics Dashboard:** Displays parser engine badges (`LlamaParse`, `Google Flash`, `Offline`, `Failed`), page count pills with word totals (`📄 X p. (Y w)`), and mobile APK size reduction pills (`💾 -78%`).
* **Interactive Inspection Modal (`#modal-overlay`):** Clicking any quality badge or page pill opens a modal containing SHA-256 fingerprints, total words/chars, dual-folder size comparison (`Master ➔ Mobile APK`), and a page-by-page text density progress bar table.
* **6-Location Atomic PDF Deletion Engine (`scripts/delete_pdf.js` & `POST /api/admin/delete-pdf`):**
  1. Removes raw original from `data/pdf_masters/`.
  2. Removes compressed copy from `public/pdfs/`.
  3. Removes SHA-256 extraction cache from `data/pdf_cache/`.
  4. Purges document entry from root `pdf_index.json`.
  5. Purges document entry from minified `public/data/pdf_index.json`.
  6. Purges filename entry from `public/data/pdf_list.json`.
* Secured entirely by `isLocalhostConnection` and Admin tokens; the endpoint and UI are 403-blocked on remote connections.

---

## ⚡ Capacitor Mobile APK Performance Engine

To guarantee a fluid, 60FPS native application feel inside the Capacitor Android WebView wrapper:

1. **Native Hardware Acceleration & Heap Expansion (`AndroidManifest.xml`):**
   * Configured `android:hardwareAccelerated="true"` and `android:largeHeap="true"` to allocate dedicated GPU rendering layers and prevent Out-Of-Memory garbage collection pauses.
2. **Origin Isolation (`capacitor.config.json`):**
   * Configured `"androidScheme": "https"` and `"backgroundColor": "#0F172A"` for clean webview origin isolation, eliminating mixed-content security warnings.
3. **Native Touch Response (`layout.css` & `sidebar.js`):**
   * Applied `touch-action: manipulation;`, `-webkit-tap-highlight-color: transparent;`, and `overscroll-behavior-y: none;` to eliminate 300ms tap delays and native browser scroll bounce.
   * `requestAnimationFrame` gesture throttling on Pull-to-Refresh to prevent main-thread layout thrashing.
4. **Event Delegation (`#cat-list`):**
   * Replaced per-item event listeners on the CAT list with a single top-level delegated listener, reducing DOM event listener overhead by 95%.
5. **Controlled Native Splash Screen:**
   * Configured `"launchAutoHide": false` on the Capacitor SplashScreen plugin so web app boot code smoothly controls splash screen dismissal after asset initialization completes.

---

## 🔄 "Reprendre la révision" (Resume Revision Engine)

* **Real-time `lastRead` Timestamps**: Whenever a user views a CAT, updates learning status (`À faire`, `En cours`, `Maîtrisé`), or edits notes, `workspace.js` stamps an ISO timestamp on `cat.lastRead`.
* **Top 5 Recently Revised List**: `resume.js` filters and sorts CATs by `lastRead` descending, presenting a quick-resume list on the home dashboard.
* **Local State Merge**: `mergeCatsWithLocalState()` in `helpers.js` preserves local `lastRead` timestamps and status badges when syncing remote database updates.

---

## 🩺 Doctor-Grade Prescription & Local-First Weighting Engine (v1.5.2)

Le moteur de génération et d'édition d'ordonnances intègre une logique décisionnelle clinique de niveau médical (Doctor-Grade) associée à une matrice de pondération contextuelle locale à 3 niveaux (3-Tier Source Weighting Matrix).

### 1. Hiérarchie Stricte des Sources de Connaissances (Strict Priority Order Directive)

| Niveau (Tier) | Source de Connaissances | Rôle & Priorité Clinique |
|---|---|---|
| **Priorité 1 (Baseline)** | **Offline PDF Index** (Originaux Locaux Algérie/Maghreb) | **Priorité Absolue** : Détermine les molécules médicamenteuses, les posologies locales et les habitudes de prescription (ex: Ascabiol/Benzoate de benzyle, Spasfon, Tiorfan, Smecta). |
| **Priorité 2 (Supplement)** | **Web RAG** (StatPearls NCBI, MSD Manuals Pro, MedG) | **Consolidation & Sécurité** : Détermine la structuration rigoureuse en 5 étapes cliniques, le bilan paraclinique et l'exhaustivité des Drapeaux Rouges (*Red Flags*). |
| **Priorité 3 (Synthesis)** | **Moteur de Raisonnement Gemini** | **Formatage & Syntaxe** : Assure la rigueur de rédaction médicale française, l'absence de répétitions et le respect du schéma JSON. |

### 2. Structure de Prescription à 3 Niveaux (3 Tiers)
Les ordonnances générées et affichées dans les fiches CAT suivent une hiérarchisation clinique stricte :
- **1ère Intention (First-Line)** : Traitement étiologique de référence pour le tableau clinique donné (posologie exacte, durée et modalité d'administration).
- **Alternatives Thérapeutiques (`[OU]`)** : Options de remplacement explicites en cas de contre-indication, d'intolérance, d'allergie ou de rupture de stock (ex: `[OU] Alternative 1 (Si contre-indication au traitement topique) : Ivermectine orale...`).
- **Traitements Symptomatiques Adjuvants** : Prescriptions d'appoint ciblant uniquement les symptômes associés (douleur, fièvre, spasmes, diarrhée, prurit).

### 3. Algorithme de Pondération Locale (Local-First Drug Weighting)
Pour s'adapter à la réalité du terrain et de la pharmacopée locale, le moteur accorde une priorité algorithmique supérieure aux molécules de référence couramment prescrites et disponibles :
- **Gastro-entérologie / Antispasmodiques** : Priorisation de *Spasfon* (Phloroglucinol), *Tiorfan* (Racecadotril), *Smecta* (Diosmectite).
- **Dermatologie / Parasitologie** : Priorisation d'*Ascabiol* (Benzoate de benzyle) pour les gales et parasitoses cutanées.
- **Règles d'Équivalence** : Substitution automatique ou suggestion préférentielle des spécialités disponibles localement par rapport aux dénominations internationales rares.

### 4. Garde-Fous Anti-Polypharmacie & Sécurité Patient
- **Interdiction de la Liste Plate** : Élimination des numérotations plates (1, 2, 3, 4) pouvant faire croire à une coprescription simultanée.
- **Balises d'Alerte d'Exclusion** : Insertion automatique d'avertissements explicites `⚠️ ALTERNATIVE : Ne pas associer le traitement topique et oral en première intention sauf forme grave/croûteuse`.
- **Vérification de Redondance** : Détection des doublons de classe thérapeutique (ex. coprescription de deux AINS ou deux antispasmodiques).
- **Avertissements de Posologie** : Signalement visuel sur les durées de traitement prolongées et ajustements pédiatriques/gériatriques.

---

## 🤖 Moteur Dual RAG V2, Découverte Dynamique & Pipeline 1-Tap (v1.6.0 – v1.7.0)

Dr. CAT intègre une architecture **Dual RAG (Retrieval-Augmented Generation)** couplée à un moteur de découverte dynamique de modèles IA et de contrôle de sécurité clinique algorithmique.

### 1. Qu'est-ce que le RAG & le Dual RAG ?
- **RAG (Génération Amplifiée par Récupération)** : Au lieu de compter uniquement sur la mémoire pré-entraînée de l'IA (qui peut être obsolète ou halluciner), le système extrait d'abord des documents médicaux réels et les transmet à l'IA avant la rédaction.
- **Dual RAG** : Interroge simultanément **DEUX canaux de connaissances externes distincts** :
  1. **Canal 1 — Offline RAG (PDF Index Local)** : Interroge `cat_db_generator/pdf_index.json` (77 ouvrages et consensus médicaux algériens/maghrébins) pour garantir la disponibilité des spécialités locales (*Ascabiol*, *Spasfon*, *Smecta*, *Tiorfan*) et les habitudes de prescription régionales.
  2. **Canal 2 — Online RAG (Doctor Web)** : Interroge en direct des bases médicales professionnelles (StatPearls NCBI open REST API, Manuel MSD Professionnel via Jina MD Reader, MedG) pour intégrer les dernières recommandations internationales 2026.

### 2. Moteur de Découverte Dynamique de Modèles & Extended Thinking (`llm-engine.js`)
- **Découverte Dynamique (`discoverDynamicModels`)** : Interroge l'API Google AI Studio (`GET /v1beta/models`) au démarrage pour lister les modèles actifs et les classer par version sémantique (`3.6` > `3.5` > `3.1` > `2.5`). Adopte automatiquement les futurs modèles (`gemini-3.7`, `gemini-4.0`) dès leur sortie sans modification de code.
- **Budget de Raisonnement Étendu (`thinkingConfig`)** : Injecte un budget de 2048 tokens de réflexion clinique approfondie pour valider les diagnostics différentiels et les calculs de posologie pédiatrique.
- **Gestion des Limites de Débit HTTP 429** : Pause automatiquement 4 secondes et réessaie le modèle principal lors des générations par lots.

### 3. Assertions Algorithmiques de Sécurité Thérapeutique (`medical-validator.js`)
Garde-fous programmatiques qui vérifient et rejettent les posologies dangereuses avant l'écriture sur disque :
- **Plafond Quotidien Paracétamol Adulte** : Rejet automatique des prescriptions dépassant `4g/jour` (ex: 2g 4x/j = 8g/j).
- **Plafond Posologique Pédiatrique** : Rejet des doses uniques pédiatriques dépassant `15 mg/kg`.
- **Alerte Syndrome de Reye** : Contre-indication stricte de l'Aspirine dans les infections virales pédiatriques (grippe, varicelle).

### 4. Pipeline Centralisé 1-Tap (`POST /api/admin/cat-generator/pipeline-full`)
Exécute la chaîne complète **Recherche Web Step 1 ➔ Synthèse IA Dual RAG Step 2 ➔ Approbation Auto Step 3** en un seul appel API.
- Accessible via le bouton **`⚡ IA Auto`** dans le modal d'ajout de CAT (`index.html`) et les boutons **`⚡ 1-Tap Auto`** dans le Generator Lab UI (`admin/cat_generator_lab.html`).

---

## 🔒 Architecture de Sécurité à Double Porte (Double-Door Security v1.7.0)

Les outils d'administration, le Generator Lab V2 et les endpoints d'importation/génération sont protégés par un protocole de sécurité à double verrouillage strict :

### 1. Les Deux Portes de Protection
$$\text{Accès Autorisé} = \text{Connexion Localhost (Porte 1)} \quad \mathbf{ET} \quad \text{Jeton Admin Valide (Porte 2)}$$

| Type de Requête | Porte 1 (Localhost) | Porte 2 (Mot de passe Admin) | Résultat Serveur |
|---|---|---|---|
| **Attaque Distante (Ngrok/Tunnel/Wi-Fi)** | ❌ Non | ❌ Non | 🛑 **REJETÉ (HTTP 403)** |
| **Attaque Distante (Ngrok/Tunnel/Wi-Fi)** | ❌ Non | 🔑 Présent | 🛑 **REJETÉ (HTTP 403)** |
| **Utilisateur Local Non Authentifié** | ✅ Oui | ❌ Non | 🛑 **REJETÉ (HTTP 403)** |
| **Administrateur Local Authentifié** | ✅ Oui | 🔑 Présent | ✅ **AUTORISÉ** |

- **Porte 1 (Périmètre Réseau)** : Les requêtes distantes (via tunnel public, Ngrok ou IP distante) sont rejetées immédiatement avec un code `HTTP 403` **avant même l'évaluation du mot de passe**. Les attaquants distants ne disposent d'aucune surface d'attaque ni d'opportunité de brute-force.
- **Porte 2 (Authentification Fortifiée)** : La vérification du jeton de session administrateur (`checkIsAdmin`) est obligatoire sur 100% des endpoints sensibles (`/api/admin/cat-generator/*`, `/api/cats/bulk-import`, `/api/pdfs/reindex`).

### 2. Sécurisation de l'Interface Utilisateur (UI Hardening)
- **Bouton `⚡ IA Auto`** : Masqué par défaut (`display: none`) dans l'HTML brut de `index.html`. Injecté dynamiquement uniquement si `state.isAdmin === true`.
- **Verrouillage du Generator Lab (`cat_generator_lab.html`)** : Transmission systématique du header `x-admin-token`. Affichage automatique d'un écran de verrouillage 🔐 **Connexion Admin Requise** avec formulaire d'authentification en cas d'accès non autorisé.

---

## 📶 Offline-First Capabilities & PWA

* **App Mode at Startup**: `main.js` calls `api.getAppMode()` which checks host, protocol, and Capacitor UA to assign the correct data routing strategy before any network call is made.
* **Service Worker (PWA)**: Uses a **Network-First** strategy. Browser clients always load fresh server assets when online, and fall back to cached copies when offline.
* **Capacitor CORS Allowlist**: The server explicitly allows Capacitor webview origins (`http://localhost`, `capacitor://localhost`) in its dynamic CORS origin list, enabling the Android APK's WebView to make authenticated API calls.

---

## 🔐 Security Hardening (v1.5.0)

The following critical security patches were applied in v1.5.0:

| Fix | File | Detail |
|---|---|---|
| Hardcoded API key removed | `server/routes/version.js` | `ADMIN_API_KEY` now loaded from `.env` only |
| dotenv loading | `server/index.js` | Secrets loaded at boot from `.env` |
| X-Forwarded-For spoofing blocked | `server/middleware/rate-limit.js` | XFF only trusted from local socket IPs |
| Suggestions endpoint auth | `server/routes/suggestions.js` | Requires valid `x-app-key` header + 5KB payload cap |
| Toast XSS eliminated | `public/js/utils.js` | `textContent` used instead of `innerHTML` |
| Body size limit | `server/index.js` + `server/routes/pdfs.js` | Global 1MB limit, PDF upload gets local 50MB |

---

## 🔒 Security & Admin Hardening

### 1. Production APK Asset Hardening & Anti-Decompilation
* **Automated Asset Stripping**: `"cap:sync"` script in `package.json` executes `node scripts/clean_android_assets.js` after `cap sync` to remove unbundled development JS source files (`components/`, `lib/`, `workspace/`, `dashboard/`, `main.js`, `api.js`, `utils.js`, `state.js`).
* **Native AAPT Exclusion**: `android/app/build.gradle` enforces `aaptOptions.ignoreAssetsPattern` (`components:lib:workspace:dashboard:main.js:...`) to filter out development source files at the Gradle compiler level.
* **Bytecode Obfuscation**: Android R8/ProGuard obfuscation enabled (`minifyEnabled true`, `shrinkResources true`).
* **Reverse Engineering Protection**: Decompilation tools (`apktool`, `jadx`, `unzip`) find **ONLY** `public/dist/app-*.js` (minified production bundle) and runtime engine files (`pdf.min.js`, `version-checker.js`).

### 2. User Data Storage Protection & Non-Destructive Lock Gate
* **Kill Switch / Force Update Protection**: `public/js/version-checker.js` is strictly prohibited from calling `localStorage.clear()` or `indexedDB.deleteDatabase()`.
* **Data Preservation**: User clinical notes (`dr_cat_notes_*`), reading history (`dr_cat_user_progress`), Leitner spaced repetition stats (`dr_cat_leitner`), and streaks (`dr_cat_streak`) remain 100% preserved during version locks.
* **Network Cache Purging**: Locks clear ONLY temporary network API caches (`dr_cat_synced_db`). When the lock is deactivated or the APK is updated, `window.location.reload()` restores active UI with 100% of user data intact.

### 3. Localhost-Only Authentication
* `/api/login` is locked to loopback IP addresses (`127.0.0.1`, `::1`).
* Handles proxy layers (Ngrok/Cloudflare tunnels) by inspecting `X-Forwarded-For` header.
* Remote users only see the app in read-only/suggestion mode.

### 4. PBKDF2 Password Hashing
* Admin passwords are never stored in plain text.
* `set_admin_password.js` hashes passwords using PBKDF2 with a random 16-byte salt and 100,000 iterations, identical to the server's verification logic.
* The resulting `salt:hash` pair is stored in `admin_password.txt` (Git-ignored).

### 5. Dynamic Token Generation & HTML Sanitization
* Logins yield a 32-character hex token from `crypto.randomBytes(16).toString('hex')`.
* Stored in a server-side memory `Set`, verified on every administrative API call.
* User-submitted suggestions are escaped at rendering time via `escapeHTML()` (XSS Prevention).

### 4. Admin UI Gating
* The **Admin** button is hidden by default for all remote users.
* On page load, the client queries `/api/is-local`. The server checks the raw TCP socket IP.
* `isLocal: true` → Admin button appears. `isLocal: false` → permanently hidden.

---

## 📊 Telemetry & Developer Tooling

### Telemetry Engine (`performance.js`)
* Captures boot phase milestones using `performance.now()` into a dedicated in-memory `perfLogBuffer`.
* Intercepts all `click` events (capture phase) to profile UI interaction latency.
* Completely isolated from `console.*` — zero spam in the main debug console.

### Mobile Debug Console (`debug-console.js`)
* Floating 🐛 button overlay activates a full log viewer.
* Patches `window.fetch` and `XMLHttpRequest` to log all network requests with status codes and timing.
* Supports Copy and Clear operations for sharing logs.

### Diagnostics Panel (`components/diagnostics.js`)
* Pings core API endpoints and displays latency in real time.
* Shows last sync timestamp, active provider URL, and PDF index coverage.
* Allows exporting the full diagnostics snapshot as a JSON file.

---

## 🚨 Server-Controlled Force Update, Kill Switch & Anonymous Telemetry

### 1. Multi-Source Mandatory Force Update System (`v1.1.6`)
* **Server Version Config Store (`server/config/version.json`)**: Persists `minVersion`, `latestVersion`, `forceUpdateActive`, `updateMessage`, `releaseNotes`, and multi-source `downloadLinks`.
* **Numeric Version Guard Middleware (`server/middleware/version-guard.js`)**: Inspects `X-App-Version` headers on incoming API calls. Compares semantic version numbers numerically (`compareVersions`). Responds with `HTTP 426 Upgrade Required` when `forceUpdateActive: true` and client version `< minVersion`.
* **Target-Specific Lockout**: Native Android APKs send `X-App-Version` and are strictly locked out when outdated. Web browser clients (without `X-App-Version`) pass through cleanly to receive live server assets.
* **Route Exclusion Guarantee**: Excludes `/api/version`, `/api/admin/version`, `/api/server-providers`, and static assets from version checks to prevent administrative deadlocks.
* **Client Lock Gate & Offline Resilience (`public/js/version-checker.js`)**: Encapsulates lock state inside an IIFE closure. Purges non-essential browser caches (`wipeStorageOnLock()`) while explicitly preserving `dr_cat_install_id`. Attaches a DOM `MutationObserver` to prevent DevTools element deletion tampering.

### 2. Anonymous Installation ID & Device Telemetry Engine
* **Persistent Device Token (`public/js/install-id.js`)**: Generates a persistent UUID (`drcat-inst-${crypto.randomUUID()}`) saved in `localStorage`. Automatically attached to all outgoing API calls via `X-Install-ID` header.
* **Server Active Device Tracker (`server/services/active-devices.js`)**: Records unique installation tokens, app versions, platform types (`android_apk` vs `web_pwa`), and request frequencies.
* **Debounced Persistence (`server/data/active_devices.json`)**: Writes updated device data asynchronously using a 10-second debounce timer to eliminate disk I/O thrashing.
* **Protected Admin Analytics Endpoint (`GET /api/admin/active-devices`)**: Protected by `x-api-key`. Computes Total Devices, Daily Active Users (DAU - 24h), Monthly Active Users (MAU - 30d), and Version Distribution ratios.

### 3. Standalone Analytics Lab UI (`analytics_lab.html` v1.5.3)
* **Protected Localhost Interface**: HTML route protected in `server/index.js` via `isLocalhostConnection(req)` (identical security tier to `pdf_lab.html`).
* **Rich Telemetry Suite (v1.5.3)**:
  - **Real-Time Live Users Card (`🟢 En Ligne < 5 min`)**: Instantaneous visibility into active beta testers currently connected (5-minute sliding window).
  - **Dev/Admin IP Auto-Whitelisting & Classification**: Requests from localhost, admin session tokens, or known admin IPs are automatically tagged as `isAdminDevice: true`, completely isolating developer self-testing from external beta metrics without compromising route security.
  - **Manual Dev/External Toggle Button**: 1-click `[ -> Dev ]` / `[ -> Externe ]` button in the UI table to override classification for any device (`POST /api/admin/active-devices/toggle-admin`).
  - **Universal Client Headers**: `public/js/api.js` transmits explicit `x-device-platform` (`android_apk` vs `web_pwa`) and dynamic package version (`x-app-version: 1.5.3`).
  - **Telemetry Reset with Safety Modal**: Protected endpoint `POST /api/admin/active-devices/reset` guarded by an in-app confirmation modal dialog.
  - **Multi-Window Metrics**: Displays 🟢 Live (<5 min), ⚡ Recent (<1h), 📅 DAU (24h), and 📆 MAU (30d) counters with external vs dev user breakdown.
  - **1-Click CSV Spreadsheet Exporter**: Exports detailed device telemetry (`drcat_active_devices_YYYY-MM-DD.csv`).
  - **Auto-Refresh Toggle**: 10-second live polling loop.

---

## 🌐 Web RAG Pipeline & Generator Lab Architecture (v1.5.4 & v1.5.5)

### 1. Incremental Web RAG Top-Up & Cache Management (v1.5.4)
* **Incremental Top-Up Mode (`fetchAndCacheWebSources`)**:
  - When re-running Web Fetch on any CAT, the fetcher inspects existing disk cache files in `cat_db_generator/web_cache/<folder>/`.
  - If cached files are present but fewer than `maxSources: 6`, it preserves all existing cache files and queries online only for missing guidelines from Wikipedia Medical FR, MedG Consensus, and MSD Manuals.
* **1-Click Cache Purge & Force Online Refetch**:
  - **Single & Global Purge Endpoints (`POST /api/admin/cat-generator/clear-web-cache`)**: Supports deleting cache files for a single CAT title or purging the entire `web_cache/` directory cleanly.
  - **Master Batch Controls**: Added global header buttons (`Recharger Web Global` and `Vider Tout Cache Web`) in `admin/cat_generator_lab.html` alongside per-CAT table actions.

### 2. Client-Server Background Sync Timestamp Type Normalization (v1.5.5)
* **Problem**: Clients issue delta sync queries sending epoch milliseconds (`GET /api/cats?since=1785700000000`). Database records promoted from the Generator Lab formatted `updatedAt` as ISO strings (`"2026-08-03T23:17:08.210Z"`). In JavaScript array filtering, comparing a string directly with a number (`isoString > numericMs`) evaluates to `NaN > number` (`false`), causing silent exclusion of modified records.
* **Resolution (`server/routes/cats.js`)**: The API endpoint normalizes all `updatedAt` values at runtime:
  ```javascript
  const catTime = typeof c.updatedAt === 'number' ? c.updatedAt : new Date(c.updatedAt).getTime();
  return !isNaN(catTime) && catTime > since;
  ```
  Guarantees 100% reliable delta sync detection across all Android APK versions and PWAs.

---

## ⚡ Serverless Cloudflare Edge API & Protocole ACK (v1.7.9)

### 1. Engine Edge Serverless (`worker.js` & `wrangler.jsonc`)
* **Execution Native Edge (24/7)** : `drcat.dr-cat.workers.dev` exécute nativement les endpoints de l'application (`POST /api/suggestions`, `GET /api/server-providers`, `GET /api/search-status`, `GET /api/version`) directement sur les serveurs Edge de Cloudflare (~90ms).
* **Persistance Cloudflare KV (`SUGGESTIONS_KV`)** : Les propositions soumises par les utilisateurs web du monde entier sont enregistrées 24/7 dans la base clé-valeur Cloudflare (`d569bf8299a545f182c9e6acedd4d6aa`).
* **Multi-Provider Failover Registry** :
  - **Primary (Priority 1)** : `https://drcat.dr-cat.workers.dev` (Cloudflare Worker Edge)
  - **Secondary (Priority 2)** : `https://rendition-duchess-dry.ngrok-free.dev` (Termux Backend Tunnel)

### 2. Handshake ACK & Purge 2-Voies (`server/services/sync-suggestions.js`)
* **Accusé de Réception (`POST /api/suggestions/ack`)** : Lors du démarrage de Termux ou de l'ouverture du Panneau d'Administration, le serveur local interroge Cloudflare KV, stocke les propositions dans `suggestions.json`, et envoie immédiatement un signal ACK (`{ ids: [...] }`) à Cloudflare pour purger les éléments reçus de la file d'attente du cloud.
* **Purge lors de la Décision (`DELETE /api/suggestions/:id`)** : Lorsque l'administrateur valide ou rejette une proposition dans Termux, un appel DELETE purge définitivement la fiche de la base Cloudflare KV pour éviter toute réapparition en boucle.
* **Smart Upsert Engine (`server/routes/suggestions.js`)** : Lors de l'approbation d'une proposition, le serveur vérifie la présence d'une CAT existante par ID ou titre identique. Si la carte existe, elle est mise à jour in-place (`"offline"` ➔ `"offlineh"`) sans générer de doublons orphelins dans la base de données.



