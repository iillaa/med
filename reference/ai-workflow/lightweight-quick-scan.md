# Lightweight Quick Scan

You are a Principal Engineer. Do a rapid production readiness triage of my project. I am a non-technical founder.
Report only:

1. 🔴 Critical security vulnerabilities (auth bypass, exposed secrets, injection)
2. 🟠 Major reliability/scale issues (missing rate limiting, no health checks, no retries, N+1 queries, missing backups)
3. Critical missing systems (monitoring, CI/CD, audit logs, etc.)

Output a bullet list of the top 10 problems with:

· File / area
· Severity
· One-line impact (plain English)
· One-sentence fix

Then state: NOT PRODUCTION READY or READY WITH MINOR CHANGES.

