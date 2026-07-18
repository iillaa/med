<script setup lang="ts">
import { ref, computed } from 'vue'
import { useAppStore } from '@/stores/app'
import { usePerformance } from '@/composables/usePerformance'
import { exportDataFile } from '@/composables/useDiagnostics'

const appStore = useAppStore()
const { perfMetrics, perfLogs, THRESHOLDS, resetPerf, getPerfLogs, clearPerfLogs } = usePerformance()

const showPerfLogs = ref(false)

function formatBytes(bytes: number): string {
  if (bytes === 0) return '0 Bytes'
  const k = 1024
  const dm = 2
  const sizes = ['Bytes', 'KB', 'MB', 'GB']
  const i = Math.floor(Math.log(bytes) / Math.log(k))
  return parseFloat((bytes / Math.pow(k, i)).toFixed(dm)) + ' ' + sizes[i]
}

function formatPercent(val: number): string {
  return `${Math.round(val)}%`
}

const fpsStatusText = computed(() => {
  const fps = perfMetrics.frame.fps
  if (fps >= THRESHOLDS.fps.good && perfMetrics.frame.jankRate < 0.03) return 'Fluide et stable ✅'
  if (fps < THRESHOLDS.fps.warn || perfMetrics.frame.jankRate > 0.08) return 'Ralentissements critiques 🔴'
  return 'Saccades légères ⚠️'
})

const fpsStatusStyle = computed(() => {
  const fps = perfMetrics.frame.fps
  if (fps >= THRESHOLDS.fps.good && perfMetrics.frame.jankRate < 0.03) return { background: 'rgba(16, 185, 129, 0.15)', color: '#a7f3d0' }
  if (fps < THRESHOLDS.fps.warn || perfMetrics.frame.jankRate > 0.08) return { background: 'rgba(239, 68, 68, 0.15)', color: '#fca5a5' }
  return { background: 'rgba(245, 158, 11, 0.15)', color: '#fde047' }
})

const renderMetricStyle = (ms: number | undefined) => {
  if (ms === undefined || ms === null) return { color: 'var(--text-muted)' }
  if (ms <= THRESHOLDS.render.good) return { color: 'var(--color-success)' }
  if (ms <= THRESHOLDS.render.warn) return { color: '#fbbf24' }
  return { color: '#f87171' }
}

const apiStyle = (item: { avgMs: number; count: number }) => {
  if (item.avgMs > THRESHOLDS.apiRemote.warn) return { color: '#f87171', fontWeight: 'bold' as const, badge: ' 🔴' }
  if (item.avgMs > THRESHOLDS.apiRemote.good) return { color: '#fbbf24', badge: ' ⚠️' }
  return { color: 'var(--text-primary)', badge: '' }
}

const interactionStyle = (item: { avgMs: number }) => {
  if (item.avgMs > THRESHOLDS.interaction.warn) return { color: '#f87171', fontWeight: 'bold' as const, badge: ' 🔴' }
  if (item.avgMs > THRESHOLDS.interaction.good) return { color: '#fbbf24', badge: ' ⚠️' }
  return { color: 'var(--text-primary)', badge: '' }
}

function onResetPerf(): void {
  resetPerf()
  appStore.showToast("Métriques de performance réinitialisées.", "fa-trash-can", 3000)
}

function onExportPerf(): void {
  const report = {
    appName: "Dr. CAT - Diagnostic & Performance Profile",
    timestamp: new Date().toISOString(),
    userAgent: navigator.userAgent,
    isOfflineApp: false,
    connectionAtExport: navigator.onLine ? "Online" : "Offline",
    performanceTimeline: perfMetrics,
    recentConsoleLogs: getPerfLogs()
  }

  const d = new Date()
  const timestampStr = `${d.getFullYear()}-${String(d.getMonth()+1).padStart(2,'0')}-${String(d.getDate()).padStart(2,'0')}-${String(d.getHours()).padStart(2,'0')}${String(d.getMinutes()).padStart(2,'0')}${String(d.getSeconds()).padStart(2,'0')}`
  exportDataFile(`drcat-performance-${timestampStr}.json`, "Rapport Performance", report)
  appStore.showToast("Rapport performance généré !", "fa-file-export", 4000)
}

function onCopyPerfLogs(): void {
  const logs = getPerfLogs()
  if (logs.length === 0) {
    appStore.showToast("Aucun log de performance à copier.", "fa-triangle-exclamation", 3000)
    return
  }
  const text = logs.map(l => `[${l.time}] ${l.message}`).join('\n')
  navigator.clipboard.writeText(text).then(() => {
    appStore.showToast("Logs de performance copiés !", "fa-copy", 3000)
  }).catch(() => {
    appStore.showToast("Échec de la copie automatique.", "fa-circle-xmark", 4000)
  })
}

function onClearPerfLogs(): void {
  clearPerfLogs()
  appStore.showToast("Logs de performance vidés.", "fa-trash", 3000)
}
</script>

<template>
  <div class="tab-content">
    <div style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 12px;">
      <h4 style="margin: 0; color: var(--color-primary); font-size: 14.5px; display: flex; align-items: center; gap: 8px;">
        <i class="fa-solid fa-gauge-high"></i> Tableau de Performance
      </h4>
      <div style="display: flex; gap: 6px;">
        <button class="cancel-btn" @click="onResetPerf" style="font-size: 11px; padding: 4px 8px;"><i class="fa-solid fa-trash"></i> Reset</button>
        <button class="action-btn" @click="onExportPerf" style="font-size: 11px; padding: 4px 8px;"><i class="fa-solid fa-file-export"></i> Export</button>
      </div>
    </div>
    <p style="margin: 0 0 12px 0; font-size: 13px; color: var(--text-secondary);">Mesure du framerate, temps de rendu des composants, latence réseau et snapshots mémoire.</p>

    <!-- FPS & Jank -->
    <div class="diag-card" style="margin-bottom: 12px;">
      <h4 style="font-size: 13.5px; border-bottom: 1px solid rgba(255,255,255,0.08); padding-bottom: 6px; margin-bottom: 8px; color: var(--text-primary);"><i class="fa-solid fa-film"></i> Taux de Rafraîchissement</h4>
      <div style="display: flex; flex-direction: column; gap: 6px; font-size: 12px; color: var(--text-muted);">
        <div>FPS Actuel : <span :style="{ fontWeight: 'bold', fontSize: '14px', color: perfMetrics.frame.fps >= THRESHOLDS.fps.good ? 'var(--color-success)' : perfMetrics.frame.fps >= THRESHOLDS.fps.warn ? '#fbbf24' : '#f87171' }">{{ perfMetrics.frame.fps }} FPS</span></div>
        <div>Saccades : <span :style="{ background: perfMetrics.frame.jankRate > 0.05 ? 'rgba(239,68,68,0.2)' : 'rgba(255,255,255,0.05)', color: perfMetrics.frame.jankRate > 0.05 ? '#f87171' : 'var(--text-muted)', padding: '2px 6px', borderRadius: '4px' }">{{ perfMetrics.frame.drops }} jank ({{ formatPercent(perfMetrics.frame.jankRate * 100) }})</span></div>
        <div>Saccades majeures (>100ms) : <span :style="{ background: perfMetrics.frame.major > 0 ? 'rgba(239,68,68,0.2)' : 'rgba(255,255,255,0.05)', color: perfMetrics.frame.major > 0 ? '#f87171' : 'var(--text-muted)', padding: '2px 6px', borderRadius: '4px' }">{{ perfMetrics.frame.major }}</span></div>
        <div>Stabilité globale : <span :style="fpsStatusStyle" style="padding: 4px; border-radius: 4px; font-weight: 500;">{{ fpsStatusText }}</span></div>
      </div>
    </div>

    <!-- Component Render Times -->
    <div class="diag-card" style="margin-bottom: 12px;">
      <h4 style="font-size: 13.5px; border-bottom: 1px solid rgba(255,255,255,0.08); padding-bottom: 6px; margin-bottom: 8px; color: var(--text-primary);"><i class="fa-solid fa-puzzle-piece"></i> Temps de Rendu des Composants</h4>
      <div style="display: flex; flex-direction: column; gap: 6px; font-size: 12px; color: var(--text-muted);">
        <div style="display: flex; justify-content: space-between;"><span>Sidebar.renderCatList</span><span :style="renderMetricStyle(perfMetrics.renders['sidebar.renderCatList'])">{{ perfMetrics.renders['sidebar.renderCatList']?.toFixed(1) ?? '--' }}ms</span></div>
        <div style="display: flex; justify-content: space-between;"><span>Workspace.selectCat</span><span :style="renderMetricStyle(perfMetrics.renders['workspace.selectCat'])">{{ perfMetrics.renders['workspace.selectCat']?.toFixed(1) ?? '--' }}ms</span></div>
        <div style="display: flex; justify-content: space-between;"><span>Dashboard.renderDashboard</span><span :style="renderMetricStyle(perfMetrics.renders['dashboard.renderDashboard'])">{{ perfMetrics.renders['dashboard.renderDashboard']?.toFixed(1) ?? '--' }}ms</span></div>
        <div style="display: flex; justify-content: space-between;"><span>Quiz.renderQuestion</span><span :style="renderMetricStyle(perfMetrics.renders['quiz.renderQuestion'])">{{ perfMetrics.renders['quiz.renderQuestion']?.toFixed(1) ?? '--' }}ms</span></div>
      </div>
    </div>

    <!-- API Timing -->
    <div class="diag-card" style="margin-bottom: 12px;">
      <h4 style="font-size: 13.5px; border-bottom: 1px solid rgba(255,255,255,0.08); padding-bottom: 6px; margin-bottom: 8px; color: var(--text-primary);"><i class="fa-solid fa-network-wired"></i> Latence Réseau (API)</h4>
      <div v-if="Object.keys(perfMetrics.api).length === 0" style="font-size: 12px; color: var(--text-muted); font-style: italic; padding: 8px 0;">Aucune requête API capturée.</div>
      <div v-for="(item, path) in perfMetrics.api" :key="path" style="display: flex; justify-content: space-between; border-bottom: 1px solid rgba(255,255,255,0.03); padding-bottom: 4px; font-size: 12px;">
        <span style="word-break: break-all; max-width: 70%;">{{ path }} ({{ item.count }})</span>
        <span :style="apiStyle(item)">{{ item.avgMs }}ms (max: {{ item.maxMs }}ms){{ apiStyle(item).badge }}</span>
      </div>
    </div>

    <!-- Interaction Latency -->
    <div class="diag-card" style="margin-bottom: 12px;">
      <h4 style="font-size: 13.5px; border-bottom: 1px solid rgba(255,255,255,0.08); padding-bottom: 6px; margin-bottom: 8px; color: var(--text-primary);"><i class="fa-solid fa-hand-pointer"></i> Latence des Interactions</h4>
      <div v-if="Object.keys(perfMetrics.interactions).length === 0" style="font-size: 12px; color: var(--text-muted); font-style: italic; padding: 8px 0;">Touchez des éléments pour mesurer...</div>
      <div v-for="(item, label) in perfMetrics.interactions" :key="label" style="display: flex; justify-content: space-between; border-bottom: 1px solid rgba(255,255,255,0.03); padding-bottom: 4px; font-size: 12px;">
        <span>{{ label }} ({{ item.count }})</span>
        <span :style="interactionStyle(item)">{{ item.avgMs }}ms (max: {{ item.maxMs }}ms){{ interactionStyle(item).badge }}</span>
      </div>
    </div>

    <!-- Memory & I/O -->
    <div class="diag-card" style="margin-bottom: 12px;">
      <h4 style="font-size: 13.5px; border-bottom: 1px solid rgba(255,255,255,0.08); padding-bottom: 6px; margin-bottom: 8px; color: var(--text-primary);"><i class="fa-solid fa-microchip"></i> Mémoire & I/O Local</h4>
      <div style="display: flex; flex-direction: column; gap: 6px; font-size: 12px; color: var(--text-muted);">
        <div>JS Heap : <span>{{ perfMetrics.memory.supported ? `${formatBytes(perfMetrics.memory.usedJSHeapSize)} / ${formatBytes(perfMetrics.memory.totalJSHeapSize)}` : 'N/A (WebView standard)' }}</span></div>
        <div>Croissance Heap : <span :style="{ color: perfMetrics.memory.growthBytes > 5 * 1024 * 1024 ? '#fbbf24' : 'var(--text-muted)' }">+{{ formatBytes(perfMetrics.memory.growthBytes) }}</span></div>
        <div>Lectures LocalStorage : <span>{{ perfMetrics.localStorage.readCount }} appels (moy: {{ perfMetrics.localStorage.readAvgMs }}ms)</span></div>
        <div>Écritures LocalStorage : <span :style="{ color: perfMetrics.localStorage.writeAvgMs > 10 ? '#fbbf24' : 'var(--text-muted)' }">{{ perfMetrics.localStorage.writeCount }} appels (moy: {{ perfMetrics.localStorage.writeAvgMs }}ms)</span></div>
      </div>
    </div>

    <!-- Performance Logs -->
    <div class="diag-card">
      <div style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 8px;">
        <h4 style="font-size: 13.5px; border-bottom: 1px solid rgba(255,255,255,0.08); padding-bottom: 6px; margin: 0; color: var(--text-primary);"><i class="fa-solid fa-list"></i> Logs de Performance</h4>
        <div style="display: flex; gap: 6px;">
          <button class="action-btn" @click="onCopyPerfLogs" style="font-size: 11px; padding: 4px 8px;"><i class="fa-solid fa-copy"></i> Copier</button>
          <button class="cancel-btn" @click="onClearPerfLogs" style="font-size: 11px; padding: 4px 8px;"><i class="fa-solid fa-trash"></i> Vider</button>
        </div>
      </div>
      <div id="perf-console-logs" style="background: rgba(0,0,0,0.3); border-radius: 6px; padding: 10px; max-height: 200px; overflow-y: auto; font-family: monospace; font-size: 11px; line-height: 1.5;">
        <div v-if="perfLogs.length === 0" style="color: var(--text-muted); font-style: italic;">
          En attente d'événements de performance...
        </div>
        <div v-for="(log, idx) in perfLogs" :key="idx" style="margin-bottom: 2px; border-bottom: 1px solid rgba(255,255,255,0.02); padding-bottom: 2px;">
          <span style="color: var(--text-muted);">[{{ log.time }}]</span> {{ log.message }}
        </div>
      </div>
    </div>
  </div>
</template>

<style scoped>
.diag-card {
  background: var(--color-surface);
  border: 1px solid var(--color-border);
  border-radius: 12px;
  padding: 14px 16px;
}
.diag-card h4 {
  font-size: 13.5px;
  font-weight: 600;
  margin: 0 0 10px 0;
  color: var(--text-primary);
}
</style>
