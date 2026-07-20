/**
 * Safe localStorage wrapper — crash-proof getItem/setItem.
 *
 * Replaces the duplicate Storage.prototype monkey-patches that were scattered
 * across main.js and performance.js with a single, explicit utility module.
 * Callers use safeGetItem / safeSetItem instead of raw localStorage access.
 *
 * The wrappers catch QuotaExceededError (evicting the sync cache on overflow)
 * and any other exceptions (private browsing, corrupted data, etc.) so the
 * app never crashes from a storage read/write.
 */

const SYNC_CACHE_KEY_PREFIX = 'dr_cat_synced_database';

export function safeGetItem(key, fallback = null) {
  try {
    return localStorage.getItem(key);
  } catch (_) {
    return fallback;
  }
}

export function safeSetItem(key, value) {
  try {
    localStorage.setItem(key, value);
    return true;
  } catch (e) {
    if (e && (e.name === 'QuotaExceededError' || e.code === 22)) {
      console.warn('[storage] quota exceeded, evicting sync cache:', key);
      try {
        // Evict the largest cached item (synced database) to free space
        for (let i = 0; i < localStorage.length; i++) {
          const k = localStorage.key(i);
          if (k && k.startsWith(SYNC_CACHE_KEY_PREFIX)) {
            localStorage.removeItem(k);
            break;
          }
        }
      } catch (_) { /* eviction failure is non-critical */ }
      // Retry once after eviction
      try {
        localStorage.setItem(key, value);
        return true;
      } catch (_) {
        return false;
      }
    }
    return false;
  }
}

export function safeRemoveItem(key) {
  try {
    localStorage.removeItem(key);
    return true;
  } catch (_) {
    return false;
  }
}

export function safeParseJSON(str, fallback = null) {
  if (!str) return fallback;
  try {
    return JSON.parse(str);
  } catch (_) {
    return fallback;
  }
}
