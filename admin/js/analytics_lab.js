let rawDeviceList = [];
let autoRefreshTimer = null;

const COUNTRY_MAP = {
  'DZ': '🇩🇿 Algérie',
  'FR': '🇫🇷 France',
  'MA': '🇲🇦 Maroc',
  'TN': '🇹🇳 Tunisie',
  'BE': '🇧🇪 Belgique',
  'CA': '🇨🇦 Canada',
  'CH': '🇨🇭 Suisse',
  'US': '🇺🇸 États-Unis',
  'GB': '🇬🇧 Royaume-Uni',
  'DE': '🇩🇪 Allemagne',
  'ES': '🇪🇸 Espagne',
  'IT': '🇮🇹 Italie',
  'SA': '🇸🇦 Arabie Saoudite',
  'AE': '🇦🇪 Émirats Arabes Unis',
  'QA': '🇶🇦 Qatar',
  'TR': '🇹🇷 Turquie'
};

function getCountryBadge(code) {
  const cleanCode = String(code || 'DZ').toUpperCase();
  const name = COUNTRY_MAP[cleanCode] || `🌐 ${cleanCode}`;
  return `<span class="badge" style="background: rgba(6,182,212,0.12); color: #06b6d4; border: 1px solid rgba(6,182,212,0.25);"><i class="fa-solid fa-location-dot" style="font-size:9px;"></i> ${name}</span>`;
}

function getPlatformBadge(plat) {
  if (plat === 'android_apk') {
    return '<span class="badge badge-apk"><i class="fa-solid fa-android"></i> Android APK</span>';
  }
  if (plat === 'web_pwa') {
    return '<span class="badge" style="background: rgba(6,182,212,0.15); color: #06b6d4; border: 1px solid rgba(6,182,212,0.3);"><i class="fa-solid fa-mobile-screen"></i> PWA Installée</span>';
  }
  return '<span class="badge" style="background: rgba(148,163,184,0.15); color: #94a3b8; border: 1px solid rgba(148,163,184,0.3);"><i class="fa-solid fa-globe"></i> Navigateur Web</span>';
}

function getAuthHeaders() {
  const token = localStorage.getItem('dr_cat_admin_token') || localStorage.getItem('admin_token') || '';
  const apiKey = localStorage.getItem('dr_cat_admin_key') || '';
  const headers = { 'Content-Type': 'application/json' };
  if (token) headers['Authorization'] = 'Bearer ' + token;
  if (apiKey) headers['x-api-key'] = apiKey;
  return headers;
}

async function loadAnalytics(autoSync = false) {
  try {
    const url = autoSync ? '/api/admin/active-devices?sync=true' : '/api/admin/active-devices';
    const res = await fetch(url, {
      credentials: 'same-origin',
      headers: getAuthHeaders()
    });
    if (!res.ok) throw new Error('HTTP ' + res.status);
    const json = await res.json();
    const data = json.analytics || {};

    document.getElementById('stat-live').textContent = data.liveNow || 0;
    const devLive = (data.liveNow || 0) - (data.externalLiveNow || 0);
    document.getElementById('stat-live-sub').textContent = `${data.externalLiveNow || 0} externes / ${devLive} dev`;

    document.getElementById('stat-total').textContent = data.totalDevices || 0;
    document.getElementById('stat-total-sub').textContent = `${data.externalDevices || 0} externes / ${data.adminDevices || 0} dev`;
    
    document.getElementById('stat-dau').textContent = data.dau || 0;
    document.getElementById('stat-dau-sub').textContent = `${data.externalDau || 0} externes en 24h`;
    
    document.getElementById('stat-mau').textContent = data.mau || 0;
    document.getElementById('stat-mau-sub').textContent = `${data.externalMau || 0} externes en 30j`;
    
    document.getElementById('stat-apk').textContent = data.platformDistribution?.android_apk || 0;
    document.getElementById('stat-pwa').textContent = data.platformDistribution?.web_pwa || 0;

    rawDeviceList = data.recentDevices || [];

    renderVersionDistribution(data.versionDistribution || {}, data.totalDevices || 1);
    renderCountryDistribution(data.countryDistribution || {}, data.totalDevices || 1);
    applyFilters();

  } catch (err) {
    console.error('Error loading analytics:', err);
  }
}

async function syncCloudflareEdge() {
  const btn = document.getElementById('sync-edge-btn');
  const icon = document.getElementById('sync-edge-icon');
  if (btn) btn.disabled = true;
  if (icon) icon.className = 'fa-solid fa-rotate fa-spin';

  try {
    const res = await fetch('/api/admin/active-devices/sync-now', {
      method: 'POST',
      credentials: 'same-origin',
      headers: getAuthHeaders()
    });
    if (!res.ok) throw new Error('HTTP ' + res.status);
    const json = await res.json();
    await loadAnalytics();
    alert(`✅ ${json.message || 'Synchronisation avec Cloudflare Edge réussie !'}`);
  } catch (err) {
    alert('❌ Erreur de synchronisation avec Cloudflare : ' + err.message);
  } finally {
    if (btn) btn.disabled = false;
    if (icon) icon.className = 'fa-solid fa-cloud-arrow-down';
  }
}

function renderVersionDistribution(versionMap, totalCount) {
  const container = document.getElementById('version-dist-container');
  const summary = document.getElementById('version-dist-summary');
  const entries = Object.entries(versionMap);

  if (entries.length === 0) {
    container.innerHTML = '<span style="color: var(--text-muted); font-size: 12px;">Aucun appareil enregistré.</span>';
    summary.textContent = '';
    return;
  }

  summary.textContent = `${entries.length} version(s) active(s)`;

  container.innerHTML = entries.map(([ver, count]) => {
    const pct = Math.round((count / totalCount) * 100);
    return `
      <div style="background: rgba(15,23,42,0.6); border: 1px solid var(--border); padding: 12px; border-radius: 8px;">
        <div style="display: flex; justify-content: space-between; font-size: 12px; font-weight: 700; margin-bottom: 4px;">
          <span><i class="fa-solid fa-tag" style="color: var(--primary);"></i> v${ver}</span>
          <span>${count} (${pct}%)</span>
        </div>
        <div class="progress-bar-container">
          <div class="progress-bar-fill" style="width: ${pct}%;"></div>
        </div>
      </div>
    `;
  }).join('');
}

function renderCountryDistribution(countryMap, totalCount) {
  const container = document.getElementById('country-dist-container');
  const summary = document.getElementById('country-dist-summary');
  const entries = Object.entries(countryMap);

  if (entries.length === 0) {
    container.innerHTML = '<span style="color: var(--text-muted); font-size: 12px;">Aucun pays détecté.</span>';
    summary.textContent = '';
    return;
  }

  summary.textContent = `${entries.length} pays`;

  container.innerHTML = entries.map(([code, count]) => {
    const pct = Math.round((count / totalCount) * 100);
    const cleanCode = String(code || 'DZ').toUpperCase();
    const name = COUNTRY_MAP[cleanCode] || `🌐 ${cleanCode}`;
    return `
      <div style="background: rgba(15,23,42,0.6); border: 1px solid var(--border); padding: 8px 12px; border-radius: 8px; display: inline-flex; align-items: center; gap: 8px;">
        <span style="font-size: 12px; font-weight: 700;">${name}</span>
        <span class="badge" style="background: rgba(6,182,212,0.2); color: #06b6d4;">${count} (${pct}%)</span>
      </div>
    `;
  }).join('');
}

function applyFilters() {
  const searchVal = (document.getElementById('search-input')?.value || '').toLowerCase();
  const platFilter = document.getElementById('platform-filter')?.value || 'all';
  const typeFilter = document.getElementById('type-filter')?.value || 'all';
  const actFilter = document.getElementById('activity-filter')?.value || 'all';

  const now = Date.now();
  const FIVE_MIN = 5 * 60 * 1000;
  const ONE_HOUR = 60 * 60 * 1000;
  const ONE_DAY = 24 * 60 * 60 * 1000;
  const THIRTY_DAYS = 30 * ONE_DAY;

  const filtered = rawDeviceList.filter(d => {
    const countryName = (COUNTRY_MAP[(d.country || '').toUpperCase()] || '').toLowerCase();
    const matchesSearch = !searchVal || 
      d.installId.toLowerCase().includes(searchVal) || 
      (d.appVersion || '').toLowerCase().includes(searchVal) ||
      (d.platform || '').toLowerCase().includes(searchVal) ||
      (d.country || '').toLowerCase().includes(searchVal) ||
      countryName.includes(searchVal) ||
      (d.deviceModel || '').toLowerCase().includes(searchVal);

    const matchesPlat = platFilter === 'all' || d.platform === platFilter;

    let matchesType = true;
    if (typeFilter === 'external') matchesType = !d.isAdminDevice;
    if (typeFilter === 'admin') matchesType = !!d.isAdminDevice;

    const diffMs = now - (new Date(d.lastSeen).getTime() || 0);
    let matchesAct = true;
    if (actFilter === 'live') matchesAct = diffMs <= FIVE_MIN;
    if (actFilter === 'recent') matchesAct = diffMs <= ONE_HOUR;
    if (actFilter === 'dau') matchesAct = diffMs <= ONE_DAY;
    if (actFilter === 'mau') matchesAct = diffMs <= THIRTY_DAYS;

    return matchesSearch && matchesPlat && matchesType && matchesAct;
  });

  const countElem = document.getElementById('filtered-count');
  if (countElem) {
    countElem.textContent = `Appareils: ${filtered.length} / ${rawDeviceList.length}`;
  }

  const tbody = document.getElementById('device-table-body');
  if (!tbody) return;

  if (filtered.length === 0) {
    tbody.innerHTML = '<tr><td colspan="10" style="text-align: center; color: var(--text-muted); padding: 24px;">Aucun appareil ne correspond aux filtres.</td></tr>';
    return;
  }

  tbody.innerHTML = filtered.map(d => {
    const isLive = d.isLiveNow;
    const isRecent = d.isRecent1h;
    let statusBadge = '<span class="badge" style="background: rgba(148,163,184,0.15); color: #94a3b8; border: 1px solid rgba(148,163,184,0.3);"><i class="fa-solid fa-moon"></i> Inactif</span>';
    if (isLive) {
      statusBadge = '<span class="badge" style="background: rgba(16,185,129,0.2); color: #10b981; border: 1px solid rgba(16,185,129,0.4);"><i class="fa-solid fa-circle" style="font-size:7px;"></i> 🟢 En Ligne (< 5m)</span>';
    } else if (isRecent) {
      statusBadge = '<span class="badge" style="background: rgba(245,158,11,0.15); color: #f59e0b; border: 1px solid rgba(245,158,11,0.3);"><i class="fa-solid fa-bolt"></i> Récent (< 1h)</span>';
    }

    return `
      <tr>
        <td><span class="install-id-code" title="${d.installId}">${d.installId}</span></td>
        <td>
          ${d.isAdminDevice ? 
            '<span class="badge" style="background: rgba(168,85,247,0.15); color: #a855f7; border: 1px solid rgba(168,85,247,0.3);"><i class="fa-solid fa-crown"></i> Dev / Admin</span>' : 
            '<span class="badge" style="background: rgba(16,185,129,0.15); color: #10b981; border: 1px solid rgba(16,185,129,0.3);"><i class="fa-solid fa-user"></i> Externe</span>'}
        </td>
        <td>${statusBadge}</td>
        <td>${getPlatformBadge(d.platform)}</td>
        <td><strong>v${d.appVersion || '1.21.0'}</strong></td>
        <td>${getCountryBadge(d.country)}</td>
        <td>${d.firstSeen ? new Date(d.firstSeen).toLocaleDateString('fr-FR') : '--'}</td>
        <td>${new Date(d.lastSeen).toLocaleString('fr-FR')}</td>
        <td><strong>${d.requestCount || 1}</strong></td>
        <td>
          <div style="display: flex; gap: 4px;">
            <button class="btn btn-outline" style="padding: 3px 8px; font-size: 10px; min-height: auto;" onclick="inspectDevice('${d.installId}')">
              <i class="fa-solid fa-eye"></i> Voir
            </button>
            <button class="btn btn-outline" style="padding: 3px 8px; font-size: 10px; min-height: auto; ${d.isAdminDevice ? 'border-color: rgba(16,185,129,0.4); color: #10b981;' : 'border-color: rgba(168,85,247,0.4); color: #a855f7;'}" onclick="toggleAdminStatus('${d.installId}', ${!!d.isAdminDevice})" title="${d.isAdminDevice ? 'Basculer en Utilisateur Externe' : 'Basculer en Appareil Développeur/Admin'}">
              ${d.isAdminDevice ? '<i class="fa-solid fa-user"></i> -> Externe' : '<i class="fa-solid fa-crown"></i> -> Dev'}
            </button>
          </div>
        </td>
      </tr>
    `;
  }).join('');
}

function inspectDevice(id) {
  const dev = rawDeviceList.find(d => d.installId === id);
  if (!dev) return;

  const modalContent = document.getElementById('modal-content');
  modalContent.innerHTML = `
    <div><strong>Installation ID :</strong> <div class="install-id-code" style="max-width:100%; margin-top:4px; white-space:normal;">${dev.installId}</div></div>
    <div><strong>Type Appareil :</strong> ${dev.isAdminDevice ? '👑 Appareil Développeur / Admin' : '👤 Utilisateur Externe'}</div>
    <div><strong>Plateforme :</strong> ${dev.platform === 'android_apk' ? 'Android APK (Application Native)' : 'Web PWA (Navigateur / Cloudflare CDN)'}</div>
    <div><strong>Version Installée :</strong> v${dev.appVersion || '1.21.0'}</div>
    <div><strong>Pays & Région :</strong> ${getCountryBadge(dev.country)} ${dev.city ? `(${dev.city})` : ''}</div>
    <div><strong>Modèle / Appareil :</strong> ${dev.deviceModel || 'Standard Web Client'}</div>
    <div><strong>Résolution Écran :</strong> ${dev.screen || 'Non renseignée'}</div>
    <div><strong>Dernière IP :</strong> ${dev.lastIp || 'N/A (Masquée Edge)'}</div>
    <div><strong>Premier Accès :</strong> ${dev.firstSeen ? new Date(dev.firstSeen).toLocaleString('fr-FR') : 'N/A'}</div>
    <div><strong>Dernière Activité :</strong> ${new Date(dev.lastSeen).toLocaleString('fr-FR')}</div>
    <div><strong>Volume Total de Requêtes :</strong> ${dev.requestCount || 1}</div>
  `;

  document.getElementById('inspect-modal').classList.add('active');
}

async function toggleAdminStatus(id, currentStatus) {
  const newStatus = !currentStatus;
  try {
    const res = await fetch('/api/admin/active-devices/toggle-admin', {
      method: 'POST',
      credentials: 'same-origin',
      headers: getAuthHeaders(),
      body: JSON.stringify({ installId: id, isAdmin: newStatus })
    });
    if (!res.ok) throw new Error('HTTP ' + res.status);
    await loadAnalytics();
  } catch (err) {
    alert('❌ Erreur lors du changement de statut : ' + err.message);
  }
}

function openResetModal() {
  document.getElementById('reset-modal').classList.add('active');
}

function closeResetModal() {
  document.getElementById('reset-modal').classList.remove('active');
}

async function confirmResetTelemetry() {
  closeResetModal();
  try {
    const res = await fetch('/api/admin/active-devices/reset', {
      method: 'POST',
      credentials: 'same-origin',
      headers: getAuthHeaders()
    });
    if (!res.ok) throw new Error('HTTP ' + res.status);
    const json = await res.json();
    alert('✅ ' + (json.message || 'Télémétrie réinitialisée.'));
    await loadAnalytics();
  } catch (err) {
    alert('❌ Erreur lors de la réinitialisation : ' + err.message);
  }
}

function closeModal() {
  document.getElementById('inspect-modal').classList.remove('active');
}

function toggleAutoRefresh(enabled) {
  if (enabled) {
    autoRefreshTimer = setInterval(() => loadAnalytics(false), 10000);
  } else if (autoRefreshTimer) {
    clearInterval(autoRefreshTimer);
    autoRefreshTimer = null;
  }
}

function exportDataCSV() {
  if (!rawDeviceList || rawDeviceList.length === 0) {
    alert('Aucune donnée à exporter.');
    return;
  }

  const headers = ['InstallID', 'Type', 'Platform', 'AppVersion', 'Country', 'City', 'Screen', 'DeviceModel', 'FirstSeen', 'LastSeen', 'RequestCount'];
  const rows = rawDeviceList.map(d => [
    `"${d.installId}"`,
    d.isAdminDevice ? '"Admin"' : '"Externe"',
    `"${d.platform}"`,
    `"v${d.appVersion || '1.21.0'}"`,
    `"${d.country || 'DZ'}"`,
    `"${d.city || ''}"`,
    `"${d.screen || ''}"`,
    `"${d.deviceModel || ''}"`,
    `"${d.firstSeen || ''}"`,
    `"${d.lastSeen || ''}"`,
    d.requestCount || 1
  ]);

  const csvContent = 'data:text/csv;charset=utf-8,\uFEFF' + 
    [headers.join(','), ...rows.map(e => e.join(','))].join('\n');

  const encodedUri = encodeURI(csvContent);
  const link = document.createElement('a');
  link.setAttribute('href', encodedUri);
  link.setAttribute('download', `drcat_active_devices_${new Date().toISOString().slice(0,10)}.csv`);
  document.body.appendChild(link);
  link.click();
  document.body.removeChild(link);
}

document.addEventListener('DOMContentLoaded', () => loadAnalytics(true));
