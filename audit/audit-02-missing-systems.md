# 🔧 Audit 02 — Missing Critical Systems
> Date: 2026-08-01 | Role: Platform Engineer | Mode: Audit-Only

---

## P0 — Must Exist Now

### MS-01: Process Manager / Auto-Restart
- **Category/system:** Process supervision
- **Risk:** Server crashes are permanent until manually restarted. The `uncaughtException` handler keeps the process alive but does not restart it after a fatal error — a single bad state can leave the app dead for hours/days.
- **Priority:** P0
- **Fix:** Install PM2 (`npm install -g pm2`) and run the server with `pm2 start server.js --name drcat --restart-delay=3000`.
- **How to verify:** Kill the node process with `kill -9 <pid>`; within 3 seconds PM2 should restart it; check `pm2 status`.

### MS-02: Log Rotation
- **Category/system:** Log management
- **Risk:** `server.log` is already 27 MB after one production cycle. In 6 months it will be 300 MB+ on a Termux device with ~64 GB storage. When the filesystem fills, Node.js will crash on the first `fs.appendFileSync` call.
- **Priority:** P0
- **Fix:** Configure PM2 log rotation (`pm2 install pm2-logrotate`) or add a daily `logrotate` cron via Termux.
- **How to verify:** Check `pm2 logs` after 1 day to see rotated files; or `ls -lh server.log` to confirm the file is not growing unbounded.

---

## P1 — Should Exist Within 2 Weeks

### MS-03: External Uptime Monitoring
- **Category/system:** Monitoring / alerting
- **Risk:** The `/health` endpoint exists but is never polled externally. An ngrok tunnel drop, OOM kill, or unhandled rejection leaves the app silently dead. Currently detection depends entirely on a user reporting an error.
- **Priority:** P1
- **Fix:** Register the ngrok health URL on UptimeRobot (free) with 5-minute polling and SMS/email alert.
- **How to verify:** Stop the server; within 5 minutes, receive an alert email/SMS.

### MS-04: Environment Variable Loading
- **Category/system:** Configuration management / secrets
- **Risk:** `dotenv` is listed as a dependency but `require('dotenv').config()` is never called in `server/index.js`. The `.env` file (containing `LLAMAPARSE_API_KEY` and `GOOGLE_API_KEY`) is silently ignored — those integrations fail without any error message. Any env-dependent config also fails silently.
- **Priority:** P1
- **Fix:** Add `require('dotenv').config();` as the very first line of `server/index.js`.
- **How to verify:** Add `console.log(process.env.LLAMAPARSE_API_KEY)` temporarily and confirm it prints the value.

### MS-05: Structured Error Reporting
- **Category/system:** Observability
- **Risk:** All errors are written to a flat `server.log` file via `console.error`. There is no error aggregation (Sentry, Bugsnag, etc.), no severity tagging, no deduplication. A recurring error that fires 10,000 times is identical to a one-time error in the current log format.
- **Priority:** P1
- **Fix:** Add Sentry (`@sentry/node`) with a free plan — it captures unhandled rejections, exceptions, and performance traces automatically.
- **How to verify:** Trigger a deliberate error; check the Sentry dashboard within 30 seconds.

### MS-06: Database Migration / Schema Versioning
- **Category/system:** Database management
- **Risk:** `cats_db.json` has no schema version field. If the data model changes (new field added, field renamed), there is no migration system — old entries silently lack the new field and the app handles the missing data inconsistently.
- **Priority:** P1
- **Fix:** Add a `schemaVersion` field to the DB and a startup migration runner that normalizes old entries to the current schema.
- **How to verify:** Add `schemaVersion: 2` to a new field, restart server, confirm old entries get migrated on startup.

---

## P2 — Should Exist Within 1 Month

### MS-07: CI Security Scanning
- **Category/system:** CI/CD / DevSecOps
- **Risk:** The CI pipeline (`ci.yml`) only runs the test suite. No automated dependency vulnerability scanning (`npm audit`), no secret scanning (git-secrets, gitleaks), no SAST (ESLint security plugin). A vulnerable dependency could be introduced undetected.
- **Priority:** P2
- **Fix:** Add `npm audit --audit-level=high` to the CI workflow; add `npx gitleaks detect` to catch accidentally committed secrets.
- **How to verify:** Introduce a known-vulnerable package in a test branch; CI should fail.

### MS-08: Feature Flags / Rollback System
- **Category/system:** Feature management
- **Risk:** Deploying a new feature currently requires a full server restart and manual revert if something breaks. There is no feature flag system and no automated rollback (the only rollback is git revert + redeploy).
- **Priority:** P2
- **Fix:** Use the existing `version.json` mechanism to add a `featureFlags` object that controls feature behavior at runtime.
- **How to verify:** Toggle a feature flag via the admin API without restarting the server.

### MS-09: Backup Off-Device / Off-Site
- **Category/system:** Disaster recovery
- **Risk:** The automated backup creates 10 rolling snapshots in `backups/` on the SAME device. If the Termux device is lost, stolen, or the SD card fails, all data is gone — including the medical CAT database representing months of editorial work.
- **Priority:** P2
- **Fix:** Schedule a daily `rclone` sync to Google Drive or Backblaze B2 from the `backups/` folder.
- **How to verify:** Delete the local backup folder; confirm you can restore from the remote copy.

### MS-10: Test Coverage for Security-Critical Paths
- **Category/system:** QA / test coverage
- **Risk:** The test suite (`tests/`) covers API basics and auth but does NOT test: rate limit bypass via X-Forwarded-For spoofing, suggestions endpoint without auth, CSV/JSON injection in CAT fields, or the version lock admin endpoint.
- **Priority:** P2
- **Fix:** Add dedicated security regression tests for each critical path identified in Audit 01.
- **How to verify:** Run `npm test:suite` — all security tests should pass.

