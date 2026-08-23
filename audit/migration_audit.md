# 🌐 Migration Audit & Deployment Checklist
> **App Version Target:** 1.5.0+  
> **Date:** 2026-08-01  
> **Context:** Architectural checklist for migrating from Termux/ngrok to Cloud Hosting (Render, Railway, Fly.io, VPS) or Free Tier Services.

---

## ⚡ Option A: Upgrading Termux Tunnel Providers (Zero-Cost Cloud Bridge)
If staying on Termux hardware but replacing ngrok:
- [ ] **Configure Alternate Tunnel Providers** (`server/config/providers.js`):
  - Cloudflare Tunnels (`cloudflared`): Zero cost, permanent custom domains, built-in HTTPS termination.
  - LocalTunnel (`localtunnel`): Lightweight fallback if ngrok rates hit limits.
- [ ] **Verify Dynamic Tunnel Configuration Engine**:
  - Ensure `remote_server_config.json` auto-updates `public/js/remote_config.js` and `public/data/pdf_list.json` cleanly upon tunnel restart.

---

## ☁️ Option B: Migrating to Full Cloud Server (Render / Railway / VPS)

### 1. Security & Authentication Architecture
- [ ] **Lift Localhost-Only Admin Restriction** (`server/routes/auth.js`):
  - Change `isLocalhostConnection` guard to allow remote admin logins over HTTPS.
  - Enforce TOTP / 2FA or strong session token cookies (`SameSite=Strict; Secure`).
- [ ] **Environment Variable Configuration**:
  - Set `ADMIN_API_KEY`, `APP_DATA_KEY`, `ADMIN_PASSWORD_HASH`, `LLAMAPARSE_API_KEY`, `GOOGLE_API_KEY` directly in cloud provider dashboard secrets (never in git).

### 2. File Persistence & Database Storage
- [ ] **Persistent Volume Mount**:
  - Free cloud tiers (Render, Railway) use ephemeral filesystems (files wiped on restart).
  - Mount persistent volume to `/data` so `cats_db.json`, `suggestions.json`, `active_devices.json`, and `backups/` survive server restarts.
- [ ] **PDF Master Files & CDN Storage**:
  - Move heavy master PDFs (`data/pdf_masters/`) to Cloudflare R2 / AWS S3 or serve pre-compressed PDFs from `public/pdfs/`.

### 3. Production Process Supervision & SSL
- [ ] **Process Supervision**:
  - Run server via `pm2 start server.js` or let Docker container handle restart policies.
- [ ] **Reverse Proxy & HTTPS**:
  - Ensure cloud provider handles SSL termination (HTTPS) so admin logins and API tokens are never sent unencrypted over LAN/WAN.

### 4. Client PWA & Android APK Alignment
- [ ] **Update Target API Domain**:
  - Update production API URL in `remote_server_config.json` and build client APK with fixed backend domain.
- [ ] **Version Gate Activation**:
  - Verify `/api/admin/version` can force-update legacy APK clients (`< minVersion`) to the new cloud endpoint cleanly.
