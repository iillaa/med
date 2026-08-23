import { safeGetItem, safeSetItem, safeParseJSON } from './lib/safeStorage.js';

// Client-side State Manager for Dr. CAT
export const state = {
  allCats: [],
  allPdfs: [],
  pdfIndexStatus: {}, // stores indexing status { 'filename.pdf': { status: 'green|orange|red', pagesWithText: N, totalPages: M } }
  isOnlineAtStartup: false, // Tracks internet connection availability at app first load
  activeCat: null,
  activeSubCatIndex: 0,
  activeStatusFilter: 'all',
  activePrescriptionVariantIndex: 0,
  prescriptionVariants: [],
  isAdmin: false,
  quizSession: {
    questions: [],
    currentIndex: 0,
    answers: [], // stores history of answers: { catId, questionTitle, type, score, userAnswer, correctAnswer }
    score: 0,
    quizViewingCatId: null
  }
};

/**
 * Normalizes a CAT object to ensure all expected properties are safely defined,
 * supporting both flat legacy schemas and hierarchical sub_cat v3 schemas.
 */
export function normalizeCat(cat) {
  if (!cat || typeof cat !== 'object') return cat;
  return {
    ...cat,
    id: cat.id ?? 0,
    title: cat.title || cat.nom || 'Fiche sans titre',
    category: cat.category || cat.specialite || 'Général',
    status: cat.status || 'todo',
    summary: cat.summary || cat.synthese || '',
    red_flags: cat.red_flags || cat.drapeaux_rouges || '',
    ordonnance: cat.ordonnance || cat.prescription || '',
    pdf_keywords: Array.isArray(cat.pdf_keywords) ? cat.pdf_keywords : [],
    sub_cats: Array.isArray(cat.sub_cats) ? cat.sub_cats : []
  };
}

// Local Storage helpers for personal progress/notes
export function getLocalProgress() {
  const data = safeGetItem('dr_cat_user_progress');
  return safeParseJSON(data, {});
}

export function saveLocalProgress(progress) {
  safeSetItem('dr_cat_user_progress', JSON.stringify(progress));
}

