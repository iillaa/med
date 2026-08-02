const fs = require('fs');
const path = require('path');
const { safeWriteJsonAsync } = require('./data-store');

const DEVICES_FILE = path.join(__dirname, '..', 'data', 'active_devices.json');

// In-Memory Device Map for fast O(1) tracking
const deviceMap = new Map();
let isDirty = false;

// Load persisted device data on boot
function loadDeviceStore() {
  try {
    if (fs.existsSync(DEVICES_FILE)) {
      const data = fs.readFileSync(DEVICES_FILE, 'utf-8');
      const parsed = JSON.parse(data);
      const devices = parsed.devices || {};
      for (const [id, dev] of Object.entries(devices)) {
        deviceMap.set(id, dev);
      }
      console.log(`[ActiveDevices] Loaded ${deviceMap.size} device records from store.`);
    }
  } catch (err) {
    console.error('[ActiveDevices] Error loading device store:', err.message);
  }
}

// Debounced Disk Persistence (saves every 10 seconds if dirty)
// Also prunes devices inactive for more than 90 days to prevent unbounded memory growth.
setInterval(async () => {
  if (!isDirty) return;
  try {
    const NINETY_DAYS_MS = 90 * 24 * 60 * 60 * 1000;
    const now = Date.now();
    let pruned = 0;

    for (const [id, dev] of deviceMap.entries()) {
      const lastSeen = new Date(dev.lastSeen).getTime() || 0;
      if (now - lastSeen > NINETY_DAYS_MS) {
        deviceMap.delete(id);
        pruned++;
      }
    }
    if (pruned > 0) {
      console.log(`[ActiveDevices] Pruned ${pruned} inactive device(s) (>90 days).`);
    }

    const devicesObj = {};
    for (const [id, dev] of deviceMap.entries()) {
      devicesObj[id] = dev;
    }
    await safeWriteJsonAsync(DEVICES_FILE, {
      devices: devicesObj,
      lastUpdated: new Date().toISOString()
    });
    isDirty = false;
  } catch (err) {
    console.error('[ActiveDevices] Error persisting devices to disk:', err.message);
  }
}, 10 * 1000);

// Initialize store on startup
loadDeviceStore();

const { isLocalhostConnection } = require('../utils/request');

/**
 * Record or update device activity from incoming HTTP request
 */
function recordDeviceActivity(req) {
  const installId = req.headers['x-install-id'];
  if (!installId || typeof installId !== 'string' || !installId.startsWith('drcat-inst-')) {
    return; // Ignore requests without valid installation ID
  }

  const now = new Date().toISOString();
  const appVersion = req.headers['x-app-version'] || req.query.app_version || '1.5.2';
  const ua = (req.headers['user-agent'] || '').toLowerCase();
  const platform = ua.includes('capacitor') ? 'android_apk' : 'web_pwa';

  const isLocal = isLocalhostConnection(req);
  const hasAdminAuth = !!(req.headers['x-admin-token'] || req.headers['x-api-key'] || req.headers['authorization']);
  const clientIp = req.headers['x-forwarded-for']?.split(',')[0]?.trim() || req.socket?.remoteAddress || '';

  const existing = deviceMap.get(installId) || {
    installId,
    firstSeen: now,
    requestCount: 0
  };

  existing.appVersion = appVersion;
  existing.platform = platform;
  existing.lastSeen = now;
  existing.lastIp = clientIp;
  existing.isAdminDevice = isLocal || hasAdminAuth || !!existing.isAdminDevice;
  existing.requestCount = (existing.requestCount || 0) + 1;

  deviceMap.set(installId, existing);
  isDirty = true;
}

/**
 * Compute Active User Analytics (Total, DAU, MAU, Admin vs External Users)
 */
function getDeviceAnalytics() {
  const now = Date.now();
  const ONE_DAY_MS = 24 * 60 * 60 * 1000;
  const THIRTY_DAYS_MS = 30 * ONE_DAY_MS;

  let totalDevices = 0;
  let adminDevicesCount = 0;
  let externalDevicesCount = 0;
  let dauCount = 0;
  let externalDauCount = 0;
  let mauCount = 0;
  let externalMauCount = 0;

  const versionDistribution = {};
  const platformDistribution = { android_apk: 0, web_pwa: 0 };
  const deviceList = [];

  for (const [id, dev] of deviceMap.entries()) {
    totalDevices++;
    const isAdmin = !!dev.isAdminDevice;
    if (isAdmin) adminDevicesCount++;
    else externalDevicesCount++;

    const lastSeenTime = new Date(dev.lastSeen).getTime() || 0;
    const diffMs = now - lastSeenTime;

    if (diffMs <= ONE_DAY_MS) {
      dauCount++;
      if (!isAdmin) externalDauCount++;
    }
    if (diffMs <= THIRTY_DAYS_MS) {
      mauCount++;
      if (!isAdmin) externalMauCount++;
    }

    const ver = dev.appVersion || 'unknown';
    versionDistribution[ver] = (versionDistribution[ver] || 0) + 1;

    const plat = dev.platform || 'web_pwa';
    platformDistribution[plat] = (platformDistribution[plat] || 0) + 1;

    deviceList.push(dev);
  }

  // Sort device list by lastSeen descending
  deviceList.sort((a, b) => new Date(b.lastSeen).getTime() - new Date(a.lastSeen).getTime());

  return {
    totalDevices,
    adminDevices: adminDevicesCount,
    externalDevices: externalDevicesCount,
    dau: dauCount,
    externalDau: externalDauCount,
    mau: mauCount,
    externalMau: externalMauCount,
    versionDistribution,
    platformDistribution,
    recentDevices: deviceList.slice(0, 50),
    lastUpdated: new Date().toISOString()
  };
}

/**
 * Resets the entire device telemetry store
 */
function resetDeviceStore() {
  deviceMap.clear();
  if (fs.existsSync(DEVICES_FILE)) {
    try {
      fs.unlinkSync(DEVICES_FILE);
    } catch (e) {
      console.warn('[ActiveDevices] Could not delete telemetry file:', e.message);
    }
  }
  isDirty = false;
  console.log('[ActiveDevices] Device telemetry store reset completely.');
  return { success: true, message: 'Télémétrie réinitialisée avec succès.' };
}

module.exports = {
  recordDeviceActivity,
  getDeviceAnalytics,
  resetDeviceStore
};
