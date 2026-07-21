# Dr. CAT — Codebase Audit Prompts Report

This report presents the findings and evaluation of the **Dr. CAT** codebase according to the requirements specified in the 9 system audit prompts.

---

## 01 — Security Audit (You are a Security Engineer)

### Issue 1: Authentication Timing & Dictionary Attacks
* **File/area**: `server.js` (Endpoint `POST /api/login`)
* **Severity**: 🟠 Orange
* **Attack scenario**: An attacker attempts to brute-force the administrator password by sending rapid parallel authentication requests from different IPs to avoid the single-IP rate limiter.
* **Business impact (plain English)**: If an attacker guesses the admin password, they gain access to edit diagnostic guides and suggestions, potentially publishing incorrect medical instructions to doctors.
* **Fix (one sentence)**: Enforce timing-safe string comparisons and implement a global rate-limiting cooldown window across all login requests regardless of IP.
* **Code example (minimal)**:
  ```javascript
  const crypto = require('crypto');
  // Timing safe comparison:
  const match = crypto.timingSafeEqual(Buffer.from(inputHash), Buffer.from(storedHash));
  ```

---

## 02 — Missing Systems Audit

### Missing System 1: Real-Time Alerting / Telemetry Exporter
* **Category/system**: Observability & Alerting
* **Risk**: Critical server events (e.g. database disk failures or authentication brute-forces) are logged locally to `audit.log` but do not trigger notifications.
* **Priority (P0/P1/P2)**: P1
* **Fix (one sentence)**: Configure a webhook exporter to send high-severity audit logs directly to a secure medical alerts channel (e.g., Telegram/Slack/Email).
* **How to verify**: Trigger a fake high-severity event (like 10 consecutive login failures) and verify that the notification arrives in the destination channel.

### Missing System 2: Application Version Rollback Tooling
* **Category/system**: Deployments / disaster recovery
* **Risk**: If a corrupted bulk JSON file is imported by the admin, there is no automated interface to instantly restore the previous database snapshot without manually accessing the filesystem backup folder.
* **Priority (P0/P1/P2)**: P2
* **Fix (one sentence)**: Add a "Restaurer une sauvegarde" button in the admin Moderation tab to swap in one of the latest automatic snapshots from `backups/`.
* **How to verify**: Click the restore button in the UI and confirm the active memory cache resolves to the version from the chosen snapshot file.

---

## 03 — Infrastructure Audit

### Issue 1: Missing Container Resource Constraints
* **File/area**: Deployments / `Dockerfile` / `docker-compose.yml` (N/A — Local Termux Node Environment)
* **Severity**: 🟡 Yellow
* **Problem**: The node process runs directly on the Termux/Linux host environment without memory or CPU throttling boundaries.
* **Evidence**: High PDF text parsing indexing workloads can temporarily consume 100% of CPU cores, causing host device lag.
* **Fix (one sentence)**: If containerized, specify limits in `docker-compose.yml` (e.g., `mem_limit: 512m`, `cpus: 1.5`).

---

## 04 — Database Audit (You are a Database Administrator)

### Issue 1: Flat JSON File Scalability Bound
* **File/table**: `cats_db.json` (Database storage engine)
* **Severity**: 🟡 Yellow
* **Problem**: Storing all clinical guides inside a single flat JSON file requires reading and parsing the entire database into memory on boot.
* **Evidence**: File size of `cats_db.json` grows proportionally with new cards. Serialized text comparisons on sync require writing the whole array.
* **Performance estimate (1K/10K/100K/1M)**:
  * **1K Users**: `0.2ms` lookup (100% in-memory cache).
  * **10K Users**: `0.8ms` lookup, RAM usage increases to `~150MB`.
  * **100K Users**: `10ms` lookup, lock wait durations increase during bulk imports.
  * **1M Users**: Bottleneck on JSON serialization; server memory limit errors (`OOM`) can occur under load.
* **Fix (one sentence)**: Migrate the backend storage layer from a flat JSON file to SQLite or PostgreSQL for indexed query execution.

---

## 05 — Backend Audit

### Issue 1: Sync Lock Queue Waiting (Concurrency Bottleneck)
* **File/area**: `server.js` (AsyncLock implementation)
* **Severity**: 🟡 Yellow
* **Impact (plain English)**: When multiple administrators run concurrent imports or approvals, requests are queued sequentially, slightly increasing response latency for later requests.
* **Evidence**:
  ```javascript
  const result = await dbLock.acquire(async () => { ... });
  ```
* **Fix (one sentence)**: Implement row-level or specialty-level locks instead of a single global lock.

---

## 06 — Frontend Audit

### Issue 1: Local Resource Hydration Delay
* **File/area**: `public/js/components/workspace.js`
* **Severity**: 🟡 Yellow
* **Problem**: The summary panel matches keywords to large offline PDF files in memory, which can freeze the UI thread on old Android devices.
* **Evidence**: Thread blocks when parsing heavy keyword lists on click.
* **Fix (one sentence)**: Move matching algorithms into Web Workers to execute heavy array filters off the main UI thread.

---

## 07 — UI/UX Audit (You are a Senior Product Designer)

### Issue 1: Mobile Tap Target Boundaries
* **Component/screen**: Welcome / Dashboard Actions (Spécialité drop-down & export buttons)
* **Severity**: 🟡 Yellow
* **Problem**: The select dropdown inside `.specialty-export-container` is small and lacks a visual chevron on some mobile viewports, reducing click comfort.
* **Fix (one sentence)**: Add a custom styled SVG icon wrapper with a minimum touch area of 44x44px.
* **Accessibility/UX note (if applicable)**: Ensure that screen readers read the dropdown label as "Sélectionner la spécialité pour téléchargement".

---

## 08 — AI Safety Audit

### Issue 1: Context Leakage (Theoretical)
* **File/area**: Client Search Console / Prompt Indexing
* **Severity**: 🟡 Yellow
* **Attack scenario**: None. The current app is a zero-dependency offline utility that does not connect to external LLM providers.
* **Impact (plain English)**: There are no prompt injection vectors or data leakage vulnerabilities.
* **Cost/abuse estimate (brief)**: $0 / No API usage cost.
* **Fix (one sentence)**: Maintain regular security reviews if external AI-assisted summarization APIs are integrated in future versions.

---

## 09 — QA & Crash Prevention Audit

### Issue 1: Null Field Fallbacks on Legacy Imports
* **File/area**: `server.js` (Bulk Import parse parameters)
* **Severity**: 🟡 Yellow
* **Reproduction steps**:
  1. Upload a bulk JSON file where the `history` field is `null` or a number.
  2. The server attempts to push entries into `history` and crashes.
* **Fix (one sentence)**: Ensure array parameters (e.g., `history`, `pdf_keywords`) are always initialized with default empty arrays during database reads.
* **Suggested test case**:
  ```javascript
  const importedCat = { title: "Test", category: "Endo", history: null };
  const targetHistory = Array.isArray(importedCat.history) ? importedCat.history : [];
  ```
