# Implementation Plan: Phase 3 (Offline-First Android App via Capacitor)

This plan skips Phase 2 (Cloud Deployment) for now, moving directly to Phase 3. The goal is to prepare the Dr.CAT codebase to run as a standalone, offline-first Android application wrapped with Capacitor, operating entirely without a local Node.js backend.

## User Review Required

> [!IMPORTANT]
> - **No Local Node Server**: In a compiled Android app, there is no Node.js backend running on the device. We must shift the data loading strategy from requesting `/api/cats` and `/api/pdfs` to reading bundled JSON files statically.
> - **GitHub Actions Compiler**: Since you don't have a PC, we will set up a dedicated GitHub Actions workflow (`.github/workflows/build-apk.yml`) to automatically compile the codebase into an Android `.apk` file when you push changes.

---

## Open Questions

> [!WARNING]
> - **PDF Storage**: Bundle all 78 PDF reference files directly inside the APK assets (which will increase the APK size significantly), or keep them hosted locally on the device's storage and access them via native file path permissions?
> - **Local database changes**: Since the app will be offline-first, custom modifications (e.g., editing a summary or a prescription) will be stored in `localStorage` rather than sent to `/api/cats/:id`. Is this acceptable for your standalone workflow?

---

## Proposed Changes

### 1. Static Asset Packaging & Offline Fallbacks

#### [NEW] [cats_db.json](file:///data/data/com.termux/files/home/med/public/data/cats_db.json)
- Copy the current master clinical database `cats_db.json` into the public static folder so the frontend can fetch it directly using relative client-side requests: `fetch('data/cats_db.json')`.

#### [NEW] [pdf_index.json](file:///data/data/com.termux/files/home/med/public/data/pdf_index.json)
- Copy the PDF document index into the public static folder so that PDF search and listings function fully offline.

#### [MODIFY] [api.js](file:///data/data/com.termux/files/home/med/public/js/api.js)
- Modify the API client to detect if it's running in an offline Android context (e.g., scheme is `capacitor://`, `http://localhost:3000` is unreachable, or via user agent checks).
- If offline/Capacitor:
  - Fetch CAT data and PDF listings from local static paths (`data/cats_db.json` and `data/pdf_index.json`).
  - Read and write any custom summary edits, custom prescriptions, or suggestions directly to/from `localStorage` (e.g. `dr_cat_custom_summaries` and `dr_cat_custom_prescriptions`) instead of sending HTTP POST requests to `/api/cats`.

#### [MODIFY] [state.js](file:///data/data/com.termux/files/home/med/public/js/state.js)
- Update state merging logic to combine the base static database with any locally saved user overrides/edits from `localStorage`.

---

### 2. Capacitor Integration & CI Compiler

#### [MODIFY] [package.json](file:///data/data/com.termux/files/home/med/package.json)
- Add Capacitor dependencies: `@capacitor/core`, `@capacitor/android`, and `@capacitor/cli` as devDependencies.

#### [NEW] [capacitor.config.json](file:///data/data/com.termux/files/home/med/capacitor.config.json)
- Configure the Capacitor project:
  - Set `appId` to `com.drcat.app`
  - Set `appName` to `Dr.CAT`
  - Set `webDir` to `public` (our static frontend directory)
  - Enable local file access.

#### [NEW] [build-apk.yml](file:///data/data/com.termux/files/home/med/.github/workflows/build-apk.yml)
- Create a GitHub Actions workflow to compile the application automatically on push:
  - Check out code and set up Node.js environment.
  - Install dependencies and generate dynamic Capacitor configurations.
  - Set up Java 17 and Android SDK build tools.
  - Run the Gradle build task to generate a debug APK.
  - Upload the resulting `.apk` file as a build artifact.

---

## Verification Plan

### Automated Tests
- Run `npm run lint` or syntax checks to verify that code adjustments do not introduce runtime syntax errors.

### Manual Verification
- **Local Static Mode Testing**: Open `public/index.html` directly in the browser using a local static file server (or disable/disconnect the Node.js server) and confirm that all clinical summaries, search tools, and tabs load correctly from the bundled files.
- **Modifications Persistence**: Edit a clinical summary and prescription, refresh the page, and verify that your changes persist using the local storage fallback.
