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
const { expandMedicalTokens } = require('./medical-synonyms');
const { cleanOcrText } = require('./ocr-cleaner');

const PDF_INDEX_PATH = path.join(__dirname, '..', '..', 'pdf_index.json');
const STAGING_INDEX_PATH = path.join(__dirname, '..', '..', 'data', 'pdf_staging_index.json');
let cachedPdfIndex = null;
let lastIndexLoadTime = 0;

/**
 * Loads and caches the pre-extracted PDF index, seamlessly merging master and staging drafts
 */
function getPdfIndex(forceRefresh = false) {
  const now = Date.now();
  if (!forceRefresh && cachedPdfIndex && (now - lastIndexLoadTime < 10000)) {
    return cachedPdfIndex;
  }

  let masterDocs = [];
  if (fs.existsSync(PDF_INDEX_PATH)) {
    try {
      masterDocs = JSON.parse(fs.readFileSync(PDF_INDEX_PATH, 'utf8'));
    } catch (e) {
      console.warn(`⚠️ Failed to parse pdf_index.json: ${e.message}`);
    }
  }

  let stagingDocs = [];
  if (fs.existsSync(STAGING_INDEX_PATH)) {
    try {
      stagingDocs = JSON.parse(fs.readFileSync(STAGING_INDEX_PATH, 'utf8'));
    } catch (e) {
      console.warn(`⚠️ Failed to parse pdf_staging_index.json: ${e.message}`);
    }
  }

  // Merge: Staging drafts take precedence
  const merged = [...stagingDocs];
  for (const doc of masterDocs) {
    if (!merged.some(s => s.pdf === doc.pdf)) {
      merged.push(doc);
    }
  }

  cachedPdfIndex = merged;
  lastIndexLoadTime = now;
  console.log(`📑 Loaded merged PDF Index (${masterDocs.length} master + ${stagingDocs.length} staging documents ready).`);
  return cachedPdfIndex;
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
    .replace(/^cat\s+devant\s+(?:l[a'’]|le|les|une|un)?\s*/i, '')
    .replace(/^cat\s+/i, '')
    .replace(/^la\s+gale/i, 'gale')
    .replace(/^conduite\s+à\s+tenir\s+devant\s+(?:l[a'’]|le|les|une|un)?\s*/i, '')
    .replace(/^conduite\s+a\s+tenir\s+devant\s+(?:l[a'’]|le|les|une|un)?\s*/i, '')
    .replace(/^prise\s+en\s+charge\s+d[eu'’]\s+/i, '')
    .replace(/\b(?:chez\s+l[’']|chez\s+l[ae]|chez\s+les|chez\s+un[e]?|chez)\b/gi, ' ')
    .replace(/\([^)]+\)/g, '')
    .replace(/[`'’"“”«»]/g, ' ')
    .replace(/[-_/]/g, ' ')
    .replace(/\s+/g, ' ')
    .trim();

  const tokens = cleaned
    .split(/\s+/)
    .filter(t => t.length >= 2 && !['le', 'la', 'les', 'des', 'une', 'un', 'par', 'sur', 'pour', 'dans', 'chez', 'd', 'l'].includes(t));

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
 * Scans for Table of Contents (Sommaire) pointers targeting exact page numbers.
 * Supports:
 *   1. Human-Indexed doc.toc arrays (Highest Infallible Accuracy).
 *   2. Dotted leaders regex matching from pages 1 to 10 (Algorithmic text fallback).
 */
function findTocPointers(pages, queryInfo, docToc = []) {
  const targetPages = new Set();

  // 0. Check Human-Indexed TOC entries first (100% Infallible GPS Navigation)
  if (docToc && Array.isArray(docToc)) {
    for (const entry of docToc) {
      if (!entry || !entry.title || !entry.page) continue;
      const normalizedTitle = entry.title.toLowerCase().normalize('NFD').replace(/[\u0300-\u036f]/g, '');
      const cleanPhraseNorm = queryInfo.fullPhrase.toLowerCase().normalize('NFD').replace(/[\u0300-\u036f]/g, '');
      
      const hasTitleMatch = hasExactWord(normalizedTitle, cleanPhraseNorm) || 
                            (queryInfo.tokens.length > 0 && queryInfo.tokens.every(t => hasExactWord(normalizedTitle, t)));
      if (hasTitleMatch) {
        targetPages.add(entry.page);
      }
    }
  }

  const firstPages = (pages || []).slice(0, 10);

  for (const p of firstPages) {
    const text = p.content || '';
    if (!isTableOfContents(text) && (p.page || 1) > 6) continue;

    // 1. Try full phrase match in TOC
    if (queryInfo.fullPhrase && queryInfo.fullPhrase.length >= 3) {
      const escaped = queryInfo.fullPhrase.replace(/[.*+?^${}()|[\]\\]/g, '\\$&');
      const rx = new RegExp(escaped + '\\s*[*]?\\s*[.…–\\-_\\s]{2,}\\s*(\\d+)', 'i');
      const m = text.match(rx);
      if (m && m[1]) {
        const pageNum = parseInt(m[1], 10);
        if (pageNum > 0 && pageNum <= pages.length) {
          targetPages.add(pageNum);
        }
      }
    }

    // 2. Try primary tokens in TOC
    for (const tok of queryInfo.tokens) {
      if (tok.length < 4) continue;
      const escaped = tok.replace(/[.*+?^${}()|[\]\\]/g, '\\$&');
      const rx = new RegExp('(?:^|\\n|[#\\-\\*])\\s*' + escaped + '[^\\n\\d]{0,40}[.…–\\-_\\s]{2,}\\s*(\\d+)', 'i');
      const m = text.match(rx);
      if (m && m[1]) {
        const pageNum = parseInt(m[1], 10);
        if (pageNum > 0 && pageNum <= pages.length) {
          targetPages.add(pageNum);
        }
      }
    }
  }

  return Array.from(targetPages);
}

/**
 * Purely algorithmic, generic search across all local pre-indexed reference PDFs.
 * @param {string} queryTerm Clinical CAT topic or title
 * @param {object} options Options { maxMatchesPerFile, maxTotalDocuments }
 */
async function searchLocalPDFs(queryTerm, options = {}) {
  const maxMatchesPerFile = options.maxMatchesPerFile || 3;
  const maxTotalDocuments = options.maxTotalDocuments || 8;
  const targetCategory = (options.category || '').toLowerCase().normalize('NFD').replace(/[\u0300-\u036f]/g, '');
  const pdfIndex = getPdfIndex();

  const queryInfo = cleanQueryTerm(queryTerm);
  const { expandedTokens, relatedTerms } = expandMedicalTokens(queryInfo.fullPhrase, queryInfo.tokens);

  debugEmitter.emitEvent('pdf_search_start', {
    queryTerm,
    cleanPhrase: queryInfo.fullPhrase,
    tokens: queryInfo.tokens,
    expandedTokens,
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
    const docSpecialty = doc.specialty || 'Médecine Générale';
    const docSpecialtyNorm = docSpecialty.toLowerCase().normalize('NFD').replace(/[\u0300-\u036f]/g, '');

    const isSpecialtyMatch = targetCategory && docSpecialtyNorm && (
      docSpecialtyNorm.includes(targetCategory) || targetCategory.includes(docSpecialtyNorm)
    );

    // 1. Document Title & Filename Match (Field 1)
    const docTitle = (doc.title || fileName || '').toLowerCase();
    const isTitleMatch = hasExactWord(docTitle, queryInfo.fullPhrase) ||
                         (queryInfo.tokens.length > 0 && queryInfo.tokens.every(t => hasExactWord(docTitle, t)));

    // 2. Metadata Medical Keywords Match (Field 3)
    const rawKeywords = Array.isArray(doc.keywords) 
      ? doc.keywords.join(' ') 
      : (typeof doc.keywords === 'string' ? doc.keywords : '');
    const keywordsLower = rawKeywords.toLowerCase();
    const isKeywordMatch = keywordsLower.length > 0 && (
      hasExactWord(keywordsLower, queryInfo.fullPhrase) ||
      queryInfo.tokens.some(t => hasExactWord(keywordsLower, t))
    );

    const isDedicatedFile = (pages.length <= 8) && (isTitleMatch || isKeywordMatch);

    // 0. Smart Table of Contents (Sommaire) Page Pointer Resolution (Field 4: doc.toc)
    const tocTargetPages = findTocPointers(pages, queryInfo, doc.toc || []);

    for (let i = 0; i < pages.length; i++) {
      const p = pages[i];
      const pageNum = p.page || (i + 1);
      const rawPageText = p.content || '';
      if (!rawPageText || rawPageText.length < 40) continue;

      // Clean OCR artifacts before token analysis
      const pageText = cleanOcrText(rawPageText);

      let score = 0;
      const matchedTokens = [];
      const isTOC = isTableOfContents(pageText);

      // TOC Direct Pointer Hit (Highest Confidence GPS Navigation)
      const isDirectTocTarget = tocTargetPages.includes(pageNum);
      if (isDirectTocTarget) {
        score += 90;
      }

      // Field 2: Specialty Match Bonus
      if (isSpecialtyMatch) {
        score += 35;
      }

      // Field 1: Title Match Bonus
      if (isTitleMatch) {
        score += 40;
      }

      // Field 3: Keywords Match Bonus
      if (isKeywordMatch) {
        score += 30;
      }

      // 1. Full-Phrase exact match (Highest Priority)
      const hasFullPhrase = queryInfo.fullPhrase.length > 3 && hasExactWord(pageText, queryInfo.fullPhrase);
      if (hasFullPhrase) {
        score += 60;
      }

      // 2. Individual Primary Token Matches with Word-Boundaries
      for (const tok of queryInfo.tokens) {
        if (hasExactWord(pageText, tok)) {
          matchedTokens.push(tok);
          score += 15;
        }
      }

      let hasSynonymMatch = false;
      // 3. Synonym & Expanded Clinical Term Matches
      for (const syn of expandedTokens) {
        if (!queryInfo.tokens.includes(syn) && hasExactWord(pageText, syn)) {
          matchedTokens.push(syn);
          score += 10;
          hasSynonymMatch = true;
        }
      }

      const hasTopicMatch = hasFullPhrase || matchedTokens.length > 0 || isDirectTocTarget || hasSynonymMatch;
      if (!hasTopicMatch) {
        // Zero points if the page does not match the clinical topic at all
        continue;
      }

      // 4. Proximity Bonus: If all primary query tokens appear on the page
      if (queryInfo.tokens.length > 1 && matchedTokens.length >= queryInfo.tokens.length) {
        score += 25;
      }

      // 5. Clinical Content Anchors Bonus
      const hasClinicalAnchors = /(?:traitement|posologie|ordonnance|prise\s+en\s+charge|signes\s+de\s+gravit[eé]|drapeaux\s+rouges)/i.test(pageText);
      if (hasClinicalAnchors) {
        score += 20;
      }

      // 6. Dedicated Single-Topic File & PDF Lab 2.0 Slice Bonus
      if (isDedicatedFile) {
        score += 40;
      }
      if (doc.quality === 'staging' || doc.isSlice) {
        score += 50;
      }

      // 7. Demote Table of Contents pages
      if (isTOC) {
        score -= 50;
      }

      // Quality Bonus
      if (doc.quality === 'online' || doc.quality === 'gemini') {
        score += 10;
      }

      // If page is clinically relevant
      if (score >= 35 || isDirectTocTarget || (hasFullPhrase && !isTOC)) {
        const nextPageText = (i + 1 < pages.length) ? (pages[i + 1].content || '') : '';
        const richSnippet = extractSubstantiveClinicalBlock(pageText, nextPageText, queryInfo);

        scoredPages.push({
          page: pageNum,
          score: score,
          matchedTokens: matchedTokens,
          hasFullPhrase: hasFullPhrase,
          isDirectTocTarget: isDirectTocTarget,
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
        quality: doc.quality || 'master',
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
          quality: doc.quality || 'master'
        });
      }
    }
  }

  // Sort all scored documents strictly by clinical relevance score descending
  scoredDocuments.sort((a, b) => b.docScore - a.docScore);
  const finalResults = scoredDocuments.slice(0, maxTotalDocuments);

  const topSlices = finalResults.filter(d => d.isDedicatedFile || d.quality === 'staging' || d.totalPages <= 8);
  if (topSlices.length > 0) {
    debugEmitter.emitEvent('pdf_top_slice_matched', {
      count: topSlices.length,
      slices: topSlices.map(s => s.pdfFile)
    });
  }

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
