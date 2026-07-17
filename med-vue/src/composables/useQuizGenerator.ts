import type { QuizQuestion, QuestionType } from '@/types/quiz'
import type { Cat } from '@/types/cat'
import { shuffleArray } from '@/stores/quiz'

const FRENCH_STOP_WORDS = new Set([
  'pour', 'avec', 'dans', 'chez', 'mais', 'sans', 'plus', 'moins', 'sous',
  'fois', 'jour', 'sont', 'cette', 'dont', 'votre', 'leur', 'leurs',
  'comme', 'tout', 'tous', 'toute', 'toutes', 'ces', 'une', 'des', 'les', 'par',
  'encas', 'clinique', 'devant', 'sujet', 'fiche', 'card', 'tres', 'très'
])

function getOrientationText(cat: Cat): string {
  if (!cat || !cat.summary) return ''
  const marker = '5. Orientation'
  const index = cat.summary.indexOf(marker)
  if (index !== -1) {
    let text = cat.summary.substring(index + marker.length)
    text = text.replace(/^[^\n\r]*[\n\r]+/, '').trim()
    const lines = text.split('\n')
    const resultLines: string[] = []
    for (const line of lines) {
      if (line.includes('**')) break
      resultLines.push(line.replace(/^-\s*/, '').trim())
    }
    return resultLines.filter(l => l).join(' ')
  }
  return ''
}

function cleanTextOfClues(text: string, title?: string, category?: string): string {
  if (!text) return ''
  const lines = text.split('\n')
  const cleanLines: string[] = []
  for (const line of lines) {
    const trimmed = line.trim()
    if (!trimmed) continue
    if (
      trimmed.startsWith('**') &&
      (trimmed.toLowerCase().includes('pour') ||
        trimmed.toLowerCase().includes('cas') ||
        trimmed.toLowerCase().includes('symptômes') ||
        trimmed.toLowerCase().includes('en cas') ||
        trimmed.endsWith(':**') ||
        trimmed.includes(':**'))
    ) {
      continue
    }
    cleanLines.push(trimmed)
  }
  let result = cleanLines.join('\n')

  if (title) {
    const cleanTitle = title
      .replace(/^CAT devant\s+/i, '')
      .replace(/^Différence entre\s+/i, '')
      .replace(/^Interprétation du\s+/i, '')
      .trim()
    if (cleanTitle.length > 2) {
      const escapedTitle = cleanTitle.replace(/[-$*+?.()|[\]{}]/g, '\\$&')
      const regex = new RegExp(escapedTitle, 'gi')
      result = result.replace(regex, '[la pathologie]')
    }
  }
  if (category) {
    const escapedCat = category.replace(/[-$*+?.()|[\]{}]/g, '\\$&')
    const regex = new RegExp(escapedCat, 'gi')
    result = result.replace(regex, '[spécialité]')
  }

  return result
}

function parseClinicalSigns(cat: Cat): string {
  if (!cat || !cat.summary) return ''
  const sec1Match = cat.summary.match(/\*\*1\.[^*]+\*\*([\s\S]+?)(?=\*\*2\.|\*\*3\.|\*\*4\.|\*\*5\.|\n\n|$)/)
  if (!sec1Match || !sec1Match[1]) return ''
  const sec1Text = sec1Match[1].trim()

  const cliniqueMatch = sec1Text.match(/-\s*Clinique\s*:\s*([^\n]+)/i)
  if (cliniqueMatch && cliniqueMatch[1]) {
    return cliniqueMatch[1].trim()
  }

  const diagMatch = sec1Text.match(/-\s*Diagnostic\s*:\s*([^\n]+)/i)
  if (diagMatch && diagMatch[1]) {
    return diagMatch[1].trim()
  }

  const bullets = sec1Text.split('\n').filter((line) => line.trim().startsWith('-'))
  if (bullets.length > 0) {
    return bullets.slice(0, 2).map((b) => b.replace(/^-\s*/, '').trim()).join('. ')
  }

  return sec1Text
}

function generateClinicalVignette(cat: Cat): string {
  const cleanTitle = cat.title
    .replace(/^CAT devant\s+/i, '')
    .replace(/^Différence entre\s+/i, '')
    .replace(/^Interprétation du\s+/i, '')
    .trim()

  let gender = Math.random() > 0.5 ? 'Un patient' : 'Une patiente'
  let age: number | string = Math.floor(Math.random() * 50) + 18

  if (cat.category === 'Pédiatrie') {
    gender = Math.random() > 0.5 ? 'Un enfant' : 'Une fillette'
    age = Math.floor(Math.random() * 10) + 1
    if (age === 1) age = '12 mois'
    else age = `${age} ans`
  } else if (cat.category === 'Gynécologie / Obstétrique') {
    gender = 'Une patiente'
  }

  let signs = parseClinicalSigns(cat)
  signs = signs.replace(/\*\*/g, '').replace(/\[la pathologie\]/g, cleanTitle).trim()

  signs = signs.substring(0, 220).trim()
  if (!signs.endsWith('.') && signs.length > 0) signs += '...'

  const settings = [
    'se présente à votre cabinet médical',
    'se présente aux urgences',
    'vous consulte',
    'arrive en consultation'
  ]
  const setting = settings[Math.floor(Math.random() * settings.length)]

  const ageStr = typeof age === 'number' ? `${age} ans` : age
  let text = `${gender} de ${ageStr} ${setting}`

  if (signs && signs.length > 5) {
    text += ` présentant les signes suivants : <br><em>"${signs}"</em>.`
  } else {
    text += ` pour suspicion de : <br><strong>"${cleanTitle}"</strong>.`
  }

  return text
}

function extractKeywords(text: string): string[] {
  if (!text) return []
  const words = text.split(/[^a-zA-ZÀ-ÿ0-9]+/)
  const seenNormalized = new Set<string>()
  const keywords: string[] = []

  words.forEach(w => {
    const clean = w.trim()
    if (clean.length >= 4) {
      const normalized = clean.toLowerCase().normalize('NFD').replace(/[\u0300-\u036f]/g, '')
      if (!FRENCH_STOP_WORDS.has(normalized) && isNaN(Number(normalized)) && !seenNormalized.has(normalized)) {
        seenNormalized.add(normalized)
        keywords.push(clean)
      }
    }
  })
  return keywords
}

function checkMatchedKeywords(userAnswer: string, referenceText: string) {
  const refKeywords = extractKeywords(referenceText)
  const cleanUserAnswer = userAnswer.toLowerCase().normalize('NFD').replace(/[\u0300-\u036f]/g, '')

  return refKeywords.map(word => {
    const normalizedWord = word.toLowerCase().normalize('NFD').replace(/[\u0300-\u036f]/g, '')
    const matched = cleanUserAnswer.includes(normalizedWord)
    return { word, matched }
  })
}

function getKeywordHints(correctAnswer: string): string {
  if (!correctAnswer) return 'Aucun indice disponible pour cette question.'

  const words = correctAnswer
    .toLowerCase()
    .replace(/[.,/#!$%^&*;:{}=\-_`~()?"'\n]/g, ' ')
    .replace(/\b\d+mg\b/g, '')
    .replace(/\b\d+g\b/g, '')
    .split(/\s+/)
    .filter(w => {
      return (
        w.length > 4 &&
        !FRENCH_STOP_WORDS.has(w) &&
        !['comprimé', 'comprimés', 'gélule', 'gélules', 'sachet', 'sachets', 'traitement', 'traitements', 'pendant', 'jours', 'semaines', 'matin', 'soir'].includes(w)
      )
    })

  const uniqueWords = Array.from(new Set(words))
  shuffleArray(uniqueWords)
  const selected = uniqueWords.slice(0, 3)
  if (selected.length === 0) return 'Aucun indice disponible pour cette question.'
  return selected.join(', ')
}

export function generateQuestions(cat: Cat, types: QuestionType[]): QuizQuestion[] {
  return types.map(type => {
    let questionText = ''
    let correctAnswer = ''
    let points = 1

    switch (type) {
      case 'clinical':
        questionText = `Question clinique sur : ${cat.title}`
        correctAnswer = cat.summary
        points = 1
        break
      case 'posology':
        questionText = `Posologie pour : ${cat.title}`
        correctAnswer = cat.ordonnance
        points = 1
        break
      case 'redflags':
        questionText = `Signes d'alerte pour : ${cat.title}`
        correctAnswer = cat.red_flags
        points = 1
        break
      case 'prescription':
        questionText = `Ordonnance pour : ${cat.title}`
        correctAnswer = cat.ordonnance
        points = 1
        break
    }

    return {
      type,
      cat,
      questionText,
      correctAnswer,
      points
    }
  })
}

export {
  getOrientationText,
  cleanTextOfClues,
  parseClinicalSigns,
  generateClinicalVignette,
  extractKeywords,
  checkMatchedKeywords,
  getKeywordHints
}
