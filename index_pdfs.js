const fs = require('fs');
const path = require('path');
const { extractPdfData } = require('./server/pdf_extractor');
const { compressPdfFile } = require('./scripts/compress_pdfs');

const PDF_MASTERS_DIR = path.join(__dirname, 'data', 'pdf_masters');
const PUBLIC_PDF_DIR = path.join(__dirname, 'public', 'pdfs');
const STAGING_INDEX_FILE = path.join(__dirname, 'data', 'pdf_staging_index.json');
const INDEX_FILE = path.join(__dirname, 'pdf_index.json');
const PUBLIC_DATA_DIR = path.join(__dirname, 'public', 'data');

function ensurePdfDirectories() {
  if (!fs.existsSync(PDF_MASTERS_DIR)) fs.mkdirSync(PDF_MASTERS_DIR, { recursive: true });
  if (!fs.existsSync(PUBLIC_PDF_DIR)) fs.mkdirSync(PUBLIC_PDF_DIR, { recursive: true });
  if (!fs.existsSync(PUBLIC_DATA_DIR)) fs.mkdirSync(PUBLIC_DATA_DIR, { recursive: true });

  // Auto-sync any existing public PDFs to pdf_masters if missing
  const publicFiles = fs.existsSync(PUBLIC_PDF_DIR) ? fs.readdirSync(PUBLIC_PDF_DIR).filter(f => f.endsWith('.pdf')) : [];
  for (const file of publicFiles) {
    const masterPath = path.join(PDF_MASTERS_DIR, file);
    if (!fs.existsSync(masterPath)) {
      try { fs.copyFileSync(path.join(PUBLIC_PDF_DIR, file), masterPath); } catch (_) {}
    }
  }
}

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
  ensurePdfDirectories();
  const files = fs.existsSync(PDF_MASTERS_DIR) ? fs.readdirSync(PDF_MASTERS_DIR) : [];
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
 * Synchronizes client public/data assets (pdf_index.json and pdf_list.json)
 */
function syncPublicDataAssets(indexData) {
  try {
    ensurePdfDirectories();
    const pdfCacheDir = path.join(__dirname, 'data', 'pdf_cache');
    const publicFiles = fs.existsSync(PUBLIC_PDF_DIR)
      ? fs.readdirSync(PUBLIC_PDF_DIR).filter(f => f.toLowerCase().endsWith('.pdf') || f.toLowerCase().endsWith('.docx'))
      : [];

    const cleanPublicIndex = [];
    const cleanPublicList = [];

    for (const file of publicFiles) {
      cleanPublicList.push(file);
      const cacheFile = path.join(pdfCacheDir, `${file}.json`);
      if (fs.existsSync(cacheFile)) {
        try {
          const cacheData = JSON.parse(fs.readFileSync(cacheFile, 'utf-8'));
          cleanPublicIndex.push({
            pdf: file,
            pages: Array.isArray(cacheData.pages) ? cacheData.pages.map(p => ({
              page: p.page,
              content: p.content || p.text || ''
            })) : []
          });
        } catch (_) {
          cleanPublicIndex.push({ pdf: file, pages: [] });
        }
      } else {
        cleanPublicIndex.push({ pdf: file, pages: [] });
      }
    }

    fs.writeFileSync(
      path.join(PUBLIC_DATA_DIR, 'pdf_index.json'),
      JSON.stringify(cleanPublicIndex),
      'utf-8'
    );
    fs.writeFileSync(
      path.join(PUBLIC_DATA_DIR, 'pdf_list.json'),
      JSON.stringify(cleanPublicList),
      'utf-8'
    );
    console.log(`[Indexer] Synchronized clean public assets (${cleanPublicList.length} files, 0 dev leaks)`);
  } catch (err) {
    console.warn('[Indexer] Failed to sync public data assets:', err.message);
  }
}

/**
 * Indexes PDF files in data/pdf_masters directory page by page.
 * Automatically merges & promotes valid staged PDFs from data/pdf_staging_index.json into the master index.
 * Caches results in pdf_index.json and synchronizes public/data/ assets.
 */
async function indexPdfs(force = false) {
  if (indexState.isIndexing) {
    console.log("PDF Indexing is already running...");
    return;
  }

  ensurePdfDirectories();
  indexState.isIndexing = true;
  indexState.currentFile = 'Initialisation...';
  console.log("Starting PDF text indexing from master originals (data/pdf_masters/)...");

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

    const files = await fs.promises.readdir(PDF_MASTERS_DIR);
    const pdfFiles = files.filter(f => f.toLowerCase().endsWith('.pdf'));
    
    indexState.totalFiles = pdfFiles.length;
    indexState.indexedFiles = 0;

    const newIndex = [];
    let updated = false;

    // 1. Batch Parse & Index all master PDF files
    for (const file of pdfFiles) {
      const masterPath = path.join(PDF_MASTERS_DIR, file);
      const publicPath = path.join(PUBLIC_PDF_DIR, file);
      const stats = await fs.promises.stat(masterPath);

      indexState.currentFile = file;

      try {
        console.log(`[Indexer] Parsing master original "${file}"...`);
        const parseStart = Date.now();
        
        // Strategy Manager extracts from uncompressed master original
        const extractedData = await extractPdfData(masterPath, force);
        extractedData.mtime = stats.mtimeMs;
        
        // Compare with old index to detect changes
        const existing = index.find(item => item.pdf === file);
        if (!existing || existing.hash !== extractedData.hash || existing.quality !== extractedData.quality || force) {
          updated = true;
        }

        newIndex.push(extractedData);

        // Auto-compress master original into public/pdfs/ for web view and APK bundling
        if (!fs.existsSync(publicPath) || force) {
          compressPdfFile(masterPath, publicPath);
        }
        
        const parseDuration = Date.now() - parseStart;
        if (global.perfServer && (!existing || existing.hash !== extractedData.hash)) {
          global.perfServer.recordPdfParse(file, parseDuration, extractedData.pages.length);
        }
      } catch (err) {
        console.error(`[Indexer] Failed to process "${file}":`, err);
        const existing = index.find(item => item.pdf === file);
        if (existing) {
          newIndex.push(existing);
        }
      }
      indexState.indexedFiles++;
    }

    // 2. Save Master Index & Synchronize Public Assets
    if (updated || newIndex.length !== index.length || force) {
      const tempPath = INDEX_FILE + '.tmp';
      await fs.promises.writeFile(tempPath, JSON.stringify(newIndex, null, 2), 'utf-8');
      await fs.promises.rename(tempPath, INDEX_FILE);
      console.log(`PDF index updated successfully. Total indexed: ${newIndex.length} files.`);
      
      syncPublicDataAssets(newIndex);

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
  onIndexUpdated,
  syncPublicDataAssets
};

// When run directly (npm run reindex), (re)build the PDF index.
if (require.main === module) {
  indexPdfs(true).catch(err => {
    console.error('Reindex failed:', err);
    process.exit(1);
  });
}
