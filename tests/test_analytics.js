const assert = require('assert');
const { recordDeviceActivity, getDeviceAnalytics } = require('../server/services/active-devices');

console.log('[TestAnalytics] Starting active device analytics unit tests...');

// Mock request 1 (Android APK v1.1.6)
const req1 = {
  headers: {
    'x-install-id': 'drcat-inst-11111111-2222-3333-4444-555555555555',
    'x-app-version': '1.1.6',
    'user-agent': 'Mozilla/5.0 (Linux; Android 14; Capacitor)'
  },
  query: {}
};

// Mock request 2 (Android APK v1.0.0)
const req2 = {
  headers: {
    'x-install-id': 'drcat-inst-aaaaaaa-bbbb-cccc-dddd-eeeeeeeeeeee',
    'x-app-version': '1.0.0',
    'user-agent': 'Mozilla/5.0 (Linux; Android 13; Capacitor)'
  },
  query: {}
};

// Mock request 3 (Web Browser / PWA)
const req3 = {
  headers: {
    'x-install-id': 'drcat-inst-99999999-8888-7777-6666-555555555555',
    'x-app-version': '1.1.6',
    'user-agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) Chrome/120.0'
  },
  query: {}
};

recordDeviceActivity(req1);
recordDeviceActivity(req2);
recordDeviceActivity(req3);

const stats = getDeviceAnalytics();

assert.strictEqual(stats.totalDevices >= 3, true, 'Total devices count should be at least 3');
assert.strictEqual(stats.dau >= 3, true, 'DAU count should be at least 3');
assert.strictEqual(stats.mau >= 3, true, 'MAU count should be at least 3');
assert.strictEqual(typeof stats.versionDistribution['1.1.6'], 'number', 'Version distribution for 1.1.6 should be recorded');
assert.strictEqual(typeof stats.versionDistribution['1.0.0'], 'number', 'Version distribution for 1.0.0 should be recorded');

console.log('✅ getDeviceAnalytics calculations passed!');
console.log('🎉 ALL DEVICE ANALYTICS TESTS PASSED SUCCESSFULLY!');
