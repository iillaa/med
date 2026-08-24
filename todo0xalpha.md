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
| 4 | 🔴 Critical | **V2/V3 write-path bug**: CAT edit endpoint read from resolved `dbPath` but wrote to undefined/hardcoded `V2_DB_PATH` → **every human CAT edit threw a 500 or wrote to a dead file** | Writes go through the same resolved path as reads (`cat-generator.js` ~line 397) | Edit any CAT in Generator Lab UI → success + change present in `cats_db_v3_generated.json` |

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

## ⏳ TODO — Wrangler / Cloudflare Settings (AI: REMEMBER THIS)

> These are environment facts that MUST survive across sessions. Also mirrored in `.agents/AGENTS.md`.

- [ ] **SYNC_SECRET parity rule** — `SYNC_SECRET` exists in two places and MUST stay identical:
  1. Local Termux: `.env` → `SYNC_SECRET=<hex>` (read by `server/services/sync-suggestions.js`)
  2. Cloudflare: Worker secret on `drcat` (`wrangler secret put SYNC_SECRET --name drcat`)
  If one changes, KV sync fails silently-ish (403 + console warning server-side; clients unaffected).
- [x] **Termux wrangler shim — AUTOMATED** — `workerd` has NO android-arm64 binary and crashes every wrangler command without a patch. Now handled automatically:
  - `package.json` `postinstall` hook runs `scripts/termux-wrangler-fix.sh` after every install
  - Script is platform-guarded: patches ONLY inside Termux/Android, no-op elsewhere, never fails the install
  - `wrangler` moved to `optionalDependencies` so its workerd build failure can never hard-crash `npm install` on this tablet
  - `allowScripts` pins approved postinstalls (`esbuild`, `workerd`) for npm ≥11.18 script-approval layer
  - Manual fallback remains: `bash scripts/termux-wrangler-fix.sh`
  - Only `wrangler dev` needs the real binary (never worked on-device anyway); `whoami`/`secret put`/`deploy` all work patched
- [ ] **Deploy command** — `npx wrangler deploy` (deploys `worker.js` + `public/` assets together per `wrangler.jsonc`). OAuth token stored at `/root/.config/.wrangler/config/default.toml`.
- [ ] **Kill-switch lever** — force-update enforcement = `minVersion` in `worker.js` `/api/version` response. Bump it deliberately; the `version` field itself is auto-stamped by `build.js`.
- [ ] **Known network quirk** — tablet DNS sometimes returns unroutable IPv6 for `*.workers.dev`. Test with forced edge IP (`curl --resolve …104.21.x.x`) before assuming an outage.

## 📋 Deferred (not bugs — deliberate scope decisions)

- Nonce-based CSP → deferred until >10k users (see `TODO.md` security section).
- Merge strategy: `0x-alpha` → `beta-test-pr`/`master` pending owner review. CI fixes activate only once pushed.
- Roadmap features (quiz V2, decision trees, cloud fork) remain tracked in `TODO.md` / `audit/migration_audit.md`.
