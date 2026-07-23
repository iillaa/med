const fs = require('fs');
const path = require('path');
const { execSync } = require('child_process');

const MASTERS_DIR = path.join(__dirname, '..', 'data', 'pdf_masters');
const PUBLIC_DIR = path.join(__dirname, '..', 'public', 'pdfs');

function checkGhostscript() {
  try {
    execSync('gs --version', { stdio: 'ignore' });
    return true;
  } catch (_) {
    return false;
  }
}

function compressPdfFile(inputPath, outputPath) {
  const fileName = path.basename(inputPath);
  const tempPath = outputPath + '.tmp';

  try {
    const originalSize = fs.statSync(inputPath).size;
    const targetDir = path.dirname(outputPath);
    if (!fs.existsSync(targetDir)) {
      fs.mkdirSync(targetDir, { recursive: true });
    }

    if (checkGhostscript()) {
      // Ghostscript command for ultra mobile PDF compression (96 DPI + JPEGQ 60)
      const cmd = `gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dPDFSETTINGS=/screen -dColorImageResolution=96 -dGrayImageResolution=96 -dMonoImageResolution=96 -dColorImageDownsampleType=/Bicubic -dGrayImageDownsampleType=/Bicubic -dAutoFilterColorImages=false -dColorImageFilter=/DCTEncode -dJPEGQ=60 -dSubsetFonts=true -dCompressFonts=true -dDetectDuplicateImages=true -dNOPAUSE -dQUIET -dBATCH -sOutputFile="${tempPath}" "${inputPath}"`;
      execSync(cmd);

      if (fs.existsSync(tempPath)) {
        const newSize = fs.statSync(tempPath).size;
        if (newSize < originalSize) {
          const savedPercent = (((originalSize - newSize) / originalSize) * 100).toFixed(1);
          const formatMb = (bytes) => (bytes / (1024 * 1024)).toFixed(2) + 'MB';
          fs.renameSync(tempPath, outputPath);
          console.log(` ✅ Compressed "${fileName}": ${formatMb(originalSize)} → ${formatMb(newSize)} (-${savedPercent}%)`);
          return originalSize - newSize;
        } else {
          if (fs.existsSync(tempPath)) fs.unlinkSync(tempPath);
        }
      }
    }
    
    // Fallback: Copy original if Ghostscript unavailable or compression offered no size gain
    fs.copyFileSync(inputPath, outputPath);
    console.log(` ℹ️ Copied "${fileName}" to public/pdfs/ (uncompressed).`);
    return 0;
  } catch (err) {
    if (fs.existsSync(tempPath)) fs.unlinkSync(tempPath);
    console.error(` ❌ Failed to compress "${fileName}":`, err.message);
    try { fs.copyFileSync(inputPath, outputPath); } catch (_) {}
    return 0;
  }
}

function processAllPdfs() {
  console.log("⚡ Dr. CAT — Automated Dual Pipeline PDF Compressor\n");

  if (!fs.existsSync(MASTERS_DIR)) {
    fs.mkdirSync(MASTERS_DIR, { recursive: true });
  }
  if (!fs.existsSync(PUBLIC_DIR)) {
    fs.mkdirSync(PUBLIC_DIR, { recursive: true });
  }

  // Auto-sync existing public PDFs into data/pdf_masters if MASTERS_DIR is empty
  const publicFiles = fs.readdirSync(PUBLIC_DIR).filter(f => f.endsWith('.pdf'));
  for (const file of publicFiles) {
    const masterPath = path.join(MASTERS_DIR, file);
    if (!fs.existsSync(masterPath)) {
      fs.copyFileSync(path.join(PUBLIC_DIR, file), masterPath);
      console.log(` 📦 Auto-synced "${file}" into data/pdf_masters/ as master original.`);
    }
  }

  const masterFiles = fs.readdirSync(MASTERS_DIR).filter(f => f.endsWith('.pdf'));
  if (masterFiles.length === 0) {
    console.log("No master PDF files found in data/pdf_masters/");
    return;
  }

  console.log(`Processing ${masterFiles.length} master PDF file(s)...\n`);
  let totalSaved = 0;

  for (const file of masterFiles) {
    const inputPath = path.join(MASTERS_DIR, file);
    const outputPath = path.join(PUBLIC_DIR, file);
    totalSaved += compressPdfFile(inputPath, outputPath);
  }

  const savedMb = (totalSaved / (1024 * 1024)).toFixed(2);
  console.log(`\n🎉 Dual Pipeline Compression Complete! Total APK space saved: ${savedMb} MB.`);
}

module.exports = { checkGhostscript, compressPdfFile, MASTERS_DIR, PUBLIC_DIR, processAllPdfs };

if (require.main === module) {
  processAllPdfs();
}
