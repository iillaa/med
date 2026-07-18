<script setup lang="ts">
import { ref, onMounted } from 'vue'
import { useAppStore } from '@/stores/app'
import { useDiagnostics } from '@/composables/useDiagnostics'

const appStore = useAppStore()
const { diagnosticsData, consoleLogs, refreshDiagnosticsData, runConnectivityTest, checkProviderTunnel, saveRemoteServerUrl, resetRemoteServerUrl, runAutoCheckupSuite, clearDiagnosticsLogs } = useDiagnostics()

const remoteUrlInput = ref('')
const remoteUrlSaving = ref(false)
const autoCheckupRunning = ref(false)

onMounted(() => {
  refreshDiagnosticsData()
  runConnectivityTest()
  remoteUrlInput.value = diagnosticsData.remoteUrl
})

async function onSaveRemoteUrl(): Promise<void> {
  const raw = remoteUrlInput.value.trim()
  const urls = raw.split(/[,\n]/).map(u => u.trim()).filter(u => u.length > 0)
  if (urls.length === 0) {
    appStore.showToast("Veuillez saisir au moins une URL.", "fa-triangle-exclamation", 4000)
    return
  }
  remoteUrlSaving.value = true
  try {
    const result = await saveRemoteServerUrl(urls)
    if (result.error) {
      appStore.showToast(result.error, "fa-circle-exclamation", 4000)
    } else {
      appStore.showToast(result.message || 'URL enregistrée', "fa-circle-check", 3000)
      remoteUrlInput.value = diagnosticsData.remoteUrl
      await refreshDiagnosticsData()
      await runConnectivityTest()
    }
  } finally {
    remoteUrlSaving.value = false
  }
}

function onResetRemoteUrl(): void {
  const result = resetRemoteServerUrl()
  appStore.showToast(result.message, "fa-arrow-rotate-left", 3000)
  remoteUrlInput.value = diagnosticsData.remoteUrl
  refreshDiagnosticsData()
  runConnectivityTest()
}

async function onAutoCheckup(): Promise<void> {
  autoCheckupRunning.value = true
  try {
    const result = await runAutoCheckupSuite()
    if ('message' in result) {
      appStore.showToast(result.message, "fa-circle-check", 4000)
    }
  } catch (err) {
    console.error('[AdminDiagnostics] Auto checkup failed:', err)
    appStore.showToast("Erreur lors de l'auto-checkup.", "fa-circle-exclamation", 4000)
  } finally {
    autoCheckupRunning.value = false
  }
}

function onCopyDiagLogs(): void {
  const logs = getDiagnosticsLogs()
  if (logs.length === 0) {
    appStore.showToast("Aucun log à copier.", "fa-triangle-exclamation", 3000)
    return
  }
  const text = logs.map(l => `[${l.time}][${l.severity}] ${l.message}`).join('\n')
  navigator.clipboard.writeText(text).then(() => {
    appStore.showToast("Journal copié dans le presse-papiers !", "fa-copy", 3000)
  }).catch(() => {
    appStore.showToast("Échec de la copie automatique.", "fa-circle-xmark", 4000)
  })
}

function onClearDiagLogs(): void {
  clearDiagnosticsLogs()
  appStore.showToast("Journal de log vidé.", "fa-trash-can", 3000)
}
</script>

<template>
  <div class="tab-content">
    <div style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 12px;">
      <h4 style="margin: 0; color: var(--color-primary); font-size: 14.5px; display: flex; align-items: center; gap: 8px;">
        <i class="fa-solid fa-stethoscope"></i> Outils de Diagnostic
      </h4>
      <button class="action-btn" @click="onAutoCheckup" :disabled="autoCheckupRunning" style="font-size: 12px; padding: 6px 12px; display: flex; align-items: center; gap: 6px;">
        <i class="fa-solid fa-microscope" :class="autoCheckupRunning ? 'fa-spin' : ''"></i>
        {{ autoCheckupRunning ? 'Check-up...' : 'Auto-Test' }}
      </button>
    </div>
    <p style="margin: 0 0 12px 0; font-size: 13px; color: var(--text-secondary);">Informations système, logs de la console et tests de connectivité en temps réel.</p>

    <!-- Connection Test -->
    <div class="diag-card" style="margin-bottom: 12px;">
      <h4 style="font-size: 13.5px; border-bottom: 1px solid rgba(255,255,255,0.08); padding-bottom: 6px; margin-bottom: 8px; color: var(--text-primary);">
        <i class="fa-solid fa-wifi"></i> Test de Connectivité
      </h4>
      <div style="display: flex; flex-direction: column; gap: 6px; font-size: 12px;">
        <div>1. Local (localhost:3000) : <span :style="{ color: diagnosticsData.connectionTest.local.status === 'success' ? 'var(--color-success)' : diagnosticsData.connectionTest.local.status === 'error' ? '#f87171' : '#fbbf24' }">
          {{ diagnosticsData.connectionTest.local.status === 'success' ? '✓' : diagnosticsData.connectionTest.local.status === 'error' ? '✕' : '...' }} {{ diagnosticsData.connectionTest.local.message }}
        </span></div>
        <div>2. Distant (URL configurée) : <span :style="{ color: diagnosticsData.connectionTest.remote.status === 'success' ? 'var(--color-success)' : diagnosticsData.connectionTest.remote.status === 'error' ? '#f87171' : 'var(--text-muted)' }">
          {{ diagnosticsData.connectionTest.remote.status === 'success' ? '✓' : diagnosticsData.connectionTest.remote.status === 'error' ? '✕' : '...' }} {{ diagnosticsData.connectionTest.remote.message }}
        </span></div>
        <div>3. WAN (internet ping) : <span :style="{ color: diagnosticsData.connectionTest.wan.status === 'success' ? 'var(--color-success)' : diagnosticsData.connectionTest.wan.status === 'error' ? '#f87171' : '#fbbf24' }">
          {{ diagnosticsData.connectionTest.wan.status === 'success' ? '✓' : diagnosticsData.connectionTest.wan.status === 'error' ? '✕' : '...' }} {{ diagnosticsData.connectionTest.wan.message }}
        </span></div>
      </div>
      <div v-if="diagnosticsData.autoAnalysis.text" :style="{ ...diagnosticsData.autoAnalysis.style, padding: '8px', borderRadius: '6px', marginTop: '10px', fontSize: '12px' }">
        <strong>🔍 Diagnostic :</strong> {{ diagnosticsData.autoAnalysis.text }}
      </div>
      <button class="action-btn" style="margin-top: 10px; width: 100%; font-size: 12px; padding: 6px 12px;" @click="runConnectivityTest">
        <i class="fa-solid fa-bolt"></i> Tester la connexion
      </button>
    </div>

    <!-- System Info -->
    <div class="diag-grid" style="display: grid; grid-template-columns: repeat(auto-fit, minmax(280px, 1fr)); gap: 16px; margin-bottom: 16px;">
      <div class="diag-card">
        <h4 style="font-size: 13.5px; border-bottom: 1px solid rgba(255,255,255,0.08); padding-bottom: 6px; margin-bottom: 8px; color: var(--text-primary);"><i class="fa-solid fa-wifi"></i> Statut & Connectivité</h4>
        <div style="display: flex; flex-direction: column; gap: 6px; font-size: 12px; color: var(--text-muted);">
          <div>Navigator.onLine : <span class="badge" :style="{ background: diagnosticsData.online ? 'rgba(16,185,129,0.2)' : 'rgba(239,68,68,0.2)', color: diagnosticsData.online ? 'var(--color-success)' : '#f87171', padding: '2px 6px', borderRadius: '4px' }">{{ diagnosticsData.online ? 'En ligne' : 'Hors ligne' }}</span></div>
          <div>Mode détecté : <span class="badge" style="background: rgba(6,182,212,0.2); color: var(--color-primary); padding: '2px 6px', borderRadius: '4px';">{{ diagnosticsData.appMode }}</span></div>
          <div>Token Admin : <span class="badge" :style="{ background: diagnosticsData.adminTokenPresent ? 'rgba(16,185,129,0.2)' : 'rgba(239,68,68,0.2)', color: diagnosticsData.adminTokenPresent ? 'var(--color-success)' : '#f87171', padding: '2px 6px', borderRadius: '4px' }">{{ diagnosticsData.adminTokenPresent ? 'Présent & Actif' : 'Absent' }}</span></div>
          <div>URL Distante : <span :style="{ color: diagnosticsData.remoteUrl ? 'var(--text-primary)' : 'var(--text-muted)' }">{{ diagnosticsData.remoteUrl || '(Aucun)' }}</span></div>
        </div>
      </div>

      <div class="diag-card">
        <h4 style="font-size: 13.5px; border-bottom: 1px solid rgba(255,255,255,0.08); padding-bottom: 6px; margin-bottom: 8px; color: var(--text-primary);"><i class="fa-solid fa-server"></i> Serveur & Base de données</h4>
        <div style="display: flex; flex-direction: column; gap: 6px; font-size: 12px; color: var(--text-muted);">
          <div>Node.js : <span>{{ diagnosticsData.nodeVersion }}</span></div>
          <div>OS : <span>{{ diagnosticsData.serverOs }}</span></div>
          <div>Uptime : <span>{{ diagnosticsData.serverUptime }}</span></div>
          <div>Mémoire : <span>{{ diagnosticsData.serverMem }}</span></div>
          <div>CATs : <span>{{ diagnosticsData.dbCats }}</span></div>
          <div>Suggestions : <span>{{ diagnosticsData.dbSugs }}</span></div>
          <div>Taille DB CATs : <span>{{ diagnosticsData.dbSizeCats }}</span></div>
          <div>Taille DB Suggestions : <span>{{ diagnosticsData.dbSizeSugs }}</span></div>
          <div>Taille Index : <span>{{ diagnosticsData.dbSizeIndex }}</span></div>
        </div>
      </div>
    </div>

    <!-- Remote URL Management -->
    <div class="diag-card" style="margin-bottom: 12px;">
      <h4 style="font-size: 13.5px; border-bottom: 1px solid rgba(255,255,255,0.08); padding-bottom: 6px; margin-bottom: 8px; color: var(--text-primary);"><i class="fa-solid fa-link"></i> Gestion de l'URL Distante</h4>
      <div style="display: flex; gap: 8px; flex-wrap: wrap; margin-bottom: 8px;">
        <input v-model="remoteUrlInput" type="text" placeholder="https://votre-tunnel.onrender.com" style="flex: 1; min-width: 200px; background: var(--bg-input); border: 1px solid var(--border-color); border-radius: var(--radius-sm); padding: 8px; color: var(--text-primary); font-size: 12px;" />
        <button class="save-btn" @click="onSaveRemoteUrl" :disabled="remoteUrlSaving" style="font-size: 12px; padding: 6px 12px;">
          {{ remoteUrlSaving ? 'Sauvegarde...' : 'Sauvegarder' }}
        </button>
        <button class="cancel-btn" @click="onResetRemoteUrl" style="font-size: 12px; padding: 6px 12px;">Réinitialiser</button>
      </div>
      <button class="action-btn" style="width: 100%; font-size: 12px; padding: 6px 12px;" @click="checkProviderTunnel">
        <i class="fa-solid fa-magnifying-glass"></i> Vérifier le tunnel
      </button>
      <div v-if="diagnosticsData.tunnelActive || diagnosticsData.tunnelUrls.length > 0" style="margin-top: 8px; font-size: 12px; color: var(--text-muted);">
        <div>Tunnel actif : <span :style="{ color: diagnosticsData.tunnelActive ? 'var(--color-success)' : '#fbbf24' }">{{ diagnosticsData.tunnelActive ? 'Oui' : 'Non' }}</span></div>
        <div v-if="diagnosticsData.tunnelUrls.length > 0">URLs : <span style="font-family: monospace;">{{ diagnosticsData.tunnelUrls.join('\n') }}</span></div>
      </div>
    </div>

    <!-- PDF Index Health -->
    <div class="diag-card" style="margin-bottom: 12px;">
      <h4 style="font-size: 13.5px; border-bottom: 1px solid rgba(255,255,255,0.08); padding-bottom: 6px; margin-bottom: 8px; color: var(--text-primary);"><i class="fa-solid fa-file-pdf"></i> Santé de l'Index PDF</h4>
      <div style="display: flex; flex-direction: column; gap: 6px; font-size: 12px; color: var(--text-muted);">
        <div>Documents indexés : <span>{{ diagnosticsData.pdfDocs }}</span></div>
        <div>Pages totales : <span>{{ diagnosticsData.pdfPages }}</span></div>
        <div>Dernière indexation : <span>{{ diagnosticsData.pdfTime }}</span></div>
        <div v-if="diagnosticsData.pdfHealth" style="display: flex; gap: 12px; margin-top: 4px;">
          <span style="color: var(--color-success);"><i class="fa-solid fa-circle-check"></i> {{ diagnosticsData.pdfHealth.green }} sains</span>
          <span style="color: #fbbf24;"><i class="fa-solid fa-circle-exclamation"></i> {{ diagnosticsData.pdfHealth.orange }} partiels</span>
          <span style="color: #f87171;"><i class="fa-solid fa-triangle-exclamation"></i> {{ diagnosticsData.pdfHealth.red }} vides</span>
        </div>
      </div>
    </div>

    <!-- Rate Limits -->
    <div class="diag-card" style="margin-bottom: 12px;">
      <h4 style="font-size: 13.5px; border-bottom: 1px solid rgba(255,255,255,0.08); padding-bottom: 6px; margin-bottom: 8px; color: var(--text-primary);"><i class="fa-solid fa-shield-halved"></i> Rate Limits</h4>
      <div v-if="diagnosticsData.rateLimits.length === 0" style="font-size: 12px; color: var(--text-muted); font-style: italic; padding: 8px 0;">Aucune IP bloquée.</div>
      <div v-else style="display: flex; flex-direction: column; gap: 4px;">
        <div v-for="item in diagnosticsData.rateLimits" :key="item.ip" style="display: flex; justify-content: space-between; border-bottom: 1px solid rgba(255,255,255,0.03); padding-bottom: 4px;">
          <span style="font-family: monospace; color: var(--text-primary);">{{ item.ip }}</span>
          <span style="color: #f87171; font-weight: bold;">{{ item.count }} échec(s) ({{ Math.round((Date.now() - item.lastAttempt) / 1000) }}s)</span>
        </div>
      </div>
    </div>

    <!-- Console Logs -->
    <div class="diag-card">
      <div style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 8px;">
        <h4 style="font-size: 13.5px; border-bottom: 1px solid rgba(255,255,255,0.08); padding-bottom: 6px; margin: 0; color: var(--text-primary);"><i class="fa-solid fa-terminal"></i> Journal de Console</h4>
        <div style="display: flex; gap: 6px;">
          <button class="action-btn" @click="onCopyDiagLogs" style="font-size: 11px; padding: 4px 8px;"><i class="fa-solid fa-copy"></i> Copier</button>
          <button class="cancel-btn" @click="onClearDiagLogs" style="font-size: 11px; padding: 4px 8px;"><i class="fa-solid fa-trash"></i> Vider</button>
        </div>
      </div>
      <div id="diag-logs-terminal" style="background: rgba(0,0,0,0.3); border-radius: 6px; padding: 10px; max-height: 200px; overflow-y: auto; font-family: monospace; font-size: 11px; line-height: 1.5;">
        <div v-if="consoleLogs.length === 0" style="color: var(--text-muted); font-style: italic;">
          Aucune entrée de journal disponible. Ouvrez l'outil de diagnostic pour commencer la capture.
        </div>
        <div v-for="(log, idx) in consoleLogs" :key="idx" style="margin-bottom: 4px; border-bottom: 1px solid rgba(255,255,255,0.02); padding-bottom: 2px;">
          <span style="color: var(--text-muted);">[{{ log.time }}]</span>
          <span :style="{ color: log.severity === 'ERROR' ? '#f87171' : log.severity === 'WARN' ? '#fbbf24' : '#38bdf8', fontWeight: 'bold' }">[{{ log.severity }}]</span>
          {{ log.message }}
        </div>
      </div>
    </div>
  </div>
</template>

<style scoped>
.diag-grid {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
  gap: 12px;
}
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
