# 🩺 CAT Generator — True V3 Upgrade Plan
> **Date**: 2026-08-10 | **Branch**: `beta-test-pr` | **Author**: Dr. Kibeche Ali Dia Eddine

---

## ✅ PART 1 — WHAT HAS BEEN DONE (Session Recap)

### 1.1 LLM Engine (`llm-engine.js`) — DONE ✅

| Feature | Detail | Status |
|---|---|---|
| **Dynamic Model Discovery** | Queries `/v1beta/models` live, ranks by version (3.6 > 3.5 > 2.0). 1h TTL cache. Never hardcoded. | ✅ |
| **4-Tier JSON Parser** | Tier 1: Direct parse. Tier 2: Strip control chars. Tier 3: String-literal repair. Tier 4: Key-boundary regex. | ✅ |
| **Extended Thinking Budget** | 4,096 tokens Pro / 2,048 Flash. Excluded from `lite` variants. | ✅ |
| **HTTP 429 Cooldown** | 10s pause + 3 retries per model before fallback. | ✅ |
| **60-second AbortController** | Per-request timeout. Stalled model aborted, engine falls to next. | ✅ |
| **Removed Dead `humanEditCache`** | Legacy variable never used. Removed. | ✅ |
| **`thinkingConfig` Regex Fix** | Was matching `lite` models. Fixed to exclude them. | ✅ |
| **7-Step Master Clinical Prompt** | 0.ABCDE → 1.Eval → 2.RedFlags → 3.Exams → 3bis.Terrain → 4.Management → 5.Orientation+MedicoLegal | ✅ |
| **Anti-Polypharmacy Ledger** | 4-part prescription: 1ère INTENTION / ALTERNATIVES [OU] / SYMPTOMATIQUE / NON MÉDICAMENTEUX | ✅ |
| **Dual RAG Pipeline** | Orchestrates PDF + Web + Active Learning into unified prompt. (Partially effective — see Part 3) | ✅ |
| **Admin vs Clinical Schema Lock** | Administratif category → 3-step admin schema. Clinical → 5-step clinical schema. | ✅ |
| **3-Attempt Validation Loop** | Auto-retries up to 3× if medical validator fails. | ✅ |

---

### 1.2 Medical Validator (`medical-validator.js`) — DONE ✅

| Feature | Detail | Status |
|---|---|---|
| **Dynamic Drug Safety Engine** | Replaced 2 hardcoded checks with JSON-driven rules engine | ✅ |
| **16 Drugs Covered** | Paracétamol, Ibuprofène, Kétoprofène, Aspirine, Amoxicilline, Ciprofloxacine, Métronidazole, Tramadol, Codéine, Morphine, Metformine, Corticoïdes, AVK, BZD, Lopéramide, Métoclopramide | ✅ |
| **Overdose Detection** | mg×freq/j > max dose, gram ceiling, pediatric mg/kg | ✅ |
| **Contraindication Detection** | Pregnancy, renal failure, QTc, alcohol, pediatric age per drug | ✅ |
| **Forbidden Placeholder Check** | Rejects lorem ipsum, "à compléter", "tbd", etc. | ✅ |
| **Flexible Section Header Regex** | Matches both `**1. Évaluation**` and `**1. Diagnostic**` styles | ✅ |

---

### 1.3 Other Completed Work

- **`drug-safety-rules.json`** — Standalone extensible rules file. Add any drug without touching code.
- **`start_med.sh`** — Auto-inits DNS + ngrok via `termux-chroot`. Static domain: `rendition-duchess-dry.ngrok-free.dev`

---

## ⏳ PART 2 — QUICK WINS LEFT

### 2.1 Remove Dead `fetchMSDManuals()` in `web-fetcher.js`
- **Problem**: Lines 250–292 fetch raw MSD HTML. Duplicates `fetchMSDProfessionalJina`. **Never called** in `fetchAndCacheWebSources()`.
- **Fix**: Delete 43 dead lines. Zero risk.

### 2.2 Cache Expiry / Staleness Check in `web-fetcher.js`
- **Problem**: Web cache from months ago reused forever. Medical guidelines change.
- **Fix**: In `getCachedWebSources()`, skip any cache file with `fetchedAt` older than 30 days (configurable constant). Engine re-fetches automatically.

### 2.3 Fix `buildSearchQueries` Scope in `medical-sources.js`
- **Problem**: Generates Google search URLs for all 15 sources but only 3–4 are ever actually fetched. 11 are decorative JSON links.
- **Fix**: Mark sources as `fetchable: true` vs `verification_only: true` so the stored URLs are honest about what we actually do.

---

## 🔬 PART 3 — HONEST ANALYSIS: WHERE RAG FAILS & WHY

### 3.1 Offline PDF RAG — Full Pipeline

```
data/pdf_masters/ (77 PDFs)
    ↓  [npm run reindex → index_pdfs.js]
server/pdf_extractor.js
    SHA-256 hash check per PDF
    Cache hit  → loads data/pdf_cache/<name>.pdf.json instantly
    Cache miss → tries: LlamaParse → Google Gemini → Offline parser
    Saves quality-tagged result to individual cache file
    ↓
pdf_index.json (master: all 77 PDFs merged, quality field DISCARDED here)
    ↓  [at generation time]
cat_db_generator/lib/pdf-extractor.js → searchLocalPDFs()
    Loads pdf_index.json into RAM once
    Tokenizes: "CAT devant la gale" → ["gale"]
    Loops all 77 PDFs, all pages
    Matches if ≥ 2 tokens found on page
    Ranks by matchCount (pages matched per PDF)
    Extracts 400-char snippet per match
    ↓
Fed to LLM as "DUAL RAG CHANNEL 2: PDF INDEX"
```

**Failure 1 — Token Poverty**
Short titles produce 1 meaningful token (e.g. `["gale"]`). A passing footnote mention scores identical to a dedicated CAT page.

**Failure 2 — Quality Signal Discarded**
The `quality` field (`gemini`, `online`, `offline`) exists in `data/pdf_cache/` per PDF but is **thrown away** when merged into `pdf_index.json`. A garbled offline-OCR page scores equal to a clean Gemini-extracted page.

**Failure 3 — Tiny Snippet Context (400 chars)**
400 chars mid-sentence from a medical textbook, without surrounding sections, is usually noise the model cannot use.

**Failure 4 — Contradictions Are Invisible**
Two PDFs with conflicting dosages are sent to the LLM as equal-weight snippets. No contradiction flag. LLM silently picks one — usually pretrained knowledge.

**Failure 5 — RAG Faithfulness (The Critical Problem)**
Gemini is pretrained on HAS, PubMed, WHO, MSD Manuals in French. When it receives noisy/irrelevant PDF snippets, it rationally ignores them and uses pretrained knowledge — silently. The CAT looks correct because Gemini's medical training is genuinely good — not because our PDF RAG helped. We cannot currently verify which was used.

---

### 3.2 Online Web Fetcher — What We Actually Retrieve

| Source | What We Fetch | What We Actually Get | Real Quality |
|---|---|---|---|
| **PubMed PMC** | NCBI `esearch` → `esummary` API | Article title, authors, date — **no abstract, no body** | ⚠️ Metadata only |
| **MSD Jina Reader** | Jina wrapping MSD **search results** URL | HTML of the search listing page — titles + excerpts only | ⚠️ Search page, not article |
| **MedG Consensus** | RSS feed from `medg.fr/search/` | RSS item title + 1-line description only | ⚠️ RSS snippet, not article |
| **Wikipedia FR** | Wikipedia REST API `extracts` | Full intro section of the article | ✅ Best we have |

**Failure 1 — Fetching Search Pages, Not Articles**
MSD and MedG both return listing/search pages. Like reading Google result titles without ever opening the link.

**Failure 2 — PubMed Returns Zero Clinical Text**
`esummary` = metadata only. We need `efetch?rettype=abstract&retmode=text` to get real content. We don't do this.

**Failure 3 — Wikipedia Intro ≤ Gemini's Pretrained Knowledge**
The intro paragraph Wikipedia returns is basic overview text. Gemini already knows everything in it. No new clinical information enters the model.

**Failure 4 — No Cache Expiry**
Old cached content reused indefinitely. Guidelines update; our cache doesn't.

---

## 🚀 PART 4 — WHAT MUST CHANGE FOR TRUE V3

### 4.1 Web RAG — Fetch Actual Article Content

| Fix | How |
|---|---|
| **PubMed** | Switch from `esummary` → `efetch?db=pmc&rettype=abstract&retmode=text` — get real abstract |
| **MSD Manuals** | From search results, extract first article `<a href>`, then Jina-fetch THAT URL — not the search page |
| **Add HAS / ANSM** | Direct fetchers for French official guideline pages |
| **Add Guideline.care** | Already in `REPUTABLE_MEDICAL_SOURCES`, never fetched |

### 4.2 PDF RAG — Smarter Scoring

| Fix | How |
|---|---|
| **Preserve quality in master index** | Keep `quality` field per-document in `pdf_index.json`. Weight `gemini`/`online` pages 3× over `offline` |
| **Token density scoring** | Score pages higher when multiple query tokens appear close together vs. scattered |
| **Expand snippet to 1,200 chars** | Enough to capture a full clinical paragraph with context |
| **Contradiction flag in prompt** | If 2 snippets give different dosages for same drug, tell the LLM explicitly |

### 4.3 RAG Faithfulness Test

To know if the model actually uses our context:
1. Inject deliberate wrong info: `"Traitement gale: Pénicilline 500mg 3×/j"`
2. Generate and check if CAT includes Pénicilline
3. If NO → model ignores our RAG (uses pretrained knowledge)
4. If YES → model faithfully follows injected context (even when wrong)
5. This reveals exactly how much value our RAG adds vs. Gemini's training alone

### 4.4 Gap #4 — V1 Production as Memory (Decision Needed)

- **Current**: `getHumanEditMemory()` only uses `cats_db_v2_generated.json` entries with `_human_edited: true`
- **Gap**: Existing `cats_db.json` (production) content — doctor-validated or user-submitted — is completely ignored by the generator
- **Risk**: User-submitted CAT quality may vary. Using it as a baseline could propagate errors.
- **Benefit**: Preserves Algerian clinical adaptations that Gemini's pretrained knowledge may not have
- **Decision**: Enable only for CATs with verified doctor origin?

---

## 🪟 PART 5 — DEBUG PANEL (NEW FEATURE — P1 Priority)

### Why First?

Before fixing anything in the RAG, we need to **see exactly what is happening**. The debug panel is the diagnostic instrument. Without it, we are fixing blindly.

### Architecture

```
Generation Request
    ↓
debug-emitter.js (Node.js EventEmitter singleton)
    ↑ emits events from:
    ├── llm-engine.js      (prompt sent, model tried, response received, parse tier)
    ├── web-fetcher.js     (source fetched, content length, first 300 chars, fail reason)
    └── pdf-extractor.js   (tokens used, PDFs matched, snippets extracted)
    ↓
SSE Route: GET /api/admin/cat-generator/debug-stream
    ↓
Admin Lab UI — debug panel (live streaming)
```

### Events Catalog

| Event ID | Payload |
|---|---|
| `web_fetch_start` | `{ title, keywords[] }` |
| `web_fetch_result` | `{ source, url, contentLength, preview300chars, isHighDensity }` |
| `web_fetch_fail` | `{ source, error }` |
| `pdf_search_start` | `{ queryTokens[] }` |
| `pdf_search_result` | `{ pdfFile, page, matchedTokens[], snippetPreview, quality }` |
| `pdf_search_empty` | `{ reason }` |
| `active_learning` | `{ found: bool, source: 'v2_human_edited' \| 'none', title? }` |
| `llm_prompt_built` | `{ systemPromptChars, userPromptChars, estimatedTokens }` |
| `llm_model_try` | `{ model, attempt }` |
| `llm_model_fail` | `{ model, httpStatus, error }` |
| `llm_response_raw` | `{ preview500chars, totalChars }` |
| `llm_parse_tier` | `{ tier: 1\|2\|3\|4, success: bool }` |
| `validation_result` | `{ valid: bool, errors[], warnings[] }` |
| `generation_done` | `{ totalMs, model, tokens, validationStatus }` |

### UI Wireframe

```
┌──────────────────────────────────────────────────────────────┐
│  🔍 RAG & LLM Debug Panel   [📋 Copy Logs] [🗑 Clear] [⏸]  │
├──────────────────────────────────────────────────────────────┤
│  🌐 WEB RAG                                                  │
│  ├─ ✅ PubMed abstract → "scabies treatment" → 1,247 chars   │
│  ├─ ⚠️  MSD Jina → search page returned (not article)        │
│  └─ ✅ Wikipedia "Gale (maladie)" → 2,103 chars             │
│                                                              │
│  📚 PDF RAG (tokens: ["gale"])                               │
│  ├─ ✅ CAT Dr_Abouimed_.pdf p.12 [gale,sarcoptes] → 380c    │
│  ├─ ✅ 150 Ordonnances types.pdf p.47 [gale] → 200c         │
│  └─ ❌ 0 matches in remaining 75 PDFs                        │
│                                                              │
│  🧠 ACTIVE LEARNING                                          │
│  └─ ❌ No human-edited memory found for this title           │
│                                                              │
│  🤖 LLM CALL                                                 │
│  ├─ gemini-3.6-flash | Attempt 1/3                           │
│  ├─ Prompt: ~4,540 tok (sys: 3,200 + usr: 1,340)            │
│  ├─ Response: 2,961 tok | 49,727ms                          │
│  └─ Parser: Tier 1 ✅ Direct JSON.parse succeeded            │
│                                                              │
│  ✅ VALIDATION PASSED — 0 errors, 1 warning                  │
└──────────────────────────────────────────────────────────────┘
```

### Implementation Steps (in order)

1. **`debug-emitter.js`** — singleton EventEmitter, `emit(eventId, payload)`, stores full log in memory
2. **Instrument `web-fetcher.js`** — emit on fetch start, result, fail
3. **Instrument `pdf-extractor.js`** — emit on search start, each match, empty result
4. **Instrument `llm-engine.js`** — emit on prompt built, model try, response, parse tier, done
5. **SSE route** in `server/routes/cat-generator.js`: `GET /api/admin/cat-generator/debug-stream`
6. **UI panel** in `admin/cat_generator_lab.html` — collapsible debug section, live stream, copy button

---

## 📋 PART 6 — PRIORITY ORDER

| # | Task | Effort | Impact |
|---|---|---|---|
| 🔴 **P1** | **Debug panel** — SSE listener + UI | Medium | CRITICAL — see what's actually happening |
| 🟠 **P2** | PubMed: switch to `efetch` abstract | Low | High — first real web clinical content |
| 🟠 **P2** | MSD: search → extract article URL → fetch article | Medium | High — real article not search page |
| 🟡 **P3** | PDF: preserve quality + token density scoring | Medium | Medium — better match quality |
| 🟡 **P3** | Web cache 30-day expiry | Low | Medium — keeps content current |
| 🟢 **P4** | Remove dead `fetchMSDManuals` | Low | Low — cleanup |
| 🟢 **P4** | Fix `buildSearchQueries` scope | Low | Low — cleanup |
| ⚪ **P5** | V1 production as LLM memory (Gap #4) | Low | Debated — quality risk |
| ⚪ **P5** | RAG faithfulness test suite | Medium | Strategic validation |

---

> **Honest Summary**: The current system is well-architected V2 with solid schema rules and clinical formatting. The LLM produces high-quality CATs primarily from its own pretrained medical knowledge, shaped by our schema rules. The RAG channels run but deliver low-signal data. True V3 needs: the debug panel first (to see reality), then real article content from web fetchers, then smarter PDF scoring. The drug safety engine and schema locks are already V3-grade.
