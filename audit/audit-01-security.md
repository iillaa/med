# Audit 01 — Security

## Scope
- Identify application and infrastructure security gaps.
- Prioritize findings by exploitability and impact.

## Checklist
- AuthN/AuthZ: verify role-based access controls, least privilege.
- Secrets: ensure no secrets in repo/client bundles.
- Transport: enforce HTTPS/TLS, secure cookies.
- Input handling: validate/sanitize all external inputs.
- Session management: cookie flags, rotation, expiration.
- Error handling: avoid leaking stack traces and internals.
- Dependency hygiene: audit for vulnerable packages.

## Evidence to collect
- Server middleware/security headers config
- Auth endpoints + policy enforcement locations
- Dependency list + versions

## Findings
- (fill during audit)

## Recommendations
- (fill during audit)

