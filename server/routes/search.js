const { state: cache } = require('../services/cache');
const { isAdminRequest: checkIsAdmin } = require('../services/auth-service');
const { isLocalhostConnection } = require('../utils/request');
const { logAuditEvent, safeWriteTextAsync, dbLock } = require('../services/data-store');
const { indexPdfs, getIndexStatus } = require('../../index_pdfs');
const path = require('path');
const fs = require('fs');

const PDF_DIR = path.join(__dirname, '..', '..', 'public', 'pdfs');

function registerSearchRoutes(app) {
  app.get('/api/pdfs', async (req, res) => {
    try {
      const exists = await fs.promises.access(PDF_DIR).then(() => true).catch(() => false);
      if (!exists) {
        return res.json([]);
      }
      const files = await fs.promises.readdir(PDF_DIR);
      const pdfs = files.filter(f => f.toLowerCase().endsWith('.pdf') || f.toLowerCase().endsWith('.docx'));
      res.json(pdfs);
    } catch (err) {
      console.error(err);
      res.status(500).json({ error: 'Failed to read PDF directory' });
    }
  });

  app.get('/api/search-pdfs', (req, res) => {
    try {
      const query = req.query.q;
      if (!query || query.trim() === '') {
        return res.json({ results: [] });
      }

      const cleanQuery = query.trim().toLowerCase();
      
      if (!cache.pdfIndex || cache.pdfIndex.length === 0) {
        return res.status(503).json({ error: "PDF index not yet built. Please wait a few moments." });
      }

      const cachedResults = cache.searchCache.get(cleanQuery);
      if (cachedResults) {
        if (global.perfServer) global.perfServer.recordCacheHit();
        return res.json({ results: cachedResults });
      }

      if (global.perfServer) global.perfServer.recordCacheMiss();
      const results = [];

      for (const doc of cache.pdfIndex) {
        if (doc.pdf.toLowerCase().includes(cleanQuery)) {
          results.push({
            pdf: doc.pdf,
            page: 1,
            snippet: "[Titre du fichier correspond] Document de référence disponible."
          });
        }
      }

      for (const doc of cache.pdfIndex) {
        if (!doc.pages) continue;
        for (const p of doc.pages) {
          if (!p.text) continue;

          if (results.some(r => r.pdf === doc.pdf && r.page === p.page)) {
            continue;
          }

          const textLower = p.text.toLowerCase();
          
          const indexMatch = textLower.indexOf(cleanQuery);
          if (indexMatch !== -1) {
            const start = Math.max(0, indexMatch - 60);
            const end = Math.min(p.text.length, indexMatch + cleanQuery.length + 60);
            let snippet = p.text.substring(start, end);
            
            if (start > 0) snippet = '...' + snippet;
            if (end < p.text.length) snippet = snippet + '...';
            
            results.push({
              pdf: doc.pdf,
              page: p.page,
              snippet: snippet
            });

            if (results.length >= 100) {
              break;
            }
          }
        }
        if (results.length >= 100) {
          break;
        }
      }

      if (cache.searchCache.size >= 100) {
        const oldestKey = cache.searchCache.keys().next().value;
        cache.searchCache.delete(oldestKey);
      }
      cache.searchCache.set(cleanQuery, results);

      res.json({ results });
    } catch (err) {
      console.error("Search error:", err);
      res.status(500).json({ error: "Failed to search PDFs" });
    }
  });

  app.get('/api/pdf-index-status', (req, res) => {
    try {
      const statusMap = {};
      for (const doc of cache.pdfIndex) {
        const totalPages = doc.pages ? doc.pages.length : 0;
        const pagesWithText = doc.pages ? doc.pages.filter(p => p.text && p.text.trim().length > 15).length : 0;
        
        let status = 'red';
        if (totalPages > 0) {
          const ratio = pagesWithText / totalPages;
          if (ratio >= 0.90) {
            status = 'green';
          } else if (ratio >= 0.05) {
            status = 'orange';
          }
        }
        statusMap[doc.pdf] = {
          status,
          pagesWithText,
          totalPages
        };
      }
      res.json(statusMap);
    } catch (err) {
      console.error(err);
      res.status(500).json({ error: "Failed to get PDF index status summary" });
    }
  });

  app.get('/api/search-status', (req, res) => {
    try {
      res.json(getIndexStatus());
    } catch (err) {
      console.error(err);
      res.status(500).json({ error: "Failed to get indexing status" });
    }
  });

  // GET /api/pdf-index — returns the full PDF index, or only entries modified
  // after a given timestamp when ?since=<unix_ms> is provided.
  //
  // This enables incremental sync for the Capacitor APK: the client sends the
  // mtime of its bundled pdf_index.json, and the server only returns entries
  // that have changed since then, reducing bandwidth on mobile.
  app.get('/api/pdf-index', (req, res) => {
    try {
      const since = req.query.since ? parseInt(req.query.since, 10) : null;
      let index = cache.pdfIndex;

      if (Number.isFinite(since) && since > 0) {
        // Filter: only return entries whose mtime is newer than `since`.
        // If an entry has no mtime (legacy), include it if the index file
        // itself was modified after `since`.
        index = index.filter(doc => {
          if (doc.mtime && doc.mtime > since) return true;
          return false;
        });
        res.json({ incremental: true, since, count: index.length, entries: index });
      } else {
        res.json({ incremental: false, count: index.length, entries: index });
      }
    } catch (err) {
      console.error(err);
      res.status(500).json({ error: "Failed to get PDF index" });
    }
  });

  app.post('/api/reindex', (req, res) => {
    if (!isLocalhostConnection(req) || !checkIsAdmin(req, cache.activeTokens)) {
      return res.status(403).json({ error: 'Accès interdit.' });
    }
    try {
      indexPdfs(true).catch(err => console.error("Error in forced indexing:", err));
      logAuditEvent('pdf_reindex_triggered', {}, req);
      res.json({ success: true, message: "Reindexing started in background" });
    } catch (err) {
      console.error(err);
      res.status(500).json({ error: "Failed to trigger reindexing" });
    }
  });

  app.post('/api/diagnostics/upload-pdf', async (req, res) => {
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

      await fs.promises.writeFile(targetPath, fileBuffer);
      console.log(`[PDF Upload] Saved ${cleanFilename} to public/pdfs folder.`);

      indexPdfs(true).catch(err => console.error("Error in post-upload indexing:", err));

      logAuditEvent('pdf_upload_triggered', { filename: cleanFilename }, req);
      res.json({ success: true, message: `PDF ${cleanFilename} uploaded and indexing started.` });
    } catch (err) {
      console.error('[PDF Upload Error]', err);
      res.status(500).json({ error: 'Failed to write PDF file to server storage.' });
    }
  });

  app.post('/api/save-css', async (req, res) => {
    if (!isLocalhostConnection(req) || !checkIsAdmin(req, cache.activeTokens)) {
      return res.status(403).json({ error: 'Accès interdit.' });
    }
    try {
      const gap = parseFloat(req.body.gap);
      const maxHeight = parseInt(req.body.maxHeight);
      const ratio = parseFloat(req.body.ratio);
      const padding = parseInt(req.body.padding);
      
      if (isNaN(gap) || isNaN(maxHeight) || isNaN(ratio) || isNaN(padding)) {
        return res.status(400).json({ error: "Layout parameters must be valid numbers" });
      }

      if (gap < 0 || gap > 100 || maxHeight < 100 || maxHeight > 3000 || ratio < 0.1 || ratio > 10 || padding < 0 || padding > 100) {
        return res.status(400).json({ error: "Layout parameters out of safe bounds" });
      }

      const cssPath = path.join(__dirname, '..', '..', 'public', 'style.css');

      await dbLock.acquire(async () => {
        let cssContent = await fs.promises.readFile(cssPath, 'utf-8');

        const startMarker = '/* BEGIN DEV LAYOUT TUNER STYLES */';
        const endMarker = '/* END DEV LAYOUT TUNER STYLES */';
        
        const newDevStyles = `${startMarker}
.dashboard-container {
  padding: ${padding}px;
}
@media (min-width: 851px) {
  .categories-list {
    max-height: ${maxHeight}px;
  }
}
@media (min-width: 851px) {
  .dashboard-content-split {
    grid-template-columns: 1fr ${ratio}fr;
    gap: ${gap}px;
  }
}
${endMarker}`;

        const startIndex = cssContent.indexOf(startMarker);
        if (startIndex !== -1) {
          const endIndex = cssContent.indexOf(endMarker) + endMarker.length;
          cssContent = cssContent.substring(0, startIndex) + newDevStyles.trim() + cssContent.substring(endIndex);
       } else {
          cssContent += '\n\n' + newDevStyles.trim();
        }

        await safeWriteTextAsync(cssPath, cssContent);
        logAuditEvent('css_save', { gap, maxHeight, ratio, padding }, req);
        res.json({ success: true, message: "CSS updated successfully!" });
      });
      
    } catch (err) {
      console.error(err);
      res.status(500).json({ error: "Failed to update CSS file" });
    }
  });
}

module.exports = { registerSearchRoutes };
