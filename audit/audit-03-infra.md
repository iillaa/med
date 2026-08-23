# 🏗️ Audit 03 — Infrastructure / DevOps
> Date: 2026-08-01 | Role: DevOps Engineer | Mode: Audit-Only

---

## INFRA-01
- **File/area:** `server/index.js` — no `dotenv` initialization
- **Severity:** 🔴 CRITICAL
- **Problem:** `dotenv` is listed as a production dependency but `require('dotenv').config()` is never called. All `process.env.*` values sourced from `.env` are `undefined` at runtime. This silently breaks `LLAMAPARSE_API_KEY`, `GOOGLE_API_KEY`, `ADMIN_API_KEY`, and `APP_DATA_KEY` when set in `.env`.
- **Evidence:** `package.json` lists `"dotenv": "^17.4.2"` as dependency; grep of `server/index.js` shows no `dotenv` call.
- **Fix:** Add `require('dotenv').config({ path: require('path').resolve(__dirname, '../.env') });` as the very first line of `server/index.js`.

---

## INFRA-02
- **File/area:** Runtime — no process manager
- **Severity:** 🔴 CRITICAL
- **Problem:** The server runs as a bare `node server.js` process. If Node.js crashes (OOM, uncaught exception that slips through the handler, or intentional kill), the server stays down until a human manually restarts it. On Android/Termux, the process is also killed when the Termux background window is swiped away.
- **Evidence:** `package.json` `start` script is simply `"node server.js"`. No PM2, forever, or systemd config found.
- **Fix:** `npm install -g pm2 && pm2 start server.js --name drcat --restart-delay=3000 --max-memory-restart=200M && pm2 save && pm2 startup`.

---

## INFRA-03
- **File/area:** `server.log` (root) — 27 MB, no rotation
- **Severity:** 🟠 HIGH
- **Problem:** The server writes all console output to `server.log` (27,382,585 bytes after one deployment period). No log rotation is configured. Eventually this file will fill the device storage, causing server-level filesystem write failures.
- **Evidence:** `ls -lh server.log` = 27 MB; no `logrotate.d` config or PM2-logrotate config found.
- **Fix:** `pm2 install pm2-logrotate` and configure `pm2 set pm2-logrotate:max_size 10M pm2-logrotate:retain 5`.

---

## INFRA-04
- **File/area:** `server/index.js` line 219-222 — Helmet CSP disabled
- **Severity:** 🟠 HIGH
- **Problem:** `helmet({ contentSecurityPolicy: false })` completely disables Helmet's auto-generated CSP. A manual CSP is applied below it, but with `unsafe-eval` and `unsafe-inline` that neutralize its protection (see Security Audit issue 4). The manual CSP also doesn't include `upgrade-insecure-requests` or `report-uri`.
- **Evidence:** Line 220: `contentSecurityPolicy: false`.
- **Fix:** Remove `contentSecurityPolicy: false` and let Helmet manage the CSP via its configuration options for better defaults; then tune as needed.

---

## INFRA-05
- **File/area:** `.github/workflows/ci.yml`
- **Severity:** 🟠 HIGH
- **Problem:** The CI pipeline has no steps for: `npm audit` (dependency vulnerability scanning), secret detection (gitleaks), build verification (`npm run build`), or deploy smoke test. The test suite (`test:suite`) runs but only covers functional API tests — no security tests are verified in CI.
- **Evidence:** `ci.yml` is 27 lines; only runs `npm ci` + `npm run test:suite`.
- **Fix:** Add these steps: `run: npm audit --audit-level=high`, `run: npm run build`, and integrate a Lighthouse CI or custom smoke test after successful build.

---

## INFRA-06
- **File/area:** `public/service-worker.js` — no versioned cache busting
- **Severity:** 🟠 HIGH
- **Problem:** Service worker is registered on production PWA but the cache strategy is unknown (file not fully read — 5 KB). If the SW caches old JS bundles, users on the web PWA may run stale code indefinitely even after the server is updated. The esbuild output in `public/dist/` generates hashed bundles (`app-*.js`) which is good, but the SW must correctly handle cache invalidation.
- **Evidence:** SW file is 5 KB; `index.html` is 87 KB (likely contains inline critical CSS + SW registration).
- **Fix:** Verify the SW uses a network-first or stale-while-revalidate strategy for HTML and app bundles, with cache versioning tied to the app version string.

---

## INFRA-07
- **File/area:** `capacitor.config.json` + `android/`
- **Severity:** 🟡 MEDIUM
- **Problem:** The Capacitor config exists and the Android project is present. However, there is no automated APK signing configuration in the audit-visible files, and the `build-apk.yml` workflow in GitHub Actions is separate from the CI test pipeline — meaning a build can succeed even if tests fail.
- **Evidence:** `.github/workflows/build-apk.yml` exists separately from `ci.yml` with no test dependency gate.
- **Fix:** Add `needs: test` to the `build-apk` job to prevent building APKs from untested code.

---

## INFRA-08
- **File/area:** `remote_server_config.json` (runtime)
- **Severity:** 🟡 MEDIUM
- **Problem:** `remote_server_config.json` is gitignored (good) but is created by `set_server_provider.js` at runtime. If this file doesn't exist on startup, the server silently skips all provider config with no warning to the user. The ngrok tunnel URL must be re-set after every ngrok restart — there is no persistent tunnel (ngrok free tier limitation).
- **Evidence:** `server/services/server-providers-config.js` loads config with try/catch silently failing if file missing.
- **Fix:** Log a clear startup warning when no provider is configured, and document the ngrok tunnel renewal process.

---

## INFRA-09
- **File/area:** `backups/` directory
- **Severity:** 🟡 MEDIUM
- **Problem:** Backups are stored only on the same device as the server. 10-file rotation is implemented in code but there is no off-device backup, no integrity check (no SHA256 hash verification of backup files), and no restore test. The backup system provides false comfort — if the device dies, all backups die too.
- **Evidence:** `server/services/data-store.js` `runDatabaseBackup()` writes only to local `backups/` directory.
- **Fix:** Add a daily rclone/rsync job to push backups to a remote location (Google Drive, GitHub Gist, or an S3-compatible bucket).

---

## INFRA-10
- **File/area:** Global — no TLS on direct connections
- **Severity:** 🟡 MEDIUM
- **Problem:** The server listens on plain HTTP port 3000. TLS is only applied if an ngrok tunnel is used (ngrok provides HTTPS termination). Direct LAN connections (http://192.168.x.x:3000) are unencrypted — admin passwords sent via `POST /api/login` are transmitted in plaintext on the local network.
- **Evidence:** Server listens on plain `app.listen(PORT)` with no HTTPS options.
- **Fix:** For LAN admin use, generate a self-signed cert and configure HTTPS; or strictly enforce that admin login only occurs over ngrok HTTPS.

