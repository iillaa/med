/**
 * PDF Specialty Metadata Tagger
 * Enriches pdf_index.json with medical specialty tags for targeted RAG filtering.
 */

const fs = require('fs');
const path = require('path');

const PDF_INDEX_PATH = path.join(__dirname, '..', 'pdf_index.json');

function inferSpecialty(filename) {
  const f = filename.toLowerCase().normalize('NFD').replace(/[\u0300-\u036f]/g, '');

  if (/dermato|eruptive/i.test(f)) return 'Dermatologie';
  if (/pediatr/i.test(f)) return 'Pédiatrie';
  if (/gyneco|contraception|grossesse/i.test(f)) return 'Gynécologie-Obstétrique';
  if (/cardio|ecg/i.test(f)) return 'Cardiologie';
  if (/gastro/i.test(f)) return 'Gastro-entérologie';
  if (/orl/i.test(f)) return 'ORL';
  if (/ophtalmo/i.test(f)) return 'Ophtalmologie';
  if (/pneumo|thoracique/i.test(f)) return 'Pneumologie';
  if (/neuro|reflexe/i.test(f)) return 'Neurologie';
  if (/urgence|reanimation|ionique/i.test(f)) return 'Urgences / Réanimation';
  if (/endocrino|diabete/i.test(f)) return 'Endocrinologie';
  if (/hemato|anemie/i.test(f)) return 'Hématologie';
  if (/infectieux|antibio/i.test(f)) return 'Infectiologie';
  if (/rhumato|inflammatoire/i.test(f)) return 'Rhumatologie';
  if (/uro/i.test(f)) return 'Urologie';
  if (/certificat/i.test(f)) return 'Médecine Légale / Administratif';
  
  return 'Médecine Générale / Multi-Spécialités';
}

function tagAllPdfs() {
  if (!fs.existsSync(PDF_INDEX_PATH)) {
    console.error('pdf_index.json not found!');
    return;
  }

  const index = JSON.parse(fs.readFileSync(PDF_INDEX_PATH, 'utf8'));
  let taggedCount = 0;

  for (const doc of index) {
    const specialty = inferSpecialty(doc.pdf);
    doc.specialty = specialty;
    taggedCount++;
  }

  fs.writeFileSync(PDF_INDEX_PATH, JSON.stringify(index, null, 2), 'utf8');
  console.log(`✅ Successfully tagged ${taggedCount} PDFs with medical specialties in pdf_index.json.`);
}

tagAllPdfs();
