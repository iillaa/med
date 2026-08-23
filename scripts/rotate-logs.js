#!/usr/bin/env node
/**
 * Log Rotation Script — Dr.CAT
 * Keeps server-out.log and server-err.log under MAX_SIZE_MB.
 * Run manually or let PM2 trigger on restart.
 * Also prunes rotated archives older than KEEP_DAYS.
 */

const fs = require('fs');
const path = require('path');

const LOGS_DIR = path.join(__dirname, '..', 'logs');
const MAX_SIZE_MB = 10;
const KEEP_DAYS = 7;
const FILES_TO_ROTATE = ['server-out.log', 'server-err.log', 'server.log'];

function rotateLogs() {
  const maxBytes = MAX_SIZE_MB * 1024 * 1024;
  const now = Date.now();
  const keepMs = KEEP_DAYS * 24 * 60 * 60 * 1000;
  let rotated = 0;
  let pruned = 0;

  // Rotate oversized active logs
  for (const filename of FILES_TO_ROTATE) {
    const logPath = path.join(LOGS_DIR, filename);
    const rootLogPath = path.join(__dirname, '..', filename);

    for (const p of [logPath, rootLogPath]) {
      if (!fs.existsSync(p)) continue;
      const stat = fs.statSync(p);
      if (stat.size > maxBytes) {
        const ts = new Date().toISOString().replace(/[:.]/g, '-').slice(0, 19);
        const archiveName = filename.replace('.log', '') + `-${ts}.log`;
        const archivePath = path.join(LOGS_DIR, archiveName);
        fs.renameSync(p, archivePath);
        fs.writeFileSync(p, '', 'utf8'); // Create fresh empty log
        console.log(`[LogRotate] Rotated ${filename} (${(stat.size / 1024 / 1024).toFixed(1)} MB) → ${archiveName}`);
        rotated++;
      }
    }
  }

  // Prune archives older than KEEP_DAYS
  if (fs.existsSync(LOGS_DIR)) {
    for (const f of fs.readdirSync(LOGS_DIR)) {
      const fp = path.join(LOGS_DIR, f);
      const stat = fs.statSync(fp);
      if (now - stat.mtimeMs > keepMs && f !== 'server-out.log' && f !== 'server-err.log') {
        fs.unlinkSync(fp);
        console.log(`[LogRotate] Pruned old archive: ${f}`);
        pruned++;
      }
    }
  }

  if (rotated === 0 && pruned === 0) {
    console.log('[LogRotate] All logs within limits. Nothing to do.');
  } else {
    console.log(`[LogRotate] Done — ${rotated} rotated, ${pruned} pruned.`);
  }
}

rotateLogs();
