# Sentry-Grade Crash Intelligence & Telemetry Specification (telemetry-crash-intelligence.md)

> **Document Type**: Technical Specification & Error Monitoring Protocol  
> **Target Audience**: Senior Frontend Engineers, DevOps & Autonomous AI Agents  
> **Status**: Production (v1.19.0+)

---

## 1. System Overview & Data Privacy Guarantees

Dr.CAT implements a self-hosted, Sentry-grade telemetry engine designed specifically for medical offline-first environments.

```mermaid
flowchart TD
    subgraph Client["📱 Mobile Client (Android WebView / Browser)"]
        ErrListener["Global Error Handlers (onerror / unhandledrejection)"]
        Normalizer["Stack Trace Sanitizer & String Normalizer"]
        Hasher["SHA-256 Fingerprint Generator"]
        DeviceExtractor["Hardware Metadata Extractor (OS, Model, Screen, Version)"]
        ErrListener --> Normalizer --> Hasher
        ErrListener --> DeviceExtractor
        Hasher & DeviceExtractor --> IngestionPayload["JSON Telemetry Payload"]
    end

    subgraph Transport["🌐 Multi-Rail Ingestion"]
        WorkerRoute["Edge Gateway: POST /api/telemetry"]
        TermuxRoute["Local Daemon: POST /api/telemetry"]
        IngestionPayload --> WorkerRoute & TermuxRoute
    end

    subgraph Aggregator["🧠 Ingestion & Aggregation Service (server/routes/telemetry.js)"]
        MatchCheck{"Fingerprint exists in telemetry_reports.json?"}
        Increment["Increment occurrences (N + 1) & Update last_seen"]
        Insert["Create new incident entry (severity: warning)"]
        SeverityEscalator["Severity Evaluator (warning -> elevated -> critical)"]
        
        WorkerRoute & TermuxRoute --> MatchCheck
        MatchCheck -->|Yes| Increment --> SeverityEscalator
        MatchCheck -->|No| Insert --> SeverityEscalator
        SeverityEscalator --> DiskStore["Persist to server/data/telemetry_reports.json"]
    end
```

### Privacy & Confidentiality Guarantee:
* **Zero Patient Data Collection**: Error handlers scrub query strings and payloads.
* **Zero Third-Party Data Sharing**: All telemetry data resides strictly within the user's infrastructure (Cloudflare Worker & Termux).

---

## 2. Fingerprinting & Stack Trace Normalization Algorithm

To prevent crash log explosion (e.g. 10,000 duplicate events flooding the database), error events are condensed into stable SHA-256 fingerprints.

### 2.1 Stack Normalization Regex Rules
1. Strip transient memory addresses (`0x[0-9a-fA-F]+`).
2. Normalize bundle hash identifiers (`app-[A-Z0-9]+\.js` $\rightarrow$ `app-bundle.js`).
3. Strip dynamic URL query parameters (`\?.*$`).

### 2.2 Mathematical Fingerprint Formula
$$\text{IncidentFingerprint} = \text{SHA-256}\Big(\text{normalize}(\text{error.name}) \parallel \text{normalize}(\text{error.message}) \parallel \text{normalize}(\text{error.stack}[0..2])\Big)$$

---

## 3. Incident Severity State Machine

The telemetry aggregation daemon dynamically calculates incident severity based on real-world blast radius:

```mermaid
stateDiagram-v2
    [*] --> Warning: Initial Occurrence (1 <= N < 5 on 1 device)
    Warning --> Elevated: 5 <= N < 15 OR Affected Devices >= 2
    Elevated --> Critical: N >= 15 OR Affected Devices >= 3
    Critical --> Resolved: Admin Purge (DELETE /api/admin/telemetry/:id)
    Resolved --> [*]
```

---

## 4. Telemetry REST API Contracts

### 4.1 Client Ingestion: `POST /api/telemetry`
* **Access Level**: Public (No auth required)
* **Request Payload**:
```json
{
  "type": "uncaught_error",
  "message": "TypeError: Cannot read properties of undefined (reading 'title')",
  "stack": "TypeError: Cannot read properties of undefined...\n at renderWorkspace (app-bundle.js:45:12)",
  "url": "https://drcat.is-an-app.workers.dev/index.html",
  "device": {
    "platform": "Android",
    "model": "Lenovo Tab P12 Pro",
    "screen": "2560x1600",
    "userAgent": "Mozilla/5.0 (Linux; Android 14; ...)",
    "appVersion": "1.19.0"
  }
}
```
* **Response**: `HTTP 200 {"success": true, "reportId": "inc_9f8a2b...", "occurrences": 1}`.

### 4.2 Administrative Retrieval: `GET /api/admin/telemetry`
* **Access Level**: Protected (`Bearer <ADMIN_TOKEN>` + Localhost Socket Verified)
* **Response Schema**:
```json
[
  {
    "id": "inc_9f8a2b1c4e7d",
    "severity": "critical",
    "occurrences": 21,
    "first_seen": 1788300000000,
    "last_seen": 1788309687851,
    "error_name": "TypeError",
    "message": "Cannot read properties of undefined (reading 'title')",
    "normalized_stack": "at renderWorkspace (app-bundle.js:45:12)",
    "affected_devices": {
      "Xiaomi 12T Pro": 17,
      "Samsung Galaxy Tab S9": 4
    }
  }
]
```

---

## 5. Active Devices Telemetry & Analytics Lab Architecture

Dr.CAT tracks active devices and audience adoption globally across Cloudflare Edge and local Termux instances without storing any PII.

```mermaid
sequenceDiagram
    autonumber
    actor Client as 📱 Android APK / 🌐 Web PWA
    participant Worker as ⚡ Cloudflare Edge (worker.js)
    participant KV as 🗄️ SUGGESTIONS_KV (active_devices)
    participant Termux as 💻 Termux Server (active_devices.json)
    actor Admin as 🩺 Dr. Ali (Analytics Lab)

    Client->>Worker: POST /api/active-devices/ping (UUID, Version, Screen, Platform)
    Worker->>KV: Update record + extract cf-ipcountry (e.g. DZ, FR)
    Admin->>Termux: Access /admin/analytics_lab.html
    Termux->>Worker: GET /api/active-devices (x-sync-secret)
    Worker-->>Termux: Returns aggregated edge active devices
    Termux->>Termux: Merge into local active_devices.json
    Termux-->>Admin: Displays Live Users, DAU, MAU, Platform & Country distribution
```

### 5.1 Telemetry Ping Payload (`POST /api/active-devices/ping`)
* **Headers**: `x-app-key`, `x-install-id`, `x-app-version`, `x-device-platform`
* **Body**:
```json
{
  "installId": "drcat-inst-f5f822b5-4c26-49c6-9e33-86a8a2fe8b1d",
  "appVersion": "1.21.0",
  "platform": "android_apk",
  "screen": "1200x2000 (dpr: 2)",
  "deviceModel": "Samsung Galaxy",
  "timestamp": 1788375600000
}
```
* **Edge Processing**: Cloudflare extracts `request.cf.country` (GeoIP) to populate country metrics (`🇩🇿 Algérie`, `🇫🇷 France`, etc.) without exposing client IP addresses.

