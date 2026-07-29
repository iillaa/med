const assert = require('assert');
const { compareVersions, versionGuardMiddleware } = require('../server/middleware/version-guard');

console.log('[TestVersion] Starting version system unit tests...');

// 1. Test compareVersions function
assert.strictEqual(compareVersions('1.0.0', '1.0.1'), -1, '1.0.0 should be less than 1.0.1');
assert.strictEqual(compareVersions('1.0.1', '1.0.0'), 1, '1.0.1 should be greater than 1.0.0');
assert.strictEqual(compareVersions('1.0.0', '1.0.0'), 0, '1.0.0 should equal 1.0.0');

// CRITICAL TEST: 1.10.0 vs 1.2.0 numeric comparison (must NOT use string comparison)
assert.strictEqual(compareVersions('1.10.0', '1.2.0'), 1, '1.10.0 must be greater than 1.2.0 (numeric comparison check)');
assert.strictEqual(compareVersions('1.2.0', '1.10.0'), -1, '1.2.0 must be less than 1.10.0');
assert.strictEqual(compareVersions('v1.2.0', '1.2.0'), 0, 'v1.2.0 should equal 1.2.0');

console.log('✅ compareVersions numeric tests passed!');

// 2. Test versionGuardMiddleware route exclusion
let nextCalled = false;
const mockReqVersion = { path: '/api/version', headers: {} };
const mockRes = {};
versionGuardMiddleware(mockReqVersion, mockRes, () => { nextCalled = true; });
assert.strictEqual(nextCalled, true, '/api/version must be excluded from version guard');

console.log('✅ versionGuardMiddleware route exclusion test passed!');
console.log('🎉 ALL VERSION TESTS PASSED SUCCESSFULLY!');
