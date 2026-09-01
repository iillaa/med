/**
 * Model Registry & Dynamic LLM Discovery
 * Discovers active Gemini models from Google AI Studio API, sorts them by capability,
 * and filters against GEMINI_BLOCKLIST.
 */

const FALLBACK_GEMINI_MODELS = [
  'gemini-3.6-flash',
  'gemini-3.5-flash',
  'gemini-3-flash-preview',
  'gemini-2.0-flash',
  'gemini-flash-latest',
  'gemini-flash-lite-latest'
];

let cachedDynamicModels = null;
let lastModelDiscoveryTime = 0;
const DISCOVERY_CACHE_TTL_MS = 60 * 60 * 1000; // 1 hour

/**
 * Filters out models matching the GEMINI_BLOCKLIST env var (comma-separated substrings).
 * Example: GEMINI_BLOCKLIST="flash-preview, exp"
 */
function applyModelBlocklist(models) {
  const blocklist = (process.env.GEMINI_BLOCKLIST || '')
    .split(',')
    .map(s => s.trim().toLowerCase())
    .filter(Boolean);
  if (!blocklist.length) return Array.isArray(models) ? models.slice() : [];
  return (models || []).filter(m => {
    const name = String(m).toLowerCase();
    return !blocklist.some(b => name.includes(b));
  });
}

/**
 * Dynamically queries Google AI Studio API to discover real active models
 * and ranks them automatically by highest version number and clinical reasoning capability.
 */
async function discoverDynamicModels(apiKey) {
  const now = Date.now();
  if (cachedDynamicModels && (now - lastModelDiscoveryTime) < DISCOVERY_CACHE_TTL_MS) {
    return cachedDynamicModels;
  }

  try {
    const url = `https://generativelanguage.googleapis.com/v1beta/models?key=${apiKey}`;
    const res = await fetch(url);
    if (!res.ok) return applyModelBlocklist(FALLBACK_GEMINI_MODELS);

    const data = await res.json();
    const models = (data.models || [])
      .filter(m => m.supportedGenerationMethods && m.supportedGenerationMethods.includes('generateContent'))
      .map(m => m.name.replace('models/', ''))
      .filter(name => !name.includes('tts') && !name.includes('image') && !name.includes('banana') && !name.includes('clip') && !name.includes('computer-use'));

    // Automatically sort by highest version (highest number first, e.g. 3.6 > 3.5 > 3.0 > 2.0 > latest)
    models.sort((a, b) => {
      const getVer = s => {
        const match = s.match(/gemini-(\d+(?:\.\d+)?)/i);
        return match ? parseFloat(match[1]) : (s.includes('latest') ? 1.9 : 1.0);
      };
      return getVer(b) - getVer(a);
    });

    if (models.length > 0) {
      const filtered = applyModelBlocklist(models);
      cachedDynamicModels = filtered;
      lastModelDiscoveryTime = now;
      console.log(`🤖 [Dynamic LLM Discovery] Discovered ${models.length} active models (${models.length - filtered.length} blocklisted). Top primary: ${filtered[0] || 'NONE'}`);
      return filtered;
    }
  } catch (err) {
    console.warn(`⚠️ Dynamic model discovery failed: ${err.message}. Using fallback model list.`);
  }

  return applyModelBlocklist(FALLBACK_GEMINI_MODELS);
}

module.exports = {
  FALLBACK_GEMINI_MODELS,
  applyModelBlocklist,
  discoverDynamicModels
};
