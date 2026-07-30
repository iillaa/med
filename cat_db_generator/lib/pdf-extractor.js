/**
 * Deep Local PDF Extractor & Scanner
 * Scans local reference PDFs in `.cat-med/reference-pdfs/` and `public/pdfs/`
 * to extract authentic clinical snippets, section titles, and page references.
 */

const fs = require('fs');
const path = require('path');
const pdfParse = require('pdf-parse');

const PDF_DIRECTORIES = [
  path.join(__dirname, '..', '..', '.cat-med', 'reference-pdfs'),
  path.join(__dirname, '..', '..', 'public', 'pdfs')
];

/**
 * Searches local PDFs for a clinical term or title
 * @param {string} queryTerm 
 * @param {object} options 
 * @returns {Promise<Array<{ pdfFile: string, pageCount: number, matches: Array<{ page: number, snippet: string }> }>>}
 */
async function searchLocalPDFs(queryTerm, options = {}) {
  const maxMatchesPerFile = options.maxMatchesPerFile || 5;
  const results = [];
  const normalizedQuery = queryTerm.toLowerCase().trim();
  const queryTokens = normalizedQuery.split(/\s+/).filter(t => t.length > 2);

  for (const pdfDir of PDF_DIRECTORIES) {
    if (!fs.existsSync(pdfDir)) continue;

    const files = fs.readdirSync(pdfDir).filter(f => f.endsWith('.pdf'));

    for (const file of files) {
      const filePath = path.join(pdfDir, file);
      try {
        const dataBuffer = fs.readFileSync(filePath);
        const pdfData = await pdfParse(dataBuffer);

        const text = pdfData.text || '';
        const pages = text.split('\n\n'); // Approximate page or section splits
        const matches = [];

        for (let i = 0; i < pages.length; i++) {
          const pageText = pages[i];
          const lowerPageText = pageText.toLowerCase();

          // Check token overlap score
          const hitTokens = queryTokens.filter(token => lowerPageText.includes(token));
          if (hitTokens.length > 0 && hitTokens.length >= Math.min(2, queryTokens.length)) {
            // Extract snippet context
            const snippetIndex = lowerPageText.indexOf(hitTokens[0]);
            const start = Math.max(0, snippetIndex - 100);
            const end = Math.min(pageText.length, snippetIndex + 300);
            const snippet = pageText.substring(start, end).replace(/\s+/g, ' ').trim();

            matches.push({
              section: i + 1,
              matchedTokens: hitTokens,
              snippet: snippet
            });

            if (matches.length >= maxMatchesPerFile) break;
          }
        }

        if (matches.length > 0) {
          results.push({
            pdfFile: file,
            path: filePath,
            totalPages: pdfData.numpages || 1,
            matchCount: matches.length,
            matches: matches
          });
        }
      } catch (err) {
        // Skip unreadable or corrupted PDFs safely
        continue;
      }
    }
  }

  return results.sort((a, b) => b.matchCount - a.matchCount);
}

/**
 * Lists all available local PDF reference files
 */
function listAvailablePDFs() {
  const allPDFs = [];
  for (const pdfDir of PDF_DIRECTORIES) {
    if (!fs.existsSync(pdfDir)) continue;
    const files = fs.readdirSync(pdfDir).filter(f => f.endsWith('.pdf'));
    files.forEach(f => {
      const stats = fs.statSync(path.join(pdfDir, f));
      allPDFs.push({
        fileName: f,
        directory: pdfDir,
        sizeKb: Math.round(stats.size / 1024)
      });
    });
  }
  return allPDFs;
}

module.exports = {
  searchLocalPDFs,
  listAvailablePDFs
};
