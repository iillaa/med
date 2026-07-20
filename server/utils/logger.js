/**
 * Dr. CAT — Server-side Conditional Logger
 *
 * Wraps console.log/warn/error behind a DEBUG flag so verbose output
 * is suppressed in production. Controlled via SERVER_DEBUG env var.
 */

const SERVER_DEBUG = process.env.SERVER_DEBUG === 'true' || process.env.DEBUG === 'true';

function _log(level, args) {
  console[level](...args);
}

module.exports = {
  /**
   * Conditional console.log — only prints when SERVER_DEBUG is enabled.
   */
  log(...args) {
    if (SERVER_DEBUG) _log('log', args);
  },

  /**
   * Conditional console.info — only prints when SERVER_DEBUG is enabled.
   */
  info(...args) {
    if (SERVER_DEBUG) _log('info', args);
  },

  /**
   * Always-printed console.warn (deployments need to see warnings).
   */
  warn(...args) {
    _log('warn', args);
  },

  /**
   * Always-printed console.error (deployments need to see errors).
   */
  error(...args) {
    _log('error', args);
  },

  /**
   * One-shot startup banner — only prints when SERVER_DEBUG is enabled.
   */
  startup(label, ...args) {
    if (SERVER_DEBUG) _log('log', [`[${label}]`, ...args]);
  },

  /** Whether debug mode is active. */
  isDebugEnabled: () => SERVER_DEBUG
};
