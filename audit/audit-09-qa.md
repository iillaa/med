# Audit 09 — QA & Crash Prevention

## Scope
- Review code and tests for missing validation, crash scenarios, and error handling.

## Findings
- **JSON Parsing Crash**: Malformed JSON payloads threw uncaught SyntaxErrors leaking stack traces.
- **NaN Query Parameters**: Non-numeric CAT IDs caused lock contention on update requests.

## Fixes Applied
- Registered global JSON parsing SyntaxError catcher.
- Added `isNaN` checks on update API routes.
