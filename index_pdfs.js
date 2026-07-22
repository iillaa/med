const fs = require('fs');
const path = require('path');
const { extractPdfData } = require('./server/pdf_extractor');

const PDF_DIR = path.join(__dirname, 'public', 'pdfs');
const INDEX_FILE = path.join(__dirname, 'pdf_index.json');

// Status object to track indexing state in memory
let indexState = {
  isIndexing: false,
  totalFiles: 0,
  indexedFiles: 0,
  currentFile: ''
};

// Callback when index file is written/updated
let onIndexUpdatedCallback = null;

function onIndexUpdated(cb) {
  onIndexUpdatedCallback = cb;
}

/**
 * Returns the current state of the indexer
 */
function getIndexStatus() {
  const files = fs.existsSync(PDF_DIR) ? fs.readdirSync(PDF_DIR) : [];
  const pdfFiles = files.filter(f => f.toLowerCase().endsWith('.pdf'));
  
  let indexedCount = 0;
  if (fs.existsSync(INDEX_FILE)) {
    try {
      const idx = JSON.parse(fs.readFileSync(INDEX_FILE, 'utf-8'));
      indexedCount = idx.length;
    } catch (_) {}
  }

  return {
    isIndexing: indexState.isIndexing,
    totalFiles: pdfFiles.length,
    indexedFiles: indexedCount,
    currentFile: indexState.currentFile
  };
}

/**
 * Indexes PDF files in public/pdfs directory page by page.
 * Caches results in pdf_index.json to avoid parsing unmodified PDFs.
 */
async function indexPdfs(force = false) {
  if (indexState.isIndexing) {
    console.log("PDF Indexing is already running...");
    return;
  }

  indexState.isIndexing = true;
  indexState.currentFile = 'Initialisation...';
  console.log("Starting PDF text indexing...");

  try {
    let index = [];
    if (!force && fs.existsSync(INDEX_FILE)) {
      try {
        const content = await fs.promises.readFile(INDEX_FILE, 'utf-8');
        index = JSON.parse(content);
      } catch (e) {
        console.warn("Failed to parse existing index, starting fresh:", e);
        index = [];
      }
    }

    if (!fs.existsSync(PDF_DIR)) {
      console.error(`PDF directory not found at: ${PDF_DIR}`);
      indexState.isIndexing = false;
      return;
    }

    const files = await fs.promises.readdir(PDF_DIR);
    const pdfFiles = files.filter(f => f.toLowerCase().endsWith('.pdf'));
    
    indexState.totalFiles = pdfFiles.length;
    indexState.indexedFiles = 0;

    const newIndex = [];
    let updated = false;

    for (const file of pdfFiles) {
      const filePath = path.join(PDF_DIR, file);
      const stats = await fs.promises.stat(filePath);

      indexState.currentFile = file;

      try {
        console.log(`[Bundler] Processing "${file}"...`);
        const parseStart = Date.now();
        
        // Let the Strategy Manager handle hashing, caching, and LlamaParse delegation
        const extractedData = await extractPdfData(filePath, force);
        
        // Compare with old index to detect if it actually changed for logging
        const existing = index.find(item => item.pdf === file);
        if (!existing || existing.hash !== extractedData.hash || existing.quality !== extractedData.quality || force) {
          updated = true;
        }

        newIndex.push(extractedData);
        
        const parseDuration = Date.now() - parseStart;
        if (global.perfServer && (!existing || existing.hash !== extractedData.hash)) {
          global.perfServer.recordPdfParse(file, parseDuration, extractedData.pages.length);
        }
      } catch (err) {
        console.error(`[Bundler] Failed to process "${file}":`, err);
        // Keep existing if possible
        const existing = index.find(item => item.pdf === file);
        if (existing) {
          newIndex.push(existing);
        }
      }
      indexState.indexedFiles++;
    }

    if (updated || newIndex.length !== index.length || force) {
      const tempPath = INDEX_FILE + '.tmp';
      await fs.promises.writeFile(tempPath, JSON.stringify(newIndex, null, 2), 'utf-8');
      await fs.promises.rename(tempPath, INDEX_FILE);
      console.log(`PDF index updated successfully. Total indexed: ${newIndex.length} files.`);
      if (onIndexUpdatedCallback) {
        await onIndexUpdatedCallback();
      }
    } else {
      console.log("No PDF modifications detected. Index is up to date.");
    }
  } catch (err) {
    console.error("Critical error during PDF indexing:", err);
  } finally {
    indexState.isIndexing = false;
    indexState.currentFile = '';
  }
}

module.exports = {
  indexPdfs,
  getIndexStatus,
  onIndexUpdated
};

// When run directly (npm run reindex), (re)build the PDF index.
if (require.main === module) {
  indexPdfs(true).catch(err => {
    console.error('Reindex failed:', err);
    process.exit(1);
  });
}
