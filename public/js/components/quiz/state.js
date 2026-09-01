import { safeGetItem, safeSetItem, safeParseJSON } from '../../lib/safeStorage.js';

export const FRENCH_STOP_WORDS = new Set([
  'pour', 'avec', 'dans', 'chez', 'mais', 'sans', 'plus', 'moins', 'sous',
  'fois', 'jour', 'sont', 'cette', 'dont', 'votre', 'leur', 'leurs',
  'comme', 'tout', 'tous', 'toute', 'toutes', 'ces', 'une', 'des', 'les', 'par',
  'encas', 'clinique', 'devant', 'sujet', 'fiche', 'card', 'tres', 'très'
]);

export function shuffleArray(array) {
  for (let i = array.length - 1; i > 0; i--) {
    const j = Math.floor(Math.random() * (i + 1));
    [array[i], array[j]] = [array[j], array[i]];
  }
  return array;
}

export function updateLeitnerStats(catId, wasCorrect, quality = null) {
  let leitnerData = safeParseJSON(safeGetItem('dr_cat_leitner'), {}) || {};
  const current = leitnerData[catId] || {
    box: 1,
    repetitions: 0,
    interval: 1,
    easinessFactor: 2.5,
    nextReview: 0,
    lastQuizzed: 0
  };

  // SuperMemo SM-2 Spaced Repetition Formula
  const q = quality !== null ? quality : (wasCorrect ? 4 : 1);
  let ef = current.easinessFactor || 2.5;
  let reps = current.repetitions || 0;
  let interval = current.interval || 1;

  if (q >= 3) {
    if (reps === 0) {
      interval = 1;
    } else if (reps === 1) {
      interval = 6;
    } else {
      interval = Math.round(interval * ef);
    }
    reps++;
  } else {
    reps = 0;
    interval = 1;
  }

  // EF' = EF + (0.1 - (5 - q) * (0.08 + (5 - q) * 0.02))
  ef = ef + (0.1 - (5 - q) * (0.08 + (5 - q) * 0.02));
  if (ef < 1.3) ef = 1.3;

  current.repetitions = reps;
  current.interval = interval;
  current.easinessFactor = Number(ef.toFixed(2));
  current.box = Math.min(5, Math.max(1, Math.ceil(interval / 5))); // Virtual box 1-5 for UI badge compatibility
  current.lastQuizzed = Date.now();
  current.nextReview = Date.now() + (interval * 24 * 60 * 60 * 1000);

  leitnerData[catId] = current;
  safeSetItem('dr_cat_leitner', JSON.stringify(leitnerData));
  return current;
}

export function updateQuizStreak() {
  const d = new Date();
  const todayStr = `${d.getFullYear()}-${String(d.getMonth() + 1).padStart(2, '0')}-${String(d.getDate()).padStart(2, '0')}`;
  let streakInfo = safeParseJSON(safeGetItem('dr_cat_streak'), { count: 0, lastDate: "" }) || { count: 0, lastDate: "" };

  if (streakInfo.lastDate === todayStr) {
    return;
  }

  const yesterday = new Date();
  yesterday.setDate(yesterday.getDate() - 1);
  const yesterdayStr = yesterday.toISOString().split('T')[0];

  if (streakInfo.lastDate === yesterdayStr) {
    streakInfo.count += 1;
  } else {
    streakInfo.count = 1;
  }

  streakInfo.lastDate = todayStr;
  safeSetItem('dr_cat_streak', JSON.stringify(streakInfo));

  const streakCountEl = document.getElementById('dash-streak-count');
  if (streakCountEl) {
    streakCountEl.textContent = `${streakInfo.count} jour${streakInfo.count > 1 ? 's' : ''}`;
  }
}

export async function requestWakeLock() {
  try {
    if ('wakeLock' in navigator) {
      const wakeLock = await navigator.wakeLock.request('screen');
      console.log('[Wake Lock] Screen Wake Lock acquired.');
      return wakeLock;
    }
  } catch (err) {
    console.warn(`[Wake Lock] Failed to acquire screen wake lock: ${err.message}`);
  }
  return null;
}

export function releaseWakeLock(wakeLock) {
  try {
    if (wakeLock !== null) {
      wakeLock.release().then(() => {
        console.log('[Wake Lock] Screen Wake Lock released.');
      }).catch(err => {
        console.warn(`[Wake Lock] Notice on release: ${err.message}`);
      });
    }
  } catch (err) {
    console.warn(`[Wake Lock] Failed to release screen wake lock: ${err.message}`);
  }
}
