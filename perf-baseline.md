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

_How to update:_ after each perf phase, re-run the capture above and fill the
"After" column. Keep this file committed with each milestone so history is
auditable.
