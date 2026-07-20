# Diagnostics & Logging Tools Panel — Product Specification

**Feature**: Diagnostics & Logging Tools Panel (Phase 4, Priority P0)  
**Audience**: AI coding agent + human developer  
**Goal**: Build an admin-only diagnostics interface that helps diagnose why the mobile app cannot connect to the remote server, fails to send suggestions, and fails to receive database updates.

---

## 1. Product Mission

The user has a medical review app (Dr. CAT) running on Termux/Android. The app works perfectly on localhost, but when trying to use it through a tunnel from another device, it fails silently:
- Suggestions submitted by non-admin users don't reach the server
- Database updates don't sync back to clients
- The app appears to be "offline" even when internet is available

The Diagnostics Panel exists to surface **why** these failures happen, by exposing:
1. What the app thinks its connection state is (online/offline/standalone)
2. Whether the tunnel is actually reachable from the device
3. What errors are occurring in the console/logs
4. Whether the remote server URL is configured correctly
5. Server-side health (database size, PDF index status, memory)

The panel must allow the user to **copy logs** so they can paste them into a chat with an AI agent for faster debugging.

---

## 2. User Story

> As an admin user,  
> I want to open a diagnostics panel from the dashboard,  
> So that I can see exactly why my mobile app cannot connect to the remote server, copy the error logs, and fix the configuration.

**Acceptance Criteria**:
- The panel is only visible to admin users (same gating as the moderation panel)
- The panel shows connection status, tunnel status, server stats, DB stats, and console logs
- The user can manually trigger a connectivity test and see step-by-step results
- The user can copy all visible logs to clipboard with one click
- The user can change the REMOTE_SERVER_URL at runtime and test it immediately
- The panel does not crash if any single data source fails — it shows "N/A" or "Erreur" gracefully

---

## 3. Core Features (Missions)

### 3.1 Connection Status Overview
Show the current detected state of the app's connectivity at a glance:
- Is the browser/WebView online according to `navigator.onLine`?
- Does the app consider itself "offline standalone" (`api.isOfflineApp`)?
- What remote server URL is configured (if any)?
- Is the admin token present and valid?

### 3.2 Manual Connectivity Test ("Tester la connexion")
A button that runs a sequence of pings and shows results for each step:
1. Ping the local server (if running on same device): `GET /api/search-status`
2. Ping the configured remote server: `GET <remote-url>/api/search-status`
3. Test general WAN connectivity: `HEAD https://httpbin.org/status/200`
4. Show the user-agent string to identify if running in Capacitor WebView, Chrome, etc.

Each step shows a status badge (success/failure/pending) and the raw result or error message.

**Critical for tunnel debugging**: If step 2 fails with a CORS error, the user knows to add CORS headers on their server. If it fails with timeout, the tunnel likely expired.

### 3.3 Tunnel Inspection
Specific section for the configured tunnel provider:
- Show the configured public URL
- Try to reach the provider's local management API **from the server side** to confirm the tunnel is still alive on the host
- Show the tunnel status (active, expired, not running)

This requires a new backend endpoint because the browser cannot reach the management API on the server machine.

### 3.4 Server System Info
Show backend health:
- Node.js version
- Operating system / architecture
- Server uptime
- Memory usage (RSS, heap)
- Whether PDF indexing is currently running

### 3.5 Database Stats
Show database health:
- Total CAT fiches loaded (core vs custom)
- Total suggestions waiting for moderation
- File sizes on disk: `cats_db.json`, `suggestions.json`, `pdf_index.json`

### 3.6 PDF Index Status
Show PDF indexing health:
- Total reference PDFs found in `.cat-med/reference-pdfs/`
- Total pages indexed
- How many are fully indexed (green), partially indexed (orange), or empty (red)
- Last index timestamp

### 3.7 Server Provider List (read-only in the panel)
The authoritative server list is owned by the server (`remote_server_config.json`) and is configured out-of-band via `node set_server_provider.js` (mirrors the admin-password setup) or the CI `REMOTE_SERVER_URL` secret — **not** from the Diagnostics panel.

The Diagnostics "Serveurs Distants Configurés" card is therefore **read-only**: it displays the list the client learned from `GET /api/server-providers`, and the connectivity test pings every configured server. To change the list, run `set_server_provider.js` (or `POST /api/server-providers` as admin); CORS is refreshed live so no restart is needed for already-running servers. The client additionally records per-server health and orders requests by priority then health (failover + load-balancing).

### 3.8 Console Log Capture and Copy
Capture `console.warn`, `console.error`, and `console.info` messages into an in-memory buffer while the panel is open:
- Show the last 50 log entries in a scrollable terminal-like window
- Each entry shows: timestamp, severity badge (WARN/ERROR/INFO), message
- "Copier" button copies all visible logs to clipboard as formatted plain text
- "Vider" button clears the log buffer

The capture should only be active while the panel is open to avoid memory bloat.

---

## 4. API Contracts (What the Frontend Expects)

These are the contracts the backend must fulfill. The agent implementing the backend should treat these as **interfaces**, not suggestions.

### 4.1 `GET /api/diagnostics/system`
**Auth**: Admin only  
**Returns**:
```json
{
  "nodeVersion": "v22.22.1",
  "platform": "linux",
  "arch": "x64",
  "uptimeSeconds": 1234,
  "memoryUsage": {
    "rss": 12345678,
    "heapTotal": 9876543,
    "heapUsed": 7654321,
    "external": 123456
  },
  "indexingActive": false,
  "indexPath": "/path/to/pdf_index.json"
}
```
**Error response**: `{ "error": "Failed to get system diagnostics" }` with HTTP 500

### 4.2 `GET /api/diagnostics/db-stats`
**Auth**: Admin only  
**Returns**:
```json
{
  "totalCats": 57,
  "coreCats": 55,
  "customCats": 2,
  "totalSuggestions": 3,
  "catsDbSize": 144000,
  "suggestionsSize": 1200,
  "indexSize": 936000
}
```
**Error response**: `{ "error": "Failed to get DB stats" }` with HTTP 500

### 4.3 `GET /api/diagnostics/index-detail`
**Auth**: Admin only  
**Returns**:
```json
{
  "totalDocs": 78,
  "totalPages": 45230,
  "indexedAt": "2026-06-30T14:00:00.000Z",
  "docs": [
    {
      "pdf": "Cardiologie.pdf",
      "status": "green",
      "pagesWithText": 120,
      "totalPages": 120
    }
  ]
}
```
Status values: `"green"` (≥90% pages have text), `"orange"` (≥5%), `"red"` (<5%)  
**Error response**: `{ "error": "Failed to get index details" }` with HTTP 500

### 4.4 `GET /api/server-providers`
**Auth**: Public (no admin required — the client needs it to learn the list)  
**Returns** the authoritative server list:
```json
{
  "primaryProvider": "ngrok",
  "servers": [
    { "url": "https://xxxx.tunnel-provider.com", "provider": "ngrok", "priority": 1 }
  ]
}
```
If nothing is configured, returns `{ "primaryProvider": null, "servers": [] }`.

### 4.5 `POST /api/server-providers`
**Auth**: Admin only (localhost + admin token)  
**Request body** (either shape is accepted):
```json
{ "servers": [ { "url": "https://xxxx.tunnel-provider.com", "priority": 1 } ] }
```
or, for convenience:
```json
{ "urls": [ "https://xxxx.tunnel-provider.com" ] }
```
**Validation**: each URL must start with `http://` or `https://`.  
**Side effects**: persists to `remote_server_config.json` (git-ignored) and recomputes the CORS allowlist live.  
**Returns**:
```json
{ "success": true, "primaryProvider": "ngrok", "servers": [ { "url": "https://xxxx.tunnel-provider.com", "provider": "ngrok", "priority": 1 } ] }
```
**Error responses**:
- `400`: `{ "error": "Provide \"servers\" (array) or \"urls\" (array)." }`
- `500`: `{ "error": "Failed to update server providers" }`

### 4.6 `GET /api/diagnostics/tunnel-info`
**Auth**: Admin only  
**Purpose**: Proxies the tunnel provider's local management API from the server machine, so the mobile app can check if the tunnel is alive.  
**Returns** (success):
```json
{
  "tunnels": [
    {
      "public_url": "https://xxxx.tunnel-provider.com",
      "proto": "https",
      "config": { "addr": "3000" },
      "metrics": { "conns": { "count": 5, "gauge": 1 } }
    }
  ]
}
```
**Returns** (tunnel not running):
```json
{ "error": "tunnel provider not running" }
```
**Implementation note**: The endpoint should make an HTTP request to the provider's management API from the server process. If the connection is refused or times out, return the error JSON above. Do not crash the server if the tunnel provider is not running.

---

## 5. Frontend Architecture

### 5.1 New Utilities Needed in `public/js/utils.js`

| Export | Purpose |
|--------|---------|
| `formatBytes(bytes, decimals?)` | Convert bytes to human-readable string (B, KB, MB, GB) |
| `copyToClipboard(text)` | Copy text to clipboard using Clipboard API with fallback to hidden textarea + execCommand |
| `captureConsoleWarnings(enable)` | Monkey-patch `console.warn`/`console.error`/`console.info` into an in-memory ring buffer (max 50 entries). Enable when panel opens, conceptually disable when closed. |
| `getDiagnosticsLogs()` | Return a copy of the current log buffer |
| `clearDiagnosticsLogs()` | Empty the log buffer |
| `escapeHtml(str)` | Already exists — use everywhere user data is rendered |

### 5.2 New API Functions Needed in `public/js/api.js`

| Export | Purpose |
|--------|---------|
| `pingEndpoint(url, timeoutMs?)` | Generic GET ping with AbortController timeout. Returns `{ ok, status, statusText, error, message }`. |
| `fetchDiagnosticsSystem()` | `GET /api/diagnostics/system` |
| `fetchDiagnosticsDbStats()` | `GET /api/diagnostics/db-stats` |
| `fetchDiagnosticsIndexDetail()` | `GET /api/diagnostics/index-detail` |
| `fetchDiagnosticsRemoteUrl()` | `GET /api/server-providers` |
| `updateServerProviders(payload)` | `POST /api/server-providers` |

The existing `checkRealConnection()` function (in `api.js`) should be considered for refactoring to reuse `pingEndpoint()` internally, but **do not break the existing WAN/LAN ping behavior** that the main app depends on.

### 5.3 New Component: `public/js/components/diagnostics.js`

A new component file responsible for the diagnostics panel. It should:
- Be initialized from `main.js` (similar to how `dashboard.initDashboard()` and `quiz.initQuiz()` are called)
- Manage all DOM references for the panel
- Handle the toggle (show/hide) and start/stop console capture
- Fetch data from the new API endpoints and render it
- Handle button clicks (ping test, tunnel check, save URL, copy logs, clear logs)
- Render console logs with timestamps and severity badges
- Generate a simple automatic diagnosis based on ping results (e.g., "Tunnel may have expired — restart the tunnel on your server")

**Integration point in `main.js`**:
```javascript
import * as diagnostics from './components/diagnostics.js';
// After dashboard.initDashboard(...):
diagnostics.initDiagnostics();
```

### 5.4 HTML Placement (`public/index.html`)

Add the diagnostics panel inside the dashboard section, **after** the admin moderation panel and **before** the dashboard content split. It should:
- Be wrapped in a container with `style="display: none;"` by default
- Only be shown when `state.isAdmin === true` (controlled by CSS or JS)
- Use a toggle button to expand/collapse its contents
- Follow the same visual style as the existing dashboard blocks (glassmorphism, dark theme)

The trigger to show the panel should be visible only to admins, similar to how the "Connexion Admin" button is shown only on localhost. A good UX pattern: add a small link/button **inside** the admin moderation panel header like `"< Outils de diagnostic"` that toggles the diagnostics panel below.

### 5.5 State Additions (`public/js/state.js`)

No new global state is strictly required because the diagnostics component can manage its own DOM and fetch calls. However, if you want to expose diagnostics state for testing, you could add:
```javascript
diagnostics: {
  logs: [],
  isPanelOpen: false,
  lastPingResults: []
}
```
This is optional.

---

## 6. UI Layout Description

The panel should look like this when expanded:

```
┌──────────────────────────────────────────────────┐
│  🩺 Outils de Diagnostic                    ▼   │
│  Informations système et tests de connectivité  │
├──────────────────────────────────────────────────┤
│                                                  │
│  ┌─ Connexion ─────────────────────────────────┐ │
│  │ Navigator.onLine : ✅ En ligne              │ │
│  │ Mode détecté   : Mode serveur               │ │
│  │ URL distant    : https://xxxx.tunnel-provider.com │ │
│  │ Token admin    : ✅ Serveur                  │ │
│  │                                              │ │
│  │ [⚡ Tester la connexion]                     │ │
│  │                                              │ │
│  │ Step 1: localhost:3000 → ✅ 200 OK           │ │
│  │ Step 2: remote URL  → ❌ CORS error         │ │
│  │ Step 3: WAN          → ✅ Accessible         │ │
│  │                                              │ │
│  │ 🔍 Diagnostic: Le serveur distant bloque les  │ │
│  │ requêtes CORS. Ajoutez les en-têtes CORS sur │ │
│  │ votre serveur.                               │ │
│  └──────────────────────────────────────────────┘ │
│                                                  │
│  ┌─ Serveur Distant ─────────────────────────────┐ │
│  │ Tunnel actif : ✅ Actif                      │ │
│  │ URL publique : https://xxxx.tunnel-provider.com   │ │
│  │                                              │ │
│  │ [🔄 Vérifier le tunnel]                      │ │
│  │ L'API du tunnel est accessible sur localhost:4040│ │
│  └──────────────────────────────────────────────┘ │
│                                                  │
│  ┌─ Serveur Local ─────────────────────────────┐ │
│  │ Node: v22.22.1  OS: linux / x64             │ │
│  │ Uptime: 2h 14m   Mémoire: 45 MB             │ │
│  │ Indexation: ✅ Inactif                       │ │
│  └──────────────────────────────────────────────┘ │
│                                                  │
│  ┌─ Base de Données ───────────────────────────┐ │
│  │ Total CATs : 57 (55 core, 2 custom)         │ │
│  │ Suggestions: 3 en attente                    │ │
│  │ cats_db.json: 144 KB  suggestions: 1.2 KB   │ │
│  └──────────────────────────────────────────────┘ │
│                                                  │
│  ┌─ Index PDF ─────────────────────────────────┐ │
│  │ Documents: 78  Pages: 45,230                │ │
│  │ Indexé le : 30/06/2026 14:00                │ │
│  │ 🟢 70 · 🟡 5 · 🔴 3                         │ │
│  └──────────────────────────────────────────────┘ │
│                                                  │
│  ┌─ Serveur Distant ───────────────────────────┐ │
│  │ URL: [https://xxxx.tunnel-provider.com      ]     │ │
│  │ [💾 Sauvegarder]                             │ │
│  │ Statut: ✅ URL mise à jour et testée         │ │
│  └──────────────────────────────────────────────┘ │
│                                                  │
│  ┌─ Logs Console ──────────────────────────────┐ │
│  │ [📋 Copier]  [🗑 Vider]                      │ │
│  │ ┌──────────────────────────────────────────┐ │ │
│  │ │ [14:32:01][WARN] Failed to fetch index   │ │ │
│  │ │ [14:32:02][ERROR] 403 on /api/suggestions │ │ │
│  │ │ [14:32:03][INFO] Admin mode: true        │ │ │
│  │ └──────────────────────────────────────────┘ │
│  └──────────────────────────────────────────────┘ │
│                                                  │
└──────────────────────────────────────────────────┘
```

---

## 7. Behavior Rules

1. **Admin-only visibility**: The panel container is rendered in HTML but hidden via `display: none`. A small toggle link inside the admin moderation panel reveals it. If `state.isAdmin === false`, the toggle link is not shown at all.

2. **Graceful degradation**: Every section that fetches from an API endpoint must handle failures. If `/api/diagnostics/system` fails (e.g., server offline), show `"Erreur: impossible de récupérer les informations système"` in red — do not crash the panel, do not break other sections.

3. **Console capture only when open**: `captureConsoleWarnings(true)` is called when the panel toggles open. `captureConsoleWarnings(false)` is called when it toggles closed. This prevents the ring buffer from growing unbounded during normal app usage.

4. **No external dependencies**: Do not add new npm packages. Use only what already exists in the project (Express, vanilla JS, FontAwesome icons from CDN).

5. **Mobile-friendly**: The panel is vertically stacked. On narrow screens, the `diag-grid` sections should collapse to single-column using `grid-template-columns: 1fr` or the existing responsive patterns in the app.

6. **Copy format**: When the user clicks "Copier", the clipboard receives plain text:
   ```
   [14:32:01][WARN] Failed to fetch PDF index: NetworkError
   [14:32:02][ERROR] 403 Forbidden on /api/suggestions
   ```
   One log entry per line. This is easy to paste into a chat with an AI agent.

7. **Language**: All user-facing text in French, matching the existing app. All code comments in English or French (consistent with the existing codebase style).

---

## 8. Integration Points with Existing Code

| Existing File | What to hook into |
|---------------|-------------------|
| `public/js/main.js` | Import and call `diagnostics.initDiagnostics()` after other component inits |
| `public/js/api.js` | Add new `fetchDiagnostics*` exports and `pingEndpoint()`. Do not modify existing `checkRealConnection()` behavior — it drives the main app's online/offline detection. |
| `public/js/utils.js` | Add new utility exports (`formatBytes`, `copyToClipboard`, `captureConsoleWarnings`, `getDiagnosticsLogs`, `clearDiagnosticsLogs`) |
| `public/js/state.js` | Optional: add `diagnostics` sub-object to `state` if the agent wants centralized state |
| `public/js/components/dashboard.js` | Optionally add the toggle link inside the admin moderation panel header. Alternatively, put the toggle in the new diagnostics panel itself (simpler). |
| `server.js` | Add 5 new routes under `/api/diagnostics/*`. Load `remote_server_config.json` on startup (add to `initializeData()`). The `indexPdfs` module and `indexState` are already available. |
| `.gitignore` | Ensure `remote_server_config.json` is added so the persisted URL doesn't leak to GitHub |

---

## 9. What NOT to Do

- Do not add new npm dependencies (no `axios`, no `clipboard-polyfill`, no external monorepo tools). Use native browser APIs and Express built-ins.
- Do not modify the existing `checkRealConnection()` flow in `api.js` — it is used by the main app's startup sequence and periodic network checks. Extract shared logic into `pingEndpoint()` instead.
- Do not make the panel visible to non-admin users. This is a debugging tool for the doctor who owns the server.
- Do not store logs to disk. The buffer is in-memory only and cleared when the panel is closed or the page is reloaded.
- Do not auto-submit suggestions or modify database state. The panel is read-only, including the server-provider list (configure it via `node set_server_provider.js`, which mirrors the admin-password setup).
- Do not replace the existing admin moderation panel. Add diagnostics as a separate section below it.

---

## 10. Success Criteria

When this feature is complete, the user should be able to:

1. Open the app as admin on their Android device
2. Open the Diagnostics Panel from the dashboard
3. Click "Tester la connexion" and see exactly which step fails (localhost, remote server, or WAN)
4. See a human-readable diagnosis like "CORS bloqué" or "Tunnel expiré"
5. Click "Copier" on the logs section and paste the full log into a chat with their AI agent
6. Configure the server-provider list with `node set_server_provider.js` (mirrors the admin-password setup), restart the server, and confirm the panel's read-only "Serveurs Distants Configurés" card shows the new list and the connectivity test pings every server.
7. Confirm via the tunnel section that the tunnel is still alive on the host machine

If all 7 are true, the feature is done.
