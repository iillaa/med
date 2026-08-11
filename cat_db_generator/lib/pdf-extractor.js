/**
 * V3 Deep Clinical PDF Index Query Engine
 * Purely algorithmic, generic search across all indexed medical reference PDFs.
 * Enforces:
 *   1. Strict French Word-Boundary regex matching (\b).
 *   2. Compound Multi-Word & Full-Phrase Proximity Scoring.
 *   3. Clinical Section-Anchor Deep Extraction (Traitement, Posologie, Gravité).
 *   4. Dedicated Single-Topic Full-Document Prioritization.
 *   5. Table of Contents / Sommaire Demotion (Zero Noise).
 * DOES NOT parse raw binary PDFs at runtime (queries ready pre-extracted index).
 */

const fs = require('fs');
const path = require('path');
const debugEmitter = require('./debug-emitter');

const PDF_INDEX_PATH = path.join(__dirname, '..', '..', 'pdf_index.json');
let cachedPdfIndex = null;

/**
 * Loads and caches the ready pre-extracted PDF index in memory
 */
function getPdfIndex() {
  if (cachedPdfIndex) return cachedPdfIndex;
  if (fs.existsSync(PDF_INDEX_PATH)) {
    try {
      const raw = fs.readFileSync(PDF_INDEX_PATH, 'utf8');
      cachedPdfIndex = JSON.parse(raw);
      console.log(`📑 Loaded pre-built PDF Index (${cachedPdfIndex.length} indexed documents ready).`);
      return cachedPdfIndex;
    } catch (e) {
      console.warn(`⚠️ Failed to parse pdf_index.json: ${e.message}`);
    }
  } else {
    console.warn(`⚠️ pdf_index.json not found at ${PDF_INDEX_PATH}`);
  }
  return [];
}

/**
 * Strict French & Unicode Word Boundary match (\b equivalent)
 * Prevents "également" from matching "gale", or "certificat" from matching "cat".
 */
function hasExactWord(text, word) {
  if (!text || !word) return false;
  const escaped = word.replace(/[.*+?^${}()|[\]\\]/g, '\\$&');
  const rx = new RegExp(`(?:^|[^a-z0-9à-ÿ])${escaped}(?:$|[^a-z0-9à-ÿ])`, 'i');
  return rx.test(text);
}

/**
 * Normalizes query string: strips standard CAT prefixes, trims punctuation.
 */
function cleanQueryTerm(rawQuery) {
  const cleaned = (rawQuery || '')
    .toLowerCase()
    .replace(/^cat\s+devant\s+/i, '')
    .replace(/^cat\s+/i, '')
    .replace(/^conduite\s+à\s+tenir\s+devant\s+/i, '')
    .replace(/^conduite\s+a\s+tenir\s+devant\s+/i, '')
    .replace(/^prise\s+en\s+charge\s+d[eu']\s+/i, '')
    .replace(/[`'’"“”«»]/g, ' ')
    .replace(/[-_/]/g, ' ')
    .trim();

  const tokens = cleaned
    .split(/\s+/)
    .filter(t => t.length >= 3 && !['les', 'des', 'une', 'par', 'sur', 'pour', 'dans', 'chez'].includes(t));

  return {
    fullPhrase: cleaned,
    tokens: tokens
  };
}

/**
 * Detects whether a page is primarily a Table of Contents (Sommaire) with dots and page numbers.
 */
function isTableOfContents(text) {
  if (!text) return false;
  const dotLeaderCount = (text.match(/[.…]{4,}/g) || []).length;
  const hasSommaireHeader = /(?:table\s+des\s+mati[eè]res|sommaire|index\s+alphab[eé]tique)/i.test(text);
  return hasSommaireHeader || dotLeaderCount >= 3;
}

/**
 * Extracts a rich, substantive clinical text block from a page, prioritizing Treatment/Prescription sections.
 */
function extractSubstantiveClinicalBlock(pageText, nextPageText = '', queryInfo) {
  if (!pageText) return '';
  const text = pageText.trim();

  // If the entire page is reasonably short (<= 1600 chars), return it all for complete medical context
  if (text.length <= 1600) {
    return text;
  }

  // Clinical section anchor headers to look for
  const anchorRegex = /(?:^|\n)(?:#+\s*|\*\*\s*|\b)(Traitement|Th[eé]rapeutique|Prise\s+en\s+charge|Ordonnance|Posologie|Signes\s+de\s+gravit[eé]|Drapeaux\s+rouges|Urgences|Diagnostic|Conduite\s+à\s+tenir)(?:[:\s\*\n]|$)/i;
  
  const anchorMatch = text.match(anchorRegex);
  if (anchorMatch && anchorMatch.index !== undefined) {
    const startIdx = Math.max(0, anchorMatch.index - 120);
    let extracted = text.substring(startIdx, startIdx + 2200).trim();

    // If section appears to end abruptly and next page text exists, append start of next page
    if (nextPageText && extracted.length >= 2000 && !extracted.endsWith('.')) {
      extracted += '\n\n[Suite page suivante] :\n' + nextPageText.trim().substring(0, 800);
    }
    return extracted;
  }

  // Fallback: Find first occurrence of the full phrase or primary token
  const searchWord = queryInfo.fullPhrase && text.toLowerCase().includes(queryInfo.fullPhrase)
    ? queryInfo.fullPhrase
    : (queryInfo.tokens[0] || '');

  if (searchWord) {
    const idx = text.toLowerCase().indexOf(searchWord);
    if (idx !== -1) {
      const startIdx = Math.max(0, idx - 150);
      return text.substring(startIdx, startIdx + 2200).trim();
    }
  }

  return text.substring(0, 1800).trim();
}

/**
 * Purely algorithmic, generic search across all local pre-indexed reference PDFs.
 * @param {string} queryTerm Clinical CAT topic or title
 * @param {object} options Options { maxMatchesPerFile, maxTotalDocuments }
 */
async function searchLocalPDFs(queryTerm, options = {}) {
  const maxMatchesPerFile = options.maxMatchesPerFile || 3;
  const maxTotalDocuments = options.maxTotalDocuments || 8;
  const pdfIndex = getPdfIndex();

  const queryInfo = cleanQueryTerm(queryTerm);

  debugEmitter.emitEvent('pdf_search_start', {
    queryTerm,
    cleanPhrase: queryInfo.fullPhrase,
    tokens: queryInfo.tokens,
    totalDocuments: pdfIndex ? pdfIndex.length : 0
  });

  if (!pdfIndex || pdfIndex.length === 0 || queryInfo.tokens.length === 0) {
    debugEmitter.emitEvent('pdf_search_empty', { queryTerm, reason: 'Index empty or invalid tokens' });
    return [];
  }

  const scoredDocuments = [];

  for (const doc of pdfIndex) {
    const fileName = doc.pdf || 'Unknown.pdf';
    const pages = doc.pages || [];
    const scoredPages = [];

    // Document-level boost: Check if filename itself contains the full phrase or key tokens
    const filenameLower = fileName.toLowerCase();
    const isDedicatedFile = (pages.length <= 8) && (
      hasExactWord(filenameLower, queryInfo.fullPhrase) ||
      queryInfo.tokens.every(t => hasExactWord(filenameLower, t))
    );

    for (let i = 0; i < pages.length; i++) {
      const p = pages[i];
      const pageNum = p.page || (i + 1);
      const pageText = p.content || '';
      if (!pageText || pageText.length < 40) continue;

      let score = 0;
      const matchedTokens = [];
      const isTOC = isTableOfContents(pageText);

      // 1. Full-Phrase exact match (Highest Priority)
      const hasFullPhrase = queryInfo.fullPhrase.length > 3 && hasExactWord(pageText, queryInfo.fullPhrase);
      if (hasFullPhrase) {
        score += 60;
      }

      // 2. Individual Token Matches with Word-Boundaries
      for (const tok of queryInfo.tokens) {
        if (hasExactWord(pageText, tok)) {
          matchedTokens.push(tok);
          score += 15;
        }
      }

      // 3. Proximity Bonus: If all query tokens appear on the page
      if (queryInfo.tokens.length > 1 && matchedTokens.length === queryInfo.tokens.length) {
        score += 25;
      }

      // 4. Clinical Content Anchors Bonus
      const hasClinicalAnchors = /(?:traitement|posologie|ordonnance|prise\s+en\s+charge|signes\s+de\s+gravit[eé]|drapeaux\s+rouges)/i.test(pageText);
      if (hasClinicalAnchors) {
        score += 20;
      }

      // 5. Dedicated Single-Topic File Bonus
      if (isDedicatedFile) {
        score += 40;
      }

      // 6. Demote Table of Contents pages
      if (isTOC) {
        score -= 40;
      }

      // Quality Bonus
      if (doc.quality === 'online' || doc.quality === 'gemini') {
        score += 10;
      }

      // If page is clinically relevant (score >= 35 or full phrase hit)
      if (score >= 35 || (hasFullPhrase && !isTOC)) {
        const nextPageText = (i + 1 < pages.length) ? (pages[i + 1].content || '') : '';
        const richSnippet = extractSubstantiveClinicalBlock(pageText, nextPageText, queryInfo);

        scoredPages.push({
          page: pageNum,
          score: score,
          matchedTokens: matchedTokens,
          hasFullPhrase: hasFullPhrase,
          isTOC: isTOC,
          snippet: richSnippet
        });
      }
    }

    if (scoredPages.length > 0) {
      // Sort pages by clinical score descending
      scoredPages.sort((a, b) => b.score - a.score);
      const topPages = scoredPages.slice(0, maxMatchesPerFile);
      const totalDocScore = topPages.reduce((acc, p) => acc + p.score, 0);

      scoredDocuments.push({
        pdfFile: fileName,
        totalPages: pages.length,
        isDedicatedFile: isDedicatedFile,
        docScore: totalDocScore,
        matchCount: topPages.length,
        matches: topPages
      });

      // Emit telemetry for matching document
      for (const tp of topPages) {
        debugEmitter.emitEvent('pdf_match_found', {
          pdfFile: fileName,
          page: tp.page,
          score: tp.score,
          matchedTokens: tp.matchedTokens,
          hasFullPhrase: tp.hasFullPhrase,
          snippetPreview: tp.snippet.slice(0, 220),
          quality: doc.quality || 'online'
        });
      }
    }
  }

  // Rank documents: Dedicated files & highest clinical scores first
  scoredDocuments.sort((a, b) => {
    if (a.isDedicatedFile && !b.isDedicatedFile) return -1;
    if (!a.isDedicatedFile && b.isDedicatedFile) return 1;
    return b.docScore - a.docScore;
  });

  const finalResults = scoredDocuments.slice(0, maxTotalDocuments);

  debugEmitter.emitEvent('pdf_search_done', {
    queryTerm,
    cleanPhrase: queryInfo.fullPhrase,
    matchedDocumentsCount: finalResults.length,
    topSources: finalResults.slice(0, 4).map(r => ({
      pdfFile: r.pdfFile,
      score: r.docScore,
      pages: r.matches.map(m => m.page)
    }))
  });

  return finalResults;
}

/**
 * Lists all available local PDF reference files directly from ready pdf_index.json
 */
function listAvailablePDFs() {
  const index = getPdfIndex();
  return index.map(doc => ({
    fileName: doc.pdf,
    totalPages: (doc.pages || []).length,
    quality: doc.quality || 'online'
  }));
}

module.exports = {
  searchLocalPDFs,
  searchPDFIndex: searchLocalPDFs,
  listAvailablePDFs,
  hasExactWord,
  cleanQueryTerm,
  isTableOfContents
};
