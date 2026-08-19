import { safeGetItem, safeParseJSON } from '../../lib/safeStorage.js';

export function calculateStats(cats) {
  let todo = 0, doing = 0, done = 0;
  const list = Array.isArray(cats) ? cats : [];
  list.forEach(cat => {
    if (cat?.status === 'done') done++;
    else if (cat?.status === 'doing') doing++;
    else todo++;
  });
  return { todo, doing, done, total: list.length };
}

export function getStreakCount() {
  let streakCount = 0;
  try {
    const raw = safeGetItem('dr_cat_streak', '{"count": 0}');
    const streakInfo = safeParseJSON(raw, { count: 0 });
    streakCount = (streakInfo && typeof streakInfo.count === 'number') ? streakInfo.count : 0;
  } catch (e) {
    console.warn("Failed to parse study streak info", e);
  }
  return streakCount;
}

