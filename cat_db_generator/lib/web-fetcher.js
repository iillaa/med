/**
 * Step 1: Live Web Research & Structured Cacher Module
 * Fetches, cleans, and caches clinical guidelines from reputable Algerian, French, and International medical domains.
 * Saves structured JSON cache files under `cat_db_generator/web_cache/<sanitized_title>/`.
 */

const fs = require('fs');
const path = require('path');
const { REPUTABLE_MEDICAL_SOURCES } = require('./medical-sources');

const CACHE_BASE_DIR = path.join(__dirname, '..', 'web_cache');

/**
 * Sanitizes a CAT title to create a clean directory name
 */
function sanitizeTitleForDir(title) {
  return title
    .toLowerCase()
    .normalize('NFD').replace(/[\u0300-\u036f]/g, '') // remove accents
    .replace(/^cat\s+devant\s+/i, '')
    .replace(/[^a-z0-9_-]+/g, '_')
    .replace(/^_+|_+$/g, '');
}

/**
 * Cleans raw HTML text into clean readable markdown/plain text
 */
function cleanHtmlText(html) {
  if (!html) return '';
  return html
    .replace(/<script\b[^<]*>([\s\S]*?)<\/script>/gi, '')
    .replace(/<style\b[^<]*>([\s\S]*?)<\/style>/gi, '')
    .replace(/<nav\b[^<]*>([\s\S]*?)<\/nav>/gi, '')
    .replace(/<header\b[^<]*>([\s\S]*?)<\/header>/gi, '')
    .replace(/<footer\b[^<]*>([\s\S]*?)<\/footer>/gi, '')
    .replace(/<[^>]+>/g, ' ')
    .replace(/\s+/g, ' ')
    .trim();
}

/**
 * Fetches a web page content with timeout and user agent
 */
async function fetchUrlContent(url, timeoutMs = 8000) {
  const controller = new AbortController();
  const timeoutId = setTimeout(() => controller.abort(), timeoutMs);

  try {
    const res = await fetch(url, {
      signal: controller.signal,
      headers: {
        'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) MedicalDocFetcher/2.0',
        'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8',
        'Accept-Language': 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7'
      }
    });
    clearTimeout(timeoutId);

    if (!res.ok) {
      throw new Error(`HTTP ${res.status}`);
    }

    const html = await res.text();
    return cleanHtmlText(html);
  } catch (err) {
    clearTimeout(timeoutId);
    throw err;
  }
}

/**
 * Searches and fetches clinical guidelines for a specific CAT title across reputable domains
 * @param {string} title CAT Title
 * @param {object} options Options { forceRefetch: boolean, maxSources: number }
 * @returns {Promise<Array<{ domain: string, sourceName: string, sourceUrl: string, fetchedAt: string, content: string }>>}
 */
async function fetchAndCacheWebSources(title, options = {}) {
  const sanitizedDirName = sanitizeTitleForDir(title);
  const targetDir = path.join(CACHE_BASE_DIR, sanitizedDirName);

  if (!fs.existsSync(targetDir)) {
    fs.mkdirSync(targetDir, { recursive: true });
  }

  // Check existing cache if not forcing refetch
  if (!options.forceRefetch) {
    const existingCache = getCachedWebSources(title);
    if (existingCache && existingCache.length > 0) {
      console.log(`🌐 [Web Cache] Reusing ${existingCache.length} cached web sources for "${title}".`);
      return existingCache;
    }
  }

  console.log(`🌐 [Step 1 Web Research] Fetching live medical guidelines for "${title}"...`);

  const cleanTitleQuery = title.replace(/^cat\s+devant\s+/i, '').trim();
  const maxSources = options.maxSources || 4;
  const fetchedSources = [];

  // Select top target sources to search
  const targetSources = REPUTABLE_MEDICAL_SOURCES.slice(0, Math.min(8, REPUTABLE_MEDICAL_SOURCES.length));

  for (const source of targetSources) {
    if (fetchedSources.length >= maxSources) break;

    try {
      // Build Google custom search / direct URL query
      const searchUrl = `https://www.google.com/search?q=${encodeURIComponent(cleanTitleQuery + ' site:' + source.domain)}`;
      console.log(`   - Searching ${source.name} (${source.domain})...`);

      const cleanText = await fetchUrlContent(searchUrl, 6000);
      if (cleanText && cleanText.length > 200) {
        const cacheObj = {
          title: title,
          domain: source.domain,
          sourceId: source.id,
          sourceName: source.name,
          searchUrl: searchUrl,
          fetchedAt: new Date().toISOString(),
          content: cleanText.substring(0, 3000) // Limit size to prevent bloating
        };

        const fileName = `${source.id}_${Date.now()}.json`;
        const filePath = path.join(targetDir, fileName);
        fs.writeFileSync(filePath, JSON.stringify(cacheObj, null, 2), 'utf8');

        fetchedSources.push(cacheObj);
        console.log(`     ✅ Cached ${cleanText.length} chars from ${source.domain}`);
      }
    } catch (err) {
      console.warn(`     ⚠️ Could not fetch from ${source.domain}: ${err.message}`);
    }

    // Friendly delay between requests
    await new Promise(r => setTimeout(r, 600));
  }

  return fetchedSources;
}

/**
 * Gets cached web sources for a CAT title from disk
 */
function getCachedWebSources(title) {
  const sanitizedDirName = sanitizeTitleForDir(title);
  const targetDir = path.join(CACHE_BASE_DIR, sanitizedDirName);

  if (!fs.existsSync(targetDir)) return [];

  const files = fs.readdirSync(targetDir).filter(f => f.endsWith('.json'));
  const cached = [];

  for (const file of files) {
    try {
      const raw = fs.readFileSync(path.join(targetDir, file), 'utf8');
      const obj = JSON.parse(raw);
      cached.push(obj);
    } catch (e) {
      continue;
    }
  }

  return cached;
}

/**
 * Lists web cache status for all CAT titles
 */
function listWebCacheStatus() {
  if (!fs.existsSync(CACHE_BASE_DIR)) return [];

  const dirs = fs.readdirSync(CACHE_BASE_DIR, { withFileTypes: true })
    .filter(d => d.isDirectory())
    .map(d => d.name);

  return dirs.map(dirName => {
    const dirPath = path.join(CACHE_BASE_DIR, dirName);
    const files = fs.readdirSync(dirPath).filter(f => f.endsWith('.json'));
    return {
      folder: dirName,
      cachedSourcesCount: files.length,
      sources: files
    };
  });
}

module.exports = {
  fetchAndCacheWebSources,
  getCachedWebSources,
  listWebCacheStatus,
  sanitizeTitleForDir
};
