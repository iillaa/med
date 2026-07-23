const fs = require('fs');
const path = require('path');

const MASTERS_DIR = path.join(__dirname, '..', 'data', 'pdf_masters');
const PUBLIC_DIR = path.join(__dirname, '..', 'public', 'pdfs');
const CACHE_DIR = path.join(__dirname, '..', 'data', 'pdf_cache');
const INDEX_FILE = path.join(__dirname, '..', 'pdf_index.json');
const PUBLIC_INDEX_FILE = path.join(__dirname, '..', 'public', 'data', 'pdf_index.json');
const PUBLIC_LIST_FILE = path.join(__dirname, '..', 'public', 'data', 'pdf_list.json');

function deletePdfFile(filename) {
  const cleanFilename = path.basename(filename);
  console.log(`\n🗑️ Deleting PDF: "${cleanFilename}"...`);

  let deletedCount = 0;

  // 1. Delete Master Original
  const masterPath = path.join(MASTERS_DIR, cleanFilename);
  if (fs.existsSync(masterPath)) {
    fs.unlinkSync(masterPath);
    console.log(`  ✅ Removed from data/pdf_masters/${cleanFilename}`);
    deletedCount++;
  }

  // 2. Delete Public Compressed PDF
  const publicPath = path.join(PUBLIC_DIR, cleanFilename);
  if (fs.existsSync(publicPath)) {
    fs.unlinkSync(publicPath);
    console.log(`  ✅ Removed from public/pdfs/${cleanFilename}`);
    deletedCount++;
  }

  // 3. Delete Extracted JSON Cache
  const cachePath = path.join(CACHE_DIR, cleanFilename + '.json');
  if (fs.existsSync(cachePath)) {
    fs.unlinkSync(cachePath);
    console.log(`  ✅ Removed from data/pdf_cache/${cleanFilename}.json`);
    deletedCount++;
  }

  // 4. Update pdf_index.json files
  const removeFromIndex = (filePath, isMinified = false) => {
    if (fs.existsSync(filePath)) {
      try {
        const raw = fs.readFileSync(filePath, 'utf-8');
        const idx = JSON.parse(raw);
        const filtered = idx.filter(doc => doc.pdf !== cleanFilename);
        if (filtered.length !== idx.length) {
          const output = isMinified ? JSON.stringify(filtered) : JSON.stringify(filtered, null, 2);
          fs.writeFileSync(filePath, output, 'utf-8');
          console.log(`  ✅ Removed from ${path.relative(path.join(__dirname, '..'), filePath)} (${idx.length} → ${filtered.length} entries)`);
        }
      } catch (err) {
        console.error(`  ❌ Error updating ${filePath}:`, err.message);
      }
    }
  };

  removeFromIndex(INDEX_FILE, false);
  removeFromIndex(PUBLIC_INDEX_FILE, true);

  // 5. Update public/data/pdf_list.json
  if (fs.existsSync(PUBLIC_LIST_FILE)) {
    try {
      const raw = fs.readFileSync(PUBLIC_LIST_FILE, 'utf-8');
      const list = JSON.parse(raw);
      const filtered = list.filter(name => name !== cleanFilename);
      if (filtered.length !== list.length) {
        fs.writeFileSync(PUBLIC_LIST_FILE, JSON.stringify(filtered), 'utf-8');
        console.log(`  ✅ Removed from public/data/pdf_list.json (${list.length} → ${filtered.length} items)`);
      }
    } catch (_) {}
  }

  if (deletedCount === 0) {
    console.log(` ⚠️ File "${cleanFilename}" was not found in any directory.`);
  } else {
    console.log(` 🎉 Successfully deleted "${cleanFilename}" from all locations.`);
  }

  return deletedCount > 0;
}

function main() {
  const targetArg = process.argv[2];
  if (!targetArg) {
    console.log("Usage: node scripts/delete_pdf.js <filename.pdf>");
    console.log("Example: node scripts/delete_pdf.js \"test_sample.pdf\"");
    process.exit(1);
  }

  deletePdfFile(targetArg);
}

module.exports = { deletePdfFile };

if (require.main === module) {
  main();
}
