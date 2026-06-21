const express = require('express');
const fs = require('fs');
const path = require('path');
const { indexPdfs, getIndexStatus } = require('./index_pdfs');

const INDEX_FILE = path.join(__dirname, 'pdf_index.json');

const app = express();
const PORT = 3000;

app.use(express.json());
app.use(express.static(path.join(__dirname, 'public')));

// Path to suggestions queue
const SUGGESTIONS_FILE = path.join(__dirname, 'suggestions.json');
// Path to database of CATs
const DB_FILE = path.join(__dirname, 'cats_db.json');
// Path to PDF references
const PDF_DIR = path.join(__dirname, 'cat-med', 'reference-pdfs');

// Helper for atomic file writes and backups to ensure data integrity
function safeWriteJsonSync(filePath, data) {
  const tempPath = filePath + '.tmp';
  const backupPath = filePath + '.bak';
  
  try {
    const jsonString = JSON.stringify(data, null, 2);
    if (fs.existsSync(filePath)) {
      fs.copyFileSync(filePath, backupPath);
    }
    fs.writeFileSync(tempPath, jsonString, 'utf-8');
    fs.renameSync(tempPath, filePath);
  } catch (err) {
    console.error(`[Data Integrity Error] Failed to write atomically to ${filePath}:`, err);
    if (fs.existsSync(tempPath)) {
      try { fs.unlinkSync(tempPath); } catch (_) {}
    }
    throw err;
  }
}

// Initialize suggestions file if it doesn't exist
if (!fs.existsSync(SUGGESTIONS_FILE)) {
  safeWriteJsonSync(SUGGESTIONS_FILE, []);
}

// Helper to check if the request comes from the local Admin (localhost) and not from ngrok
function isAdminRequest(req) {
  const host = req.headers.host || '';
  const hasForwardedFor = req.headers['x-forwarded-for'] || req.headers['x-forwarded-proto'];
  if (hasForwardedFor) return false;
  if (host.includes('ngrok-free.dev')) return false;
  return host.startsWith('localhost') || host.startsWith('127.0.0.1');
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

// Endpoint to get all CATs (raw from cats_db.json, progress is client-side)
app.get('/api/cats', (req, res) => {
  try {
    if (!fs.existsSync(DB_FILE)) {
      return res.status(500).json({ error: 'Database file not found. Please run generate_db.js' });
    }
    const dbData = JSON.parse(fs.readFileSync(DB_FILE, 'utf-8'));
    res.json(dbData);
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: 'Failed to load CAT data' });
  }
});

// Endpoint to update a specific CAT's details directly (Admin only)
app.post('/api/cats/:id', (req, res) => {
  if (!isAdminRequest(req)) {
    return res.status(403).json({ error: 'Accès interdit. Seul l\'administrateur peut modifier directement la base de données.' });
  }
  try {
    const catId = parseInt(req.params.id);
    const { summary, ordonnance, category, title, red_flags } = req.body;

    const dbData = JSON.parse(fs.readFileSync(DB_FILE, 'utf-8'));
    const cat = dbData.find(c => c.id === catId);
    if (!cat) {
      return res.status(404).json({ error: 'CAT fiche introuvable.' });
    }

    if (summary !== undefined) cat.summary = summary;
    if (ordonnance !== undefined) cat.ordonnance = ordonnance;
    if (category !== undefined) cat.category = category;
    if (title !== undefined) cat.title = title;
    if (red_flags !== undefined) cat.red_flags = red_flags;

    safeWriteJsonSync(DB_FILE, dbData);
    res.json({ success: true, message: `CAT ${catId} mise à jour directement.` });
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: 'Failed to save CAT data' });
  }
});

// Endpoint to add a new CAT to the database directly (Admin only)
app.post('/api/cats', (req, res) => {
  if (!isAdminRequest(req)) {
    return res.status(403).json({ error: 'Accès interdit. Seul l\'administrateur peut modifier directement la base de données.' });
  }
  try {
    const { title, category, summary, red_flags, ordonnance, pdf_keywords } = req.body;
    if (!title || !category) {
      return res.status(400).json({ error: 'Title and Category are required' });
    }

    if (!fs.existsSync(DB_FILE)) {
      return res.status(500).json({ error: 'Database file not found' });
    }

    const dbData = JSON.parse(fs.readFileSync(DB_FILE, 'utf-8'));
    
    // Calculate new ID (max ID + 1)
    const nextId = dbData.reduce((max, cat) => cat.id > max ? cat.id : max, 0) + 1;

    const newCat = {
      id: nextId,
      category,
      title,
      summary: summary || '',
      red_flags: red_flags || '',
      ordonnance: ordonnance || '',
      pdf_keywords: pdf_keywords || []
    };

    dbData.push(newCat);
    safeWriteJsonSync(DB_FILE, dbData);

    res.json({ success: true, cat: newCat });
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: 'Failed to create new CAT' });
  }
});

// Endpoint to delete a custom CAT from the database (only if ID > 55) (Admin only)
app.delete('/api/cats/:id', (req, res) => {
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

    if (!fs.existsSync(DB_FILE)) {
      return res.status(500).json({ error: 'Database file not found' });
    }

    let dbData = JSON.parse(fs.readFileSync(DB_FILE, 'utf-8'));
    const initialLength = dbData.length;
    
    // Filter out the deleted CAT
    dbData = dbData.filter(cat => cat.id !== catId);

    if (dbData.length === initialLength) {
      return res.status(404).json({ error: 'CAT fiche not found' });
    }

    safeWriteJsonSync(DB_FILE, dbData);
    res.json({ success: true, message: `CAT ${catId} successfully deleted` });
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
  try {
    const list = JSON.parse(fs.readFileSync(SUGGESTIONS_FILE, 'utf-8'));
    res.json(list);
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: 'Failed to load suggestions' });
  }
});

// POST /api/suggestions - Submit a new suggestion (Guest or Admin)
app.post('/api/suggestions', (req, res) => {
  try {
    const { type, catId, data } = req.body;
    if (!type || !data) {
      return res.status(400).json({ error: 'Type (add/edit) et Data sont requis.' });
    }

    const list = JSON.parse(fs.readFileSync(SUGGESTIONS_FILE, 'utf-8'));
    const suggestionId = 'sug_' + Date.now() + '_' + Math.random().toString(36).substr(2, 9);
    
    const newSug = {
      id: suggestionId,
      type, // 'add' or 'edit'
      catId: catId ? parseInt(catId) : null,
      timestamp: Date.now(),
      data
    };

    list.push(newSug);
    safeWriteJsonSync(SUGGESTIONS_FILE, list);
    res.json({ success: true, message: 'Proposition envoyée à l\'administrateur pour validation.', suggestion: newSug });
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: 'Failed to save suggestion' });
  }
});

// POST /api/suggestions/:id/approve - Approve a suggestion (Admin only)
app.post('/api/suggestions/:id/approve', (req, res) => {
  if (!isAdminRequest(req)) {
    return res.status(403).json({ error: 'Accès interdit.' });
  }
  try {
    const sugId = req.params.id;
    const list = JSON.parse(fs.readFileSync(SUGGESTIONS_FILE, 'utf-8'));
    const index = list.findIndex(s => s.id === sugId);
    
    if (index === -1) {
      return res.status(404).json({ error: 'Proposition introuvable.' });
    }

    const sug = list[index];
    const dbData = JSON.parse(fs.readFileSync(DB_FILE, 'utf-8'));

    if (sug.type === 'add') {
      const nextId = dbData.reduce((max, cat) => cat.id > max ? cat.id : max, 0) + 1;
      const newCat = {
        id: nextId,
        category: sug.data.category,
        title: sug.data.title,
        summary: sug.data.summary || '',
        red_flags: sug.data.red_flags || '',
        ordonnance: sug.data.ordonnance || '',
        pdf_keywords: sug.data.pdf_keywords || []
      };
      dbData.push(newCat);
      safeWriteJsonSync(DB_FILE, dbData);
    } else if (sug.type === 'edit') {
      const cat = dbData.find(c => c.id === parseInt(sug.catId));
      if (cat) {
        if (sug.data.summary !== undefined) cat.summary = sug.data.summary;
        if (sug.data.ordonnance !== undefined) cat.ordonnance = sug.data.ordonnance;
        if (sug.data.category !== undefined) cat.category = sug.data.category;
        if (sug.data.title !== undefined) cat.title = sug.data.title;
        if (sug.data.red_flags !== undefined) cat.red_flags = sug.data.red_flags;
        safeWriteJsonSync(DB_FILE, dbData);
      } else {
        return res.status(404).json({ error: 'Fiche CAT d\'origine introuvable.' });
      }
    }

    // Remove from queue
    list.splice(index, 1);
    safeWriteJsonSync(SUGGESTIONS_FILE, list);
    
    res.json({ success: true, message: 'Proposition approuvée et intégrée à l\'application.' });
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: 'Failed to approve suggestion' });
  }
});

// POST /api/suggestions/:id/reject - Reject a suggestion (Admin only)
app.post('/api/suggestions/:id/reject', (req, res) => {
  if (!isAdminRequest(req)) {
    return res.status(403).json({ error: 'Accès interdit.' });
  }
  try {
    const sugId = req.params.id;
    const list = JSON.parse(fs.readFileSync(SUGGESTIONS_FILE, 'utf-8'));
    const index = list.findIndex(s => s.id === sugId);
    
    if (index === -1) {
      return res.status(404).json({ error: 'Proposition introuvable.' });
    }

    list.splice(index, 1);
    safeWriteJsonSync(SUGGESTIONS_FILE, list);
    res.json({ success: true, message: 'Proposition rejetée et supprimée.' });
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: 'Failed to reject suggestion' });
  }
});

// Endpoint to list all actual files in reference-pdfs directory
app.get('/api/pdfs', (req, res) => {
  try {
    if (!fs.existsSync(PDF_DIR)) {
      return res.json([]);
    }
    const files = fs.readdirSync(PDF_DIR);
    const pdfs = files.filter(f => f.toLowerCase().endsWith('.pdf') || f.toLowerCase().endsWith('.docx'));
    res.json(pdfs);
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: 'Failed to read PDF directory' });
  }
});

// PDF content search API
app.get('/api/search-pdfs', (req, res) => {
  try {
    const query = req.query.q;
    if (!query || query.trim() === '') {
      return res.json({ results: [] });
    }

    const cleanQuery = query.trim().toLowerCase();
    
    if (!fs.existsSync(INDEX_FILE)) {
      return res.status(503).json({ error: "PDF index not yet built. Please wait a few moments." });
    }

    const index = JSON.parse(fs.readFileSync(INDEX_FILE, 'utf-8'));
    const results = [];

    // Search across all PDFs and pages
    for (const doc of index) {
      if (!doc.pages) continue;
      for (const p of doc.pages) {
        if (!p.text) continue;
        const textLower = p.text.toLowerCase();
        
        let indexMatch = textLower.indexOf(cleanQuery);
        if (indexMatch !== -1) {
          // Find context snippet around the match
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

          // Cap results at 100 to prevent performance bottlenecks
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

// PDF index status API
app.get('/api/search-status', (req, res) => {
  try {
    res.json(getIndexStatus());
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: "Failed to get indexing status" });
  }
});

// Trigger PDF re-indexing API
app.post('/api/reindex', (req, res) => {
  try {
    indexPdfs(true).catch(err => console.error("Error in forced indexing:", err));
    res.json({ success: true, message: "Reindexing started in background" });
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: "Failed to trigger reindexing" });
  }
});

app.listen(PORT, '0.0.0.0', () => {
  console.log(`=================================================`);
  console.log(`Medical CAT Learning App is running!`);
  console.log(`Local Access: http://localhost:${PORT}`);
  console.log(`Network Access: http://<your-device-ip>:${PORT}`);
  console.log(`=================================================`);

  // Start indexing PDFs in the background on startup
  indexPdfs().catch(err => console.error("Startup indexing error:", err));
});
