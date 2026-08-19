/**
 * Official BDPM (Base de Données Publique des Médicaments - ANSM / Ministère de la Santé)
 * Automated Ingestion and Pharmacology Indexer Script
 * 
 * Downloads official datasets:
 *   1. CIS_bdpm.txt       (Medicines, galenic forms, administration routes)
 *   2. CIS_COMPO_bdpm.txt (Active substances DCI, unit dosages, strengths)
 *   3. CIS_GENER_bdpm.txt (Generic groups and substitutions)
 *   4. CIS_CPD_bdpm.txt   (Special dispensing conditions)
 * 
 * Compiles a fast, clean pharmacological lookup index:
 *   - data/bdpm_pharmacology.json
 *   - cat_db_generator/data/bdpm_pharmacology.json
 */

const fs = require('fs');
const path = require('path');
const https = require('https');
const http = require('http');

const BDPM_BASE_URL = 'https://base-donnees-publique.medicaments.gouv.fr/download/file/';
const DATA_DIR = path.join(__dirname, '..', 'data');
const GEN_DATA_DIR = path.join(__dirname, '..', 'cat_db_generator', 'data');

const FILES = [
  'CIS_bdpm.txt',
  'CIS_COMPO_bdpm.txt',
  'CIS_GENER_bdpm.txt',
  'CIS_CPD_bdpm.txt'
];

function downloadFile(filename) {
  return new Promise((resolve, reject) => {
    const url = `${BDPM_BASE_URL}${filename}`;
    const dest = path.join(DATA_DIR, filename);
    console.log(`📥 Downloading ${filename} from ${url}...`);

    https.get(url, { headers: { 'User-Agent': 'DrCAT-Clinical-Ingester/2.0' } }, (res) => {
      if (res.statusCode >= 300 && res.statusCode < 400 && res.headers.location) {
        // Handle redirect
        https.get(res.headers.location, (redirectRes) => {
          const fileStream = fs.createWriteStream(dest);
          redirectRes.pipe(fileStream);
          fileStream.on('finish', () => {
            fileStream.close();
            console.log(`   ✅ Saved ${filename} (${(fs.statSync(dest).size / 1024).toFixed(1)} KB)`);
            resolve(dest);
          });
        }).on('error', reject);
      } else if (res.statusCode === 200) {
        const fileStream = fs.createWriteStream(dest);
        res.pipe(fileStream);
        fileStream.on('finish', () => {
          fileStream.close();
          console.log(`   ✅ Saved ${filename} (${(fs.statSync(dest).size / 1024).toFixed(1)} KB)`);
          resolve(dest);
        });
      } else {
        reject(new Error(`HTTP ${res.statusCode} for ${url}`));
      }
    }).on('error', reject);
  });
}

function cleanLatin1Text(buf) {
  // Decode latin1 (ISO-8859-1) / windows-1252 to UTF-8
  const iconv = require('util');
  const str = buf.toString('latin1');
  return str
    .replace(/\r\n/g, '\n')
    .replace(/\r/g, '\n');
}

async function runIngestion() {
  console.log('🏛️ ═══════════════════════════════════════════════════════════════');
  console.log('🏛️ DR. CAT — OFFICIAL FRENCH BDPM / ANSM PHARMACOLOGY INGESTION');
  console.log('🏛️ ═══════════════════════════════════════════════════════════════\n');

  if (!fs.existsSync(DATA_DIR)) fs.mkdirSync(DATA_DIR, { recursive: true });
  if (!fs.existsSync(GEN_DATA_DIR)) fs.mkdirSync(GEN_DATA_DIR, { recursive: true });

  // 1. Download all BDPM files
  for (const file of FILES) {
    const localPath = path.join(DATA_DIR, file);
    if (!fs.existsSync(localPath) || fs.statSync(localPath).size < 1000) {
      await downloadFile(file);
    } else {
      console.log(`📦 Using existing ${file} (${(fs.statSync(localPath).size / 1024).toFixed(1)} KB)`);
    }
  }

  console.log('\n⚙️ Parsing and assembling pharmacology indexes...');

  // 2. Parse CIS_bdpm.txt (CIS -> Product info)
  // Format: CIS \t Denomination \t Forme galenique \t Voies administration \t Statut adm \t Type proc \t Etat commercialisation \t Date AMM \t Statut BDM \t Numero UE \t Titulaires \t Surveillance
  const cisMap = new Map();
  const cisLines = cleanLatin1Text(fs.readFileSync(path.join(DATA_DIR, 'CIS_bdpm.txt'))).split('\n');
  
  for (const line of cisLines) {
    if (!line.trim()) continue;
    const cols = line.split('\t');
    if (cols.length >= 7) {
      const cis = cols[0].trim();
      const denomination = cols[1].trim();
      const galenicForm = cols[2].trim();
      const route = cols[3].trim();
      const status = cols[4].trim();
      const commercialized = cols[6].trim();
      const holder = (cols[10] || '').trim();

      cisMap.set(cis, {
        cis,
        denomination,
        galenicForm,
        route,
        status,
        commercialized: commercialized.toLowerCase().includes('commercialis'),
        holder,
        substances: [],
        genericGroup: null,
        dispensingConditions: []
      });
    }
  }
  console.log(`  ✅ Indexed ${cisMap.size} pharmaceutical products (CIS)`);

  // 3. Parse CIS_COMPO_bdpm.txt (CIS -> Substances / DCI & Dosages)
  // Format: CIS \t Element \t Code substance \t Nom substance (DCI) \t Dosage \t Reference dosage \t Nature composant \t Num ordre
  const dciIndex = new Map();
  const compoLines = cleanLatin1Text(fs.readFileSync(path.join(DATA_DIR, 'CIS_COMPO_bdpm.txt'))).split('\n');

  for (const line of compoLines) {
    if (!line.trim()) continue;
    const cols = line.split('\t');
    if (cols.length >= 6) {
      const cis = cols[0].trim();
      const substanceName = cols[3].trim().toUpperCase();
      const dosage = cols[4].trim();
      const refDosage = cols[5].trim();
      const nature = (cols[6] || '').trim(); // SA = Substance Active, FT = Fraction Thérapeutique

      const prod = cisMap.get(cis);
      if (prod) {
        prod.substances.push({
          dci: substanceName,
          dosage,
          refDosage,
          nature
        });
      }

      // Group by DCI for fast clinical search
      if (substanceName && (nature === 'SA' || nature === 'FT' || !nature)) {
        if (!dciIndex.has(substanceName)) {
          dciIndex.set(substanceName, {
            dci: substanceName,
            availableDosages: new Set(),
            availableForms: new Set(),
            availableRoutes: new Set(),
            sampleCommercialNames: new Set(),
            productsCount: 0
          });
        }
        const dciEntry = dciIndex.get(substanceName);
        dciEntry.productsCount++;
        if (dosage) dciEntry.availableDosages.add(dosage);
        if (prod && prod.galenicForm) dciEntry.availableForms.add(prod.galenicForm);
        if (prod && prod.route) dciEntry.availableRoutes.add(prod.route);
        if (prod && prod.denomination) {
          // Extract brand prefix (e.g. "CLAMOXYL 500 mg" -> "CLAMOXYL")
          const cleanBrand = prod.denomination.split(/\s+\d+/)[0].trim();
          if (cleanBrand.length < 35) dciEntry.sampleCommercialNames.add(cleanBrand);
        }
      }
    }
  }
  console.log(`  ✅ Indexed ${dciIndex.size} unique chemical active substances (DCI)`);

  // 4. Parse CIS_GENER_bdpm.txt (Generic groups)
  // Format: ID groupe generique \t Libelle groupe \t CIS \t Type generique (0: princeps, 1: generique, 2: generique substituable) \t Num tri
  const generLines = cleanLatin1Text(fs.readFileSync(path.join(DATA_DIR, 'CIS_GENER_bdpm.txt'))).split('\n');
  let generCount = 0;
  for (const line of generLines) {
    if (!line.trim()) continue;
    const cols = line.split('\t');
    if (cols.length >= 4) {
      const cis = cols[2].trim();
      const groupLabel = cols[1].trim();
      const prod = cisMap.get(cis);
      if (prod) {
        prod.genericGroup = groupLabel;
        generCount++;
      }
    }
  }
  console.log(`  ✅ Linked ${generCount} generic product associations`);

  // 5. Parse CIS_CPD_bdpm.txt (Conditions de prescription)
  // Format: CIS \t Condition prescription
  const cpdLines = cleanLatin1Text(fs.readFileSync(path.join(DATA_DIR, 'CIS_CPD_bdpm.txt'))).split('\n');
  for (const line of cpdLines) {
    if (!line.trim()) continue;
    const cols = line.split('\t');
    if (cols.length >= 2) {
      const cis = cols[0].trim();
      const condition = cols[1].trim();
      const prod = cisMap.get(cis);
      if (prod) {
        prod.dispensingConditions.push(condition);
      }
    }
  }

  // 6. Compile compact Master Pharmacology Index
  const compiledDciList = [];
  for (const [dci, entry] of dciIndex.entries()) {
    compiledDciList.push({
      dci,
      dosages: Array.from(entry.availableDosages).slice(0, 12),
      forms: Array.from(entry.availableForms).slice(0, 10),
      routes: Array.from(entry.availableRoutes),
      brands: Array.from(entry.sampleCommercialNames).slice(0, 8),
      productsCount: entry.productsCount
    });
  }

  // Sort by product frequency (most common molecules first: Paracetamol, Amoxicilline, Ibuprofen...)
  compiledDciList.sort((a, b) => b.productsCount - a.productsCount);

  const pharmacologyMaster = {
    source: 'ANSM / Base de Données Publique des Médicaments (data.gouv.fr)',
    lastUpdated: new Date().toISOString(),
    totalProducts: cisMap.size,
    totalDCIs: compiledDciList.length,
    dcis: compiledDciList
  };

  const outputPath1 = path.join(DATA_DIR, 'bdpm_pharmacology.json');
  const outputPath2 = path.join(GEN_DATA_DIR, 'bdpm_pharmacology.json');

  fs.writeFileSync(outputPath1, JSON.stringify(pharmacologyMaster, null, 2), 'utf8');
  fs.writeFileSync(outputPath2, JSON.stringify(pharmacologyMaster, null, 2), 'utf8');

  console.log('\n═══════════════════════════════════════════════════════════════');
  console.log(`🎉 INGESTION COMPLETE!`);
  console.log(`📊 Saved ${compiledDciList.length} Active Substances (DCIs) & ${cisMap.size} Authorized Medications.`);
  console.log(`📁 Output Index: ${outputPath1} (${(fs.statSync(outputPath1).size / 1024).toFixed(1)} KB)`);
  console.log('═══════════════════════════════════════════════════════════════\n');
}

runIngestion().catch(err => {
  console.error('❌ Ingestion Error:', err);
  process.exit(1);
});
