# Technical Architecture (technical_architecture.md) 📐

This document provides a deep dive into the architectural design, security mechanisms, offline-first logic, and data flow of **Dr. CAT**.

---

## 🏗️ System Architecture Overview

Dr. CAT is designed as an offline-first clinical helper. It operates in two environments:

```text
1. Node.js/Termux Server Web App (Online mode)
   [Mobile Browser] <--- HTTP / REST ---> [Express.js Backend (server.js)]
                                                |
                                           [Local JSON Files]
                                           [PDF index.json]

2. Standalone Capacitor Android Wrapper (Offline mode)
   [Android Webview (Capacitor)] <---> [Client Router (api.js)]
                                                |
                                      [Web storage overrides]
                                      [Bundled local JSONs]
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

### 2. Client Storage Overrides
In offline Capacitor mode, data modifications cannot be saved directly to the read-only application package directory:
* **Custom CATs**: Stored as an array of JSON objects inside `localStorage` under `dr_cat_custom_created_cats`.
* **Modifications**: Field overrides (e.g. customized summaries or status badges) are stored under `dr_cat_local_overrides`.
* These overrides are merged into the default bundled clinical data at startup in `main.js`.

---

## 📄 PDF Text Search & Indexing Engine

The PDF search engine runs locally on Termux and compiles binary page contents into a fast indexed database.

### 1. Cheksum Optimization
To avoid parsing large medical directories on every restart:
* The indexer reads the directory and compares the current file's modification time (`mtime`) and `size` against records in `pdf_index.json`.
* Only new or modified files are parsed.

### 2. Text Parser
* Extracts contents page-by-page using `pdf-parse`.
* Builds an array of page objects with plain text strings:
  ```json
  {
    "pdf": "Cardiologie.pdf",
    "size": 125439,
    "mtime": 17823940283,
    "pages": [
      { "page": 1, "text": "Page 1 Content..." },
      { "page": 2, "text": "Page 2 Content..." }
    ]
  }
  ```

---

## 📶 Offline-First Capabilities & PWA

* **Startup Online Detection**:
  During `initApp()` execution in `main.js`, the app queries `navigator.onLine`. If the device is offline, edit buttons are hidden, disabling server connection issues. If the device is online, suggestions can be proposed, which are sent directly to `REMOTE_SERVER_URL` when configured.
* **PWA Caching**:
  A standard `service-worker.js` registers event listeners for static asset fetch requests. If the network fails, it falls back to serving cached stylesheets, icons, and scripts.

---

## 🔒 Security & Admin Hardening

Dr. CAT enforces strict security controls to restrict administrative rights to the hosting device:

### 1. Localhost Only Authentication
* The route `/api/login` is locked down to connections originating from loopback IP addresses (`127.0.0.1`, `::1`).
* This blocks remote hackers from trying to guess passwords, as they can only view the app in read-only/suggestion mode.
* The check handles proxy layers (e.g. ngrok tunnels) by inspecting the `X-Forwarded-For` header and checking for external IPs.

### 2. Dynamic Token Generation
* Successful local logins yield a 32-character hex token generated via `crypto.randomBytes(16).toString('hex')`.
* Tokens are stored in a server-side memory `Set` and verified on every administrative API call.
* Tokens are cleared on logout or server restarts.

### 3. HTML Sanitization
* User submitted suggestions are escaped at rendering time using text-node assignments or explicit HTML-escaping utility functions to prevent XSS payloads.
