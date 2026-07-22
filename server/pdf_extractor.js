const fs = require('fs');
const path = require('path');
const crypto = require('crypto');
const { extractWithOffline } = require('./parsers/extractor_offline');
const { extractWithLlamaParse } = require('./parsers/extractor_llamaparse');
const { extractWithGoogle } = require('./parsers/extractor_google');

require('dotenv').config();

const CACHE_DIR = path.join(__dirname, '..', 'data', 'pdf_cache');

/**
 * Calculates SHA-256 hash of a file
 */
async function calculateHash(filePath) {
  return new Promise((resolve, reject) => {
    const hash = crypto.createHash('sha256');
    const stream = fs.createReadStream(filePath);
    stream.on('error', err => reject(err));
    stream.on('data', chunk => hash.update(chunk));
    stream.on('end', () => resolve(hash.digest('hex')));
  });
}

/**
 * Ensures cache directory exists
 */
function ensureCacheDir() {
  if (!fs.existsSync(CACHE_DIR)) {
    fs.mkdirSync(CACHE_DIR, { recursive: true });
  }
}

/**
 * Main Strategy Manager for PDF Extraction.
 * Handles hashing, caching, and fallback logic.
 */
async function extractPdfData(filePath, force = false) {
  ensureCacheDir();
  
  const fileName = path.basename(filePath);
  const cacheFilePath = path.join(CACHE_DIR, `${fileName}.json`);
  
  // 1. Calculate the file hash
  const currentHash = await calculateHash(filePath);
  
  // 2. Check Cache
  if (!force && fs.existsSync(cacheFilePath)) {
    try {
      const cacheContent = await fs.promises.readFile(cacheFilePath, 'utf-8');
      const cachedData = JSON.parse(cacheContent);
      
      // If hash matches, return cached data immediately
      if (cachedData.hash === currentHash) {
        console.log(`[Cache Hit] ${fileName} (Quality: ${cachedData.quality})`);
        return cachedData;
      } else {
        console.log(`[Cache Miss] ${fileName} hash changed. Re-indexing...`);
      }
    } catch (err) {
      console.warn(`[Cache Error] Failed to read cache for ${fileName}, re-indexing...`);
    }
  } else {
    console.log(`[Cache Miss] ${fileName} is new. Indexing...`);
  }

  // 3. Extraction Strategy
  const llamaKey = process.env.LLAMAPARSE_API_KEY;
  const googleKey = process.env.GOOGLE_API_KEY;
  let result = null;
  
  if (llamaKey) {
    try {
      console.log(`[Extractor] Attempting LlamaParse for ${fileName}...`);
      result = await extractWithLlamaParse(filePath, llamaKey);
    } catch (err) {
      console.error(`[Extractor] LlamaParse failed for ${fileName}.`, err.message);
    }
  } else {
    console.log(`[Extractor] No LLAMAPARSE_API_KEY found.`);
  }

  if (!result && googleKey) {
    try {
      console.log(`[Extractor] Attempting Google Gemini for ${fileName}...`);
      result = await extractWithGoogle(filePath, googleKey);
    } catch (err) {
      console.error(`[Extractor] Google Gemini failed for ${fileName}.`, err.message);
    }
  } else if (!result) {
    console.log(`[Extractor] No GOOGLE_API_KEY found.`);
  }

  if (!result) {
    console.log(`[Extractor] Falling back to Offline parser for ${fileName}...`);
    try {
      result = await extractWithOffline(filePath);
    } catch (err) {
      console.error(`[Extractor] Offline parser failed for ${fileName}.`, err.message);
    }
  }

  // 4. Guard against all extractors failing
  if (!result || !result.quality) {
    throw new Error(`All PDF extractors (LlamaParse, Google, Offline) failed to parse ${fileName}.`);
  }
  
  // 4. Save to Cache
  const finalData = {
    pdf: fileName,
    hash: currentHash,
    quality: result.quality,
    timestamp: Date.now(),
    pages: result.pages
  };
  
  await fs.promises.writeFile(cacheFilePath, JSON.stringify(finalData, null, 2));
  console.log(`[Cache Saved] ${fileName}`);
  
  return finalData;
}

module.exports = { extractPdfData, calculateHash };
