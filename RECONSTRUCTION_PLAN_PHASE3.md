# Reconstruction Plan — Phase 3: Vue 3 Migration (Multi‑Stage)

**Goal:** Migrate Dr. CAT frontend to Vue 3 + Pinia + TypeScript.
**Strategy:** Parallel project in `med-vue/`. Old `public/` remains untouched until Stage 9.
**Success Criteria:** Vue app loads real CATs, shows sidebar, stats, quiz, and works on Capacitor.

---

## Stage 0: Project Scaffold
- [ ] Create `med-vue/` at project root.
- [ ] Run `npm create vue@latest` (Vue 3, TS, Pinia, Vue Router, ESLint, Prettier).
- [ ] Set `"type": "module"` in `med-vue/package.json`.
- [ ] Create `med-vue/vite.config.ts` with:
  - `build.outDir: '../public'` (so Express serves it).
  - `server.proxy: { '/api': 'http://localhost:3000' }` (dev proxy).
  - `publicDir: path.resolve(__dirname, '../static')` (copies PDFs/data to build).
  - Alias `'@': path.resolve(__dirname, './src')`.
- [ ] Copy `ARCHITECTURE.md` (the one we defined earlier) to `med-vue/`.

**Commit:** `feat(vue): scaffold project with Vite, Vue 3, TS, Pinia, Router`

---

## Stage 1: Data Layer (Engine)
- [ ] **1.1 API Client:** `med-vue/src/api/client.ts`.
  - Port `api.js` logic. Use relative `/api/` paths (proxy handles dev).
  - Detect Capacitor/offline mode via `window.Capacitor`.
  - Fallback to `fetch('/data/cats_db.json')` for offline.
- [ ] **1.2 Types:** `med-vue/src/types/cat.ts`, `quiz.ts`.
  - Define `Cat`, `Status`, `LocalProgress`, `QuizQuestion`.
- [ ] **1.3 Pinia Stores:**
  - `stores/cats.ts`: `initialize()`, `fetchAllCats()`, `updateStatus()`, getters: `stats`, `filtered`.
  - `stores/app.ts`: `loading`, `isOffline`, `theme`, `initializeApp()`.
  - `stores/quiz.ts`: `session`, `score`, `leitnerData`, `startQuiz()`, `submitAnswer()`.
- [ ] **1.4 Utils:** `med-vue/src/utils/storage.ts` (localStorage helpers).
- [ ] **1.5 Run `npx vue-tsc --noEmit`** to verify types.

**Commit:** `feat(vue): data layer (api, stores, types, utils)`

---

## Stage 2: Boot Sequence
- [ ] **2.1 Entry:** `med-vue/src/main.ts` – create Pinia, mount App.
- [ ] **2.2 Root App:** `med-vue/src/App.vue` – show `<AppLoadingOverlay />` while `appStore.loading`, else `<RouterView />`.
- [ ] **2.3 Overlay:** `med-vue/src/components/Common/AppLoadingOverlay.vue` – port CSS from old `index.html`.
- [ ] **2.4 Router Guard:** `med-vue/src/router/index.ts` – add `beforeEach` to await `catsStore.initialize()`.
- [ ] **2.5 Test:** Run `npm run dev` and confirm the overlay disappears and data loads (check console).

**Commit:** `feat(vue): boot sequence and loading overlay`

---

## Stage 3: Sidebar & Navigation
- [ ] **3.1 Router Views:** Define routes: `/` (Dashboard), `/cats`, `/quiz`, `/workspace/:id`, `/pdfs`, `/admin`.
- [ ] **3.2 Sidebar Component:** `med-vue/src/components/Sidebar/Sidebar.vue`.
  - Import `catsStore`.
  - Render `store.filtered` (search input binds to `store.searchQuery`).
  - Click navigates to `/workspace/:id`.
  - Category filter dropdown.
- [ ] **3.3 Layout:** Move Sidebar to `App.vue` layout (outside `<RouterView>`).

**Commit:** `feat(vue): sidebar and navigation`

---

## Stage 4: Dashboard & Cats Views
- [ ] **4.1 Dashboard:** `med-vue/src/views/Dashboard.vue`.
  - Use `catsStore.stats` for mastery %, counters.
  - Render "Resume" list (cats with status 'doing'/'done').
  - Render "Progress by Specialty" using `store.cats`.
- [ ] **4.2 Cats View:** `med-vue/src/views/Cats.vue` – full list with search/filter (reuse sidebar logic).
- [ ] **4.3 Status Updates:** Clicking status in Dashboard/Cats updates `catsStore.updateStatus()`.

**Commit:** `feat(vue): dashboard and cats views`

---

## Stage 5: Workspace (CAT Details)
- [ ] **5.1 Workspace View:** `med-vue/src/views/Workspace.vue`.
  - Read `catId` from route params.
  - Find cat in `catsStore.cats`.
  - Display: category, title, red_flags, summary (rendered markdown), ordonnance.
- [ ] **5.2 Notes:** Bind textarea to `cat.notes`. Save via `catsStore.updateNotes()`.
- [ ] **5.3 Status Buttons:** Wire to `catsStore.updateStatus()`.

**Commit:** `feat(vue): workspace view`

---

## Stage 6: Quiz Engine
- [ ] **6.1 Generator:** `med-vue/src/composables/useQuizGenerator.ts` – port `generateClinicalVignette`, `cleanTextOfClues`, `shuffleArray`.
- [ ] **6.2 Quiz View:** `med-vue/src/views/Quiz.vue`.
  - Setup screen (category, count, question types).
  - Question screen (QCM or Write‑in).
  - Results screen (score, breakdown, retry errors).
- [ ] **6.3 Leitner:** Update `quizStore` on correct/incorrect answers.

**Commit:** `feat(vue): quiz engine`

---

## Stage 7: PDF Search & Admin
- [ ] **7.1 PDF Search:** Add tab to Workspace or separate view.
  - Use `apiClient` to `/api/search-pdfs`.
  - Display results with snippets.
- [ ] **7.2 Admin Panel:** `med-vue/src/views/Admin.vue`.
  - Tabs: Suggestions (approve/reject) and Diagnostics (system info).
  - Only visible if `appStore.isAdmin`.
- [ ] **7.3 Performance:** Port metrics view (FPS, API timings).

**Commit:** `feat(vue): pdf search and admin`

---

## Stage 8: Capacitor Integration
- [ ] **8.1 Install:** `npm install @capacitor/android @capacitor/haptics @capacitor/share`.
- [ ] **8.2 Config:** `med-vue/capacitor.config.json` – point `webDir: '../public'`.
- [ ] **8.3 Plugins:** Add haptic feedback on status changes (use `window.Capacitor` checks).
- [ ] **8.4 Build:** `npm run build` and verify `../public/index.html` is generated.

**Commit:** `feat(vue): capacitor integration`

---

## Stage 9: Go‑Live Swap
- [ ] **9.1 Backup:** Rename old `public/` to `public_vanilla_backup/`.
- [ ] **9.2 Build:** Run `npm run build` in `med-vue/` (outputs to `../public`).
- [ ] **9.3 Smoke Test:** Restart server (`npm start`) and browse `http://localhost:3000`.
- [ ] **9.4 Verify:** All CATs load, sidebar works, quiz runs, PDF search works.
- [ ] **9.5 Commit:** `git add public/ && git commit -m "feat(vue): go-live replacing vanilla JS"`

**Commit:** `feat(vue): go-live`