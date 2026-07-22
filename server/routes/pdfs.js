const fs = require('fs');
const path = require('path');
const { extractPdfData } = require('../pdf_extractor');
const { indexPdfs } = require('../../index_pdfs');
const { isAdminRequest: checkIsAdmin } = require('../services/auth-service');
const { isLocalhostConnection } = require('../utils/request');

const PDF_DIR = path.join(__dirname, '..', '..', 'public', 'pdfs');

function registerPdfRoutes(app, cache) {

  // POST /api/admin/upload-pdf
  app.post('/api/admin/upload-pdf', async (req, res) => {
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

      const targetPath = path.join(PDF_DIR, cleanFilename);
      const fileBuffer = Buffer.from(base64Data, 'base64');
      
      // Ensure PDF directory exists
      if (!fs.existsSync(PDF_DIR)) {
        fs.mkdirSync(PDF_DIR, { recursive: true });
      }

      await fs.promises.writeFile(targetPath, fileBuffer);
      console.log(`[PDF Upload] Saved ${cleanFilename} to public/pdfs folder.`);

      res.json({ success: true, message: `PDF ${cleanFilename} uploaded.` });

      // Run extraction asynchronously in the background so request doesn't hang
      extractPdfData(targetPath)
        .then(async () => {
          console.log(`[Background Task] Extraction finished for ${cleanFilename}. Rebuilding global index...`);
          await indexPdfs(false); // Rebuilds the big JSON file
        })
        .catch(err => {
          console.error(`[Background Task] Extraction failed for ${cleanFilename}`, err);
        });

    } catch (err) {
      console.error('[PDF Upload Error]', err);
      res.status(500).json({ error: 'Failed to write PDF file to server storage.' });
    }
  });

  // GET /api/admin/pdf-lab-parse
  // Used purely by the isolated lab tool to test parsing and get immediate JSON response
  app.post('/api/admin/pdf-lab-parse', async (req, res) => {
    if (!isLocalhostConnection(req) || !checkIsAdmin(req, cache.activeTokens)) {
      return res.status(403).json({ error: 'Accès interdit.' });
    }
    try {
      const { filename, base64Data } = req.body;
      if (!filename || !base64Data) return res.status(400).json({ error: 'Missing data' });

      // Save temporarily for parsing
      const tempPath = path.join(__dirname, '..', '..', 'tmp_' + Date.now() + '.pdf');
      await fs.promises.writeFile(tempPath, Buffer.from(base64Data, 'base64'));

      // Process it completely and await the result (so lab can view it)
      const parseResult = await extractPdfData(tempPath);
      
      // Clean up temp PDF file
      if (fs.existsSync(tempPath)) fs.unlinkSync(tempPath);
      // Also clean up the orphan cache entry that was created for the temp path
      const tempCachePath = path.join(__dirname, '..', '..', 'data', 'pdf_cache', path.basename(tempPath) + '.json');
      if (fs.existsSync(tempCachePath)) fs.unlinkSync(tempCachePath);

      res.json({ success: true, result: parseResult });
    } catch(err) {
      console.error('[Lab Error]', err);
      res.status(500).json({ error: err.message || "Failed to parse PDF in lab" });
    }
  });

  // GET /api/admin/pdf-lab-list
  // Lists all PDFs in the master index with their quality levels
  app.get('/api/admin/pdf-lab-list', (req, res) => {
    if (!isLocalhostConnection(req) || !checkIsAdmin(req, cache.activeTokens)) {
      return res.status(403).json({ error: 'Accès interdit.' });
    }
    try {
      const summary = cache.pdfIndex.map(doc => ({
        pdf: doc.pdf,
        quality: doc.quality || 'offline',
        hash: doc.hash,
        timestamp: doc.timestamp,
        pages: doc.pages ? doc.pages.length : 0
      }));
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

      const targetPath = path.join(PDF_DIR, filename);
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

}

module.exports = { registerPdfRoutes };
