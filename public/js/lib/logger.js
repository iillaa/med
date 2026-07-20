/**
 * Dr. CAT — Conditional Logger
 *
 * Wraps console.log/warn/error behind a DEBUG flag so verbose output is
 * suppressed in production. Use these exports instead of raw console.* calls
 * throughout the app.
 *
 * DEBUG is controlled by:
 *   - The `DEBUG` constant from config.js (localStorage / env)
 *   - A runtime toggle via `setDebugMode(true/false)`
 */

import { DEBUG as CONFIG_DEBUG } from '../config.js';

let _debugEnabled = CONFIG_DEBUG;

/**
 * Enable or disable debug logging at runtime.
 * @param {boolean} on
 */
export function setDebugMode(on) {
  _debugEnabled = !!on;
}

/**
 * Returns whether debug logging is currently enabled.
 */
export function isDebugEnabled() {
  return _debugEnabled;
}

// ── Logging helpers ──────────────────────────────────────────

/**
 * Conditional console.log — only prints when DEBUG is enabled.
 * @param  {...any} args
 */
export function log(...args) {
  if (_debugEnabled) {
    console.log(...args);
  }
}

/**
 * Conditional console.warn — always prints, but tagged for filtering.
 * @param  {...any} args
 */
export function warn(...args) {
  console.warn(...args);
}

/**
 * Conditional console.error — always prints.
 * @param  {...any} args
 */
export function error(...args) {
  console.error(...args);
}

/**
 * Conditional console.info — only prints when DEBUG is enabled.
 * @param  {...any} args
 */
export function info(...args) {
  if (_debugEnabled) {
    console.info(...args);
  }
}

/**
 * One-shot startup banner — only prints when DEBUG is enabled.
 * @param {string} label
 * @param  {...any} args
 */
export function startup(label, ...args) {
  if (_debugEnabled) {
    console.log(`[${label}]`, ...args);
  }
}
