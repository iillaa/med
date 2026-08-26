import { state } from '../../state.js';
import { fetchQuizVignettes } from '../../api.js';
import { showToast, triggerHaptic, countUp, escapeHTML } from '../../utils.js';
import { safeGetItem, safeParseJSON } from '../../lib/safeStorage.js';
import { shuffleArray, updateLeitnerStats, updateQuizStreak, requestWakeLock, releaseWakeLock } from './state.js';
import {
  getOrientationText, cleanTextOfClues, cleanOrientationOfClues,
  generateClinicalVignette, getKeywordHints
} from './quiz_generator.js';
import { submitWriteInAnswer, saveWriteInGrade } from './scoring.js';

let quizScreen, welcomeScreen, workspaceView;
let quizSetupView, quizActiveView, quizResultsView;
let quizCategorySelect, quizCountSelect;
let checkboxVignettes, checkboxSpecialty, checkboxRedflags, checkboxPrescription, checkboxPosology;
let checkboxSpacedRepetition, checkboxTimedMode, selectTimerSeconds;
let timerWrapper, timerCount, timerFill;
let hintBtn, hintBox;
let weakPointsPanel, categoryScoresList, retryErrorsBtn;
let progressText, progressFill, startQuizBtn;
let qMeta, qPoints, qTitle, qcmContainer, writeinContainer, userTextArea, submitTextBtn;
let feedbackPanel, feedbackHeader, feedbackStatus;
let comparisonGrid, displayUserAnswer, displayCorrectAnswer;
let rationaleBox, rationaleText;
let keywordsMatchedPanel, keywordsMatchedTags;
let selfGradingPanel, btnGradeFull, btnGradePartial, btnGradeZero;
let viewRefBtn, nextBtn;
let restoreBtn = null;
let resultsScore, resultsFeedback, resultsTableBody, retryBtn, quitBtn;

let timerIntervalId = null;
let timeLeft = 0;
let questionMaxPoints = 1.0;
let wakeLock = null;

let globalOnOpenCatCard = null;

export function cleanupQuizTimers() {
  if (timerIntervalId) {
    clearInterval(timerIntervalId);
    timerIntervalId = null;
  }
  if (wakeLock) {
    releaseWakeLock(wakeLock);
    wakeLock = null;
  }
}

export function initQuiz(onOpenCatCard) {
  globalOnOpenCatCard = onOpenCatCard;

  quizScreen = document.getElementById('quiz-screen');
  welcomeScreen = document.getElementById('welcome-screen');
  workspaceView = document.getElementById('workspace');

  quizSetupView = document.getElementById('quiz-setup-view');
  quizActiveView = document.getElementById('quiz-active-view');
  quizResultsView = document.getElementById('quiz-results-view');

  quizCategorySelect = document.getElementById('quiz-category');
  quizCountSelect = document.getElementById('quiz-count');
  checkboxVignettes = document.getElementById('quiz-type-vignettes');
  checkboxSpecialty = document.getElementById('quiz-type-specialty');
  checkboxRedflags = document.getElementById('quiz-type-redflags');
  checkboxPrescription = document.getElementById('quiz-type-prescription');
  checkboxPosology = document.getElementById('quiz-type-posology');
  startQuizBtn = document.getElementById('start-quiz-btn');

  progressText = document.getElementById('quiz-progress-text');
  progressFill = document.getElementById('quiz-progress-fill');
  qMeta = document.getElementById('quiz-q-meta');
  qPoints = document.getElementById('quiz-q-points');
  qTitle = document.getElementById('quiz-q-title');
  qcmContainer = document.getElementById('quiz-qcm-container');
  writeinContainer = document.getElementById('quiz-writein-container');
  userTextArea = document.getElementById('quiz-user-text');
  submitTextBtn = document.getElementById('quiz-submit-text-btn');

  feedbackPanel = document.getElementById('quiz-feedback-panel');
  feedbackHeader = document.getElementById('quiz-feedback-header');
  feedbackStatus = document.getElementById('quiz-feedback-status');
  comparisonGrid = document.getElementById('quiz-comparison-grid');
  displayUserAnswer = document.getElementById('quiz-display-user-answer');
  displayCorrectAnswer = document.getElementById('quiz-display-correct-answer');
  rationaleBox = document.getElementById('quiz-rationale-box');
  rationaleText = document.getElementById('quiz-rationale-text');
  keywordsMatchedPanel = document.getElementById('quiz-keywords-matched-panel');
  keywordsMatchedTags = document.getElementById('quiz-keywords-matched-tags');

  selfGradingPanel = document.getElementById('quiz-self-grading-panel');
  btnGradeFull = document.getElementById('quiz-grade-full');
  btnGradePartial = document.getElementById('quiz-grade-partial');
  btnGradeZero = document.getElementById('quiz-grade-zero');

  viewRefBtn = document.getElementById('quiz-view-ref-btn');
  nextBtn = document.getElementById('quiz-next-btn');

  resultsScore = document.getElementById('quiz-results-score');
  resultsFeedback = document.getElementById('quiz-results-feedback');
  resultsTableBody = document.getElementById('quiz-results-table-body');
  retryBtn = document.getElementById('quiz-retry-btn');
  quitBtn = document.getElementById('quiz-quit-btn');

  checkboxSpacedRepetition = document.getElementById('quiz-spaced-repetition');
  checkboxTimedMode = document.getElementById('quiz-timed-mode');
  selectTimerSeconds = document.getElementById('quiz-timer-seconds');

  timerWrapper = document.getElementById('quiz-timer-wrapper');
  timerCount = document.getElementById('quiz-timer-count');
  timerFill = document.getElementById('quiz-timer-fill');

  hintBtn = document.getElementById('quiz-hint-btn');
  hintBox = document.getElementById('quiz-hint-box');

  weakPointsPanel = document.getElementById('quiz-weak-points-panel');
  categoryScoresList = document.getElementById('quiz-category-scores-list');
  retryErrorsBtn = document.getElementById('quiz-retry-errors-btn');

  if (checkboxTimedMode && selectTimerSeconds) {
    checkboxTimedMode.addEventListener('change', () => {
      selectTimerSeconds.style.display = checkboxTimedMode.checked ? 'block' : 'none';
    });
  }

  const sidebarQuizBtn = document.getElementById('start-quiz-nav-btn');
  if (sidebarQuizBtn) {
    sidebarQuizBtn.addEventListener('click', () => {
      showQuizSetup();
      const sidebar = document.getElementById('sidebar');
      if (window.innerWidth <= 850 && sidebar) {
        sidebar.classList.remove('open');
      }
    });
  }

  if (startQuizBtn) startQuizBtn.addEventListener('click', startQuizSession);
  if (submitTextBtn) submitTextBtn.addEventListener('click', () => {
    restoreBtn = submitWriteInAnswer({
      userTextArea, submitTextBtn, keywordsMatchedTags, displayUserAnswer,
      displayCorrectAnswer, feedbackPanel, comparisonGrid, keywordsMatchedPanel,
      selfGradingPanel, feedbackStatus, feedbackHeader, nextBtn
    });
  });

  if (btnGradeFull) btnGradeFull.addEventListener('click', () => saveWriteInGrade({
    userTextArea, selfGradingPanel, feedbackStatus, feedbackHeader, nextBtn, restoreBtn
  }, 1.0, questionMaxPoints));
  if (btnGradePartial) btnGradePartial.addEventListener('click', () => saveWriteInGrade({
    userTextArea, selfGradingPanel, feedbackStatus, feedbackHeader, nextBtn, restoreBtn
  }, 0.5, questionMaxPoints));
  if (btnGradeZero) btnGradeZero.addEventListener('click', () => saveWriteInGrade({
    userTextArea, selfGradingPanel, feedbackStatus, feedbackHeader, nextBtn, restoreBtn
  }, 0.0, questionMaxPoints));

  if (hintBtn) hintBtn.addEventListener('click', showHint);
  if (retryErrorsBtn) retryErrorsBtn.addEventListener('click', retryFailedQuestions);

  if (viewRefBtn) {
    viewRefBtn.addEventListener('click', () => {
      const q = state.quizSession.questions[state.quizSession.currentIndex];
      if (q && q.cat && globalOnOpenCatCard) {
        state.quizSession.quizViewingCatId = q.cat.id;
        quizScreen.style.display = 'none';
        globalOnOpenCatCard(q.cat);
      }
    });
  }

  if (nextBtn) nextBtn.addEventListener('click', advanceQuestion);
  if (retryBtn) retryBtn.addEventListener('click', showQuizSetup);
  if (quitBtn) {
    quitBtn.addEventListener('click', () => {
      if (timerIntervalId) clearInterval(timerIntervalId);
      releaseWakeLock(wakeLock);
      quizScreen.style.display = 'none';
      if (welcomeScreen) welcomeScreen.style.display = 'flex';
      state.quizSession.questions = [];
      document.querySelectorAll('.cat-item').forEach(item => item.classList.remove('active'));
    });
  }
}

function showQuizSetup() {
  state.quizSession.failedQuestions = [];

  if (timerIntervalId) clearInterval(timerIntervalId);
  if (workspaceView) workspaceView.style.display = 'none';
  if (welcomeScreen) welcomeScreen.style.display = 'none';
  const libScreen = document.getElementById('library-screen');
  if (libScreen) libScreen.style.display = 'none';
  if (quizScreen) quizScreen.style.display = 'flex';

  if (quizSetupView) quizSetupView.style.display = 'flex';
  if (quizActiveView) quizActiveView.style.display = 'none';
  if (quizResultsView) quizResultsView.style.display = 'none';

  if (quizCategorySelect) {
    const categories = new Set((state.allCats || []).map(c => c.category));
    quizCategorySelect.innerHTML = '<option value="all">Toutes les spécialités</option>';
    categories.forEach(cat => {
      const opt = document.createElement('option');
      opt.value = cat;
      opt.textContent = cat;
      quizCategorySelect.appendChild(opt);
    });
  }
}

async function startQuizSession() {
  const selectedCategory = quizCategorySelect ? quizCategorySelect.value : 'all';
  const questionCount = quizCountSelect ? parseInt(quizCountSelect.value) : 10;
  const includeVignettes = checkboxVignettes ? checkboxVignettes.checked : true;
  const includeClinical = checkboxSpecialty ? checkboxSpecialty.checked : false;
  const includePosology = checkboxPosology ? checkboxPosology.checked : false;
  const includeRedflags = checkboxRedflags ? checkboxRedflags.checked : false;
  const includePrescription = checkboxPrescription ? checkboxPrescription.checked : false;

  if (!includeVignettes && !includeClinical && !includePosology && !includeRedflags && !includePrescription) {
    alert("Veuillez sélectionner au moins un type de question.");
    return;
  }

  // Load structured vignettes if not already cached
  if (includeVignettes && (!state.allQuizVignettes || state.allQuizVignettes.length === 0)) {
    state.allQuizVignettes = await fetchQuizVignettes();
  }

  let filteredCats = selectedCategory === 'all'
    ? (state.allCats || [])
    : (state.allCats || []).filter(c => c.category === selectedCategory);

  if (filteredCats.length === 0) {
    alert("Aucune fiche trouvée dans cette catégorie.");
    return;
  }

  let leitnerData = safeParseJSON(safeGetItem('dr_cat_leitner'), {}) || {};

  const boxIntervals = {
    1: 1  * 24 * 60 * 60 * 1000,
    2: 3  * 24 * 60 * 60 * 1000,
    3: 7  * 24 * 60 * 60 * 1000,
    4: 14 * 24 * 60 * 60 * 1000,
    5: 30 * 24 * 60 * 60 * 1000
  };

  if (checkboxSpacedRepetition && checkboxSpacedRepetition.checked) {
    filteredCats = [...filteredCats].sort((a, b) => {
      const statsA = leitnerData[a.id] || { box: 1, lastQuizzed: 0 };
      const statsB = leitnerData[b.id] || { box: 1, lastQuizzed: 0 };
      const dueA = (Date.now() - (statsA.lastQuizzed || 0)) / boxIntervals[statsA.box || 1];
      const dueB = (Date.now() - (statsB.lastQuizzed || 0)) / boxIntervals[statsB.box || 1];
      return dueB - dueA;
    });
  } else {
    shuffleArray(filteredCats);
  }

  const generatedQuestions = [];

  // 1. High-Yield Progressive Vignettes (RAG V2)
  if (includeVignettes && Array.isArray(state.allQuizVignettes) && state.allQuizVignettes.length > 0) {
    const relevantVignettes = selectedCategory === 'all'
      ? state.allQuizVignettes
      : state.allQuizVignettes.filter(v => v.category === selectedCategory);

    relevantVignettes.forEach(vig => {
      const matchingCat = (state.allCats || []).find(c => c.id === vig.cat_id) || {
        id: vig.cat_id,
        title: vig.title,
        category: vig.category,
        summary: '',
        red_flags: '',
        ordonnance: ''
      };

      (vig.stages || []).forEach(stage => {
        const correctOpt = (stage.options || []).find(o => o.correct === true);
        if (!correctOpt) return;

        const options = (stage.options || []).map(o => o.text);
        shuffleArray(options);

        // Map text to rationale dictionary
        const rationales = {};
        (stage.options || []).forEach(o => {
          rationales[o.text] = o.rationale || "";
        });

        const patientBox = `
          <div style="background: rgba(6,182,212,0.06); border: 1px solid rgba(6,182,212,0.25); border-radius: var(--radius-sm); padding: 12px 14px; margin-bottom: 12px;">
            <div style="font-size: 11px; font-weight: 800; color: var(--color-primary); text-transform: uppercase; margin-bottom: 4px; display: flex; align-items: center; gap: 6px;">
              <i class="fa-solid fa-hospital-user"></i> Patient (${vig.patient.sex === 'M' ? 'Homme' : 'Femme'} ${vig.patient.age < 1 ? Math.round(vig.patient.age * 12) + ' mois' : vig.patient.age + ' ans'}) — ${escapeHTML(vig.patient.terrain || 'Standard')}
            </div>
            <div style="font-size: 13.5px; color: var(--text-primary); line-height: 1.45;">
              ${escapeHTML(vig.patient.presentation)}
            </div>
          </div>
        `;

        generatedQuestions.push({
          type: 'vignette_v2',
          vignetteId: vig.id,
          stageType: stage.type,
          cat: matchingCat,
          questionText: `${patientBox}<strong>${escapeHTML(stage.title_step || 'Décision Clinique')} :</strong><br><span style="font-size: 14px; font-weight: 600; color: var(--text-primary);">${escapeHTML(stage.prompt)}</span>`,
          correctAnswer: correctOpt.text,
          options: options,
          rationales: rationales,
          points: 1.0
        });
      });
    });
  }

  filteredCats.forEach(cat => {
    const vignette = generateClinicalVignette(cat);

    if (includeClinical) {
      const rawOrientation = getOrientationText(cat);
      if (rawOrientation && rawOrientation.trim().length > 0) {
        const correctAnswer = cleanOrientationOfClues(rawOrientation, cat.title, cat.category);
        if (correctAnswer && correctAnswer.trim().length > 0) {
          let candidateCats = (state.allCats || []).filter(c => c.id !== cat.id && c.category === cat.category);
          if (candidateCats.length < 3) {
            const otherSpecialtyCats = (state.allCats || []).filter(c => c.id !== cat.id && c.category !== cat.category);
            candidateCats = [...candidateCats, ...otherSpecialtyCats];
          }

          const otherOrientations = Array.from(new Set(
            candidateCats.map(c => {
              const rawText = getOrientationText(c);
              return cleanOrientationOfClues(rawText, c.title, c.category);
            }).filter(t => t && t.trim().length > 0 && t !== correctAnswer)
          ));
          shuffleArray(otherOrientations);
          const distractors = otherOrientations.slice(0, 3);
          const options = [correctAnswer, ...distractors];
          shuffleArray(options);

          generatedQuestions.push({
            type: 'clinical',
            cat: cat,
            questionText: `<strong>Simulation de Cas Clinique :</strong><br><br>${escapeHTML(vignette)}<br><br>En tant que clinicien, quelle est votre <strong>conduite à tenir ou orientation thérapeutique</strong> prioritaire à ce stade ?`,
            correctAnswer: correctAnswer,
            options: options,
            points: 1.0
          });
        }
      }
    }

    if (includePosology) {
      const rawOrdonnance = cat.ordonnance;
      if (rawOrdonnance && rawOrdonnance.trim().length > 0) {
        const correctAnswer = cleanTextOfClues(rawOrdonnance, cat.title, cat.category);
        if (correctAnswer && correctAnswer.trim().length > 0) {
          let candidateCats = (state.allCats || []).filter(c => c.id !== cat.id && c.category === cat.category);
          if (candidateCats.length < 3) {
            const otherSpecialtyCats = (state.allCats || []).filter(c => c.id !== cat.id && c.category !== cat.category);
            candidateCats = [...candidateCats, ...otherSpecialtyCats];
          }

          const otherOrdonnances = Array.from(new Set(
            candidateCats.map(c => cleanTextOfClues(c.ordonnance, c.title, c.category))
              .filter(o => o && o.trim().length > 0 && o !== correctAnswer)
          ));
          shuffleArray(otherOrdonnances);
          const distractors = otherOrdonnances.slice(0, 3);
          const options = [correctAnswer, ...distractors];
          shuffleArray(options);

          generatedQuestions.push({
            type: 'posology',
            cat: cat,
            questionText: `<strong>Prescription Médicale :</strong><br><br>${escapeHTML(vignette)}<br><br>Quelle est l'<strong>ordonnance type recommandée</strong> (molécules, posologies et durées de traitement) pour ce patient ?`,
            correctAnswer: correctAnswer,
            options: options,
            points: 1.0
          });
        }
      }
    }

    if (includeRedflags && cat.red_flags && cat.red_flags.trim().length > 0) {
      generatedQuestions.push({
        type: 'redflags',
        cat: cat,
        questionText: `<strong>Signes de Gravité (Red Flags) :</strong><br><br>${escapeHTML(vignette)}<br><br>Quels sont les <strong>Red Flags / Signes de Gravité</strong> cliniques prioritaires à rechercher ou éliminer pour ce patient ?`,
        correctAnswer: cat.red_flags,
        points: 1.0
      });
    }

    if (includePrescription && cat.ordonnance && cat.ordonnance.trim().length > 0) {
      generatedQuestions.push({
        type: 'prescription',
        cat: cat,
        questionText: `<strong>Rédaction d'Ordonnance :</strong><br><br>${escapeHTML(vignette)}<br><br>Rédigez l'<strong>Ordonnance Type</strong> complète (traitements, posologies, et durées conseillées) pour ce patient.`,
        correctAnswer: cat.ordonnance,
        points: 1.0
      });
    }
  });

  if (generatedQuestions.length === 0) {
    alert("Impossible de générer des questions. Les fiches correspondantes ne possèdent pas les informations requises.");
    return;
  }

  let selectedQuestions = [];
  if (checkboxSpacedRepetition && checkboxSpacedRepetition.checked) {
    selectedQuestions = generatedQuestions.slice(0, questionCount);
    shuffleArray(selectedQuestions);
  } else {
    shuffleArray(generatedQuestions);
    selectedQuestions = generatedQuestions.slice(0, questionCount);
  }

  state.quizSession.questions = selectedQuestions;
  state.quizSession.currentIndex = 0;
  state.quizSession.answers = [];
  state.quizSession.score = 0;
  state.quizSession.failedQuestions = [];
  state.quizSession.isTimed = !!(checkboxTimedMode && checkboxTimedMode.checked);
  state.quizSession.timerSeconds = (selectTimerSeconds ? parseInt(selectTimerSeconds.value) : 0) || 30;

  if (quizSetupView) quizSetupView.style.display = 'none';
  if (quizActiveView) quizActiveView.style.display = 'flex';
  if (quizResultsView) quizResultsView.style.display = 'none';

  requestWakeLock().then(lock => { wakeLock = lock; });
  renderQuestion();
}

function renderQuestion() {
  if (window.perf) window.perf.startMeasure('quiz.renderQuestion');
  const session = state.quizSession;
  if (!session || !session.questions || session.questions.length === 0) {
    console.error("No questions found in the quiz session.");
    alert("Erreur: Aucune question disponible pour ce quiz.");
    showQuizSetup();
    return;
  }

  const q = session.questions[session.currentIndex];
  if (!q) {
    console.error("Question at index is undefined:", session.currentIndex);
    showQuizSetup();
    return;
  }

  const progressPercent = Math.round((session.currentIndex / session.questions.length) * 100);
  if (progressText) progressText.textContent = `Question ${session.currentIndex + 1} / ${session.questions.length}`;
  if (progressFill) progressFill.style.width = `${progressPercent || 5}%`;

  if (qTitle) qTitle.innerHTML = q.questionText;

  questionMaxPoints = 1.0;
  if (hintBox) {
    hintBox.style.display = 'none';
    hintBox.innerHTML = '';
  }
  if (hintBtn) {
    hintBtn.disabled = false;
    hintBtn.style.opacity = '1';
    if (q.type === 'redflags' || q.type === 'prescription') {
      hintBtn.style.display = 'flex';
    } else {
      hintBtn.style.display = 'none';
    }
  }

  if (qMeta) {
    if (q.type === 'vignette_v2') {
      qMeta.textContent = "Cas Clinique Réel 🏥";
      qMeta.className = "cat-badge";
      qMeta.style.background = "linear-gradient(135deg, var(--color-primary), #10b981)";
      qMeta.style.color = "#000";
      qMeta.style.fontWeight = "800";
    } else if (q.type === 'clinical') {
      qMeta.textContent = "Conduite à Tenir 🩺";
      qMeta.className = "cat-badge";
      qMeta.style.background = "var(--color-primary)";
      qMeta.style.color = "#000";
    } else if (q.type === 'posology') {
      qMeta.textContent = "Ordonnance QCM 💊";
      qMeta.className = "cat-badge";
      qMeta.style.background = "var(--color-warning)";
      qMeta.style.color = "#000";
    } else if (q.type === 'redflags') {
      qMeta.textContent = "Signes de Gravité ✍️";
      qMeta.className = "cat-badge";
      qMeta.style.background = "var(--color-danger)";
      qMeta.style.color = "#fff";
    } else {
      qMeta.textContent = "Ordonnance Type ✍️";
      qMeta.className = "cat-badge";
      qMeta.style.backgroundColor = "var(--color-success)";
      qMeta.style.color = "#000";
    }
  }

  if (qPoints) qPoints.textContent = `Valeur : ${q.points} pt`;

  if (feedbackPanel) feedbackPanel.style.display = 'none';

  if (q.type === 'vignette_v2' || q.type === 'clinical' || q.type === 'posology') {
    qcmContainer.style.display = 'flex';
    writeinContainer.style.display = 'none';
    generateQCMOptions(q);
  } else {
    qcmContainer.style.display = 'none';
    writeinContainer.style.display = 'flex';
    if (userTextArea) {
      userTextArea.value = '';
      userTextArea.disabled = false;
    }
    if (submitTextBtn) {
      submitTextBtn.style.display = 'block';
      submitTextBtn.disabled = false;
      submitTextBtn.classList.remove('loading');
      submitTextBtn.innerHTML = '<i class="fa-solid fa-check"></i> Valider ma réponse';
    }
  }

  if (session.isTimed) {
    if (timerWrapper) timerWrapper.style.display = 'flex';
    startQuestionTimer();
  } else {
    if (timerWrapper) timerWrapper.style.display = 'none';
  }

  const questionCard = document.getElementById('quiz-question-card');
  if (questionCard) {
    questionCard.classList.remove('animate-entrance');
    requestAnimationFrame(() => {
      requestAnimationFrame(() => {
        questionCard.classList.add('animate-entrance');
      });
    });
  }

  if (window.perf) window.perf.endMeasure('quiz.renderQuestion');
}

function generateQCMOptions(question) {
  qcmContainer.innerHTML = '';

  let options = [];
  if (question.options) {
    options = [...question.options];
  } else {
    const categories = Array.from(new Set(state.allCats.map(c => c.category)))
      .filter(cat => cat !== question.correctAnswer);

    shuffleArray(categories);
    const distractors = categories.slice(0, 3);

    options = [question.correctAnswer, ...distractors];
    shuffleArray(options);
  }

  options.forEach(opt => {
    const btn = document.createElement('button');
    btn.className = 'resume-item';
    btn.style.width = '100%';
    btn.style.textAlign = 'left';
    btn.style.padding = '14px 20px';
    btn.style.background = 'var(--bg-card)';
    btn.style.border = '1px solid var(--border-color)';
    btn.style.borderRadius = 'var(--radius-sm)';
    btn.dataset.option = opt;
    // Build label without innerHTML to avoid re-parsing HTML / injection surface.
    const labelSpan = document.createElement('span');
    labelSpan.style.fontSize = '13px';
    labelSpan.style.fontWeight = '600';
    labelSpan.style.color = 'var(--text-primary)';
    labelSpan.style.lineHeight = '1.4';
    labelSpan.style.display = 'block';
    labelSpan.style.textAlign = 'left';
    opt.split('\n').forEach((line, i) => {
      if (i > 0) labelSpan.appendChild(document.createElement('br'));
      labelSpan.appendChild(document.createTextNode(line));
    });
    btn.appendChild(labelSpan);

    btn.addEventListener('click', () => {
      if (timerIntervalId) clearInterval(timerIntervalId);
      qcmContainer.querySelectorAll('button').forEach(b => {
        b.disabled = true;
        b.style.pointerEvents = 'none';

        if (b.dataset.option === question.correctAnswer) {
          b.style.borderColor = 'var(--color-success)';
          b.style.background = 'rgba(16, 185, 129, 0.05)';
        }
      });

      const isCorrect = (opt === question.correctAnswer);
      triggerHaptic(isCorrect);
      if (isCorrect) {
        btn.style.borderColor = 'var(--color-success)';
        btn.style.background = 'rgba(16, 185, 129, 0.08)';
        state.quizSession.score += question.points;
      } else {
        btn.style.borderColor = 'var(--color-danger)';
        btn.style.background = 'rgba(239, 68, 68, 0.08)';
      }

      state.quizSession.answers.push({
        catId: question.cat.id,
        catTitle: question.cat.title,
        type: question.type,
        userAnswer: opt,
        correctAnswer: question.correctAnswer,
        score: isCorrect ? question.points : 0
      });

      updateLeitnerStats(question.cat.id, isCorrect);
      showQCMFeedback(isCorrect, question.correctAnswer, opt, question);
    });

    qcmContainer.appendChild(btn);
  });
}

function showQCMFeedback(isCorrect, correctAnswer, userAnswer, question = null) {
  if (!feedbackPanel) return;

  feedbackPanel.style.display = 'flex';
  if (comparisonGrid) comparisonGrid.style.display = 'grid';
  if (keywordsMatchedPanel) keywordsMatchedPanel.style.display = 'none';
  if (selfGradingPanel) selfGradingPanel.style.display = 'none';

  // Display Clinical Rationale if available
  if (rationaleBox && rationaleText) {
    let rationaleContent = "";
    if (question && question.rationales) {
      rationaleContent = question.rationales[userAnswer] || question.rationales[correctAnswer] || "";
    }
    if (rationaleContent && rationaleContent.trim().length > 0) {
      rationaleText.textContent = rationaleContent;
      rationaleBox.style.display = 'block';
    } else {
      rationaleBox.style.display = 'none';
    }
  }

  if (displayUserAnswer) {
    displayUserAnswer.textContent = '';
    userAnswer.split('\n').forEach((line, i) => {
      if (i > 0) displayUserAnswer.appendChild(document.createElement('br'));
      displayUserAnswer.appendChild(document.createTextNode(line));
    });
  }
  if (displayCorrectAnswer) {
    displayCorrectAnswer.textContent = '';
    correctAnswer.split('\n').forEach((line, i) => {
      if (i > 0) displayCorrectAnswer.appendChild(document.createElement('br'));
      displayCorrectAnswer.appendChild(document.createTextNode(line));
    });
  }

  if (feedbackStatus) {
    if (isCorrect) {
      feedbackStatus.textContent = "Bonne réponse ! (+1.0 point)";
    } else {
      feedbackStatus.textContent = "Incorrect. Voir le comparatif ci-dessous :";
    }
    feedbackStatus.classList.remove('quiz-feedback-pop');
    void feedbackStatus.offsetWidth; // restart animation
    feedbackStatus.classList.add('quiz-feedback-pop');
  }
  if (isCorrect) {
    if (feedbackHeader) {
      feedbackHeader.style.color = "var(--color-success)";
      const icon = feedbackHeader.querySelector('i');
      if (icon) icon.className = "fa-solid fa-circle-check";
    }
  } else {
    if (feedbackHeader) {
      feedbackHeader.style.color = "var(--color-danger)";
      const icon = feedbackHeader.querySelector('i');
      if (icon) icon.className = "fa-solid fa-circle-xmark";
    }
  }

  if (nextBtn) nextBtn.style.display = 'block';
}

function startQuestionTimer() {
  if (timerIntervalId) clearInterval(timerIntervalId);

  const session = state.quizSession;
  if (!session || !session.isTimed) return;

  timeLeft = session.timerSeconds;
  updateTimerUI();

  timerIntervalId = setInterval(() => {
    timeLeft--;
    updateTimerUI();
    if (timeLeft <= 0) {
      clearInterval(timerIntervalId);
      timerIntervalId = null;
      handleTimerExpiration();
    }
  }, 1000);
}

function updateTimerUI() {
  if (timerCount) timerCount.textContent = `${timeLeft}s`;
  if (timerFill && state.quizSession) {
    const percent = (timeLeft / state.quizSession.timerSeconds) * 100;
    timerFill.style.width = `${percent}%`;

    if (timeLeft <= 5) {
      timerFill.style.backgroundColor = 'var(--color-danger)';
    } else {
      timerFill.style.backgroundColor = 'var(--color-warning)';
    }
  }
}

function handleTimerExpiration() {
  const session = state.quizSession;
  const q = session.questions[session.currentIndex];

  if (q.type === 'clinical' || q.type === 'posology') {
    qcmContainer.querySelectorAll('button').forEach(b => {
      b.disabled = true;
      b.style.pointerEvents = 'none';
      if (b.dataset.option === q.correctAnswer) {
        b.style.borderColor = 'var(--color-success)';
        b.style.background = 'rgba(16, 185, 129, 0.05)';
      }
    });

    session.answers.push({
      catId: q.cat.id,
      catTitle: q.cat.title,
      type: q.type,
      userAnswer: "[Temps écoulé]",
      correctAnswer: q.correctAnswer,
      score: 0
    });

    updateLeitnerStats(q.cat.id, false);
    showQCMFeedback(false, q.correctAnswer, "[Temps écoulé]");
  } else {
    userTextArea.disabled = true;
    if (submitTextBtn) submitTextBtn.style.display = 'none';

    if (displayUserAnswer) displayUserAnswer.textContent = "[Temps écoulé]";
    if (displayCorrectAnswer) displayCorrectAnswer.textContent = q.correctAnswer;

    if (keywordsMatchedTags) {
      keywordsMatchedTags.innerHTML = '<span class="text-muted" style="font-size:12px;">Temps écoulé. Aucun mot-clé validé.</span>';
    }

    if (feedbackPanel) feedbackPanel.style.display = 'flex';
    if (comparisonGrid) comparisonGrid.style.display = 'grid';
    if (keywordsMatchedPanel) keywordsMatchedPanel.style.display = 'flex';
    if (selfGradingPanel) selfGradingPanel.style.display = 'none';

    feedbackStatus.textContent = "Temps écoulé ! Réponse enregistrée (0 pt).";
    feedbackHeader.style.color = "var(--color-danger)";
    const icon = feedbackHeader.querySelector('i');
    if (icon) icon.className = "fa-solid fa-clock";

    session.answers.push({
      catId: q.cat.id,
      catTitle: q.cat.title,
      type: q.type,
      userAnswer: "[Temps écoulé]",
      correctAnswer: q.correctAnswer,
      score: 0
    });

    updateLeitnerStats(q.cat.id, false);

    if (nextBtn) nextBtn.style.display = 'block';
  }
}

function showHint() {
  const session = state.quizSession;
  const q = session.questions[session.currentIndex];
  if (!q) return;

  const hints = getKeywordHints(q.correctAnswer);
  if (hintBox) {
    hintBox.innerHTML = `<i class="fa-regular fa-lightbulb"></i> <strong>Indices clés :</strong> ${escapeHTML(hints)}`;
    hintBox.style.display = 'block';
  }
  if (hintBtn) {
    hintBtn.disabled = true;
    hintBtn.style.opacity = '0.5';
  }
  questionMaxPoints = 0.5;
  showToast("Indice révélé ! Valeur max de la question : 0.5 pt", "fa-lightbulb", 3000);
}

function showResults() {
  if (timerIntervalId) clearInterval(timerIntervalId);
  releaseWakeLock(wakeLock);
  if (quizSetupView) quizSetupView.style.display = 'none';
  if (quizActiveView) quizActiveView.style.display = 'none';
  if (quizResultsView) quizResultsView.style.display = 'flex';

  const session = state.quizSession;
  const percent = Math.round((session.score / session.questions.length) * 100);

  if (resultsScore) {
    resultsScore.textContent = `0.0 / ${session.questions.length}`;
    countUp(resultsScore, session.score, 700, (v) => `${v.toFixed(1)} / ${session.questions.length}`);
    resultsScore.classList.remove('quiz-score-pop');
    void resultsScore.offsetWidth; // restart animation
    resultsScore.classList.add('quiz-score-pop');
  }

  if (resultsFeedback) {
    if (percent === 100) {
      resultsFeedback.textContent = "Incroyable ! Score parfait. Vous maîtrisez parfaitement ces conduites à tenir médicales ! 🏆";
      resultsScore.style.color = "var(--color-success)";
    } else if (percent >= 80) {
      resultsFeedback.textContent = "Excellent travail ! Vous avez une très bonne mémoire des posologies et diagnostics cliniques. Continuez ainsi ! 🩺";
      resultsScore.style.color = "var(--color-success)";
    } else if (percent >= 50) {
      resultsFeedback.textContent = "Bon début, mais des confusions subsistent dans les Red Flags ou les médicaments types. Révisez les fiches indiquées ci-dessous.";
      resultsScore.style.color = "var(--color-warning)";
    } else {
      resultsFeedback.textContent = "Attention, la mémorisation est insuffisante pour une pratique sereine. Prenez le temps de relire vos fiches de référence.";
      resultsScore.style.color = "var(--color-danger)";
    }
    if (percent >= 80) {
      resultsScore.classList.add('quiz-success-pulse');
    } else {
      resultsScore.classList.remove('quiz-success-pulse');
    }
  }

  const categoryStats = {};
  session.answers.forEach(ans => {
    const cat = state.allCats.find(c => c.id === ans.catId);
    const category = cat ? cat.category : "Général";
    if (!categoryStats[category]) {
      categoryStats[category] = { totalPoints: 0, maxPoints: 0 };
    }
    categoryStats[category].totalPoints += ans.score;
    categoryStats[category].maxPoints += 1.0;
  });

  if (categoryScoresList && weakPointsPanel) {
    categoryScoresList.innerHTML = '';

    Object.keys(categoryStats).forEach(category => {
      const stats = categoryStats[category];
      const catPercent = Math.round((stats.totalPoints / stats.maxPoints) * 100);
      const isWeak = catPercent < 80;

      const barColor = isWeak ? 'var(--color-danger)' : 'var(--color-success)';
      const warningIcon = isWeak ? '<i class="fa-solid fa-triangle-exclamation" style="color: var(--color-warning); margin-left: 6px;"></i>' : '';

      const div = document.createElement('div');
      div.style.display = 'flex';
      div.style.flexDirection = 'column';
      div.style.gap = '4px';
      div.style.width = '100%';
      div.innerHTML = `
        <div style="display: flex; justify-content: space-between; align-items: center; font-size: 13px;">
          <span style="font-weight: 600; color: var(--text-primary);">${escapeHTML(category)}${warningIcon}</span>
          <span style="font-weight: 700; color: ${isWeak ? 'var(--color-danger)' : 'var(--color-success)'};">${catPercent}% (${stats.totalPoints.toFixed(1)}/${stats.maxPoints})</span>
        </div>
        <div style="height: 6px; background: rgba(255,255,255,0.05); border-radius: 3px; overflow: hidden; width: 100%;">
          <div style="width: ${catPercent}%; height: 100%; background: ${barColor}; border-radius: 3px;"></div>
        </div>
      `;
      categoryScoresList.appendChild(div);
    });

    weakPointsPanel.style.display = 'flex';
  }

  const failedQuestions = [];
  session.answers.forEach((ans, idx) => {
    if (ans.score < 1.0) {
      failedQuestions.push(session.questions[idx]);
    }
  });

  state.quizSession.failedQuestions = failedQuestions;

  if (retryErrorsBtn) {
    if (failedQuestions.length > 0) {
      retryErrorsBtn.style.display = 'flex';
      retryErrorsBtn.innerHTML = `<i class="fa-solid fa-rotate-left"></i> Refaire les erreurs (${failedQuestions.length})`;
    } else {
      retryErrorsBtn.style.display = 'none';
    }
  }

  updateQuizStreak();

  if (resultsTableBody) {
    resultsTableBody.innerHTML = '';
    session.answers.forEach((ans, idx) => {
      const tr = document.createElement('tr');
      tr.style.borderBottom = '1px solid rgba(255, 255, 255, 0.05)';

      let typeLabel = '';
      if (ans.type === 'clinical') typeLabel = 'Cas Clinique';
      else if (ans.type === 'posology') typeLabel = 'Ordonnance QCM';
      else if (ans.type === 'redflags') typeLabel = 'Red Flags';
      else typeLabel = 'Ordonnance Écrite';

      tr.innerHTML = `
        <td style="padding: 10px; font-weight: 500; color: var(--text-primary);">${idx + 1}. ${escapeHTML(ans.catTitle || 'Fiche inconnue')}</td>
        <td style="padding: 10px; color: var(--text-secondary);">${typeLabel}</td>
        <td style="padding: 10px; text-align: center; font-weight: 700; color: ${ans.score === 1.0 ? 'var(--color-success)' : (ans.score === 0.5 ? 'var(--color-warning)' : 'var(--color-danger)')};">${ans.score.toFixed(1)}</td>
        <td style="padding: 10px; text-align: right;">
          <button class="cancel-btn" style="font-size: 11.5px; padding: 4px 8px; border-radius: 4px;" data-cat-id="${escapeHTML(String(ans.catId ?? ''))}">
            <i class="fa-solid fa-eye"></i> Voir
          </button>
        </td>
      `;

      const viewBtn = tr.querySelector('button');
      viewBtn.addEventListener('click', () => {
        const cat = state.allCats.find(c => c.id === ans.catId);
        if (cat && globalOnOpenCatCard) {
          state.quizSession.quizViewingCatId = cat.id;
          quizScreen.style.display = 'none';
          globalOnOpenCatCard(cat);
        }
      });

      resultsTableBody.appendChild(tr);
    });
  }
}

function advanceQuestion() {
  const session = state.quizSession;
  session.currentIndex++;

  if (session.currentIndex < session.questions.length) {
    renderQuestion();
  } else {
    showResults();
  }
}

function retryFailedQuestions() {
  const session = state.quizSession;
  if (!session.failedQuestions || session.failedQuestions.length === 0) return;

  const newQuestions = [...session.failedQuestions];
  shuffleArray(newQuestions);

  session.questions = newQuestions;
  session.currentIndex = 0;
  session.answers = [];
  session.score = 0;
  session.failedQuestions = [];

  if (quizSetupView) quizSetupView.style.display = 'none';
  if (quizActiveView) quizActiveView.style.display = 'flex';
  if (quizResultsView) quizResultsView.style.display = 'none';

  renderQuestion();
}

document.addEventListener('visibilitychange', async () => {
  const session = state.quizSession;
  if (session && session.questions && session.questions.length > 0 && session.currentIndex < session.questions.length) {
    if (document.visibilityState === 'visible') {
      const lock = await requestWakeLock();
      if (lock) wakeLock = lock;
    }
  }
});
