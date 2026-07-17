<script setup lang="ts">
import { ref, computed } from 'vue'
import { useQuizStore } from '@/stores/quiz'
import { useCatsStore } from '@/stores/cats'
import type { QuizSetupConfig, QuestionType } from '@/types/quiz'

const quizStore = useQuizStore()
const catsStore = useCatsStore()

const screen = ref<'setup' | 'question' | 'results'>('setup')
const userAnswer = ref('')
const feedback = ref<'none' | 'correct' | 'incorrect'>('none')
const lastScore = ref(0)

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

async function startQuiz(): Promise<void> {
  await quizStore.startQuiz(setupForm.value, catsStore.cats)
  if (quizStore.questions.length > 0) {
    screen.value = 'question'
    feedback.value = 'none'
    userAnswer.value = ''
  }
}

function submitAnswer(): void {
  if (!userAnswer.value.trim() || !currentQuestion.value) return

  const score = userAnswer.value.trim().length > 0 ? 1.0 : 0.0
  lastScore.value = score
  quizStore.submitAnswer(userAnswer.value, score)
  feedback.value = score >= 1.0 ? 'correct' : 'incorrect'
  userAnswer.value = ''

  setTimeout(() => {
    feedback.value = 'none'
    if (quizStore.isFinished) {
      screen.value = 'results'
    }
  }, 1200)
}

function retryFailed(): void {
  quizStore.retryFailed()
  screen.value = 'question'
  feedback.value = 'none'
  userAnswer.value = ''
}

function resetQuiz(): void {
  quizStore.reset()
  screen.value = 'setup'
  feedback.value = 'none'
  userAnswer.value = ''
}

function toggleType(type: QuestionType): void {
  setupForm.value.types[type] = !setupForm.value.types[type]
}
</script>

<template>
  <div class="quiz-view">
    <h1 class="quiz-title">Quiz</h1>

    <div v-if="screen === 'setup'" class="quiz-setup">
      <div class="form-group">
        <label class="form-label">Catégorie</label>
        <select v-model="setupForm.category" class="form-select">
          <option value="all">Toutes les spécialités</option>
          <option v-for="cat in categories" :key="cat" :value="cat">
            {{ cat }}
          </option>
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

    <div v-else-if="screen === 'question'" class="quiz-question">
      <div class="quiz-progress">
        <div class="progress-bar">
          <div class="progress-fill" :style="{ width: progressPercent + '%' }"></div>
        </div>
        <span class="progress-text">{{ quizStore.currentIndex + 1 }} / {{ totalQuestions }}</span>
      </div>

      <div v-if="currentQuestion" class="question-card">
        <div class="question-header">
          <span class="question-type">{{ currentQuestion.type }}</span>
          <span class="question-cat">{{ currentQuestion.cat.category }}</span>
        </div>
        <h2 class="question-text">{{ currentQuestion.questionText }}</h2>

        <div class="answer-area">
          <textarea
            v-model="userAnswer"
            class="answer-input"
            placeholder="Saisissez votre réponse..."
            rows="5"
            :disabled="feedback !== 'none'"
          ></textarea>
          <button
            class="submit-btn"
            @click="submitAnswer"
            :disabled="!userAnswer.trim() || feedback !== 'none'"
          >
            Valider
          </button>
        </div>

        <Transition name="fade">
          <div v-if="feedback === 'correct'" class="feedback feedback-correct">
            ✓ Bonne réponse !
          </div>
          <div v-else-if="feedback === 'incorrect'" class="feedback feedback-incorrect">
            ✕ Réponse enregistrée. Vérifiez la solution après le quiz.
          </div>
        </Transition>
      </div>
    </div>

    <div v-else-if="screen === 'results'" class="quiz-results">
      <h2 class="results-title">Résultats</h2>
      <div class="results-stats">
        <div class="result-card">
          <span class="result-label">Score</span>
          <span class="result-value">{{ quizStore.score.toFixed(1) }}</span>
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

      <div class="results-actions">
        <button v-if="quizStore.wrongCount > 0" class="secondary-btn" @click="retryFailed">
          Réessayer les erreurs
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
  justify-content: space-between;
  align-items: center;
}
.question-type {
  font-size: 11px;
  font-weight: 700;
  text-transform: uppercase;
  letter-spacing: 0.5px;
  color: var(--color-primary);
  background: rgba(6, 182, 212, 0.15);
  padding: 4px 8px;
  border-radius: 6px;
}
.question-cat {
  font-size: 12px;
  color: var(--text-muted);
}
.question-text {
  font-size: 16px;
  font-weight: 600;
  margin: 0;
  line-height: 1.5;
}
.answer-area {
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
  gap: 24px;
  padding: 40px 20px;
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
}
.secondary-btn:hover {
  background: var(--color-surface);
}
</style>
