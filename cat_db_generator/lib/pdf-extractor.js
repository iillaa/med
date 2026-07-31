/**
 * Offline PDF Index Query Engine (Fast Pre-Extracted Search)
 * Purely queries the ready `pdf_index.json` database.
 * DOES NOT parse or extract raw binary PDFs.
 */

const fs = require('fs');
const path = require('path');

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
 * Searches the pre-extracted PDF index for a clinical term or title (0 binary parsing overhead)
 * @param {string} queryTerm 
 * @param {object} options 
 * @returns {Promise<Array<{ pdfFile: string, totalPages: number, matchCount: number, matches: Array<{ page: number, snippet: string }> }>>}
 */
async function searchLocalPDFs(queryTerm, options = {}) {
  const maxMatchesPerFile = options.maxMatchesPerFile || 3;
  const results = [];
  const normalizedQuery = queryTerm.toLowerCase().trim();
  const queryTokens = normalizedQuery.split(/\s+/).filter(t => t.length > 2 && t !== 'devant');

  const pdfIndex = getPdfIndex();

  if (!pdfIndex || pdfIndex.length === 0) {
    return [];
  }

  for (const doc of pdfIndex) {
    const fileName = doc.pdf || 'Unknown.pdf';
    const pages = doc.pages || [];
    const matches = [];

    for (const p of pages) {
      const pageNum = p.page || 1;
      const pageText = p.content || '';
      const lowerPageText = pageText.toLowerCase();

      // Calculate token match count
      const hitTokens = queryTokens.filter(token => lowerPageText.includes(token));
      if (hitTokens.length > 0 && hitTokens.length >= Math.min(2, queryTokens.length)) {
        const snippetIndex = lowerPageText.indexOf(hitTokens[0]);
        const start = Math.max(0, snippetIndex - 80);
        const end = Math.min(pageText.length, snippetIndex + 320);
        const snippet = pageText.substring(start, end).replace(/\s+/g, ' ').trim();

        matches.push({
          page: pageNum,
          matchedTokens: hitTokens,
          snippet: snippet
        });

        if (matches.length >= maxMatchesPerFile) break;
      }
    }

    if (matches.length > 0) {
      results.push({
        pdfFile: fileName,
        totalPages: pages.length,
        matchCount: matches.length,
        matches: matches
      });
    }
  }

  return results.sort((a, b) => b.matchCount - a.matchCount);
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
  listAvailablePDFs
};


