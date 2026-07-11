# Audit 03 — Infrastructure

## Scope
- Audit configuration, graceful shutdowns, logging, and infrastructure safety.

## Findings
- **Abrupt Terminations**: Node process exited instantly on SIGINT/SIGTERM, risking database file corruption.

## Fixes Applied
- Registered process signal listeners (`SIGINT`/`SIGTERM`) to wait for database locks to resolve and close the server gracefully.
