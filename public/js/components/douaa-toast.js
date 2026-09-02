/**
 * public/js/components/douaa-toast.js
 * 
 * Dr.CAT — Module de Rappel Spirituel & Douaa (Top-Right Toast)
 * Sadaqa Jariyah for Dr. Kibeche Ali Dia Eddine & his Parents.
 * 
 * Schedule: ~3 times in 1 hour of real-world elapsed time (20 minutes cooldown).
 */

const STORAGE_KEY = 'dr_cat_last_douaa_time';
const LAST_INDEX_KEY = 'dr_cat_last_douaa_idx';
const COOLDOWN_MS = 20 * 60 * 1000; // 20 minutes in real time (~3 per hour)
const INITIAL_BOOT_DELAY_MS = 5000; // 5 seconds initial delay after app boot
const AUTO_DISMISS_MS = 9000; // 9 seconds visible duration

// 5 Authentic Douas for Parents and Beneficial Knowledge
const DOUAA_COLLECTION = [
  {
    id: 1,
    badge: 'بر الوالدين',
    verse: '﴿ رَّبِّ ارْحَمْهُمَا كَمَا رَبَّيَانِي صَغِيرًا ﴾',
    supplication: 'اللَّهُمَّ اغْفِرْ لِمُعِدِّ هَذَا التَّطْبِيقِ وَلِوَالِدَيْهِ وَاجْعَلْهُ صَدَقَةً جَارِيَةً عَنْهُمَا 🤲'
  },
  {
    id: 2,
    badge: 'مغفرة ورحمة',
    verse: '﴿ رَبَّنَا اغْفِرْ لِي وَلِوَالِدَيَّ وَلِلْمُؤْمِنِينَ يَوْمَ يَقُومُ الْحِسَابُ ﴾',
    supplication: 'نَسْأَلُكُم دَعْوَةً صَالِحَةً بِظَهْرِ الغَيْبِ لِلطَّبِيبِ مُعِدِّ العَمَلِ وَوَالِدَيْهِ'
  },
  {
    id: 3,
    badge: 'دعاء جامع',
    verse: '﴿ رَّبِّ اغْفِرْ لِي وَلِوَالِدَيَّ وَلِمَن دَخَلَ بَيْتِيَ مُؤْمِنًا ﴾',
    supplication: 'اللَّهُمَّ اجْزِ وَالِدَيْنَا عَنَّا خَيْرَ الجَزَاءِ وَارْفَعْ دَرَجَاتِهِمَا فِي عِلِّيِّينَ'
  },
  {
    id: 4,
    badge: 'علم نافع وشفاء',
    verse: '« اللَّهُمَّ انْفَعْنَا بِمَا عَلَّمْتَنَا، وَعَلِّمْنَا مَا يَنْفَعُنَا، وَزِدْنَا عِلْمًا »',
    supplication: 'اللَّهُمَّ اشْفِ كُلَّ مَرِيضٍ، وَبَارِكْ فِي صَاحِبِ هَذَا التَّطْبِيقِ وَوَالِدَيْهِ'
  },
  {
    id: 5,
    badge: 'شكر النعمة',
    verse: '﴿ رَبِّ أَوْزِعْنِي أَنْ أَشْكُرَ نِعْمَتَكَ الَّتِي أَنْعَمْتَ عَلَيَّ وَعَلَىٰ وَالِدَيَّ ﴾',
    supplication: 'اللَّهُمَّ تَقَبَّلْ هَذَا الجُهْدَ خَالِصًا لِوَجْهِكَ الكَرِيمِ عَنَّا وَعَنْ وَالِدَيْنَا'
  }
];

let activeContainer = null;
let dismissTimer = null;
let remainingDismissTime = AUTO_DISMISS_MS;
let dismissStartTime = 0;

function getRandomDouaa() {
  let lastIdx = -1;
  try {
    lastIdx = parseInt(localStorage.getItem(LAST_INDEX_KEY) || '-1', 10);
  } catch (e) {}

  let availableIndices = DOUAA_COLLECTION.map((_, i) => i).filter(i => i !== lastIdx);
  if (availableIndices.length === 0) availableIndices = DOUAA_COLLECTION.map((_, i) => i);

  const selectedIdx = availableIndices[Math.floor(Math.random() * availableIndices.length)];
  try {
    localStorage.setItem(LAST_INDEX_KEY, String(selectedIdx));
  } catch (e) {}

  return DOUAA_COLLECTION[selectedIdx];
}

function shouldTriggerDouaa() {
  try {
    const lastTimeStr = localStorage.getItem(STORAGE_KEY);
    if (!lastTimeStr) return true; // First time ever
    const lastTime = parseInt(lastTimeStr, 10);
    if (isNaN(lastTime)) return true;
    return (Date.now() - lastTime) >= COOLDOWN_MS;
  } catch (e) {
    return false;
  }
}

function markDouaaTriggered() {
  try {
    localStorage.setItem(STORAGE_KEY, String(Date.now()));
  } catch (e) {}
}

export function showDouaaToast(force = false) {
  if (!force && !shouldTriggerDouaa()) return;

  // If already displayed, do not duplicate
  if (document.getElementById('dr-cat-douaa-toast')) return;

  const item = getRandomDouaa();
  markDouaaTriggered();

  const container = document.createElement('aside');
  container.id = 'dr-cat-douaa-toast';
  container.className = 'douaa-toast-container';
  container.setAttribute('role', 'alert');
  container.setAttribute('aria-live', 'polite');

  container.innerHTML = `
    <div class="douaa-toast-header">
      <div class="douaa-badge-wrapper">
        <span class="douaa-badge">
          <span class="douaa-badge-icon">🌿</span>
          <span class="douaa-badge-text">${item.badge}</span>
        </span>
      </div>
      <button class="douaa-close-btn" id="douaa-close-trigger" aria-label="Fermer" title="إغلاق">×</button>
    </div>
    <div class="douaa-verse">${item.verse}</div>
    <div class="douaa-supplication">${item.supplication}</div>
    <div class="douaa-toast-footer">
      <button class="douaa-btn-ameen" id="douaa-ameen-trigger">
        <span>آمين 🤲</span>
      </button>
    </div>
  `;

  document.body.appendChild(container);
  activeContainer = container;

  // Trigger smooth enter animation on next frame
  requestAnimationFrame(() => {
    container.classList.add('douaa-visible');
  });

  // Start auto-dismiss timer
  startAutoDismiss();

  // Pause on hover or touch
  container.addEventListener('mouseenter', pauseAutoDismiss);
  container.addEventListener('mouseleave', resumeAutoDismiss);
  container.addEventListener('touchstart', pauseAutoDismiss, { passive: true });
  container.addEventListener('touchend', resumeAutoDismiss, { passive: true });

  // Event: Close Button Click
  const closeBtn = container.querySelector('#douaa-close-trigger');
  if (closeBtn) {
    closeBtn.addEventListener('click', () => {
      dismissDouaaToast();
    });
  }

  // Event: Ameen Button Click
  const ameenBtn = container.querySelector('#douaa-ameen-trigger');
  if (ameenBtn) {
    ameenBtn.addEventListener('click', () => {
      ameenBtn.classList.add('douaa-ameen-accepted');
      ameenBtn.innerHTML = '<span>جزاكم الله خيراً 💚</span>';
      // Wait 1.4s then smoothly dismiss
      clearTimeout(dismissTimer);
      setTimeout(() => {
        dismissDouaaToast();
      }, 1400);
    });
  }
}

function startAutoDismiss() {
  clearTimeout(dismissTimer);
  dismissStartTime = Date.now();
  remainingDismissTime = AUTO_DISMISS_MS;
  dismissTimer = setTimeout(() => {
    dismissDouaaToast();
  }, AUTO_DISMISS_MS);
}

function pauseAutoDismiss() {
  clearTimeout(dismissTimer);
  const elapsed = Date.now() - dismissStartTime;
  remainingDismissTime = Math.max(1000, remainingDismissTime - elapsed);
}

function resumeAutoDismiss() {
  clearTimeout(dismissTimer);
  dismissStartTime = Date.now();
  dismissTimer = setTimeout(() => {
    dismissDouaaToast();
  }, remainingDismissTime);
}

export function dismissDouaaToast() {
  clearTimeout(dismissTimer);
  const container = document.getElementById('dr-cat-douaa-toast');
  if (!container) return;

  container.classList.remove('douaa-visible');
  container.classList.add('douaa-hiding');

  setTimeout(() => {
    if (container && container.parentNode) {
      container.parentNode.removeChild(container);
    }
    activeContainer = null;
  }, 400);
}

/**
 * Initializes the Douaa background timer.
 * Checks on boot after 5 seconds, and polls every 2 minutes.
 */
export function initDouaaToast() {
  // First run 5 seconds after launch
  setTimeout(() => {
    showDouaaToast(false);
  }, INITIAL_BOOT_DELAY_MS);

  // Background interval check every 2 minutes
  setInterval(() => {
    if (shouldTriggerDouaa() && !document.getElementById('dr-cat-douaa-toast')) {
      showDouaaToast(false);
    }
  }, 2 * 60 * 1000);
}

if (typeof window !== 'undefined') {
  window.showDouaaToast = showDouaaToast;
}
