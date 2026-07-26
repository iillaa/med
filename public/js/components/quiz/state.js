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

export function updateLeitnerStats(catId, wasCorrect) {
  let leitnerData = {};
  try {
    leitnerData = JSON.parse(localStorage.getItem('dr_cat_leitner') || '{}') || {};
  } catch (e) {
    console.warn("Failed to parse Leitner spaced repetition data", e);
  }
  const current = leitnerData[catId] || { box: 1, lastQuizzed: 0 };

  if (wasCorrect) {
    current.box = Math.min(5, (current.box || 1) + 1);
  } else {
    current.box = 1;
  }
  current.lastQuizzed = Date.now();

  leitnerData[catId] = current;
  try {
    localStorage.setItem('dr_cat_leitner', JSON.stringify(leitnerData));
  } catch (e) {
    /* ignore quota errors */
  }
}

export function updateQuizStreak() {
  const todayStr = new Date().toISOString().split('T')[0];
  let streakInfo = { count: 0, lastDate: "" };
  try {
    streakInfo = JSON.parse(localStorage.getItem('dr_cat_streak') || '{"count":0,"lastDate":""}') || { count: 0, lastDate: "" };
  } catch (e) {
    console.warn("Failed to parse study streak info", e);
  }

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
  try {
    localStorage.setItem('dr_cat_streak', JSON.stringify(streakInfo));
  } catch (e) {
    /* ignore quota errors */
  }

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
