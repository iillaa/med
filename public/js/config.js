/**
 * Dr. CAT — Application Configuration Constants
 *
 * Single source of truth for tunable parameters. Keeps magic numbers out
 * of the feature modules and makes testing / overrides straightforward.
 */

// ── Network / Fetch ──────────────────────────────────────────
// Capacitor/Android needs tighter timeouts to prevent UI freezes.
const _isCapacitor = !!(
  (typeof window !== 'undefined' && (window.Capacitor || navigator.userAgent.includes('Capacitor')))
);

/** Max time (ms) before an individual fetch() call is aborted. */
export const FETCH_TIMEOUT_MS = _isCapacitor ? 4000 : 10000;

/** Per-server ping timeout during remote reachability checks (ms). */
export const PING_TIMEOUT_MS = 4000;

/** Interval (ms) between background sync polls. */
export const SYNC_INTERVAL_MS = 30000;

/** Max number of background sync retries before giving up. */
export const SYNC_MAX_RETRIES = 3;

/** Delay (ms) between sync retry attempts. */
export const SYNC_RETRY_DELAY_MS = 1200;

// ── Admin / Auth ─────────────────────────────────────────────
/** How often (ms) the active-tokens cleanup runs. */
export const TOKEN_CLEANUP_INTERVAL_MS = 60 * 60 * 1000; // 1 hour

/** How often (ms) stale login-attempt entries are pruned. */
export const LOGIN_ATTEMPT_CLEANUP_MS = 24 * 60 * 60 * 1000; // 24h

// ── UI / Animation ───────────────────────────────────────────
/** Time (ms) after which a "second press to exit" hint expires. */
export const EXIT_ARM_TIMEOUT_MS = 2000;

// ── Performance / Telemetry ──────────────────────────────────
/** Max API timing samples kept per endpoint. */
export const MAX_API_SAMPLES = 100;
/** Max FPS history frames kept. */
export const MAX_FPS_SAMPLES = 60;
/** Max memory snapshots kept. */
export const MAX_MEMORY_SNAPSHOTS = 20;
/** Max telemetry log entries kept. */
export const MAX_PERF_LOGS = 50;
/** How often (ms) to sample memory usage. */
export const MEMORY_SAMPLE_INTERVAL_MS = 10000;

// ── Logging ──────────────────────────────────────────────────
/** Set to true to enable verbose console.log output in production. */
export const DEBUG = (function() {
  try {
    if (typeof process !== 'undefined' && process.env && process.env.DEBUG === 'true') return true;
    if (typeof window !== 'undefined' && window.localStorage && window.localStorage.getItem('drCatDebug') === 'true') return true;
  } catch (_) {}
  return false;
})();
