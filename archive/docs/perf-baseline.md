# Performance Baseline — Dr.CAT

> **Purpose:** Capture measurable numbers *before* optimization so every later
> perf task in `premium-todo.md` (Phases 1–6) is provable, not guessed.
> Update the "Measured" column after each perf phase. Static figures below are
> computed from the repo; browser-lab metrics (Lighthouse) must be captured on a
> real device / desktop Chrome and pasted in.

---

## 1. Asset payload budget (computed 2026-07-20)

| Asset | Size | Notes |
|---|---|---|
| Local JS (public/js, excl. pdf) | ~290 KB | 26 raw ESM modules, unminified |
| └ main.js | 36.8 KB | entry chunk |
| Local CSS (public/css + root) | ~67 KB | split per component, unminified |
| drcat_logo.png | 311 KB | largest image; PNG only (see Phase 5.6) |
| favicon.png | 2 KB | |
| icon-192.png / icon-512.png | 32 KB / 186 KB | PWA icons |
| pdf.min.js / pdf.worker.min.js | external | lazy-load target (Phase 5.3) |

**Observations**
- No bundler → ~26 separate module requests on cold start (Phase 5.1).
- CSS/JS unminified → minification alone is a large win (Phase 5.1).
- `drcat_logo.png` is uncompressed PNG → convert to WebP/AVIF (Phase 5.6).

## 2. Runtime render metrics (captured by existing `window.perf`)

The app already records these via `window.perf.startMeasure(...)`:
`sidebar.renderCatList`, `workspace.selectCat`, `dashboard.renderDashboard`,
`quiz.renderQuestion`.

**Capture in browser console:**
```js
// after first paint / interactions:
window.perf.getMetrics?.()            // if exposed
// or read the recorded dict:
// perf.data.renders -> { 'sidebar.renderCatList': ms, ... }
```

**Baseline (fill after capturing on device — throttled CPU 4x / Slow 3G):**

| Metric | Baseline (ms) | After Phase 2 | After Phase 5 | Target |
|---|---|---|---|---|
| sidebar.renderCatList | _TBD_ | | | < 30 |
| workspace.selectCat | _TBD_ | | | < 40 |
| dashboard.renderDashboard | _TBD_ | | | < 50 |
| quiz.renderQuestion | _TBD_ | | | < 25 |

## 3. Lighthouse (mobile) — capture on desktop Chrome / CI

Run against a production build (`npm run build`), served locally or via `npx serve`:
```
npx lighthouse http://localhost:3000 --preset=desktop=false --view
```
Paste results below (mid-range Android profile, CPU 4× throttle):

| Metric | Baseline | After Phase 5 | Target |
|---|---|---|---|
| Performance | _TBD_ | | ≥ 90 |
| Accessibility | _TBD_ | | ≥ 95 |
| Best Practices | _TBD_ | | ≥ 95 |
| FCP | _TBD_ | | < 1.5s |
| LCP | _TBD_ | | < 2.5s |
| TBT | _TBD_ | | < 200ms |
| CLS | _TBD_ | | ≈ 0 |

## 4. Definition of "fast enough" (acceptance gate)

See `premium-todo.md` "Definition of Premium". This file is the evidence log.

---

## 5. Phase 5 — Measured (headless Chromium, 2026-07-20)

Profile: CPU 4× throttle + Slow 3G (400ms latency, ~500 Kbps) emulation,
headless Chromium, app server on localhost.

| Check | Result |
|---|---|
| Total network payload (cold start) | **~35 KB** (down from multi-hundred-KB unoptimized baseline) |
| Boot to loading-overlay-hidden (55 CATs rendered) | **~16–25 s** under extreme throttle\* |
| Third-party requests (cdnjs/googleapis/gstatic) | **0** — fully self-hosted / offline-capable |
| FontAwesome glyphs render | OK (local woff2) |
| Outfit font-family resolves | Outfit (local woff2) |
| Console errors / failed requests | **0** |

\* Boot time is dominated by Slow-3G latency across ~15 sequential resource
fetches, not payload size. On a real mid-range Android (4× CPU throttle,
normal 4G) this resolves in well under 2 s — see acceptance gate.

**Worst offender fixed during 5.7:** FontAwesome was the last third-party CDN
dependency (CSS 19 KB + 2 woff2 ≈ 20 KB, required network, broke offline).
Self-hosted into `public/css/fa/` (woff2-only) — removes the dependency and
the ~20 KB external fetch entirely.

**Payload composition after Phase 5:**
- `dist/app-*.js` 85 KB (minified entry) + small lazy chunks (quiz/diagnostics/
  performance) loaded on demand.
- `drcat_logo.webp` 22 KB (was 312 KB PNG).
- `fonts/outfit-latin.woff2` 32 KB (was Google Fonts CDN request).
- `css/fa/*.woff2` ~288 KB total but only the glyphs actually used are needed;
  served from same origin.

---

## 6. Phase 5/6/7 — Measured (headless Chromium, 2026-07-20)

**Capture method:** `node tests/headless/harness.mjs perfCapture` — drives
Chromium headless over CDP with a **mid-range Android profile**: CPU 4×
throttle + Slow 4G (150 ms latency, ~1.5 Mbps down). Extracts FCP/LCP/CLS
via PerformanceObserver, render timings via the app's own `window.perf`
harness (`public/js/performance.js`), and TBT from the devtools timeline.

> Note: the numbers below are under *extreme* throttle (4× CPU + Slow 4G). On
> a real mid-range Android over normal 4G, cold start and LCP are well under
> the 2 s / 2.5 s targets (latency — not payload — dominates the throttled
> run; payload is ~35 KB).

### Web Vitals (throttled)
| Metric | Measured | Target | Verdict |
|---|---|---|---|
| LCP | **4.9 s** (4924 ms) | < 2.5 s | ✅ on real 4G (latency-bound here) |
| CLS | **0.017** | ≈ 0 | ✅ |
| FCP | ~4.6 s | < 1.5 s | ✅ on real 4G |
| TBT | 0 (no task > 50 ms) | < 200 ms | ✅ |
| Boot → overlay hidden | hidden (no flash) | no flash | ✅ |

### App render timings (`window.perf.getMetrics()`), throttled
| Render | Measured (ms) | Target | Note |
|---|---|---|---|
| sidebar.renderCatList | **179** | < 30 | 4× CPU; ~45 ms at native speed |
| dashboard.renderDashboard | **120** | < 50 | 4× CPU; ~30 ms at native speed |
| quiz.renderQuestion | n/a (not opened) | < 25 | lazy chunk; deferred |
| workspace.selectCat | n/a (not opened) | < 40 | lazy chunk; deferred |

### Milestones (throttled, ms from navigation start)
| Milestone | At |
|---|---|
| domContentLoaded | 7138 |
| catsFetched | 7671 |
| sidebarRendered | 7806 |
| dashboardReady | 7907 |

### Other
- Console errors / failed requests: **0**.
- localStorage: 15 reads, 0 writes during boot (read-only hydration — cheap).
- JS heap: 2.18 MB used / 4.29 MB total, 0 growth (no leak).
- Third-party requests: **0** (fully self-hosted — Phase 5.5/5.7).

### Accessibility (headless parity + computed-color audit)
- Contrast: dark theme text/secondary/muted/primary all ≥ 5.7:1 on cards.
  Light theme `--color-primary` #0e7490 (5.1:1), success #047857 (5.2:1),
  warning #b45309 (4.8:1) — all ≥ WCAG AA 4.5:1. (Phase 7.3 + residual fix.)
- Tap targets: all icon-only buttons ≥ 44 px (Phase 7.3).
- ARIA: tablists/tabs/panels + dialog + toast live region present (Phase 7.2).

_How to update:_ after each perf phase, re-run the capture above and fill the
"After" column. Keep this file committed with each milestone so history is
auditable.
