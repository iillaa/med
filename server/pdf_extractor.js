const fs = require('fs');
const path = require('path');
const crypto = require('crypto');
const { extractWithOffline } = require('./parsers/extractor_offline');
const { extractWithLlamaParse } = require('./parsers/extractor_llamaparse');
const { extractWithGoogle } = require('./parsers/extractor_google');
const { safeWriteJsonAsync } = require('./services/data-store');

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
 * @param {string} filePath - Absolute path to PDF file
 * @param {boolean} force - Force cache bypass
 * @param {boolean} allowCloud - Explicit permission to use cloud AI extractors (LlamaParse/Gemini). Default: false for batch indexing.
 */
async function extractPdfData(filePath, force = false, allowCloud = false) {
  ensureCacheDir();
  
  const fileName = path.basename(filePath);
  const cacheFilePath = path.join(CACHE_DIR, `${fileName}.json`);
  const highQualityTiers = ['online', 'online-google', 'llama', 'llamaparse', 'gemini', 'llama_cached_slice', 'curated_master', 'curated', 'ai_smart_sliced'];
  
  // 1. Calculate the file hash
  const currentHash = await calculateHash(filePath);
  
  // 2. Check Cache
  if (fs.existsSync(cacheFilePath)) {
    try {
      const cacheContent = await fs.promises.readFile(cacheFilePath, 'utf-8');
      const cachedData = JSON.parse(cacheContent);
      
      // If hash matches or if existing cache is high quality and not explicitly forced with allowCloud
      if (!force && (cachedData.hash === currentHash || (highQualityTiers.includes(cachedData.quality) && !allowCloud))) {
        console.log(`[Cache Hit] ${fileName} (Quality: ${cachedData.quality})`);
        return cachedData;
      } else if (!force) {
        console.log(`[Cache Miss] ${fileName} hash changed. Re-indexing...`);
      }
    } catch (err) {
      console.warn(`[Cache Error] Failed to read cache for ${fileName}, re-indexing...`);
    }
  } else {
    console.log(`[Cache Miss] ${fileName} is new. Indexing...`);
  }

  // 3. Extraction Strategy (Cloud vs Offline)
  let result = null;
  const llamaKey = process.env.LLAMAPARSE_API_KEY;
  const googleKey = process.env.GOOGLE_API_KEY || process.env.GEMINI_API_KEY;
  
  if (allowCloud) {
    if (llamaKey) {
      try {
        console.log(`[Extractor] Attempting LlamaParse for ${fileName}...`);
        result = await extractWithLlamaParse(filePath, llamaKey);
      } catch (err) {
        console.error(`[Extractor] LlamaParse failed for ${fileName}.`, err.message);
      }
    }

    if (!result && googleKey) {
      try {
        console.log(`[Extractor] Attempting Google Gemini for ${fileName}...`);
        result = await extractWithGoogle(filePath, googleKey);
      } catch (err) {
        console.error(`[Extractor] Google Gemini failed for ${fileName}.`, err.message);
      }
    }
  }

  // Fallback / Default to Offline Parser
  if (!result) {
    console.log(`[Extractor] Running Offline parser for ${fileName}...`);
    try {
      result = await extractWithOffline(filePath);
    } catch (err) {
      console.error(`[Extractor] Offline parser failed for ${fileName}.`, err.message);
    }
  }

  // 4. Guard against all extractors failing or degrading
  if (!result || !result.quality) {
    console.error(`[Extractor] All PDF extractors failed to parse ${fileName}. Marking as failed to prevent infinite retry loop.`);
    result = { quality: 'failed', pages: [] };
  }

  // STRICT IMMUTABILITY GUARD: If existing cache exists with high-quality AI extraction and new result is offline/failed, NEVER downgrade
  if (fs.existsSync(cacheFilePath)) {
    try {
      const existingCacheData = JSON.parse(fs.readFileSync(cacheFilePath, 'utf-8'));
      if (existingCacheData && highQualityTiers.includes(existingCacheData.quality)) {
        if (result.quality === 'offline' || result.quality === 'failed') {
          console.warn(`[Extractor] New extraction for ${fileName} degraded to '${result.quality}', preserving existing high-quality '${existingCacheData.quality}' cache.`);
          return existingCacheData;
        }
      }
    } catch (_) {}
  }
  
  // 5. Save to Cache
  const finalData = {
    pdf: fileName,
    hash: currentHash,
    quality: result.quality,
    timestamp: Date.now(),
    pages: result.pages
  };
  
  await safeWriteJsonAsync(cacheFilePath, finalData);
  console.log(`[Cache Saved] ${fileName} (Quality: ${result.quality})`);
  
  return finalData;
}

module.exports = { extractPdfData, calculateHash };
