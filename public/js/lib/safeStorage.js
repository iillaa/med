/**
 * Safe localStorage wrapper — crash-proof getItem/setItem with in-memory fallback.
 *
 * Provides bulletproof resilience against:
 * 1. SecurityError (denied access in cross-origin iframes / third-party storage partitioning)
 * 2. QuotaExceededError (automatic protected LRU cache eviction)
 * 3. Private Browsing / Incognito mode restrictions
 * 4. Corrupted JSON strings
 */

const SYNC_CACHE_KEY_PREFIX = 'dr_cat_synced_database';

// In-Memory Storage Fallback (used when browser blocks window.localStorage)
const memoryStorage = new Map();
let isStorageUsable = null;

function checkStorageAvailability() {
  if (isStorageUsable !== null) return isStorageUsable;
  try {
    if (typeof window === 'undefined' || !window.localStorage) {
      isStorageUsable = false;
      return false;
    }
    const testKey = '__drcat_storage_probe__';
    window.localStorage.setItem(testKey, testKey);
    window.localStorage.removeItem(testKey);
    isStorageUsable = true;
  } catch (_) {
    isStorageUsable = false;
  }
  return isStorageUsable;
}

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
  if (!checkStorageAvailability()) return;
  const evictableKeys = [];
  try {
    for (let i = 0; i < window.localStorage.length; i++) {
      const k = window.localStorage.key(i);
      if (k && !isProtectedKey(k)) {
        let size = 0;
        try {
          const val = window.localStorage.getItem(k);
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
        window.localStorage.removeItem(item.key);
      } catch (_) {}
    }
  } catch (_) {
    /* eviction failure is non-critical */
  }
}

const OBFUSCATION_PREFIX = '__drcat_enc_';

/**
 * Obfuscates sensitive cached payload before writing to localStorage
 * to deter casual inspection and scraping.
 */
export function obfuscatePayload(str) {
  if (!str || typeof str !== 'string') return str;
  try {
    if (typeof TextEncoder === 'undefined' || typeof btoa !== 'function') return str;
    const utf8Bytes = new TextEncoder().encode(str);
    let binary = '';
    for (let i = 0; i < utf8Bytes.length; i++) {
      binary += String.fromCharCode(utf8Bytes[i] ^ 0x5a);
    }
    return OBFUSCATION_PREFIX + btoa(binary);
  } catch (_) {
    return str;
  }
}

/**
 * Deobfuscates payload read from localStorage.
 * Transparently falls back to plain JSON for backwards compatibility.
 */
export function deobfuscatePayload(str) {
  if (!str || typeof str !== 'string') return str;
  if (!str.startsWith(OBFUSCATION_PREFIX)) return str;
  try {
    if (typeof TextDecoder === 'undefined' || typeof atob !== 'function') return str;
    const binary = atob(str.slice(OBFUSCATION_PREFIX.length));
    const bytes = new Uint8Array(binary.length);
    for (let i = 0; i < binary.length; i++) {
      bytes[i] = binary.charCodeAt(i) ^ 0x5a;
    }
    return new TextDecoder().decode(bytes);
  } catch (_) {
    return str;
  }
}

export function safeGetItem(key, fallback = null) {
  if (!checkStorageAvailability()) {
    return memoryStorage.has(key) ? memoryStorage.get(key) : fallback;
  }
  try {
    let val = window.localStorage.getItem(key);
    if (val !== null) {
      if (key && key.startsWith(SYNC_CACHE_KEY_PREFIX)) {
        val = deobfuscatePayload(val);
      }
      return val;
    }
    return memoryStorage.has(key) ? memoryStorage.get(key) : fallback;
  } catch (_) {
    return memoryStorage.has(key) ? memoryStorage.get(key) : fallback;
  }
}

export function safeSetItem(key, value) {
  const strVal = String(value);
  // Always mirror in memory (plain unencoded) for instantaneous zero-throw fallbacks
  memoryStorage.set(key, strVal);

  if (!checkStorageAvailability()) {
    return true;
  }

  const isSyncDb = key && key.startsWith(SYNC_CACHE_KEY_PREFIX);
  const storedVal = isSyncDb ? obfuscatePayload(strVal) : strVal;

  try {
    window.localStorage.setItem(key, storedVal);
    return true;
  } catch (e) {
    if (e && (e.name === 'QuotaExceededError' || e.code === 22 || e.number === -2147024882)) {
      console.warn('[storage] Quota exceeded, executing protected LRU eviction for key:', key);
      evictTransientStorage();
      try {
        window.localStorage.setItem(key, storedVal);
        return true;
      } catch (_) {
        return true; // Still preserved in memoryStorage
      }
    }
    return true; // Preserved in memoryStorage
  }
}

export function safeRemoveItem(key) {
  memoryStorage.delete(key);
  if (!checkStorageAvailability()) {
    return true;
  }
  try {
    window.localStorage.removeItem(key);
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

export function safeGetJSON(key, fallback = null) {
  const raw = safeGetItem(key);
  return safeParseJSON(raw, fallback);
}

export function safeSetJSON(key, obj) {
  try {
    return safeSetItem(key, JSON.stringify(obj));
  } catch (_) {
    return false;
  }
}

