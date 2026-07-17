export type QuestionType = 'clinical' | 'posology' | 'redflags' | 'prescription';

export interface QuizAnswer {
  catId: number;
  catTitle: string;
  type: QuestionType;
  userAnswer: string;
  correctAnswer: string;
  score: number;
}

export interface QuizQuestion {
  type: QuestionType;
  cat: import('./cat').Cat;
  questionText: string;
  correctAnswer: string;
  options?: string[];
  points: number;
}

export interface QuizSession {
  questions: QuizQuestion[];
  currentIndex: number;
  answers: QuizAnswer[];
  score: number;
  quizViewingCatId: number | null;
  failedQuestions?: QuizQuestion[];
  isTimed?: boolean;
  timerSeconds?: number;
}

export interface QuizSetupConfig {
  category: string;
  count: number;
  types: {
    clinical: boolean;
    posology: boolean;
    redflags: boolean;
    prescription: boolean;
  };
  spacedRepetition: boolean;
  timedMode: boolean;
  timerSeconds: number;
}
