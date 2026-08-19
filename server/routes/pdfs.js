const fs = require('fs');
const path = require('path');
const { extractPdfData } = require('../pdf_extractor');
const { indexPdfs } = require('../../index_pdfs');
const { isAdminRequest: checkIsAdmin } = require('../services/auth-service');
const { isLocalhostConnection } = require('../utils/request');

const { compressPdfFile } = require('../../scripts/compress_pdfs');

const PDF_MASTERS_DIR = path.join(__dirname, '..', '..', 'data', 'pdf_masters');
const PUBLIC_PDF_DIR = path.join(__dirname, '..', '..', 'public', 'pdfs');

function registerPdfRoutes(app, cache) {
  const express = require('express');
  // Local 50 MB body parser — only for the PDF upload route which receives base64 file data.
  // The global express.json limit is 1 MB; all other routes in this file use the global limit.
  const pdfUploadBodyParser = express.json({ limit: '50mb' });

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
      
      // Rebuild the master index now that the local cache is updated
      await indexPdfs(false);

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
      const { id, pdf } = req.body;
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
      res.json({ success: true, message: `Nettoyage OCR terminé (${cleanedCount} page(s) corrigée(s)).`, doc });
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
      const { id, pdf } = req.body;
      let staging = loadStagingData();
      const initialLen = staging.length;
      staging = staging.filter(d => d.id !== id && d.pdf !== pdf);

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
      const { id, pdf } = req.body;
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
      const stagingPages = [];
      if (extractedText && typeof extractedText === 'string' && extractedText.trim()) {
        const rawPages = extractedText.split(/(?:\n\s*---\s*\n|\n\s*##\s*Page\s*\d+)/i).filter(p => p.trim());
        rawPages.forEach((txt, idx) => {
          stagingPages.push({ page: idx + 1, content: txt.trim() });
        });
      } else {
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

}

module.exports = { registerPdfRoutes };
