# Audit

A simple, human-first checklist for running the **ELITE PRODUCTION READINESS AUDIT** using the workflows in this folder.

## 0) Prepare context (once)
Create/keep these files up to date:
- `project-spec.md` (app description, stack, what “done” means)
- `CHANGELOG.md` (what changed since the last audit)

## 1) Run the audit (always)
Use `audit-vibe-code-workflow.md` and start with:
- **Lightweight Quick Scan**

## 2) Fix in order
1. Fix 🔴 Critical issues first (minimal changes, show diffs)
2. Then address 🟠 Major reliability/scale issues
3. Then implement top missing systems (monitoring/logging/health/backups)

## 3) Save an audit report
Save output as:
- `audit-report-YYYY-MM-DD.md`

## 4) After fixes: re-run
Re-run the **Lightweight Quick Scan** and confirm it no longer says “NOT PRODUCTION READY”.

## 5) Launch checklist (no-code)
Generate a checklist for a non-technical person and complete it before deploying.

