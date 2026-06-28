const express = require('express');
const fs = require('fs');
const path = require('path');
const crypto = require('crypto');
const { indexPdfs, getIndexStatus, onIndexUpdated } = require('./index_pdfs');

const INDEX_FILE = path.join(__dirname, 'pdf_index.json');
const SUGGESTIONS_FILE = path.join(__dirname, 'suggestions.json');
const DB_FILE = path.join(__dirname, 'cats_db.json');
const PDF_DIR = path.join(__dirname, '.cat-med', 'reference-pdfs');
const PASSWORD_FILE = path.join(__dirname, 'admin_password.txt');

const app = express();
const PORT = 3000;

app.use(express.json());
app.use(express.static(path.join(__dirname, 'public'), {
  etag: false,
  lastModified: false,
  setHeaders: (res, filePath) => {
    // Never cache JS or CSS — always serve fresh during development
    if (filePath.endsWith('.js') || filePath.endsWith('.css')) {
      res.setHeader('Cache-Control', 'no-store, no-cache, must-revalidate');
    }
  }
}));

// Global in-memory caches
let catsCache = [];
let suggestionsCache = [];
let pdfIndex = [];
let adminPassword = '';
const activeTokens = new Set();

// A lightweight asynchronous queue lock to serialize write operations on json databases
class AsyncLock {
  constructor() {
    this.promise = Promise.resolve();
  }
  acquire(fn) {
    const next = this.promise.then(() => fn());
    this.promise = next.catch(() => {});
    return next;
  }
}
const dbLock = new AsyncLock();

// Asynchronous atomic file writes and backups to ensure data integrity
async function safeWriteJsonAsync(filePath, data) {
  const tempPath = filePath + '.tmp';
  const backupPath = filePath + '.bak';
  
  try {
    const jsonString = JSON.stringify(data, null, 2);
    const exists = await fs.promises.access(filePath).then(() => true).catch(() => false);
    if (exists) {
      await fs.promises.copyFile(filePath, backupPath);
    }
    await fs.promises.writeFile(tempPath, jsonString, 'utf-8');
    await fs.promises.rename(tempPath, filePath);
  } catch (err) {
    console.error(`[Data Integrity Error] Failed to write atomically to ${filePath}:`, err);
    const tempExists = await fs.promises.access(tempPath).then(() => true).catch(() => false);
    if (tempExists) {
      try { await fs.promises.unlink(tempPath); } catch (_) {}
    }
    throw err;
  }
}

// Asynchronous atomic file writes and backups for plain text files (like CSS)
async function safeWriteTextAsync(filePath, textContent) {
  const tempPath = filePath + '.tmp';
  const backupPath = filePath + '.bak';
  try {
    const exists = await fs.promises.access(filePath).then(() => true).catch(() => false);
    if (exists) {
      await fs.promises.copyFile(filePath, backupPath);
    }
    await fs.promises.writeFile(tempPath, textContent, 'utf-8');
    await fs.promises.rename(tempPath, filePath);
  } catch (err) {
    console.error(`[Data Integrity Error] Failed to write text atomically to ${filePath}:`, err);
    const tempExists = await fs.promises.access(tempPath).then(() => true).catch(() => false);
    if (tempExists) {
      try { await fs.promises.unlink(tempPath); } catch (_) {}
    }
    throw err;
  }
}


// Initialize admin password on startup
async function initAdminPassword() {
  try {
    const exists = await fs.promises.access(PASSWORD_FILE).then(() => true).catch(() => false);
    if (exists) {
      adminPassword = (await fs.promises.readFile(PASSWORD_FILE, 'utf-8')).trim();
    } else {
      adminPassword = crypto.randomBytes(6).toString('hex'); // Secure 12-character hex password
      await fs.promises.writeFile(PASSWORD_FILE, adminPassword, 'utf-8');
      console.log(`\n=================================================`);
      console.log(`[SECURITY] Generated Admin Password: ${adminPassword}`);
      console.log(`Saved to: ${PASSWORD_FILE}`);
      console.log(`=================================================\n`);
    }
  } catch (err) {
    console.error("Error loading or generating admin password:", err);
  }
}

// Load databases and file indices on server startup
async function initializeData() {
  await initAdminPassword();

  // Load cats_db.json
  try {
    const exists = await fs.promises.access(DB_FILE).then(() => true).catch(() => false);
    if (exists) {
      const content = await fs.promises.readFile(DB_FILE, 'utf-8');
      catsCache = JSON.parse(content);
    } else {
      console.warn(`Database file not found at: ${DB_FILE}`);
    }
  } catch (err) {
    console.error("Error reading cats_db.json cache:", err);
  }

  // Load suggestions.json
  try {
    const exists = await fs.promises.access(SUGGESTIONS_FILE).then(() => true).catch(() => false);
    if (exists) {
      const content = await fs.promises.readFile(SUGGESTIONS_FILE, 'utf-8');
      suggestionsCache = JSON.parse(content);
    } else {
      suggestionsCache = [];
      await safeWriteJsonAsync(SUGGESTIONS_FILE, []);
    }
  } catch (err) {
    console.error("Error reading suggestions.json cache:", err);
  }

  // Load pdf_index.json
  try {
    const exists = await fs.promises.access(INDEX_FILE).then(() => true).catch(() => false);
    if (exists) {
      const content = await fs.promises.readFile(INDEX_FILE, 'utf-8');
      pdfIndex = JSON.parse(content);
    }
  } catch (err) {
    console.error("Error loading pdf_index.json cache:", err);
  }
}

// Register indexer update callback to keep memory index in sync
onIndexUpdated(async () => {
  try {
    const exists = await fs.promises.access(INDEX_FILE).then(() => true).catch(() => false);
    if (exists) {
      const content = await fs.promises.readFile(INDEX_FILE, 'utf-8');
      pdfIndex = JSON.parse(content);
      console.log("[Cache] PDF Index cache reloaded into memory.");
    }
  } catch (err) {
    console.error("Error updating PDF index in memory cache:", err);
  }
});

// Helper to check if the connection comes from the local physical device.
// IMPORTANT: ngrok tunnels all traffic through 127.0.0.1 locally, so we CANNOT
// rely solely on req.socket.remoteAddress. We must inspect X-Forwarded-For first:
//   - If X-Forwarded-For exists and contains a non-local IP → external user (return false)
//   - If X-Forwarded-For exists and all IPs are loopback → treat as local
//   - If no X-Forwarded-For at all → trust the raw socket address
function isLocalhostConnection(req) {
  const LOCAL_IPS = new Set(['127.0.0.1', '::1', '::ffff:127.0.0.1']);

  // 1. Check X-Forwarded-For (set by ngrok, nginx, etc.)
  const forwarded = req.headers['x-forwarded-for'];
  if (forwarded) {
    // The header may contain a comma-separated list; the first entry is the real client IP
    const clientIp = forwarded.split(',')[0].trim();
    const cleanClient = clientIp.replace(/^::ffff:/, '');
    if (!LOCAL_IPS.has(cleanClient) && cleanClient !== 'localhost') {
      // Real remote IP present in forwarding chain → definitely external
      return false;
    }
    // All forwarded IPs appear to be loopback → treat as local
    return true;
  }

  // 2. No forwarding header → trust the raw socket address
  const rawIp = (req.socket.remoteAddress || '').replace(/^::ffff:/, '');
  if (LOCAL_IPS.has(rawIp)) return true;

  // 3. Also match the machine's own LAN interfaces (e.g. direct LAN access without proxy)
  const os = require('os');
  const interfaces = os.networkInterfaces();
  const localAddresses = [];
  for (const name of Object.keys(interfaces)) {
    for (const netInterface of interfaces[name]) {
      localAddresses.push(netInterface.address);
    }
  }
  return localAddresses.includes(rawIp);
}

// Helper to check if request is authenticated as admin using token
function isAdminRequest(req) {
  const token = req.headers['x-admin-token'] || req.query['admin-token'];
  if (!token) return false;
  return activeTokens.has(token);
}

// Serve PDFs statically with aggressive 7-day caching to save mobile data
app.use('/pdfs', express.static(PDF_DIR, {
  maxAge: '7d',
  immutable: true
}));

// API to check if current user is Admin
app.get('/api/is-admin', (req, res) => {
  res.json({ isAdmin: isAdminRequest(req) });
});

// API to check if the connection is from the local machine (localhost)
// Used by the client to decide whether to show the admin button
app.get('/api/is-local', (req, res) => {
  res.json({ isLocal: isLocalhostConnection(req) });
});

// Admin login route (only allowed from loopback interface)
app.post('/api/login', (req, res) => {
  if (!isLocalhostConnection(req)) {
    return res.status(403).json({ error: "Connexion interdite depuis un appareil distant." });
  }
  const { password } = req.body;
  if (!password || password !== adminPassword) {
    return res.status(401).json({ error: "Mot de passe incorrect." });
  }
  const token = crypto.randomBytes(16).toString('hex');
  activeTokens.add(token);
  res.json({ success: true, token });
});

// Admin logout route
app.post('/api/logout', (req, res) => {
  const token = req.headers['x-admin-token'];
  if (token) {
    activeTokens.delete(token);
  }
  res.json({ success: true });
});

// Endpoint to get all CATs (served from memory cache)
app.get('/api/cats', (req, res) => {
  res.json(catsCache);
});

// Endpoint to update a specific CAT's details directly (Admin only)
app.post('/api/cats/:id', async (req, res) => {
  if (!isAdminRequest(req)) {
    return res.status(403).json({ error: 'Accès interdit. Seul l\'administrateur peut modifier directement la base de données.' });
  }
  try {
    const catId = parseInt(req.params.id);
    const { summary, ordonnance, category, title, red_flags } = req.body;

    await dbLock.acquire(async () => {
      const cat = catsCache.find(c => c.id === catId);
      if (!cat) {
        return res.status(404).json({ error: 'CAT fiche introuvable.' });
      }

      if (summary !== undefined) cat.summary = summary;
      if (ordonnance !== undefined) cat.ordonnance = ordonnance;
      if (category !== undefined) cat.category = category;
      if (title !== undefined) cat.title = title;
      if (red_flags !== undefined) cat.red_flags = red_flags;

      await safeWriteJsonAsync(DB_FILE, catsCache);
      res.json({ success: true, message: `CAT ${catId} mise à jour directement.` });
    });
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: 'Failed to save CAT data' });
  }
});

// Endpoint to add a new CAT to the database directly (Admin only)
app.post('/api/cats', async (req, res) => {
  if (!isAdminRequest(req)) {
    return res.status(403).json({ error: 'Accès interdit. Seul l\'administrateur peut modifier directement la base de données.' });
  }
  try {
    const { title, category, summary, red_flags, ordonnance, pdf_keywords } = req.body;
    if (!title || !category) {
      return res.status(400).json({ error: 'Title and Category are required' });
    }

    await dbLock.acquire(async () => {
      const nextId = catsCache.reduce((max, cat) => cat.id > max ? cat.id : max, 0) + 1;
      const newCat = {
        id: nextId,
        category,
        title,
        summary: summary || '',
        red_flags: red_flags || '',
        ordonnance: ordonnance || '',
        pdf_keywords: pdf_keywords || []
      };

      catsCache.push(newCat);
      await safeWriteJsonAsync(DB_FILE, catsCache);
      res.json({ success: true, cat: newCat });
    });
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: 'Failed to create new CAT' });
  }
});

// Endpoint to delete a custom CAT from the database (Admin only)
app.delete('/api/cats/:id', async (req, res) => {
  if (!isAdminRequest(req)) {
    return res.status(403).json({ error: 'Accès interdit. Seul l\'administrateur peut modifier directement la base de données.' });
  }
  try {
    const catId = parseInt(req.params.id);
    if (isNaN(catId)) {
      return res.status(400).json({ error: 'Invalid CAT ID' });
    }

    if (catId <= 55) {
      return res.status(400).json({ error: 'Cannot delete core CAT fiches (IDs 1-55)' });
    }

    await dbLock.acquire(async () => {
      const initialLength = catsCache.length;
      catsCache = catsCache.filter(cat => cat.id !== catId);

      if (catsCache.length === initialLength) {
        return res.status(404).json({ error: 'CAT fiche not found' });
      }

      await safeWriteJsonAsync(DB_FILE, catsCache);
      res.json({ success: true, message: `CAT ${catId} successfully deleted` });
    });
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: 'Failed to delete CAT' });
  }
});

// GET /api/suggestions - List pending suggestions (Admin only)
app.get('/api/suggestions', (req, res) => {
  if (!isAdminRequest(req)) {
    return res.status(403).json({ error: 'Accès interdit.' });
  }
  res.json(suggestionsCache);
});

// POST /api/suggestions - Submit a new suggestion (Guest or Admin)
app.post('/api/suggestions', async (req, res) => {
  try {
    const { type, catId, data } = req.body;
    if (!type || !data) {
      return res.status(400).json({ error: 'Type (add/edit) et Data sont requis.' });
    }

    await dbLock.acquire(async () => {
      const suggestionId = 'sug_' + Date.now() + '_' + Math.random().toString(36).substr(2, 9);
      const newSug = {
        id: suggestionId,
        type, // 'add' or 'edit'
        catId: catId ? parseInt(catId) : null,
        timestamp: Date.now(),
        data
      };

      suggestionsCache.push(newSug);
      await safeWriteJsonAsync(SUGGESTIONS_FILE, suggestionsCache);
      res.json({ success: true, message: 'Proposition envoyée à l\'administrateur pour validation.', suggestion: newSug });
    });
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: 'Failed to save suggestion' });
  }
});

// POST /api/suggestions/:id/approve - Approve a suggestion (Admin only)
app.post('/api/suggestions/:id/approve', async (req, res) => {
  if (!isAdminRequest(req)) {
    return res.status(403).json({ error: 'Accès interdit.' });
  }
  try {
    const sugId = req.params.id;

    await dbLock.acquire(async () => {
      const index = suggestionsCache.findIndex(s => s.id === sugId);
      if (index === -1) {
        return res.status(404).json({ error: 'Proposition introuvable.' });
      }

      const sug = suggestionsCache[index];

      if (sug.type === 'add') {
        const nextId = catsCache.reduce((max, cat) => cat.id > max ? cat.id : max, 0) + 1;
        const newCat = {
          id: nextId,
          category: sug.data.category,
          title: sug.data.title,
          summary: sug.data.summary || '',
          red_flags: sug.data.red_flags || '',
          ordonnance: sug.data.ordonnance || '',
          pdf_keywords: sug.data.pdf_keywords || []
        };
        catsCache.push(newCat);
        await safeWriteJsonAsync(DB_FILE, catsCache);
      } else if (sug.type === 'edit') {
        const cat = catsCache.find(c => c.id === parseInt(sug.catId));
        if (cat) {
          if (sug.data.summary !== undefined) cat.summary = sug.data.summary;
          if (sug.data.ordonnance !== undefined) cat.ordonnance = sug.data.ordonnance;
          if (sug.data.category !== undefined) cat.category = sug.data.category;
          if (sug.data.title !== undefined) cat.title = sug.data.title;
          if (sug.data.red_flags !== undefined) cat.red_flags = sug.data.red_flags;
          await safeWriteJsonAsync(DB_FILE, catsCache);
        } else {
          return res.status(404).json({ error: 'Fiche CAT d\'origine introuvable.' });
        }
      }

      // Remove from queue
      suggestionsCache.splice(index, 1);
      await safeWriteJsonAsync(SUGGESTIONS_FILE, suggestionsCache);
      
      res.json({ success: true, message: 'Proposition approuvée et intégrée à l\'application.' });
    });
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: 'Failed to approve suggestion' });
  }
});

// POST /api/suggestions/:id/reject - Reject a suggestion (Admin only)
app.post('/api/suggestions/:id/reject', async (req, res) => {
  if (!isAdminRequest(req)) {
    return res.status(403).json({ error: 'Accès interdit.' });
  }
  try {
    const sugId = req.params.id;

    await dbLock.acquire(async () => {
      const index = suggestionsCache.findIndex(s => s.id === sugId);
      if (index === -1) {
        return res.status(404).json({ error: 'Proposition introuvable.' });
      }

      suggestionsCache.splice(index, 1);
      await safeWriteJsonAsync(SUGGESTIONS_FILE, suggestionsCache);
      res.json({ success: true, message: 'Proposition rejetée et supprimée.' });
    });
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: 'Failed to reject suggestion' });
  }
});

// Endpoint to list all actual files in reference-pdfs directory
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

// PDF content search API (fully in-memory non-blocking lookup)
app.get('/api/search-pdfs', (req, res) => {
  try {
    const query = req.query.q;
    if (!query || query.trim() === '') {
      return res.json({ results: [] });
    }

    const cleanQuery = query.trim().toLowerCase();
    
    if (!pdfIndex || pdfIndex.length === 0) {
      return res.status(503).json({ error: "PDF index not yet built. Please wait a few moments." });
    }

    const results = [];

    // Search across cached in-memory pages
    for (const doc of pdfIndex) {
      if (!doc.pages) continue;
      for (const p of doc.pages) {
        if (!p.text) continue;
        const textLower = p.text.toLowerCase();
        
        let indexMatch = textLower.indexOf(cleanQuery);
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

    res.json({ results });
  } catch (err) {
    console.error("Search error:", err);
    res.status(500).json({ error: "Failed to search PDFs" });
  }
});

// PDF individual index status details API
app.get('/api/pdf-index-status', (req, res) => {
  try {
    const statusMap = {};
    for (const doc of pdfIndex) {
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

// PDF index status API
app.get('/api/search-status', (req, res) => {
  try {
    res.json(getIndexStatus());
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: "Failed to get indexing status" });
  }
});

// Trigger PDF re-indexing API (Admin only)
app.post('/api/reindex', (req, res) => {
  if (!isAdminRequest(req)) {
    return res.status(403).json({ error: 'Accès interdit.' });
  }
  try {
    indexPdfs(true).catch(err => console.error("Error in forced indexing:", err));
    res.json({ success: true, message: "Reindexing started in background" });
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: "Failed to trigger reindexing" });
  }
});

// Save Layout CSS Tunings from Browser (Admin only)
app.post('/api/save-css', async (req, res) => {
  if (!isAdminRequest(req)) {
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

    const cssPath = path.join(__dirname, 'public', 'style.css');

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
      res.json({ success: true, message: "CSS updated successfully!" });
    });
    
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: "Failed to update CSS file" });
  }
});

// Start application after loading caches
initializeData().then(() => {
  app.listen(PORT, '0.0.0.0', () => {
    console.log(`=================================================`);
    console.log(`Medical CAT Learning App is running!`);
    console.log(`Local Access: http://localhost:${PORT}`);
    console.log(`Network Access: http://<your-device-ip>:${PORT}`);
    console.log(`=================================================`);

    // Start indexing PDFs in the background on startup
    indexPdfs().catch(err => console.error("Startup indexing error:", err));
  });
}).catch(err => {
  console.error("Critical: Failed to initialize application data caches:", err);
  process.exit(1);
});
