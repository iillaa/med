# 📝 TODO Audit Fixes — Local & Existing Setup
> **App Version:** 1.5.0  
> **Date:** 2026-08-01  
> **Context:** Actionable fixes for the current local Termux / Android setup.

---

## 🟢 Intentionally Retained / By Design (Do Not Change)

- **Localhost-Only Admin Auth (`POST /api/login`)**:
  - *Status:* **BY DESIGN**. Restricting admin login strictly to `isLocalhostConnection` is an intentional security design choice for the Termux setup to prevent remote administration brute-force over public tunnels.

---

## 🛠️ Actionable Code Fixes for Local Setup

- [ ] **1. Prevent Event-Loop Freezes in AI Generator** (`server/routes/cat-generator.js`)
  - Replace blocking `fs.writeFileSync` (line 94) and `fs.readFileSync` (lines 33, 37) with async `fs.promises` methods so background AI processing doesn't freeze API requests.

- [ ] **2. Sanitize AI Generator Prompt Titles** (`server/routes/cat-generator.js`)
  - Strip backticks and prompt override keywords from `title` before sending to Gemini Flash LLM to prevent prompt injection.

- [ ] **3. Validate `catId` Integer in Suggestions** (`server/routes/suggestions.js`)
  - Add explicit `if (catId && isNaN(parseInt(catId))) return res.status(400)` check to prevent `NaN` values from corrupting suggestion approvals.

- [ ] **4. Clean Up Device Tracking Memory Leak** (`server/services/active-devices.js`)
  - Add a periodic prune in `setInterval` to remove device IDs inactive for over 90 days from `deviceMap`.

- [ ] **5. Cap CAT Edit History Length** (`server/routes/cats.js`)
  - Add `if (cat.history.length > 50) cat.history = cat.history.slice(-50)` to prevent single CAT objects from growing unbounded over time.

- [ ] **6. Add Log File Size Management** (`server.log`)
  - Add simple truncation logic or PM2 log rotation to keep `server.log` under 10 MB on mobile storage.

---

## 🚀 Execution Note for Next Session
Run these 6 quick fixes in order; all of them are low-risk and will take ~30-45 minutes total.
