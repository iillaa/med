const assert = require('assert');
const { recordDeviceActivity, recordExternalCloudDevices, getDeviceAnalytics } = require('../server/services/active-devices');

console.log('[TestAnalytics] Starting active device analytics unit tests...');

// Mock request 1 (Android APK v1.21.0)
const req1 = {
  headers: {
    'x-install-id': 'drcat-inst-11111111-2222-3333-4444-555555555555',
    'x-app-version': '1.21.0',
    'x-device-platform': 'android_apk',
    'user-agent': 'Mozilla/5.0 (Linux; Android 14; Capacitor)'
  },
  query: {}
};

// Mock request 2 (Android APK v1.20.0)
const req2 = {
  headers: {
    'x-install-id': 'drcat-inst-aaaaaaa-bbbb-cccc-dddd-eeeeeeeeeeee',
    'x-app-version': '1.20.0',
    'x-device-platform': 'android_apk',
    'user-agent': 'Mozilla/5.0 (Linux; Android 13; Capacitor)'
  },
  query: {}
};

// Mock request 3 (Web Browser / PWA)
const req3 = {
  headers: {
    'x-install-id': 'drcat-inst-99999999-8888-7777-6666-555555555555',
    'x-app-version': '1.21.0',
    'x-device-platform': 'web_pwa',
    'user-agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) Chrome/120.0'
  },
  query: {}
};

recordDeviceActivity(req1);
recordDeviceActivity(req2);
recordDeviceActivity(req3);

// Test Cloudflare Edge devices sync merge
const cloudMockDevices = {
  'drcat-inst-cloud-algeria-1': {
    installId: 'drcat-inst-cloud-algeria-1',
    firstSeen: new Date(Date.now() - 3600000).toISOString(),
    lastSeen: new Date().toISOString(),
    appVersion: '1.21.0',
    platform: 'android_apk',
    country: 'DZ',
    city: 'Algiers',
    deviceModel: 'Samsung Galaxy S23',
    requestCount: 5
  },
  'drcat-inst-cloud-france-2': {
    installId: 'drcat-inst-cloud-france-2',
    firstSeen: new Date(Date.now() - 7200000).toISOString(),
    lastSeen: new Date().toISOString(),
    appVersion: '1.21.0',
    platform: 'web_pwa',
    country: 'FR',
    city: 'Paris',
    deviceModel: 'Macintosh',
    requestCount: 12
  }
};

const syncedCount = recordExternalCloudDevices(cloudMockDevices);
assert.strictEqual(syncedCount, 2, 'Should have synced 2 external cloud devices');

const stats = getDeviceAnalytics();

assert.strictEqual(stats.totalDevices >= 5, true, 'Total devices count should be at least 5');
assert.strictEqual(stats.dau >= 5, true, 'DAU count should be at least 5');
assert.strictEqual(stats.mau >= 5, true, 'MAU count should be at least 5');
assert.strictEqual(typeof stats.versionDistribution['1.21.0'], 'number', 'Version distribution for 1.21.0 should be recorded');
assert.strictEqual(typeof stats.versionDistribution['1.20.0'], 'number', 'Version distribution for 1.20.0 should be recorded');
assert.strictEqual(stats.countryDistribution['DZ'] >= 1, true, 'Algeria (DZ) country count should be recorded');
assert.strictEqual(stats.countryDistribution['FR'] >= 1, true, 'France (FR) country count should be recorded');
assert.strictEqual(stats.platformDistribution.android_apk >= 3, true, 'Android APK platform count should be recorded');
assert.strictEqual(stats.platformDistribution.web_pwa >= 2, true, 'Web PWA platform count should be recorded');

console.log('✅ getDeviceAnalytics and recordExternalCloudDevices calculations passed!');
console.log('🎉 ALL DEVICE ANALYTICS TESTS PASSED SUCCESSFULLY!');

