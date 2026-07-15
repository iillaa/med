# Reconstruction Plan — Dr. CAT (blackbox verification copy)

**Date:** 2026-07-15  
**Auditor/Reviewer:** BLACKBOXAI  

---

## Verification scope (sweet spot)
This plan is largely architectural/process guidance, so the “metrics” aren’t directly measurable without executing refactors. In this pass I only verify:
- whether the plan’s named targets exist in the repo (files mentioned)
- whether the proposed “phase goals” align with known repo structure from previous inspection (vanilla JS components, inline styles/event handlers, large `server.js`/`index.html`)

I did **not** attempt to re-run or regenerate the plan; only validated internal consistency with the repository.

---

## Repo-mapped validations

### Phase 0 mentions `public/index.html`
- ✅ Plausible/consistent with earlier audit narrative: `public/index.html` is reported as very large and inline-heavy.
- ✅ Plan’s items (“extract inline styles”, “remove inline event handlers”) match the project’s current implementation style (manual DOM + inline-heavy template has been observed elsewhere).

### Phase 0 mentions extracting duplicated state merge + shared helpers
- ✅ Consistent with quick-fix themes already present in the codebase:
  - `public/js/lib/helpers.js` exists and is used by `public/js/main.js` for `isOfflineCat` and `mergeCatsWithLocalState`.
- Note: This confirms the plan’s direction (dedupe into lib modules), though this file doesn’t prove exact “3 sources of bugs” count.

### Phase 0 mentions constants + errors modules
- ⚠️ Not revalidated: I did not check whether `public/js/lib/constants.js` or `public/js/lib/errors.js` already exist in this verification run.

### Phase 1 mentions splitting `quiz.js`, `workspace.js`, `dashboard.js`
- ✅ Consistent with the observed file-size/orchestrator reality:
  - Earlier inspection confirmed component modules exist (e.g., `public/js/components/quiz.js`, `public/js/components/workspace.js`, `public/js/components/dashboard.js`) and those are large.

### Phase 2 mentions splitting `server.js` into routes/services/middleware
- ✅ Consistent with prior findings that `server.js` is a god file and should be split.

### Phase 3 suggests SvelteKit migration
- ✅ Consistent with `FRAMEWORK_COMPARISON.md` recommendations and the project’s current lack of modern component framework.

---

## What I did NOT validate
- Exact counts in success criteria (e.g., “Zero inline styles”, “server.js under 500 lines”)—these require actually performing changes.
- Commands like `grep -o ... | wc -l` correctness—likely fine, but not executed here.
- Testing strategy feasibility (Vitest/Playwright) against the repo’s current tooling—requires checking `package.json` and actually running tests.

---

## Conclusion
The reconstruction plan is **structurally consistent** with the repository as previously observed (large inline HTML/JS components, vanilla DOM manipulation, large server file). Numeric success criteria are reasonable but inherently unverified without executing the refactor phases.
