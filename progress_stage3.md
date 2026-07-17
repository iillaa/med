# Phase 3 Progress Tracker

**Started:** 2026-07-17
**Branch:** `stage1`
**Plan:** `RECONSTRUCTION_PLAN_PHASE3.md`

---

## Summary

Migrating Dr. CAT frontend to Vue 3 + Pinia + TypeScript in `med-vue/`.

---

## Stage 0: Project Scaffold ✅
- [x] Create `med-vue/` at project root
- [x] Run `npm create vue@latest` (Vue 3, TS, Pinia, Vue Router, ESLint, Prettier)
- [x] Set `"type": "module"` in `med-vue/package.json`
- [x] Create `med-vue/vite.config.ts` with build outDir, dev proxy, publicDir, alias
- [x] Copy `ARCHITECTURE.md` to `med-vue/`
- **Commit:** `feat(vue): scaffold project with Vite, Vue 3, TS, Pinia, Router`

---

## Stage 1: Data Layer (Engine) ✅
- [x] **1.1 API Client:** `med-vue/src/api/client.ts` — ported `api.js` logic with TS types
- [x] **1.2 Types:** `med-vue/src/types/cat.ts`, `quiz.ts` — defined interfaces
- [x] **1.3 Pinia Stores:**
  - [x] `stores/cats.ts` — `initialize()`, `fetchAllCats()`, `updateStatus()`, getters
  - [x] `stores/app.ts` — `loading`, `isOffline`, `theme`, `initializeApp()`
  - [x] `stores/quiz.ts` — `session`, `score`, `leitnerData`, `startQuiz()`, `submitAnswer()`
- [x] **1.4 Utils:** `med-vue/src/utils/storage.ts` — localStorage helpers
- [x] **1.5 Run `npx vue-tsc --noEmit`** — passes
- **Commit:** `feat(vue): data layer (api, stores, types, utils)`

---

## Stage 2: Boot Sequence ✅
- [x] **2.1 Entry:** `med-vue/src/main.ts` — create Pinia, mount App after init
- [x] **2.2 Root App:** `med-vue/src/App.vue` — show `<AppLoadingOverlay />` while loading
- [x] **2.3 Overlay:** `med-vue/src/components/Common/AppLoadingOverlay.vue` — ported overlay styles
- [x] **2.4 Router Guard:** `med-vue/src/router/index.ts` — `beforeEach` to await `catsStore.initialize()`
- [x] **2.5 Build passes:** `npm run build` succeeds
- **Commit:** `feat(vue): boot sequence and loading overlay`

---

## Stage 3: Sidebar & Navigation ✅
- [x] **3.1 Router Views:** Define routes: `/` (Dashboard), `/cats`, `/quiz`, `/workspace/:id`, `/pdfs`, `/admin`
- [x] **3.2 Sidebar Component:** `med-vue/src/components/Sidebar/Sidebar.vue`
  - [x] Import `catsStore`
  - [x] Render `store.filtered` (search input binds to `store.searchQuery`)
  - [x] Click navigates to `/workspace/:id`
  - [x] Category filter dropdown
- [x] **3.3 Layout:** Move Sidebar to `App.vue` layout (outside `<RouterView>`)
- **Commit:** `feat(vue): sidebar and navigation`

---

## Stage 4: Dashboard & Cats Views ⏳ PENDING
- [ ] **4.1 Dashboard:** `med-vue/src/views/Dashboard.vue`
  - [ ] Use `catsStore.stats` for mastery %, counters
  - [ ] Render "Resume" list (cats with status 'doing'/'done')
  - [ ] Render "Progress by Specialty" using `store.cats`
- [ ] **4.2 Cats View:** `med-vue/src/views/Cats.vue` — full list with search/filter
- [ ] **4.3 Status Updates:** Clicking status updates `catsStore.updateStatus()`
- **Commit:** `feat(vue): dashboard and cats views`

---

## Stage 5: Workspace (CAT Details) ⏳ PENDING
- [ ] **5.1 Workspace View:** `med-vue/src/views/Workspace.vue`
- [ ] **5.2 Notes:** Bind textarea to `cat.notes`. Save via `catsStore.updateNotes()`
- [ ] **5.3 Status Buttons:** Wire to `catsStore.updateStatus()`
- **Commit:** `feat(vue): workspace view`

---

## Stage 6: Quiz Engine ⏳ PENDING
- [ ] **6.1 Generator:** `med-vue/src/composables/useQuizGenerator.ts`
- [ ] **6.2 Quiz View:** `med-vue/src/views/Quiz.vue`
- [ ] **6.3 Leitner:** Update `quizStore` on correct/incorrect answers
- **Commit:** `feat(vue): quiz engine`

---

## Stage 7: PDF Search & Admin ⏳ PENDING
- [ ] **7.1 PDF Search:** Add tab to Workspace or separate view
- [ ] **7.2 Admin Panel:** `med-vue/src/views/Admin.vue`
- [ ] **7.3 Performance:** Port metrics view
- **Commit:** `feat(vue): pdf search and admin`

---

## Stage 8: Capacitor Integration ⏳ PENDING
- [ ] **8.1 Install:** `npm install @capacitor/android @capacitor/haptics @capacitor/share`
- [ ] **8.2 Config:** `med-vue/capacitor.config.json` — point `webDir: '../public'`
- [ ] **8.3 Plugins:** Add haptic feedback on status changes
- [ ] **8.4 Build:** `npm run build` and verify `../public/index.html` is generated
- **Commit:** `feat(vue): capacitor integration`

---

## Stage 9: Go-Live Swap ⏳ PENDING
- [ ] **9.1 Backup:** Rename old `public/` to `public_vanilla_backup/`
- [ ] **9.2 Build:** Run `npm run build` in `med-vue/`
- [ ] **9.3 Smoke Test:** Restart server and browse `http://localhost:3000`
- [ ] **9.4 Verify:** All CATs load, sidebar works, quiz runs, PDF search works
- [ ] **9.5 Commit:** `git add public/ && git commit -m "feat(vue): go-live replacing vanilla JS"`
- **Commit:** `feat(vue): go-live`

---

## Current Blockers

_None._

## Notes

- Build output goes to `../public` so Express serves it without path changes.
- Dev proxy: `/api` → `http://localhost:3000`.
- Old `public/` remains untouched until Stage 9.
