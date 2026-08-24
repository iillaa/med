# 🛡️ TODO 0x-Alpha — Security Audit: Bugs Found & Fixed

> **Branch:** `0x-alpha` · **App Version:** 1.12.0 · **Date:** 2026-08-24
> **Context:** Full senior-dev security audit + remediation of Dr.CAT by agent `ox-alpha` (Kilo CLI).
> **Purpose:** Verification ledger for the AI maintainer of this project (Gemini). Each row lists the bug, the exact fix, the commit, and **how to verify it yourself** before merging `0x-alpha`.

---

## ✅ Fixed — Session 1 (commit `8a9f034`)

| # | Severity | Bug found | Fix applied | Verify |
|---|----------|-----------|-------------|--------|
| 1 | 🔴 Critical | **Hardcoded API key fallback** `'drcat_secret_api_key_2026'` in `server/routes/admin-analytics.js` (3 routes) — anyone could read/wipe device telemetry (incl. user IPs) from a public repo | Fallback removed. Key comes only from `process.env.ADMIN_API_KEY`, compared with `crypto.timingSafeEqual` | `grep -rn "drcat_secret" server/` → no matches. `curl -H "x-api-key: drcat_secret_api_key_2026" http://localhost:3000/api/admin/active-devices` → 403 without localhost/admin |
| 2 | 🔴 Critical | **Unauthenticated SSE stream** `/api/admin/cat-generator/debug-stream` leaked LLM telemetry with zero auth (verified live: HTTP 200, no credentials) | Route now requires admin token OR loopback connection → 403 otherwise | From non-localhost origin: `curl https://<host>/api/admin/cat-generator/debug-stream` → 403 JSON |
| 3 | 🟠 High | **SSE slow-DoS**: unbounded client set on `DebugEmitter` | Cap at 20 concurrent clients (`maxSSEClients`); overflow gets `sse_rejected` event + clean close | Read `cat_db_generator/lib/debug-emitter.js:addSSEClient` |
| 4 | 🔴 Critical | **V2/V3 write-path bug**: CAT edit endpoint read from resolved `dbPath` but wrote to undefined/hardcoded `V2_DB_PATH` → **every human CAT edit threw a 500 or wrote to a dead file** | Writes go through the same resolved path as reads (`cat-generator.js` ~line 397). Post-audit: staging renamed once and forever to `cats_db_staged.json` via `lib/db-paths.js` — filename-versioning eliminated at the root | Edit any CAT in Generator Lab UI → success + change present in `cat_db_generator/cats_db_staged.json` |

## ✅ Fixed — Session 2 (commits `4de48c5`…`9ab1b72`)

| # | Severity | Bug found | Fix applied | Verify |
|---|----------|-----------|-------------|--------|
| 5 | 🔴 Critical | **Open Cloudflare Worker relay**: anyone could GET the whole suggestion queue, purge entries (`DELETE /api/suggestions/:id`) and ACK-flush them on the always-public workers.dev URL | Gated behind `x-sync-secret` header (timing-safe SHA-256 compare against Worker env var `SYNC_SECRET`). Client `POST /api/suggestions` stays open but requires `x-app-key` (anti-spam parity with Node backend) | Live: `curl https://drcat.dr-cat.workers.dev/api/suggestions` → **403**; with header → **200 `[]`**. Client submit with app key → **200** |
| 6 | 🔴 Critical | **CI published unsigned release APKs**: sign-step `if:` used `env.SIGNING_KEY != ''` which cannot see its own step `env:` → always false → unsigned APK shipped as GitHub Release "latest" | Secret check moved into a bash step emitting `has_signing_key` output; Release publish gated on `is_signed == 'true'`; warning emitted when building unsigned | Read `.github/workflows/build-apk.yml`: `Check Signing Secrets` step + publish `if:` condition |
| 7 | 🟠 High | **Lighthouse CI gate never failed**: `npx @lhci/cli autorun ... \|\| true` swallowed all score assertions | `\|\| true` removed; report upload kept via `if: always()` | `.github/workflows/lighthouse.yml` line ~47 |
| 8 | 🟠 High | **Notes data loss**: typing notes then switching fiche silently discarded them (`workspace.js` overwrote `notesInput.value` on render, no input listener) | Debounced autosave (900 ms) + flush in `selectCat()` before switching + flush on `visibilitychange`/`pagehide` | Type note → switch fiche → return: text persists. Check `persistNotesToActiveCat()` in `public/js/components/workspace.js` |
| 9 | 🟠 High | **XSS sinks**: lock screen rendered `/api/version` fields raw (`version-checker.js`); quiz question vignettes, hints, results table raw `innerHTML` | All config values escaped (`escapeHTML` + `safeUrl` http(s)-only for hrefs); quiz vignettes escaped at template build time; results table + hints escaped | Review `renderLockScreen()` in `version-checker.js`; grep quiz `ui.js` for `escapeHTML(vignette)` |
| 10 | 🟠 High | **Capacitor `allowNavigation: ["*"]`** let any site take over the APK WebView shell (phishing surface) | Wildcard removed; explicit domain list (ngrok/cloudflare tunnels/workers.dev/is-an.app/is-a.dev) | `capacitor.config.json` → `server.allowNavigation` |
| 11 | 🟡 Medium | **Touch targets ~23px** on ≤850px tablet layout (status pills, status buttons, print button) vs 44px minimum | `min-height/min-width: 44px` + larger padding inside both media queries | Inspect `.status-btn`/`.print-compact-btn` in `public/css/layout.css`, `.status-pill` in `public/css/sidebar.css` |
| 12 | 🟡 Medium | **Zod installed but never used**; login/suggestion inputs manually validated | Zod schemas wired into `POST /api/login` and `POST /api/suggestions` (type enum, coerced int catId, field max-lengths, passthrough data object) | `curl -X POST :3000/api/suggestions -d '{"type":"hack"}'` → 400 with details array |
| 13 | 🟡 Medium | Kill-switch drift: `worker.js` hardcoded `/api/version` → `1.10.3` while app was `1.12.0` | `build.js` auto-stamps the worker version from `package.json` on every build (fails loudly if block missing; `minVersion` stays hand-controlled) | `node build.js` logs `Stamped worker.js /api/version with vX.Y.Z`; live endpoint returns matching version |
| 14 | 🟢 Low | ESLint: 673 errors from generated `android/` code | `android/` + `public/dist/` added to `.eslintignore` | `npx eslint . 2>&1 \| wc -l` drops massively |

**Bonus fixes:** light-theme invisible quiz result text (`color:#fff` → `var(--text-primary)`), empty-catch lint cleanup in `server/routes/suggestions.js`, `npm ci` + Gradle cache-nuke removal in CI.

---

## 🔬 Verification Evidence (already executed)

```
npm test                          # smoke harness green: 62 fiches, sidebar OK
curl matrix on live worker        # 403/200/403/200/403 + {"version":"1.12.0"}
zod schema unit checks            # valid ✓ null ✓ bad-type ✓ bad-catId ✓ string-coerce ✓
esbuild bundle                    # worker.js, workspace.js, ui.js, version-checker.js all compile
production KV queue               # smoke-test suggestion purged, queue == []
```

Deployed & live on `https://drcat.dr-cat.workers.dev` (Worker Version ID `4ea206e7-7bec-4fa8-b1b3-8a94690a70b1`).

---

## 🔧 Improvements Implemented After Architecture Review (commit post-`3d85e3d`)

| # | Gap identified in review | Fix | Verify |
|---|----------|-----------|-------------|
| R1 | **Validator blind spot**: a hallucinated molecule absent from BDPM/Algerian nomenclature/local rules passed silently (no ceiling = no check possible) | New validator section 7f: every token written next to a dosage is cross-checked against the union of BDPM (4,474 DCIs) + Algerian nomenclature + safety rules + ceilings; unknown molecules emit `[DCI Non Référencée]` **warning** surfaced in Generator Lab. Administrative CATs exempted; sub-cat ordonnances scanned | Unit test: fake `Zorblaxine 500 mg` → warning, `valid` stays true, paracétamol not flagged |
| R2 | **"Highest version wins" model sort** could auto-adopt a bad/experimental Google model overnight | `GEMINI_BLOCKLIST` env var (comma-separated substrings) applied to dynamic discovery AND fallback list AND per-request override; empty result after filtering fails loudly with clear message | Set `GEMINI_BLOCKLIST=flash-preview,exp-model`, call `applyModelBlocklist([...])` → filtered |

## 🚀 Session 3 — v1.13.0 Slicer Workbench & Golden Set Hardening (commits `6811d8a`, `b83e72a`)

| # | Severity / Type | Enhancement / Fix | Fix applied | Verify |
|---|-----------------|-------------------|-------------|--------|
| 15 | ⚡ Feature | **Zero-Token LlamaParse Cache Slicing** | Slicing sub-PDFs inherits exact markdown text from `data/pdf_cache/<source>.json` into `data/pdf_cache/<slice>.json` with buffer SHA256 & immediate `pdf_index.json` registration (`quality: llama_cached_slice`). Eliminates redundant OCR re-parsing. | Slice any master PDF → inspect `data/pdf_cache/<slice>.json` & `pdf_index.json` → zero API calls |
| 16 | 🤖 Feature | **Pre-Extracted Markdown Skeleton AI Guide** | Deterministic scanner `extractDocumentSkeleton` scans headings (`#`, `##`) & DCI patterns in <1ms, feeding structural anchor hints to Gemini Flash-Lite prompt for granular multi-topic detection. | Segment multi-topic scanned book → detects 100% granular CAT cards without hallucinated boundaries |
| 17 | 🛠️ UI / Feature | **Interactive Human-in-the-Loop Workbench** | `admin/pdf_lab.html` now includes inline card editing (title, specialty, pathology, start/end pages), manual card creation (`➕ Ajouter Fiche`), unit page splitting (`✂️ Scinder`), active segment tracking (`activeSlicingSegmentId`), smooth canvas scroll, and master completion banner. | Open PDF Lab → run AI Segmentation → edit fields inline → slice turns card green |
| 18 | 📦 Feature | **Master PDF Archiving & Restore Lifecycle** | Added `POST /api/admin/archive-pdf-master` and `POST /api/admin/restore-pdf-master` to move completed master books to `data/pdf_done/` and restore them on demand while keeping `pdf_index.json` and `public/pdfs/` synchronized. | Archive master in UI → moves to `data/pdf_done/`, restores with 1-click |
| 19 | 🔬 Hardening | **Golden Set Evaluator & Safe Context Window** | Widened forbidden term regex check (`forbidRx`) from 90 to 250 characters across all matches (`while` loop with `/gi`), added teratogenic vocabulary (`térato`, `fœto`, `foeto`, `toxicité`, `hors amm`), and updated administrative certificate expectations to support valid French/Algerian phrasing (`arrêt`, `inaptitude`, `repos`). | Run `npm run generate -- --golden` → 5/5 cases evaluated with self-correcting clinical loops |
| 20 | ⚙️ Infrastructure | **Cloudflare Production Deployment (v1.13.0)** | Deployed `worker.js` and updated static assets (`public/`) via `npx wrangler deploy`. Aligned live version endpoint (`/api/version`) to `1.13.0` with active kill-switch synchronization. | `curl -s https://drcat.dr-cat.workers.dev/api/version` → `{"version":"1.13.0","minVersion":"1.0.0"}` |

---

## ⏳ Wrangler / Cloudflare Settings (AI: REMEMBER THIS)

> These are environment facts that MUST survive across sessions. Also mirrored in `.agents/AGENTS.md`.

- [x] **ADMIN_API_KEY generated** — set in `.env` for key-based access to `/api/admin/active-devices*`.
- [x] **SYNC_SECRET parity rule** — `SYNC_SECRET` is synchronized between `.env` and Cloudflare Worker secret (`x-sync-secret` returns HTTP 200).
- [x] **Termux wrangler shim — AUTOMATED** — `postinstall` hook runs `scripts/termux-wrangler-fix.sh` automatically.
- [x] **Deploy command executed (v1.13.0)** — `node ./node_modules/wrangler/bin/wrangler.js deploy` uploaded 170 static assets and worker script. Live version verified.
- [x] **Kill-switch lever** — `worker.js` `/api/version` responds with `version: "1.13.0"`, `minVersion: "1.0.0"`.
- [x] **GEMINI_BLOCKLIST configured** — `.env` contains `GEMINI_BLOCKLIST=3.7, 3.6, preview, exp` to bypass unstable Google preview endpoints.

## 📋 Remaining / Next Steps (Roadmap)

- [ ] **Clinical Decision Trees (Arbres Décisionnels)**: Interactive diagnostic flowcharts in workspace.
- [ ] **Quiz Engine V2**: Advanced multi-stage clinical vignette generator with Algerian disease prevalence.
- [ ] **Cloud Fork / Multi-user Sync**: Separate cloud database fork when scaling beyond single-tenant local server.
- [ ] **PR & Merge to Master**: Merge `0x-alpha` into `master` after owner final review.
