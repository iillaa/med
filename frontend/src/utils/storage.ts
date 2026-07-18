const STORAGE_KEYS = {
  SYNCED_DATABASE: (buildVersion: string) => `dr_cat_synced_database_v${buildVersion}`,
  USER_PROGRESS: 'dr_cat_user_progress',
  LOCAL_OVERRIDES: 'dr_cat_local_overrides',
  CUSTOM_CATS: 'dr_cat_custom_created_cats',
  LEITNER: 'dr_cat_leitner',
  STREAK: 'dr_cat_streak',
  ADMIN_TOKEN: 'dr_cat_admin_token',
  REMOTE_SERVER_URL: 'dr_cat_remote_server_url',
  LAST_COMPILED_URL: 'dr_cat_last_compiled_url',
  LAST_SYNC_TIME: 'dr_cat_last_sync_time',
  FORCE_OFFLINE: 'dr_cat_force_offline',
  NAVIGATION_STATE: 'dr_cat_navigation_state',
  SIDEBAR_COLLAPSED: 'sidebar_controls_collapsed',
  THEME: 'theme'
} as const;

export function getItem<T>(key: string, fallback: T): T {
  try {
    const raw = localStorage.getItem(key);
    if (raw === null) return fallback;
    return JSON.parse(raw) as T;
  } catch {
    return fallback;
  }
}

export function setItem<T>(key: string, value: T): void {
  try {
    localStorage.setItem(key, JSON.stringify(value));
  } catch (e) {
    if (e instanceof Error && (e.name === 'QuotaExceededError' || e.code === 22)) {
      console.warn(`[Storage] Quota exceeded for ${key}, attempting to evict sync cache...`);
      try {
        localStorage.removeItem(STORAGE_KEYS.SYNCED_DATABASE('1'));
      } catch (_) {}
      try {
        localStorage.setItem(key, JSON.stringify(value));
      } catch (_) {
        console.warn(`[Storage] Failed to save ${key} even after eviction.`);
      }
    } else {
      console.warn(`[Storage] Failed to save ${key}:`, e);
    }
  }
}

export function getSyncCacheKey(buildVersion: string): string {
  return STORAGE_KEYS.SYNCED_DATABASE(buildVersion);
}

export { STORAGE_KEYS };
