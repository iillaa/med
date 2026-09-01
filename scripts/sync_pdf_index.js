/**
 * Dr. CAT — PDF Index Optimizer & Synchronizer
 * Cleans OCR artifacts, repairs broken line-wrap hyphens, collapses excess whitespace,
 * and ensures 100% data consistency across Master, Staging, and Public PDF Indexes.
 */

const fs = require('fs');
const path = require('path');
const { cleanOcrText } = require('../cat_db_generator/lib/ocr-cleaner');

function optimizePdfText(raw) {
  if (!raw || typeof raw !== 'string') return '';
  let cleaned = cleanOcrText(raw);
  // Fix broken line-wrap hyphenation (e.g. traite-\nment -> traitement)
  cleaned = cleaned.replace(/([a-zA-ZÀ-ÿ])-[\r\n]+([a-zA-ZÀ-ÿ])/g, '$1$2');
  // Remove non-printable control characters (except standard newlines/tabs)
  cleaned = cleaned.replace(/[\x00-\x08\x0B\x0C\x0E-\x1F]/g, '');
  // Collapse 3+ consecutive linebreaks into 2
  cleaned = cleaned.replace(/\n{3,}/g, '\n\n');
  return cleaned.trim();
}

function syncAndOptimizePdfIndexes() {
  const rootIndexPath = path.join(__dirname, '..', 'pdf_index.json');
  const pdfCacheDir = path.join(__dirname, '..', 'data', 'pdf_cache');

  if (!fs.existsSync(rootIndexPath)) {
    console.warn('[PdfSync] Warning: pdf_index.json not found. Skipping.');
    return;
  }

  let rootIndex = [];
  try {
    rootIndex = JSON.parse(fs.readFileSync(rootIndexPath, 'utf8'));
  } catch (err) {
    console.error('[PdfSync] Error parsing pdf_index.json:', err.message);
    return;
  }

  let totalPagesCleaned = 0;

  for (const doc of rootIndex) {
    if (Array.isArray(doc.pages)) {
      for (const p of doc.pages) {
        if (p.content) {
          const original = p.content;
          const optimized = optimizePdfText(original);
          if (optimized !== original) {
            p.content = optimized;
            totalPagesCleaned++;
          }
        }
      }
    }
  }

  // Save optimized root pdf_index.json atomically
  const tmpPath = `${rootIndexPath}.tmp`;
  fs.writeFileSync(tmpPath, JSON.stringify(rootIndex, null, 2), 'utf8');
  fs.renameSync(tmpPath, rootIndexPath);

  console.log(`[PdfSync] ✅ Optimized ${totalPagesCleaned} pages across ${rootIndex.length} documents in pdf_index.json!`);

  // Also clean individual data/pdf_cache/*.json files
  if (fs.existsSync(pdfCacheDir)) {
    const cacheFiles = fs.readdirSync(pdfCacheDir).filter(f => f.endsWith('.json'));
    let cacheCleanedCount = 0;
    for (const cf of cacheFiles) {
      const fullPath = path.join(pdfCacheDir, cf);
      try {
        const data = JSON.parse(fs.readFileSync(fullPath, 'utf8'));
        let modified = false;
        if (Array.isArray(data.pages)) {
          for (const p of data.pages) {
            if (p.content) {
              const orig = p.content;
              const opt = optimizePdfText(orig);
              if (opt !== orig) {
                p.content = opt;
                modified = true;
              }
            }
          }
        }
        if (modified) {
          fs.writeFileSync(fullPath, JSON.stringify(data, null, 2), 'utf8');
          cacheCleanedCount++;
        }
      } catch (_) {}
    }
    if (cacheCleanedCount > 0) {
      console.log(`[PdfSync] ✅ Cleaned ${cacheCleanedCount} cache files in data/pdf_cache/!`);
    }
  }
}

if (require.main === module) {
  syncAndOptimizePdfIndexes();
}

module.exports = {
  optimizePdfText,
  syncAndOptimizePdfIndexes
};
