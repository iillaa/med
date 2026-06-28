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
    branch android-app
    checkout master
    commit id: "Server Features"
    checkout android-app
    commit id: "Capacitor Config"
    checkout master
    commit id: "Bug Fix"
    checkout android-app
    merge master id: "Merge updates"
```

1. **`master` branch**:
   * **Target**: The Node.js/Express server and client-side web application.
   * **Use Case**: Running the local Termux server, local browser interface, network device connections, and administering/indexing PDFs.
2. **`android-app` branch**:
   * **Target**: Standalone offline-first Android wrapper.
   * **Use Case**: Compiles client-side static code using Capacitor. Hides admin-specific tools when offline, runs local JSON/localStorage mock backups, and hosts the GitHub CI/CD Actions build configuration.

⚠️ **Important Workflow**: Keep both branches aligned. When bug-fixes or styling adjustments are made, commit them to your active branch and cherry-pick them to the alternate branch (`git cherry-pick <commit-hash>`) to prevent code divergence.

---

## 🛠️ CLI Commands & Compiling

### 1. Launch local development server (Termux)
Starts Express server on port 3000 and indexes PDFs.
```bash
node server.js
```

### 2. Compile assets for offline standalone mode
Generates offline JSON database clones and syncs resources to Capacitor's Android folder.
```bash
# 1. Re-build index and cats clones into public/data/
node build.js

# 2. Sync public folder with Capacitor android assets
npx cap sync
```

---

## 🚀 Native Compilation & CI/CD

Dr. CAT is compiled into an `.apk` automatically on GitHub.

1. **GitHub Actions Workflow**:
   The workflow defined in `.github/workflows/build-apk.yml` triggers on every push to the `android-app` branch.
2. **Steps performed in Cloud CI**:
   * Sets up Java 17 and Android SDK.
   * Installs Node modules.
   * Runs `node build.js` to clone JSON databases.
   * Runs `npx cap sync` to compile mobile wrapper assets.
   * Builds the release APK using Gradle.
3. **Artifact Output**:
   The resulting `.apk` is saved as a downloadable build artifact on the GitHub Actions run summary page. Download and install it on any Android tablet/mobile device.
