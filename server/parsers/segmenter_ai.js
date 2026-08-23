const path = require('path');
const fs = require('fs');

require('dotenv').config();

const CACHE_DIR = path.join(__dirname, '..', '..', 'data', 'pdf_cache');

/**
 * Normalizes title to clean filename format mentioning only the pathology
 * Ex: "Hypertension Artérielle Essentielle" -> "HTA_Essentielle.pdf"
 */
function sanitizeSliceFilename(title) {
  let clean = (title || 'Extrait_Medical')
    .replace(/\.pdf$/i, '')
    .replace(/_pdf$/i, '')
    .normalize('NFD').replace(/[\u0300-\u036f]/g, '') // strip accents
    .replace(/[^a-zA-Z0-9_-]/g, '_')
    .replace(/_+/g, '_')
    .replace(/^_|_$/g, '');
  return clean + '.pdf';
}

/**
 * Analyzes cached text pages of a PDF to detect distinct medical pathologies,
 * clinical protocols, and therapeutic guides with their exact page boundaries.
 * 
 * @param {string} filename - PDF file basename (e.g. "CAT Dr_Boughoufala.pdf")
 * @param {Array} pages - Optional pre-loaded pages array [{ pageNum, text, ... }]
 * @returns {Promise<Array>} List of detected pathology segments
 */
async function detectPathologySegments(filename, pages = null) {
  const googleKey = process.env.GOOGLE_API_KEY || process.env.GEMINI_API_KEY;
  if (!googleKey) {
    throw new Error("Clé API Google Gemini introuvable dans .env (GOOGLE_API_KEY requis).");
  }

  // 1. Retrieve pages from cache if not provided
  if (!pages || !Array.isArray(pages) || pages.length === 0) {
    const cacheFile = path.join(CACHE_DIR, `${filename}.json`);
    if (fs.existsSync(cacheFile)) {
      try {
        const cached = JSON.parse(await fs.promises.readFile(cacheFile, 'utf8'));
        pages = cached.pages || [];
      } catch (err) {
        console.warn(`[Segmenter] Failed to read cache for ${filename}:`, err.message);
      }
    }

    // Fallback to pdf_index.json if cache file is missing or empty
    if (!pages || pages.length === 0) {
      const indexFile = path.join(__dirname, '..', '..', 'pdf_index.json');
      if (fs.existsSync(indexFile)) {
        try {
          const indexDocs = JSON.parse(await fs.promises.readFile(indexFile, 'utf8'));
          const found = indexDocs.find(d => d.pdf === filename);
          if (found && Array.isArray(found.pages) && found.pages.length > 0) {
            pages = found.pages;
          }
        } catch (_) {}
      }
    }
  }

  if (!pages || pages.length === 0) {
    throw new Error(`Aucun texte indexé disponible pour "${filename}". Veuillez d'abord parser ce PDF.`);
  }

  // 2. Prepare lightweight text summary per page (first 450 chars of each page to keep tokens minimal)
  const pageBriefs = pages.map((p, idx) => {
    const pageNum = p.pageNum || p.page || (idx + 1);
    const snippet = (p.text || p.content || '').replace(/\s+/g, ' ').trim().slice(0, 450);
    return `[PAGE ${pageNum}]: ${snippet}`;
  }).join('\n\n');

  const totalPages = pages.length;

  const prompt = `Tu es un médecin chef et expert en indexation médicale pour l'application Dr. CAT.
Voici les extraits de texte page par page d'un document médical de ${totalPages} pages intitulé "${filename}":

${pageBriefs}

TÂCHE :
Analyse le document et découpe-le en segments de PATHOLOGIES MÉDICALES DISTINCTES ou fiches de conduite à tenir (CAT).
Regroupe les pages consécutives qui traitent du même sujet clinique/thérapeutique.

RÈGLES IMPORTANTES :
1. Ignore les pages d'introduction, préfaces, tables des matières ou pages de garde non cliniques.
2. Pour chaque pathologie identifiée :
   - "pathology" : Nom médical clair et précis (ex: "Hypertension Artérielle Essentielle", "Asthme Aigu Grave", "Pneumopathie Franche Lobaire Aiguë", "Colique Néphrétique").
   - "title" : Nom de fichier court et canonique sans accents ni espaces (ex: "HTA_Essentielle.pdf", "Asthme_Aigu_Grave.pdf", "Colique_Nephretique.pdf").
   - "specialty" : Une spécialité médicale parmi : Cardiologie, Pneumologie, Gastro-entérologie, Neurologie, Dermatologie, Pédiatrie, Gynécologie-Obstétrique, Urgences & Réanimation, Infectiologie, Endocrinologie, Rhumatologie, ORL, Ophtalmologie, Néphrologie & Urologie, Hématologie, Psychiatrie, Médecine Interne, Thérapeutique Générale.
   - "startPage" : Numéro de page de début (1-indexé, entre 1 et ${totalPages}).
   - "endPage" : Numéro de page de fin (1-indexé, entre 1 et ${totalPages}, >= startPage).
    - "keyTopics" : Tableau des sections clés (ex: ["Clinique", "Traitement", "Posologies", "Critères d'hospitalisation"]).
    - "summary" : Résumé clinique en 1 phrase concise.
    - "confidence" : "high" (si fiche CAT complète et évidente), "medium" (si vignette clinique partielle), ou "uncertain" (si extrait court ou douteux).

Réponds STRICTEMENT sous la forme d'un tableau JSON d'objets :
[
  {
    "pathology": "...",
    "title": "...",
    "specialty": "...",
    "startPage": 1,
    "endPage": 3,
    "keyTopics": ["..."],
    "summary": "...",
    "confidence": "high"
  }
]`;

  const model = 'gemini-3.6-flash';
  const url = `https://generativelanguage.googleapis.com/v1beta/models/${model}:generateContent?key=${googleKey}`;

  console.log(`[AI Smart Slicer] 🤖 Analyzing "${filename}" (${totalPages} pages) with Gemini 3.6 Flash...`);

  const payload = {
    contents: [
      {
        parts: [
          { text: prompt }
        ]
      }
    ],
    generationConfig: {
      temperature: 0.1,
      responseMimeType: "application/json"
    }
  };

  const response = await fetch(url, {
    method: 'POST',
    headers: { 'Content-Type': 'application/json' },
    body: JSON.stringify(payload)
  });

  if (!response.ok) {
    const errorText = await response.text();
    console.error(`[AI Smart Slicer] ❌ Gemini API error (${response.status}):`, errorText);
    throw new Error(`Google API returned ${response.status}: ${errorText}`);
  }

  const data = await response.json();
  const rawText = data.candidates?.[0]?.content?.parts?.[0]?.text?.trim() || '[]';

  let segments = [];
  try {
    segments = JSON.parse(rawText);
  } catch (parseErr) {
    console.error("[AI Smart Slicer] ❌ JSON parse failed, raw output was:", rawText);
    throw new Error("L'IA n'a pas renvoyé un format JSON valide.");
  }

  if (!Array.isArray(segments)) {
    segments = [];
  }

  const coveredPages = new Set();

  // Validate and sanitize segments
  const validSegments = segments.map((seg, i) => {
    const start = Math.max(1, Math.min(totalPages, parseInt(seg.startPage, 10) || 1));
    const end = Math.max(start, Math.min(totalPages, parseInt(seg.endPage, 10) || start));
    const cleanTitle = sanitizeSliceFilename(seg.title || seg.pathology || `Extrait_${i + 1}`);

    for (let p = start; p <= end; p++) {
      coveredPages.add(p);
    }

    const conf = (seg.confidence || 'high').toLowerCase();
    const cleanConf = ['high', 'medium', 'uncertain'].includes(conf) ? conf : 'high';

    return {
      id: `seg_${Date.now()}_${i + 1}`,
      pathology: seg.pathology || `Pathologie ${i + 1}`,
      title: cleanTitle,
      specialty: seg.specialty || 'Médecine Générale',
      startPage: start,
      endPage: end,
      pageCount: (end - start) + 1,
      keyTopics: Array.isArray(seg.keyTopics) ? seg.keyTopics : ['Clinique', 'Traitement'],
      summary: seg.summary || '',
      confidence: cleanConf
    };
  });

  const uncoveredPages = [];
  for (let p = 1; p <= totalPages; p++) {
    if (!coveredPages.has(p)) uncoveredPages.push(p);
  }

  const coveragePercent = totalPages > 0 ? Math.round((coveredPages.size / totalPages) * 100) : 0;

  console.log(`[AI Smart Slicer] ✨ Identified ${validSegments.length} segments (${coveragePercent}% coverage, ${uncoveredPages.length} residual pages unassigned).`);

  return {
    filename,
    totalPages,
    segments: validSegments,
    coverage: {
      totalPages,
      coveredCount: coveredPages.size,
      coveragePercent,
      uncoveredPages
    }
  };
}

module.exports = {
  detectPathologySegments,
  sanitizeSliceFilename
};
