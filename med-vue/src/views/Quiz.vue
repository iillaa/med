<script setup lang="ts">
import { useQuizStore } from '@/stores/quiz'

const quizStore = useQuizStore()
</script>

<template>
  <div class="quiz-view">
    <h1>Quiz</h1>
    <p class="placeholder">Quiz engine — coming next.</p>
  </div>
</template>

<style scoped>
.quiz-view {
  padding: 20px;
}
.placeholder {
  color: var(--text-muted);
  margin-top: 12px;
}
</style>
