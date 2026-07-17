// Core Performance Monitor Module for Dr. CAT
// Measures client-side frame drops, rendering, interaction, memory, and local storage I/O

const _isAndroidPerfSafeMode = false;

const THRESHOLDS = {
  fps: { good: 55, warn: 40 },
  render: { good: 50, warn: 150 },
  apiLocal: { good: 100, warn: 300 },
  apiRemote: { good: 400, warn: 1000 },
  interaction: { good: 100, warn: 250 },
  dbWrite: { good: 100, warn: 500 }
};

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

// Telemetry Event Log Buffer
const perfLogBuffer = [];
const MAX_PERF_LOGS = 50;

function addPerfLog(msg) {
  const time = new Date().toLocaleTimeString('fr-FR', { hour12: false });
  perfLogBuffer.push({ time, message: msg });
  if (perfLogBuffer.length > MAX_PERF_LOGS) {
    perfLogBuffer.shift();
  }
  window.dispatchEvent(new CustomEvent('drcat-perf-log-added'));
}

function getPerfLogs() {
  return [...perfLogBuffer];
}

function clearPerfLogs() {
  perfLogBuffer.length = 0;
  window.dispatchEvent(new CustomEvent('drcat-perf-log-added'));
}

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

// Setup milestone for DOMContentLoaded (only if not in safe mode)
if (!_isAndroidPerfSafeMode) {
  if (document.readyState === 'interactive' || document.readyState === 'complete') {
    milestones.domContentLoaded = performance.now();
  } else {
    window.addEventListener('DOMContentLoaded', () => {
      milestones.domContentLoaded = performance.now();
    });
  }
}

// Wrap localStorage if not in safe mode
if (!_isAndroidPerfSafeMode) {
  try {
    const originalGetItem = Storage.prototype.getItem;
    Storage.prototype.getItem = function(key) {
      const start = performance.now();
      const val = originalGetItem.call(this, key);
      const dur = performance.now() - start;
      if (this === localStorage) {
        localStorageReadCount++;
        localStorageReadTotalMs += dur;
      }
      return val;
    };

    const originalSetItem = Storage.prototype.setItem;
    Storage.prototype.setItem = function(key, value) {
      const start = performance.now();
      originalSetItem.call(this, key, value);
      const dur = performance.now() - start;
      if (this === localStorage) {
        localStorageWriteCount++;
        localStorageWriteTotalMs += dur;
      }
    };
  } catch (err) {
    console.warn('[Perf] LocalStorage interception disabled:', err.message);
  }
}

let memoryIntervalId = null;
function startMemorySnapshotLoop() {
  if (_isAndroidPerfSafeMode) return;
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
  
  recordMemory();
  memoryIntervalId = setInterval(recordMemory, 10000); // Check memory every 10s
}

// We export the perf object. If in safe mode, we use noops.
export const perf = _isAndroidPerfSafeMode ? {
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
} : {
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
    milestones[name] = performance.now();
    addPerfLog(`[Milestone] ${name} reached at +${Math.round(milestones[name])}ms`);
  },

  recordApiCall(url, status, durationMs) {
    let cleanUrl = url;
    try {
      const parsed = new URL(url, window.location.origin);
      cleanUrl = parsed.pathname;
    } catch (_) {}

    if (!apiTimings.has(cleanUrl)) {
      apiTimings.set(cleanUrl, []);
    }
    const list = apiTimings.get(cleanUrl);
    list.push({ duration: durationMs, status });
    if (list.length > 50) list.shift();

    addPerfLog(`[API] ${cleanUrl} -> ${status} (${Math.round(durationMs)}ms)`);
  },

  recordInteraction(type) {
    this.startMeasure(`interaction.${type}`);
    
    // Auto-resolve interactions after render finishes via requestAnimationFrame
    requestAnimationFrame(() => {
      requestAnimationFrame(() => {
        const name = `interaction.${type}`;
        const m = measurements.get(name);
        if (m) {
          m.end = performance.now();
          const duration = m.end - m.start;
          
          if (!interactionTimings.has(type)) {
            interactionTimings.set(type, []);
          }
          const list = interactionTimings.get(type);
          list.push(duration);
          if (list.length > 50) list.shift();
          measurements.delete(name);

          addPerfLog(`[Interaction] ${type} finished in ${Math.round(duration)}ms`);
        }
      });
    });
  },

  startFrameMonitor() {
    if (isFrameMonitoring) return;
    isFrameMonitoring = true;
    lastFrameTime = performance.now();
    frameCount = 0;
    frameDrops = 0;
    majorDrops = 0;
    fpsHistory = [];
    
    startMemorySnapshotLoop();

    const monitor = (time) => {
      if (!isFrameMonitoring) return;
      
      const delta = time - lastFrameTime;
      lastFrameTime = time;
      frameCount++;

      // A frame taking longer than 33.3ms (less than 30fps) is a frame drop/jank
      if (delta > 33.3) {
        frameDrops++;
        if (delta > 100) { // Severe lag (>100ms)
          majorDrops++;
        }
      }

      fpsHistory.push(delta);
      if (fpsHistory.length > 60) fpsHistory.shift();

      requestAnimationFrame(monitor);
    };

    requestAnimationFrame(monitor);
  },

  stopFrameMonitor() {
    isFrameMonitoring = false;
    if (memoryIntervalId) {
      clearInterval(memoryIntervalId);
      memoryIntervalId = null;
    }
  },

  getFrameStats() {
    if (fpsHistory.length === 0) return { fps: 60, jankRate: 0, drops: 0, major: 0, totalFrames: 0 };
    
    const avgFrameTime = fpsHistory.reduce((a, b) => a + b, 0) / fpsHistory.length;
    const computedFps = Math.min(60, Math.round(1000 / avgFrameTime));
    
    return {
      fps: computedFps,
      jankRate: frameCount > 0 ? frameDrops / frameCount : 0,
      drops: frameDrops,
      major: majorDrops,
      totalFrames: frameCount
    };
  },

  getMetrics() {
    const renders = {};
    for (const [name, data] of measurements.entries()) {
      renders[name] = Math.round(data.duration || 0);
    }

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

    const interactions = {};
    for (const [label, list] of interactionTimings.entries()) {
      const sum = list.reduce((a, b) => a + b, 0);
      interactions[label] = {
        count: list.length,
        avgMs: Math.round(sum / list.length),
        maxMs: Math.round(Math.max(...list))
      };
    }

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
    clearPerfLogs();
  },

  getPerfLogs() {
    return getPerfLogs();
  },

  clearPerfLogs() {
    clearPerfLogs();
  }
};

window.perf = perf;

// Auto-record interaction latency for all user click events globally
if (typeof document !== 'undefined') {
  document.addEventListener('click', (e) => {
    const target = e.target;
    if (!target) return;
    
    // Find nearest clickable container (button, link, list item, filter pill, select option, etc.)
    const clickable = target.closest('button, a, li, .status-pill, input, select, [role="button"]') || target;
    const label = clickable.id ? `#${clickable.id}` : (clickable.className && typeof clickable.className === 'string') ? `.${clickable.className.split(' ')[0]}` : clickable.tagName.toLowerCase();
    
    perf.recordInteraction(`click:${label}`);
  }, { passive: true });
}
