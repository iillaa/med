<script setup lang="ts">
import { ref, computed } from 'vue'
import { useQuizStore } from '@/stores/quiz'
import { useCatsStore } from '@/stores/cats'
import { getKeywordHints } from '@/composables/useQuizGenerator'
import { updateLeitnerStats, updateQuizStreak } from '@/stores/cats'
import type { QuizSetupConfig, QuestionType } from '@/types/quiz'

const quizStore = useQuizStore()
const catsStore = useCatsStore()

const screen = ref<'setup' | 'question' | 'results'>('setup')
const userAnswer = ref('')
const feedback = ref<'none' | 'correct' | 'incorrect' | 'self-grade'>('none')
const selectedQCM = ref<string | null>(null)
const isWriteIn = computed(() => {
  const q = quizStore.currentQuestion
  return q ? q.type === 'redflags' || q.type === 'prescription' : false
})

const categories = computed(() => catsStore.categories)

const setupForm = ref<QuizSetupConfig>({
  category: 'all',
  count: 5,
  types: {
    clinical: true,
    posology: true,
    redflags: true,
    prescription: true
  },
  spacedRepetition: false,
  timedMode: false,
  timerSeconds: 60
})

const currentQuestion = computed(() => quizStore.currentQuestion)
const isFinished = computed(() => quizStore.isFinished)
const totalQuestions = computed(() => quizStore.questions.length)
const progressPercent = computed(() => {
  if (totalQuestions.value === 0) return 0
  return Math.round((quizStore.currentIndex / totalQuestions.value) * 100)
})

const enabledTypes = computed((): QuestionType[] => {
  return Object.entries(setupForm.value.types)
    .filter(([, enabled]) => enabled)
    .map(([type]) => type as QuestionType)
})

const hintText = ref('')
const showHintBox = ref(false)

const timeLeft = ref(0)
const timerActive = ref(false)
let timerInterval: ReturnType<typeof setInterval> | null = null

const categoryStats = computed(() => {
  const stats: Record<string, { total: number; max: number }> = {}
  quizStore.answers.forEach(ans => {
    const cat = catsStore.cats.find(c => c.id === ans.catId)
    const catCategory = cat ? cat.category : 'Général'
    if (!stats[catCategory]) stats[catCategory] = { total: 0, max: 0 }
    stats[catCategory].total += ans.score
    stats[catCategory].max += 1
  })
  return stats
})

const weakCategories = computed(() => {
  return Object.entries(categoryStats.value)
    .map(([name, s]) => ({
      name,
      percent: s.max > 0 ? Math.round((s.total / s.max) * 100) : 0,
      score: s.total.toFixed(1),
      max: s.max
    }))
    .filter(c => c.percent < 80)
    .sort((a, b) => a.percent - b.percent)
})

async function startQuiz(): Promise<void> {
  await quizStore.startQuiz(setupForm.value, catsStore.cats)
  if (quizStore.questions.length > 0) {
    screen.value = 'question'
    feedback.value = 'none'
    selectedQCM.value = null
    showHintBox.value = false
    hintText.value = ''
    if (quizStore.isTimed) {
      startTimer()
    }
  }
}

function startTimer(): void {
  stopTimer()
  timeLeft.value = quizStore.timerSeconds || 60
  timerActive.value = true
  timerInterval = setInterval(() => {
    timeLeft.value--
    if (timeLeft.value <= 0) {
      stopTimer()
      handleTimeUp()
    }
  }, 1000)
}

function stopTimer(): void {
  if (timerInterval) {
    clearInterval(timerInterval)
    timerInterval = null
  }
  timerActive.value = false
}

function handleTimeUp(): void {
  const q = quizStore.currentQuestion
  if (!q) return

  if (q.type === 'clinical' || q.type === 'posology') {
    quizStore.submitQCMOption('')
  } else {
    const answer = {
      catId: q.cat.id,
      catTitle: q.cat.title,
      type: q.type,
      userAnswer: '[Temps écoulé]',
      correctAnswer: q.correctAnswer,
      score: 0
    }
    quizStore.answers.push(answer)
    if (quizStore.failedQuestions) quizStore.failedQuestions.push(q)
    updateLeitnerStats(q.cat.id, false)
    updateQuizStreak()
    quizStore.currentIndex++
  }
}

function submitQCM(option: string): void {
  selectedQCM.value = option
  const isCorrect = option === (quizStore.currentQuestion?.correctAnswer || '')
  feedback.value = isCorrect ? 'correct' : 'incorrect'
  setTimeout(() => {
    feedback.value = 'none'
    quizStore.submitQCMOption(option)
    if (quizStore.isFinished) {
      stopTimer()
      screen.value = 'results'
    }
  }, 1200)
}

function submitWriteIn(): void {
  if (!userAnswer.value.trim()) return
  feedback.value = 'self-grade'

  const q = quizStore.currentQuestion!
  quizStore.answers.push({
    catId: q.cat.id,
    catTitle: q.cat.title,
    type: q.type,
    userAnswer: userAnswer.value.trim(),
    correctAnswer: q.correctAnswer,
    score: 0
  })
}

function applyGrade(score: number): void {
  quizStore.submitSelfGrade(score)
  feedback.value = 'none'
  if (quizStore.isFinished) {
    stopTimer()
    screen.value = 'results'
  }
}

function showHint(): void {
  const q = quizStore.currentQuestion
  if (!q) return
  hintText.value = getKeywordHints(q.correctAnswer)
  showHintBox.value = true
}

function retryFailed(): void {
  quizStore.retryFailed()
  screen.value = 'question'
  feedback.value = 'none'
  selectedQCM.value = null
  showHintBox.value = false
  if (quizStore.isTimed) startTimer()
}

function resetQuiz(): void {
  stopTimer()
  quizStore.reset()
  screen.value = 'setup'
  feedback.value = 'none'
  selectedQCM.value = null
  showHintBox.value = false
}

function toggleType(type: QuestionType): void {
  setupForm.value.types[type] = !setupForm.value.types[type]
}

const typeMeta: Record<QuestionType, { label: string; className: string }> = {
  clinical: { label: 'Cas Clinique', className: 'qtype-clinical' },
  posology: { label: 'Ordonnance QCM', className: 'qtype-posology' },
  redflags: { label: 'Signes de Gravité', className: 'qtype-redflags' },
  prescription: { label: 'Ordonnance Type', className: 'qtype-prescription' }
}

function goToCat(catId: number): void {
  window.location.hash = `#/workspace/${catId}`
}
</script>

<template>
  <div class="quiz-view">
    <h1 class="quiz-title">Quiz</h1>

    <!-- SETUP -->
    <div v-if="screen === 'setup'" class="quiz-setup">
      <div class="form-group">
        <label class="form-label">Catégorie</label>
        <select v-model="setupForm.category" class="form-select">
          <option value="all">Toutes les spécialités</option>
          <option v-for="cat in categories" :key="cat" :value="cat">{{ cat }}</option>
        </select>
      </div>

      <div class="form-group">
        <label class="form-label">Nombre de questions</label>
        <input v-model.number="setupForm.count" type="number" min="1" max="20" class="form-input" />
      </div>

      <div class="form-group">
        <label class="form-label">Types de questions</label>
        <div class="type-toggles">
          <button
            v-for="type in ['clinical', 'posology', 'redflags', 'prescription']"
            :key="type"
            :class="['type-btn', { active: setupForm.types[type] }]"
            @click="toggleType(type as QuestionType)"
          >
            {{ type === 'clinical' ? 'Clinique' : type === 'posology' ? 'Posologie' : type === 'redflags' ? 'Red Flags' : 'Ordonnance' }}
          </button>
        </div>
      </div>

      <div class="form-group">
        <label class="checkbox-label">
          <input v-model="setupForm.timedMode" type="checkbox" />
          <span>Mode chronométré ({{ setupForm.timerSeconds }}s/question)</span>
        </label>
      </div>

      <button class="primary-btn" @click="startQuiz" :disabled="enabledTypes.length === 0">
        Commencer le quiz
      </button>
    </div>

    <!-- QUESTION -->
    <div v-else-if="screen === 'question'" class="quiz-question">
      <div class="quiz-progress">
        <div class="progress-bar">
          <div class="progress-fill" :style="{ width: progressPercent + '%' }"></div>
        </div>
        <div style="display:flex;align-items:center;gap:10px;">
          <span class="progress-text">{{ quizStore.currentIndex + 1 }} / {{ totalQuestions }}</span>
          <div v-if="quizStore.isTimed && timerActive" class="timer-badge" :class="{ 'timer-danger': timeLeft <= 5 }">
            <i class="fa-solid fa-clock"></i> {{ timeLeft }}s
          </div>
        </div>
      </div>

      <div v-if="currentQuestion" class="question-card">
        <div class="question-header">
          <span :class="['question-type-badge', typeMeta[currentQuestion.type]?.className]">
            {{ typeMeta[currentQuestion.type]?.label }}
          </span>
          <span class="question-cat">{{ currentQuestion.cat.category }}</span>
          <span class="question-points">Valeur : {{ currentQuestion.points }} pt</span>
        </div>

        <h2 class="question-text" v-html="currentQuestion.questionText"></h2>

        <!-- HINT (redflags / prescription) -->
        <div v-if="isWriteIn" class="hint-area">
          <button class="hint-btn" @click="showHint" :disabled="showHintBox">
            <i class="fa-regular fa-lightbulb"></i> Indice
          </button>
          <Transition name="fade">
            <div v-if="showHintBox && hintText" class="hint-box">
              <i class="fa-regular fa-lightbulb"></i> <strong>Indices clés :</strong> {{ hintText }}
            </div>
          </Transition>
        </div>

        <!-- QCM (clinical / posology) -->
        <div v-if="!isWriteIn && currentQuestion.options && currentQuestion.options.length > 0" class="qcm-list">
          <button
            v-for="opt in currentQuestion.options"
            :key="opt"
            :class="['qcm-btn', {
              'qcm-selected': selectedQCM === opt,
              'qcm-correct': selectedQCM !== null && opt === currentQuestion.correctAnswer,
              'qcm-wrong': selectedQCM === opt && opt !== currentQuestion.correctAnswer,
              'qcm-disabled': selectedQCM !== null
            }]"
            @click="selectedQCM === null && submitQCM(opt)"
            :disabled="selectedQCM !== null"
          >
            {{ opt }}
          </button>
        </div>

        <!-- WRITE-IN (redflags / prescription) -->
        <div v-else-if="isWriteIn" class="writein-area">
          <textarea
            v-model="userAnswer"
            class="answer-input"
            placeholder="Saisissez votre réponse..."
            rows="5"
            :disabled="feedback !== 'none'"
          ></textarea>
          <button
            class="submit-btn"
            @click="submitWriteIn"
            :disabled="feedback !== 'none'"
          >
            Valider ma réponse
          </button>
        </div>

        <!-- QCM Feedback -->
        <Transition name="fade">
          <div v-if="feedback === 'correct'" class="feedback feedback-correct">
            ✓ Bonne réponse ! (+{{ currentQuestion.points }} pt)
          </div>
          <div v-else-if="feedback === 'incorrect'" class="feedback feedback-incorrect">
            ✕ Incorrect. La bonne réponse était : {{ currentQuestion.correctAnswer }}
          </div>
        </Transition>

        <!-- Write-in comparison + self-grading -->
        <Transition name="fade">
          <div v-if="feedback === 'self-grade'" class="self-grade-panel">
            <div class="comparison-grid">
              <div class="comparison-block">
                <span class="comparison-label">Votre réponse</span>
                <div class="comparison-text">{{ quizStore.answers[quizStore.answers.length - 1]?.userAnswer }}</div>
              </div>
              <div class="comparison-block">
                <span class="comparison-label">Réponse attendue</span>
                <div class="comparison-text">{{ currentQuestion.correctAnswer }}</div>
              </div>
            </div>
            <p class="grade-prompt">Évaluez votre réponse :</p>
            <div class="grade-btns">
              <button class="grade-btn grade-full" @click="applyGrade(1.0)">
                <i class="fa-solid fa-circle-check"></i> Complet (1.0 pt)
              </button>
              <button class="grade-btn grade-partial" @click="applyGrade(0.5)">
                <i class="fa-solid fa-circle-half-stroke"></i> Partiel (0.5 pt)
              </button>
              <button class="grade-btn grade-zero" @click="applyGrade(0.0)">
                <i class="fa-solid fa-circle-xmark"></i> Aucun (0 pt)
              </button>
            </div>
          </div>
        </Transition>
      </div>
    </div>

    <!-- RESULTS -->
    <div v-else-if="screen === 'results'" class="quiz-results">
      <h2 class="results-title">Résultats</h2>

      <div class="results-stats">
        <div class="result-card">
          <span class="result-label">Score</span>
          <span class="result-value">{{ quizStore.score.toFixed(1) }} / {{ totalQuestions }}</span>
        </div>
        <div class="result-card">
          <span class="result-label">Correct</span>
          <span class="result-value correct">{{ quizStore.correctCount }}</span>
        </div>
        <div class="result-card">
          <span class="result-label">Incorrect</span>
          <span class="result-value incorrect">{{ quizStore.wrongCount }}</span>
        </div>
      </div>

      <p class="results-feedback">
        {{ quizStore.score >= totalQuestions ? '🏆 Parfait ! Vous maîtrisez parfaitement ces fiches.' :
           quizStore.score / totalQuestions >= 0.8 ? '🩺 Excellent travail ! Continuez ainsi.' :
           quizStore.score / totalQuestions >= 0.5 ? '📚 Bon début, révisez les points faibles ci-dessous.' :
           '⚠️ La mémorisation est insuffisante. Relisez vos fiches de référence.' }}
      </p>

      <!-- Weak points -->
      <div v-if="weakCategories.length > 0" class="weak-points-panel">
        <h3 class="weak-points-title"><i class="fa-solid fa-triangle-exclamation"></i> Points faibles</h3>
        <div v-for="item in weakCategories" :key="item.name" class="weak-category-row">
          <span class="weak-cat-name">{{ item.name }}</span>
          <div class="weak-bar-bg">
            <div class="weak-bar-fill" :class="{ 'weak-bar-danger': item.percent < 50 }" :style="{ width: item.percent + '%' }"></div>
          </div>
          <span class="weak-cat-pct">{{ item.percent }}% ({{ item.score }}/{{ item.max }})</span>
        </div>
      </div>

      <!-- Results table -->
      <div class="results-table-wrap">
        <table class="results-table">
          <thead>
            <tr>
              <th>#</th>
              <th>Fiche</th>
              <th>Type</th>
              <th>Score</th>
              <th></th>
            </tr>
          </thead>
          <tbody>
            <tr v-for="(ans, idx) in quizStore.answers" :key="idx" class="results-row">
              <td class="results-idx">{{ idx + 1 }}</td>
              <td class="results-cat">{{ ans.catTitle }}</td>
              <td class="results-type">
                {{ ans.type === 'clinical' ? 'Cas Clinique' :
                   ans.type === 'posology' ? 'Ordonnance QCM' :
                   ans.type === 'redflags' ? 'Red Flags' : 'Ordonnance Écrite' }}
              </td>
              <td :class="['results-score', {
                'score-full': ans.score === 1.0,
                'score-partial': ans.score === 0.5,
                'score-zero': ans.score === 0
              }]">{{ ans.score.toFixed(1) }}</td>
              <td>
                <button class="view-cat-btn" @click="goToCat(ans.catId)">
                  <i class="fa-solid fa-eye"></i> Voir
                </button>
              </td>
            </tr>
          </tbody>
        </table>
      </div>

      <div class="results-actions">
        <button v-if="quizStore.wrongCount > 0" class="secondary-btn" @click="retryFailed">
          <i class="fa-solid fa-rotate-left"></i> Refaire les erreurs ({{ quizStore.wrongCount }})
        </button>
        <button class="primary-btn" @click="resetQuiz">
          Nouveau quiz
        </button>
      </div>
    </div>
  </div>
</template>

<style scoped>
.quiz-view {
  padding: 20px;
  max-width: 700px;
  margin: 0 auto;
}
.quiz-title {
  font-size: 24px;
  font-weight: 700;
  margin-bottom: 20px;
}
.quiz-setup {
  display: flex;
  flex-direction: column;
  gap: 20px;
}
.form-group {
  display: flex;
  flex-direction: column;
  gap: 8px;
}
.form-label {
  font-size: 13px;
  font-weight: 600;
  color: var(--text-primary);
}
.form-select,
.form-input {
  padding: 10px 12px;
  border: 1px solid var(--color-border);
  border-radius: 10px;
  background: var(--color-surface);
  color: var(--text-primary);
  font-size: 14px;
  outline: none;
  font-family: inherit;
}
.type-toggles {
  display: flex;
  flex-wrap: wrap;
  gap: 8px;
}
.type-btn {
  padding: 8px 14px;
  border: 1px solid var(--color-border);
  border-radius: 8px;
  background: transparent;
  color: var(--text-secondary);
  font-size: 13px;
  cursor: pointer;
  transition: all 0.2s;
  font-family: inherit;
}
.type-btn.active {
  background: var(--color-primary);
  color: white;
  border-color: var(--color-primary);
}
.checkbox-label {
  display: flex;
  align-items: center;
  gap: 8px;
  font-size: 13px;
  color: var(--text-primary);
  cursor: pointer;
}
.checkbox-label input {
  width: 16px;
  height: 16px;
  accent-color: var(--color-primary);
}
.primary-btn {
  padding: 12px 20px;
  border: none;
  border-radius: 10px;
  background: var(--color-primary);
  color: white;
  font-size: 14px;
  font-weight: 600;
  cursor: pointer;
  transition: all 0.2s;
  font-family: inherit;
}
.primary-btn:disabled {
  opacity: 0.5;
  cursor: not-allowed;
}
.quiz-progress {
  display: flex;
  align-items: center;
  gap: 12px;
  margin-bottom: 20px;
}
.progress-bar {
  flex: 1;
  height: 6px;
  background: rgba(255, 255, 255, 0.06);
  border-radius: 3px;
  overflow: hidden;
}
.progress-fill {
  height: 100%;
  background: linear-gradient(90deg, var(--color-primary), #10b981);
  border-radius: 3px;
  transition: width 0.3s ease;
}
.progress-text {
  font-size: 12px;
  color: var(--text-muted);
  font-weight: 600;
}
.timer-badge {
  font-size: 13px;
  font-weight: 700;
  padding: 4px 10px;
  border-radius: 8px;
  background: rgba(245, 158, 11, 0.15);
  color: var(--color-warning);
  border: 1px solid rgba(245, 158, 11, 0.3);
}
.timer-danger {
  background: rgba(239, 68, 68, 0.15);
  color: var(--color-danger);
  border-color: rgba(239, 68, 68, 0.3);
  animation: pulse 1s infinite;
}
@keyframes pulse {
  0%, 100% { opacity: 1; }
  50% { opacity: 0.6; }
}
.question-card {
  background: var(--color-surface);
  border: 1px solid var(--color-border);
  border-radius: 16px;
  padding: 20px;
  display: flex;
  flex-direction: column;
  gap: 16px;
}
.question-header {
  display: flex;
  align-items: center;
  gap: 10px;
  flex-wrap: wrap;
}
.question-type-badge {
  font-size: 11px;
  font-weight: 700;
  text-transform: uppercase;
  letter-spacing: 0.5px;
  padding: 4px 10px;
  border-radius: 6px;
}
.qtype-clinical {
  background: rgba(6, 182, 212, 0.15);
  color: var(--color-primary);
}
.qtype-posology {
  background: rgba(245, 158, 11, 0.15);
  color: var(--color-warning);
}
.qtype-redflags {
  background: rgba(239, 68, 68, 0.15);
  color: var(--color-danger);
}
.qtype-prescription {
  background: rgba(16, 185, 129, 0.15);
  color: var(--color-success);
}
.question-cat {
  font-size: 12px;
  color: var(--text-muted);
}
.question-points {
  font-size: 12px;
  color: var(--text-muted);
  margin-left: auto;
}
.question-text {
  font-size: 16px;
  font-weight: 600;
  margin: 0;
  line-height: 1.5;
}
.hint-area {
  display: flex;
  flex-direction: column;
  gap: 8px;
}
.hint-btn {
  align-self: flex-start;
  padding: 6px 14px;
  border: 1px dashed var(--color-warning);
  border-radius: 8px;
  background: rgba(245, 158, 11, 0.08);
  color: var(--color-warning);
  font-size: 13px;
  font-weight: 600;
  cursor: pointer;
  transition: all 0.2s;
  font-family: inherit;
}
.hint-btn:disabled {
  opacity: 0.5;
  cursor: not-allowed;
}
.hint-box {
  padding: 12px 14px;
  background: rgba(245, 158, 11, 0.08);
  border: 1px solid rgba(245, 158, 11, 0.25);
  border-radius: 10px;
  font-size: 13px;
  color: var(--text-secondary);
  line-height: 1.5;
}
.qcm-list {
  display: flex;
  flex-direction: column;
  gap: 8px;
}
.qcm-btn {
  width: 100%;
  padding: 14px 18px;
  border: 1px solid var(--color-border);
  border-radius: 12px;
  background: var(--color-background);
  color: var(--text-primary);
  font-size: 14px;
  font-weight: 500;
  cursor: pointer;
  text-align: left;
  line-height: 1.5;
  transition: all 0.2s;
  font-family: inherit;
}
.qcm-btn:hover:not(.qcm-disabled) {
  border-color: var(--color-primary);
  background: rgba(6, 182, 212, 0.05);
}
.qcm-selected {
  border-color: var(--color-primary);
  background: rgba(6, 182, 212, 0.08);
}
.qcm-correct {
  border-color: var(--color-success) !important;
  background: rgba(16, 185, 129, 0.1) !important;
}
.qcm-wrong {
  border-color: var(--color-danger) !important;
  background: rgba(239, 68, 68, 0.08) !important;
}
.qcm-disabled {
  cursor: default;
}
.writein-area {
  display: flex;
  flex-direction: column;
  gap: 12px;
}
.answer-input {
  width: 100%;
  padding: 12px;
  border: 1px solid var(--color-border);
  border-radius: 12px;
  background: var(--color-background);
  color: var(--text-primary);
  font-size: 14px;
  line-height: 1.6;
  resize: vertical;
  outline: none;
  font-family: inherit;
  box-sizing: border-box;
}
.submit-btn {
  align-self: flex-end;
  padding: 10px 20px;
  border: none;
  border-radius: 10px;
  background: var(--color-primary);
  color: white;
  font-size: 14px;
  font-weight: 600;
  cursor: pointer;
  transition: all 0.2s;
  font-family: inherit;
}
.submit-btn:disabled {
  opacity: 0.5;
  cursor: not-allowed;
}
.feedback {
  padding: 12px 16px;
  border-radius: 10px;
  font-size: 14px;
  font-weight: 600;
}
.feedback-correct {
  background: rgba(16, 185, 129, 0.15);
  color: var(--color-success);
  border: 1px solid rgba(16, 185, 129, 0.3);
}
.feedback-incorrect {
  background: rgba(245, 158, 11, 0.15);
  color: var(--color-warning);
  border: 1px solid rgba(245, 158, 11, 0.3);
}
.self-grade-panel {
  display: flex;
  flex-direction: column;
  gap: 16px;
}
.comparison-grid {
  display: grid;
  grid-template-columns: 1fr 1fr;
  gap: 12px;
}
.comparison-block {
  background: var(--color-background);
  border: 1px solid var(--color-border);
  border-radius: 10px;
  padding: 12px;
}
.comparison-label {
  display: block;
  font-size: 11px;
  color: var(--text-muted);
  text-transform: uppercase;
  letter-spacing: 0.5px;
  margin-bottom: 6px;
}
.comparison-text {
  font-size: 13px;
  color: var(--text-secondary);
  line-height: 1.5;
  white-space: pre-wrap;
  word-break: break-word;
}
.grade-prompt {
  font-size: 13px;
  font-weight: 600;
  color: var(--text-primary);
  margin: 0;
}
.grade-btns {
  display: flex;
  gap: 8px;
  flex-wrap: wrap;
}
.grade-btn {
  padding: 8px 14px;
  border: none;
  border-radius: 8px;
  font-size: 13px;
  font-weight: 600;
  cursor: pointer;
  transition: all 0.2s;
  font-family: inherit;
  display: flex;
  align-items: center;
  gap: 6px;
}
.grade-full {
  background: rgba(16, 185, 129, 0.15);
  color: var(--color-success);
}
.grade-partial {
  background: rgba(245, 158, 11, 0.15);
  color: var(--color-warning);
}
.grade-zero {
  background: rgba(239, 68, 68, 0.12);
  color: #f87171;
}
.fade-enter-active,
.fade-leave-active {
  transition: opacity 0.3s ease;
}
.fade-enter-from,
.fade-leave-to {
  opacity: 0;
}
.quiz-results {
  display: flex;
  flex-direction: column;
  align-items: center;
  gap: 20px;
  padding: 20px 0;
  text-align: center;
}
.results-title {
  font-size: 24px;
  font-weight: 700;
}
.results-stats {
  display: flex;
  gap: 16px;
  width: 100%;
  max-width: 500px;
}
.result-card {
  flex: 1;
  background: var(--color-surface);
  border: 1px solid var(--color-border);
  border-radius: 12px;
  padding: 16px;
  display: flex;
  flex-direction: column;
  gap: 8px;
}
.result-label {
  font-size: 12px;
  color: var(--text-muted);
  text-transform: uppercase;
  letter-spacing: 0.5px;
}
.result-value {
  font-size: 28px;
  font-weight: 700;
  color: var(--text-primary);
}
.result-value.correct {
  color: var(--color-success);
}
.result-value.incorrect {
  color: var(--color-warning);
}
.results-feedback {
  font-size: 14px;
  color: var(--text-secondary);
  max-width: 500px;
  line-height: 1.5;
}
.weak-points-panel {
  width: 100%;
  max-width: 600px;
  background: rgba(239, 68, 68, 0.06);
  border: 1px solid rgba(239, 68, 68, 0.2);
  border-radius: 12px;
  padding: 14px 16px;
  text-align: left;
}
.weak-points-title {
  font-size: 13px;
  font-weight: 600;
  color: var(--color-danger);
  margin: 0 0 12px 0;
  display: flex;
  align-items: center;
  gap: 6px;
}
.weak-category-row {
  display: flex;
  align-items: center;
  gap: 10px;
  margin-bottom: 8px;
}
.weak-cat-name {
  font-size: 13px;
  font-weight: 500;
  color: var(--text-primary);
  min-width: 120px;
}
.weak-bar-bg {
  flex: 1;
  height: 6px;
  background: rgba(255, 255, 255, 0.06);
  border-radius: 3px;
  overflow: hidden;
}
.weak-bar-fill {
  height: 100%;
  background: var(--color-warning);
  border-radius: 3px;
  transition: width 0.3s ease;
}
.weak-bar-danger {
  background: var(--color-danger);
}
.weak-cat-pct {
  font-size: 12px;
  color: var(--text-muted);
  font-weight: 600;
  min-width: 80px;
  text-align: right;
}
.results-table-wrap {
  width: 100%;
  max-width: 600px;
  overflow-x: auto;
}
.results-table {
  width: 100%;
  border-collapse: collapse;
  font-size: 13px;
}
.results-table th {
  text-align: left;
  padding: 8px 10px;
  font-size: 11px;
  color: var(--text-muted);
  text-transform: uppercase;
  letter-spacing: 0.5px;
  border-bottom: 1px solid var(--color-border);
}
.results-row {
  border-bottom: 1px solid rgba(255, 255, 255, 0.04);
}
.results-row td {
  padding: 10px;
}
.results-idx {
  color: var(--text-muted);
  font-weight: 600;
  width: 30px;
}
.results-cat {
  color: var(--text-primary);
  font-weight: 500;
  max-width: 200px;
  overflow: hidden;
  text-overflow: ellipsis;
  white-space: nowrap;
}
.results-type {
  color: var(--text-secondary);
  font-size: 12px;
}
.results-score {
  font-weight: 700;
  width: 50px;
  text-align: center;
}
.score-full {
  color: var(--color-success);
}
.score-partial {
  color: var(--color-warning);
}
.score-zero {
  color: var(--color-danger);
}
.view-cat-btn {
  padding: 4px 10px;
  border: 1px solid var(--color-border);
  border-radius: 6px;
  background: transparent;
  color: var(--text-secondary);
  font-size: 12px;
  cursor: pointer;
  font-family: inherit;
  transition: all 0.2s;
}
.view-cat-btn:hover {
  background: var(--color-surface);
  color: var(--text-primary);
}
.results-actions {
  display: flex;
  gap: 12px;
}
.secondary-btn {
  padding: 12px 20px;
  border: 1px solid var(--color-border);
  border-radius: 10px;
  background: transparent;
  color: var(--text-primary);
  font-size: 14px;
  font-weight: 600;
  cursor: pointer;
  transition: all 0.2s;
  font-family: inherit;
  display: flex;
  align-items: center;
  gap: 6px;
}
.secondary-btn:hover {
  background: var(--color-surface);
}
</style>
