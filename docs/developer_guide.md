# Developer Guide (developer_guide.md) 🛠️

This document describes setup procedures, branching strategy, building instructions, and deployment processes for developers working on **Dr. CAT**.

---

## 🏗️ Development Setup

To configure the workspace on a Termux instance or standard Linux terminal:

1. **Install Node.js & Git**:
   ```bash
   pkg update
   pkg install nodejs git
   ```
2. **Clone the Repository**:
   ```bash
   git clone https://github.com/iillaa/med.git
   cd med
   ```
3. **Install Dependencies**:
   ```bash
   npm install
   ```
4. **Create Local Admin Credentials**:
    ```bash
    # Option A: Set via environment variable (recommended for development)
    echo 'export ADMIN_PASSWORD=admin123' >> ~/.bashrc
    source ~/.bashrc
    npm start
    
    # Option B: Use the interactive password setter script
    node set_admin_password.js mypassword
    
    # Option C: Manual plain-text (will be auto-migrated to PBKDF2 hash on first run)
    echo "your_secure_password" > admin_password.txt
    ```
5. **Add Master Reference PDFs (Dual-Folder Pipeline)**:
   Upload PDFs via the web interface or copy raw, uncompressed master original PDFs into `data/pdf_masters/`:
   ```bash
   mkdir -p data/pdf_masters
   # copy uncompressed master pdf files here
   ```
   > Uncompressed originals in `data/pdf_masters/` guarantee 100% precision AI extraction (LlamaParse/Gemini). `index_pdfs.js` automatically compresses them into `public/pdfs/` for lightweight APK packaging.

6. **Install Ghostscript (Recommended for Ultra PDF Compression)**:
   ```bash
   pkg install ghostscript    # Termux
   # or: apt install ghostscript  (Debian/Ubuntu)
   ```

7. **Set up API Keys (Optional but Recommended)**:
   For high-quality extraction, set these in `.env`:
   ```bash
   LLAMAPARSE_API_KEY=llx-yourkey
   GOOGLE_API_KEY=AIzaSy-yourkey
   ```

---

## 🌿 Git Branching Strategy

The codebase is unified on the **`structured`** branch, which handles both execution models without requiring branching:

1. **Local Server Mode**:
   - Runs the Express server, provides indexing of reference PDFs, serves web-based revision screens, and manages client suggestions.
2. **Capacitor Android Compilation**:
   - Uses the unified code to build the offline standalone Android APK. Capacitor configuration matches the same static output folder.

There is no longer any need to switch or synchronize between multiple active feature branches (such as `light-android`). All updates are committed directly to `structured`.


---

## 🛠️ CLI Commands & Compiling

### 1. Launch local development server (Termux)
Starts Express server on port 3000 and indexes PDFs.
```bash
# Standard start (uses existing admin_password.txt or generates random password)
npm start

# Start with custom admin password via environment variable
npm run start:admin
# Or directly:
ADMIN_PASSWORD=admin123 npm start
```

### 2. Compress PDFs for Lightweight Mobile APK Packaging
Runs Ghostscript ultra-compression engine (96 DPI + JPEGQ 60 + Bicubic downsampling):
```bash
npm run compress:pdfs
```

### 3. Delete a Test or Old PDF from All Locations
Purges a PDF across raw originals, public compressed copies, AI cache, and all indices:
```bash
node scripts/delete_pdf.js "my_old_file.pdf"
```

### 4. Run Master Automated Test Suite
Runs all 5 automated unit, API, auth, prescription, and resume test suites:
```bash
npm run test:suite
```

### 5. Compile assets for offline standalone mode
Generates minified offline JSON database clones and syncs resources to Capacitor's Android folder.
```bash
# 1. Re-build index and cats clones into public/data/
npm run build

# 2. Sync public folder with Capacitor android assets
npm run cap:sync
```

### 6. Available npm scripts
```bash
npm start               # Start server (random password if none set)
npm run start:admin     # Start server with ADMIN_PASSWORD=admin123
npm run set:password    # Interactive password setter
npm run build           # Compile static assets & minify JSON DBs
npm run reindex         # Re-index master PDFs (from data/pdf_masters/)
npm run compress:pdfs   # Compress PDFs using Ghostscript ultra engine
npm run test:suite      # Run master automated test suite
npm run cap:sync        # Sync Capacitor assets
```

---

## ⚙️ Configuring Server URLs & Syncing

Dr. CAT lets standalone offline APK builds talk to a central server (tunnel or custom domain) to fetch updates and send suggestions.

### 1. Single Source of Truth
The **server** owns the list of remote servers. It lives in `remote_server_config.json` (git-ignored, project root) and is loaded once at startup. The client never authors this list — it *learns* it from the server via the public `GET /api/server-providers` endpoint, and seeds from the build-baked `public/js/remote_config.js` for the offline APK before first contact.

Config shape (backward-compatible with the old `{ "url" }` / `{ "urls": [...] }`):
```json
{
  "primaryProvider": "ngrok",
  "servers": [
    { "url": "https://a.ngrok-free.dev", "provider": "ngrok", "priority": 1 },
    { "url": "https://b.cloudflare.dev", "provider": "cloudflare", "priority": 2 }
  ]
}
```
* `priority` = primary → failover ordering.
* Equal `priority` = load-balanced siblings (your cross-provider resilience layer on top of a single ngrok pool URL).

### 2. Setting the Server List (like the admin password)
Use the dedicated setup script — no hand-editing JSON or web panel required:
```bash
# Interactive: paste URLs (comma/newline separated), in priority order
node set_server_provider.js

# One-shot (comma-separated)
node set_server_provider.js "https://a.ngrok-free.dev, https://b.cloudflare.dev"
```
Or via npm:
```bash
npm run set:provider -- "https://a.ngrok-free.dev, https://b.cloudflare.dev"
```
This writes `remote_server_config.json` and prints a restart hint.
> Changing the list **refreshes CORS live** (the allowlist is recomputed in place), so a remote client connecting through a newly added tunnel is accepted immediately — no server restart needed for already-running servers.

### 3. Client Behavior (failover + load-balancing)
* The client pings every configured server and records per-server health (latency / ok).
* Requests are ordered by `priority`, then by health: the primary is tried first; if it is slow or down, the next healthy server is used; healthy siblings at the same priority share the load.
* A background health re-ping (every 60s) promotes a recovered server automatically.

### 4. Android APK Build (the baked secret)
The APK still needs a URL baked in at build time, because the offline bundle cannot fetch it from a server it has not contacted yet:
* CI reads the `REMOTE_SERVER_URL` repository secret and writes `remote_server_config.json` before building (the same file the server uses).
* `build.js` bakes the URL(s) into `public/js/remote_config.js`, which the app uses as its initial seed.
* On first successful reach to any server, the app adopts the server's authoritative list — so you can add/remove servers at runtime without rebuilding the APK.

### 5. Diagnostics Panel
The Admin Diagnostics **"Serveurs Distants Configurés"** card is now **read-only** — it displays the authoritative list fetched from the server. To change the list, use `set_server_provider.js` (or `POST /api/server-providers` as admin).

---

## 🚀 Native Compilation & CI/CD

Dr. CAT is compiled into an `.apk` automatically on GitHub.

1. **GitHub Actions Workflow**:
   The workflow defined in `.github/workflows/build-apk.yml` triggers on every push to the `android-app` and `light-android` branches.
2. **Steps performed in Cloud CI**:
   * Sets up Java 17 and Android SDK.
   * Installs Node modules.
   * Checks for a repository secret named `REMOTE_SERVER_URL` and dynamically creates the git-ignored `remote_server_config.json` before building.
   * Runs `node build.js` to clone JSON databases and write the remote configuration variables into `public/js/remote_config.js`.
   * Runs `npx cap sync` to compile mobile wrapper assets.
   * Builds and signs the release APK using Gradle.
3. **Repository Secrets Configuration**:
   To successfully build, sign, and pre-configure the APK, define these secrets in your GitHub repository (**Settings ➔ Secrets and variables ➔ Actions**):
   * `REMOTE_SERVER_URL`: The default public URL of your Node.js/ngrok backend (e.g., `https://rendition-duchess-dry.ngrok-free.dev`). If defined, this is baked directly into the APK so it boots up online out-of-the-box.
   * `SIGNING_KEY`: The base64-encoded Android Keystore (.jks/.keystore) file.
   * `ALIAS`: The key alias defined when creating the keystore.
   * `KEYSTORE_PASSWORD`: The main password of the keystore file.
   * `KEY_PASSWORD`: The password of the specific key alias.
4. **Artifact Output**:
   The resulting `.apk` is saved as a downloadable build artifact on the GitHub Actions run summary page.

---

## 🎨 Asset Regeneration (Launcher Icons)

If you modify or update the app logo, you can regenerate all modern adaptive and legacy rounded launcher resolutions automatically.
1. **Requirements**: Make sure `imagemagick` is installed on your local environment.
2. **Execute**: Place the new square logo at `logo_med.png` in the repository root and run:
   ```bash
   bash generate_icons.sh
   ```
   This script automatically applies a circular mask to legacy and adaptive icon shapes to guarantee perfect, professional circular icons that comply with modern Android launcher layouts.

---

## 🐛 Developer Diagnostics Easter Egg

Direct database writing and suggestion moderation are unavailable on standalone mobile builds because there is no Node.js backend running on the device. However, developers can unlock real-time diagnostics, server configurations, and performance metrics:
1. **Show Toggle Button**: Click or tap the **Dr. CAT logo** (in the desktop sidebar or the mobile header banner) **10 times** consecutively. A bug (🐛) button will appear in the bottom-right corner of the screen.
2. **Unlock Diagnostics Panel**: Click or tap the **🐛 button 3 times** consecutively. This triggers a toast notification confirming activation, automatically closes the log viewer overlay, and reveals the **Admin Control Center** (Diagnostics/Performance tabs) at the bottom of the main dashboard.
3. **Persistence**: The developer mode state is saved to local storage and persists across application restarts.

