import { state } from '../state.js';
import { getCleanPdfName, setButtonLoading } from '../utils.js';

// DOM Elements
let quizScreen, welcomeScreen, workspaceView;
let quizSetupView, quizActiveView, quizResultsView;
let quizCategorySelect, quizCountSelect;
let checkboxSpecialty, checkboxRedflags, checkboxPrescription, checkboxPosology;
let progressText, progressFill, startQuizBtn;
let qMeta, qPoints, qTitle, qcmContainer, writeinContainer, userTextArea, submitTextBtn;
let feedbackPanel, feedbackHeader, feedbackStatus;
let comparisonGrid, displayUserAnswer, displayCorrectAnswer;
let keywordsMatchedPanel, keywordsMatchedTags;
let selfGradingPanel, btnGradeFull, btnGradePartial, btnGradeZero;
let viewRefBtn, nextBtn;
let restoreBtn = null;
let resultsScore, resultsFeedback, resultsTableBody, retryBtn, quitBtn;

// Callbacks
let globalOnOpenCatCard = null;

// Stop Words for Keyword Matcher
const FRENCH_STOP_WORDS = new Set([
  'pour', 'avec', 'dans', 'chez', 'mais', 'sans', 'plus', 'moins', 'sous',
  'fois', 'jour', 'sont', 'cette', 'dont', 'votre', 'leur', 'leurs',
  'comme', 'tout', 'tous', 'toute', 'toutes', 'ces', 'une', 'des', 'les', 'par',
  'encas', 'clinique', 'devant', 'sujet', 'fiche', 'card', 'tres', 'très'
]);

export function initQuiz(onOpenCatCard) {
  globalOnOpenCatCard = onOpenCatCard;

  // Screens
  quizScreen = document.getElementById('quiz-screen');
  welcomeScreen = document.getElementById('welcome-screen');
  workspaceView = document.getElementById('workspace');

  // Subviews
  quizSetupView = document.getElementById('quiz-setup-view');
  quizActiveView = document.getElementById('quiz-active-view');
  quizResultsView = document.getElementById('quiz-results-view');

  // Setup Form
  quizCategorySelect = document.getElementById('quiz-category');
  quizCountSelect = document.getElementById('quiz-count');
  checkboxSpecialty = document.getElementById('quiz-type-specialty');
  checkboxRedflags = document.getElementById('quiz-type-redflags');
  checkboxPrescription = document.getElementById('quiz-type-prescription');
  checkboxPosology = document.getElementById('quiz-type-posology');
  startQuizBtn = document.getElementById('start-quiz-btn');

  // Active View Elements
  progressText = document.getElementById('quiz-progress-text');
  progressFill = document.getElementById('quiz-progress-fill');
  qMeta = document.getElementById('quiz-q-meta');
  qPoints = document.getElementById('quiz-q-points');
  qTitle = document.getElementById('quiz-q-title');
  qcmContainer = document.getElementById('quiz-qcm-container');
  writeinContainer = document.getElementById('quiz-writein-container');
  userTextArea = document.getElementById('quiz-user-text');
  submitTextBtn = document.getElementById('quiz-submit-text-btn');

  // Feedback Panel Elements
  feedbackPanel = document.getElementById('quiz-feedback-panel');
  feedbackHeader = document.getElementById('quiz-feedback-header');
  feedbackStatus = document.getElementById('quiz-feedback-status');
  comparisonGrid = document.getElementById('quiz-comparison-grid');
  displayUserAnswer = document.getElementById('quiz-display-user-answer');
  displayCorrectAnswer = document.getElementById('quiz-display-correct-answer');
  keywordsMatchedPanel = document.getElementById('quiz-keywords-matched-panel');
  keywordsMatchedTags = document.getElementById('quiz-keywords-matched-tags');

  // Self Grading Panel
  selfGradingPanel = document.getElementById('quiz-self-grading-panel');
  btnGradeFull = document.getElementById('quiz-grade-full');
  btnGradePartial = document.getElementById('quiz-grade-partial');
  btnGradeZero = document.getElementById('quiz-grade-zero');

  // Navigation Buttons
  viewRefBtn = document.getElementById('quiz-view-ref-btn');
  nextBtn = document.getElementById('quiz-next-btn');

  // Results View Elements
  resultsScore = document.getElementById('quiz-results-score');
  resultsFeedback = document.getElementById('quiz-results-feedback');
  resultsTableBody = document.getElementById('quiz-results-table-body');
  retryBtn = document.getElementById('quiz-retry-btn');
  quitBtn = document.getElementById('quiz-quit-btn');

  // Setup Sidebar Trigger Button
  const sidebarQuizBtn = document.getElementById('start-quiz-nav-btn');
  if (sidebarQuizBtn) {
    sidebarQuizBtn.addEventListener('click', () => {
      showQuizSetup();
      // Close sidebar on mobile
      const sidebar = document.getElementById('sidebar');
      if (window.innerWidth <= 850 && sidebar) {
        sidebar.classList.remove('open');
      }
    });
  }

  // Hook event listeners
  if (startQuizBtn) startQuizBtn.addEventListener('click', startQuizSession);
  if (submitTextBtn) submitTextBtn.addEventListener('click', submitWriteInAnswer);
  
  if (btnGradeFull) btnGradeFull.addEventListener('click', () => saveWriteInGrade(1.0));
  if (btnGradePartial) btnGradePartial.addEventListener('click', () => saveWriteInGrade(0.5));
  if (btnGradeZero) btnGradeZero.addEventListener('click', () => saveWriteInGrade(0.0));

  if (viewRefBtn) {
    viewRefBtn.addEventListener('click', () => {
      const q = state.quizSession.questions[state.quizSession.currentIndex];
      if (q && q.cat && globalOnOpenCatCard) {
        state.quizSession.quizViewingCatId = q.cat.id;
        // Toggle workspace visible and select
        quizScreen.style.display = 'none';
        globalOnOpenCatCard(q.cat);
      }
    });
  }

  if (nextBtn) nextBtn.addEventListener('click', advanceQuestion);
  if (retryBtn) retryBtn.addEventListener('click', showQuizSetup);
  if (quitBtn) {
    quitBtn.addEventListener('click', () => {
      quizScreen.style.display = 'none';
      if (welcomeScreen) welcomeScreen.style.display = 'flex';
      // Clear active quiz session
      state.quizSession.questions = [];
      // Highlight dashboard logo in sidebar
      document.querySelectorAll('.cat-item').forEach(item => item.classList.remove('active'));
    });
  }
}

export function showQuizSetup() {
  if (workspaceView) workspaceView.style.display = 'none';
  if (welcomeScreen) welcomeScreen.style.display = 'none';
  if (quizScreen) quizScreen.style.display = 'flex';

  quizSetupView.style.display = 'flex';
  quizActiveView.style.display = 'none';
  quizResultsView.style.display = 'none';

  // Populate Categories drop-down in setup
  if (quizCategorySelect) {
    const categories = new Set(state.allCats.map(c => c.category));
    quizCategorySelect.innerHTML = '<option value="all">Toutes les spécialités</option>';
    categories.forEach(cat => {
      const opt = document.createElement('option');
      opt.value = cat;
      opt.textContent = cat;
      quizCategorySelect.appendChild(opt);
    });
  }
}

function getOrientationText(cat) {
  if (!cat || !cat.summary) return "";
  const marker = "5. Orientation";
  const index = cat.summary.indexOf(marker);
  if (index !== -1) {
    let text = cat.summary.substring(index + marker.length);
    text = text.replace(/^[^\n\r]*[\n\r]+/, '').trim(); // skip the header line
    const lines = text.split('\n');
    const resultLines = [];
    for (const line of lines) {
      if (line.includes('**')) break; // next section
      resultLines.push(line.replace(/^-\s*/, '').trim());
    }
    return resultLines.filter(l => l).join(' ');
  }
  return "";
}

function cleanTextOfClues(text, title, category) {
  if (!text) return "";
  let lines = text.split('\n');
  let cleanLines = [];
  for (let line of lines) {
    let trimmed = line.trim();
    if (!trimmed) continue;
    // Skip lines starting with markdown bold header prefixes
    if (trimmed.startsWith('**') && (trimmed.toLowerCase().includes('pour') || trimmed.toLowerCase().includes('cas') || trimmed.toLowerCase().includes('symptômes') || trimmed.toLowerCase().includes('en cas') || trimmed.endsWith(':**') || trimmed.includes(':\*\*'))) {
      continue;
    }
    cleanLines.push(trimmed);
  }
  let result = cleanLines.join('\n');

  // Replace occurrences of title and category to avoid dead giveaways
  if (title) {
    const cleanTitle = title.replace(/^CAT devant\s+/i, '').replace(/^Différence entre\s+/i, '').replace(/^Interprétation du\s+/i, '').trim();
    if (cleanTitle.length > 2) {
      const escapedTitle = cleanTitle.replace(/[-\/\\^$*+?.()|[\]{}]/g, '\\$&');
      const regex = new RegExp(escapedTitle, 'gi');
      result = result.replace(regex, '[la pathologie]');
    }
  }
  if (category) {
    const escapedCat = category.replace(/[-\/\\^$*+?.()|[\]{}]/g, '\\$&');
    const regex = new RegExp(escapedCat, 'gi');
    result = result.replace(regex, '[spécialité]');
  }

  return result;
}

function cleanOrientationOfClues(text, title, category) {
  if (!text) return "";
  let result = text.trim();
  
  if (title) {
    const cleanTitle = title.replace(/^CAT devant\s+/i, '').replace(/^Différence entre\s+/i, '').replace(/^Interprétation du\s+/i, '').trim();
    if (cleanTitle.length > 2) {
      const escapedTitle = cleanTitle.replace(/[-\/\\^$*+?.()|[\]{}]/g, '\\$&');
      const regex = new RegExp(escapedTitle, 'gi');
      result = result.replace(regex, '[la pathologie]');
    }
  }
  if (category) {
    const escapedCat = category.replace(/[-\/\\^$*+?.()|[\]{}]/g, '\\$&');
    const regex = new RegExp(escapedCat, 'gi');
    result = result.replace(regex, '[spécialité]');
  }

  return result;
}

function startQuizSession() {
  const selectedCategory = quizCategorySelect.value;
  const questionCount = parseInt(quizCountSelect.value);
  const includeClinical = checkboxSpecialty.checked; // Mapping checkboxSpecialty to Clinical Case
  const includePosology = checkboxPosology.checked;
  const includeRedflags = checkboxRedflags.checked;
  const includePrescription = checkboxPrescription.checked;

  if (!includeClinical && !includePosology && !includeRedflags && !includePrescription) {
    alert("Veuillez sélectionner au moins un type de question.");
    return;
  }

  // Filter CATs by category selection
  const filteredCats = selectedCategory === 'all' 
    ? state.allCats 
    : state.allCats.filter(c => c.category === selectedCategory);

  if (filteredCats.length === 0) {
    alert("Aucune fiche trouvée dans cette catégorie.");
    return;
  }

  // Generate Questions list
  const generatedQuestions = [];

  filteredCats.forEach(cat => {
    // 1. Clinical QCM Question (Cas Clinique & Orientation)
    if (includeClinical) {
      const rawOrientation = getOrientationText(cat);
      if (rawOrientation && rawOrientation.trim().length > 0) {
        const correctAnswer = cleanOrientationOfClues(rawOrientation, cat.title, cat.category);
        
        // Find other orientations as distractors
        const otherCats = state.allCats.filter(c => c.id !== cat.id);
        const otherOrientations = Array.from(new Set(
          otherCats.map(c => {
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
          questionText: `Vous recevez un patient présentant des symptômes évocateurs de : <br><strong>"${cat.title}"</strong>.<br><br>Quelle est la conduite à tenir ou l'orientation thérapeutique prioritaire à ce stade ?`,
          correctAnswer: correctAnswer,
          options: options,
          points: 1.0
        });
      }
    }

    // 2. Posology QCM Question (Ordonnance & Posologie)
    if (includePosology) {
      const rawOrdonnance = cat.ordonnance;
      if (rawOrdonnance && rawOrdonnance.trim().length > 0) {
        const correctAnswer = cleanTextOfClues(rawOrdonnance, cat.title, cat.category);
        
        // Find other ordonnances as distractors
        const otherCats = state.allCats.filter(c => c.id !== cat.id);
        const otherOrdonnances = Array.from(new Set(
          otherCats.map(c => cleanTextOfClues(c.ordonnance, c.title, c.category))
            .filter(o => o && o.trim().length > 0 && o !== correctAnswer)
        ));
        shuffleArray(otherOrdonnances);
        const distractors = otherOrdonnances.slice(0, 3);
        const options = [correctAnswer, ...distractors];
        shuffleArray(options);

        generatedQuestions.push({
          type: 'posology',
          cat: cat,
          questionText: `Pour la situation clinique suivante : <br><strong>"${cat.title}"</strong>.<br><br>Quelle est l'ordonnance type recommandée (molécules, posologies et durées de traitement) ?`,
          correctAnswer: correctAnswer,
          options: options,
          points: 1.0
        });
      }
    }

    // 3. Red Flags Write-In Question
    if (includeRedflags && cat.red_flags && cat.red_flags.trim().length > 0) {
      generatedQuestions.push({
        type: 'redflags',
        cat: cat,
        questionText: `Quels sont les <strong>Red Flags / Signes de Gravité</strong> cliniques à rechercher devant la situation suivante : <br><strong>"${cat.title}"</strong> ?`,
        correctAnswer: cat.red_flags,
        points: 1.0
      });
    }

    // 4. Prescription Write-In Question
    if (includePrescription && cat.ordonnance && cat.ordonnance.trim().length > 0) {
      generatedQuestions.push({
        type: 'prescription',
        cat: cat,
        questionText: `Rédigez l'<strong>Ordonnance Type</strong> (traitements, posologies, et durées conseillées) pour : <br><strong>"${cat.title}"</strong>`,
        correctAnswer: cat.ordonnance,
        points: 1.0
      });
    }
  });

  if (generatedQuestions.length === 0) {
    alert("Impossible de générer des questions. Les fiches correspondantes ne possèdent pas les informations requises.");
    return;
  }

  // Shuffle questions
  shuffleArray(generatedQuestions);

  // Take the requested count
  const selectedQuestions = generatedQuestions.slice(0, questionCount);

  // Initialize state session
  state.quizSession.questions = selectedQuestions;
  state.quizSession.currentIndex = 0;
  state.quizSession.answers = [];
  state.quizSession.score = 0;

  // Transition views
  quizSetupView.style.display = 'none';
  quizActiveView.style.display = 'flex';
  quizResultsView.style.display = 'none';

  renderQuestion();
}

function renderQuestion() {
  if (window.perf) window.perf.startMeasure('quiz.renderQuestion');
  const session = state.quizSession;
  const q = session.questions[session.currentIndex];

  // Update progress widgets
  const progressPercent = Math.round((session.currentIndex / session.questions.length) * 100);
  if (progressText) progressText.textContent = `Question ${session.currentIndex + 1} / ${session.questions.length}`;
  if (progressFill) progressFill.style.width = `${progressPercent || 5}%`;

  // Render text
  if (qTitle) qTitle.innerHTML = q.questionText;

  // Toggle Type Badge
  if (qMeta) {
    if (q.type === 'clinical') {
      qMeta.textContent = "Cas Clinique 🩺";
      qMeta.className = "cat-badge";
      qMeta.style.backgroundColor = "var(--color-primary)";
      qMeta.style.color = "#000";
    } else if (q.type === 'posology') {
      qMeta.textContent = "Ordonnance QCM 💊";
      qMeta.className = "cat-badge";
      qMeta.style.backgroundColor = "var(--color-warning)";
      qMeta.style.color = "#000";
    } else if (q.type === 'redflags') {
      qMeta.textContent = "Signes de Gravité ✍️";
      qMeta.className = "cat-badge";
      qMeta.style.backgroundColor = "var(--color-danger)";
      qMeta.style.color = "#fff";
    } else {
      qMeta.textContent = "Ordonnance Type ✍️";
      qMeta.className = "cat-badge";
      qMeta.style.backgroundColor = "var(--color-success)";
      qMeta.style.color = "#000";
    }
  }

  if (qPoints) qPoints.textContent = `Valeur : ${q.points} pt`;

  // Hide feedback panel
  if (feedbackPanel) feedbackPanel.style.display = 'none';

  // Toggle Inputs according to type
  if (q.type === 'clinical' || q.type === 'posology') {
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
  if (window.perf) window.perf.endMeasure('quiz.renderQuestion');
}

function generateQCMOptions(question) {
  qcmContainer.innerHTML = '';

  let options = [];
  if (question.options) {
    options = [...question.options];
  } else {
    // Get distinct categories as distractors
    const categories = Array.from(new Set(state.allCats.map(c => c.category)))
      .filter(cat => cat !== question.correctAnswer);
    
    shuffleArray(categories);
    const distractors = categories.slice(0, 3);

    // Combine correct and distractors
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
    btn.innerHTML = `<span style="font-size:13px; font-weight:600; color:var(--text-primary); line-height:1.4; display:block; text-align:left;">${opt.replace(/\n/g, '<br>')}</span>`;
    
    btn.addEventListener('click', () => {
      // Disable all options
      qcmContainer.querySelectorAll('button').forEach(b => {
        b.disabled = true;
        b.style.pointerEvents = 'none';
        
        // Highlight correct option in green
        if (b.dataset.option === question.correctAnswer) {
          b.style.borderColor = 'var(--color-success)';
          b.style.background = 'rgba(16, 185, 129, 0.05)';
        }
      });

      const isCorrect = (opt === question.correctAnswer);
      if (isCorrect) {
        btn.style.borderColor = 'var(--color-success)';
        btn.style.background = 'rgba(16, 185, 129, 0.08)';
        state.quizSession.score += question.points;
      } else {
        btn.style.borderColor = 'var(--color-danger)';
        btn.style.background = 'rgba(239, 68, 68, 0.08)';
      }

      // Record Answer History
      state.quizSession.answers.push({
        catId: question.cat.id,
        catTitle: question.cat.title,
        type: question.type,
        userAnswer: opt,
        correctAnswer: question.correctAnswer,
        score: isCorrect ? question.points : 0
      });

      // Show Feedback Panel
      showQCMFeedback(isCorrect, question.correctAnswer, opt);
    });

    qcmContainer.appendChild(btn);
  });
}

function showQCMFeedback(isCorrect, correctAnswer, userAnswer) {
  if (!feedbackPanel) return;

  feedbackPanel.style.display = 'flex';
  comparisonGrid.style.display = 'grid'; // Show side-by-side comparison for clinical / posology details
  keywordsMatchedPanel.style.display = 'none';
  selfGradingPanel.style.display = 'none';

  if (displayUserAnswer) {
    displayUserAnswer.innerHTML = `<span style="font-size:13px; line-height:1.4; display:block;">${userAnswer.replace(/\n/g, '<br>')}</span>`;
  }
  if (displayCorrectAnswer) {
    displayCorrectAnswer.innerHTML = `<span style="font-size:13px; line-height:1.4; display:block;">${correctAnswer.replace(/\n/g, '<br>')}</span>`;
  }

  if (isCorrect) {
    feedbackStatus.textContent = "Bonne réponse ! (+1.0 point)";
    feedbackHeader.style.color = "var(--color-success)";
    feedbackHeader.querySelector('i').className = "fa-solid fa-circle-check";
  } else {
    feedbackStatus.textContent = "Incorrect. Voir le comparatif ci-dessous :";
    feedbackHeader.style.color = "var(--color-danger)";
    feedbackHeader.querySelector('i').className = "fa-solid fa-circle-xmark";
  }

  if (nextBtn) nextBtn.style.display = 'block';
}

function submitWriteInAnswer() {
  const session = state.quizSession;
  const q = session.questions[session.currentIndex];
  const userAnswer = userTextArea.value.trim();

  if (!userAnswer) {
    alert("Veuillez saisir votre réponse avant de valider.");
    return;
  }

  // Lock inputs
  userTextArea.disabled = true;
  restoreBtn = setButtonLoading(submitTextBtn);

  // Compare and match keywords
  const keywordMatches = checkMatchedKeywords(userAnswer, q.correctAnswer);

  // Render Comparison view
  if (displayUserAnswer) displayUserAnswer.textContent = userAnswer;
  if (displayCorrectAnswer) displayCorrectAnswer.textContent = q.correctAnswer;

  // Render Matched Keywords badges
  if (keywordsMatchedTags) {
    keywordsMatchedTags.innerHTML = '';
    if (keywordMatches.length === 0) {
      keywordsMatchedTags.innerHTML = '<span class="text-muted" style="font-size:12px;">Aucun mot-clé identifié.</span>';
    } else {
      keywordMatches.forEach(kw => {
        const span = document.createElement('span');
        span.className = 'status-pill';
        span.style.fontSize = '11.5px';
        span.style.padding = '4px 10px';
        
        if (kw.matched) {
          span.style.borderColor = 'rgba(16, 185, 129, 0.4)';
          span.style.color = 'var(--color-success)';
          span.style.background = 'rgba(16, 185, 129, 0.05)';
          span.innerHTML = `<i class="fa-solid fa-circle-check"></i> ${kw.word}`;
        } else {
          span.style.borderColor = 'rgba(100, 116, 139, 0.2)';
          span.style.color = 'var(--text-muted)';
          span.style.textDecoration = 'line-through';
          span.innerHTML = `<i class="fa-regular fa-circle"></i> ${kw.word}`;
        }
        keywordsMatchedTags.appendChild(span);
      });
    }
  }

  // Reveal Panels
  if (feedbackPanel) feedbackPanel.style.display = 'flex';
  if (comparisonGrid) comparisonGrid.style.display = 'grid';
  if (keywordsMatchedPanel) keywordsMatchedPanel.style.display = 'flex';
  if (selfGradingPanel) selfGradingPanel.style.display = 'flex';

  feedbackStatus.textContent = "Veuillez évaluer votre réponse ci-dessous :";
  feedbackHeader.style.color = "var(--color-primary)";
  feedbackHeader.querySelector('i').className = "fa-solid fa-circle-info";

  // Hide Next Button until self grading is selected
  if (nextBtn) nextBtn.style.display = 'none';
}

function saveWriteInGrade(score) {
  const session = state.quizSession;
  const q = session.questions[session.currentIndex];
  const userAnswer = userTextArea.value.trim();

  // Save score
  session.score += score;

  // Add to answer history
  session.answers.push({
    catId: q.cat.id,
    catTitle: q.cat.title,
    type: q.type,
    userAnswer: userAnswer,
    correctAnswer: q.correctAnswer,
    score: score
  });

  // Hide self grading keys and confirm
  selfGradingPanel.style.display = 'none';
  feedbackStatus.textContent = `Score enregistré : +${score.toFixed(1)} point(s)`;
  feedbackHeader.style.color = score === 1.0 ? "var(--color-success)" : (score === 0.5 ? "var(--color-warning)" : "var(--color-danger)");
  feedbackHeader.querySelector('i').className = score === 1.0 ? "fa-solid fa-circle-check" : "fa-solid fa-circle-info";

  // Restore submit button for next question
  if (restoreBtn) restoreBtn();

  // Show Next Button
  if (nextBtn) nextBtn.style.display = 'block';
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

function showResults() {
  quizSetupView.style.display = 'none';
  quizActiveView.style.display = 'none';
  quizResultsView.style.display = 'flex';

  const session = state.quizSession;
  const percent = Math.round((session.score / session.questions.length) * 100);
  
  // Set score text
  if (resultsScore) {
    resultsScore.textContent = `${session.score.toFixed(1)} / ${session.questions.length}`;
  }

  // Set descriptive feedback based on score
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
  }

  // Populate results details table
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
        <td style="padding: 10px; font-weight: 500; color: #fff;">${idx + 1}. ${ans.catTitle}</td>
        <td style="padding: 10px; color: var(--text-secondary);">${typeLabel}</td>
        <td style="padding: 10px; text-align: center; font-weight: 700; color: ${ans.score === 1.0 ? 'var(--color-success)' : (ans.score === 0.5 ? 'var(--color-warning)' : 'var(--color-danger)')};">${ans.score.toFixed(1)}</td>
        <td style="padding: 10px; text-align: right;">
          <button class="cancel-btn" style="font-size: 11.5px; padding: 4px 8px; border-radius: 4px;" data-cat-id="${ans.catId}">
            <i class="fa-solid fa-eye"></i> Voir
          </button>
        </td>
      `;

      // Click event for the table action buttons to open references
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

// Utility Shuffler
function shuffleArray(array) {
  for (let i = array.length - 1; i > 0; i--) {
    const j = Math.floor(Math.random() * (i + 1));
    [array[i], array[j]] = [array[j], array[i]];
  }
  return array;
}

// Helper to match keywords in write-in answers
function extractKeywords(text) {
  if (!text) return [];
  const words = text.split(/[^a-zA-ZÀ-ÿ0-9]+/);
  const seenNormalized = new Set();
  const keywords = [];

  words.forEach(w => {
    const clean = w.trim();
    if (clean.length >= 4) {
      const normalized = clean.toLowerCase().normalize("NFD").replace(/[\u0300-\u036f]/g, "");
      if (!FRENCH_STOP_WORDS.has(normalized) && isNaN(normalized) && !seenNormalized.has(normalized)) {
        seenNormalized.add(normalized);
        keywords.push(clean); // Retains original capitalization for badge
      }
    }
  });
  return keywords;
}

function checkMatchedKeywords(userAnswer, referenceText) {
  const refKeywords = extractKeywords(referenceText);
  const cleanUserAnswer = userAnswer.toLowerCase().normalize("NFD").replace(/[\u0300-\u036f]/g, "");
  
  return refKeywords.map(word => {
    const normalizedWord = word.toLowerCase().normalize("NFD").replace(/[\u0300-\u036f]/g, "");
    const matched = cleanUserAnswer.includes(normalizedWord);
    return { word, matched };
  });
}
