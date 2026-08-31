const path = require('path');
const fs = require('fs');

require('dotenv').config();

const { applyModelBlocklist } = require('../../cat_db_generator/lib/llm-engine');
const debugEmitter = require('../../cat_db_generator/lib/debug-emitter');

const CACHE_DIR = path.join(__dirname, '..', '..', 'data', 'pdf_cache');

const LITE_MODEL_CANDIDATES = [
  'gemini-flash-lite-latest',
  'gemini-2.5-flash-lite',
  'gemini-2.0-flash-lite',
  'gemini-2.0-flash',
  'gemini-flash-latest'
];

/**
 * Deterministically scans LlamaParse / cached pages to extract pre-existing Markdown headings,
 * DCI drug mentions, numbered protocols, and section breaks (0 API token cost).
 */
function extractDocumentSkeleton(pages) {
  if (!Array.isArray(pages)) return '';
  const skeletonLines = [];

  pages.forEach((p, idx) => {
    const pageNum = p.pageNum || p.page || (idx + 1);
    const content = p.text || p.content || '';
    const headings = [];

    const lines = content.split('\n');
    for (const rawLine of lines) {
      const line = rawLine.trim();
      if (!line) continue;

      // Match markdown headers #, ##, ###
      if (/^#{1,4}\s+/i.test(line)) {
        const hText = line.replace(/^#{1,4}\s+/, '').replace(/[*_`]/g, '').replace(/<[^>]+>/g, '').trim();
        if (hText.length > 2 && !headings.includes(hText)) headings.push(`[Titre] ${hText}`);
      }
      // Match DCI mentions (e.g. "Amoxicilline(DCI)", "DCI : Paracétamol")
      else if (/\b(DCI)\b/i.test(line) || /\b(DCI\s*:)/i.test(line)) {
        const dciClean = line.replace(/[*_`]/g, '').replace(/<[^>]+>/g, '').trim();
        if (dciClean.length > 3 && dciClean.length < 80 && !headings.includes(dciClean)) {
          headings.push(`[DCI] ${dciClean}`);
        }
      }
      // Match numbered sections with bold titles (e.g. "**1) Amoxicilline**", "A) Beta lactamines")
      else if (/^(?:[A-Z]\)|\d+\))\s*(?:\*\*)?[A-Za-zÀ-ÿ]/i.test(line)) {
        const secClean = line.replace(/[*_`]/g, '').replace(/<[^>]+>/g, '').trim();
        if (secClean.length > 3 && secClean.length < 80 && !headings.includes(secClean)) {
          headings.push(`[Section] ${secClean}`);
        }
      }
      // Match uppercase/bold standalone lines
      else if (/^\*\*[A-Za-zÀ-ÿ0-9\s-]{4,50}\*\*$/i.test(line)) {
        const bClean = line.replace(/[*_`]/g, '').trim();
        if (!headings.includes(bClean)) headings.push(`[Pathologie] ${bClean}`);
      }
    }

    if (headings.length > 0) {
      skeletonLines.push(`• Page ${pageNum}: ${headings.slice(0, 8).join(' | ')}`);
    }
  });

  return skeletonLines.join('\n');
}

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

  // 2. Extract Document Skeleton from LlamaParse Cache (0 Tokens)
  const docSkeleton = extractDocumentSkeleton(pages);

  // 3. Prepare FULL un-truncated page text with clean whitespace normalization
  const pageBriefs = pages.map((p, idx) => {
    const pageNum = p.pageNum || p.page || (idx + 1);
    const cleanText = (p.text || p.content || '')
      .replace(/[ \t]+/g, ' ')
      .replace(/\n{3,}/g, '\n\n')
      .trim();
    return `[PAGE ${pageNum}]:\n${cleanText || '(Page sans texte brut / Schéma ou Image)'}`;
  }).join('\n\n---\n\n');

  const totalPages = pages.length;

  const prompt = `Tu es un médecin chef et expert en indexation médicale pour l'application Dr. CAT.
Voici les informations d'un document médical de ${totalPages} pages intitulé "${filename}":

${docSkeleton ? `--- GUIDE STRUCTUREL PRÉ-EXTRAIT DU PARSER (LLAMAPARSE OCR SKELETON) ---
${docSkeleton}
------------------------------------------------------------------------\n` : ''}
--- CONTENU COMPLET PAGE PAR PAGE ---
${pageBriefs}

TÂCHE :
Analyse le document médical et découpe-le en fiches granulaires et distinctes de PATHOLOGIES, MOLÉCULES THÉRAPEUTIQUES ou CONDUITES À TENIR (CAT).
Utilise le GUIDE STRUCTUREL pour identifier avec précision le début et la fin de chaque fiche.

RÈGLES IMPORTANTES :
1. Ignore les pages d'introduction, préfaces, tables des matières ou pages de garde non cliniques.
2. Si le document contient plusieurs molécules ou plusieurs pathologies distinctes (ex: Amoxicilline, Augmentin, Oxacilline, Céfazoline, Céfixime, Azithromycine, Ciprofloxacine, etc.), GÉNÈRE UNE FICHE GRANULAIRE DISTINCTE pour chaque molécule/pathologie avec ses pages exactes (ex: startPage: 1, endPage: 2).
3. RÈGLE DE SÉCURITÉ CLINIQUE & MARGE DE SÉCURITÉ (CRITIQUE) :
   - Mieux vaut TOUJOURS inclure une page de marge supplémentaire plutôt que de risquer de couper une posologie, un tableau, un schéma thérapeutique ou une ordonnance.
   - Si une pathologie commence au milieu ou en bas de la page N, commence à la page N.
   - Si une pathologie déborde en haut de la page N+1 (même pour 2 lignes de posologie ou de conclusion), ÉTENDS impérativement endPage à la page N+1.
   - Si une page intermédiaire contient une image, un ECG, un schéma anatomique ou un arbre décisionnel, conserve-la obligatoirement dans la fiche.
4. Pour chaque fiche identifiée :
   - "pathology" : Nom médical clair et précis (ex: "Amoxicilline", "Amoxicilline + Acide Clavulanique", "Asthme Aigu Grave", "Colique Néphrétique").
   - "title" : Nom de fichier court et canonique sans accents ni espaces (ex: "Amoxicilline.pdf", "Augmentin_Amox_Clav.pdf", "Colique_Nephretique.pdf").
   - "specialty" : Une spécialité médicale parmi : Cardiologie, Pneumologie, Gastro-entérologie, Neurologie, Dermatologie, Pédiatrie, Gynécologie-Obstétrique, Urgences & Réanimation, Infectiologie, Endocrinologie, Rhumatologie, ORL, Ophtalmologie, Néphrologie & Urologie, Hématologie, Psychiatrie, Médecine Interne, Thérapeutique Générale.
   - "startPage" : Numéro de page de début (1-indexé, entre 1 et ${totalPages}).
   - "endPage" : Numéro de page de fin (1-indexé, entre 1 et ${totalPages}, >= startPage).
   - "keyTopics" : Tableau des sections clés (ex: ["Posologies", "Indications", "Formes galéniques", "Contre-indications"]).
   - "summary" : Résumé clinique en 1 phrase concise.
   - "confidence" : "high" (si fiche évidente), "medium" (si vignette partielle), ou "uncertain" (si extrait court).

Réponds STRICTEMENT sous la forme d'un tableau JSON d'objets :
[
  {
    "pathology": "...",
    "title": "...",
    "specialty": "...",
    "startPage": 1,
    "endPage": 2,
    "keyTopics": ["..."],
    "summary": "...",
    "confidence": "high"
  }
]`;

  const availableModels = applyModelBlocklist(LITE_MODEL_CANDIDATES);
  if (availableModels.length === 0) {
    throw new Error('GEMINI_BLOCKLIST a filtré tous les modèles Lite disponibles. Vérifier .env.');
  }

  let rawText = null;
  let usedModel = null;
  let lastError = null;

  for (const model of availableModels) {
    let attempts = 0;
    while (attempts < 2) {
      attempts++;
      try {
        console.log(`[AI Smart Slicer] 🤖 Analyzing "${filename}" (${totalPages} full pages) with ${model} (attempt ${attempts})...`);
        debugEmitter.emitEvent('llm_model_attempt', {
          model,
          task: 'auto_slice',
          filename,
          totalPages
        });

        const url = `https://generativelanguage.googleapis.com/v1beta/models/${model}:generateContent?key=${googleKey}`;
        const payload = {
          contents: [
            {
              parts: [{ text: prompt }]
            }
          ],
          generationConfig: {
            temperature: 0.1,
            responseMimeType: "application/json"
          }
        };

        const controller = new AbortController();
        const timeoutId = setTimeout(() => controller.abort(), 60000);
        let response = null;
        try {
          response = await fetch(url, {
            method: 'POST',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify(payload),
            signal: controller.signal
          });
        } finally {
          clearTimeout(timeoutId);
        }

        if (response.status === 429) {
          console.warn(`⚠️ [AI Smart Slicer] HTTP 429 rate limit on ${model}. Pausing 8s...`);
          await new Promise(r => setTimeout(r, 8000));
          continue;
        }

        if (!response.ok) {
          const errBody = await response.text();
          throw new Error(`Google API returned ${response.status}: ${errBody}`);
        }

        const data = await response.json();
        rawText = data.candidates?.[0]?.content?.parts?.[0]?.text?.trim() || '[]';
        usedModel = model;
        break;
      } catch (err) {
        lastError = err;
        console.warn(`⚠️ [AI Smart Slicer] Model ${model} attempt ${attempts} failed: ${err.message}`);
      }
    }
    if (rawText) break;
  }

  if (!rawText) {
    throw new Error(`Échec de l'analyse IA de segmentation : ${lastError ? lastError.message : 'Aucune réponse du LLM'}`);
  }

  let segments = [];
  try {
    let cleanJson = rawText.replace(/```json/gi, '').replace(/```/g, '').trim();
    segments = JSON.parse(cleanJson);
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

  console.log(`[AI Smart Slicer] ✨ [${usedModel}] Identified ${validSegments.length} segments (${coveragePercent}% coverage, ${uncoveredPages.length} residual pages unassigned).`);

    return {
      filename,
      totalPages,
      usedModel,
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
