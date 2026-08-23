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

// Keys that MUST NEVER be automatically evicted on quota overflow
const PROTECTED_KEY_PATTERNS = [
  /^dr_cat_notes_/,
  /^dr_cat_user_progress$/,
  /^dr_cat_leitner$/,
  /^dr_cat_streak$/,
  /^dr_cat_local_overrides$/,
  /^dr_cat_custom_created_cats$/,
  /^dr_cat_install_id$/,
  /^dr_cat_admin_token$/,
  /^drcat_legal_consent/
];

function isProtectedKey(key) {
  if (!key) return false;
  return PROTECTED_KEY_PATTERNS.some(pattern => pattern.test(key));
}

/**
 * Evicts ephemeral items from localStorage to free space.
 * Strictly preserves user notes, study streaks, and progress.
 */
function evictTransientStorage() {
  const evictableKeys = [];
  try {
    for (let i = 0; i < localStorage.length; i++) {
      const k = localStorage.key(i);
      if (k && !isProtectedKey(k)) {
        let size = 0;
        try {
          const val = localStorage.getItem(k);
          size = val ? val.length : 0;
        } catch (_) {}
        // Prioritize synccache first, then large transient caches
        const priority = k.startsWith(SYNC_CACHE_KEY_PREFIX) ? 1000 : 1;
        evictableKeys.push({ key: k, size, priority });
      }
    }

    // Sort by priority (sync cache first) then by size descending
    evictableKeys.sort((a, b) => b.priority - a.priority || b.size - a.size);

    for (const item of evictableKeys) {
      try {
        localStorage.removeItem(item.key);
      } catch (_) {}
    }
  } catch (_) {
    /* eviction failure is non-critical */
  }
}

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
    if (e && (e.name === 'QuotaExceededError' || e.code === 22 || e.number === -2147024882)) {
      console.warn('[storage] Quota exceeded, executing protected LRU eviction for key:', key);
      evictTransientStorage();
      // Retry once after eviction
      try {
        localStorage.setItem(key, value);
        return true;
      } catch (retryErr) {
        console.error('[storage] Failed to set item even after eviction:', key, retryErr);
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

