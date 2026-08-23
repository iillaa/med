const fs = require('fs');
const path = require('path');
const { extractPdfData } = require('../pdf_extractor');
const { indexPdfs, syncPublicDataAssets } = require('../../index_pdfs');
const { isAdminRequest: checkIsAdmin } = require('../services/auth-service');
const { isLocalhostConnection } = require('../utils/request');

const { compressPdfFile, processAllPdfs } = require('../../scripts/compress_pdfs');

const PDF_MASTERS_DIR = path.join(__dirname, '..', '..', 'data', 'pdf_masters');
const PUBLIC_PDF_DIR = path.join(__dirname, '..', '..', 'public', 'pdfs');
const INDEX_FILE = path.join(__dirname, '..', '..', 'pdf_index.json');

function registerPdfRoutes(app, cache) {
  const express = require('express');
  // Local 50 MB body parser — only for the PDF upload route which receives base64 file data.
  // The global express.json limit is 1 MB; all other routes in this file use the global limit.
  const pdfUploadBodyParser = express.json({ limit: '50mb' });

  // GET /api/admin/master-pdf
  // Streams pristine uncompressed Master PDF (from data/pdf_masters/) directly for high-resolution visual slicing
  app.get('/api/admin/master-pdf', (req, res) => {
    if (!isLocalhostConnection(req) || !checkIsAdmin(req, cache.activeTokens)) {
      return res.status(403).json({ error: 'Accès interdit.' });
    }
    const filename = req.query.filename;
    if (!filename) {
      return res.status(400).json({ error: 'Paramètre "filename" requis.' });
    }

    const cleanFilename = path.basename(filename);
    const masterPath = path.join(PDF_MASTERS_DIR, cleanFilename);
    const publicPath = path.join(PUBLIC_PDF_DIR, cleanFilename);

    let filePath = null;
    if (fs.existsSync(masterPath)) {
      filePath = masterPath;
    } else if (fs.existsSync(publicPath)) {
      filePath = publicPath;
    }

    if (!filePath) {
      return res.status(404).json({ error: `Master PDF "${cleanFilename}" introuvable.` });
    }

    res.setHeader('Content-Type', 'application/pdf');
    res.setHeader('Content-Disposition', `inline; filename="${cleanFilename}"`);
    fs.createReadStream(filePath).pipe(res);
  });

  // POST /api/admin/compress-all-pdfs
  // Manually runs full dual-pipeline compression on all master PDFs to optimize the public APK bundle
  app.post('/api/admin/compress-all-pdfs', (req, res) => {
    if (!isLocalhostConnection(req) || !checkIsAdmin(req, cache.activeTokens)) {
      return res.status(403).json({ error: 'Accès interdit.' });
    }
    try {
      processAllPdfs();
      res.json({ success: true, message: 'Compression de tous les PDFs pour l\'APK terminée avec succès !' });
    } catch (err) {
      console.error('[Compress All Error]', err);
      res.status(500).json({ error: err.message || 'Erreur lors de la compression des PDFs' });
    }
  });

  // POST /api/admin/compress-pdf
  // Manually compresses a single master PDF into public/pdfs/
  app.post('/api/admin/compress-pdf', (req, res) => {
    if (!isLocalhostConnection(req) || !checkIsAdmin(req, cache.activeTokens)) {
      return res.status(403).json({ error: 'Accès interdit.' });
    }
    try {
      const filename = path.basename(req.body.filename || '');
      if (!filename) return res.status(400).json({ error: 'Filename is required' });

      const masterPath = path.join(PDF_MASTERS_DIR, filename);
      const publicPath = path.join(PUBLIC_PDF_DIR, filename);

      if (!fs.existsSync(masterPath)) {
        return res.status(404).json({ error: `Fichier Master "${filename}" non trouvé.` });
      }

      const savedBytes = compressPdfFile(masterPath, publicPath);
      res.json({ success: true, message: `PDF "${filename}" compressé pour l'APK.`, savedBytes });
    } catch (err) {
      console.error('[Compress PDF Error]', err);
      res.status(500).json({ error: err.message || 'Erreur lors de la compression' });
    }
  });

  // POST /api/admin/upload-pdf
  app.post('/api/admin/upload-pdf', pdfUploadBodyParser, async (req, res) => {
    if (!isLocalhostConnection(req) || !checkIsAdmin(req, cache.activeTokens)) {
      return res.status(403).json({ error: 'Accès interdit.' });
    }
    try {
      const { filename, base64Data } = req.body;
      if (!filename || !base64Data) {
        return res.status(400).json({ error: 'Filename and base64Data are required.' });
      }

      const cleanFilename = path.basename(filename);
      if (!cleanFilename.toLowerCase().endsWith('.pdf')) {
        return res.status(400).json({ error: 'Only PDF files are supported.' });
      }

      const masterPath = path.join(PDF_MASTERS_DIR, cleanFilename);
      const publicPath = path.join(PUBLIC_PDF_DIR, cleanFilename);
      const fileBuffer = Buffer.from(base64Data, 'base64');
      
      if (!fs.existsSync(PDF_MASTERS_DIR)) fs.mkdirSync(PDF_MASTERS_DIR, { recursive: true });
      if (!fs.existsSync(PUBLIC_PDF_DIR)) fs.mkdirSync(PUBLIC_PDF_DIR, { recursive: true });

      await fs.promises.writeFile(masterPath, fileBuffer);
      console.log(`[PDF Upload] Saved master original ${cleanFilename} to data/pdf_masters.`);

      // Auto-compress master original for public web and APK bundling
      compressPdfFile(masterPath, publicPath);

      res.json({ success: true, message: `PDF ${cleanFilename} uploaded and compressed.` });

      // Run extraction asynchronously on master original in background
      extractPdfData(masterPath)
        .then(async () => {
          console.log(`[Background Task] Extraction finished for ${cleanFilename}. Rebuilding global index...`);
          await indexPdfs(false);
        })
        .catch(err => {
          console.error(`[Background Task] Extraction failed for ${cleanFilename}`, err);
        });

    } catch (err) {
      console.error('[PDF Upload Error]', err);
      res.status(500).json({ error: 'Failed to write PDF file to server storage.' });
    }
  });

  // POST /api/admin/delete-pdf
  // Deletes PDF from master folder, public folder, cache, and index
  app.post('/api/admin/delete-pdf', async (req, res) => {
    if (!isLocalhostConnection(req) || !checkIsAdmin(req, cache.activeTokens)) {
      return res.status(403).json({ error: 'Accès interdit.' });
    }
    try {
      const { filename } = req.body;
      if (!filename) return res.status(400).json({ error: 'Filename is required.' });

      const { deletePdfFile } = require('../../scripts/delete_pdf');
      const success = deletePdfFile(filename);
      
      if (success) {
        // Refresh in-memory index cache
        await indexPdfs(false);
        res.json({ success: true, message: `PDF ${filename} deleted successfully.` });
      } else {
        res.status(404).json({ error: `PDF ${filename} not found on server.` });
      }
    } catch (err) {
      console.error('[PDF Delete Error]', err);
      res.status(500).json({ error: 'Failed to delete PDF from server storage.' });
    }
  });

  // POST /api/admin/pdf-lab-parse
  // Used purely by the isolated lab tool to test parsing and get immediate JSON response
  app.post('/api/admin/pdf-lab-parse', async (req, res) => {
    if (!isLocalhostConnection(req) || !checkIsAdmin(req, cache.activeTokens)) {
      return res.status(403).json({ error: 'Accès interdit.' });
    }
    try {
      const { filename, base64Data } = req.body;
      if (!filename || !base64Data) return res.status(400).json({ error: 'Missing data' });

      // Guard against path traversal attacks
      const cleanFilename = path.basename(filename);
      const tempPath = path.join(PDF_MASTERS_DIR, `lab_temp_${cleanFilename}`);
      
      // Save temp PDF file
      const buffer = Buffer.from(base64Data, 'base64');
      fs.writeFileSync(tempPath, buffer);

      try {
        // Process it completely and await the result (so lab can view it)
        const parseResult = await extractPdfData(tempPath);
        res.json({ success: true, result: parseResult });
      } finally {
        // Clean up temp PDF file
        if (fs.existsSync(tempPath)) fs.unlinkSync(tempPath);
        // Also clean up the orphan cache entry that was created for the temp path
        const tempCachePath = path.join(__dirname, '..', '..', 'data', 'pdf_cache', path.basename(tempPath) + '.json');
        if (fs.existsSync(tempCachePath)) fs.unlinkSync(tempCachePath);
      }
    } catch(err) {
      console.error('[Lab Error]', err);
      res.status(500).json({ error: err.message || "Failed to parse PDF in lab" });
    }
  });

  // GET /api/admin/pdf-lab-list
  // Lists all PDFs in the master index with detailed metrics, page stats, and compression savings
  app.get('/api/admin/pdf-lab-list', (req, res) => {
    if (!isLocalhostConnection(req) || !checkIsAdmin(req, cache.activeTokens)) {
      return res.status(403).json({ error: 'Accès interdit.' });
    }
    try {
      const summary = cache.pdfIndex.map(doc => {
        const pages = doc.pages || [];
        let totalWords = 0;
        let totalChars = 0;
        const pageStats = pages.map(p => {
          const content = p.content || p.text || '';
          const chars = content.length;
          const words = content.trim() ? content.trim().split(/\s+/).length : 0;
          totalChars += chars;
          totalWords += words;
          return { page: p.page, chars, words };
        });

        // Compute dual-folder file sizes
        let masterSize = 0;
        let publicSize = 0;
        const masterPath = path.join(PDF_MASTERS_DIR, doc.pdf);
        const publicPath = path.join(PUBLIC_PDF_DIR, doc.pdf);
        try { if (fs.existsSync(masterPath)) masterSize = fs.statSync(masterPath).size; } catch (_) {}
        try { if (fs.existsSync(publicPath)) publicSize = fs.statSync(publicPath).size; } catch (_) {}

        let savedPercent = 0;
        if (masterSize > 0 && publicSize > 0 && publicSize < masterSize) {
          savedPercent = Math.round(((masterSize - publicSize) / masterSize) * 100);
        }

        return {
          pdf: doc.pdf,
          quality: doc.quality || 'offline',
          hash: doc.hash,
          timestamp: doc.timestamp,
          pagesCount: pages.length,
          totalWords,
          totalChars,
          masterSize,
          publicSize,
          savedPercent,
          pageStats,
          tocCount: (doc.toc || []).length,
          toc: doc.toc || []
        };
      });
      res.json({ success: true, files: summary });
    } catch(err) {
      console.error('[Lab Error]', err);
      res.status(500).json({ error: "Failed to list PDFs" });
    }
  });

  // POST /api/admin/pdf-lab-force-extract
  // Forces a LlamaParse/Google re-extraction for a specific file, bypassing cache
  app.post('/api/admin/pdf-lab-force-extract', async (req, res) => {
    if (!isLocalhostConnection(req) || !checkIsAdmin(req, cache.activeTokens)) {
      return res.status(403).json({ error: 'Accès interdit.' });
    }
    try {
      const { filename } = req.body;
      if (!filename) return res.status(400).json({ error: 'Filename required' });

      // Guard against path traversal attacks
      const cleanFilename = path.basename(filename);
      const targetPath = path.join(PDF_MASTERS_DIR, cleanFilename);
      if (!fs.existsSync(targetPath)) {
        return res.status(404).json({ error: 'File not found on server' });
      }

      console.log(`[PDF Lab] Forcing re-extraction for ${filename}...`);
      
      // Process it completely and await the result, forcing cache bypass
      const parseResult = await extractPdfData(targetPath, true);
      
      // Update ONLY this single file in master index and memory cache without triggering a full batch reindex
      if (!Array.isArray(cache.pdfIndex)) {
        try {
          cache.pdfIndex = fs.existsSync(INDEX_FILE) ? JSON.parse(fs.readFileSync(INDEX_FILE, 'utf-8')) : [];
        } catch (_) {
          cache.pdfIndex = [];
        }
      }

      const existingIdx = cache.pdfIndex.findIndex(d => d.pdf === cleanFilename);
      const indexRecord = {
        pdf: cleanFilename,
        specialty: parseResult.specialty || (existingIdx !== -1 ? cache.pdfIndex[existingIdx].specialty : 'Médecine Générale'),
        quality: parseResult.quality || 'offline',
        hash: parseResult.hash || `single_${Date.now()}`,
        timestamp: new Date().toISOString(),
        toc: parseResult.toc || (existingIdx !== -1 ? cache.pdfIndex[existingIdx].toc : []),
        pages: parseResult.pages || []
      };

      if (existingIdx !== -1) {
        cache.pdfIndex[existingIdx] = indexRecord;
      } else {
        cache.pdfIndex.push(indexRecord);
      }

      // Synchronize master index file and public client assets
      await fs.promises.writeFile(INDEX_FILE, JSON.stringify(cache.pdfIndex, null, 2), 'utf-8');
      syncPublicDataAssets(cache.pdfIndex);
      if (cache.searchCache) cache.searchCache.clear();

      res.json({ success: true, result: parseResult });
    } catch(err) {
      console.error('[Lab Error]', err);
      res.status(500).json({ error: err.message || "Failed to force extract PDF" });
    }
  });

  // GET /api/admin/pdf-lab-json
  // Fetches the JSON data for a specific file directly from the memory cache
  app.get('/api/admin/pdf-lab-json', (req, res) => {
    if (!isLocalhostConnection(req) || !checkIsAdmin(req, cache.activeTokens)) {
      return res.status(403).json({ error: 'Accès interdit.' });
    }
    try {
      const filename = req.query.filename;
      if (!filename) return res.status(400).json({ error: 'Filename required' });

      const doc = cache.pdfIndex.find(d => d.pdf === filename);
      if (!doc) return res.status(404).json({ error: 'File not found in index' });

      res.json({ success: true, result: doc });
    } catch(err) {
      console.error('[Lab Error]', err);
      res.status(500).json({ error: "Failed to fetch JSON" });
    }
  });

  // POST /api/admin/save-pdf-toc
  // Saves Human-Indexed Table of Contents (Sommaire GPS) to pdf_index.json
  app.post('/api/admin/save-pdf-toc', async (req, res) => {
    if (!isLocalhostConnection(req) || !checkIsAdmin(req, cache.activeTokens)) {
      return res.status(403).json({ error: 'Accès interdit.' });
    }
    try {
      const { filename, toc } = req.body;
      if (!filename || !Array.isArray(toc)) {
        return res.status(400).json({ error: 'filename and toc array are required.' });
      }

      const doc = cache.pdfIndex.find(d => d.pdf === filename);
      if (!doc) return res.status(404).json({ error: 'File not found in index' });

      // Clean & validate TOC items
      doc.toc = toc
        .filter(item => item && item.title && !isNaN(parseInt(item.page, 10)))
        .map(item => ({
          title: String(item.title).trim(),
          page: parseInt(item.page, 10)
        }));

      const INDEX_FILE = path.join(__dirname, '..', '..', 'pdf_index.json');
      await fs.promises.writeFile(INDEX_FILE, JSON.stringify(cache.pdfIndex, null, 2), 'utf8');
      console.log(`[TOC Indexer] Saved ${doc.toc.length} TOC entries for ${filename}`);

      res.json({ success: true, message: `Sommaire GPS enregistré avec ${doc.toc.length} chapitres.`, toc: doc.toc });
    } catch(err) {
      console.error('[TOC Save Error]', err);
      res.status(500).json({ error: err.message || 'Failed to save TOC' });
    }
  });

  // ══════════════════════════════════════════════════════════════════════════
  // 🧪 TWO-TIER STAGING & INGESTION WORKBENCH (Idea 11)
  // ══════════════════════════════════════════════════════════════════════════

  const STAGING_INDEX_PATH = path.join(__dirname, '..', '..', 'data', 'pdf_staging_index.json');
  const { cleanOcrText } = require('../../cat_db_generator/lib/ocr-cleaner');
  const { searchLocalPDFs } = require('../../cat_db_generator/lib/pdf-extractor');

  function loadStagingData() {
    try {
      if (fs.existsSync(STAGING_INDEX_PATH)) {
        return JSON.parse(fs.readFileSync(STAGING_INDEX_PATH, 'utf8'));
      }
    } catch (_) {}
    return [];
  }

  function saveStagingData(data) {
    const dir = path.dirname(STAGING_INDEX_PATH);
    if (!fs.existsSync(dir)) fs.mkdirSync(dir, { recursive: true });
    fs.writeFileSync(STAGING_INDEX_PATH, JSON.stringify(data, null, 2), 'utf8');
  }

  function auditStagingDoc(doc) {
    const pages = doc.pages || [];
    const hasSpecialty = Boolean(doc.specialty && doc.specialty.trim() !== '');
    const isSingleDoc = pages.length <= 15;
    const hasTOC = Array.isArray(doc.toc) && doc.toc.length > 0;

    let hasMedicalContent = false;
    let totalChars = 0;
    let cutWarningCount = 0;

    for (let i = 0; i < pages.length; i++) {
      const p = pages[i];
      const text = (p.content || '').trim();
      totalChars += text.length;

      // Checks for any clinical / academic substance (diagnosis, signs, treatment, examens, biology, clinic)
      if (/(?:traitement|diagnostic|clinique|signes|examens|posologie|ordonnance|biologie|physiopathologie|étiologie|prise\s+en\s+charge|sympt[oô]mes)/i.test(text)) {
        hasMedicalContent = true;
      }

      if (i < pages.length - 1 && text.length > 300) {
        const lastChar = text.slice(-1);
        if (!['.', '!', '?', ':', ';'].includes(lastChar)) {
          cutWarningCount++;
        }
      }
    }

    let score = 0;
    if (hasSpecialty) score += 30;
    if (hasMedicalContent) score += 30;
    if (totalChars > 150) score += 20;
    if (hasTOC || isSingleDoc) score += 20;

    let grade = 'C';
    if (score >= 70) grade = 'A';
    else if (score >= 50) grade = 'B';

    return {
      score,
      grade,
      checks: {
        hasSpecialty,
        hasMedicalContent,
        isSingleDoc,
        cutWarningCount,
        totalPages: pages.length,
        totalChars
      }
    };
  }

  // GET /api/admin/staging-list
  app.get('/api/admin/staging-list', (req, res) => {
    if (!isLocalhostConnection(req) || !checkIsAdmin(req, cache.activeTokens)) {
      return res.status(403).json({ error: 'Accès interdit.' });
    }
    const staging = loadStagingData().map(doc => ({
      ...doc,
      audit: auditStagingDoc(doc)
    }));
    res.json({ success: true, files: staging });
  });

  // POST /api/admin/staging-save
  app.post('/api/admin/staging-save', (req, res) => {
    if (!isLocalhostConnection(req) || !checkIsAdmin(req, cache.activeTokens)) {
      return res.status(403).json({ error: 'Accès interdit.' });
    }
    try {
      const doc = req.body;
      if (!doc || !doc.pdf) {
        return res.status(400).json({ error: 'Field "pdf" filename is required.' });
      }

      const staging = loadStagingData();
      const existingIdx = staging.findIndex(d => d.pdf === doc.pdf || d.id === doc.id);

      const record = {
        id: doc.id || `staging_${Date.now()}_${Math.random().toString(36).slice(2, 7)}`,
        pdf: doc.pdf,
        specialty: doc.specialty || '',
        quality: doc.quality || 'staging',
        timestamp: doc.timestamp || new Date().toISOString(),
        status: doc.status || 'draft',
        toc: Array.isArray(doc.toc) ? doc.toc : [],
        pages: Array.isArray(doc.pages) ? doc.pages : []
      };

      if (existingIdx >= 0) {
        staging[existingIdx] = record;
      } else {
        staging.unshift(record);
      }

      saveStagingData(staging);
      res.json({ success: true, message: `Fiche de staging ${doc.pdf} enregistrée.`, doc: record, audit: auditStagingDoc(record) });
    } catch (err) {
      console.error('[Staging Save Error]', err);
      res.status(500).json({ error: err.message || 'Failed to save staging document' });
    }
  });

  // POST /api/admin/staging-clean-ocr
  app.post('/api/admin/staging-clean-ocr', (req, res) => {
    if (!isLocalhostConnection(req) || !checkIsAdmin(req, cache.activeTokens)) {
      return res.status(403).json({ error: 'Accès interdit.' });
    }
    try {
      const id = req.body.id || req.body.docId;
      const pdf = req.body.pdf;
      const staging = loadStagingData();
      const doc = staging.find(d => d.id === id || d.pdf === pdf);
      if (!doc) return res.status(404).json({ error: 'Document introuvable dans le staging.' });

      let cleanedCount = 0;
      doc.pages = (doc.pages || []).map(p => {
        const original = p.content || '';
        const cleaned = cleanOcrText(original);
        if (cleaned !== original) cleanedCount++;
        return { ...p, content: cleaned };
      });

      saveStagingData(staging);
      res.json({ success: true, message: `Nettoyage OCR terminé (${cleanedCount} page(s) corrigée(s)).`, doc, cleanedDoc: doc });
    } catch (err) {
      res.status(500).json({ error: err.message || 'Failed to clean OCR in staging' });
    }
  });

  // DELETE /api/admin/staging-delete
  app.post('/api/admin/staging-delete', (req, res) => {
    if (!isLocalhostConnection(req) || !checkIsAdmin(req, cache.activeTokens)) {
      return res.status(403).json({ error: 'Accès interdit.' });
    }
    try {
      const id = req.body.id || req.body.docId;
      const pdf = req.body.pdf || req.body.filename;
      let staging = loadStagingData();
      const initialLen = staging.length;
      staging = staging.filter(d => {
        if (id && d.id === id) return false;
        if (pdf && (d.pdf === pdf || d.filename === pdf)) return false;
        return true;
      });

      if (staging.length === initialLen) {
        return res.status(404).json({ error: 'Document non trouvé dans le staging.' });
      }

      saveStagingData(staging);
      res.json({ success: true, message: 'Document supprimé du staging.' });
    } catch (err) {
      res.status(500).json({ error: err.message || 'Failed to delete from staging' });
    }
  });

  // POST /api/admin/staging-promote
  // Promotes a staging document to the Master Concrete Index (pdf_index.json)
  app.post('/api/admin/staging-promote', async (req, res) => {
    if (!isLocalhostConnection(req) || !checkIsAdmin(req, cache.activeTokens)) {
      return res.status(403).json({ error: 'Accès interdit.' });
    }
    try {
      const id = req.body.id || req.body.docId;
      const pdf = req.body.pdf;
      const staging = loadStagingData();
      const doc = staging.find(d => d.id === id || d.pdf === pdf);
      if (!doc) return res.status(404).json({ error: 'Document introuvable dans le staging.' });

      const audit = auditStagingDoc(doc);
      if (audit.score < 50) {
        return res.status(400).json({
          error: `Qualité insuffisante pour promotion (Score: ${audit.score}/100, Grade: ${audit.grade}). Complétez la spécialité et vérifiez les pages.`
        });
      }

      // Add or replace in master index
      const masterIdx = cache.pdfIndex.findIndex(d => d.pdf === doc.pdf);
      const masterRecord = {
        pdf: doc.pdf,
        specialty: doc.specialty || 'Médecine Générale',
        quality: 'curated_master',
        hash: doc.hash || `master_${Date.now()}`,
        timestamp: new Date().toISOString(),
        toc: doc.toc || [],
        pages: doc.pages || []
      };

      if (masterIdx >= 0) {
        cache.pdfIndex[masterIdx] = masterRecord;
      } else {
        cache.pdfIndex.push(masterRecord);
      }

      // Save to disk
      const INDEX_FILE = path.join(__dirname, '..', '..', 'pdf_index.json');
      const PUBLIC_INDEX_FILE = path.join(__dirname, '..', '..', 'public', 'data', 'pdf_index.json');
      await fs.promises.writeFile(INDEX_FILE, JSON.stringify(cache.pdfIndex, null, 2), 'utf8');
      if (fs.existsSync(path.dirname(PUBLIC_INDEX_FILE))) {
        await fs.promises.writeFile(PUBLIC_INDEX_FILE, JSON.stringify(cache.pdfIndex), 'utf8');
      }

      // Update staging status
      doc.status = 'promoted';
      saveStagingData(staging);

      console.log(`[Promotion] Promoted ${doc.pdf} into Master PDF Index.`);
      res.json({ success: true, message: `✅ ${doc.pdf} promu avec succès dans le Master Index !`, masterRecord });
    } catch (err) {
      console.error('[Staging Promote Error]', err);
      res.status(500).json({ error: err.message || 'Failed to promote staging document' });
    }
  });

  // POST /api/admin/rag-simulate
  // Live RAG Simulator Sandbox endpoint
  app.post('/api/admin/rag-simulate', async (req, res) => {
    if (!isLocalhostConnection(req) || !checkIsAdmin(req, cache.activeTokens)) {
      return res.status(403).json({ error: 'Accès interdit.' });
    }
    try {
      const { query, specialty, maxResults } = req.body;
      if (!query || typeof query !== 'string') {
        return res.status(400).json({ error: 'Query string is required.' });
      }

      const results = await searchLocalPDFs(query, {
        maxResults: maxResults || 5,
        maxMatchesPerFile: 3
      });

      res.json({
        success: true,
        query,
        count: results.length,
        results
      });
    } catch (err) {
      console.error('[RAG Simulate Error]', err);
      res.status(500).json({ error: err.message || 'Failed to simulate RAG' });
    }
  });

  // POST /api/admin/slice-pdf
  // Visual Slicer & Image Cropper endpoint (Idea 6+ / Visual Curation)
  const { PDFDocument } = require('pdf-lib');
  app.post('/api/admin/slice-pdf', pdfUploadBodyParser, async (req, res) => {
    if (!isLocalhostConnection(req) || !checkIsAdmin(req, cache.activeTokens)) {
      return res.status(403).json({ error: 'Accès interdit.' });
    }
    try {
      const { 
        sourceFilename, 
        base64Data, 
        mode, // 'page_range' | 'image_crop'
        startPage, 
        endPage, 
        croppedImageBase64, 
        title, 
        specialty, 
        pathology, 
        extractedText 
      } = req.body;

      if (!title) return res.status(400).json({ error: 'Le titre est obligatoire.' });

      let cleanTitle = path.basename(title).replace(/[^a-zA-Z0-9_\-\.\s]/g, '_').trim();
      if (!cleanTitle.toLowerCase().endsWith('.pdf')) cleanTitle += '.pdf';

      const newMasterPath = path.join(PDF_MASTERS_DIR, cleanTitle);
      const newPublicPath = path.join(PUBLIC_PDF_DIR, cleanTitle);

      let newPdfBuffer = null;

      if (mode === 'image_crop' && croppedImageBase64) {
        // Build a PDF from the cropped canvas image (with safety margin)
        const imgBuffer = Buffer.from(croppedImageBase64.replace(/^data:image\/\w+;base64,/, ''), 'base64');
        const newDoc = await PDFDocument.create();
        const img = await newDoc.embedPng(imgBuffer);
        const page = newDoc.addPage([img.width, img.height]);
        page.drawImage(img, { x: 0, y: 0, width: img.width, height: img.height });
        newPdfBuffer = Buffer.from(await newDoc.save());
      } else if (sourceFilename || base64Data) {
        // Extract pages using pdf-lib
        let srcBuffer = null;
        if (base64Data) {
          srcBuffer = Buffer.from(base64Data, 'base64');
        } else {
          const srcPath = path.join(PDF_MASTERS_DIR, path.basename(sourceFilename));
          if (fs.existsSync(srcPath)) srcBuffer = fs.readFileSync(srcPath);
        }

        if (srcBuffer) {
          const srcDoc = await PDFDocument.load(srcBuffer);
          const newDoc = await PDFDocument.create();
          const totalPages = srcDoc.getPageCount();
          const sPage = Math.max(1, Math.min(parseInt(startPage, 10) || 1, totalPages));
          const ePage = Math.max(sPage, Math.min(parseInt(endPage, 10) || sPage, totalPages));
          
          const pageIndices = [];
          for (let p = sPage - 1; p <= ePage - 1; p++) pageIndices.push(p);

          const copiedPages = await newDoc.copyPages(srcDoc, pageIndices);
          copiedPages.forEach(p => newDoc.addPage(p));
          newPdfBuffer = Buffer.from(await newDoc.save());
        }
      }

      if (newPdfBuffer) {
        if (!fs.existsSync(PDF_MASTERS_DIR)) fs.mkdirSync(PDF_MASTERS_DIR, { recursive: true });
        if (!fs.existsSync(PUBLIC_PDF_DIR)) fs.mkdirSync(PUBLIC_PDF_DIR, { recursive: true });

        await fs.promises.writeFile(newMasterPath, newPdfBuffer);
        compressPdfFile(newMasterPath, newPublicPath);
      }

      // Build staging document record
      const staging = loadStagingData();
      let stagingPages = [];
      if (extractedText && typeof extractedText === 'string' && extractedText.trim()) {
        const rawPages = extractedText.split(/(?:\n\s*---\s*\n|\n\s*##\s*Page\s*\d+)/i).filter(p => p.trim());
        rawPages.forEach((txt, idx) => {
          stagingPages.push({ page: idx + 1, content: txt.trim() });
        });
      } else if (mode === 'page_range' && newPdfBuffer) {
        try {
          const { extractWithOffline } = require('../parsers/extractor_offline');
          const extRes = await extractWithOffline(newMasterPath);
          if (extRes && Array.isArray(extRes.pages) && extRes.pages.length > 0 && extRes.pages.some(p => (p.content || '').trim())) {
            stagingPages = extRes.pages;
          }
        } catch (extErr) {
          console.warn('[Slice PDF] Auto-extraction on sliced vector PDF:', extErr.message);
        }
      }

      if (stagingPages.length === 0) {
        stagingPages.push({
          page: 1,
          content: `# ${title}\n\n**Spécialité :** ${specialty || 'Médecine Générale'}\n**Pathologie :** ${pathology || ''}\n\n[Extrait du document source ${sourceFilename || ''} (Pages ${startPage || 1} à ${endPage || 1})]`
        });
      }

      const stagingDoc = {
        id: `staging_slice_${Date.now()}_${Math.random().toString(36).slice(2, 7)}`,
        pdf: cleanTitle,
        specialty: specialty || 'Médecine Générale',
        pathology: pathology || '',
        quality: 'staging_sliced',
        timestamp: new Date().toISOString(),
        status: 'draft',
        pages: stagingPages
      };

      staging.unshift(stagingDoc);
      saveStagingData(staging);

      res.json({
        success: true,
        message: `Fiche "${cleanTitle}" découpée et enregistrée dans le Staging !`,
        filename: cleanTitle,
        stagingDoc
      });
    } catch (err) {
      console.error('[Slice PDF Error]', err);
      res.status(500).json({ error: err.message || 'Failed to slice PDF' });
    }
  });

  // ══════════════════════════════════════════════════════════════════════════
  // 🤖 AI-ASSISTED SMART SLICER & PATHOLOGY CATALOGER
  // ══════════════════════════════════════════════════════════════════════════
  const SLICED_DIR = path.join(__dirname, '..', '..', 'data', 'pdf_sliced');
  const DONE_DIR = path.join(__dirname, '..', '..', 'data', 'pdf_done');
  const { detectPathologySegments, sanitizeSliceFilename } = require('../parsers/segmenter_ai');

  function ensureCatalogDirs() {
    if (!fs.existsSync(SLICED_DIR)) fs.mkdirSync(SLICED_DIR, { recursive: true });
    if (!fs.existsSync(DONE_DIR)) fs.mkdirSync(DONE_DIR, { recursive: true });
  }

  // POST /api/admin/auto-segment-pdf
  // Uses Gemini 3.6 Flash on pre-extracted cached text to propose smart pathology slices with confidence & coverage
  app.post('/api/admin/auto-segment-pdf', async (req, res) => {
    if (!isLocalhostConnection(req) || !checkIsAdmin(req, cache.activeTokens)) {
      return res.status(403).json({ error: 'Accès interdit.' });
    }
    try {
      const filename = path.basename(req.body.filename || '');
      if (!filename) return res.status(400).json({ error: 'Le nom du fichier est obligatoire.' });

      const result = await detectPathologySegments(filename);
      res.json({
        success: true,
        filename: result.filename,
        totalPages: result.totalPages,
        segments: result.segments,
        coverage: result.coverage
      });
    } catch (err) {
      console.error('[Auto Segment Error]', err);
      res.status(500).json({ error: err.message || 'Échec de la détection IA des pathologies.' });
    }
  });

  // POST /api/admin/auto-slice-execute
  // Executes batch/single vector slicing for approved segments and organizes into data/pdf_sliced/<specialty>/<pathology>/
  app.post('/api/admin/auto-slice-execute', async (req, res) => {
    if (!isLocalhostConnection(req) || !checkIsAdmin(req, cache.activeTokens)) {
      return res.status(403).json({ error: 'Accès interdit.' });
    }
    try {
      ensureCatalogDirs();
      const { sourceFilename, segments, markDone } = req.body;
      if (!sourceFilename || !Array.isArray(segments) || segments.length === 0) {
        return res.status(400).json({ error: 'sourceFilename et un tableau de segments sont obligatoires.' });
      }

      const srcClean = path.basename(sourceFilename);
      const srcPath = path.join(PDF_MASTERS_DIR, srcClean);
      if (!fs.existsSync(srcPath)) {
        return res.status(404).json({ error: `Fichier source "${srcClean}" introuvable dans data/pdf_masters.` });
      }

      const srcBuffer = await fs.promises.readFile(srcPath);
      const srcDoc = await PDFDocument.load(srcBuffer);
      const totalPages = srcDoc.getPageCount();

      // Retrieve cached pages text if available for rich staging metadata
      let cachedPages = [];
      const cacheFile = path.join(__dirname, '..', '..', 'data', 'pdf_cache', `${srcClean}.json`);
      if (fs.existsSync(cacheFile)) {
        try {
          const cached = JSON.parse(await fs.promises.readFile(cacheFile, 'utf8'));
          cachedPages = cached.pages || [];
        } catch (_) {}
      }

      const createdSlices = [];
      const staging = loadStagingData();

      for (const seg of segments) {
        const sPage = Math.max(1, Math.min(parseInt(seg.startPage, 10) || 1, totalPages));
        const ePage = Math.max(sPage, Math.min(parseInt(seg.endPage, 10) || sPage, totalPages));
        const cleanTitle = sanitizeSliceFilename(seg.title || seg.pathology || 'Extrait');
        const specialty = (seg.specialty || 'Médecine Générale').trim();
        const pathology = (seg.pathology || 'Pathologie_Divers').trim();

        // 1. Create Sub-PDF
        const newDoc = await PDFDocument.create();
        const pageIndices = [];
        for (let p = sPage - 1; p <= ePage - 1; p++) pageIndices.push(p);

        const copiedPages = await newDoc.copyPages(srcDoc, pageIndices);
        copiedPages.forEach(p => newDoc.addPage(p));
        const newPdfBuffer = Buffer.from(await newDoc.save());

        // 2. Save in data/pdf_sliced/<specialty>/<pathology>/
        const cleanSpecialtyFolder = (specialty.normalize('NFD').replace(/[\u0300-\u036f]/g, '').replace(/[^a-zA-Z0-9_-]/g, '_').trim() || 'Medecine_Generale');
        const cleanPathologyFolder = (pathology.normalize('NFD').replace(/[\u0300-\u036f]/g, '').replace(/[^a-zA-Z0-9_-]/g, '_').trim() || 'Divers');
        const targetDir = path.join(SLICED_DIR, cleanSpecialtyFolder, cleanPathologyFolder);
        if (!fs.existsSync(targetDir)) fs.mkdirSync(targetDir, { recursive: true });

        const targetPdfPath = path.join(targetDir, cleanTitle);
        const targetMetaPath = path.join(targetDir, cleanTitle.replace(/\.pdf$/i, '.json'));
        await fs.promises.writeFile(targetPdfPath, newPdfBuffer);

        // Also place in public/pdfs and master originals for immediate view & search
        const publicPath = path.join(PUBLIC_PDF_DIR, cleanTitle);
        const masterPath = path.join(PDF_MASTERS_DIR, cleanTitle);
        await fs.promises.writeFile(masterPath, newPdfBuffer);
        compressPdfFile(masterPath, publicPath);

        // 3. Collect slice text pages from source cache
        const slicePages = [];
        for (let p = sPage; p <= ePage; p++) {
          const match = cachedPages.find(cp => (cp.pageNum || cp.page) === p);
          if (match && (match.text || match.content)) {
            slicePages.push({
              page: (p - sPage) + 1,
              content: match.text || match.content
            });
          }
        }

        if (slicePages.length === 0) {
          slicePages.push({
            page: 1,
            content: `# ${pathology}\n\n**Spécialité :** ${specialty}\n**Source :** ${srcClean} (Pages ${sPage} à ${ePage})\n\n${seg.summary || ''}`
          });
        }

        const metaRecord = {
          title: cleanTitle,
          pathology,
          specialty,
          source: srcClean,
          startPage: sPage,
          endPage: ePage,
          pageCount: (ePage - sPage) + 1,
          keyTopics: seg.keyTopics || ['Clinique', 'Traitement'],
          summary: seg.summary || '',
          timestamp: new Date().toISOString(),
          pages: slicePages
        };
        await fs.promises.writeFile(targetMetaPath, JSON.stringify(metaRecord, null, 2), 'utf8');

        // 4. Save into Staging for direct 1-click CAT promotion/generation
        const stagingDoc = {
          id: `staging_slice_${Date.now()}_${Math.random().toString(36).slice(2, 7)}`,
          pdf: cleanTitle,
          specialty,
          pathology,
          quality: 'ai_smart_sliced',
          timestamp: new Date().toISOString(),
          status: 'draft',
          pages: slicePages
        };
        staging.unshift(stagingDoc);

        createdSlices.push({
          title: cleanTitle,
          pathology,
          specialty,
          startPage: sPage,
          endPage: ePage,
          path: targetPdfPath
        });
      }

      saveStagingData(staging);

      // 5. Handle markDone / moving source to data/pdf_done/
      if (markDone) {
        const donePath = path.join(DONE_DIR, srcClean);
        if (fs.existsSync(donePath)) await fs.promises.unlink(donePath);
        await fs.promises.rename(srcPath, donePath);

        // Remove from master active index and update files
        cache.pdfIndex = (cache.pdfIndex || []).filter(d => d.pdf !== srcClean);
        const INDEX_FILE = path.join(__dirname, '..', '..', 'pdf_index.json');
        await fs.promises.writeFile(INDEX_FILE, JSON.stringify(cache.pdfIndex, null, 2), 'utf8');
        syncPublicDataAssets(cache.pdfIndex);
        if (cache.searchCache) cache.searchCache.clear();

        console.log(`[Smart Slicer] Moved processed master "${srcClean}" to data/pdf_done/ and updated index.`);
      }

      res.json({
        success: true,
        message: `${createdSlices.length} segment(s) découpé(s) et classé(s) avec succès !`,
        slices: createdSlices,
        isDone: Boolean(markDone)
      });
    } catch (err) {
      console.error('[Auto Slice Execute Error]', err);
      res.status(500).json({ error: err.message || 'Erreur lors du découpage automatique.' });
    }
  });

  // GET /api/admin/sliced-tree
  // Returns hierarchical tree of organized slices in data/pdf_sliced/
  app.get('/api/admin/sliced-tree', async (req, res) => {
    if (!isLocalhostConnection(req) || !checkIsAdmin(req, cache.activeTokens)) {
      return res.status(403).json({ error: 'Accès interdit.' });
    }
    try {
      ensureCatalogDirs();
      const tree = {};
      let totalSlices = 0;

      if (fs.existsSync(SLICED_DIR)) {
        const specialties = await fs.promises.readdir(SLICED_DIR);
        for (const spec of specialties) {
          const specPath = path.join(SLICED_DIR, spec);
          const specStat = await fs.promises.stat(specPath);
          if (!specStat.isDirectory()) continue;

          tree[spec] = {};
          const pathologies = await fs.promises.readdir(specPath);
          for (const pathol of pathologies) {
            const patholPath = path.join(specPath, pathol);
            const patholStat = await fs.promises.stat(patholPath);
            if (!patholStat.isDirectory()) continue;

            const files = await fs.promises.readdir(patholPath);
            const pdfFiles = files.filter(f => f.toLowerCase().endsWith('.pdf'));
            totalSlices += pdfFiles.length;
            
            tree[spec][pathol] = pdfFiles.map(file => {
              const filePath = path.join(patholPath, file);
              const metaPath = path.join(patholPath, file.replace(/\.pdf$/i, '.json'));
              let meta = null;
              try {
                if (fs.existsSync(metaPath)) meta = JSON.parse(fs.readFileSync(metaPath, 'utf8'));
              } catch (_) {}

              return {
                filename: file,
                size: fs.existsSync(filePath) ? fs.statSync(filePath).size : 0,
                meta
              };
            });
          }
        }
      }

      // Count done files
      let doneCount = 0;
      if (fs.existsSync(DONE_DIR)) {
        const doneFiles = await fs.promises.readdir(DONE_DIR);
        doneCount = doneFiles.filter(f => f.toLowerCase().endsWith('.pdf')).length;
      }

      res.json({ success: true, totalSlices, doneCount, tree });
    } catch (err) {
      console.error('[Sliced Tree Error]', err);
      res.status(500).json({ error: err.message || 'Failed to read sliced catalog tree.' });
    }
  });

  // POST /api/admin/mark-pdf-done
  // Manually moves a processed master PDF into data/pdf_done/
  app.post('/api/admin/mark-pdf-done', async (req, res) => {
    if (!isLocalhostConnection(req) || !checkIsAdmin(req, cache.activeTokens)) {
      return res.status(403).json({ error: 'Accès interdit.' });
    }
    try {
      ensureCatalogDirs();
      const filename = path.basename(req.body.filename || '');
      if (!filename) return res.status(400).json({ error: 'Filename is required' });

      const srcPath = path.join(PDF_MASTERS_DIR, filename);
      const destPath = path.join(DONE_DIR, filename);

      if (!fs.existsSync(srcPath)) {
        return res.status(404).json({ error: `Fichier "${filename}" introuvable dans data/pdf_masters.` });
      }

      if (fs.existsSync(destPath)) await fs.promises.unlink(destPath);
      await fs.promises.rename(srcPath, destPath);

      // Remove from master active index and update files
      const INDEX_FILE = path.join(__dirname, '..', '..', 'pdf_index.json');
      let baseIndex = (Array.isArray(cache.pdfIndex) && cache.pdfIndex.length > 0) ? cache.pdfIndex : [];
      if (baseIndex.length === 0 && fs.existsSync(INDEX_FILE)) {
        try { baseIndex = JSON.parse(await fs.promises.readFile(INDEX_FILE, 'utf8')); } catch (_) {}
      }
      cache.pdfIndex = baseIndex.filter(d => d.pdf !== filename);
      await fs.promises.writeFile(INDEX_FILE, JSON.stringify(cache.pdfIndex, null, 2), 'utf8');
      syncPublicDataAssets(cache.pdfIndex);
      if (cache.searchCache) cache.searchCache.clear();

      res.json({ success: true, message: `PDF "${filename}" déplacé vers data/pdf_done/.` });
    } catch (err) {
      console.error('[Mark PDF Done Error]', err);
      res.status(500).json({ error: err.message || 'Failed to mark PDF as done.' });
    }
  });

  // GET /api/admin/done-pdfs-list
  // Lists all archived master PDFs in data/pdf_done/
  app.get('/api/admin/done-pdfs-list', async (req, res) => {
    if (!isLocalhostConnection(req) || !checkIsAdmin(req, cache.activeTokens)) {
      return res.status(403).json({ error: 'Accès interdit.' });
    }
    try {
      ensureCatalogDirs();
      const files = fs.existsSync(DONE_DIR) ? await fs.promises.readdir(DONE_DIR) : [];
      const pdfFiles = files.filter(f => f.toLowerCase().endsWith('.pdf'));

      const fileList = pdfFiles.map(file => {
        const fullPath = path.join(DONE_DIR, file);
        let size = 0;
        let mtime = new Date();
        try {
          const stat = fs.statSync(fullPath);
          size = stat.size;
          mtime = stat.mtime;
        } catch (_) {}
        return {
          pdf: file,
          size,
          timestamp: mtime.toISOString()
        };
      });

      res.json({ success: true, count: fileList.length, files: fileList });
    } catch (err) {
      console.error('[Done PDFs Error]', err);
      res.status(500).json({ error: err.message || 'Failed to list done PDFs.' });
    }
  });

  // POST /api/admin/restore-pdf-master
  // Moves an archived PDF from data/pdf_done/ back to data/pdf_masters/ and restores its master record
  app.post('/api/admin/restore-pdf-master', async (req, res) => {
    if (!isLocalhostConnection(req) || !checkIsAdmin(req, cache.activeTokens)) {
      return res.status(403).json({ error: 'Accès interdit.' });
    }
    try {
      ensureCatalogDirs();
      const filename = path.basename(req.body.filename || '');
      if (!filename) return res.status(400).json({ error: 'Filename is required' });

      const donePath = path.join(DONE_DIR, filename);
      const masterPath = path.join(PDF_MASTERS_DIR, filename);

      if (!fs.existsSync(donePath)) {
        return res.status(404).json({ error: `Fichier "${filename}" introuvable dans data/pdf_done.` });
      }

      if (fs.existsSync(masterPath)) await fs.promises.unlink(masterPath);
      await fs.promises.rename(donePath, masterPath);

      // Re-index / restore in memory and on disk
      let restoredRecord = null;
      const cacheFile = path.join(__dirname, '..', '..', 'data', 'pdf_cache', `${filename}.json`);
      if (fs.existsSync(cacheFile)) {
        try {
          const cached = JSON.parse(await fs.promises.readFile(cacheFile, 'utf8'));
          restoredRecord = {
            pdf: filename,
            specialty: cached.specialty || 'Médecine Générale',
            quality: cached.quality || 'offline',
            hash: cached.hash || `single_${Date.now()}`,
            timestamp: new Date().toISOString(),
            toc: cached.toc || [],
            pages: cached.pages || []
          };
        } catch (_) {}
      }

      if (!restoredRecord) {
        restoredRecord = {
          pdf: filename,
          specialty: 'Médecine Générale',
          quality: 'offline',
          hash: `restored_${Date.now()}`,
          timestamp: new Date().toISOString(),
          toc: [],
          pages: []
        };
      }

      const INDEX_FILE = path.join(__dirname, '..', '..', 'pdf_index.json');
      let baseIndex = (Array.isArray(cache.pdfIndex) && cache.pdfIndex.length > 0) ? cache.pdfIndex : [];
      if (baseIndex.length === 0 && fs.existsSync(INDEX_FILE)) {
        try { baseIndex = JSON.parse(await fs.promises.readFile(INDEX_FILE, 'utf8')); } catch (_) {}
      }

      cache.pdfIndex = baseIndex.filter(d => d.pdf !== filename);
      cache.pdfIndex.push(restoredRecord);

      await fs.promises.writeFile(INDEX_FILE, JSON.stringify(cache.pdfIndex, null, 2), 'utf8');
      syncPublicDataAssets(cache.pdfIndex);
      if (cache.searchCache) cache.searchCache.clear();

      console.log(`[Smart Slicer] ↩️ Restored "${filename}" to data/pdf_masters/ and active index.`);
      res.json({ success: true, message: `Fichier "${filename}" restauré avec succès dans le Master Corpus !` });
    } catch (err) {
      console.error('[Restore PDF Master Error]', err);
      res.status(500).json({ error: err.message || 'Failed to restore PDF to master corpus.' });
    }
  });

  // POST /api/admin/create-residual-slice
  // Bundles unassigned gap pages into a single reviewable sub-document
  app.post('/api/admin/create-residual-slice', async (req, res) => {
    if (!isLocalhostConnection(req) || !checkIsAdmin(req, cache.activeTokens)) {
      return res.status(403).json({ error: 'Accès interdit.' });
    }
    try {
      const { sourceFilename, uncoveredPages } = req.body;
      if (!sourceFilename || !Array.isArray(uncoveredPages) || uncoveredPages.length === 0) {
        return res.status(400).json({ error: 'sourceFilename et uncoveredPages sont requis.' });
      }

      const srcClean = path.basename(sourceFilename);
      let srcPath = path.join(PDF_MASTERS_DIR, srcClean);
      if (!fs.existsSync(srcPath)) {
        srcPath = path.join(DONE_DIR, srcClean);
      }
      if (!fs.existsSync(srcPath)) {
        return res.status(404).json({ error: `Fichier source "${srcClean}" introuvable.` });
      }

      const srcBuffer = await fs.promises.readFile(srcPath);
      const srcDoc = await PDFDocument.load(srcBuffer);
      const totalPages = srcDoc.getPageCount();

      const validPages = uncoveredPages
        .map(p => parseInt(p, 10))
        .filter(p => p >= 1 && p <= totalPages)
        .sort((a, b) => a - b);

      if (validPages.length === 0) {
        return res.status(400).json({ error: 'Aucune page résiduelle valide.' });
      }

      const newDoc = await PDFDocument.create();
      const pageIndices = validPages.map(p => p - 1);
      const copiedPages = await newDoc.copyPages(srcDoc, pageIndices);
      copiedPages.forEach(p => newDoc.addPage(p));
      const newPdfBuffer = Buffer.from(await newDoc.save());

      const cleanTitle = `${srcClean.replace(/\.pdf$/i, '')}_Pages_Restantes_A_Examiner.pdf`;
      const targetDir = path.join(SLICED_DIR, 'A_Examiner', srcClean.replace(/\.pdf$/i, ''));
      if (!fs.existsSync(targetDir)) fs.mkdirSync(targetDir, { recursive: true });

      const targetPdfPath = path.join(targetDir, cleanTitle);
      await fs.promises.writeFile(targetPdfPath, newPdfBuffer);

      // Also place in public/pdfs and master originals for immediate view & search
      const publicPath = path.join(PUBLIC_PDF_DIR, cleanTitle);
      const masterPath = path.join(PDF_MASTERS_DIR, cleanTitle);
      await fs.promises.writeFile(masterPath, newPdfBuffer);
      compressPdfFile(masterPath, publicPath);

      // Collect slice text pages from source cache
      let cachedPages = [];
      const cacheFile = path.join(__dirname, '..', '..', 'data', 'pdf_cache', `${srcClean}.json`);
      if (fs.existsSync(cacheFile)) {
        try {
          const cached = JSON.parse(await fs.promises.readFile(cacheFile, 'utf8'));
          cachedPages = cached.pages || [];
        } catch (_) {}
      }

      const slicePages = validPages.map((origP, idx) => {
        const match = cachedPages.find(cp => (cp.pageNum || cp.page) === origP);
        return {
          page: idx + 1,
          content: match ? (match.text || match.content) : `[Page originale ${origP} de ${srcClean}]`
        };
      });

      // Save into Staging for direct 2nd-pass human/AI review
      const staging = loadStagingData();
      const stagingDoc = {
        id: `staging_residual_${Date.now()}_${Math.random().toString(36).slice(2, 7)}`,
        pdf: cleanTitle,
        specialty: 'A Examiner',
        pathology: `Pages Restantes (${validPages.join(', ')})`,
        quality: 'residual_pages',
        timestamp: new Date().toISOString(),
        status: 'draft',
        pages: slicePages
      };
      staging.unshift(stagingDoc);
      saveStagingData(staging);

      console.log(`[Smart Slicer] 📦 Created residual review document "${cleanTitle}" with ${validPages.length} pages.`);

      res.json({
        success: true,
        message: `Document résiduel "${cleanTitle}" créé avec ${validPages.length} page(s) et disponible dans le Staging !`,
        filename: cleanTitle,
        pagesCount: validPages.length,
        pages: validPages
      });
    } catch (err) {
      console.error('[Create Residual Slice Error]', err);
      res.status(500).json({ error: err.message || 'Failed to create residual slice.' });
    }
  });

}

module.exports = { registerPdfRoutes };
