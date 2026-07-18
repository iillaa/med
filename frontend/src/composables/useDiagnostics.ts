/**
 * Diagnostics Composable
 * Port of public/js/components/diagnostics.js to Vue 3 Composition API
 */

import { ref, reactive, onMounted, onUnmounted, watch } from 'vue'
import {
  fetchDiagnosticsSystem,
  fetchDiagnosticsDbStats,
  fetchDiagnosticsIndexDetail,
  fetchDiagnosticsRemoteUrl,
  updateDiagnosticsRemoteUrl,
  fetchTunnelInfo,
  fetchServerMetrics,
  fetchRateLimits,
  fetchSearchStatus,
  searchPdfsContent,
  triggerReindexing,
  checkRealConnection,
  pingEndpoint,
  isOfflineApp,
  hasRemoteServerConfigured
} from '@/api/client'
import { getItem, setItem, STORAGE_KEYS } from '@/utils/storage'
import { formatBytes, formatPercent, escapeHTML } from '@/utils/markdown'
import { useAppStore } from '@/stores/app'

// Export modal helper
export function exportDataFile(fileName: string, dataTitle: string, payload: any) {
  const jsonStr = JSON.stringify(payload, null, 2)
  const blob = new Blob([jsonStr], { type: 'application/json' })
  const url = URL.createObjectURL(blob)
  const a = document.createElement('a')
  a.href = url
  a.download = fileName
  a.click()
  URL.revokeObjectURL(url)
}

// Console capture
const consoleLogs = ref<Array<{ time: string; severity: string; message: string }>>([])
let consoleWarningsEnabled = false
const originalConsole = { ...console }

function captureConsoleWarnings(enable: boolean) {
  consoleWarningsEnabled = enable
  if (enable) {
    const intercept = (type: 'log' | 'warn' | 'error') => {
      console[type] = (...args: any[]) => {
        originalConsole[type](...args)
        const message = args.map(a => typeof a === 'object' ? JSON.stringify(a) : String(a)).join(' ')
        const severity = type === 'error' ? 'ERROR' : type === 'warn' ? 'WARN' : 'INFO'
        const time = new Date().toLocaleTimeString('fr-FR', { hour12: false })
        consoleLogs.value.push({ time, severity, message })
        if (consoleLogs.value.length > 100) consoleLogs.value.shift()
        window.dispatchEvent(new CustomEvent('drcat-log-added'))
      }
    }
    console.log = intercept('log')
    console.warn = intercept('warn')
    console.error = intercept('error')
  } else {
    console.log = originalConsole.log
    console.warn = originalConsole.warn
    console.error = originalConsole.error
  }
}

function getDiagnosticsLogs() {
  return [...consoleLogs.value]
}

function clearDiagnosticsLogs() {
  consoleLogs.value = []
}

// Reactive diagnostics state
const diagnosticsData = reactive({
  online: navigator.onLine,
  appMode: 'Web',
  adminTokenPresent: !!getItem<string>('dr_cat_admin_token', ''),
  remoteUrl: getItem<string>('dr_cat_remote_server_url', '') || '',
  nodeVersion: '--',
  serverOs: '--',
  serverUptime: '--',
  serverMem: '--',
  indexingActive: false,
  dbCats: '--',
  dbSugs: '--',
  dbSizeCats: '--',
  dbSizeSugs: '--',
  dbSizeIndex: '--',
  pdfDocs: '0',
  pdfPages: '0',
  pdfTime: '--',
  pdfHealth: null as { green: number; orange: number; red: number } | null,
  rateLimits: [] as Array<{ ip: string; count: number; lastAttempt: number }>,
  tunnelActive: false,
  tunnelUrls: [] as string[],
  serverUptimeSeconds: 0,
  serverWriteAvg: 0,
  serverPdfAvg: '--',
  serverCacheHit: '--',
  connectionTest: {
    local: { status: 'pending' as 'pending' | 'success' | 'error', message: '' },
    remote: { status: 'pending' as 'pending' | 'success' | 'error', message: '' },
    wan: { status: 'pending' as 'pending' | 'success' | 'error', message: '' }
  },
  autoAnalysis: { text: ''; style: {} as Record<string, string> }
})

const isRefreshing = ref(false)

async function refreshDiagnosticsData() {
  const appStore = useAppStore()
  const hasAdminToken = !!getItem<string>('dr_cat_admin_token', '')
  const isOffline = isOfflineApp
  const hasRemote = hasRemoteServerConfigured()

  diagnosticsData.online = navigator.onLine
  diagnosticsData.adminTokenPresent = hasAdminToken
  diagnosticsData.remoteUrl = getItem<string>('dr_cat_remote_server_url', '') || ''
  diagnosticsData.appMode = isOffline ? 'Application Autonome (Capacitor)' : 'Serveur Web (Node)'

  if (!hasAdminToken || (!isOffline && !hasRemote)) {
    diagnosticsData.nodeVersion = '-- (Admin requis)'
    diagnosticsData.serverOs = '-- (Admin requis)'
    diagnosticsData.serverUptime = '-- (Admin requis)'
    diagnosticsData.serverMem = '-- (Admin requis)'
    diagnosticsData.indexingActive = false
    diagnosticsData.dbCats = '-- (Admin requis)'
    diagnosticsData.dbSugs = '-- (Admin requis)'
    diagnosticsData.dbSizeCats = '-- (Admin requis)'
    diagnosticsData.dbSizeSugs = '-- (Admin requis)'
    diagnosticsData.dbSizeIndex = '-- (Admin requis)'
    diagnosticsData.pdfDocs = '-- (Admin requis)'
    diagnosticsData.pdfPages = '-- (Admin requis)'
    diagnosticsData.pdfTime = '-- (Admin requis)'
    diagnosticsData.pdfHealth = null
    diagnosticsData.rateLimits = []
    return
  }

  try {
    const system = await fetchDiagnosticsSystem()
    diagnosticsData.nodeVersion = system.nodeVersion || '--'
    diagnosticsData.serverOs = `${system.platform} / ${system.arch}` || '--'
    
    const up = system.uptimeSeconds
    const h = Math.floor(up / 3600)
    const m = Math.floor((up % 3600) / 60)
    diagnosticsData.serverUptime = `${h}h ${m}m` || '--'
    diagnosticsData.serverMem = system.memoryUsage ? formatBytes(system.memoryUsage.rss) : '--'
    diagnosticsData.indexingActive = !!system.indexingActive
  } catch (err) {
    console.warn("Failed to fetch server diagnostics:", err)
  }

  try {
    const stats = await fetchDiagnosticsDbStats()
    diagnosticsData.dbCats = `${stats.totalCats} (${stats.coreCats} base, ${stats.customCats} perso)`
    diagnosticsData.dbSugs = `${stats.totalSuggestions} en attente`
    diagnosticsData.dbSizeCats = formatBytes(stats.catsDbSize)
    diagnosticsData.dbSizeSugs = formatBytes(stats.suggestionsSize)
    diagnosticsData.dbSizeIndex = formatBytes(stats.indexSize)
  } catch (err) {
    console.warn("Failed to fetch database diagnostics stats:", err)
  }

  try {
    const indexDetail = await fetchDiagnosticsIndexDetail()
    diagnosticsData.pdfDocs = indexDetail.totalDocs || '0'
    diagnosticsData.pdfPages = indexDetail.totalPages ? Number(indexDetail.totalPages).toLocaleString() : '0'
    diagnosticsData.pdfTime = indexDetail.indexedAt ? new Date(indexDetail.indexedAt).toLocaleString('fr-FR') : '--'
    
    if (indexDetail.docs) {
      let green = 0, orange = 0, red = 0
      indexDetail.docs.forEach((doc: any) => {
        if (doc.status === 'green') green++
        else if (doc.status === 'orange') orange++
        else red++
      })
      diagnosticsData.pdfHealth = { green, orange, red }
    }
  } catch (err) {
    console.warn("Failed to fetch index details stats:", err)
  }

  try {
    const rateLimits = await fetchRateLimits()
    diagnosticsData.rateLimits = rateLimits
  } catch (err) {
    console.warn("Failed to fetch rate limits diagnostics stats:", err)
  }

  // Offline mode fallbacks
  if (isOffline && !hasRemote) {
    const customCats = JSON.parse(getItem<string>('dr_cat_custom_created_cats', '[]'))
    diagnosticsData.nodeVersion = 'N/A (WebView)'
    diagnosticsData.serverOs = 'Android native client'
    diagnosticsData.serverUptime = 'N/A'
    diagnosticsData.serverMem = 'N/A'
    diagnosticsData.indexingActive = false
    diagnosticsData.dbCats = `${55 + customCats.length} (55 base, ${customCats.length} perso)`
    diagnosticsData.dbSugs = 'Envoi direct au serveur'
    diagnosticsData.dbSizeCats = formatBytes(getItem<string>('dr_cat_custom_created_cats', '').length)
    diagnosticsData.dbSizeSugs = '0 B (N/A)'
    diagnosticsData.dbSizeIndex = 'Bundled local asset'
  }
}

async function runConnectivityTest() {
  const appStore = useAppStore()
  
  diagnosticsData.connectionTest = {
    local: { status: 'pending', message: 'Ping...' },
    remote: { status: 'pending', message: 'En attente...' },
    wan: { status: 'pending', message: 'En attente...' }
  }
  diagnosticsData.autoAnalysis = { text: '', style: {} }

  // 1. Local
  console.log("[Connectivity] Test 1: Ping local (localhost:3000)...")
  try {
    const localRes = await pingEndpoint('http://localhost:3000/api/search-status')
    if (localRes.ok) {
      diagnosticsData.connectionTest.local = { status: 'success', message: 'Accessible (200 OK)' }
    } else {
      diagnosticsData.connectionTest.local = { status: 'error', message: `Échec (${localRes.message || 'CORS/Refusé'})` }
    }
  } catch (err) {
    diagnosticsData.connectionTest.local = { status: 'error', message: 'Échec' }
  }

  // 2. Remote
  const configuredRemoteUrl = getItem<string>('dr_cat_remote_server_url', '') || ''
  if (configuredRemoteUrl) {
    console.log(`[Connectivity] Test 2: Ping distant ${configuredRemoteUrl}...`)
    try {
      const remoteRes = await pingEndpoint(`${configuredRemoteUrl}/api/search-status`)
      if (remoteRes.ok) {
        diagnosticsData.connectionTest.remote = { status: 'success', message: `Accessible (${configuredRemoteUrl})` }
      } else {
        diagnosticsData.connectionTest.remote = { status: 'error', message: `Échec (${remoteRes.message || 'CORS/Timeout'})` }
      }
    } catch (err) {
      diagnosticsData.connectionTest.remote = { status: 'error', message: 'Échec' }
    }
  } else {
    diagnosticsData.connectionTest.remote = { status: 'pending', message: 'Non configuré' }
  }

  // 3. WAN
  console.log("[Connectivity] Test 3: Ping WAN (httpbin)...")
  try {
    const wanRes = await pingEndpoint('https://httpbin.org/status/200')
    if (wanRes.ok) {
      diagnosticsData.connectionTest.wan = { status: 'success', message: 'Connecté à Internet' }
    } else {
      diagnosticsData.connectionTest.wan = { status: 'error', message: 'Échec de la connexion WAN' }
    }
  } catch (err) {
    diagnosticsData.connectionTest.wan = { status: 'error', message: 'Échec de la connexion WAN' }
  }

  // Auto Diagnosis Analysis
  const wanOk = diagnosticsData.connectionTest.wan.status === 'success'
  const remoteOk = diagnosticsData.connectionTest.remote.status === 'success'
  const remoteErr = diagnosticsData.connectionTest.remote.message

  if (!wanOk) {
    diagnosticsData.autoAnalysis = {
      text: "L'appareil n'a pas d'accès à Internet. Vérifiez le Wi-Fi ou les données mobiles.",
      style: { background: 'rgba(239, 68, 68, 0.15)', border: '1px solid rgba(239, 68, 68, 0.3)', color: '#fca5a5' }
    }
  } else if (configuredRemoteUrl && !remoteOk) {
    diagnosticsData.autoAnalysis = {
      text: remoteErr.includes('timed out') || remoteErr.includes('Failed to fetch')
        ? "Le tunnel n'est pas joignable (Timeout). L'adresse a peut-être changé ou le tunnel est arrêté sur le serveur."
        : "Échec CORS suspecté. Assurez-vous que le serveur Node autorise les requêtes provenant de l'appareil client.",
      style: { background: 'rgba(245, 158, 11, 0.15)', border: '1px solid rgba(245, 158, 11, 0.3)', color: '#fde047' }
    }
  } else if (!configuredRemoteUrl) {
    diagnosticsData.autoAnalysis = {
      text: "L'application fonctionne localement, mais aucune URL distante n'est configurée pour la synchronisation.",
      style: { background: 'rgba(6, 182, 212, 0.15)', border: '1px solid rgba(6, 182, 212, 0.3)', color: '#99f6e4' }
    }
  } else {
    diagnosticsData.autoAnalysis = {
      text: "Tous les tests sont au vert. La connectivité réseau et le tunnel fonctionnent parfaitement !",
      style: { background: 'rgba(16, 185, 129, 0.15)', border: '1px solid rgba(16, 185, 129, 0.3)', color: '#a7f3d0' }
    }
  }
}

async function checkProviderTunnel() {
  if (isOfflineApp && !hasRemoteServerConfigured()) {
    return { error: 'Le statut du tunnel ne peut être inspecté que depuis le serveur.' }
  }

  try {
    const data = await fetchTunnelInfo()
    const hasActive = data.configuredTunnels && data.configuredTunnels.length > 0
    diagnosticsData.tunnelActive = hasActive
    diagnosticsData.tunnelUrls = hasActive ? data.configuredTunnels.map((t: any) => t.url) : []
    return data
  } catch (err) {
    diagnosticsData.tunnelActive = false
    diagnosticsData.tunnelUrls = []
    return { error: 'Erreur de connexion' }
  }
}

async function saveRemoteServerUrl(urls: string[]) {
  if (urls.length === 0) {
    return { error: 'Veuillez saisir au moins une URL.' }
  }

  const invalid = urls.find(u => !u.startsWith('http://') && !u.startsWith('https://'))
  if (invalid) {
    return { error: "Toutes les URLs doivent commencer par http:// ou https://" }
  }

  try {
    localStorage.setItem('dr_cat_remote_server_url', urls[0])
    
    let serverPersistenceFailed = false
    if (!isOfflineApp) {
      try {
        await updateDiagnosticsRemoteUrl(urls)
      } catch (serverErr) {
        console.warn("Could not save config to server file system:", serverErr)
        serverPersistenceFailed = true
      }
    }

    return {
      success: !serverPersistenceFailed,
      message: serverPersistenceFailed
        ? "Adresse enregistrée localement, mais la configuration serveur n'a pas été mise à jour."
        : `${urls.length} adresse(s) de serveur enregistrée(s) !`
    }
  } catch (err) {
    return { error: `Erreur d'enregistrement : ${err.message}` }
  }
}

function resetRemoteServerUrl() {
  localStorage.removeItem('dr_cat_remote_server_url')
  return { success: true, message: "Adresse de serveur réinitialisée à celle d'origine !" }
}

async function runAutoCheckupSuite() {
  // 1. Reset
  clearDiagnosticsLogs()
  if (typeof window !== 'undefined' && (window as any).perf) {
    (window as any).perf.reset()
    ;(window as any).perf.startFrameMonitor()
  }

  console.log("[Auto-Test] Lancement du check-up complet...")
  console.log(`[Auto-Test] User Agent: ${navigator.userAgent}`)
  console.log(`[Auto-Test] Plateforme: ${navigator.platform}`)

  // 2. Fetch diagnostics
  await refreshDiagnosticsData()

  // 3. Connectivity test
  await runConnectivityTest()

  // 4. Tunnel info
  await checkProviderTunnel()

  // 5. Frame capture
  console.log("[Auto-Test] Capture du framerate et de la mémoire (patientez 1.5s)...")
  await new Promise(resolve => setTimeout(resolve, 1500))
  if (typeof window !== 'undefined' && (window as any).perf) {
    ;(window as any).perf.stopFrameMonitor()
  }

  // 6. Server metrics
  let serverPerformanceMetrics = {}
  const hasAdminToken = !!getItem<string>('dr_cat_admin_token', '')
  if ((!isOfflineApp || hasRemoteServerConfigured()) && hasAdminToken) {
    try {
      console.log("[Auto-Test] Récupération des latences des endpoints du serveur...")
      serverPerformanceMetrics = await fetchServerMetrics()
    } catch (err) {
      console.warn("[Auto-Test] Échec de la récupération des latences serveur:", err.message)
    }
  }

  // 7. Compile report
  const clientPerformanceMetrics = typeof window !== 'undefined' && (window as any).perf ? (window as any).perf.getMetrics() : {}
  const logs = getDiagnosticsLogs()

  const report = {
    reportName: "Dr. CAT - Auto-Diagnostic Complet",
    timestamp: new Date().toISOString(),
    userAgent: navigator.userAgent,
    isOfflineApp,
    connectionStatus: navigator.onLine ? "Online" : "Offline",
    diagnosticsPanelStats: {
      navigatorOnline: navigator.onLine,
      remoteServerUrl: getItem<string>('dr_cat_remote_server_url', '') || '',
      adminTokenPresent: !!getItem<string>('dr_cat_admin_token', '')
    },
    clientPerformanceMetrics,
    serverPerformanceMetrics,
    consoleLogsCollected: logs
  }

  const d = new Date()
  const timestampStr = `${d.getFullYear()}-${String(d.getMonth()+1).padStart(2,'0')}-${String(d.getDate()).padStart(2,'0')}-${String(d.getHours()).padStart(2,'0')}${String(d.getMinutes()).padStart(2,'0')}${String(d.getSeconds()).padStart(2,'0')}`
  const fileName = `drcat-diagnostic-complete-${timestampStr}.json`

  exportDataFile(fileName, "Rapport Auto-Test", report)
  
  return { success: true, message: "Auto-Test terminé ! Rapport prêt." }
}

export function useDiagnostics() {
  onMounted(() => {
    captureConsoleWarnings(true)
    refreshDiagnosticsData()
    
    // Refresh every 10 seconds when panel is open
    const interval = setInterval(() => {
      if (document.hidden === false) {
        refreshDiagnosticsData()
      }
    }, 10000)
    
    onUnmounted(() => {
      clearInterval(interval)
      captureConsoleWarnings(false)
    })
  })

  return {
    diagnosticsData,
    consoleLogs,
    isRefreshing,
    refreshDiagnosticsData,
    runConnectivityTest,
    checkProviderTunnel,
    saveRemoteServerUrl,
    resetRemoteServerUrl,
    runAutoCheckupSuite,
    getDiagnosticsLogs,
    clearDiagnosticsLogs,
    captureConsoleWarnings,
    exportDataFile
  }
}
