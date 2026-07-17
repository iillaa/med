import { defineStore } from 'pinia';
import type { QuizSession, QuizAnswer, QuizQuestion, QuizSetupConfig, QuestionType } from '../types/quiz';
import type { Cat } from '../types/cat';
import { getLeitnerData, saveLeitnerData, updateLeitnerStats, updateQuizStreak, getStreakInfo } from './cats';
import { fetchCats } from '../api/client';
import { getItem, setItem, STORAGE_KEYS } from '../utils/storage';
import { generateQuestions } from '../composables/useQuizGenerator';

export const useQuizStore = defineStore('quiz', {
  state: (): QuizSession => ({
    questions: [],
    currentIndex: 0,
    answers: [],
    score: 0,
    quizViewingCatId: null,
    failedQuestions: [],
    isTimed: false,
    timerSeconds: 0
  }),

  getters: {
    currentQuestion: (state): QuizQuestion | null => {
      if (state.currentIndex >= 0 && state.currentIndex < state.questions.length) {
        return state.questions[state.currentIndex] as QuizQuestion;
      }
      return null;
    },

    isFinished: (state): boolean => {
      return state.currentIndex >= state.questions.length;
    },

    correctCount: (state): number => {
      return state.answers.filter(a => a.score >= 1.0).length;
    },

    wrongCount: (state): number => {
      return state.answers.filter(a => a.score < 1.0).length;
    }
  },

  actions: {
    async startQuiz(setup: QuizSetupConfig, allCats?: Cat[]): Promise<void> {
      this.answers = [];
      this.score = 0;
      this.currentIndex = 0;
      this.failedQuestions = [];
      this.quizViewingCatId = null;
      this.isTimed = setup.timedMode;
      this.timerSeconds = setup.timerSeconds;

      const cats = allCats || (await fetchCats()).filter((c: any) => c.status !== 'todo');

      const filteredCats = setup.category && setup.category !== 'all'
        ? cats.filter((c: any) => c.category === setup.category)
        : cats;

      const selectedTypes: QuestionType[] = Object.entries(setup.types)
        .filter(([, enabled]) => enabled)
        .map(([type]) => type as QuestionType);

      if (selectedTypes.length === 0) {
        this.questions = [];
        return;
      }

      const shuffled = [...filteredCats].sort(() => Math.random() - 0.5);
      const limited = shuffled.slice(0, setup.count);

      const questions: QuizQuestion[] = limited.flatMap(cat => generateQuestions(cat, selectedTypes));

      this.questions = questions;
      this.currentIndex = 0;
    },

    submitAnswer(userAnswer: string, score: number): QuizAnswer | null {
      const q = this.currentQuestion;
      if (!q) return null;

      const finalScore = score * q.points;
      this.score += finalScore;

      const answer: QuizAnswer = {
        catId: q.cat.id,
        catTitle: q.cat.title,
        type: q.type,
        userAnswer,
        correctAnswer: q.correctAnswer,
        score: finalScore
      };

      this.answers.push(answer);

      if (finalScore < 1.0 && this.failedQuestions) {
        this.failedQuestions.push(q);
      }

      updateLeitnerStats(q.cat.id, finalScore >= 1.0);
      updateQuizStreak();

      this.currentIndex += 1;
      return answer;
    },

    submitQCMOption(option: string): QuizAnswer | null {
      const q = this.currentQuestion;
      if (!q) return null;

      const isCorrect = option === q.correctAnswer;
      const finalScore = isCorrect ? q.points : 0;
      this.score += finalScore;

      const answer: QuizAnswer = {
        catId: q.cat.id,
        catTitle: q.cat.title,
        type: q.type,
        userAnswer: option,
        correctAnswer: q.correctAnswer,
        score: finalScore
      };

      this.answers.push(answer);

      if (!isCorrect && this.failedQuestions) {
        this.failedQuestions.push(q);
      }

      updateLeitnerStats(q.cat.id, isCorrect);
      updateQuizStreak();

      this.currentIndex += 1;
      return answer;
    },

    submitSelfGrade(score: number): QuizAnswer | null {
      const q = this.currentQuestion;
      if (!q) return null;

      const finalScore = score * q.points;
      this.score += finalScore;

      const lastAnswer = this.answers[this.answers.length - 1];
      if (lastAnswer) {
        lastAnswer.score = finalScore;
      }

      if (finalScore < 1.0 && this.failedQuestions) {
        this.failedQuestions.push(q);
      }

      updateLeitnerStats(q.cat.id, finalScore >= 1.0);
      updateQuizStreak();

      this.currentIndex += 1;
      return lastAnswer || null;
    },

    retryFailed(): void {
      if (!this.failedQuestions || this.failedQuestions.length === 0) return;
      this.questions = [...this.failedQuestions];
      this.currentIndex = 0;
      this.answers = [];
      this.score = 0;
      this.failedQuestions = [];
    },

    reset(): void {
      this.questions = [];
      this.currentIndex = 0;
      this.answers = [];
      this.score = 0;
      this.quizViewingCatId = null;
      this.failedQuestions = [];
      this.isTimed = false;
      this.timerSeconds = 0;
    },

    setQuizViewingCatId(id: number | null): void {
      this.quizViewingCatId = id;
    }
  }
});

export function shuffleArray<T>(array: T[]): T[] {
  const result = [...array];
  for (let i = result.length - 1; i > 0; i--) {
    const j = Math.floor(Math.random() * (i + 1));
    const temp = result[i] as T;
    result[i] = result[j] as T;
    result[j] = temp;
  }
  return result;
}

export function getQuizSetupFromStorage(): QuizSetupConfig | null {
  const raw = localStorage.getItem('dr_cat_quiz_setup');
  if (!raw) return null;
  try {
    return JSON.parse(raw) as QuizSetupConfig;
  } catch {
    return null;
  }
}

export function saveQuizSetupToStorage(setup: QuizSetupConfig): void {
  localStorage.setItem('dr_cat_quiz_setup', JSON.stringify(setup));
}

