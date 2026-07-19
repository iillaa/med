import { state } from '../state.js';
import * as api from '../api.js';
import { perf } from '../performance.js';
import { formatBytes, formatDuration, formatPercent, getDiagnosticsLogs, showToast, exportDataFile, copyToClipboard } from '../utils.js';

let isOpen = false;
let renderIntervalId = null;

export function updatePerformanceButtonVisibility() {
  // Obsolete: tab header controls visibility inside Admin Control block
}

export function initPerformance() {
  const panel = document.getElementById('admin-pane-performance');
  if (!panel) return;

  // Start frame monitor immediately so it captures background usage and interactions
  perf.startFrameMonitor();

  // Listen to custom tab change event
  window.addEventListener('drcat-admin-tab-changed', (e) => {
    if (e.detail.activePaneId === 'admin-pane-performance') {
      expandPanel();
    } else if (isOpen) {
      collapsePanel();
    }
  });

  // Listen for performance log changes
  window.addEventListener('drcat-perf-log-added', renderPerfLogs);

  // Hook actions
  document.getElementById('reset-perf-btn')?.addEventListener('click', resetMetrics);
  document.getElementById('export-perf-btn')?.addEventListener('click', exportPerformanceReport);
  document.getElementById('copy-perf-logs-btn')?.addEventListener('click', copyPerformanceLogs);
  document.getElementById('clear-perf-logs-btn')?.addEventListener('click', clearPerformanceLogs);
}

function expandPanel() {
  const panel = document.getElementById('admin-pane-performance');
  if (!panel) return;

  isOpen = true;

  // Draw immediately and start the UI update interval
  renderPerformanceUI();
  renderPerfLogs();
  renderIntervalId = setInterval(() => {
    renderPerformanceUI();
  }, 1000);
}

function collapsePanel() {
  const panel = document.getElementById('admin-pane-performance');
  if (!panel) return;

  isOpen = false;

  // Keep the frame monitor running in the background! Just stop the UI update intervals.
  if (renderIntervalId) {
    clearInterval(renderIntervalId);
    renderIntervalId = null;
  }
}

async function renderPerformanceUI() {
  if (!isOpen) return;

  const data = perf.getMetrics();
  const T = perf.THRESHOLDS;

  // 1. Frame Rate (FPS) & Jank
  const fpsVal = document.getElementById('perf-fps-val');
  const dropsVal = document.getElementById('perf-drops-val');
  const majorDropsVal = document.getElementById('perf-major-drops-val');
  const fpsStatusMsg = document.getElementById('perf-fps-status-msg');

  if (fpsVal) {
    fpsVal.textContent = `${data.frame.fps} FPS`;
    if (data.frame.fps >= T.fps.good) {
      fpsVal.style.color = 'var(--color-success)';
    } else if (data.frame.fps >= T.fps.warn) {
      fpsVal.style.color = '#fbbf24'; // yellow
    } else {
      fpsVal.style.color = '#f87171'; // red
    }
  }

  if (dropsVal) {
    dropsVal.textContent = `${data.frame.drops} jank (${formatPercent(data.frame.jankRate)})`;
    dropsVal.style.background = data.frame.jankRate > 0.05 ? 'rgba(239, 68, 68, 0.2)' : 'rgba(255, 255, 255, 0.05)';
    dropsVal.style.color = data.frame.jankRate > 0.05 ? '#f87171' : 'var(--text-muted)';
  }

  if (majorDropsVal) {
    majorDropsVal.textContent = `${data.frame.major}`;
    majorDropsVal.style.background = data.frame.major > 0 ? 'rgba(239, 68, 68, 0.2)' : 'rgba(255, 255, 255, 0.05)';
    majorDropsVal.style.color = data.frame.major > 0 ? '#f87171' : 'var(--text-muted)';
  }

  if (fpsStatusMsg) {
    if (data.frame.fps >= T.fps.good && data.frame.jankRate < 0.03) {
      fpsStatusMsg.textContent = 'Fluide et stable ✅';
      fpsStatusMsg.style.background = 'rgba(16, 185, 129, 0.15)';
      fpsStatusMsg.style.color = '#a7f3d0';
    } else if (data.frame.fps < T.fps.warn || data.frame.jankRate > 0.08) {
      fpsStatusMsg.textContent = 'Ralentissements critiques 🔴';
      fpsStatusMsg.style.background = 'rgba(239, 68, 68, 0.15)';
      fpsStatusMsg.style.color = '#fca5a5';
    } else {
      fpsStatusMsg.textContent = 'Saccades légères ⚠️';
      fpsStatusMsg.style.background = 'rgba(245, 158, 11, 0.15)';
      fpsStatusMsg.style.color = '#fde047';
    }
  }

  // 2. Component Render Times
  renderComponentMetric('perf-render-sidebar', data.renders['sidebar.renderCatList'], T.render);
  renderComponentMetric('perf-render-workspace', data.renders['workspace.selectCat'], T.render);
  renderComponentMetric('perf-render-dashboard', data.renders['dashboard.renderDashboard'], T.render);
  renderComponentMetric('perf-render-quiz', data.renders['quiz.renderQuestion'], T.render);

  // 3. API Timing Latency List
  const apiList = document.getElementById('perf-api-list');
  if (apiList) {
    const paths = Object.keys(data.api);
    if (paths.length === 0) {
      apiList.innerHTML = '<span style="font-style: italic;">Aucune requête API capturée.</span>';
    } else {
      apiList.innerHTML = paths.map(path => {
        const item = data.api[path];
        const isRemote = !path.includes('localhost') && path.startsWith('http');
        const limit = isRemote ? T.apiRemote : T.apiLocal;
        let style = 'color: var(--text-primary);';
        let badge = '';

        if (item.avgMs > limit.warn) {
          style = 'color: #f87171; font-weight: bold;';
          badge = ' 🔴';
        } else if (item.avgMs > limit.good) {
          style = 'color: #fbbf24;';
          badge = ' ⚠️';
        }
        
        return `<div style="display: flex; justify-content: space-between; border-bottom: 1px solid rgba(255,255,255,0.03); padding-bottom: 4px;">
          <span style="word-break: break-all; max-width: 70%;">${path} (${item.count})</span>
          <span style="${style}">${item.avgMs}ms (max: ${item.maxMs}ms)${badge}</span>
        </div>`;
      }).join('');
    }
  }

  // 4. Interaction Latency List
  const interactionsList = document.getElementById('perf-interactions-list');
  if (interactionsList) {
    const labels = Object.keys(data.interactions);
    if (labels.length === 0) {
      interactionsList.innerHTML = '<span style="font-style: italic;">Touchez des éléments pour mesurer...</span>';
    } else {
      interactionsList.innerHTML = labels.map(label => {
        const item = data.interactions[label];
        let style = 'color: var(--text-primary);';
        let badge = '';

        if (item.avgMs > T.interaction.warn) {
          style = 'color: #f87171; font-weight: bold;';
          badge = ' 🔴';
        } else if (item.avgMs > T.interaction.good) {
          style = 'color: #fbbf24;';
          badge = ' ⚠️';
        }

        return `<div style="display: flex; justify-content: space-between; border-bottom: 1px solid rgba(255,255,255,0.03); padding-bottom: 4px;">
          <span>${label} (${item.count})</span>
          <span style="${style}">${item.avgMs}ms (max: ${item.maxMs}ms)${badge}</span>
        </div>`;
      }).join('');
    }
  }

  // 5. Local Memory & I/O
  const heapVal = document.getElementById('perf-heap-val');
  const heapGrowth = document.getElementById('perf-heap-growth');
  const ioReads = document.getElementById('perf-io-reads');
  const ioWrites = document.getElementById('perf-io-writes');

  if (heapVal) {
    heapVal.textContent = data.memory.supported 
      ? `${formatBytes(data.memory.usedJSHeapSize)} / ${formatBytes(data.memory.totalJSHeapSize)}`
      : 'N/A (WebView standard)';
  }

  if (heapGrowth && data.memory.supported) {
    const change = data.memory.growthBytes;
    const sign = change >= 0 ? '+' : '';
    heapGrowth.textContent = `${sign}${formatBytes(change)}`;
    if (change > 5 * 1024 * 1024) {
      heapGrowth.style.color = '#fbbf24'; // Warning if >5MB growth
    } else {
      heapGrowth.style.color = 'var(--text-muted)';
    }
  } else if (heapGrowth) {
    heapGrowth.textContent = '--';
  }

  if (ioReads) {
    ioReads.textContent = `${data.localStorage.readCount} appels (moy: ${data.localStorage.readAvgMs.toFixed(1)}ms)`;
  }
  if (ioWrites) {
    ioWrites.textContent = `${data.localStorage.writeCount} appels (moy: ${data.localStorage.writeAvgMs.toFixed(1)}ms)`;
    if (data.localStorage.writeAvgMs > 10) {
      ioWrites.style.color = '#fbbf24';
    } else {
      ioWrites.style.color = 'var(--text-muted)';
    }
  }

  // 6. Server Timing Statistics
  const serverUptime = document.getElementById('perf-server-uptime');
  const serverWrites = document.getElementById('perf-server-writes');
  const serverPdf = document.getElementById('perf-server-pdf');
  const serverCache = document.getElementById('perf-server-cache');

  if (!api.isOfflineApp) {
    try {
      const server = await api.fetchServerMetrics();
      
      const up = server.uptimeSeconds;
      const h = Math.floor(up / 3600);
      const m = Math.floor((up % 3600) / 60);
      if (serverUptime) serverUptime.textContent = `${h}h ${m}m`;

      if (serverWrites) {
        const writes = server.writeDurations;
        // Calculate averaged total across all phases that have data
        const phaseAvgs = [writes.backup.avgMs, writes.write.avgMs, writes.rename.avgMs].filter(v => v > 0);
        const totalAvg = phaseAvgs.length > 0 ? Math.round(phaseAvgs.reduce((a, b) => a + b, 0) / phaseAvgs.length) : 0;
        const totalMax = Math.max(writes.backup.maxMs, writes.write.maxMs, writes.rename.maxMs);
        serverWrites.textContent = `Moy: ${totalAvg}ms (max: ${totalMax}ms)`;
        if (totalAvg > T.dbWrite.good) {
          serverWrites.style.color = '#fbbf24';
        }
      }

      if (serverPdf) {
        serverPdf.textContent = server.pdfParse.totalFiles > 0 
          ? `${server.pdfParse.avgParseMs}ms / fichier (${server.pdfParse.totalFiles} analysés)`
          : 'Aucun scan requis';
      }

      if (serverCache) {
        serverCache.textContent = formatPercent(server.cacheHitRate);
      }
    } catch (err) {
      console.warn("Failed to fetch server performance metrics:", err);
    }
  } else {
    if (serverUptime) serverUptime.textContent = 'N/A (Standalone Client)';
    if (serverWrites) serverWrites.textContent = 'N/A';
    if (serverPdf) serverPdf.textContent = 'N/A';
    if (serverCache) serverCache.textContent = '100% (Assets locaux)';
  }

  // 7. Boot Milestones Render
  renderMilestoneEl('milestone-dom', data.milestones.domContentLoaded);
  renderMilestoneEl('milestone-cats', data.milestones.catsFetched);
  renderMilestoneEl('milestone-sidebar', data.milestones.sidebarRendered);
  renderMilestoneEl('milestone-dashboard', data.milestones.dashboardReady);
}

function renderComponentMetric(elementId, ms, limits) {
  const el = document.getElementById(elementId);
  if (!el) return;

  if (ms === undefined || ms === null) {
    el.textContent = '--';
    el.style.color = 'var(--text-muted)';
    return;
  }

  el.textContent = `${ms.toFixed(1)}ms`;
  if (ms <= limits.good) {
    el.style.color = 'var(--color-success)';
  } else if (ms <= limits.warn) {
    el.style.color = '#fbbf24';
    el.textContent += ' ⚠️';
  } else {
    el.style.color = '#f87171';
    el.textContent += ' 🔴';
  }
}

function renderMilestoneEl(elementId, val) {
  const el = document.getElementById(elementId);
  if (!el) return;

  if (val === null || val === undefined) {
    el.textContent = '--';
  } else {
    el.textContent = `${(val / 1000).toFixed(2)}s`;
  }
}

function resetMetrics() {
  perf.reset();
  renderPerformanceUI();
  showToast("Métriques de performance réinitialisées.", "fa-trash-can", 3000);
}

async function exportPerformanceReport() {
  showToast("Génération du rapport en cours...", "fa-spinner fa-spin", 2000);

  const clientMetrics = perf.getMetrics();
  let serverMetrics = {};

  if (!api.isOfflineApp) {
    try {
      serverMetrics = await api.fetchServerMetrics();
    } catch (_) {}
  }

  const report = {
    appName: "Dr. CAT - Diagnostic & Performance Profile",
    timestamp: new Date().toISOString(),
    userAgent: navigator.userAgent,
    isOfflineApp: api.isOfflineApp,
    connectionAtExport: navigator.onLine ? "Online" : "Offline",
    performanceTimeline: clientMetrics,
    serverPerformanceTimeline: serverMetrics,
    recentConsoleLogs: getDiagnosticsLogs()
  };

  const d = new Date();
  const timestampStr = `${d.getFullYear()}-${String(d.getMonth()+1).padStart(2,'0')}-${String(d.getDate()).padStart(2,'0')}-${String(d.getHours()).padStart(2,'0')}${String(d.getMinutes()).padStart(2,'0')}${String(d.getSeconds()).padStart(2,'0')}`;
  const fileName = `drcat-performance-${timestampStr}.json`;

  exportDataFile(fileName, "Rapport Performance", report);
  showToast("Rapport performance généré !", "fa-file-export", 4000);
}

function renderPerfLogs() {
  const container = document.getElementById('perf-console-logs');
  if (!container) return;

  const logs = perf.getPerfLogs();
  if (logs.length === 0) {
    container.innerHTML = '<span style="font-style: italic; color: var(--text-muted);">En attente d\'événements de performance...</span>';
    return;
  }

  container.innerHTML = logs.map(l => {
    return `<div style="margin-bottom: 2px; border-bottom: 1px solid rgba(255,255,255,0.02); padding-bottom: 2px;">
      <span style="color: var(--text-muted); font-size: 9px;">[${l.time}]</span> ${l.message}
    </div>`;
  }).join('');

  // Auto-scroll to bottom without forced reflow
  requestAnimationFrame(() => {
    container.scrollTop = container.scrollHeight;
  });
}

function copyPerformanceLogs() {
  const logs = perf.getPerfLogs();
  if (logs.length === 0) {
    showToast("Aucun log de performance à copier.", "fa-triangle-exclamation", 3000);
    return;
  }
  const text = logs.map(l => `[${l.time}] ${l.message}`).join('\n');
  copyToClipboard(text).then(() => {
    showToast("Logs de performance copiés !", "fa-copy", 3000);
  });
}

function clearPerformanceLogs() {
  perf.clearPerfLogs();
  showToast("Logs de performance vidés.", "fa-trash", 3000);
}
