# Audit Vibe-Code Workflow

This guide is for **vibe coders** – non-technical directors who let AI write and fix everything.  
It turns the "ELITE PRODUCTION READINESS AUDIT" into a few copy-paste steps.

---

## The Prompts

### Lightweight Quick Scan (always start here)

```text
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
```

---

### Full Sub‑Prompts (use after Lightweight if needed)

#### 1. Security (OWASP + Secrets)

```text
You are a Security Engineer. Audit the provided code for:
Authentication flows, JWT, cookies, CSRF, XSS, SQL/NoSQL injection, command injection, SSRF, open redirects, file upload, sensitive data exposure, secrets management, password storage, account takeover, privilege escalation, broken access control, API abuse, rate limiting, DDoS, multi‑tenant isolation.
For each issue: file, severity (🔴/🟠/🟡), attack scenario, business impact, fix, code example.
Do not praise good code.
```

#### 2. Missing Critical Systems

```text
List every critical system that SHOULD exist but is MISSING: monitoring, alerting, logging, audit logs, backups, disaster recovery, rate limiting, CI/CD, test coverage, observability, feature flags, rollback, health checks, queue monitoring, usage analytics, security headers, secrets management.
For each: business risk and priority fix. Sort by priority.
```

#### 3. Infrastructure / DevOps

```text
Audit Dockerfiles, docker-compose, k8s, nginx, CI/CD, env config. Check: TLS, security headers, secrets in images, resource limits, health/readiness probes, graceful shutdown, backup strategy, disaster recovery, logging, monitoring, build caching, rollback ability. Output: file, severity, problem, fix.
```

#### 4. Database

```text
Review migrations, schema, queries. Find: missing indexes, over-indexing, missing FKs, constraints, cascades, N+1, transaction boundaries, locking, deadlocks, data integrity, rollback safety. Estimate performance at 1K, 10K, 100K, 1M users. Output: file/table, severity, problem, evidence, fix.
```

#### 5. Backend Architecture & Reliability

```text
Review backend code for: API design, versioning, concurrency, race conditions, retry, idempotency, timeouts, error handling, background jobs/queues, cache invalidation, memory leaks, single points of failure, scalability. Output: file, severity, impact, fix.
```

#### 6. Frontend

```text
Review components, state, data fetching. Find: XSS, hydration mismatches, unnecessary rerenders, memory leaks, broken loading/empty/error states, accessibility gaps, missing form validation, bundle size, missing code splitting/lazy loading. Output: file, severity, problem, fix.
```

#### 7. UI/UX Design & Usability (bonus)

```text
You are a Senior Product Designer. Review UI for visual hierarchy, layout, typography, contrast (WCAG), touch targets, affordances, loading skeletons, empty/error states, form usability, navigation, mobile responsiveness, keyboard focus, screen reader compatibility, motion. Output: component, severity, problem, fix.
```

#### 8. AI / LLM Safety (if applicable)

```text
Audit AI code for prompt injection, jailbreaking, context leakage, RAG vulnerabilities, vector DB security, cost amplification, token abuse, data leakage, model abuse, hallucination risks. Estimate cost/abuse/scaling risks. Output: file, severity, attack scenario, impact, fix.
```

#### 9. QA & Edge‑Case Testing

```text
Review code and tests for: missing input validation, null handling, edge cases (empty, negative, oversized), crash scenarios, TODO/FIXME, dead code, API contract mismatches, incomplete error handling, missing retries/timeouts. Output: file, severity, reproduction steps, fix.
```

---

## Workflow (Step by Step)

### Step 1: Run the Lightweight Prompt
- Open your AI coding tool (Cursor, Windsurf, ChatGPT with project) and paste the Lightweight prompt.
- The AI will return the top 10 issues.
- If it says “READY WITH MINOR CHANGES”, you can fix those and skip deeper audits unless you want extra confidence.

### Step 2: Fix Critical Issues Immediately
Tell the AI:

```text
Now apply the fixes for all critical issues. Use minimal, safe code changes. Show me each diff before applying.
```

- Approve each change.
- Test if needed.

### Step 3: Fill Missing Systems
Run the **Missing Critical Systems** sub‑prompt.
Then:

```text
Implement the top 3 missing systems. For example, a simple health endpoint, a backup script, and a rate limiter middleware. Keep them minimal.
```

### Step 4: (Optional) Deep Dive
If the project handles payments, user data, or scales fast, run the Security sub‑prompt and the Database sub‑prompt. Same process: get findings → tell AI to fix.

### Step 5: Save the Audit Report
After each run, tell the AI:

```text
Save the complete findings as audit-report-YYYY-MM-DD.md in the project root. Use the following format:

· [Severity] File/Area – Problem (one line)
· Fix applied: yes/no
```

Now you have a dated record.

### Step 6: Generate a No‑Code Launch Checklist

```text
Based on this audit, generate a launch checklist for a non‑technical person. Give me simple instructions like:

· Go to /health and confirm it says "ok"
· Try to access /admin without logging in (should be blocked)
· Check that all .env files are in .gitignore
  I'll manually verify each one.

Do the checks, and if all pass, launch with confidence.
```

---

## Quick Reference Card

| Situation | What to paste |
|---|---|
| I’m about to launch, short on time | Lightweight Quick Scan |
| I store secrets in .env / hardcoded? | Security sub‑prompt |
| My server crashes under load? | Backend + Database |
| My app feels slow or ugly? | Frontend + UI/UX |
| I have no idea if I’m backed up | Missing Systems + Infra |
| I use AI features (ChatGPT API, etc.) | AI/LLM Safety |
| I want a full bill of health | All sub‑prompts, one by one |

---

## Pro Tips
- Always run audits in a **fresh AI session** with the project files attached.
- Ask for “plain English impact” whenever you don’t understand a technical term.
- After fixes, run the lightweight prompt again to confirm nothing broke.
- Keep a `project-spec.md` that describes your app’s purpose, tech stack, and key features – feed it to the AI at the start of every session.

