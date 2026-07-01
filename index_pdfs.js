const fs = require('fs');
const path = require('path');
const { PDFParse } = require('pdf-parse');

const PDF_DIR = path.join(__dirname, '.cat-med', 'reference-pdfs');
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
 * Indexes PDF files in reference-pdfs directory page by page.
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
      const mtime = stats.mtimeMs;
      const size = stats.size;

      indexState.currentFile = file;

      // Check if file is already indexed and unmodified
      const existing = index.find(item => item.pdf === file);
      if (!force && existing && existing.mtime === mtime && existing.size === size) {
        newIndex.push(existing);
        indexState.indexedFiles++;
        if (global.perfServer) global.perfServer.recordCacheHit();
        continue;
      }

      console.log(`Parsing new/modified PDF: "${file}" (${(size / 1024 / 1024).toFixed(2)} MB)...`);
      if (global.perfServer) global.perfServer.recordCacheMiss();
      const parseStart = Date.now();
      try {
        const dataBuffer = await fs.promises.readFile(filePath);
        const parser = new PDFParse({ data: dataBuffer });
        const res = await parser.getText();
        
        const pages = res.pages.map(p => ({
          page: p.num,
          text: p.text
        }));

        await parser.destroy();

        newIndex.push({
          pdf: file,
          size: size,
          mtime: mtime,
          pages: pages
        });
        
        const parseDuration = Date.now() - parseStart;
        if (global.perfServer) global.perfServer.recordPdfParse(file, parseDuration, pages.length);
        updated = true;
      } catch (err) {
        console.error(`Failed to parse "${file}":`, err);
        // Retain existing entry if valid, otherwise push empty page list to skip future retries
        if (existing) {
          newIndex.push(existing);
        } else {
          newIndex.push({
            pdf: file,
            size: size,
            mtime: mtime,
            pages: []
          });
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
