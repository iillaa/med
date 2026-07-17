# Audit 01 — Security

## Scope
- Identify application and infrastructure security gaps.
- Prioritize findings by exploitability and impact.

## Findings
- **Plaintext Password Storage**: Plaintext passwords stored in local `admin_password.txt` file.
- **Session Token Memory Leak**: In-memory tokens accumulated without garbage collection.

## Fixes Applied
- Upgraded to PBKDF2 key derivation hashing with local salts (`salt:hash` format) and timing-safe binary comparisons.
- Added an hourly cron interval to prune expired session tokens.
