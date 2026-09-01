# Security Hardening — v1.12.0 (0x-alpha Audit)

> **Scope:** Backend, edge worker, CI pipeline and client hardening applied by the `ox-alpha` agent audit (2026-08-23 → 2026-08-24).
> **Ledger:** Quick-reference table with per-fix verification lives in [`todo0xalpha.md`](../todo0xalpha.md). This document explains the *why* and *how*.

---

## 1. Threat Model Summary

Dr.CAT exposes three distinct surfaces with different trust levels:

| Surface | Exposure | Trust |
|---|---|---|
| Termux Node server (ngrok/trycloudflare tunnels) | Ephemeral, rotating URLs | Semi-trusted: localhost-gated admin routes |
| Cloudflare Worker (`drcat.dr-cat.workers.dev`) | **Always-on, fixed public URL** | Untrusted callers by default |
| Android APK / PWA clients | User devices | Untrusted input sources |

The audit found that security controls were concentrated on the Node server while the always-on Worker and CI pipeline had critical gaps.

---

## 2. Backend Fixes

### 2.1 Hardcoded admin API key fallback (`server/routes/admin-analytics.js`)
**Before:** `process.env.ADMIN_API_KEY || 'drcat_secret_api_key_2026'` on 3 telemetry routes. The fallback shipped in a public repo, making analytics read/wipe trivially accessible remotely.

**After:** dedicated `isValidApiKey()` using `crypto.timingSafeEqual` against env-only value. Missing env var ⇒ route refuses all API-key auth (localhost/admin-token paths still work).

### 2.2 SSE debug-stream authentication (`server/routes/cat-generator.js`)
`GET /api/admin/cat-generator/debug-stream` streamed LLM reasoning steps with no check. Now requires an active admin token or loopback connection; otherwise `403`.

### 2.3 SSE client cap (`cat_db_generator/lib/debug-emitter.js`)
`addSSEClient()` now rejects beyond `maxSSEClients = 20`, returning `false`; the route sends a single `sse_rejected` event and closes. Prevents slow-loris-style socket accumulation.

### 2.4 V2/V3 database write divergence (`server/routes/cat-generator.js`)
The CAT edit endpoint resolved its read path via `getV3DbPath()` (which may migrate v2→v3 on first access) but wrote to the legacy constant `V2_DB_PATH`. Consequences: 500 errors or silent write-to-dead-file. Writes and reads now share one resolved `dbPath`.

### 2.5 Input validation via Zod
Zod was declared in `package.json` but unused.
- `POST /api/login`: `{ password: string(1..200) }`.
- `POST /api/suggestions`: envelope schema — `type` enum `['add','edit']`; `catId` preprocesses `null/''/undefined → undefined` then coerces numeric strings into a strict positive integer; `data` is an object validating known field max-lengths (`title≤300`, `summary≤20000`, …) with `.passthrough()` for forward compatibility.

---

## 3. Cloudflare Worker Hardening (`worker.js`)

### 3.1 Shared-secret gate for server-to-server routes
Routes that only the Termux sync job should call are gated behind header `x-sync-secret` matched against the Worker's `SYNC_SECRET` environment variable using a constant-time SHA-256 digest comparison:

| Route | Gate |
|---|---|
| `GET /api/suggestions` (read queue) | 🔒 secret required |
| `POST /api/suggestions/ack` (flush flags) | 🔒 secret required |
| `DELETE|POST /api/suggestions/:id` (purge) | 🔒 secret required |
| `POST /api/suggestions` (client submit) | 🌐 open + `x-app-key` anti-spam |

**Design decision:** client submission stays open because `api.js` failover legitimately targets workers.dev when both ngrok tunnels are down. Locking it would break suggestions in exactly the failover scenario the backup exists for.

Secrets live in two places and must match:
1. `.env` → `SYNC_SECRET=<hex>` (consumed by `server/services/sync-suggestions.js` via `syncHeaders()`)
2. Worker secret: `npx wrangler secret put SYNC_SECRET --name drcat`

### 3.2 Kill-switch version auto-stamp (`build.js`)
`/api/version` previously hardcoded `version: "1.10.3"` while the app reached 1.12.0. Every build now rewrites the version literal inside the `/api/version` block of `worker.js` from `package.json`. If the pattern is not found the build **fails loudly** rather than guessing. `minVersion` remains the hand-controlled force-update lever.

---

## 4. Client Fixes

### 4.1 Notes autosave (`public/js/components/workspace.js`)
Worst-case data loss for a doctor: unsaved notes discarded when switching fiches. Three layers:
- debounced (900 ms) `input` listener persisting to `localStorage` progress store,
- synchronous flush at the top of `selectCat()` before `state.activeCat` is reassigned,
- flush on `visibilitychange(hidden)` and `pagehide` (app switch / screen off).

### 4.2 XSS sink escaping
- Lock screen (`public/js/version-checker.js`): IIFE-scoped `escapeHTML()` plus `safeUrl()` which only admits `http(s)` URLs from `/api/version` config into `href` attributes. All interpolated config fields (release notes, versions, messages, links) escaped.
- Quiz (`public/js/components/quiz/ui.js`): clinical vignettes escaped inside all four `questionText` templates; keyword hints and results-table titles/categories/catIds escaped; results table color switched to `var(--text-primary)` fixing invisible light-theme text.

### 4.3 WebView navigation pinning (`capacitor.config.json`)
Removed `"*"` wildcard from `server.allowNavigation`; explicit suffix list covers ngrok/cloudflare tunnel families, `workers.dev`, `pages.dev`, `is-an.app`, `is-a.dev`. A remote page can no longer hijack the app shell.

### 4.4 Tablet touch targets (≥44 px)
Inside the ≤850px breakpoints: `.status-btn`, `.print-compact-btn` (layout.css) and `.status-pill` (sidebar.css) get `min-height/min-width: 44px` with enlarged padding and flex centering. Desktop layout untouched.

---

## 5. CI Pipeline Fixes

### 5.1 Unsigned-release bug (`build-apk.yml`)
GitHub Actions step `if:` conditions cannot observe that same step's `env:` block, so `env.SIGNING_KEY != ''` always evaluated false and releases were published unsigned. Fix: bash pre-step `Check Signing Secrets` emits `has_signing_key` output consumed by the sign step's `if:`. Release publish additionally requires `steps.artifact_path.outputs.is_signed == 'true'` — unsigned builds upload as artifacts but never reach users as Releases.

Also: `npm install` → `npm ci`; "Clear Gradle Cache" step removed (it defeated caching every build).

### 5.2 Lighthouse gate (`lighthouse.yml`)
`\|\| true` removed so `lighthouserc.js` assertions (perf ≥ .85, a11y ≥ .85, BP ≥ .90) actually fail the workflow. Artifact upload retained with `if: always()`.

### 5.3 Lint hygiene
`android/` (673 generated-code errors) and `public/dist/` added to `.eslintignore`; empty catches in `server/routes/suggestions.js` annotated.

---

## 6. Deployment State

- Worker Version ID deployed: `4ea206e7-7bec-4fa8-b1b3-8a94690a70b1`
- Live verification matrix: gated GET/ACK/Purge → 403 without secret, 200 with; client POST with `x-app-key` → 200, without → 403; `/api/version` → `{"version":"1.12.0","minVersion":"1.0.0"}`
- All work committed on branch `0x-alpha` (`8a9f034`…`9ab1b72`); merge to `beta-test-pr`/`master` pending owner review.
