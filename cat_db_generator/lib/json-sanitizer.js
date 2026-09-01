/**
 * Robust JSON Sanitizer & Markdown Stripper for LLM Responses
 * Handles markdown fenced code blocks, unescaped quotes, trailing commas,
 * control characters, and provides deterministic fallback parsing.
 */

function safeParseLLMJson(text) {
  if (!text || typeof text !== 'string') throw new Error('Empty LLM response');

  let cleaned = text
    .replace(/```json/gi, '')
    .replace(/```/g, '')
    .trim();

  const firstBrace = cleaned.indexOf('{');
  const lastBrace = cleaned.lastIndexOf('}');
  if (firstBrace !== -1 && lastBrace !== -1 && lastBrace > firstBrace) {
    cleaned = cleaned.substring(firstBrace, lastBrace + 1);
  }

  // 1. Direct parse attempt
  try {
    return JSON.parse(cleaned);
  } catch (err1) {
    // 2. Remove trailing commas & non-whitespace control characters
    try {
      const sanitized = cleaned
        .replace(/[\x00-\x08\x0B\x0C\x0E-\x1F]/g, '')
        .replace(/,\s*([\}\]])/g, '$1');
      return JSON.parse(sanitized);
    } catch (err2) {
      // 3. String-literal repair (newlines/tabs inside strings) + trailing comma strip
      try {
        const stringRepaired = cleaned
          .replace(/"(?:[^"\\]|\\.)*"/gs, (match) => {
            return match.replace(/\n/g, '\\n').replace(/\r/g, '\\r').replace(/\t/g, '\\t');
          })
          .replace(/,\s*([\}\]])/g, '$1');
        return JSON.parse(stringRepaired);
      } catch (err3) {
        // 4. Deterministic schema key regex extraction fallback
        const res = {};
        const catMatch = cleaned.match(/"category"\s*:\s*"([^"]+)"/i);
        if (catMatch) res.category = catMatch[1];

        const titleMatch = cleaned.match(/"title"\s*:\s*"([^"]+)"/i);
        if (titleMatch) res.title = titleMatch[1];

        const labelMatch = cleaned.match(/"label"\s*:\s*"([^"]+)"/i);
        if (labelMatch) res.label = labelMatch[1];

        const kwMatch = cleaned.match(/"search_keywords"\s*:\s*\[([\s\S]*?)\]/i);
        if (kwMatch) {
          try { res.search_keywords = JSON.parse(`[${kwMatch[1]}]`); } catch (_) {}
        }

        const summaryMatch = cleaned.match(/"summary"\s*:\s*"([\s\S]*?)"\s*,\s*"(?:red_flags|ordonnance)"/i);
        if (summaryMatch) {
          res.summary = summaryMatch[1].replace(/\\n/g, '\n').replace(/\\"/g, '"');
        }

        const rfMatch = cleaned.match(/"red_flags"\s*:\s*"([\s\S]*?)"\s*,\s*"ordonnance"/i);
        if (rfMatch) {
          res.red_flags = rfMatch[1].replace(/\\n/g, '\n').replace(/\\"/g, '"');
        }

        const ordMatch = cleaned.match(/"ordonnance"\s*:\s*"([\s\S]*?)"\s*(?:}|\n}|,\s*"sub_cats")/i);
        if (ordMatch) {
          res.ordonnance = ordMatch[1].replace(/\\n/g, '\n').replace(/\\"/g, '"');
        }

        const subCatsMatch = cleaned.match(/"sub_cats"\s*:\s*(\[[\s\S]*?\])\s*(?:}|$)/i);
        if (subCatsMatch) {
          try { res.sub_cats = JSON.parse(subCatsMatch[1]); } catch (_) {}
        }

        if ((res.title || res.label) && res.summary) return res;
        throw err1;
      }
    }
  }
}

module.exports = {
  safeParseLLMJson
};
