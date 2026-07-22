# Arbre Décisionnel - Mini App Shell

This folder contains the core logic extracted from the `Dr.CAT` PDF Lab architecture. 
As outlined in `arbre_decisionnelle_project.md`, this architecture can be adapted into a lightweight frontend shell for managing and generating medical decision trees (arbres décisionnels).

## Included Files (The Core Pipeline)

1. **pdf_lab.html** (The Admin UI Shell)
   - *Current Use:* Lists PDFs, triggers online AI extractions, and views JSON outputs.
   - *Future Use:* Can be adapted to list decision tree source files, trigger a translation/parsing API, and view the final generated decision tree JSON.

2. **pdf_extractor.js** (The Strategy Manager)
   - *Current Use:* Routes extraction requests to LlamaParse -> Google Flash -> Offline parser. 
   - *Future Use:* Can be adapted into a translation/structuring router (e.g., DeepL API -> Google Flash JSON Structurer -> Fallback).

3. **index_pdfs.js** (The Master Bundler)
   - *Current Use:* Scans caches and merges everything into a single `pdf_index.json` file securely without wasting API tokens on identical hashes.
   - *Future Use:* Scans individual decision tree JSON caches and compiles them into a `trees_master_index.json` for the mobile app to consume offline.

4. **pdfs.js** (The Secure API Layer)
   - *Current Use:* Guarded API routes (`/api/admin/*`) that trigger extractions and JSON downloads, locked behind `isLocalhostConnection`.
   - *Future Use:* Can serve as the secure local API that handles the translation/tree-generation requests without exposing them to the internet.

## Why keep this?
This exact architecture solves the exact problems needed for the decision tree app:
- **Cost Efficiency:** It hashes files and aggressively caches results to prevent redundant API calls.
- **Security:** It is restricted to the local device.
- **Zero UI Bloat:** It uses vanilla HTML/JS for rapid rendering.
- **Offline First:** It outputs a single compiled JSON file that can be trivially baked into an Android APK.
