const fs = require('fs');
const path = require('path');

const AUDIT_LOG_FILE = path.join(__dirname, '..', '..', 'audit.log');
const BACKUPS_DIR = path.join(__dirname, '..', '..', 'backups');

class AsyncLock {
  constructor() {
    this.promise = Promise.resolve();
    this.queueDepth = 0;
  }
  acquire(fn) {
    this.queueDepth++;
    const next = this.promise.then(async () => {
      try {
        return await fn();
      } finally {
        this.queueDepth = Math.max(0, this.queueDepth - 1);
      }
    });
    this.promise = next.catch(() => {});
    return next;
  }
  getQueueDepth() {
    return this.queueDepth;
  }
}

const dbLock = new AsyncLock();

async function safeWriteAsync(filePath, content) {
  const tempPath = filePath + '.tmp';
  const backupPath = filePath + '.bak';
  const phases = {};
  try {
    const exists = await fs.promises.access(filePath).then(() => true).catch(() => false);
    if (exists) {
      const copyStart = Date.now();
      await fs.promises.copyFile(filePath, backupPath);
      phases.backup = Date.now() - copyStart;
    }
    const writeStart = Date.now();
    await fs.promises.writeFile(tempPath, content, 'utf-8');
    phases.write = Date.now() - writeStart;
    const renameStart = Date.now();
    await fs.promises.rename(tempPath, filePath);
    phases.rename = Date.now() - renameStart;
    if (global.perfServer) {
      global.perfServer.recordWrite(phases);
    }
  } catch (err) {
    console.error(`[Data Integrity Error] Failed to write atomically to ${filePath}:`, err);
    const tempExists = await fs.promises.access(tempPath).then(() => true).catch(() => false);
    if (tempExists) {
      try { await fs.promises.unlink(tempPath); } catch (_) { /* no-op */ }
    }
    throw err;
  }
}

async function safeWriteJsonAsync(filePath, data) {
  await safeWriteAsync(filePath, JSON.stringify(data, null, 2));
}

async function safeWriteTextAsync(filePath, textContent) {
  await safeWriteAsync(filePath, textContent);
}

async function logAuditEvent(action, details, req) {
  try {
    const timestamp = new Date().toISOString();
    const rawIp = req ? (req.socket.remoteAddress || '').replace(/^::ffff:/, '') : 'system';
    const token = req ? req.headers['x-admin-token'] || 'no-token' : 'system';
    const logLine = JSON.stringify({ timestamp, action, ip: rawIp, token: token.substring(0, 6) + '...', details }) + '\n';
    await fs.promises.appendFile(AUDIT_LOG_FILE, logLine, 'utf-8');
  } catch (err) {
    console.error('[Audit Logger] Failed to write to audit log:', err);
  }
}

async function runDatabaseBackup(dbFile) {
  try {
    const exists = await fs.promises.access(BACKUPS_DIR).then(() => true).catch(() => false);
    if (!exists) {
      await fs.promises.mkdir(BACKUPS_DIR);
    }

    const dbExists = await fs.promises.access(dbFile).then(() => true).catch(() => false);
    if (!dbExists) return;

    const timestamp = new Date().toISOString().replace(/[:.]/g, '-');
    const backupPath = path.join(BACKUPS_DIR, `cats_db_${timestamp}.json`);
    await fs.promises.copyFile(dbFile, backupPath);
    console.log(`[Backup] Automated snapshot created: ${backupPath}`);

    const files = await fs.promises.readdir(BACKUPS_DIR);
    const backupFiles = files
      .filter(f => f.startsWith('cats_db_') && f.endsWith('.json'))
      .map(f => ({ name: f, time: fs.statSync(path.join(BACKUPS_DIR, f)).mtimeMs }))
      .sort((a, b) => b.time - a.time);

    if (backupFiles.length > 10) {
      const toDelete = backupFiles.slice(10);
      for (const file of toDelete) {
        await fs.promises.unlink(path.join(BACKUPS_DIR, file.name));
        console.log(`[Backup] Pruned old backup snapshot: ${file.name}`);
      }
    }
  } catch (err) {
    console.error('[Backup] Automated backup failed:', err);
  }
}

module.exports = {
  dbLock,
  safeWriteJsonAsync,
  safeWriteTextAsync,
  logAuditEvent,
  runDatabaseBackup
};
