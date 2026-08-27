/**
 * Automated Test Suite — Telemetry & Crash Reporting System
 */

const http = require('http');
const fs = require('fs');
const { spawn } = require('child_process');
const path = require('path');
const assert = require('assert');

const ROOT = path.join(__dirname, '..');
const PORT = '3198';
const BASE = `http://127.0.0.1:${PORT}`;

function req(method, reqPath, body, headers = {}) {
  return new Promise((resolve, reject) => {
    const url = new URL(reqPath, BASE);
    const opts = {
      hostname: url.hostname,
      port: url.port,
      path: url.pathname + url.search,
      method,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'x-app-key': 'drcat_pub_2f7a91c4e8',
        ...headers
      }
    };
    const r = http.request(opts, res => {
      let d = '';
      res.on('data', c => d += c);
      res.on('end', () => {
        try { resolve({ status: res.statusCode, body: JSON.parse(d) }); }
        catch { resolve({ status: res.statusCode, body: d }); }
      });
    });
    r.on('error', reject);
    if (body && method !== 'GET') r.write(JSON.stringify(body));
    r.end();
  });
}

async function runTests() {
  console.log('\n╔════════════════════════════════════════════════════════════╗');
  console.log('║        🚨 TEST SUITE — TELEMETRY & CRASH REPORTING         ║');
  console.log('╚════════════════════════════════════════════════════════════╝\n');

  let serverProcess = null;
  const PASSWORD_FILE = path.join(ROOT, 'admin_password.txt');
  let originalPasswordContent = '';
  
  if (fs.existsSync(PASSWORD_FILE)) {
    originalPasswordContent = fs.readFileSync(PASSWORD_FILE, 'utf-8');
  }
  
  const tempPassword = 'test-telemetry-pass-999';
  fs.writeFileSync(PASSWORD_FILE, tempPassword, 'utf-8');

  function cleanup() {
    if (serverProcess) {
      try { serverProcess.kill('SIGKILL'); } catch (_) {}
    }
    if (originalPasswordContent) {
      fs.writeFileSync(PASSWORD_FILE, originalPasswordContent, 'utf-8');
    } else {
      try { fs.unlinkSync(PASSWORD_FILE); } catch (_) {}
    }
  }

  process.on('exit', cleanup);
  process.on('SIGINT', () => { cleanup(); process.exit(1); });
  process.on('SIGTERM', () => { cleanup(); process.exit(1); });

  console.log('Starting test server for Telemetry on port', PORT);
  serverProcess = spawn('node', ['server.js'], {
    cwd: ROOT,
    stdio: ['pipe', 'pipe', 'pipe'],
    env: { ...process.env, NODE_ENV: 'test', PORT: PORT }
  });

  let serverReady = false;
  const onData = (data) => {
    const text = data.toString();
    if (text.includes('Local Access:') || text.includes('Clinical Assistant') || text.includes('Dr. CAT')) {
      serverReady = true;
    }
  };
  serverProcess.stdout.on('data', onData);
  serverProcess.stderr.on('data', onData);

  for (let i = 0; i < 60; i++) {
    await new Promise(r => setTimeout(r, 500));
    if (serverReady) break;
  }

  if (!serverReady) {
    console.error('❌ Server failed to start in time');
    cleanup();
    process.exit(1);
  }

  let totalPassed = 0;
  function check(label, condition) {
    if (condition) {
      console.log('  ✅ [PASS]', label);
      totalPassed++;
    } else {
      console.error('  ❌ [FAIL]', label);
      cleanup();
      process.exit(1);
    }
  }

  try {
    // 1. Submit Startup Crash Report (Public)
    console.log('\n📡 1. ENVOI D\'UN RAPPORT DE CRASH AU DÉMARRAGE (PUBLIC) :');
    const crashPayload = {
      type: 'startup_crash',
      error: 'ReferenceError: setupMutationObserver is not defined',
      stack: 'ReferenceError: setupMutationObserver is not defined\n at version-checker.js:355:3',
      appVersion: '1.15.2',
      device: {
        model: 'Xiaomi 12T Pro',
        appMode: 'Android APK',
        screen: '1080x2400',
        online: true
      },
      installId: 'inst_test_123',
      logs: [
        { timestamp: '14:00:01', level: 'info', message: 'Booting Dr.CAT' },
        { timestamp: '14:00:02', level: 'error', message: 'Uncaught ReferenceError' }
      ]
    };

    const resCrash = await req('POST', '/api/telemetry', crashPayload);
    check('POST /api/telemetry (Startup Crash) → 200 OK', resCrash.status === 200 && resCrash.body.success === true);
    const firstReportId = resCrash.body.id;
    const fingerprint = resCrash.body.fingerprint;
    check('Telemetry report ID and fingerprint generated', typeof firstReportId === 'string' && typeof fingerprint === 'string');

    // 2. Submit duplicate error with same fingerprint (Deduplication & Aggregation Test)
    console.log('\n🔄 2. TEST D\'AGRÉGATION & COMPTEUR D\'OCCURRENCES (DÉDUPLICATION) :');
    const resDup = await req('POST', '/api/telemetry', { ...crashPayload, fingerprint });
    check('POST /api/telemetry doublon retourne le même incident ID', resDup.body.id === firstReportId);

    // Burst 19 more to trigger 'critical' / Panne Globale switch
    for (let i = 0; i < 19; i++) {
      await req('POST', '/api/telemetry', { ...crashPayload, fingerprint });
    }
    console.log('  ⚡ 20 occurrences envoyées pour cet incident');

    // 3. Submit User Debug Log Report
    console.log('\n📱 3. ENVOI D\'UN RAPPORT DE LOGS DEPUIS LA DEBUG CONSOLE :');
    const debugPayload = {
      type: 'user_report',
      error: 'Problème d\'affichage PDF',
      logs: [
        { timestamp: '14:05:00', level: 'warn', message: 'PDF rendering slow' },
        { timestamp: '14:05:02', level: 'info', message: 'Retrying page 2' }
      ],
      userNote: 'Le PDF blepharite ne charge pas sur Poco F6',
      device: { model: 'Poco F6', appMode: 'PWA' }
    };

    const resDebug = await req('POST', '/api/telemetry', debugPayload);
    check('POST /api/telemetry (Debug Log) → 200 OK', resDebug.status === 200 && resDebug.body.success === true);
    const secondReportId = resDebug.body.id;

    // 4. Test Access Control on Admin Endpoints
    console.log('\n🔒 4. TEST DE PROTECTION DES ENDPOINTS ADMIN TELEMETRY :');
    const resUnauth = await req('GET', '/api/admin/telemetry');
    check('GET /api/admin/telemetry sans token → 403 Forbidden', resUnauth.status === 403);

    // 5. Admin Login to inspect reports
    console.log('\n🔑 5. CONSULTATION DES RAPPORTS PAR L\'ADMINISTRATEUR :');
    const loginRes = await req('POST', '/api/login', { password: tempPassword });
    const adminToken = loginRes.body && (loginRes.body.token || loginRes.body.sessionToken);
    check('Admin login token received', typeof adminToken === 'string');

    const resReports = await req('GET', '/api/admin/telemetry', null, { 'x-admin-token': adminToken });
    check('GET /api/admin/telemetry (Admin Authentifié) → 200 OK', resReports.status === 200 && resReports.body.success === true);
    check('Liste des rapports contient exactement 2 groupes d\'incidents distincts', Array.isArray(resReports.body.reports) && resReports.body.reports.length === 2);

    // Verify report aggregation contents
    const foundCrash = resReports.body.reports.find(r => r.id === firstReportId);
    check('Rapport de crash Xiaomi 12T Pro retrouvé avec 21 occurrences', !!foundCrash && foundCrash.occurrences === 21);
    check('Sévérité automatiquement basculée à "critical" (🔴 Panne Globale)', foundCrash && foundCrash.severity === 'critical');
    check('Compteur appareils touchés présent (Xiaomi 12T Pro: 21)', foundCrash && foundCrash.affectedDevices && foundCrash.affectedDevices['Xiaomi 12T Pro'] === 21);

    // 6. Delete single report
    console.log('\n🗑️ 6. SUPPRESSION D\'UN RAPPORT INDIVIDUEL :');
    const delRes = await req('DELETE', `/api/admin/telemetry/${firstReportId}`, null, { 'x-admin-token': adminToken });
    check('DELETE /api/admin/telemetry/:id → 200 OK', delRes.status === 200 && delRes.body.success === true);

    // 6. Clear all reports
    console.log('\n🧹 6. VIDAGE COMPLET DES RAPPORTS :');
    const clearRes = await req('DELETE', '/api/admin/telemetry/all', null, { 'x-admin-token': adminToken });
    check('DELETE /api/admin/telemetry/all → 200 OK', clearRes.status === 200 && clearRes.body.success === true);

    const checkRes = await req('GET', '/api/admin/telemetry', null, { 'x-admin-token': adminToken });
    check('Vérification : 0 rapports restants après vidage', checkRes.body.reports && checkRes.body.reports.length === 0);

    console.log('\n════════════════════════════════════════════════════════════');
    console.log(`📊 RÉSULTAT : ${totalPassed} Tests passés avec succès, 0 Échecs`);
    console.log('════════════════════════════════════════════════════════════\n');

  } catch (err) {
    console.error('❌ Test execution error:', err);
    cleanup();
    process.exit(1);
  } finally {
    cleanup();
    process.exit(0);
  }
}

runTests();
