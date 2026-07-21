const http = require('http');
const fs = require('fs');
const { spawn } = require('child_process');
const path = require('path');

const ROOT = path.join(__dirname, '..');
const BASE = 'http://127.0.0.1:3000';
const PASSWORD_FILE = path.join(ROOT, 'admin_password.txt');

function req(method, reqPath, body, headers = {}) {
  return new Promise((resolve, reject) => {
    const url = new URL(reqPath, BASE);
    const opts = {
      hostname: url.hostname, port: url.port,
      path: url.pathname + url.search, method,
      headers: { 'Content-Type': 'application/json', 'Accept': 'application/json', ...headers }
    };
    const r = http.request(opts, res => {
      let d = ''; res.on('data', c => d += c); res.on('end', () => {
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
  let serverProcess;
  let originalPassword = '';

  if (fs.existsSync(PASSWORD_FILE)) {
    originalPassword = fs.readFileSync(PASSWORD_FILE, 'utf-8');
  }
  const tempPassword = 'test-sug-pass-123';
  fs.writeFileSync(PASSWORD_FILE, tempPassword, 'utf-8');

  function cleanup() {
    if (serverProcess) {
      try { serverProcess.kill(); } catch (_) {}
    }
    if (originalPassword) {
      fs.writeFileSync(PASSWORD_FILE, originalPassword, 'utf-8');
    } else {
      try { fs.unlinkSync(PASSWORD_FILE); } catch (_) {}
    }
  }

  process.on('exit', cleanup);
  process.on('SIGINT', () => { cleanup(); process.exit(1); });
  process.on('SIGTERM', () => { cleanup(); process.exit(1); });

  console.log('Starting test server for Suggestion Lifecycle...');
  serverProcess = spawn('node', ['server.js'], {
    cwd: ROOT,
    stdio: ['pipe', 'pipe', 'pipe'],
    env: { ...process.env, NODE_ENV: 'test' }
  });

  let serverReady = false;
  serverProcess.stdout.on('data', (data) => {
    if (data.toString().includes('Medical CAT Learning App is running')) {
      serverReady = true;
    }
  });

  for (let i = 0; i < 20; i++) {
    await new Promise(r => setTimeout(r, 500));
    if (serverReady) break;
  }

  if (!serverReady) {
    console.error('Test server failed to start');
    cleanup();
    process.exit(1);
  }

  let passed = 0, failed = 0;
  function check(name, ok) {
    if (ok) { console.log('  ✅ ' + name); passed++; }
    else { console.log('  ❌ ' + name); failed++; }
  }

  console.log('\n💡 Dr. CAT — Full Suggestion Lifecycle Audit\n');

    let tempCatId = null;
    let createdCat = null;
    let token = null;

    try {
      // 1. Admin login
      const login = await req('POST', '/api/login', { password: tempPassword });
      token = login.body && (login.body.token || login.body.sessionToken);
      check('Admin login token received', typeof token === 'string');

      // Create a temporary test CAT specifically for testing edit suggestions (never touch real CAT 1!)
      const tempCatRes = await req('POST', '/api/cats', {
        title: 'Temp Test CAT ' + Date.now(),
        category: 'TestSpecialty',
        summary: 'Original temp summary',
        ordonnance: 'Original temp ordonnance',
        red_flags: 'Temp red flags',
        pdf_keywords: []
      }, { 'x-admin-token': token });
      tempCatId = tempCatRes.body.cat ? tempCatRes.body.cat.id : null;

      // 2. Submit suggestions (as user)
      console.log('1. User submits suggestions on temporary test CAT:');
      const sugAdd = await req('POST', '/api/suggestions', {
        type: 'add',
        data: {
          title: 'Test New CAT ' + Date.now(),
          category: 'Cardiologie',
          summary: 'Initial summary for new CAT',
          ordonnance: 'Initial ordonnance',
          red_flags: 'Chest pain'
        }
      });
      check('POST /api/suggestions (add) → 200', sugAdd.status === 200 && sugAdd.body.success === true);
      const addSugId = sugAdd.body.suggestion ? sugAdd.body.suggestion.id : null;
      check('Suggestion ID returned', typeof addSugId === 'string');

      const sugEdit = await req('POST', '/api/suggestions', {
        type: 'edit',
        catId: tempCatId,
        data: {
          summary: 'Proposed update for temp CAT summary',
          ordonnance: 'Proposed update for temp CAT ordonnance'
        }
      });
      check('POST /api/suggestions (edit) → 200', sugEdit.status === 200 && sugEdit.body.success === true);
      const editSugId = sugEdit.body.suggestion ? sugEdit.body.suggestion.id : null;

      // 3. Admin fetches pending suggestions
      console.log('\n2. Admin fetches pending suggestions:');
      const listRes = await req('GET', '/api/suggestions', null, { 'x-admin-token': token });
      check('GET /api/suggestions → 200', listRes.status === 200 && Array.isArray(listRes.body));
      check('Contains add suggestion', listRes.body.some(s => s.id === addSugId));
      check('Contains edit suggestion', listRes.body.some(s => s.id === editSugId));

      // 4. Admin reviews & edits suggestion
      console.log('\n3. Admin reviews & edits suggestion:');
      const editReviewRes = await req('POST', `/api/suggestions/${addSugId}/edit`, {
        data: {
          summary: 'Corrected summary after admin review',
          ordonnance: 'Corrected ordonnance after admin review'
        }
      }, { 'x-admin-token': token });
      check('POST /api/suggestions/:id/edit → 200', editReviewRes.status === 200 && editReviewRes.body.success === true);
      check('Updated suggestion data persisted', editReviewRes.body.suggestion.data.summary === 'Corrected summary after admin review');

      // 5. Admin approves 'add' suggestion
      console.log('\n4. Admin approves "add" suggestion:');
      const approveAddRes = await req('POST', `/api/suggestions/${addSugId}/approve`, {}, { 'x-admin-token': token });
      check('POST /api/suggestions/:id/approve (add) → 200', approveAddRes.status === 200 && approveAddRes.body.success === true);

      const catsRes = await req('GET', '/api/cats');
      createdCat = catsRes.body.find(c => c.summary === 'Corrected summary after admin review');
      check('New CAT created in cats_db.json', createdCat !== undefined && createdCat.category === 'Cardiologie');

      // 6. Admin approves 'edit' suggestion on temporary test CAT
      console.log('\n5. Admin approves "edit" suggestion on temp CAT:');
      const approveEditRes = await req('POST', `/api/suggestions/${editSugId}/approve`, {}, { 'x-admin-token': token });
      check('POST /api/suggestions/:id/approve (edit) → 200', approveEditRes.status === 200 && approveEditRes.body.success === true);

      const updatedCatsRes = await req('GET', '/api/cats');
      const targetTempCat = updatedCatsRes.body.find(c => c.id === tempCatId);
      check('Temp CAT updated in cats_db.json (Real CATs untouched)', targetTempCat && targetTempCat.summary === 'Proposed update for temp CAT summary');

      // 7. Admin rejects suggestion
      console.log('\n6. Admin rejects suggestion:');
      const sugReject = await req('POST', '/api/suggestions', {
        type: 'edit',
        catId: tempCatId,
        data: { summary: 'Invalid edit suggestion' }
      });
      const rejectSugId = sugReject.body.suggestion.id;

      const rejectRes = await req('POST', `/api/suggestions/${rejectSugId}/reject`, {}, { 'x-admin-token': token });
      check('POST /api/suggestions/:id/reject → 200', rejectRes.status === 200 && rejectRes.body.success === true);

      const listAfterReject = await req('GET', '/api/suggestions', null, { 'x-admin-token': token });
      check('Rejected suggestion removed from list', !listAfterReject.body.some(s => s.id === rejectSugId));

    } catch (err) {
      console.error('Test error:', err);
      failed++;
    } finally {
      // Clean up temporary test CATs created during test regardless of pass/fail
      try {
        if (tempCatId && token) {
          await req('DELETE', `/api/cats/${tempCatId}`, {}, { 'x-admin-token': token });
        }
        if (createdCat && createdCat.id && token) {
          await req('DELETE', `/api/cats/${createdCat.id}`, {}, { 'x-admin-token': token });
        }
      } catch (_) {}
    }

  console.log(`\n==================================================`);
  console.log(`Results: ${passed} passed, ${failed} failed`);
  console.log(`==================================================\n`);

  cleanup();
  process.exit(failed > 0 ? 1 : 0);
}

runTests();
