Kilo, execute Phase 1 (Frontend Refactor) from RECONSTRUCTION_PLAN.md.

**Rules:**
- Follow the plan strictly. Split `quiz.js` and `workspace.js` into modules.
- After each successful module extraction, commit with a short message (e.g., "feat: split generator").
- Run `npx eslint --fix` on the changed files after each extraction. Fix any errors immediately.
- If you hit a problem you can't fix in 2 attempts, stop and tell me.
- Do not output verbose reasoning or logs. Only confirm each step completion.
- At the end, produce a `PHASE1_AUDIT_REPORT.md` listing: files created, lines removed from originals, and final ESLint status.

**Start now.**