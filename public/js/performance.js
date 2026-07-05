// Core Performance Monitor Module for Dr. CAT
// Measures client-side frame drops, rendering, interaction, memory, and local storage I/O

// ── Safe mode for Android (disables heavy monitoring) ──
// Rationale: some Android WebViews can stall during startup if we wrap Storage
// or start monitoring loops immediately on module import.
const _isAndroidPerfSafeMode = (() => {
  try {
    return /android/i.test(navigator.userAgent);
  } catch (_) {
    return false;
  }
})();

const THRESHOLDS = {
  fps: { good: 55, warn: 40 },
  render: { good: 50, warn: 150 },
  apiLocal: { good: 50, warn: 200 },
  apiRemote: { good: 500, warn: 1500 },
  interaction: { good: 80, warn: 200 },
  pdfSearch: { good: 500, warn: 2000 },
  dbWrite: { good: 100, warn: 500 }
};

// Export a noop perf object on Android so module top-level side effects
// (like Storage wrapping and global listeners) don't run.
// Note: ES modules require exports at top-level, so we export `perf` once.
let perf = null;

if (_isAndroidPerfSafeMode) {
  const perfNoop = {
    THRESHOLDS,
    startMeasure: () => {},
    endMeasure: () => {},
    recordMilestone: () => {},
    recordApiCall: () => {},
    recordInteraction: () => {},
    startFrameMonitor: () => {},
    stopFrameMonitor: () => {},
    getFrameStats: () => ({ fps: 60, jankRate: 0, drops: 0, major: 0, totalFrames: 0 }),
    getMetrics: () => ({
      frame: { fps: 60, jankRate: 0, drops: 0, major: 0, totalFrames: 0 },
      renders: {},
      api: {},
      interactions: {},
      localStorage: { readCount: 0, writeCount: 0, readAvgMs: 0, writeAvgMs: 0 },
      memory: { supported: false, usedJSHeapSize: 0, totalJSHeapSize: 0, jsHeapSizeLimit: 0, growthBytes: 0, snapshots: [] },
      milestones: { domContentLoaded: null, catsFetched: null, sidebarRendered: null, dashboardReady: null }
    }),
    reset: () => {}
  };
  window.perf = perfNoop;
  perf = perfNoop;
} 



// If we are in Android safe mode, stop here after exporting noop.
if (_isAndroidPerfSafeMode) {
  // Keep window.perf already set; do not run heavy initialization.
} else {

// Internal states
const measurements = new Map();

const apiTimings = new Map(); // path -> Array of last 50 durations
const interactionTimings = new Map(); // type -> Array of last 50 durations
const memorySnapshots = []; // Array of last 20 usedJSHeapSize readings
let startupTimeOrigin = performance.timeOrigin || Date.now();

// Initial load milestones
const milestones = {
  domContentLoaded: null,
  catsFetched: null,
  sidebarRendered: null,
  dashboardReady: null
};

// Frame monitor state
let isFrameMonitoring = false;
let lastFrameTime = 0;
let frameDrops = 0;
let majorDrops = 0;
let frameCount = 0;
let fpsHistory = []; // Last 60 frame durations

// LocalStorage wrap timings
let localStorageReadCount = 0;
let localStorageWriteCount = 0;
let localStorageReadTotalMs = 0;
let localStorageWriteTotalMs = 0;

function frameLoop() {
  if (!isFrameMonitoring) return;
  
  const now = performance.now();
  if (lastFrameTime > 0) {
    const delta = now - lastFrameTime;
    frameCount++;
    fpsHistory.push(delta);
    if (fpsHistory.length > 60) fpsHistory.shift();

    if (delta > 20) {
      frameDrops++; // missed > 1 frame budget (16.6ms)
    }
    if (delta > 50) {
      majorDrops++; // missed > 3 frame budgets (heavy jank)
    }
  }
  lastFrameTime = now;

  if (document.visibilityState === 'visible') {
    requestAnimationFrame(frameLoop);
  }
}

document.addEventListener('visibilitychange', () => {
  if (document.visibilityState === 'visible' && isFrameMonitoring) {
    lastFrameTime = performance.now();
    requestAnimationFrame(frameLoop);
  }
});

// Memory snapshot loop (runs every 30s when monitoring is active)
let memoryIntervalId = null;
function startMemorySnapshotLoop() {
  if (memoryIntervalId) clearInterval(memoryIntervalId);
  
  const recordMemory = () => {
    try {
      if (performance.memory && performance.memory.usedJSHeapSize) {
        memorySnapshots.push({
          time: new Date().toLocaleTimeString('fr-FR'),
          heapSize: performance.memory.usedJSHeapSize
        });
        if (memorySnapshots.length > 20) {
          memorySnapshots.shift();
        }
      }
    } catch (_) {
      // performance.memory may throw/ be unsupported on this browser
    }
  };
  
  recordMemory(); // initial
  memoryIntervalId = setInterval(recordMemory, 30000);
}

function stopMemorySnapshotLoop() {
  if (memoryIntervalId) {
    clearInterval(memoryIntervalId);
    memoryIntervalId = null;
  }
}

// Wrap localStorage during init to measure synchronous file block overhead
function wrapLocalStorage() {
  const originalGet = Storage.prototype.getItem;
  const originalSet = Storage.prototype.setItem;

  Storage.prototype.getItem = function(key) {
    const start = performance.now();
    const val = originalGet.call(this, key);
    const duration = performance.now() - start;
    localStorageReadCount++;
    localStorageReadTotalMs += duration;
    return val;
  };

  Storage.prototype.setItem = function(key, value) {
    const start = performance.now();
    originalSet.call(this, key, value);
    const duration = performance.now() - start;
    localStorageWriteCount++;
    localStorageWriteTotalMs += duration;
    return value;
  };
}

// Initialize immediately on import
wrapLocalStorage();

// Hook pointerdown event to measure Tap-to-Paint interaction latency
document.addEventListener('pointerdown', (e) => {
  const target = e.target.closest('button, .cat-item, .tab-btn, .action-btn, .suggestion-btn');
  if (!target) return;
  
  const start = performance.now();
  // Time from touch down to next paint frame completion
  requestAnimationFrame(() => {
    const latency = performance.now() - start;
    const tagName = target.tagName.toLowerCase();
    const className = target.className.split(' ')[0] || '';
    const label = className ? `${tagName}.${className}` : tagName;
    
    perf.recordInteraction(label, latency);
  });
});

// Setup milestone for DOMContentLoaded
if (document.readyState === 'interactive' || document.readyState === 'complete') {
  milestones.domContentLoaded = performance.now();
} else {
  window.addEventListener('DOMContentLoaded', () => {
    milestones.domContentLoaded = performance.now();
  });
}

export const perf = {
  THRESHOLDS,
  
  startMeasure(name) {
    measurements.set(name, { start: performance.now() });
  },

  endMeasure(name) {
    const m = measurements.get(name);
    if (m) {
      m.end = performance.now();
      m.duration = m.end - m.start;
    }
  },

  recordMilestone(name) {
    if (milestones.hasOwnProperty(name)) {
      milestones[name] = performance.now();
    }
  },

  recordApiCall(url, status, duration) {
    let cleanPath = url;
    try {
      const parsed = new URL(url, window.location.origin);
      cleanPath = parsed.pathname;
    } catch (_) {}

    if (!apiTimings.has(cleanPath)) {
      apiTimings.set(cleanPath, []);
    }
    const samples = apiTimings.get(cleanPath);
    samples.push({ duration, status });
    if (samples.length > 50) samples.shift();
  },

  recordInteraction(label, duration) {
    if (!interactionTimings.has(label)) {
      interactionTimings.set(label, []);
    }
    const samples = interactionTimings.get(label);
    samples.push(duration);
    if (samples.length > 50) samples.shift();
  },

  startFrameMonitor() {
    if (isFrameMonitoring) return;
    isFrameMonitoring = true;
    lastFrameTime = 0;
    requestAnimationFrame(frameLoop);
    startMemorySnapshotLoop();
  },

  stopFrameMonitor() {
    isFrameMonitoring = false;
    stopMemorySnapshotLoop();
  },

  getFrameStats() {
    if (frameCount === 0) return { fps: 60, jankRate: 0, drops: 0, major: 0 };
    
    // Compute immediate average FPS from history
    let avgFps = 60;
    if (fpsHistory.length > 0) {
      const avgDuration = fpsHistory.reduce((sum, d) => sum + d, 0) / fpsHistory.length;
      avgFps = Math.min(60, Math.round(1000 / avgDuration));
    }

    const jankRate = frameDrops / frameCount;

    return {
      fps: avgFps,
      jankRate,
      drops: frameDrops,
      major: majorDrops,
      totalFrames: frameCount
    };
  },

  getMetrics() {
    // Component Renders
    const renders = {};
    for (const [name, data] of measurements.entries()) {
      if (data.duration !== undefined) {
        renders[name] = data.duration;
      }
    }

    // API averages
    const api = {};
    for (const [path, list] of apiTimings.entries()) {
      const durations = list.map(item => item.duration);
      const sum = durations.reduce((a, b) => a + b, 0);
      const errors = list.filter(item => item.status === 0 || item.status >= 400).length;
      api[path] = {
        count: list.length,
        avgMs: Math.round(sum / list.length),
        maxMs: Math.round(Math.max(...durations)),
        errors
      };
    }

    // Interaction averages
    const interactions = {};
    for (const [label, list] of interactionTimings.entries()) {
      const sum = list.reduce((a, b) => a + b, 0);
      interactions[label] = {
        count: list.length,
        avgMs: Math.round(sum / list.length),
        maxMs: Math.round(Math.max(...list))
      };
    }

    // Memory stats
    let initialHeap = memorySnapshots[0]?.heapSize || 0;
    let currentHeap = memorySnapshots[memorySnapshots.length - 1]?.heapSize || 0;
    let growth = currentHeap - initialHeap;

    return {
      frame: this.getFrameStats(),
      renders,
      api,
      interactions,
      localStorage: {
        readCount: localStorageReadCount,
        writeCount: localStorageWriteCount,
        readAvgMs: localStorageReadCount > 0 ? parseFloat((localStorageReadTotalMs / localStorageReadCount).toFixed(2)) : 0,
        writeAvgMs: localStorageWriteCount > 0 ? parseFloat((localStorageWriteTotalMs / localStorageWriteCount).toFixed(2)) : 0
      },
      memory: {
        supported: !!performance.memory,
        usedJSHeapSize: currentHeap,
        totalJSHeapSize: performance.memory?.totalJSHeapSize || 0,
        jsHeapSizeLimit: performance.memory?.jsHeapSizeLimit || 0,
        growthBytes: growth,
        snapshots: [...memorySnapshots]
      },
      milestones: {
        domContentLoaded: milestones.domContentLoaded,
        catsFetched: milestones.catsFetched,
        sidebarRendered: milestones.sidebarRendered,
        dashboardReady: milestones.dashboardReady
      }
    };
  },

  reset() {
    measurements.clear();
    apiTimings.clear();
    interactionTimings.clear();
    memorySnapshots.length = 0;
    frameDrops = 0;
    majorDrops = 0;
    frameCount = 0;
    fpsHistory = [];
    localStorageReadCount = 0;
    localStorageWriteCount = 0;
    localStorageReadTotalMs = 0;
    localStorageWriteTotalMs = 0;
    lastFrameTime = 0;
  }
};

// Make perf globally visible to let api.js fetch wrapper record metrics easily
window.perf = perf;
}

