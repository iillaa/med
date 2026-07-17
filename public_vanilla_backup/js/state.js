// Client-side State Manager for Dr. CAT
export const state = {
  allCats: [],
  allPdfs: [],
  pdfIndexStatus: {}, // stores indexing status { 'filename.pdf': { status: 'green|orange|red', pagesWithText: N, totalPages: M } }
  isOnlineAtStartup: false, // Tracks internet connection availability at app first load
  activeCat: null,
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

// Local Storage helpers for personal progress/notes
export function getLocalProgress() {
  const data = localStorage.getItem('dr_cat_user_progress');
  return data ? JSON.parse(data) : {};
}

export function saveLocalProgress(progress) {
  localStorage.setItem('dr_cat_user_progress', JSON.stringify(progress));
}
