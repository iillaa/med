# Dr. CAT - Refactoring Progress

## ✅ Phase 0: Stabilization (COMPLETE - July 2026)
- [x] Extract inline styles to `utilities.css`
- [x] Remove inline `onclick` handlers
- [x] Deduplicate `isOfflineCat` and `mergeCatsWithLocalState`
- [x] Replace admin `alert()` with `showToast()` (3 remaining fixed)
- [x] Fix `failedQuestions` state bug in quiz
- [x] Fix memory leak in diagnostics
- [x] Add ESLint/Prettier configs

## ⏳ Phase 1: Frontend Refactor (pending)
- [ ] Split `quiz.js` → `quiz/leitner.js` 
- [ ] Split `quiz.js` → `quiz/generator.js` 
- [ ] Split `quiz.js` → `quiz/ui.js`
- [ ] Split `workspace.js` → `workspace/summary.js`
- [ ] Split `workspace.js` → `workspace/prescription.js`
- [ ] Split `workspace.js` → `workspace/pdfs.js`

## ⏳ Phase 2: Backend Refactor (PENDING)
- [ ] Split `server.js` into routes/middleware/services

## ⏳ Phase 3: Vue 3 Migration (PENDING)
- [ ] Create Vite + Vue 3 + Pinia + TypeScript project
- [ ] Port `state.js` → Pinia store
- [ ] Port `api.js` → composables
- [ ] Port components → `.vue` files
- [ ] Capacitor integration