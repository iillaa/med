/**
 * Dr.CAT — Admin Dashboard Telemetry & Crash Reports Tab
 * Displays incoming crash reports and mobile debug logs sent by users.
 */

import * as api from '../../api.js';
import { escapeHTML, showToast } from '../../utils.js';

export async function renderAdminTelemetryTab(container) {
  if (!container) return;

  container.innerHTML = `
    <div style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 12px;">
      <div>
        <h4 style="margin: 0; color: var(--color-primary); font-size: 14.5px; display: flex; align-items: center; gap: 8px;">
          <i class="fa-solid fa-bug"></i> Rapports de Crash & Diagnostics Reçus
        </h4>
        <p class="block-desc" style="margin: 4px 0 0 0;">Inspectez les erreurs et traces de vos collègues/testeurs transmises en 1 clic :</p>
      </div>
      <div style="display: flex; gap: 8px;">
        <button id="admin-telemetry-refresh-btn" class="action-btn" style="padding: 6px 12px; font-size: 11.5px; display: flex; align-items: center; gap: 6px; background: rgba(6,182,212,0.1); border: 1px solid var(--color-primary); color: var(--color-primary); border-radius: 4px; cursor: pointer;">
          <i class="fa-solid fa-arrows-rotate"></i> Actualiser
        </button>
        <button id="admin-telemetry-clear-all-btn" class="action-btn" style="padding: 6px 12px; font-size: 11.5px; display: flex; align-items: center; gap: 6px; background: rgba(239,68,68,0.1); border: 1px solid var(--color-danger); color: var(--color-danger); border-radius: 4px; cursor: pointer;">
          <i class="fa-solid fa-trash-can"></i> Tout Effacer
        </button>
      </div>
    </div>

    <div id="admin-telemetry-list" style="display: flex; flex-direction: column; gap: 12px; margin-top: 16px;">
      <p class="text-muted text-center" style="padding: 20px 0;"><i class="fa-solid fa-spinner fa-spin"></i> Chargement des rapports...</p>
    </div>
  `;

  const refreshBtn = container.querySelector('#admin-telemetry-refresh-btn');
  const clearAllBtn = container.querySelector('#admin-telemetry-clear-all-btn');
  const listEl = container.querySelector('#admin-telemetry-list');

  async function loadReports(isManualRefresh = false) {
    try {
      if (isManualRefresh && refreshBtn) {
        refreshBtn.disabled = true;
        refreshBtn.innerHTML = `<i class="fa-solid fa-arrows-rotate fa-spin"></i> Actualisation...`;
      } else {
        listEl.innerHTML = `<p class="text-muted text-center" style="padding: 20px 0;"><i class="fa-solid fa-spinner fa-spin"></i> Chargement des rapports...</p>`;
      }

      const reports = await api.fetchTelemetryReports();
      renderReportsList(reports);

      if (isManualRefresh) {
        showToast("Flux d'incidents actualisé.", "fa-check", 2000);
      }
    } catch (err) {
      console.error('[AdminTelemetry] Failed to load reports:', err);
      listEl.innerHTML = `<p class="text-danger text-center" style="padding: 20px 0;">Erreur lors de la récupération des rapports : ${escapeHTML(err.message)}</p>`;
    } finally {
      if (refreshBtn) {
        refreshBtn.disabled = false;
        refreshBtn.innerHTML = `<i class="fa-solid fa-arrows-rotate"></i> Actualiser`;
      }
    }
  }

  function renderReportsList(reports) {
    if (!Array.isArray(reports) || reports.length === 0) {
      listEl.innerHTML = `
        <div style="text-align: center; padding: 32px 16px; background: var(--surface-card); border-radius: var(--radius-md); border: 1px dashed var(--border-color);">
          <i class="fa-solid fa-shield-heart" style="font-size: 32px; color: var(--color-success); margin-bottom: 8px;"></i>
          <p style="margin: 0; font-weight: 600; color: var(--text-primary);">Aucun crash ni rapport signalé !</p>
          <p style="margin: 4px 0 0 0; font-size: 12px; color: var(--text-muted);">L'application fonctionne normalement sur tous les appareils connectés.</p>
        </div>
      `;
      return;
    }

    listEl.innerHTML = reports.map(r => {
      const firstSeenStr = new Date(r.firstSeen || r.timestamp || Date.now()).toLocaleTimeString('fr-FR', { hour: '2-digit', minute: '2-digit' });
      const lastSeenStr = new Date(r.lastSeen || r.timestamp || Date.now()).toLocaleString('fr-FR');
      const dev = r.device || {};
      const occurrences = r.occurrences || 1;
      const severity = r.severity || (occurrences >= 20 ? 'critical' : (occurrences >= 5 ? 'warning' : 'info'));
      
      let severityBadge = '<span style="background: #059669; color: #fff; font-size: 10px; font-weight: 700; padding: 2px 7px; border-radius: 4px;">🟢 MINEUR</span>';
      let cardBorder = 'var(--border-color)';

      if (severity === 'critical') {
        severityBadge = '<span style="background: #ef4444; color: #fff; font-size: 10px; font-weight: 800; padding: 2px 7px; border-radius: 4px; box-shadow: 0 0 8px rgba(239,68,68,0.5); animation: pulse 2s infinite;"><i class="fa-solid fa-triangle-exclamation"></i> 🔴 PANNE GLOBALE</span>';
        cardBorder = '#ef4444';
      } else if (severity === 'warning') {
        severityBadge = '<span style="background: #f59e0b; color: #000; font-size: 10px; font-weight: 700; padding: 2px 7px; border-radius: 4px;"><i class="fa-solid fa-bell"></i> 🟠 FRÉQUENT</span>';
        cardBorder = '#f59e0b';
      }

      // Format affected devices list
      let devicesHtml = '';
      if (r.affectedDevices && typeof r.affectedDevices === 'object') {
        devicesHtml = Object.entries(r.affectedDevices).map(([mod, count]) => `
          <span style="font-size: 11px; background: rgba(255,255,255,0.06); border: 1px solid var(--border-color); padding: 1px 6px; border-radius: 4px; color: var(--text-secondary);">
            <i class="fa-solid fa-mobile-screen"></i> ${escapeHTML(mod)} <strong>(${count})</strong>
          </span>
        `).join(' ');
      } else {
        devicesHtml = `
          <span style="font-size: 11px; background: rgba(255,255,255,0.06); border: 1px solid var(--border-color); padding: 1px 6px; border-radius: 4px; color: var(--text-secondary);">
            <i class="fa-solid fa-mobile-screen"></i> ${escapeHTML(dev.model || 'Inconnu')}
          </span>
        `;
      }
      
      const logsCount = Array.isArray(r.logs) ? r.logs.length : 0;
      const logsHtml = logsCount > 0 
        ? r.logs.map(l => `<div style="font-family: monospace; font-size: 11px; padding: 2px 0; color: ${l.level === 'error' ? '#f87171' : (l.level === 'warn' ? '#fbbf24' : 'var(--text-secondary)')};">[${escapeHTML(l.timestamp || '')}] [${escapeHTML(l.level || 'log')}] ${escapeHTML(l.message || '')}</div>`).join('')
        : '<p class="text-muted" style="font-size: 11px; margin: 0;">Aucun log joint.</p>';

      return `
        <div class="telemetry-card" style="background: var(--surface-card); border: 1.5px solid ${cardBorder}; border-radius: var(--radius-md); padding: 14px; box-shadow: var(--shadow-sm);">
          <div style="display: flex; justify-content: space-between; align-items: flex-start; gap: 8px; margin-bottom: 8px;">
            <div style="display: flex; align-items: center; gap: 8px; flex-wrap: wrap;">
              ${severityBadge}
              <span style="background: rgba(14,116,144,0.15); color: var(--color-primary); font-size: 11px; font-weight: 700; padding: 2px 8px; border-radius: 4px;">
                ⚡ ${occurrences} ${occurrences > 1 ? 'événements' : 'événement'}
              </span>
              <span style="font-size: 11px; color: var(--text-muted);">
                <i class="fa-regular fa-clock"></i> Dernier: ${escapeHTML(lastSeenStr)}
              </span>
              <span style="font-size: 10.5px; color: var(--text-muted); font-family: monospace;">
                #${escapeHTML(r.fingerprint || r.id || 'incident')}
              </span>
            </div>
            <button class="delete-report-btn" data-id="${escapeHTML(r.id)}" title="Supprimer cet incident" style="background: none; border: none; color: var(--text-muted); cursor: pointer; padding: 4px 8px; border-radius: 4px; font-size: 12px; transition: color 0.2s;">
              <i class="fa-solid fa-trash"></i>
            </button>
          </div>

          <div style="background: rgba(239,68,68,0.08); border-left: 3px solid #ef4444; padding: 8px 12px; border-radius: 4px; margin-bottom: 10px;">
            <p style="margin: 0; font-family: monospace; font-size: 12px; color: var(--text-primary); font-weight: 600; word-break: break-word;">
              ${escapeHTML(r.error || 'Erreur inconnue')}
            </p>
          </div>

          <div style="margin-bottom: 10px; display: flex; align-items: center; gap: 6px; flex-wrap: wrap;">
            <span style="font-size: 11px; color: var(--text-muted); font-weight: 600;">Appareils touchés :</span>
            ${devicesHtml}
          </div>

          ${r.stack ? `
            <details style="margin-bottom: 8px;">
              <summary style="font-size: 11.5px; color: var(--color-primary); cursor: pointer; font-weight: 500;">
                <i class="fa-solid fa-code"></i> Afficher la pile d'exécution (Stack trace)
              </summary>
              <pre style="margin: 6px 0 0 0; background: rgba(0,0,0,0.25); padding: 8px; border-radius: 4px; font-size: 10.5px; max-height: 160px; overflow-y: auto; color: var(--text-secondary); white-space: pre-wrap;">${escapeHTML(r.stack)}</pre>
            </details>
          ` : ''}

          ${logsCount > 0 ? `
            <details>
              <summary style="font-size: 11.5px; color: var(--color-primary); cursor: pointer; font-weight: 500;">
                <i class="fa-solid fa-list-check"></i> Traces console (${logsCount} logs)
              </summary>
              <div style="margin-top: 6px; background: rgba(0,0,0,0.25); padding: 8px; border-radius: 4px; max-height: 160px; overflow-y: auto;">
                ${logsHtml}
              </div>
            </details>
          ` : ''}
        </div>
      `;
    }).join('');

    // Attach individual delete buttons
    listEl.querySelectorAll('.delete-report-btn').forEach(btn => {
      btn.addEventListener('click', async () => {
        const id = btn.getAttribute('data-id');
        if (!id) return;
        try {
          await api.deleteTelemetryReportOnServer(id);
          showToast("Rapport supprimé.", "fa-check", 2000);
          loadReports();
        } catch (err) {
          showToast("Erreur lors de la suppression.", "fa-triangle-exclamation", 3000);
        }
      });
    });
  }

  if (refreshBtn) {
    refreshBtn.addEventListener('click', () => loadReports(true));
  }

  if (clearAllBtn) {
    clearAllBtn.addEventListener('click', async () => {
      if (!confirm("Voulez-vous vraiment effacer tous les rapports de crash enregistrés ?")) return;
      try {
        await api.deleteTelemetryReportOnServer('all');
        showToast("Tous les rapports ont été effacés.", "fa-check", 2000);
        loadReports();
      } catch (err) {
        showToast("Erreur lors de la suppression.", "fa-triangle-exclamation", 3000);
      }
    });
  }

  // Initial load
  loadReports();
}
