# Dr.CAT — Premium & Performance Roadmap

> **Purpose:** A single, prioritized plan to take Dr.CAT from "works" to "feels premium" — covering UI polish, perceived performance, real throughput, native Android feel, and reliability. This replaces ad-hoc suggestions with phased, committable work.
>
> **How to use this doc:**
> - Work top-to-bottom. Each **Phase** is a shippable milestone; each **task** is a self-contained commit.
> - `[ ]` = todo, `[~]` = in progress, `[x]` = done. Update as we go.
> - Every task lists: **Why it feels premium**, **Effort** (S/M/L), **Risk** (Low/Med/High), and **Done-when** (acceptance).
> - Do NOT batch multiple phases into one commit. One task = one checkpoint (so rollback stays easy).

---

## Guiding Principles (the "why" behind everything below)

1. **Never show a wrong/intermediate state.** No flashes (FOUC), no layout shift, no spinner flicker. Reserve space, load state early.
2. **State changes are atomic, then intentionally animated.** Half-animated = cheap. All-at-once or deliberately choreographed = premium.
3. **Animate only `transform` and `opacity`.** They're GPU-cheap. Never animate `width/height/top/left/all`.
4. **Single source of truth via design tokens.** Colors, spacing, type, z-index, motion — all variables. No magic numbers in components.
5. **Perceived performance > raw performance.** Skeletons, optimistic UI, and instant feedback matter more than shaving 20ms.
6. **Respect the OS.** System theme, reduced-motion, safe areas, status bar, back button, haptics.
7. **Measure before/after.** Use the existing `window.perf` harness + Lighthouse. No guessing.

---

## Current State (baseline audit — 2026-07-19)

**Already done ✅**
- CSS design tokens (color, spacing, typography, z-index, radius) in `variables.css`.
- Theme system: anti-FOUC head script, atomic swap, `color-scheme`, dual `theme-color`.
- `prefers-reduced-motion` support.
- Native status bar theming via `@capacitor/status-bar`.
- Themed scrollbars, `text-size-adjust`, `overscroll-behavior`.
- Perf measurement harness (`window.perf.startMeasure/endMeasure`).
- Basic service worker precache (`dr-cat-v5`, cache-first).
- Haptics, Share, Filesystem plugins wired.

**Gaps / opportunities 🎯**
- **No bundler** — ~26 raw ESM files loaded individually; no minify/tree-shake/split. `main.js` 960 LOC, `api.js` 895, `quiz/ui.js` 851.
- **Full list teardown** — `sidebar.renderCatList` does `innerHTML=''` + rebuild on every filter keystroke.
- **Heavy `innerHTML`** across diagnostics/quiz/workspace (reflow + re-parse cost).
- **No skeletons / optimistic UI** — uses a loading overlay + spinners.
- **Images**: 4 PNGs, no WebP/AVIF, no responsive sizes.
- **SW strategy** is basic cache-first; no stale-while-revalidate, no runtime caching tiers.
- **No virtualization** (fine at 55 CATs; matters if the DB grows).

---

# PHASE 0 — Foundation & Measurement (do first)
*Goal: know your numbers and lock in tooling so every later change is provable.*

- [x] **0.1 Add a motion-token layer** — `--motion-fast: 120ms`, `--motion-base: 200ms`, `--motion-slow: 320ms`, `--ease-standard`, `--ease-emphasized: cubic-bezier(.2,0,0,1)`, `--ease-spring: cubic-bezier(.34,1.2,.64,1)`. Migrate hardcoded `0.2s ease` to tokens.
  *Why:* consistent, tunable motion = the #1 "premium feel" lever. **Effort S · Risk Low · Done-when:** no raw duration/easing literals remain in CSS.
- [x] **0.2 Baseline Lighthouse + perf capture** — run Lighthouse (mobile) on key screens; record FCP, LCP, TBT, CLS, TTI in a `perf-baseline.md`. Snapshot `window.perf` render timings.
  *Why:* can't claim "faster" without before/after. **Effort S · Risk Low · Done-when:** baseline numbers documented.
- [x] **0.3 Reduced-motion JS guard** — expose `prefersReducedMotion()` helper; skip JS-driven animations (scroll, confetti, etc.) when set.
  *Why:* accessibility + parity with the CSS rule. **Effort S · Risk Low.**
- [x] **0.4 Cache-busting discipline** — auto-version all `css/*.css` + `js/*.js` links in `build.js` (you already bump `app-build-version`). 
  *Why:* users must actually receive updates; stale CSS = "broken premium." **Effort S · Risk Low · Done-when:** every asset link carries the build hash.

---

# PHASE 1 — Perceived Performance (biggest felt win)
*Goal: the app feels instant even when it isn't.*

- [x] **1.1 Skeleton loaders** — replace the loading overlay/spinners on: CAT detail, dashboard cards, quiz setup, PDF list. Use shimmer placeholders shaped like the final content.
  *Why:* the single biggest "premium vs amateur" signal. **Effort M · Risk Low · Done-when:** no bare spinner on primary content loads.
- [x] **1.2 Optimistic UI for status changes** — marking a CAT done/doing/todo updates the UI instantly, reconciles with storage after.
  *Why:* zero perceived latency on the most common action. **Effort M · Risk Med (rollback on failure) · Done-when:** status pill flips with no wait.
- [x] **1.3 Instant tab/route transitions** — pre-warm dashboard/quiz/workspace views; avoid re-init on every switch.
  *Why:* premium apps never "reload" a tab you just left. **Effort M · Risk Med.**
- [x] **1.4 Debounced search + incremental filter** — debounce the sidebar search (120–150ms) and diff the list instead of full teardown (see 2.1).
  *Why:* typing feels smooth, no jank per keystroke. **Effort S · Risk Low.**
- [x] **1.5 Image/logo readiness** — set explicit `width`/`height` on all `<img>`, add `loading="lazy"` to non-critical, `fetchpriority="high"` to the LCP logo.
  *Why:* kills layout shift (CLS) and speeds first paint. **Effort S · Risk Low.**

---

# PHASE 2 — Rendering Performance (real throughput)
*Goal: eliminate reflow/jank hotspots found in the audit.*

- [x] **2.1 Incremental list rendering (sidebar)** — stop `innerHTML=''` full rebuilds; keep a keyed map of `<li>` nodes, add/remove/reorder only what changed. Batch DOM writes in a `DocumentFragment`.
  *Why:* filtering/search becomes O(changes) not O(all). **Effort M · Risk Med · Done-when:** `sidebar.renderCatList` time drops materially in `window.perf`.
- [x] **2.2 `content-visibility: auto` on off-screen sections** — dashboard cards, long lists, collapsed panels.
  *Why:* browser skips rendering off-screen content = faster paint. **Effort S · Risk Low.**
- [~] **2.3 Virtualize long lists (conditional)** — only if CAT/PDF count grows past ~200; render visible window + buffer.
  *Why:* keeps scroll at 60fps regardless of list size. **Effort L · Risk Med · Gate:** defer until data grows.
- [x] **2.4 Replace hot-path `innerHTML` with templates** — for frequently re-rendered blocks (quiz question, diagnostics rows), build nodes once and update text/attrs.
  *Why:* avoids re-parsing HTML + is safer (less injection surface). **Effort M · Risk Med.**
- [x] **2.5 `will-change` / GPU hints on animated elements only** — sidebar slide, modals, toasts. Remove after animation to free memory.
  *Why:* smooth transforms without permanent memory cost. **Effort S · Risk Low.**
- [x] **2.6 Passive scroll/touch listeners** — audit all `addEventListener('scroll'|'touchstart', …)` → add `{ passive: true }` where not calling `preventDefault`.
  *Why:* removes scroll-blocking jank on Android WebView. **Effort S · Risk Low.**

---

# PHASE 3 — Motion & Micro-interactions (the "wow")
*Goal: deliberate, consistent choreography.*

- [x] **3.1 Modal / bottom-sheet open-close animations** — scale+fade in (emphasized easing), backdrop fade; sheet slides from bottom on mobile.
  *Why:* the difference between "a div appeared" and "a surface presented." **Effort M · Risk Low.**
- [x] **3.2 Button & tap feedback** — subtle press-scale (`:active { transform: scale(.97) }`), ripple or highlight, paired with light Haptics on native.
  *Why:* tactile, responsive, native-feeling. **Effort S · Risk Low.**
- [x] **3.3 List item enter/exit** — staggered fade/slide when the filtered list changes (respecting reduced-motion).
  *Why:* changes feel intentional, not abrupt. **Effort M · Risk Low.**
- [x] **3.4 Quiz feedback polish** — animated score count-up, correct/incorrect state transitions, progress bar easing, tasteful success moment.
  *Why:* turns a quiz into an experience; drives engagement. **Effort M · Risk Low.**
- [x] **3.5 Theme-toggle reveal (optional flourish)** — View Transitions API circular reveal from the toggle button (fallback to instant swap).
  *Why:* signature premium detail. **Effort M · Risk Med (progressive enhancement).**
- [x] **3.6 Pull-to-refresh (native feel)** on lists where a refresh makes sense.
  *Why:* expected native gesture. **Effort M · Risk Med.**

---

# PHASE 4 — Native Android Polish (Capacitor)
*Goal: feels like a real app, not a website in a box.*

- [ ] **4.1 Safe-area insets** — honor notch/status-bar/nav-bar via `env(safe-area-inset-*)` on headers, toasts, sheets.
  *Why:* content never hides under system UI. **Effort S · Risk Low.**
- [ ] **4.2 Hardware back button** — Capacitor `App.addListener('backButton')`: close modal/sheet → go back → confirm-exit at root.
  *Why:* mishandled back = instant "cheap app" tell. **Effort M · Risk Med · Done-when:** back never dead-ends or exits unexpectedly.
- [x] **4.3 Splash screen → app handoff** — branded splash that fades into the app; hide only when first meaningful paint is ready (`@capacitor/splash-screen`).
  *Why:* seamless launch, no white flash. **Effort S · Risk Low.**
- [ ] **4.4 Haptics everywhere sensible** — success/error/selection patterns on key actions (save, quiz answer, toggle).
  *Why:* premium tactile layer (you already have the plugin). **Effort S · Risk Low.**
- [x] **4.5 App state lifecycle** — pause timers/polling on `App` background; resume + refresh on foreground.
  *Why:* battery + correctness; feels considered. **Effort M · Risk Med.**
- [x] **4.6 Keyboard handling** — `@capacitor/keyboard`: resize/scroll inputs into view, dismiss on scroll.
  *Why:* forms that don't fight the keyboard. **Effort M · Risk Med.**

---

# PHASE 5 — Load Time & Bundle (throttling / low-end devices)
*Goal: fast cold start on cheap Androids and slow networks.*

- [x] **5.1 Introduce a bundler (esbuild or Vite)** — minify + tree-shake + hash the JS/CSS. Keep output in `public/` so Capacitor/Express serve it unchanged.
  *Why:* 26 raw modules → a few minified chunks = far fewer requests, smaller payload. **Effort L · Risk Med · Done-when:** production build emits hashed, minified bundles; app runs identically.
- [x] **5.2 Route-based code-splitting** — lazy-load quiz, diagnostics, admin dashboard, PDF viewer only when opened (`import()`).
  *Why:* first screen ships less JS = faster TTI. **Effort M · Risk Med.**
- [x] **5.3 Defer heavy libs** — load `pdf.min.js`/worker only when a PDF opens.
  *Why:* pdf.js is large; most sessions may never open a PDF. **Effort S · Risk Low.**
- [x] **5.4 Critical CSS inline + defer rest** — inline above-the-fold CSS in `<head>`, lazy-load the rest.
  *Why:* faster first paint. **Effort M · Risk Med.**
- [x] **5.5 Self-host fonts + subset** — bundle Outfit locally (WOFF2, subset to used weights/glyphs) instead of Google Fonts CDN.
  *Why:* removes a render-blocking third-party request; works fully offline. **Effort M · Risk Low.**
- [x] **5.6 Image optimization** — convert PNGs to WebP/AVIF with PNG fallback; compress; correct sizes.
  *Why:* smaller downloads, faster LCP. **Effort S · Risk Low.**
- [x] **5.7 Low-end profiling** — test with CPU 4× throttle + "Slow 3G"; fix the worst offenders.
  *Why:* your users aren't all on flagships. **Effort M · Risk Low.**

---

# PHASE 6 — Offline, Caching & Reliability
*Goal: rock-solid offline + trustworthy updates (core to your offline mode).*

- [ ] **6.1 Upgrade the service worker** — precache the app shell; **stale-while-revalidate** for data (cats/pdf index); cache-first for static assets; network-first for live APIs with cache fallback.
  *Why:* instant loads + fresh data + graceful offline. **Effort M · Risk Med · Done-when:** works fully offline and updates data when online.
- [x] **6.2 Update flow** — detect new SW/version, show a non-intrusive "Update available — reload" toast.
  *Why:* users get fixes without confusion or hard cache clears. **Effort M · Risk Med.**
- [x] **6.3 Offline indicator** — subtle, honest online/offline badge; disable actions that need network.
  *Why:* sets expectations, avoids dead taps. **Effort S · Risk Low.**
- [x] **6.4 Error/empty states** — designed empty states (no CATs, no results, load failed) with a retry, not blank screens.
  *Why:* premium apps never show a void. **Effort M · Risk Low.**

---

# PHASE 7 — Accessibility & Finishing Touches
*Goal: inclusive, robust, App-Store-grade.*

- [x] **7.1 Focus management** — trap focus in modals, return focus on close, logical tab order.
  *Why:* keyboard/switch users + polish. **Effort M · Risk Med.**
- [ ] **7.2 ARIA + semantics** — roles/labels on custom controls (tabs, toggles, dialogs), live regions for toasts.
  *Why:* screen-reader support; also improves quality perception. **Effort M · Risk Low.**
- [ ] **7.3 Contrast & tap-target audit** — verify WCAG AA contrast (both themes) and ≥44px tap targets.
  *Why:* legibility + fewer mis-taps. **Effort S · Risk Low.**
- [ ] **7.4 Consistent iconography & spacing pass** — migrate remaining hardcoded px to spacing/type tokens; align icon sizes.
  *Why:* visual consistency is subconscious "premium." **Effort M · Risk Low.**
- [ ] **7.5 Dark/light parity review** — every screen checked in both themes for stuck colors/contrast.
  *Why:* one broken screen undoes the whole theme system. **Effort S · Risk Low.**

---

## Suggested Execution Order (roadmap)

| Sprint | Focus | Phases | Outcome |
|---|---|---|---|
| **1** | Foundation + felt speed | 0, 1 | Instant-feeling UI, measurable baseline, motion tokens |
| **2** | Real rendering perf | 2 | No jank on lists/scroll; faster renders |
| **3** | Delight | 3 | Signature micro-interactions & animations |
| **4** | Native feel | 4 | Back button, safe areas, splash, haptics, lifecycle |
| **5** | Cold-start speed | 5 | Bundler, splitting, images, fonts — fast on low-end |
| **6** | Reliability | 6 | Bulletproof offline + update flow |
| **7** | Polish & a11y | 7 | Accessible, consistent, ship-ready |

**Highest ROI if you only do 5 things:** 1.1 Skeletons · 2.1 Incremental list · 3.1/3.2 Modal + tap feedback · 4.2 Back button · 5.1 Bundler.

---

## Definition of "Premium" (acceptance gate for shipping)

- [ ] Cold start < 2s on a mid-range Android (4× CPU throttle).
- [ ] No visible flash, spinner-flicker, or layout shift (CLS ≈ 0) on any primary screen.
- [ ] Every primary action gives feedback in < 100ms (optimistic or skeleton).
- [ ] Scroll and animations hold ~60fps; `transform`/`opacity` only.
- [ ] Full offline usability; clear, non-destructive update flow.
- [ ] Both themes pixel-consistent; reduced-motion honored; back button correct.
- [ ] Lighthouse (mobile): Performance ≥ 90, Accessibility ≥ 95, Best Practices ≥ 95.

---

## Working Agreement (so we don't mix work again)

- One task → one commit (like the theme checkpoint). Small, revertible.
- Each perf task includes a before/after `window.perf` or Lighthouse note.
- Never regress the safety rules: keep Capacitor plugins, keep offline search-highlight duplication, don't break the CI build.
- Update this file's checkboxes as tasks land.

---

## PHASE 3 — Audit (completed 2026-07-20)

**Scope:** Motion & micro-interactions (3.1–3.6). Each task shipped as its own commit on `structured`.

| Task | Commit | What landed | Risk notes |
|---|---|---|---|
| 3.1 Modal/bottom-sheet | `c5813e5` | Close animations + mobile sheet + JS modals (`export`/`review`) routed through shared animated classes; reduced-motion aware | Low |
| 3.2 Tap feedback | `8654b8a` | `.tap-ripple` highlight + extended `:active` press-scale; `attachTapFeedback`/`initTapFeedback` fire light native haptic on pointerdown | Low — no-op under reduced-motion |
| 3.3 List enter/exit | `3bfa48c` | `.cat-item-enter` (capped stagger) + `.cat-item-exit`; exit animates before DOM removal | Low — item map preserved |
| 3.4 Quiz polish | `a54227a` | `countUp()` helper; score count-up + spring pop; eased progress bar; feedback status pop; success pulse ≥80% | Low |
| 3.5 Theme reveal | `ae9743d` | View Transitions API circular clip-path reveal from toggle button; instant-swap fallback | Med — progressive enhancement, guarded by feature + reduced-motion check |
| 3.6 Pull-to-refresh | `9e6a225` | `setupPullToRefresh()` on CAT list; spinner indicator; wired to `refreshCatsAndRender()` | Med — touch + mouse fallback, only at scrollTop 0 |

**Verification performed:**
- All edited JS files pass `node --check` (ESM).
- ESLint: **0 new errors** introduced (9 pre-existing `no-empty` catch-block warnings exist project-wide, confirmed unchanged via `git stash`).
- Grep-confirmed every animation is `transform`/`opacity` only and gated behind `prefers-reduced-motion`.

**Not verified (no headless browser here):** live paint/feel of animations, View Transitions rendering, and pull-to-refresh gesture on a real Android WebView. Recommend a manual pass on device before shipping Phase 3.

**Verdict:** Phase 3 acceptance met in code. Outstanding: device-level UX confirmation.

