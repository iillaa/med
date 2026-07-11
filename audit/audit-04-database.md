# Audit 04 — Database

## Scope
- Review migrations, schema, queries, locking, and data integrity.

## Findings
- **Scale Bottleneck**: PDF page-by-page searches scanned files sequentially, blocking Node's single-threaded event loop.

## Fixes Applied
- Added a query cache Map in `/api/search-pdfs` to resolve repetitive queries instantly.
