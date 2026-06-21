const express = require('express');
const fs = require('fs');
const path = require('path');

const app = express();
const PORT = 3000;

app.use(express.json());
app.use(express.static(path.join(__dirname, 'public')));

// Path to user data store (progress and notes)
const DATA_FILE = path.join(__dirname, 'data.json');
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

// Initialize user data file if it doesn't exist
if (!fs.existsSync(DATA_FILE)) {
  safeWriteJsonSync(DATA_FILE, {});
}

// Serve PDFs statically
app.use('/pdfs', express.static(PDF_DIR));

// Endpoint to get all CATs (merged with user progress)
app.get('/api/cats', (req, res) => {
  try {
    if (!fs.existsSync(DB_FILE)) {
      return res.status(500).json({ error: 'Database file not found. Please run generate_db.js' });
    }
    const dbData = JSON.parse(fs.readFileSync(DB_FILE, 'utf-8'));
    const userData = JSON.parse(fs.readFileSync(DATA_FILE, 'utf-8'));

    const merged = dbData.map(cat => {
      const userEntry = userData[cat.id] || { status: 'todo', notes: '', customSummary: '', customOrdonnance: '' };
      return {
        ...cat,
        status: userEntry.status || 'todo',
        notes: userEntry.notes || '',
        customSummary: userEntry.customSummary || '',
        customOrdonnance: userEntry.customOrdonnance || ''
      };
    });

    res.json(merged);
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: 'Failed to load CAT data' });
  }
});

// Endpoint to update a specific CAT's progress/notes
app.post('/api/cats/:id', (req, res) => {
  try {
    const catId = req.params.id;
    const { status, notes, customSummary, customOrdonnance } = req.body;

    const userData = JSON.parse(fs.readFileSync(DATA_FILE, 'utf-8'));
    userData[catId] = {
      status: status || 'todo',
      notes: notes || '',
      customSummary: customSummary || '',
      customOrdonnance: customOrdonnance || ''
    };

    safeWriteJsonSync(DATA_FILE, userData);
    res.json({ success: true, message: `CAT ${catId} updated successfully` });
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: 'Failed to save CAT data' });
  }
});

// Endpoint to add a new CAT to the database
app.post('/api/cats', (req, res) => {
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

// Endpoint to reset all user progress
app.post('/api/reset', (req, res) => {
  try {
    safeWriteJsonSync(DATA_FILE, {});
    res.json({ success: true, message: 'Progress successfully reset' });
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: 'Failed to reset progress' });
  }
});

// Endpoint to delete a custom CAT from the database (only if ID > 55)
app.delete('/api/cats/:id', (req, res) => {
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

    // Also remove from user data if exists
    if (fs.existsSync(DATA_FILE)) {
      const userData = JSON.parse(fs.readFileSync(DATA_FILE, 'utf-8'));
      if (userData[catId]) {
        delete userData[catId];
        safeWriteJsonSync(DATA_FILE, userData);
      }
    }

    res.json({ success: true, message: `CAT ${catId} successfully deleted` });
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: 'Failed to delete CAT' });
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

app.listen(PORT, '0.0.0.0', () => {
  console.log(`=================================================`);
  console.log(`Medical CAT Learning App is running!`);
  console.log(`Local Access: http://localhost:${PORT}`);
  console.log(`Network Access: http://<your-device-ip>:${PORT}`);
  console.log(`=================================================`);
});
