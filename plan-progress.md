# Dr.CAT — Multi-Stage Roadmap & Progress

This document tracks our long-term objectives across three distinct phases, transitioning from local development to cloud deployment, and finally to a native offline-first Android app.

---

## 🗺️ Architectural Phases

```mermaid
graph TD
    P1[Phase 1: Local Polish - Termux/ngrok] -->|Fork/Branch| P2[Phase 2: Cloud Web Deployment]
    P2 -->|Capacitor Integration| P3[Phase 3: True Offline Android App]
```

---

## 📍 Progress Tracker

### Phase 1: Local Polish (Current)
*Goal: Perfect the user interface, responsiveness, and study features locally on Termux.*

- `[x]` **Layout Adjustments**: Strict 50/50 dashboard split, tablet spacing, and mobile scroll heights.
- `[x]` **Branding Update**: Logo generated, name updated to *Dr.CAT — Rappel Clinique*.
- `[x]` **Quiz Flow Fix**: Navigation link to reference sheet with a "Retour au Quiz" return button.
- `[x]` **Replace CSS `zoom: 0.9` hack**: Switch to standard CSS media queries for high-density tablets.
- `[x]` **Favicon Integration**: Set up the stethoscope logo as the browser favicon.
- `[x]` **Light/Dark Mode Toggle**: Allow switching styles; default to dark.
- `[x]` **Export/Backup Progress**: Allow downloading progress as JSON locally.

---

### Phase 2: Cloud Web Deployment (Fork)
*Goal: Host Dr.CAT publicly on a production cloud server to act as the central sync hub.*

- `[ ]` **Fork repository** for public web deployment.
- `[ ]` **Database Migration**: Migrate data storage from `cats_db.json` and `suggestions.json` to an online database (e.g., MongoDB, PostgreSQL, or Supabase).
- `[ ]` **Asset Cloud Storage**: Move the PDF folder to cloud bucket storage (S3/Supabase Storage) instead of bundling it in the Node.js repository.
- `[ ]` **Admin Security hardening**: Set up cloud environment variables for passwords and secrets.

---

### Phase 3: True Offline Android App (App Fork)
*Goal: Wrap the frontend into an offline-first Android app package (.apk) that caches files locally and syncs with the Cloud Hub when connected.*

- `[ ]` **Capacitor integration** to wrap the HTML/CSS/JS frontend.
- `[ ]` **Offline Database**: Configure local data storage on the phone (SQLite or LocalStorage fallback) so the app works with zero network connection.
- `[ ]` **Local PDF Bundler**: Embed reference PDFs directly into the app assets or download them to local device storage on first startup.
- `[ ]` **Sync Engine**: Build the synchronization client to push suggestions to the Stage 2 Cloud server and pull approved global updates when online.
