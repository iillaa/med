import { state } from '../../state.js';
import { setButtonLoading } from '../../utils.js';
import { updateLeitnerStats } from './state.js';
import { checkMatchedKeywords } from './quiz_generator.js';

export function submitWriteInAnswer({ userTextArea, submitTextBtn, keywordsMatchedTags, displayUserAnswer, displayCorrectAnswer, feedbackPanel, comparisonGrid, keywordsMatchedPanel, selfGradingPanel, feedbackStatus, feedbackHeader, nextBtn }) {
  const session = state.quizSession;
  const q = session.questions[session.currentIndex];
  const userAnswer = userTextArea.value.trim();

  if (!userAnswer) {
    alert("Veuillez saisir votre réponse avant de valider.");
    return null;
  }

  userTextArea.disabled = true;
  const restoreBtn = setButtonLoading(submitTextBtn);

  const keywordMatches = checkMatchedKeywords(userAnswer, q.correctAnswer);

  if (displayUserAnswer) displayUserAnswer.textContent = userAnswer;
  if (displayCorrectAnswer) displayCorrectAnswer.textContent = q.correctAnswer;

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

  if (feedbackPanel) feedbackPanel.style.display = 'flex';
  if (comparisonGrid) comparisonGrid.style.display = 'grid';
  if (keywordsMatchedPanel) keywordsMatchedPanel.style.display = 'flex';
  if (selfGradingPanel) selfGradingPanel.style.display = 'flex';

  if (feedbackStatus) feedbackStatus.textContent = "Veuillez évaluer votre réponse ci-dessous :";
  if (feedbackHeader) {
    feedbackHeader.style.color = "var(--color-primary)";
    const icon = feedbackHeader.querySelector('i');
    if (icon) icon.className = "fa-solid fa-circle-info";
  }

  if (nextBtn) nextBtn.style.display = 'none';

  return restoreBtn;
}

export function saveWriteInGrade({ userTextArea, selfGradingPanel, feedbackStatus, feedbackHeader, nextBtn, restoreBtn }, score, questionMaxPoints) {
  const session = state.quizSession;
  const q = session.questions[session.currentIndex];
  const userAnswer = userTextArea.value.trim();

  const finalScore = score * questionMaxPoints;

  session.score += finalScore;

  session.answers.push({
    catId: q.cat.id,
    catTitle: q.cat.title,
    type: q.type,
    userAnswer: userAnswer,
    correctAnswer: q.correctAnswer,
    score: finalScore
  });

  updateLeitnerStats(q.cat.id, finalScore >= 1.0);

  selfGradingPanel.style.display = 'none';
  feedbackStatus.textContent = `Score enregistré : +${finalScore.toFixed(1)} point(s)`;
  feedbackHeader.style.color = score === 1.0 ? "var(--color-success)" : (score === 0.5 ? "var(--color-warning)" : "var(--color-danger)");
  feedbackHeader.querySelector('i').className = score === 1.0 ? "fa-solid fa-circle-check" : "fa-solid fa-circle-info";

  if (restoreBtn) restoreBtn();

  if (nextBtn) nextBtn.style.display = 'block';
}
