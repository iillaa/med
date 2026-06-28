const fs = require('fs');
const path = require('path');

const publicDataDir = path.join(__dirname, 'public', 'data');
if (!fs.existsSync(publicDataDir)) {
  fs.mkdirSync(publicDataDir, { recursive: true });
}

// Copy cats_db.json
fs.copyFileSync(
  path.join(__dirname, 'cats_db.json'),
  path.join(publicDataDir, 'cats_db.json')
);
console.log("Copied cats_db.json to public/data/");

// Copy pdf_index.json
if (fs.existsSync(path.join(__dirname, 'pdf_index.json'))) {
  fs.copyFileSync(
    path.join(__dirname, 'pdf_index.json'),
    path.join(publicDataDir, 'pdf_index.json')
  );
  console.log("Copied pdf_index.json to public/data/");
} else {
  console.warn("pdf_index.json not found, skipping copy.");
}
