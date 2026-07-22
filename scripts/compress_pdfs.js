const fs = require('fs');
const path = require('path');
const { execSync } = require('child_process');

const PDF_DIR = path.join(__dirname, '..', 'public', 'pdfs');

function checkGhostscript() {
  try {
    execSync('gs --version', { stdio: 'ignore' });
    return true;
  } catch (_) {
    return false;
  }
}

function compressPdf(filePath) {
  const fileName = path.basename(filePath);
  const tempPath = filePath + '.compressed.tmp';

  try {
    const originalSize = fs.statSync(filePath).size;
    
    // Ghostscript command for high-quality mobile PDF compression (/ebook = 150 DPI)
    const cmd = `gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dPDFSETTINGS=/ebook -dNOPAUSE -dQUIET -dBATCH -sOutputFile="${tempPath}" "${filePath}"`;
    execSync(cmd);

    if (fs.existsSync(tempPath)) {
      const newSize = fs.statSync(tempPath).size;
      if (newSize < originalSize) {
        const savedPercent = (((originalSize - newSize) / originalSize) * 100).toFixed(1);
        const formatMb = (bytes) => (bytes / (1024 * 1024)).toFixed(2) + 'MB';
        fs.renameSync(tempPath, filePath);
        console.log(` ✅ Compressed "${fileName}": ${formatMb(originalSize)} → ${formatMb(newSize)} (-${savedPercent}%)`);
        return originalSize - newSize;
      } else {
        fs.unlinkSync(tempPath);
        console.log(` ℹ️ Skipped "${fileName}": Already optimally compressed.`);
        return 0;
      }
    }
  } catch (err) {
    if (fs.existsSync(tempPath)) fs.unlinkSync(tempPath);
    console.error(` ❌ Failed to compress "${fileName}":`, err.message);
    return 0;
  }
  return 0;
}

function main() {
  console.log("⚡ Dr. CAT — Automated PDF Compression Tool (Ghostscript)\n");

  if (!checkGhostscript()) {
    console.error("❌ Ghostscript (gs) is not installed on this machine.");
    console.error("   Install on Linux/Termux with: pkg install ghostscript (or apt install ghostscript)");
    process.exit(1);
  }

  if (!fs.existsSync(PDF_DIR)) {
    console.error(`❌ PDF directory not found at: ${PDF_DIR}`);
    process.exit(1);
  }

  const files = fs.readdirSync(PDF_DIR).filter(f => f.endsWith('.pdf'));
  if (files.length === 0) {
    console.log("No PDF files found in public/pdfs/");
    return;
  }

  console.log(`Found ${files.length} PDF file(s) in public/pdfs/...\n`);
  let totalSaved = 0;

  for (const file of files) {
    const fullPath = path.join(PDF_DIR, file);
    totalSaved += compressPdf(fullPath);
  }

  const savedMb = (totalSaved / (1024 * 1024)).toFixed(2);
  console.log(`\n🎉 PDF Compression Complete! Total space saved for APK bundle: ${savedMb} MB.`);
}

main();
