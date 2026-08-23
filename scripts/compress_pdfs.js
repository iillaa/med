const fs = require('fs');
const path = require('path');
const { execSync } = require('child_process');

const { PDFDocument } = require('pdf-lib');

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

async function compressPdfFile(inputPath, outputPath) {
  const fileName = path.basename(inputPath);
  const tempPath = outputPath + '.tmp';

  try {
    const originalSize = fs.statSync(inputPath).size;
    const targetDir = path.dirname(outputPath);
    if (!fs.existsSync(targetDir)) {
      fs.mkdirSync(targetDir, { recursive: true });
    }

    // 1. Tier 1: Try Ghostscript if available
    if (checkGhostscript()) {
      const cmd = `gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dPDFSETTINGS=/screen -dColorImageResolution=96 -dGrayImageResolution=96 -dMonoImageResolution=96 -dColorImageDownsampleType=/Bicubic -dGrayImageDownsampleType=/Bicubic -dAutoFilterColorImages=false -dColorImageFilter=/DCTEncode -dJPEGQ=60 -dSubsetFonts=true -dCompressFonts=true -dDetectDuplicateImages=true -dNOPAUSE -dQUIET -dBATCH -sOutputFile="${tempPath}" "${inputPath}"`;
      try {
        execSync(cmd);
        if (fs.existsSync(tempPath)) {
          const newSize = fs.statSync(tempPath).size;
          if (newSize < originalSize) {
            const savedPercent = (((originalSize - newSize) / originalSize) * 100).toFixed(1);
            const formatMb = (bytes) => (bytes / (1024 * 1024)).toFixed(2) + ' MB';
            fs.renameSync(tempPath, outputPath);
            console.log(` ✅ Ghostscript Compressed "${fileName}": ${formatMb(originalSize)} → ${formatMb(newSize)} (-${savedPercent}%)`);
            return originalSize - newSize;
          } else {
            if (fs.existsSync(tempPath)) fs.unlinkSync(tempPath);
          }
        }
      } catch (_) {}
    }

    // 2. Tier 2: Pure Node.js PDF-Lib Object Streams Optimizer (Runs anywhere, 0 native dependencies)
    try {
      const origBuffer = await fs.promises.readFile(inputPath);
      const doc = await PDFDocument.load(origBuffer, { ignoreEncryption: true });
      const optBytes = await doc.save({ useObjectStreams: true, addDefaultPage: false });
      const newSize = optBytes.length;

      if (newSize < originalSize && (originalSize - newSize) > 512) {
        const savedPercent = (((originalSize - newSize) / originalSize) * 100).toFixed(1);
        const formatMb = (bytes) => (bytes / (1024 * 1024)).toFixed(2) + ' MB';
        await fs.promises.writeFile(outputPath, Buffer.from(optBytes));
        console.log(` ✅ PDF-Lib Compressed "${fileName}": ${formatMb(originalSize)} → ${formatMb(newSize)} (-${savedPercent}%)`);
        return originalSize - newSize;
      }
    } catch (_) {}

    // Fallback: Copy original if already optimal
    fs.copyFileSync(inputPath, outputPath);
    console.log(` ✨ Synced "${fileName}" to public/pdfs/ (already optimal).`);
    return 0;
  } catch (err) {
    if (fs.existsSync(tempPath)) fs.unlinkSync(tempPath);
    console.error(` ❌ Failed to process "${fileName}":`, err.message);
    try { fs.copyFileSync(inputPath, outputPath); } catch (_) {}
    return 0;
  }
}

async function processAllPdfs() {
  console.log("⚡ Dr. CAT — Automated Dual Pipeline PDF Compressor\n");

  if (!fs.existsSync(MASTERS_DIR)) {
    fs.mkdirSync(MASTERS_DIR, { recursive: true });
  }
  if (!fs.existsSync(PUBLIC_DIR)) {
    fs.mkdirSync(PUBLIC_DIR, { recursive: true });
  }

  // Auto-sync existing public PDFs into data/pdf_masters if missing
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
    totalSaved += await compressPdfFile(inputPath, outputPath);
  }

  const savedMb = (totalSaved / (1024 * 1024)).toFixed(2);
  console.log(`\n🎉 Dual Pipeline Compression Complete! Total APK space saved: ${savedMb} MB.`);
}

module.exports = { checkGhostscript, compressPdfFile, MASTERS_DIR, PUBLIC_DIR, processAllPdfs };

if (require.main === module) {
  processAllPdfs();
}
