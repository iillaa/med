/**
 * Official Algerian Drug Nomenclature (Nomenclature Nationale des Médicaments - Ministère de la Santé)
 * Automated Ingestion Script
 * 
 * Downloads and parses:
 *   https://huggingface.co/datasets/tkawen/algerian-drug-nomenclature
 * 
 * Compiles a clean, indexed offline database:
 *   - data/algerian_nomenclature.json
 *   - cat_db_generator/data/algerian_nomenclature.json
 */

const fs = require('fs');
const path = require('path');
const https = require('https');

const CSV_URL = 'https://huggingface.co/datasets/tkawen/algerian-drug-nomenclature/raw/main/algerian_drug_nomenclature.csv';
const DATA_DIR = path.join(__dirname, '..', 'data');
const GEN_DATA_DIR = path.join(__dirname, '..', 'cat_db_generator', 'data');

function downloadCsv(url, dest) {
  return new Promise((resolve, reject) => {
    console.log(`📥 Downloading Algerian Drug Nomenclature from ${url}...`);
    https.get(url, (res) => {
      if (res.statusCode >= 300 && res.statusCode < 400 && res.headers.location) {
        https.get(res.headers.location, (redirectRes) => {
          const fileStream = fs.createWriteStream(dest);
          redirectRes.pipe(fileStream);
          fileStream.on('finish', () => {
            fileStream.close();
            console.log(`   ✅ Saved ${dest} (${(fs.statSync(dest).size / 1024).toFixed(1)} KB)`);
            resolve(dest);
          });
        }).on('error', reject);
      } else if (res.statusCode === 200) {
        const fileStream = fs.createWriteStream(dest);
        res.pipe(fileStream);
        fileStream.on('finish', () => {
          fileStream.close();
          console.log(`   ✅ Saved ${dest} (${(fs.statSync(dest).size / 1024).toFixed(1)} KB)`);
          resolve(dest);
        });
      } else {
        reject(new Error(`HTTP ${res.statusCode} downloading CSV`));
      }
    }).on('error', reject);
  });
}

function parseCSVLine(line) {
  const result = [];
  let current = '';
  let inQuotes = false;
  
  for (let i = 0; i < line.length; i++) {
    const char = line[i];
    if (char === '"' && (i === 0 || line[i - 1] !== '\\')) {
      inQuotes = !inQuotes;
    } else if (char === ',' && !inQuotes) {
      result.push(current.trim());
      current = '';
    } else {
      current += char;
    }
  }
  result.push(current.trim());
  return result;
}

async function runIngestion() {
  console.log('🇩🇿 ═══════════════════════════════════════════════════════════════');
  console.log('🇩🇿 DR. CAT — ALGERIAN DRUG NOMENCLATURE INGESTION (MINISTÈRE SANTÉ)');
  console.log('🇩🇿 ═══════════════════════════════════════════════════════════════\n');

  if (!fs.existsSync(DATA_DIR)) fs.mkdirSync(DATA_DIR, { recursive: true });
  if (!fs.existsSync(GEN_DATA_DIR)) fs.mkdirSync(GEN_DATA_DIR, { recursive: true });

  const csvPath = path.join(DATA_DIR, 'algerian_drug_nomenclature.csv');
  if (!fs.existsSync(csvPath) || fs.statSync(csvPath).size < 1000) {
    await downloadCsv(CSV_URL, csvPath);
  } else {
    console.log(`📦 Using existing CSV file (${(fs.statSync(csvPath).size / 1024).toFixed(1)} KB)`);
  }

  const rawContent = fs.readFileSync(csvPath, 'utf8');
  const lines = rawContent.split(/\r?\n/).filter(l => l.trim().length > 0);
  const header = parseCSVLine(lines[0]);
  console.log('📋 CSV Headers:', header.join(', '));

  const dciMap = new Map();
  const allProducts = [];

  for (let i = 1; i < lines.length; i++) {
    const cols = parseCSVLine(lines[i]);
    if (cols.length < 7) continue;

    const id = cols[0];
    const registrationNumber = cols[1];
    const inn = (cols[3] || '').trim().toUpperCase(); // DCI
    const brandName = (cols[4] || '').trim().toUpperCase(); // Marque
    const form = (cols[5] || '').trim();
    const dosage = (cols[6] || '').trim();
    const packaging = (cols[7] || '').trim();
    const list = (cols[8] || '').trim();
    const laboratory = (cols[12] || '').trim();
    const country = (cols[13] || '').trim();
    const reimbursable = (cols[20] || '').trim().toUpperCase() === 'OUI';
    const price = (cols[19] || '').trim();

    if (!inn && !brandName) continue;

    const productRecord = {
      id: parseInt(id, 10) || i,
      registrationNumber,
      inn,
      brandName,
      form,
      dosage,
      packaging,
      list,
      laboratory,
      country,
      reimbursable,
      price
    };
    allProducts.push(productRecord);

    // Group by INN / DCI
    const dciKey = inn || brandName;
    if (!dciMap.has(dciKey)) {
      dciMap.set(dciKey, {
        dci: dciKey,
        brands: new Set(),
        forms: new Set(),
        dosages: new Set(),
        laboratories: new Set(),
        reimbursableCount: 0,
        totalProducts: 0
      });
    }

    const entry = dciMap.get(dciKey);
    entry.totalProducts++;
    if (brandName) entry.brands.add(brandName);
    if (form) entry.forms.add(form);
    if (dosage) entry.dosages.add(dosage);
    if (laboratory) entry.laboratories.add(laboratory);
    if (reimbursable) entry.reimbursableCount++;
  }

  console.log(`\n✅ Indexed ${allProducts.length} registered Algerian commercial products.`);
  console.log(`✅ Indexed ${dciMap.size} unique chemical active substances (INNs/DCIs).`);

  const compiledDcis = [];
  for (const [dci, entry] of dciMap.entries()) {
    compiledDcis.push({
      dci,
      brands: Array.from(entry.brands).slice(0, 15),
      forms: Array.from(entry.forms).slice(0, 10),
      dosages: Array.from(entry.dosages).slice(0, 12),
      laboratories: Array.from(entry.laboratories).slice(0, 8),
      reimbursableCount: entry.reimbursableCount,
      totalProducts: entry.totalProducts
    });
  }

  // Sort by product count (most common molecules first)
  compiledDcis.sort((a, b) => b.totalProducts - a.totalProducts);

  const finalNomenclature = {
    source: 'Nomenclature Nationale des Produits Pharmaceutiques (Ministère de la Santé, Algérie)',
    lastUpdated: new Date().toISOString(),
    totalProducts: allProducts.length,
    totalDCIs: compiledDcis.length,
    dcis: compiledDcis
  };

  const outPath1 = path.join(DATA_DIR, 'algerian_nomenclature.json');
  const outPath2 = path.join(GEN_DATA_DIR, 'algerian_nomenclature.json');

  fs.writeFileSync(outPath1, JSON.stringify(finalNomenclature, null, 2), 'utf8');
  fs.writeFileSync(outPath2, JSON.stringify(finalNomenclature, null, 2), 'utf8');

  console.log('\n═══════════════════════════════════════════════════════════════');
  console.log(`🎉 ALGERIAN NOMENCLATURE INGESTION COMPLETE!`);
  console.log(`📁 Output Index: ${outPath1} (${(fs.statSync(outPath1).size / 1024).toFixed(1)} KB)`);
  console.log('═══════════════════════════════════════════════════════════════\n');
}

runIngestion().catch(err => {
  console.error('❌ Algerian Ingestion Error:', err);
  process.exit(1);
});
