/**
 * Performance Monitor Composable
 * Port of public/js/performance.js to Vue 3 Composition API
 */

import { ref, reactive, onMounted, onUnmounted, type Ref } from 'vue'

const _isAndroidPerfSafeMode = false

const THRESHOLDS = {
  fps: { good: 55, warn: 40 },
  render: { good: 50, warn: 150 },
  apiLocal: { good: 100, warn: 300 },
  apiRemote: { good: 400, warn: 1000 },
  interaction: { good: 100, warn: 250 },
  dbWrite: { good: 100, warn: 500 }
}

// Internal states
const measurements = new Map<string, { start: number; end?: number; duration?: number }>()
const apiTimings = new Map<string, Array<{ duration: number; status: number }>>()
const interactionTimings = new Map<string, number[]>()
const memorySnapshots: Array<{ time: string; heapSize: number }> = []

const milestones = reactive({
  domContentLoaded: null as number | null,
  catsFetched: null as number | null,
  sidebarRendered: null as number | null,
  dashboardReady: null as number | null
})

const perfLogBuffer: Array<{ time: string; message: string }> = []
const MAX_PERF_LOGS = 50

function addPerfLog(msg: string) {
  const time = new Date().toLocaleTimeString('fr-FR', { hour12: false })
  perfLogBuffer.push({ time, message: msg })
  if (perfLogBuffer.length > MAX_PERF_LOGS) {
    perfLogBuffer.shift()
  }
  window.dispatchEvent(new CustomEvent('drcat-perf-log-added'))
}

export function getPerfLogs() {
  return [...perfLogBuffer]
}

export function clearPerfLogs() {
  perfLogBuffer.length = 0
  window.dispatchEvent(new CustomEvent('drcat-perf-log-added'))
}

// Frame monitor state
let isFrameMonitoring = false
let lastFrameTime = 0
let frameDrops = 0
let majorDrops = 0
let frameCount = 0
let fpsHistory: number[] = []

// LocalStorage wrap timings
let localStorageReadCount = 0
let localStorageWriteCount = 0
let localStorageReadTotalMs = 0
let localStorageWriteTotalMs = 0

let memoryIntervalId: ReturnType<typeof setInterval> | null = null

// Expose reactive state for UI
export const perfLogs = ref<typeof perfLogBuffer>([])
export const perfMetrics = reactive({
  frame: { fps: 60, jankRate: 0, drops: 0, major: 0, totalFrames: 0 },
  renders: {} as Record<string, number>,
  api: {} as Record<string, { count: number; avgMs: number; maxMs: number; errors: number }>,
  interactions: {} as Record<string, { count: number; avgMs: number; maxMs: number }>,
  localStorage: { readCount: 0, writeCount: 0, readAvgMs: 0, writeAvgMs: 0 },
  memory: { supported: false, usedJSHeapSize: 0, totalJSHeapSize: 0, jsHeapSizeLimit: 0, growthBytes: 0, snapshots: [] as any[] },
  milestones: { ...milestones }
})

export function startMeasure(name: string) {
  measurements.set(name, { start: performance.now() })
}

export function endMeasure(name: string) {
  const m = measurements.get(name)
  if (m) {
    m.end = performance.now()
    m.duration = m.end - m.start
  }
}

export function recordMilestone(name: keyof typeof milestones) {
  milestones[name] = performance.now()
  addPerfLog(`[Milestone] ${name} reached at +${Math.round(milestones[name]!)}ms`)
}

export function recordApiCall(url: string, status: number, durationMs: number) {
  let cleanUrl = url
  try {
    const parsed = new URL(url, window.location.origin)
    cleanUrl = parsed.pathname
  } catch (_) {}

  if (!apiTimings.has(cleanUrl)) {
    apiTimings.set(cleanUrl, [])
  }
  const list = apiTimings.get(cleanUrl)!
  list.push({ duration: durationMs, status })
  if (list.length > 50) list.shift()

  addPerfLog(`[API] ${cleanUrl} -> ${status} (${Math.round(durationMs)}ms)`)
}

export function recordInteraction(type: string) {
  startMeasure(`interaction.${type}`)
  
  requestAnimationFrame(() => {
    requestAnimationFrame(() => {
      const name = `interaction.${type}`
      const m = measurements.get(name)
      if (m) {
        m.end = performance.now()
        const duration = m.end - m.start
        
        if (!interactionTimings.has(type)) {
          interactionTimings.set(type, [])
        }
        const list = interactionTimings.get(type)!
        list.push(duration)
        if (list.length > 50) list.shift()
        measurements.delete(name)

        addPerfLog(`[Interaction] ${type} finished in ${Math.round(duration)}ms`)
      }
    })
  })
}

export function startFrameMonitor() {
  if (isFrameMonitoring) return
  isFrameMonitoring = true
  lastFrameTime = performance.now()
  frameCount = 0
  frameDrops = 0
  majorDrops = 0
  fpsHistory = []
  
  startMemorySnapshotLoop()

  const monitor = (time: number) => {
    if (!isFrameMonitoring) return
    
    const delta = time - lastFrameTime
    lastFrameTime = time
    frameCount++

    if (delta > 33.3) {
      frameDrops++
      if (delta > 100) {
        majorDrops++
      }
    }

    fpsHistory.push(delta)
    if (fpsHistory.length > 60) fpsHistory.shift()

    requestAnimationFrame(monitor)
  }

  requestAnimationFrame(monitor)
}

export function stopFrameMonitor() {
  isFrameMonitoring = false
  if (memoryIntervalId) {
    clearInterval(memoryIntervalId)
    memoryIntervalId = null
  }
}

function getFrameStats() {
  if (fpsHistory.length === 0) return { fps: 60, jankRate: 0, drops: 0, major: 0, totalFrames: 0 }
  
  const avgFrameTime = fpsHistory.reduce((a, b) => a + b, 0) / fpsHistory.length
  const computedFps = Math.min(60, Math.round(1000 / avgFrameTime))
  
  return {
    fps: computedFps,
    jankRate: frameCount > 0 ? frameDrops / frameCount : 0,
    drops: frameDrops,
    major: majorDrops,
    totalFrames: frameCount
  }
}

function startMemorySnapshotLoop() {
  if (_isAndroidPerfSafeMode) return
  if (memoryIntervalId) clearInterval(memoryIntervalId)
  
  const recordMemory = () => {
    try {
      if (performance.memory && performance.memory.usedJSHeapSize) {
        memorySnapshots.push({
          time: new Date().toLocaleTimeString('fr-FR'),
          heapSize: performance.memory.usedJSHeapSize
        })
        if (memorySnapshots.length > 20) {
          memorySnapshots.shift()
        }
      }
    } catch (_) {
      // performance.memory may throw/ be unsupported on this browser
    }
  }
  
  recordMemory()
  memoryIntervalId = setInterval(recordMemory, 10000)
}

function updateMetrics() {
  const renders: Record<string, number> = {}
  for (const [name, data] of measurements.entries()) {
    renders[name] = Math.round(data.duration || 0)
  }

  const api: Record<string, { count: number; avgMs: number; maxMs: number; errors: number }> = {}
  for (const [path, list] of apiTimings.entries()) {
    const durations = list.map(item => item.duration)
    const sum = durations.reduce((a, b) => a + b, 0)
    const errors = list.filter(item => item.status === 0 || item.status >= 400).length
    api[path] = {
      count: list.length,
      avgMs: Math.round(sum / list.length),
      maxMs: Math.round(Math.max(...durations)),
      errors
    }
  }

  const interactions: Record<string, { count: number; avgMs: number; maxMs: number }> = {}
  for (const [label, list] of interactionTimings.entries()) {
    const sum = list.reduce((a, b) => a + b, 0)
    interactions[label] = {
      count: list.length,
      avgMs: Math.round(sum / list.length),
      maxMs: Math.round(Math.max(...list))
    }
  }

  let initialHeap = memorySnapshots[0]?.heapSize || 0
  let currentHeap = memorySnapshots[memorySnapshots.length - 1]?.heapSize || 0
  let growth = currentHeap - initialHeap

  perfMetrics.frame = getFrameStats()
  perfMetrics.renders = renders
  perfMetrics.api = api
  perfMetrics.interactions = interactions
  perfMetrics.localStorage = {
    readCount: localStorageReadCount,
    writeCount: localStorageWriteCount,
    readAvgMs: localStorageReadCount > 0 ? parseFloat((localStorageReadTotalMs / localStorageReadCount).toFixed(2)) : 0,
    writeAvgMs: localStorageWriteCount > 0 ? parseFloat((localStorageWriteTotalMs / localStorageWriteCount).toFixed(2)) : 0
  }
  perfMetrics.memory = {
    supported: !!performance.memory,
    usedJSHeapSize: currentHeap,
    totalJSHeapSize: performance.memory?.totalJSHeapSize || 0,
    jsHeapSizeLimit: performance.memory?.jsHeapSizeLimit || 0,
    growthBytes: growth,
    snapshots: [...memorySnapshots]
  }
  perfMetrics.milestones = { ...milestones }
}

export function resetPerf() {
  measurements.clear()
  apiTimings.clear()
  interactionTimings.clear()
  memorySnapshots.length = 0
  frameDrops = 0
  majorDrops = 0
  frameCount = 0
  fpsHistory = []
  localStorageReadCount = 0
  localStorageWriteCount = 0
  localStorageReadTotalMs = 0
  localStorageWriteTotalMs = 0
  lastFrameTime = 0
  clearPerfLogs()
  updateMetrics()
}

// Global click listener for interaction tracking
if (typeof document !== 'undefined') {
  document.addEventListener('click', (e: MouseEvent) => {
    const target = e.target
    if (!target) return
    
    const clickable = (target as HTMLElement).closest('button, a, li, .status-pill, input, select, [role="button"]') || target
    const label = (clickable as HTMLElement).id 
      ? `#${(clickable as HTMLElement).id}` 
      : (clickable as HTMLElement).className && typeof (clickable as HTMLElement).className === 'string' 
        ? `.${(clickable as HTMLElement).className.split(' ')[0]}` 
        : (clickable as HTMLElement).tagName.toLowerCase()
    
    recordInteraction(`click:${label}`)
  }, { passive: true })
}

// Auto-start frame monitor and update metrics periodically
let metricsInterval: ReturnType<typeof setInterval> | null = null

export function usePerformance() {
  onMounted(() => {
    startFrameMonitor()
    updateMetrics()
    metricsInterval = setInterval(updateMetrics, 1000)
  })

  onUnmounted(() => {
    stopFrameMonitor()
    if (metricsInterval) {
      clearInterval(metricsInterval)
      metricsInterval = null
    }
  })

  return {
    perfMetrics,
    perfLogs,
    THRESHOLDS,
    startMeasure,
    endMeasure,
    recordMilestone,
    recordApiCall,
    recordInteraction,
    startFrameMonitor,
    stopFrameMonitor,
    resetPerf,
    getPerfLogs,
    clearPerfLogs
  }
}
