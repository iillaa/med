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

// Copy pdf_index.json and generate pdf_list.json
const pdfIndexSource = path.join(__dirname, 'pdf_index.json');
if (fs.existsSync(pdfIndexSource)) {
  fs.copyFileSync(
    pdfIndexSource,
    path.join(publicDataDir, 'pdf_index.json')
  );
  console.log("Copied pdf_index.json to public/data/");

  // Generate lightweight pdf_list.json for fast startup list rendering
  try {
    const rawData = fs.readFileSync(pdfIndexSource, 'utf-8');
    const index = JSON.parse(rawData);
    const list = index.map(doc => doc.pdf);
    fs.writeFileSync(
      path.join(publicDataDir, 'pdf_list.json'),
      JSON.stringify(list, null, 2),
      'utf-8'
    );
    console.log("Generated and copied pdf_list.json to public/data/");
  } catch (err) {
    console.error("Error generating pdf_list.json during build:", err);
  }
} else {
  console.warn("pdf_index.json not found, skipping copy and list generation.");
}
