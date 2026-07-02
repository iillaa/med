import { state } from '../state.js';
import * as api from '../api.js';
import { formatBytes, copyToClipboard, captureConsoleWarnings, getDiagnosticsLogs, clearDiagnosticsLogs, showToast, exportDataFile } from '../utils.js';

let isOpen = false;
let updateIntervalId = null;

export function updateDiagnosticsButtonVisibility() {
  const toggleBtn = document.getElementById('toggle-diagnostics-btn');
  if (!toggleBtn) return;
  toggleBtn.style.display = state.isAdmin ? 'inline-flex' : 'none';
}

export function initDiagnostics() {
  const toggleBtn = document.getElementById('toggle-diagnostics-btn');
  const closeBtn = document.getElementById('close-diagnostics-btn');
  const panel = document.getElementById('admin-diagnostics-panel');
  
  if (!toggleBtn || !panel) return;

  updateDiagnosticsButtonVisibility();

  // Toggle button click listener
  toggleBtn.addEventListener('click', () => {
    if (isOpen) {
      collapsePanel();
    } else {
      expandPanel();
    }
  });

  // Close button inside panel click listener
  if (closeBtn) {
    closeBtn.addEventListener('click', collapsePanel);
  }

  // Listen to CustomEvent for new console log added
  window.addEventListener('drcat-log-added', renderLogs);

  // Wire up action buttons
  document.getElementById('run-conn-test-btn')?.addEventListener('click', runConnectivityTest);
  document.getElementById('check-ngrok-btn')?.addEventListener('click', checkNgrokTunnel);
  document.getElementById('save-remote-url-btn')?.addEventListener('click', saveRemoteServerUrl);
  document.getElementById('copy-logs-btn')?.addEventListener('click', copyTerminalLogs);
  document.getElementById('clear-logs-btn')?.addEventListener('click', clearTerminalLogs);
  document.getElementById('run-auto-checkup-btn')?.addEventListener('click', runAutoCheckupSuite);
}

function expandPanel() {
  const panel = document.getElementById('admin-diagnostics-panel');
  if (!panel) return;

  isOpen = true;
  panel.style.display = 'block';
  
  // Start capturing console warnings/errors
  captureConsoleWarnings(true);
  
  // Refresh data immediately
  refreshDiagnosticsData();
  
  // Set up periodic update interval (every 10 seconds)
  updateIntervalId = setInterval(refreshDiagnosticsData, 10000);
  
  renderLogs();
  
  // Scroll to panel
  panel.scrollIntoView({ behavior: 'smooth', block: 'start' });
}

function collapsePanel() {
  const panel = document.getElementById('admin-diagnostics-panel');
  if (!panel) return;

  isOpen = false;
  panel.style.display = 'none';
  
  // Stop capturing console warnings/errors
  captureConsoleWarnings(false);
  
  // Clear update interval
  if (updateIntervalId) {
    clearInterval(updateIntervalId);
    updateIntervalId = null;
  }
}

async function refreshDiagnosticsData() {
  if (!isOpen) return;

  // Refresh connection statuses
  const onlineSpan = document.getElementById('diag-navigator-online');
  if (onlineSpan) {
    const isOnline = navigator.onLine;
    onlineSpan.textContent = isOnline ? 'En ligne' : 'Hors-ligne';
    onlineSpan.className = isOnline ? 'badge badge-success' : 'badge badge-danger';
    onlineSpan.style.background = isOnline ? 'rgba(16, 185, 129, 0.2)' : 'rgba(239, 68, 68, 0.2)';
    onlineSpan.style.color = isOnline ? 'var(--color-success)' : '#f87171';
    onlineSpan.style.padding = '2px 6px';
    onlineSpan.style.borderRadius = '4px';
  }

  const modeSpan = document.getElementById('diag-app-mode');
  if (modeSpan) {
    const isOfflineApp = api.isOfflineApp;
    modeSpan.textContent = isOfflineApp ? 'Application Autonome (Capacitor)' : 'Serveur Web (Node)';
    modeSpan.className = 'badge badge-info';
    modeSpan.style.background = 'rgba(6, 182, 212, 0.2)';
    modeSpan.style.color = 'var(--color-primary)';
    modeSpan.style.padding = '2px 6px';
    modeSpan.style.borderRadius = '4px';
  }

  const tokenSpan = document.getElementById('diag-admin-token');
  if (tokenSpan) {
    const hasToken = !!localStorage.getItem('dr_cat_admin_token');
    tokenSpan.textContent = hasToken ? 'Présent & Actif' : 'Absent';
    tokenSpan.style.background = hasToken ? 'rgba(16, 185, 129, 0.2)' : 'rgba(239, 68, 68, 0.2)';
    tokenSpan.style.color = hasToken ? 'var(--color-success)' : '#f87171';
    tokenSpan.style.padding = '2px 6px';
    tokenSpan.style.borderRadius = '4px';
  }

  const configuredRemoteUrl = localStorage.getItem('dr_cat_remote_server_url') || api.REMOTE_SERVER_URL || '';
  const remoteUrlSpan = document.getElementById('diag-remote-url');
  if (remoteUrlSpan) {
    remoteUrlSpan.textContent = configuredRemoteUrl || '(Aucun)';
    remoteUrlSpan.style.color = configuredRemoteUrl ? 'var(--text-primary)' : 'var(--text-muted)';
  }

  const remoteInput = document.getElementById('diag-remote-url-input');
  if (remoteInput && !remoteInput.value && configuredRemoteUrl) {
    remoteInput.value = configuredRemoteUrl;
  }

  // Fetch Server-side Diagnostics
  if (!api.isOfflineApp || api.hasRemoteServer()) {
    try {
      const system = await api.fetchDiagnosticsSystem();
      document.getElementById('diag-node-version').textContent = system.nodeVersion || '--';
      document.getElementById('diag-server-os').textContent = `${system.platform} / ${system.arch}` || '--';
      
      // Calculate uptime readable string
      const up = system.uptimeSeconds;
      const h = Math.floor(up / 3600);
      const m = Math.floor((up % 3600) / 60);
      document.getElementById('diag-server-uptime').textContent = `${h}h ${m}m` || '--';

      const memUsage = system.memoryUsage ? formatBytes(system.memoryUsage.rss) : '--';
      document.getElementById('diag-server-mem').textContent = memUsage;

      const idxSpan = document.getElementById('diag-indexing-active');
      if (idxSpan) {
        const isIndexing = system.indexingActive;
        idxSpan.textContent = isIndexing ? 'Indexation en cours...' : 'Inactif';
        idxSpan.style.background = isIndexing ? 'rgba(245, 158, 11, 0.2)' : 'rgba(16, 185, 129, 0.2)';
        idxSpan.style.color = isIndexing ? '#fbbf24' : 'var(--color-success)';
        idxSpan.style.padding = '2px 6px';
        idxSpan.style.borderRadius = '4px';
      }
    } catch (err) {
      console.warn("Failed to fetch server diagnostics:", err);
    }

    try {
      const stats = await api.fetchDiagnosticsDbStats();
      document.getElementById('diag-db-cats').textContent = `${stats.totalCats} (${stats.coreCats} base, ${stats.customCats} perso)`;
      document.getElementById('diag-db-sugs').textContent = `${stats.totalSuggestions} en attente`;
      document.getElementById('diag-db-size-cats').textContent = formatBytes(stats.catsDbSize);
      document.getElementById('diag-db-size-sugs').textContent = formatBytes(stats.suggestionsSize);
      document.getElementById('diag-db-size-index').textContent = formatBytes(stats.indexSize);
    } catch (err) {
      console.warn("Failed to fetch database diagnostics stats:", err);
    }

    try {
      const indexDetail = await api.fetchDiagnosticsIndexDetail();
      document.getElementById('diag-pdf-docs').textContent = indexDetail.totalDocs || '0';
      document.getElementById('diag-pdf-pages').textContent = indexDetail.totalPages ? Number(indexDetail.totalPages).toLocaleString() : '0';
      
      const idxTime = indexDetail.indexedAt ? new Date(indexDetail.indexedAt).toLocaleString('fr-FR') : '--';
      document.getElementById('diag-pdf-time').textContent = idxTime;

      // Render health icons
      const healthSpan = document.getElementById('diag-pdf-health');
      if (healthSpan && indexDetail.docs) {
        let green = 0, orange = 0, red = 0;
        indexDetail.docs.forEach(doc => {
          if (doc.status === 'green') green++;
          else if (doc.status === 'orange') orange++;
          else red++;
        });

        healthSpan.innerHTML = `
          <div style="display: flex; gap: 12px; margin-top: 4px;">
            <span style="color: var(--color-success);"><i class="fa-solid fa-circle-check"></i> ${green} sains</span>
            <span style="color: #fbbf24;"><i class="fa-solid fa-circle-exclamation"></i> ${orange} partiels</span>
            <span style="color: #f87171;"><i class="fa-solid fa-triangle-exclamation"></i> ${red} vides</span>
          </div>
        `;
      }
    } catch (err) {
      console.warn("Failed to fetch index details stats:", err);
    }
  } else {
    // Offline / Standalone Capacitor mode displays
    document.getElementById('diag-node-version').textContent = 'N/A (WebView)';
    document.getElementById('diag-server-os').textContent = 'Android native client';
    document.getElementById('diag-server-uptime').textContent = 'N/A';
    document.getElementById('diag-server-mem').textContent = 'N/A';
    
    const idxSpan = document.getElementById('diag-indexing-active');
    if (idxSpan) {
      idxSpan.textContent = 'Inactif (Caché)';
      idxSpan.style.background = 'rgba(255,255,255,0.05)';
      idxSpan.style.color = 'var(--text-muted)';
    }

    // Display local storage database length counts
    const localCats = JSON.parse(localStorage.getItem('dr_cat_user_cats') || '[]');
    document.getElementById('diag-db-cats').textContent = `${localCats.length + 55} (55 base, ${localCats.length} perso)`;
    document.getElementById('diag-db-sugs').textContent = 'Envoi direct au serveur';
    document.getElementById('diag-db-size-cats').textContent = formatBytes(localStorage.getItem('dr_cat_user_cats')?.length || 0);
    document.getElementById('diag-db-size-sugs').textContent = '0 B (N/A)';
    document.getElementById('diag-db-size-index').textContent = 'Bundled local asset';
  }
}

async function runConnectivityTest() {
  const container = document.getElementById('conn-test-results');
  if (!container) return;

  container.style.display = 'flex';
  
  const stepLocal = document.getElementById('test-step-local');
  const stepRemote = document.getElementById('test-step-remote');
  const stepWan = document.getElementById('test-step-wan');
  const analysisDiv = document.getElementById('diag-auto-analysis');

  if (stepLocal) stepLocal.innerHTML = '1. Local (localhost:3000) : <span style="color: #fbbf24;"><i class="fa-solid fa-spinner fa-spin"></i> Ping...</span>';
  if (stepRemote) stepRemote.innerHTML = '2. Distant (ngrok URL) : <span style="color: var(--text-muted);">En attente...</span>';
  if (stepWan) stepWan.innerHTML = '3. WAN (internet ping) : <span style="color: var(--text-muted);">En attente...</span>';
  if (analysisDiv) {
    analysisDiv.textContent = '';
    analysisDiv.style.background = 'transparent';
    analysisDiv.style.border = 'none';
  }

  // 1. Test local server endpoint ping
  console.log("[Connectivity] Test 1: Ping local (localhost:3000)...");
  const localRes = await api.pingEndpoint('http://localhost:3000/api/search-status');
  let isLocalSuccess = false;
  if (localRes.ok) {
    isLocalSuccess = true;
    console.log("[Connectivity] Local OK (200 OK)");
    if (stepLocal) stepLocal.innerHTML = '1. Local (localhost:3000) : <span style="color: var(--color-success);"><i class="fa-solid fa-circle-check"></i> Accessible (200 OK)</span>';
  } else {
    console.warn(`[Connectivity] Local FAILED: ${localRes.message || 'CORS/Refused'}`);
    if (stepLocal) stepLocal.innerHTML = `1. Local (localhost:3000) : <span style="color: #f87171;"><i class="fa-solid fa-circle-xmark"></i> Échec (${localRes.message || 'CORS/Refusé'})</span>`;
  }

  // 2. Test remote server endpoint ping
  const configuredRemoteUrl = localStorage.getItem('dr_cat_remote_server_url') || api.REMOTE_SERVER_URL || '';
  let isRemoteSuccess = false;
  let remoteErrorMessage = '';
  
  if (stepRemote) stepRemote.innerHTML = '2. Distant (ngrok URL) : <span style="color: #fbbf24;"><i class="fa-solid fa-spinner fa-spin"></i> Ping...</span>';
  
  if (configuredRemoteUrl) {
    console.log(`[Connectivity] Test 2: Ping distant ngrok (${configuredRemoteUrl})...`);
    const remoteRes = await api.pingEndpoint(`${configuredRemoteUrl}/api/search-status`);
    if (remoteRes.ok) {
      isRemoteSuccess = true;
      console.log("[Connectivity] Distant ngrok OK");
      if (stepRemote) stepRemote.innerHTML = `2. Distant (ngrok) : <span style="color: var(--color-success);"><i class="fa-solid fa-circle-check"></i> Accessible (${configuredRemoteUrl})</span>`;
    } else {
      remoteErrorMessage = remoteRes.message || 'CORS ou Timeout';
      console.warn(`[Connectivity] Distant ngrok FAILED: ${remoteErrorMessage}`);
      if (stepRemote) stepRemote.innerHTML = `2. Distant (ngrok) : <span style="color: #f87171;"><i class="fa-solid fa-circle-xmark"></i> Échec (${remoteErrorMessage})</span>`;
    }
  } else {
    console.log("[Connectivity] Test 2: Distant non configuré");
    if (stepRemote) stepRemote.innerHTML = '2. Distant (ngrok) : <span style="color: var(--text-muted);"><i class="fa-solid fa-circle-exclamation"></i> Non configuré</span>';
  }

  // 3. Test WAN internet access ping
  if (stepWan) stepWan.innerHTML = '3. WAN (internet ping) : <span style="color: #fbbf24;"><i class="fa-solid fa-spinner fa-spin"></i> Ping...</span>';
  console.log("[Connectivity] Test 3: Ping WAN (httpbin)...");
  const wanRes = await api.pingEndpoint('https://httpbin.org/status/200');
  let isWanSuccess = false;
  if (wanRes.ok) {
    isWanSuccess = true;
    console.log("[Connectivity] WAN OK (Internet accessible)");
    if (stepWan) stepWan.innerHTML = '3. WAN (internet ping) : <span style="color: var(--color-success);"><i class="fa-solid fa-circle-check"></i> Connecté à Internet</span>';
  } else {
    console.warn("[Connectivity] WAN FAILED (No internet access)");
    if (stepWan) stepWan.innerHTML = '3. WAN (internet ping) : <span style="color: #f87171;"><i class="fa-solid fa-circle-xmark"></i> Échec de la connexion WAN</span>';
  }

  // Auto Diagnosis Analysis Generator
  if (analysisDiv) {
    analysisDiv.style.padding = '8px';
    analysisDiv.style.borderRadius = '6px';
    analysisDiv.style.marginTop = '10px';
    
    if (!isWanSuccess) {
      analysisDiv.style.background = 'rgba(239, 68, 68, 0.15)';
      analysisDiv.style.border = '1px solid rgba(239, 68, 68, 0.3)';
      analysisDiv.style.color = '#fca5a5';
      analysisDiv.innerHTML = '<strong>🔍 Diagnostic :</strong> L\'appareil n\'a pas d\'accès à Internet. Vérifiez le Wi-Fi ou les données mobiles.';
    } else if (configuredRemoteUrl && !isRemoteSuccess) {
      analysisDiv.style.background = 'rgba(245, 158, 11, 0.15)';
      analysisDiv.style.border = '1px solid rgba(245, 158, 11, 0.3)';
      analysisDiv.style.color = '#fde047';
      
      if (remoteErrorMessage.includes('timed out') || remoteErrorMessage.includes('Failed to fetch')) {
        analysisDiv.innerHTML = '<strong>🔍 Diagnostic :</strong> Le tunnel ngrok n\'est pas joignable (Timeout). L\'adresse a peut-être changé ou ngrok est arrêté sur le serveur.';
      } else {
        analysisDiv.innerHTML = '<strong>🔍 Diagnostic :</strong> Échec CORS suspecté. Assurez-vous que le serveur Node autorise les requêtes provenant de l\'appareil client.';
      }
    } else if (!configuredRemoteUrl) {
      analysisDiv.style.background = 'rgba(6, 182, 212, 0.15)';
      analysisDiv.style.border = '1px solid rgba(6, 182, 212, 0.3)';
      analysisDiv.style.color = '#99f6e4';
      analysisDiv.innerHTML = '<strong>🔍 Diagnostic :</strong> L\'application fonctionne localement, mais aucune URL distante (ngrok) n\'est configurée pour la synchronisation.';
    } else {
      analysisDiv.style.background = 'rgba(16, 185, 129, 0.15)';
      analysisDiv.style.border = '1px solid rgba(16, 185, 129, 0.3)';
      analysisDiv.style.color = '#a7f3d0';
      analysisDiv.innerHTML = '<strong>🔍 Diagnostic :</strong> Tous les tests sont au vert. La connectivité réseau et le tunnel ngrok fonctionnent parfaitement !';
    }
  }
}

async function checkNgrokTunnel() {
  if (api.isOfflineApp && !api.hasRemoteServer()) {
    showToast("Le statut ngrok ne peut être inspecté que depuis le serveur.", "fa-triangle-exclamation", 4000);
    return;
  }

  const activeSpan = document.getElementById('diag-ngrok-active');
  const urlSpan = document.getElementById('diag-ngrok-url');
  const connsSpan = document.getElementById('diag-ngrok-conns');

  if (activeSpan) activeSpan.textContent = 'Vérification...';

  try {
    const data = await api.fetchNgrokTunnels();
    if (data && data.tunnels && data.tunnels.length > 0) {
      const t = data.tunnels[0];
      if (activeSpan) {
        activeSpan.textContent = 'Actif';
        activeSpan.style.background = 'rgba(16, 185, 129, 0.2)';
        activeSpan.style.color = 'var(--color-success)';
      }
      if (urlSpan) urlSpan.textContent = t.public_url;
      
      const connCount = t.metrics?.conns?.count || 0;
      const connGauge = t.metrics?.conns?.gauge || 0;
      if (connsSpan) connsSpan.textContent = `${connCount} (Actuellement actives: ${connGauge})`;
    } else {
      if (activeSpan) {
        activeSpan.textContent = 'Aucun tunnel';
        activeSpan.style.background = 'rgba(239, 68, 68, 0.2)';
        activeSpan.style.color = '#f87171';
      }
      if (urlSpan) urlSpan.textContent = '--';
      if (connsSpan) connsSpan.textContent = '--';
    }
  } catch (err) {
    if (activeSpan) {
      activeSpan.textContent = 'Arrêté';
      activeSpan.style.background = 'rgba(239, 68, 68, 0.2)';
      activeSpan.style.color = '#f87171';
    }
    if (urlSpan) urlSpan.textContent = 'ngrok non démarré (localhost:4040)';
    if (connsSpan) connsSpan.textContent = '--';
  }
}

async function saveRemoteServerUrl() {
  const input = document.getElementById('diag-remote-url-input');
  if (!input) return;

  const url = input.value.trim();
  if (url && !url.startsWith('http://') && !url.startsWith('https://')) {
    showToast("L'URL doit commencer par http:// ou https://", "fa-triangle-exclamation", 4000);
    return;
  }

  try {
    // 1. Save locally in local storage for instant Capacitor/offline mode use
    if (url) {
      localStorage.setItem('dr_cat_remote_server_url', url);
    } else {
      localStorage.removeItem('dr_cat_remote_server_url');
    }

    // 2. Persist to server config if online
    if (!api.isOfflineApp || api.hasRemoteServer()) {
      await api.updateDiagnosticsRemoteUrl(url);
    }

    showToast("Adresse du serveur mise à jour !", "fa-circle-check", 3000);
    
    // Refresh stats and run connection test automatically to verify URL validity
    refreshDiagnosticsData();
    runConnectivityTest();
  } catch (err) {
    console.error(err);
    showToast(`Erreur d'enregistrement : ${err.message}`, "fa-circle-xmark", 5000);
  }
}

function renderLogs() {
  const term = document.getElementById('diag-logs-terminal');
  if (!term) return;

  const logs = getDiagnosticsLogs();
  if (logs.length === 0) {
    term.innerHTML = '<span style="color: var(--text-muted);">Aucune entrée de journal disponible. Ouvrez l\'outil de diagnostic pour commencer la capture.</span>';
    return;
  }

  term.innerHTML = logs.map(l => {
    let color = '#e2e8f0'; // LOG: light gray
    if (l.severity === 'INFO') color = '#38bdf8'; // blue
    else if (l.severity === 'WARN') color = '#fbbf24'; // yellow
    else if (l.severity === 'ERROR') color = '#f87171'; // red
    
    return `<div style="margin-bottom: 4px;"><span style="color: var(--text-muted);">[${l.time}]</span> <span style="color: ${color}; font-weight: bold;">[${l.severity}]</span> ${escapeHtmlLogs(l.message)}</div>`;
  }).join('');

  // Auto-scroll to bottom of terminal
  term.scrollTop = term.scrollHeight;
}

function escapeHtmlLogs(str) {
  if (!str) return '';
  return str
    .replace(/&/g, '&amp;')
    .replace(/</g, '&lt;')
    .replace(/>/g, '&gt;');
}

async function copyTerminalLogs() {
  const logs = getDiagnosticsLogs();
  if (logs.length === 0) {
    showToast("Aucun log à copier.", "fa-triangle-exclamation", 3000);
    return;
  }

  const plainText = logs.map(l => `[${l.time}][${l.severity}] ${l.message}`).join('\n');
  const success = await copyToClipboard(plainText);
  
  if (success) {
    showToast("Journal copié dans le presse-papiers !", "fa-copy", 3000);
  } else {
    showToast("Échec de la copie automatique.", "fa-circle-xmark", 4000);
  }
}

function clearTerminalLogs() {
  clearDiagnosticsLogs();
  showToast("Journal de log vidé.", "fa-trash-can", 3000);
}

async function runAutoCheckupSuite() {
  showToast("Lancement du Check-up Auto-Test...", "fa-microscope fa-spin", 3000);
  
  // 1. Reset client console logs and benchmarks
  clearTerminalLogs();
  if (window.perf) {
    window.perf.reset();
    window.perf.startFrameMonitor();
  }

  // Log diagnostic starting message
  console.log("[Auto-Test] Lancement du check-up complet...");
  console.log(`[Auto-Test] User Agent: ${navigator.userAgent}`);
  console.log(`[Auto-Test] Plateforme: ${navigator.platform}`);

  // 2. Fetch server diagnostic system information
  console.log("[Auto-Test] Récupération des informations système du serveur...");
  await refreshDiagnosticsData();

  // 3. Trigger sequential connectivity test (Local, Remote, WAN)
  console.log("[Auto-Test] Lancement des tests de connectivité réseau...");
  await runConnectivityTest();

  // 4. Trace tunnel information
  console.log("[Auto-Test] Inspection du tunnel ngrok...");
  await checkNgrokTunnel();

  // 5. Let frame capture run for 1.5 seconds to measure rendering FPS / stutters
  console.log("[Auto-Test] Capture du framerate et de la mémoire (patientez 1.5s)...");
  await new Promise(resolve => setTimeout(resolve, 1500));

  if (window.perf) {
    window.perf.stopFrameMonitor();
  }

  // 6. Pull server performance metrics
  let serverPerformanceMetrics = {};
  if (!api.isOfflineApp || api.hasRemoteServer()) {
    try {
      console.log("[Auto-Test] Récupération des latences des endpoints du serveur...");
      serverPerformanceMetrics = await api.fetchServerMetrics();
    } catch (err) {
      console.warn("[Auto-Test] Échec de la récupération des latences serveur:", err.message);
    }
  }

  // 7. Compile report payload
  const clientPerformanceMetrics = window.perf ? window.perf.getMetrics() : {};
  const logs = getDiagnosticsLogs();

  const report = {
    reportName: "Dr. CAT - Auto-Diagnostic Complet",
    timestamp: new Date().toISOString(),
    userAgent: navigator.userAgent,
    isOfflineApp: api.isOfflineApp,
    connectionStatus: navigator.onLine ? "Online" : "Offline",
    diagnosticsPanelStats: {
      navigatorOnline: navigator.onLine,
      remoteServerUrl: localStorage.getItem('dr_cat_remote_server_url') || api.REMOTE_SERVER_URL || '',
      adminTokenPresent: !!localStorage.getItem('dr_cat_admin_token')
    },
    clientPerformanceMetrics,
    serverPerformanceMetrics,
    consoleLogsCollected: logs
  };

  // 8. Export report - smart strategy based on platform
  const jsonStr = JSON.stringify(report, null, 2);
  const d = new Date();
  const timestampStr = `${d.getFullYear()}-${String(d.getMonth()+1).padStart(2,'0')}-${String(d.getDate()).padStart(2,'0')}-${String(d.getHours()).padStart(2,'0')}${String(d.getMinutes()).padStart(2,'0')}${String(d.getSeconds()).padStart(2,'0')}`;
  const fileName = `drcat-diagnostic-complete-${timestampStr}.json`;

  // Show the universal export modal
  exportDataFile(fileName, "Rapport Auto-Test", report);

  showToast("Auto-Test terminé ! Rapport prêt.", "fa-circle-check", 4000);
  console.log("[Auto-Test] Diagnostic complété. Rapport prêt à l'export !");
}

