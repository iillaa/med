# Audit 02 — Missing Systems

## Scope
- List every critical system that should exist but is missing.

## Findings
- **Observability**: No health monitoring endpoints.
- **Audit Logging**: Missing administrative audit logging.
- **Backups**: Missing database backup scheduler.
- **CI/CD**: Missing automated build/test pipelines.

## Fixes Applied
- Created GET `/health` endpoint returning uptime, memory, and database status.
- Added structured JSON audit logger appending events to `audit.log`.
- Implemented automated database snapshots in `backups/` every 12 hours (kept to last 10 snapshots).
- Created GitHub Action pipeline `.github/workflows/ci.yml`.
