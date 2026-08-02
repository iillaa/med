# 📝 TODO Audit Fixes — Local & Existing Setup
> **App Version:** 1.5.2  
> **Last Updated:** 2026-08-02  
> **Context:** Actionable fixes for the current local Termux / Android setup.

---

## 🟢 Intentionally Retained / By Design (Do Not Change)

- **Localhost-Only Admin Auth (`POST /api/login`)**:
  - *Status:* **BY DESIGN**. Restricting admin login strictly to `isLocalhostConnection` is an intentional security design choice for the Termux setup to prevent remote administration brute-force over public tunnels. Will be lifted only in the cloud fork.

---

## ✅ Completed Fixes (This Session — v1.5.2 Doctor-Grade Prescription & Local Weighting)

- [x] **Moteur de Prescriptions Grade Médical & Pondération Locale (v1.5.2)**
  - Hiérarchisation à 3 niveaux (1ère intention, Alternatives `[OU]`, Traitement symptomatique).
  - Pondération locale des molécules (Ascabiol, Spasfon, Tiorfan, Smecta).
  - Alertes anti-polypharmacie et garde-fous sur les sur-prescriptions/doublons médicamenteux.
  - Mise à jour globale de la documentation (`README.md`, `technical_architecture.md`, `todo_audit_fix.md`).

- [x] **Prevent Event-Loop Freezes in AI Generator** (`server/routes/cat-generator.js`)
  - All `fs.readFileSync` / `fs.writeFileSync` replaced with `fs.promises.readFile` / `fs.promises.writeFile`.

- [x] **Sanitize AI Generator Prompt Titles** (`server/routes/cat-generator.js`)
  - Strips backticks, angle brackets, and override phrases (`ignore previous instructions`) before sending to Gemini Flash. Hard cap of 200 chars.

- [x] **Validate `catId` Integer in Suggestions** (`server/routes/suggestions.js`)
  - Strict `Number.isInteger()` check — rejects `"abc"`, `"1e5"`, negative values with 400 error.

- [x] **Clean Up Device Tracking Memory Leak** (`server/services/active-devices.js`)
  - Periodic prune removes devices inactive >90 days on every 10s flush interval.

- [x] **Cap CAT Edit History Length** (`server/routes/cats.js`)
  - `cat.history` capped at 50 entries (`cat.history.slice(-50)`) on every admin edit.

- [x] **Log File Size Management** (`scripts/rotate-logs.js`)
  - PM2 now writes to `logs/server-out.log` and `logs/server-err.log`.
  - `npm run log:rotate` rotates any log over 10 MB and prunes archives older than 7 days.
  - 57 MB legacy `server.log` rotated to `logs/server-legacy-20260802.log`.

- [x] **PM2 Process Manager** (`ecosystem.config.js`)
  - Server now runs under PM2 with auto-restart on crash.
  - See PM2 guide below.

---

## 🚀 PM2 Process Manager — Full Guide

### What PM2 Does
PM2 supervises the Dr.CAT Node.js server. If it crashes for any reason (unhandled error, Termux memory pressure), PM2 automatically restarts it within 3 seconds — no manual intervention needed.

### Daily Commands
```bash
npm run pm2:start    # Start server under PM2 supervision
npm run pm2:stop     # Stop the server
npm run pm2:restart  # Restart (after config or code changes)
npm run pm2:status   # View process table (uptime, restarts, RAM)
npm run pm2:logs     # Tail last 50 log lines live
npm run log:rotate   # Manually rotate logs right now
```

### Changing PM2 Settings
All parameters live in [`ecosystem.config.js`](../ecosystem.config.js). Edit the file then run `npm run pm2:restart` to apply.

```js
module.exports = {
  apps: [{
    name: 'drcat',          // Process name shown in pm2:status
    script: 'server.js',   // Entry point

    // ⏱ How long to wait before restarting after a crash (milliseconds)
    restart_delay: 3000,    // 3000 = 3 sec | 5000 = 5 sec | 10000 = 10 sec

    // 🔄 Max crashes before PM2 gives up restarting
    //    Set to 0 for unlimited restarts (not recommended)
    max_restarts: 10,

    // ⏳ App must stay alive this long to count as a "clean start"
    //    Prevents PM2 from counting a crash on startup as a restart
    min_uptime: '5s',       // '5s' | '10s' | '30s'

    // 🧠 Auto-restart if Node.js RAM usage exceeds this limit
    //    Useful on Android where RAM is shared with the OS
    max_memory_restart: '200M',  // '150M' | '200M' | '300M'

    // 📋 Log file paths (relative paths cause issues on Termux — use absolute)
    out_file: '/data/data/com.termux/files/home/med/logs/server-out.log',
    error_file: '/data/data/com.termux/files/home/med/logs/server-err.log',

    // 📅 Timestamp format in log files
    log_date_format: 'YYYY-MM-DD HH:mm:ss',
  }]
};
```

### After Changing Settings
```bash
# 1. Edit the file
nano ecosystem.config.js

# 2. Apply changes
npm run pm2:restart

# 3. Confirm the new settings took effect
npm run pm2:status
```

### Checking If Server Crashed
```bash
npm run pm2:status
# Look at the ↺ column — that's the restart count
# If it's > 0, check crash logs:
npm run pm2:logs
# Or read the error log directly:
cat logs/server-err.log | tail -50
```

### Log Rotation Settings
Edit `scripts/rotate-logs.js` to change thresholds:
```js
const MAX_SIZE_MB = 10;   // Rotate log when it exceeds this size
const KEEP_DAYS = 7;      // Delete archives older than this many days
```

---

## 🔲 Remaining Work (For Cloud Fork)
See [`migration_audit.md`](./migration_audit.md) for the 6 medium-priority architectural items to apply when forking to a cloud provider.
