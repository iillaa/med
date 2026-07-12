# Walkthrough: Stage 3 Offline-First APK Architecture & CI Compiler

This walkthrough covers the completion of Stage 3 configurations to build a standalone, offline-first Android application.

## Implemented Work

### 1. Dynamic Offline-First Mode (`api.js`)
- Added protocol and context detection to identify standalone execution:
  ```javascript
  export const isOfflineApp = 
    window.location.protocol === 'file:' || 
    window.location.protocol.startsWith('capacitor') ||
    window.location.hostname === '';
  ```
- **Fallback Database Loading**: If running in an offline context, the app loads database details and search metrics directly from relative asset paths (`public/data/cats_db.json` & `public/data/pdf_index.json`).
- **Offline Client-Side PDF Search**: Loops through pages within `pdf_index.json` locally on the device with identical server-equivalent snippet generation, running fully offline without needing an active Express server.
- **LocalStorage Override Buffers**: Any additions, custom edits to summaries, or custom prescriptions are buffered to the device's `localStorage` (via `dr_cat_local_overrides` and `dr_cat_custom_created_cats`).

### 2. PDF Path Updates for WebView Compatibility
- Modified `pdf_viewer.html` and `workspace.js` to use relative routes (`pdfs/filename.pdf` and `pdf_viewer.html?file=...`) instead of absolute paths (`/pdfs/...` or `/pdf_viewer.html`), preventing navigation failures on custom WebView schemes (`file://` or `capacitor://`).

### 3. Automated GitHub Actions Build Compiler
- Created `.github/workflows/build-apk.yml` to automatically build the application on push:
  1. Sets up Node.js and installs packages.
  2. Runs `npm run build` (copying database files to `public/data`).
  3. Initializes Capacitor and sets up Java 17 / Android SDK build tools.
  4. Runs the Gradle task to compile a debug APK.
  5. Uploads `app-debug.apk` as a downloadable artifact in the GitHub Actions tab.

---

## Final Steps for Standalone PDF Reading

For the PDF reference files to open offline in the compiled Android app, they must be copied into the project's asset bundle:

1. **Copy PDFs locally in Termux**:
   ```bash
   mkdir -p public/pdfs
   cp -r "/storage/emulated/0/cat-med/CAT de Médecine Générale/"* public/pdfs/
   ```

2. **Commit and Push**:
   ```bash
   git add public/pdfs/
   git commit -m "feat: bundle reference PDFs into the app assets"
   git push
   ```

*Once pushed, your GitHub Actions workflow will compile the APK with all reference PDFs bundled inside, making the entire application completely self-contained and offline!*
