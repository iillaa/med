# Dr. CAT Phase 3 — Handoff for Gemini

**Date:** 2026-07-17  
**Branch:** `stage1`  
**Last Commit:** `1459ed8 fix(server): serve Vue SPA index.html for history-mode routes`  
**Status:** ⚠️ Structurally complete, UI/UX incomplete / broken compared to original vanilla app

---

## 1. Goal

Migrate Dr. CAT frontend from vanilla JS (`public/js/`, `public/style.css`, etc.) to **Vue 3 + Pinia + TypeScript** inside a new parallel project `med-vue/`. The old `public/` folder must remain untouched until final swap.

**Success Criteria (from `RECONSTRUCTION_PLAN_PHASE3.md`):**
- Vue app loads real CATs
- Shows sidebar, stats, quiz, and works on Capacitor
- Build outputs to `public/` so Express serves it without path changes

---

## 2. What Was Completed (Stages 0–9)

All 10 stages were executed and committed. The build succeeds (`vue-tsc --build` clean, Vite build succeeds). The server starts and serves the Vue shell.

| Stage | Commit | What was built |
|---|---|---|
| 0 | `35390c8` | Scaffolded `med-vue/` with Vite, Vue 3, TS, Pinia, Router. Configured `vite.config.ts`: `outDir: '../public'`, proxy `/api` to localhost:3000, `publicDir: '../static'`, `@` alias. |
| 1 | `fa4a1f8` | Data layer: `src/api/client.ts` (ported `public/js/api.js`), `src/types/cat.ts` + `quiz.ts`, Pinia stores `cats`, `app`, `quiz`, `src/utils/storage.ts`. |
| 2 | `1edb768` | Boot sequence: `src/main.ts` initializes app+cats before mount, `AppLoadingOverlay.vue`, router `beforeEach` guard. |
| 3 | `0d0acae` | Sidebar + navigation: `Sidebar.vue` with search, category filter, status pills, CAT list, progress bar. Routes: `/`, `/cats`, `/quiz`, `/workspace/:id`, `/pdfs`, `/admin`. Layout in `App.vue`. |
| 4 | `3452962` | Dashboard (`Dashboard.vue`) with stats, resume list, specialty progress bars. Cats view (`Cats.vue`) with full list, search, status dropdown. |
| 5 | `5023dd3` | Workspace (`Workspace.vue`) with CAT details, markdown rendering (`utils/markdown.ts`), notes textarea, status buttons. |
| 6 | `04c6090` | Quiz engine: `composables/useQuizGenerator.ts`, `Quiz.vue` with setup/question/results screens, Leitner stats + streak updates. |
| 7 | `1771f54` | PDF search (`Pdfs.vue`) + Admin panel (`Admin.vue`) with Suggestions + Diagnostics tabs. |
| 8 | `cb8b21c` | Capacitor: installed `@capacitor/android`, `@capacitor/haptics`, `@capacitor/share`. `capacitor.config.json` with `webDir: '../public'`. `utils/haptics.ts` wired into `catsStore.updateStatus()`. |
| 9 | `2c0336d` | Go-live: backed up `public/` → `public_vanilla_backup/`, rebuilt Vue app to `public/`, committed replacement. |

**Additional fixes:**
- `20d55fa` — Fixed runtime `ReferenceError: REMOTE_SERVER_URL is not defined` by guarding globals with `typeof globalThis` checks in `src/api/client.ts`.
- `1459ed8` — Fixed Express SPA fallback: replaced broken `app.get('*')` with `app.use()` middleware so Vue Router history-mode routes like `/workspace/3` return `index.html` instead of 404.

---

## 3. Current State of the Codebase

### Directory structure of `med-vue/`
```
med-vue/
├── capacitor.config.json
├── index.html
├── package.json
├── vite.config.ts
├── public/
│   └── drcat_logo.png
├── src/
│   ├── main.ts
│   ├── App.vue
│   ├── router/index.ts
│   ├── api/client.ts
│   ├── types/cat.ts, quiz.ts
│   ├── utils/storage.ts, markdown.ts, haptics.ts
│   ├── stores/cats.ts, app.ts, quiz.ts
│   ├── components/
│   │   ├── Common/AppLoadingOverlay.vue
│   │   └── Sidebar/Sidebar.vue
│   ├── composables/useQuizGenerator.ts
│   └── views/
│       ├── Dashboard.vue
│       ├── Cats.vue
│       ├── Workspace.vue
│       ├── Quiz.vue
│       ├── Pdfs.vue
│       └── Admin.vue
```

### What works
- `npm run build` passes (`vue-tsc --build` clean)
- Express serves `public/index.html` + Vue assets
- `/api/cats` returns real data with `x-app-key`
- Vue Router handles `/workspace/3` via SPA fallback
- Stores load CATs into reactive state
- Sidebar renders filtered CAT list
- Dashboard shows stats
- Workspace shows CAT details + notes binding
- Quiz generates questions + tracks score/Leitner

### What is broken / missing (UI/UX regression)

The user’s exact words: **“the ui look different and broken”**. The current Vue implementation is functionally skeletal. Compared to the original vanilla app, it is missing:

#### 3.1 Global CSS variables & theme
- The old `public/style.css` defined `:root` variables (`--color-primary`, `--color-background`, `--color-surface`, `--color-border`, `--text-primary`, `--text-secondary`, `--text-muted`, `--color-success`, `--color-warning`, `--color-danger`).
- The Vue app’s `src/assets/main.css` is the default Vite scaffold styles. **These CSS variables are not defined**, so any component using them renders with missing/inherited values.

#### 3.2 Layout structure
- Original: fixed sidebar (`320px`) + scrollable main content + mobile header + overlay.
- Current Vue `App.vue`: flex layout with `<Sidebar>` + `<main class="main-content">`. No mobile header, no overlay for sidebar tap-to-close, no responsive breakpoints.

#### 3.3 Sidebar styling
- Original had: collapsible controls band, animated chevron, shimmer skeletons during loading, pill-style status filters, slim progress bar, custom scrollbar.
- Current Vue `Sidebar.vue`: basic functional layout. Missing animations, skeleton loaders, collapsible panel logic, and the exact visual polish.

#### 3.4 Workspace tabs & red flags banner
- Original: tabbed interface (Conduite à tenir / Notes / Ordonnance), animated red-flags banner, prescription variants.
- Current Vue `Workspace.vue`: single static tab layout, no tab switching, no prescription variants, no animated red-flags banner.

#### 3.5 Dashboard resume list
- Original: sorted by `lastRead`, max 3 items, badge + status select inline, “Aucun cours en cours” empty state.
- Current Vue `Dashboard.vue`: shows first 3 doing/done, but no `lastRead` sorting (field doesn’t exist in `Cat` type yet), basic styling.

#### 3.6 Cats view
- Original: card layout with hover effects, inline status badges, category pills, truncated summary.
- Current Vue `Cats.vue`: basic card layout, functional but visually minimal.

#### 3.7 Quiz engine
- Original: QCM options, write-in textarea, hint system, self-grading panel, keyword matching tags, timer, visibilitychange wake lock.
- Current Vue `Quiz.vue`: basic write-in only, no QCM options, no hints, no self-grading, no timer, no wake lock.

#### 3.8 Admin panel
- Original: full suggestions moderation (approve/reject/edit), diagnostics with live data, rate limits, tunnel info.
- Current Vue `Admin.vue`: basic tab layout, fetches data but renders as raw `JSON.stringify` in `<pre>` tags.

#### 3.9 Markdown rendering
- `utils/markdown.ts` exists and works, but the rendered HTML lacks the original CSS for tables, lists, and paragraphs.

#### 3.10 Loading overlay
- `AppLoadingOverlay.vue` exists but uses a generic emoji icon instead of the actual `drcat_logo.png`. The original had a branded loading bar with progress text and skip button behavior.

#### 3.11 Missing original JS modules not yet ported
- `public/js/utils.js` → only `parseSummaryMarkdown` was ported; missing `escapeHTML`, `showToast`, `setButtonLoading`, `setupSwipeGestures`.
- `public/js/lib/helpers.js` → `isOfflineCat`, `mergeCatsWithLocalState` not used in stores (logic was inlined but not identical).
- `public/js/quiz/ui.js` → full quiz UI orchestration not ported.
- `public/js/quiz/scoring.js` → write-in keyword matching UI not ported.
- `public/js/workspace/prescription.js` → prescription variants not ported.
- `public/js/components/sidebar.js` → sidebar collapse/expand animation not ported.
- `public/js/components/dashboard/resume.js` → `lastRead` sorting not ported.
- `public/js/components/dashboard/progress.js` → category progress rendering partially ported but styling missing.

---

## 4. Known Runtime Issues & Fixes Applied

| Issue | Fix |
|---|---|
| `ReferenceError: REMOTE_SERVER_URL is not defined` | Guarded all global references in `src/api/client.ts` with `typeof globalThis !== 'undefined' ? (globalThis as any).REMOTE_SERVER_URL : undefined` |
| `/workspace/3` returns 404 | Replaced `app.get('*')` with `app.use()` fallback in `server/index.js` to serve `index.html` for non-API routes |
| `vue-tsc` type errors | Fixed `CatStatus` import, `shuffleArray` temp var typing, `currentQuestion` getter cast, markdown `line?.trim()` guard |
| Logo image not found in build | Copied `public/drcat_logo.png` to `med-vue/public/drcat_logo.png`; replaced with emoji in overlay |

---

## 5. Architecture Decisions to Preserve

1. **Build output:** `med-vue/vite.config.ts` uses `build.outDir: '../public'`. Do NOT change this unless you also update Express static paths.
2. **Dev proxy:** `server.proxy: { '/api': 'http://localhost:3000' }`. The Vue dev server proxies API calls to the Express backend.
3. **Offline-first:** `isOfflineApp` detection, Capacitor checks, and `fetchCats()` fallback to `data/cats_db.json` must be preserved.
4. **localStorage keys:** Exact key names (`dr_cat_user_progress`, `dr_cat_leitner`, `dr_cat_streak`, `dr_cat_local_overrides`, etc.) must stay compatible with the old app so user data isn’t orphaned.
5. **App mode logic:** `getAppMode()` / `setAppMode()` with `drcat-app-mode-changed` event must be preserved for Capacitor/online/offline switching.
6. **Server `index.js`:** The new SPA fallback middleware must stay **after** all `register*Routes(app)` calls and **before** `app.listen`.

---

## 6. What Gemini Should Focus On

The user explicitly said: **“phase 3 was not success”** and **“the problem is only in phase 3 we unfortunately have broken ui/ux”**.

So Gemini’s task is **not** to rebuild functionality (that’s already ported). Gemini should focus on **UI/UX fidelity**:

1. **Port the original CSS** (`public/style.css`, `public/css/variables.css`, `sidebar.css`, `layout.css`, `dashboard.css`, `workspace.css`, `modal.css`) into Vue `<style>` blocks or global CSS in `src/assets/main.css`.
2. **Match the original layout exactly:** fixed sidebar + scrollable main + mobile header + overlay.
3. **Restore missing interactions:** sidebar collapse/expand, tab switching in workspace, prescription variants, shimmer skeletons, toast notifications, swipe gestures.
4. **Fix visual regressions:** CSS variables missing, wrong fonts, missing animations, broken responsive behavior.
5. **Port remaining JS modules:** `utils.js` (toast, button loading, swipe), `lib/helpers.js`, `quiz/ui.js`, `quiz/scoring.js`, `workspace/prescription.js`.
6. **Add `lastRead` to `Cat` type** and sort resume list by it.
7. **Verify Capacitor haptics** work on actual device (currently just console-safe stubs).

---

## 7. How to Run / Verify

```bash
# Install deps
cd med-vue && npm install

# Type check
npx vue-tsc --build

# Build to public/
npm run build

# From project root, start server
node server.js

# Open browser
http://localhost:3000
# http://localhost:3000/workspace/3  should load Vue SPA (not 404)
```

**API key header required for data files:**
```bash
curl -H "x-app-key: drcat_pub_2f7a91c4e8" http://localhost:3000/api/cats
```

**Git log (newest first):**
```
1459ed8 fix(server): serve Vue SPA index.html for history-mode routes
5128f5f docs: note runtime REMOTE_SERVER_URL fix
20d55fa fix(vue): guard REMOTE_SERVER_URL globals at runtime
c5e488e docs: update progress_stage3.md all stages complete
2c0336d feat(vue): go-live replacing vanilla JS
cb8b21c feat(vue): capacitor integration
1771f54 feat(vue): pdf search and admin
04c6090 feat(vue): quiz engine
5023dd3 feat(vue): workspace view
3452962 feat(vue): dashboard and cats views
d970b40 docs: update progress_stage3.md Stage 3 complete
0d0acae feat(vue): sidebar and navigation
1edb768 feat(vue): boot sequence and loading overlay
fa4a1f8 feat(vue): data layer (api, stores, types, utils)
35390c8 feat(vue): scaffold project with Vite, Vue 3, TS, Pinia, Router
```

---

## 8. Key Files Reference

| Purpose | New Vue file | Original vanilla file |
|---|---|---|
| API client | `med-vue/src/api/client.ts` | `public/js/api.js` |
| Global state | `med-vue/src/stores/cats.ts` | `public/js/state.js` |
| App state | `med-vue/src/stores/app.ts` | `public/js/main.js` |
| Quiz state | `med-vue/src/stores/quiz.ts` | `public/js/components/quiz/state.js` |
| Quiz generator | `med-vue/src/composables/useQuizGenerator.ts` | `public/js/components/quiz/generator.js` |
| Markdown | `med-vue/src/utils/markdown.ts` | `public/js/utils.js` (parseSummaryMarkdown) |
| Sidebar | `med-vue/src/components/Sidebar/Sidebar.vue` | `public/js/components/sidebar.js` |
| Workspace | `med-vue/src/views/Workspace.vue` | `public/js/components/workspace.js` |
| Dashboard | `med-vue/src/views/Dashboard.vue` | `public/js/components/dashboard.js` |
| Quiz UI | `med-vue/src/views/Quiz.vue` | `public/js/components/quiz/ui.js` |
| CSS variables | `med-vue/src/assets/main.css` | `public/css/variables.css` |
| Server | `server/index.js` | `server.js` |

---

## 9. Bottom Line for Gemini

**Phase 3 structure is done. The Vue app builds, runs, and loads data. But the UI/UX is a skeleton. The user wants Gemini to bring the visual design, interactions, and missing modules up to parity with the original vanilla app so the migration can be marked successful.**

Focus on **visual fidelity and interaction completeness**, not on changing the architecture or rewriting the data layer.
