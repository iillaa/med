/**
 * Anonymous Client Installation Identifier Manager
 * Generates and preserves a persistent UUID per app installation.
 */

import { safeGetItem, safeSetItem } from './lib/safeStorage.js';

const INSTALL_ID_KEY = 'dr_cat_install_id';

/**
 * Generate a cryptographically secure UUIDv4 or fallback.
 */
function generateUUID() {
  if (typeof crypto !== 'undefined' && typeof crypto.randomUUID === 'function') {
    return crypto.randomUUID();
  }
  // Fallback RFC4122 v4 generator
  return 'xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx'.replace(/[xy]/g, function (c) {
    const r = (Math.random() * 16) | 0;
    const v = c === 'x' ? r : (r & 0x3) | 0x8;
    return v.toString(16);
  });
}

/**
 * Get or create persistent Installation ID
 */
export function getInstallId() {
  try {
    let installId = safeGetItem(INSTALL_ID_KEY);
    if (!installId) {
      const uuid = (typeof crypto !== 'undefined' && typeof crypto.randomUUID === 'function')
        ? crypto.randomUUID()
        : generateUUID();
      installId = `drcat-inst-${uuid}`;
      safeSetItem(INSTALL_ID_KEY, installId);
      console.log('[InstallID] Generated new anonymous installation ID:', installId);
    }
    return installId;
  } catch (err) {
    console.warn('[InstallID] Storage access warning, using fallback ID:', err);
    return 'drcat-inst-fallback-session';
  }
}

/**
 * Preserve Installation ID during cache/storage purges
 */
export function preserveInstallId(action) {
  try {
    const existingId = safeGetItem(INSTALL_ID_KEY);
    if (typeof action === 'function') {
      action();
    }
    if (existingId) {
      safeSetItem(INSTALL_ID_KEY, existingId);
    }
  } catch (err) {
    console.warn('[InstallID] Error preserving install ID:', err);
  }
}
