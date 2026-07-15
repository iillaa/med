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
5. **Add Reference PDFs**:
   Create the PDF directory and copy your study guides inside:
   ```bash
   mkdir -p .cat-med/reference-pdfs
   # copy pdf files to this folder
   ```

---

## 🌿 Git Branching Strategy

The repository contains two primary branches that serve different architectures:

```mermaid
gitGraph
    commit id: "Init"
    branch light-android
    checkout master
    commit id: "Server Features"
    checkout light-android
    commit id: "Capacitor Config"
    checkout master
    commit id: "Bug Fix"
    checkout light-android
    merge master id: "Merge updates"
```

1. **`master` branch**:
   * **Target**: The Node.js/Express server and client-side web application.
   * **Use Case**: Running the local Termux server, local browser interface, network device connections, and administering/indexing PDFs.
2. **`light-android` branch**:
   * **Target**: Standalone offline-first Android wrapper.
   * **Use Case**: Compiles client-side static code using Capacitor. Hides admin-specific tools when offline, runs local JSON/localStorage mock backups, and hosts the GitHub CI/CD Actions build configuration.

⚠️ **Important Workflow**: Keep both branches aligned. When bug-fixes or styling adjustments are made, commit them to your active branch and cherry-pick them to the alternate branch (`git cherry-pick <commit-hash>`) to prevent code divergence.

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

### 2. Set admin password manually
```bash
# Interactive mode
node set_admin_password.js

# Direct password
node set_admin_password.js mypassword
```

### 3. Compile assets for offline standalone mode
Generates offline JSON database clones and syncs resources to Capacitor's Android folder.
```bash
# 1. Re-build index and cats clones into public/data/
node build.js

# 2. Sync public folder with Capacitor android assets
npx cap sync
```

### 4. Available npm scripts
```bash
npm start              # Start server (random password if none set)
npm run start:admin    # Start server with ADMIN_PASSWORD=admin123
npm run set:password   # Interactive password setter
npm run build          # Compile static assets
npm run reindex        # Re-index PDFs
npm run cap:sync       # Sync Capacitor assets
```

---

## ⚙️ Configuring Server URLs & Syncing

Dr. CAT allows standalone offline APK builds to communicate with a central server (e.g., tunnel or a custom hosted domain) to fetch updates and send suggestions.

### 1. How the Server URL is Managed
* **Server Side**: The backend stores the remote server URL in `remote_server_config.json` (which is gitignored in the root folder). You can update it via the Admin Diagnostics panel in the web interface, or edit the file manually:
  ```json
  {
    "url": "https://rendition-duchess-dry.tunnel-free.dev"
  }
  ```
* **Client App Bundle**: At compile/build time, the build script reads `remote_server_config.json` and dynamically generates the client-side configuration file at `public/js/remote_config.js` (gitignored). This ensures the server URL is baked directly into the APK.

### 2. Changing/Updating the Server
* **Using a Permanent Domain (e.g., `https://med.iillaa.com`)**:
  1. Add your production domain to `remote_server_config.json` (or set it via the Admin Web Panel).
  2. Run `npm run build && npx cap sync` and compile your APK.
  3. **You never need to rebuild the APK again.** Even if you change your backend host, IP, or provider in the future, as long as your domain redirects to the new server, all installed client apps will automatically connect.
* **Using a Temporary Tunnel (e.g., `tunnel`)**:
  1. If you restart your tunnel server, the URL changes.
  2. Update the new URL on the server (using the Admin Web Panel, or editing `remote_server_config.json` directly).
  3. Recompile the app assets and sync Capacitor:
     ```bash
     npm run build
     npx cap sync
     ```
  4. Rebuild the APK (e.g., via GitHub Actions) to bake the new URL into the client code.

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

