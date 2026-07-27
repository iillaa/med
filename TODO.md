# Security & Preload Fix TODO

## Completed ✅
- [x] Plan approved by user
- [x] **1. Remove preload link** — `public/index.html`: Removed `<link rel="preload" href="data/cats_db.json">`
- [x] **2. Add `x-app-key` validation middleware** — `server/index.js`: Added middleware that blocks `/data/*` files unless `x-app-key` matches
- [x] **3. Validate `x-app-key` on `GET /api/cats`** — `server/routes/cats.js`: Added key check on the GET route
- [x] **4. Secure `/data/pdf_index.json`** — Covered by item 2 (middleware blocks all `/data/*`)
- [x] **5. Tighten CORS for API** — `server/middleware/cors.js`: Don't allow wildcard origin for API when no Origin header

## Completed ✅
- [x] **6. Test** — All tests passed:
  - `curl /data/cats_db.json` without key → **403** ✅
  - `curl /api/cats` without key → **403** ✅
  - `curl /data/cats_db.json` WITH key → **200** ✅
  - `curl /api/cats` WITH key → **200** ✅
  - `curl /data/pdf_index.json` WITH key → **200** ✅
