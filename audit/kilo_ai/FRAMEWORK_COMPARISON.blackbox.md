# Framework Comparison — Dr. CAT (blackbox verification copy)

**Date:** 2026-07-15  
**Auditor/Reviewer:** BLACKBOXAI  

---

## Sweet-spot verification scope
This is largely a qualitative framework recommendation document. In this pass, I:
- **Do not** attempt to re-run framework performance benchmarks.
- **Do** check for any claims that are clearly repo-specific or code-specific (e.g., references to “quick-fixes” impact).

---

## What was verified
1) Repo-specific coupling to “quick fixes”  
- The document includes a “Stay vanilla + Alpine.js” stabilization path that matches the project reality: the codebase is heavily vanilla JS with manual DOM manipulation (confirmed earlier by `public/js/main.js` orchestration and large component files).

2) Migration-effort reasoning is plausible  
- Effort ranges (2–3 weeks vs 6–12 weeks) are consistent with typical migration complexity:
  - SvelteKit requires broader rewrite
  - Vue is a smaller conceptual shift
  - Alpine is smaller incremental change

---

## What was NOT verified (because it’s not objectively computable from repo inspection alone)
- Exact bundle sizes (e.g., “~45KB / ~55KB / ~60KB”)
- Capacitor “official docs quality” scoring
- Any numeric decision-matrix weights (they contain placeholders `?`)
- Performance “time to interactive” comparisons

These are best treated as guidance, not validated measurements.

---

## Conclusion
This framework comparison document is **directionally consistent** with the repo’s current architecture and your stated deployment constraints (Android/Capacitor). No clear contradictions were found in this verification pass, but numeric performance/bundle claims are **not revalidated**.
