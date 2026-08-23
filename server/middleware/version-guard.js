const fs = require('fs');
const path = require('path');

const VERSION_FILE = path.join(__dirname, '..', 'config', 'version.json');

/**
 * Compare two semantic version strings numerically.
 * Returns:
 *   -1 if v1 < v2
 *    0 if v1 === v2
 *    1 if v1 > v2
 */
function compareVersions(v1, v2) {
  if (!v1 || !v2) return 0;
  const parts1 = String(v1).replace(/^v/i, '').split('.').map(n => parseInt(n, 10) || 0);
  const parts2 = String(v2).replace(/^v/i, '').split('.').map(n => parseInt(n, 10) || 0);
  const maxLen = Math.max(parts1.length, parts2.length);
  for (let i = 0; i < maxLen; i++) {
    const p1 = parts1[i] || 0;
    const p2 = parts2[i] || 0;
    if (p1 < p2) return -1;
    if (p1 > p2) return 1;
  }
  return 0;
}

function getVersionConfig() {
  try {
    if (fs.existsSync(VERSION_FILE)) {
      const data = fs.readFileSync(VERSION_FILE, 'utf-8');
      return JSON.parse(data);
    }
  } catch (err) {
    console.error('[VersionGuard] Error reading version.json:', err.message);
  }
  return {
    minVersion: '1.0.0',
    latestVersion: '1.0.0',
    forceUpdateActive: false
  };
}

function versionGuardMiddleware(req, res, next) {
  // 1. Exclude non-guarded routes
  const pathName = (req.path || '').replace(/^\/+/, '/');
  if (
    pathName === '/api/version' ||
    pathName.startsWith('/api/version') ||
    pathName.startsWith('/api/admin/version') ||
    pathName.startsWith('/api/server-providers') ||
    pathName === '/health' ||
    pathName === '/favicon.ico' ||
    pathName === '/capacitor.js' ||
    pathName.startsWith('/data') ||
    pathName.startsWith('/css') ||
    pathName.startsWith('/js') ||
    pathName.startsWith('/download') ||
    !pathName.startsWith('/api/')
  ) {
    return next();
  }

  const { isLocalhostConnection } = require('../utils/request');

  // 0. Exclude Localhost development connections and Admin sessions from 426 version locks
  if (isLocalhostConnection(req) || req.headers['x-admin-token']) {
    return next();
  }

  const config = getVersionConfig();
  if (!config.forceUpdateActive) {
    return next();
  }

  // The Kill Switch targets native mobile app builds (Android APK) which send X-App-Version.
  // Web browser requests serve live server code and do not send X-App-Version.
  const clientVersion = req.headers['x-app-version'] || req.query.app_version;

  if (!clientVersion) {
    return next(); // Allow web browser requests through
  }

  if (compareVersions(clientVersion, config.minVersion) < 0) {
    return res.status(426).json({
      error: 'Upgrade Required',
      forceUpdateRequired: true,
      minVersion: config.minVersion,
      latestVersion: config.latestVersion,
      updateMessage: config.updateMessage || 'Une mise à jour obligatoire de l\'application Android est requise.',
      downloadLinks: config.downloadLinks || {}
    });
  }

  next();
}

module.exports = {
  versionGuardMiddleware,
  compareVersions,
  getVersionConfig
};
