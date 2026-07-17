# Vibe-Code Workflow

You’re the director, AI is your engineering team. This guide contains battle‑tested prompts and patterns to build, fix, and ship software without writing code yourself.

---

## The Golden Rules
1. **Provide context** – a `project-spec.md` describing your app, stack, and user flow.
2. **Start small, iterate** – never ask for a whole Facebook clone in one prompt.
3. **Let AI ask questions** – end prompts with “Ask me any clarifying questions before coding.”
4. **Use the feedback loop** – run the app, copy errors, paste them back.
5. **Keep a `CHANGELOG.md`** – every session, note what changed so AI can stay on track.

---

## Prompt Library

### 1. Project Kickoff

```text
I want to build [describe app in 2-3 sentences].
Tech stack: [e.g., Next.js + Supabase + Tailwind].
Core features:

· Feature 1
· Feature 2
· ...

First, help me design the database schema and API routes.
Then scaffold the project with the minimum code to get running.
Ask questions before you start.
```

### 2. Feature Request (Detailed)

```text
I need to add [feature name].
User story: As a [user type], I want [action] so that [benefit].
Acceptance criteria:

· When I click X, Y happens
· If I'm not logged in, it shows login screen
· ...

Current relevant files: [list files or just describe where it should live]
Now implement this step by step. Show each file change. Ask questions if unclear.
```

### 3. Bug Fix

```text
I found this bug: [describe what went wrong].
Steps to reproduce:

1. Go to ...
2. Click ...
3. See error/ unexpected behaviour.

Error message (if any): [paste log or screenshot description]
Files that might be involved: [list]
Diagnose the issue and propose a fix. Keep the change minimal.
```

### 4. Code Improvement / Refactor

```text
The code in [file] works but is [slow / messy / hard to read].
Please refactor it for [performance / readability / maintainability].
Important: do not change the external behaviour.
Explain your changes in plain English first, then show the new code.
```

### 5. Quick Code Review (non‑audit, for ongoing dev)

```text
Review the following code for obvious bugs, performance issues, and security gaps.
I'm a non‑technical founder, so flag anything that could break in production.
Code:
[paste snippet]
Output: bullet list of problems and one‑sentence fixes.
```

### 6. Generate Tests

```text
Write unit/integration tests for [file or feature].
Use [Jest / Pytest / ...].
Cover the main happy path and edge cases.
Explain what each test does in a comment.
```

### 7. Database Schema Design

```text
Based on this feature description: [paste feature request]
Design the necessary database tables.
For each table show: columns, types, indexes, foreign keys.
Explain the relationships in plain English.
Generate the SQL migration.
```

### 8. API Endpoint Design

```text
Design a REST API for [resource].
Endpoints needed: CRUD operations.
For each endpoint: method, URL, request body example, response example, authentication required?
Explain error handling (what if the resource is not found, etc.).
Then generate the code for the route handler in [Node.js/Python/...].
```

### 9. UI Component Creation

```text
I need a [component name] that looks like [describe visually or reference].
Props it should accept: [...]
States: loading, empty, error, success.
Use [React/Vue/...] with [Tailwind/...].
Accessibility: semantic HTML, keyboard navigation, ARIA labels.
Generate the component code.
```

### 10. Debugging with Error Logs

```text
I got this error:
[paste full stack trace]

Here's the code around the error:
[paste snippet or file path]

Find the root cause and provide a fix.
Explain it to me like I'm five.
```

### 11. Updating Dependencies / Security Patches

```text
Check my package.json / requirements.txt for outdated or vulnerable dependencies.
Suggest safe updates. Then generate the commands to run and any code changes needed.
```

### 12. Preparing for Production (soft check)

```text
I'm getting ready to deploy. List 5 common things I might have forgotten:

· Environment variables
· HTTPS
· Proper CORS
· Database backups
· etc.
  Then check my project and tell me which are missing.
```

---

## How to Keep the AI on Track

- **Use a “project overview” file** – At the start of each long session, paste:

```text
This is our project overview:
[paste project-spec.md]
We are currently working on: [feature/task]
Previous changes: [paste CHANGELOG.md last few entries]
```

- **Pin important files** – In Cursor/Windsurf, add your spec, .env.example, and main config files to context.
- **Embrace the “ask questions” prompt** – It prevents the AI from guessing and doing 10x more work than needed.

---

## Sample Full Session (Feature Addition)

1. **You:** Feature request prompt (with user story).
2. **AI:** Asks about authentication, edge cases, etc.
3. **You:** Answer briefly.
4. **AI:** Proposes a plan (files to create/modify).
5. **You:** “Proceed with the plan, but show me each file before applying.”
6. **AI:** Generates code, you approve.
7. **You:** Run the app, find a bug.
8. **You:** Bug fix prompt with error.
9. **AI:** Fixes it.
10. **You:** “Good. Update CHANGELOG.md with today’s changes.”

---

## The Minimal Toolkit

You don’t need terminals or heavy tools. Just:
- AI coding environment (Cursor, Windsurf, Replit, ChatGPT with Code Interpreter)
- A place to keep `project-spec.md`, `CHANGELOG.md`, and `audit-report-*.md`
- The audit workflow guide (`audit-vibe-code-workflow.md`) for launch checks

---

## Cheat Sheet: When to Use Which Prompt

| I want to... | Prompt to use |
|---|---|
| Start from scratch | Project Kickoff |
| Add a login system | Feature Request + Auth-specific details |
| Make an existing page mobile-friendly | UI Component Creation / Feature Request |
| Fix a weird crash | Bug Fix |
| Clean up messy code | Code Improvement / Refactor |
| Get confidence my code isn’t junk | Quick Code Review |
| Add tests because I’m scared | Generate Tests |
| Launch tomorrow | Audit Lightweight (from audit guide) |
| Understand what the AI just did | “Explain this code to me in simple English” |
```

