const http = require('http');
const fs = require('fs');
const { spawn } = require('child_process');
const path = require('path');

const ROOT = path.join(__dirname, '..');
const PORT = process.env.PORT || '3097';
const BASE = `http://127.0.0.1:${PORT}`;

function req(method, reqPath, body, headers = {}) {
  return new Promise((resolve, reject) => {
    const url = new URL(reqPath, BASE);
    const opts = {
      hostname: url.hostname,
      port: url.port,
      path: url.pathname + url.search,
      method,
      headers: { 'Content-Type': 'application/json', 'Accept': 'application/json', ...headers }
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

async function runPdfLabAudit() {
  console.log('\n╔════════════════════════════════════════════════════════════╗');
  console.log('║        🧪 AUDIT COMPLET DES ENDPOINTS DU PDF LAB          ║');
  console.log('╚════════════════════════════════════════════════════════════╝\n');

  const PASSWORD_FILE = path.join(ROOT, 'admin_password.txt');
  let originalPasswordContent = '';
  if (fs.existsSync(PASSWORD_FILE)) {
    originalPasswordContent = fs.readFileSync(PASSWORD_FILE, 'utf-8');
  }

  const testPassword = 'pdf-lab-audit-password-2026';
  fs.writeFileSync(PASSWORD_FILE, testPassword, 'utf-8');

  let serverProcess = null;
  function cleanup() {
    if (serverProcess) {
      try { serverProcess.kill('SIGKILL'); } catch (_) {}
    }
    if (originalPasswordContent) {
      fs.writeFileSync(PASSWORD_FILE, originalPasswordContent, 'utf-8');
    }
  }

  process.on('exit', cleanup);
  process.on('SIGINT', () => { cleanup(); process.exit(1); });

  console.log('🚀 Démarrage du serveur pour l\'audit PDF Lab...');
  serverProcess = spawn('node', ['server.js'], {
    cwd: ROOT,
    stdio: ['pipe', 'pipe', 'pipe'],
    env: { ...process.env, NODE_ENV: 'test', PORT: PORT }
  });

  let serverReady = false;
  serverProcess.stdout.on('data', (d) => {
    const text = d.toString();
    if (text.includes('Local Access:') || text.includes('Clinical Assistant') || text.includes('Dr. CAT') || text.includes('App is running')) serverReady = true;
  });
  serverProcess.stderr.on('data', (d) => console.error('[Server ERR]', d.toString()));

  for (let i = 0; i < 40; i++) {
    await new Promise(r => setTimeout(r, 250));
    if (serverReady) break;
  }

  if (!serverReady) {
    console.error('❌ Impossible de démarrer le serveur de test.');
    cleanup();
    process.exit(1);
  }

  // Get Admin Token locally
  const login = await req('POST', '/api/login', { password: testPassword });
  const token = login.body.token;
  const AUTH_HEADERS = { 'x-admin-token': token };

  let passed = 0, failed = 0;
  function assert(name, condition, extraInfo = '') {
    if (condition) {
      console.log(`  ✅ [PASS] ${name} ${extraInfo ? '(' + extraInfo + ')' : ''}`);
      passed++;
    } else {
      console.log(`  ❌ [FAIL] ${name} ${extraInfo ? '(' + extraInfo + ')' : ''}`);
      failed++;
    }
  }

  console.log('\n📁 1. TESTS DE LECTURE DES LISTES DU PDF LAB :');
  
  const masterList = await req('GET', '/api/admin/pdf-lab-list', null, AUTH_HEADERS);
  assert(
    'GET /api/admin/pdf-lab-list -> 200 OK avec tableau files',
    masterList.status === 200 && Array.isArray(masterList.body?.files),
    `${masterList.body?.files?.length || 0} fichiers master retournés`
  );

  const stagingList = await req('GET', '/api/admin/staging-list', null, AUTH_HEADERS);
  assert(
    'GET /api/admin/staging-list -> 200 OK avec tableau files',
    stagingList.status === 200 && Array.isArray(stagingList.body?.files),
    `${stagingList.body?.files?.length || 0} fiches de staging retournées`
  );

  console.log('\n📄 2. TEST D\'INSPECTION JSON D\'UN PDF :');
  const jsonInspect = await req('GET', '/api/admin/pdf-lab-json?filename=blepharite.pdf', null, AUTH_HEADERS);
  assert(
    'GET /api/admin/pdf-lab-json?filename=blepharite.pdf -> 200 OK avec pages',
    jsonInspect.status === 200 && jsonInspect.body?.result?.pages,
    `Qualité: ${jsonInspect.body?.result?.quality || 'N/A'}, Pages: ${jsonInspect.body?.result?.pages?.length || 0}`
  );

  console.log('\n⚡ 3. TEST DE PARSING OFFLINE VIA LE LAB (/api/admin/pdf-lab-parse) :');
  const samplePdfPath = path.join(ROOT, 'public', 'pdfs', 'blepharite.pdf');
  if (fs.existsSync(samplePdfPath)) {
    const base64Data = fs.readFileSync(samplePdfPath).toString('base64');
    const parseTest = await req('POST', '/api/admin/pdf-lab-parse', {
      filename: 'blepharite_test_lab.pdf',
      base64Data: base64Data
    }, AUTH_HEADERS);

    assert(
      'POST /api/admin/pdf-lab-parse (Extraction Offline) -> 200 OK',
      parseTest.status === 200 && parseTest.body?.success === true && Array.isArray(parseTest.body?.result?.pages),
      `Pages extraites: ${parseTest.body?.result?.pages?.length || 0}, Qualité: ${parseTest.body?.result?.quality}`
    );
  }

  console.log('\n🎯 4. TEST DU SOMMAIRE GPS (TOC) :');
  const saveToc = await req('POST', '/api/admin/save-pdf-toc', {
    filename: 'blepharite.pdf',
    toc: [{ title: 'Définition et Clinique', page: 1 }, { title: 'Traitement Médical', page: 1 }]
  }, AUTH_HEADERS);
  assert(
    'POST /api/admin/save-pdf-toc -> 200 OK',
    saveToc.status === 200 && saveToc.body?.success === true
  );

  console.log('\n🤖 5. TEST DE SIMULATION RAG :');
  const sim = await req('POST', '/api/admin/rag-simulate', {
    query: 'blepharite inflammation traitement'
  }, AUTH_HEADERS);
  assert(
    'POST /api/admin/rag-simulate -> 200 OK avec résultats',
    sim.status === 200 && Array.isArray(sim.body?.results),
    `${sim.body?.results?.length || 0} résultat(s) RAG`
  );

  console.log('\n✂️ 6. TEST DE CRÉATION & CURATION DANS LE STAGING :');
  const stagingSave = await req('POST', '/api/admin/staging-save', {
    pdf: 'test_lab_curation.pdf',
    specialty: 'Infectiologie',
    pages: [{ page: 1, content: 'Amoxici11ine 1g 3x/jour pour pneumopathie' }]
  }, AUTH_HEADERS);
  assert(
    'POST /api/admin/staging-save -> 200 OK',
    stagingSave.status === 200 && stagingSave.body?.doc?.id,
    `Doc ID: ${stagingSave.body?.doc?.id}`
  );

  const docId = stagingSave.body?.doc?.id;
  if (docId) {
    const cleanOcr = await req('POST', '/api/admin/staging-clean-ocr', { docId }, AUTH_HEADERS);
    assert(
      'POST /api/admin/staging-clean-ocr -> 200 OK (Correction OCR)',
      cleanOcr.status === 200 && cleanOcr.body?.success === true,
      `Modifications: ${cleanOcr.body?.cleanedDoc?.pages[0]?.content}`
    );

    const delStaging = await req('POST', '/api/admin/staging-delete', { docId }, AUTH_HEADERS);
    assert(
      'POST /api/admin/staging-delete -> 200 OK (Nettoyage)',
      delStaging.status === 200 && delStaging.body?.success === true
    );
  }

  // Test Markdown (.md) document creation and deletion in staging
  const mdSave = await req('POST', '/api/admin/staging-save', {
    pdf: 'Brucellose_Cours.md',
    specialty: 'Infectiologie',
    format: 'md',
    pages: [{ page: 1, content: '# Brucellose\n\nTraitement : Doxycycline + Rifampicine 6 semaines' }]
  }, AUTH_HEADERS);
  assert(
    'POST /api/admin/staging-save (Fiche Markdown .md) -> 200 OK',
    mdSave.status === 200 && mdSave.body?.doc?.pdf === 'Brucellose_Cours.md',
    `Fiche: ${mdSave.body?.doc?.pdf}`
  );
  if (mdSave.body?.doc?.id) {
    const delMd = await req('POST', '/api/admin/staging-delete', { id: mdSave.body.doc.id }, AUTH_HEADERS);
    assert(
      'POST /api/admin/staging-delete (Suppression Fiche .md) -> 200 OK',
      delMd.status === 200 && delMd.body?.success === true
    );
  }

  console.log('\n🔒 7. TEST D\'ISOLATION DU RE-PARSE UNITAIRE (/api/admin/pdf-lab-force-extract) :');
  const forceExtract = await req('POST', '/api/admin/pdf-lab-force-extract', {
    filename: 'blepharite.pdf'
  }, AUTH_HEADERS);
  assert(
    'POST /api/admin/pdf-lab-force-extract -> 200 OK (Mise à jour isolée sans batch loop)',
    forceExtract.status === 200 && forceExtract.body?.success === true && forceExtract.body?.result?.quality,
    `Qualité: ${forceExtract.body?.result?.quality}`
  );

  console.log('\n✂️ 8. TEST DU VISUAL SLICER AVEC AUTO-EXTRACTION (mode: page_range) :');
  const sliceVector = await req('POST', '/api/admin/slice-pdf', {
    title: 'Test_Blepharite_Vector_Slice.pdf',
    sourceFilename: 'blepharite.pdf',
    mode: 'page_range',
    startPage: 1,
    endPage: 1,
    specialty: 'Ophtalmologie',
    pathology: 'Blepharite Test'
  }, AUTH_HEADERS);
  const sliceText = sliceVector.body?.stagingDoc?.pages?.[0]?.content || '';
  assert(
    'POST /api/admin/slice-pdf (page_range) -> 200 OK avec texte réel extrait',
    sliceVector.status === 200 && sliceVector.body?.success === true && sliceText.length > 20,
    `Taille texte extrait: ${sliceText.length} caractères`
  );

  // Clean up sliced test doc from staging
  if (sliceVector.body?.stagingDoc?.id) {
    await req('POST', '/api/admin/staging-delete', { id: sliceVector.body.stagingDoc.id }, AUTH_HEADERS);
  }

  console.log('\n🗜️ 9. TEST DU STREAMING MASTER PDF ET COMPRESSION APK :');
  const masterPdfStream = await req('GET', '/api/admin/master-pdf?filename=blepharite.pdf', null, AUTH_HEADERS);
  assert(
    'GET /api/admin/master-pdf -> 200 OK (Streaming Master original non compressé)',
    masterPdfStream.status === 200
  );

  const compressSingle = await req('POST', '/api/admin/compress-pdf', { filename: 'blepharite.pdf' }, AUTH_HEADERS);
  assert(
    'POST /api/admin/compress-pdf -> 200 OK (Optimisation unitaire pour APK)',
    compressSingle.status === 200 && compressSingle.body?.success === true
  );

  console.log('\n📦 10. TEST D\'ARCHIVAGE ET RESTAURATION DU MASTER PDF :');
  const archiveRes = await req('POST', '/api/admin/archive-pdf-master', { filename: 'blepharite.pdf' }, AUTH_HEADERS);
  assert(
    'POST /api/admin/archive-pdf-master -> 200 OK (Déplacement dans pdf_done/)',
    archiveRes.status === 200 && archiveRes.body?.success === true
  );

  const restoreRes = await req('POST', '/api/admin/restore-pdf-master', { filename: 'blepharite.pdf' }, AUTH_HEADERS);
  assert(
    'POST /api/admin/restore-pdf-master -> 200 OK (Restauration dans master index)',
    restoreRes.status === 200 && restoreRes.body?.success === true
  );

  console.log(`\n════════════════════════════════════════════════════════════════`);
  console.log(`📊 RÉSULTAT DE L'AUDIT PDF LAB : ${passed} Succès, ${failed} Échecs`);
  console.log(`════════════════════════════════════════════════════════════════\n`);

  cleanup();
  process.exit(failed > 0 ? 1 : 0);
}

runPdfLabAudit().catch(err => {
  console.error('Fatal error in PDF Lab audit:', err);
  process.exit(1);
});
