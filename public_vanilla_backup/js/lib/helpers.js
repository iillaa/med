/**
 * Shared helper functions for Dr. CAT
 */

/**
 * Check if a CAT object represents an offline-created entry
 * that should be preserved during server sync operations.
 *
 * @param {Object} c - The CAT object to check
 * @param {Set} [customCatIds=new Set()] - Set of IDs for user-created offline CATs
 * @returns {boolean} True if the CAT is an offline entry
 */
export function isOfflineCat(c, customCatIds = new Set()) {
  return customCatIds.has(c.id) ||
    c.isOffline === true ||
    c.source === 'offline' ||
    (typeof c.id === 'string' && c.id.startsWith('offline-')) ||
    (typeof c.id === 'number' && c.id < 0);
}

/**
 * Merge server-side CAT data with local user progress and overrides.
 * Eliminates duplicate state-merging logic across the codebase.
 *
 * @param {Array} serverCats - CATs from the server
 * @param {Object} localProgress - User progress from localStorage
 * @param {Object} localOverrides - User customizations from localStorage
 * @returns {Array} Merged CAT objects with local state applied
 */
export function mergeCatsWithLocalState(serverCats, localProgress, localOverrides) {
  return serverCats.map(cat => {
    const localEntry = localProgress[cat.id] || {};
    const overrides = localOverrides[cat.id] || {};
    return {
      ...cat,
      status: localEntry.status || 'todo',
      notes: localEntry.notes || '',
      summary: overrides.customSummary || cat.summary,
      customSummary: overrides.customSummary || cat.summary,
      ordonnance: overrides.customOrdonnance || cat.ordonnance,
      customOrdonnance: overrides.customOrdonnance || cat.ordonnance
    };
  });
}
