/**
 * 🩺 Dr. CAT — Persistent Activity & AI Telemetry Logger
 * 
 * Captures console logs, AI operations, PDF parsing, and errors to disk in logs/
 * while preserving clean real-time terminal stdout.
 */

const fs = require('fs');
const path = require('path');

const LOGS_DIR = path.join(__dirname, '..', '..', 'logs');
const SERVER_LOG = path.join(LOGS_DIR, 'server-out.log');
const AI_LOG = path.join(LOGS_DIR, 'ai_operations.log');

function ensureLogsDir() {
  if (!fs.existsSync(LOGS_DIR)) {
    fs.mkdirSync(LOGS_DIR, { recursive: true });
  }
}

function getFormattedTimestamp() {
  const d = new Date();
  return d.toISOString().replace('T', ' ').slice(0, 19);
}

function formatLogMessage(args) {
  return args.map(a => {
    if (typeof a === 'object' && a !== null) {
      try { return JSON.stringify(a); } catch (_) { return String(a); }
    }
    return String(a);
  }).join(' ');
}

function initActivityLogger() {
  ensureLogsDir();

  const originalLog = console.log;
  const originalError = console.error;
  const originalWarn = console.warn;

  console.log = function(...args) {
    originalLog.apply(console, args);
    try {
      const msg = formatLogMessage(args);
      const line = `[${getFormattedTimestamp()}] [INFO] ${msg}\n`;
      fs.appendFileSync(SERVER_LOG, line, 'utf8');

      if (msg.includes('AI') || msg.includes('Slice') || msg.includes('PDF') || msg.includes('Extractor') || msg.includes('CAT')) {
        fs.appendFileSync(AI_LOG, line, 'utf8');
      }
    } catch (_) {}
  };

  console.error = function(...args) {
    originalError.apply(console, args);
    try {
      const msg = formatLogMessage(args);
      const line = `[${getFormattedTimestamp()}] [ERROR] ${msg}\n`;
      fs.appendFileSync(SERVER_LOG, line, 'utf8');
      fs.appendFileSync(path.join(LOGS_DIR, 'server-err.log'), line, 'utf8');
    } catch (_) {}
  };

  console.warn = function(...args) {
    originalWarn.apply(console, args);
    try {
      const msg = formatLogMessage(args);
      const line = `[${getFormattedTimestamp()}] [WARN] ${msg}\n`;
      fs.appendFileSync(SERVER_LOG, line, 'utf8');
    } catch (_) {}
  };
}

module.exports = {
  initActivityLogger,
  LOGS_DIR,
  SERVER_LOG,
  AI_LOG
};
