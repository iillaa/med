# Technical Architecture (technical_architecture.md) 📐

This document provides a deep dive into the architectural design, security mechanisms, offline-first logic, and data flow of **Dr. CAT**.

---

## 🏗️ System Architecture Overview

Dr. CAT operates in a **Dual-Mode Hybrid Architecture** across two runtime environments:

```text
1. Node.js/Termux Server Web App (Online mode)
   [Mobile Browser / APK WebView] <--- HTTP / REST ---> [Express.js Backend (server.js)]
                                                               |
                                                     [Local JSON Databases]
                                                     [PDF index.json]
                                                     [AsyncLock write queue]

2. Standalone Capacitor Android Wrapper (Offline mode)
   [Android WebView (Capacitor)] <---> [API Router (api.js)]
                                              |
                                    [localStorage overrides]
                                    [Bundled data/ JSONs]
                                    [server-providers.js sync]
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

### 1. `remote_server_config.json` (Server-Side)
The server owner stores all active tunnel URLs here. This file is Git-ignored and updated via the Admin Diagnostics Panel or manual edit:
```json
{
  "primaryProvider": "ngrok",
  "urls": ["https://your-active-tunnel.ngrok-free.dev"]
}
```

### 2. `build.js` Compilation
At build time, `build.js` reads `remote_server_config.json` and generates `public/js/remote_config.js` (Git-ignored), baking the URLs directly into the APK bundle:
```js
window.REMOTE_SERVER_URLS = ["https://your-active-tunnel.ngrok-free.dev"];
```

### 3. `server-providers.js` (Client-Side)
The provider registry detects which tunnel type each URL belongs to (Ngrok, Cloudflare, or custom domain) and returns the correct bypass headers needed for clean CORS fetches:
* **Ngrok**: injects `ngrok-skip-browser-warning: true` header.
* **Cloudflare**: standard fetch, no bypass needed.
* **Custom domain**: standard fetch.

### 4. Background Sync Loop
`api.js` runs a background `setInterval` loop every ~30 seconds that:
1. Reads the active provider URL from `server-providers.js`.
2. Performs a **standard CORS fetch** (not `no-cors`) with the correct provider headers.
3. On success: switches mode to `android_online`, syncs cats and suggestions.
4. On failure: keeps `android_offline` mode, loads from local bundle without blocking the UI.

> **Why not `no-cors`?** `mode: 'no-cors'` returns opaque responses with status `0` even when the server returns an HTML interstitial page (like Ngrok's phishing warning). This created false-positive "online" transitions. Standard CORS with provider bypass headers is the only reliable connectivity check.

---

## 📄 PDF Text Search & Indexing Engine

The PDF search engine runs locally on Termux and compiles binary page contents into a fast indexed database.

### 1. Checksum Optimization
To avoid re-parsing large medical directories on every restart:
* The indexer compares each file's `mtime` and `size` against records in `pdf_index.json`.
* Only new or modified files are parsed. Unchanged files use their cached page text.

### 2. Coverage Scoring
Each PDF is assigned a coverage badge:
* 🟢 **Green** (Fully Searchable): ≥90% of pages contain extractable text.
* 🟡 **Orange** (Partial): Between 30%–90% of pages are text-bearing.
* 🔴 **Red** (Image-Only / Unsearchable): <30% of pages contain text.

### 3. Text Parser
* Extracts contents page-by-page using `pdf-parse`.
* Builds an array of page objects with plain text strings stored in `pdf_index.json`.

---

## 📶 Offline-First Capabilities & PWA

* **App Mode at Startup**: `main.js` calls `api.getAppMode()` which checks host, protocol, and Capacitor UA to assign the correct data routing strategy before any network call is made.
* **Service Worker (PWA)**: Uses a **Network-First** strategy. Browser clients always load fresh server assets when online, and fall back to cached copies when offline.
* **Capacitor CORS Allowlist**: The server explicitly allows Capacitor webview origins (`http://localhost`, `capacitor://localhost`) in its dynamic CORS origin list, enabling the Android APK's WebView to make authenticated API calls.

---

## 🔒 Security & Admin Hardening

### 1. Localhost-Only Authentication
* `/api/login` is locked to loopback IP addresses (`127.0.0.1`, `::1`).
* Handles proxy layers (Ngrok/Cloudflare tunnels) by inspecting `X-Forwarded-For` header.
* Remote users only see the app in read-only/suggestion mode.

### 2. PBKDF2 Password Hashing
* Admin passwords are never stored in plain text.
* `set_admin_password.js` hashes passwords using PBKDF2 with a random 16-byte salt and 100,000 iterations, identical to the server's verification logic.
* The resulting `salt:hash` pair is stored in `admin_password.txt` (Git-ignored).
* On first run, if no password file exists, `server.js` auto-generates a long random password and writes the hashed credentials.

### 3. Dynamic Token Generation
* Logins yield a 32-character hex token from `crypto.randomBytes(16).toString('hex')`.
* Stored in a server-side memory `Set`, verified on every administrative API call.
* Cleared on logout or server restart.

### 3. HTML Sanitization (XSS Prevention)
* User-submitted suggestions are escaped at rendering time via `escapeHTML()` before being injected into the DOM.

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
