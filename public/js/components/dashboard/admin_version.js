import * as api from '../../api.js';
import { showToast, escapeHTML } from '../../utils.js';

export async function renderAdminVersionTab(containerEl) {
  if (!containerEl) return;

  containerEl.innerHTML = `
    <div style="display: flex; align-items: center; justify-content: center; padding: 20px; color: var(--text-secondary);">
      <i class="fa-solid fa-spinner fa-spin" style="margin-right: 8px;"></i> Chargement de la configuration de version...
    </div>
  `;

  try {
    const config = await api.fetchVersionConfigOnServer();
    const isForced = !!config.forceUpdateActive;
    const links = config.downloadLinks || {};

    containerEl.innerHTML = `
      <div class="admin-version-panel" style="display: flex; flex-direction: column; gap: 20px;">
        <!-- Status Header Card -->
        <div style="background: ${isForced ? 'rgba(239, 68, 68, 0.15)' : 'rgba(16, 185, 129, 0.15)'}; border: 1px solid ${isForced ? 'rgba(239, 68, 68, 0.4)' : 'rgba(16, 185, 129, 0.4)'}; border-radius: 12px; padding: 18px; display: flex; align-items: center; justify-content: space-between; flex-wrap: wrap; gap: 12px;">
          <div>
            <h3 style="margin: 0 0 4px 0; font-size: 16px; font-weight: 700; color: var(--text-primary); display: flex; align-items: center; gap: 8px;">
              <i class="${isForced ? 'fa-solid fa-triangle-exclamation text-danger' : 'fa-solid fa-shield-check text-success'}"></i>
              Statut du Kill Switch : ${isForced ? '<span style="color: var(--color-danger);">ACTIVÉ (Mise à jour obligatoire)</span>' : '<span style="color: var(--color-success);">INACTIF (Accès normal)</span>'}
            </h3>
            <p style="margin: 0; font-size: 13px; color: var(--text-secondary);">
              ${isForced ? 'Toutes les versions antérieures à v' + escapeHTML(config.minVersion || '1.1.0') + ' sont actuellement bloquées.' : 'L\'application fonctionne normalement pour tous les utilisateurs.'}
            </p>
          </div>

          <button id="admin-toggle-killswitch-btn" style="padding: 10px 18px; font-size: 13px; font-weight: 700; border-radius: 8px; cursor: pointer; border: none; display: flex; align-items: center; gap: 8px; background: ${isForced ? 'var(--color-success)' : 'var(--color-danger)'}; color: #fff; box-shadow: var(--shadow-md); transition: all 0.2s;">
            <i class="${isForced ? 'fa-solid fa-lock-open' : 'fa-solid fa-lock'}"></i>
            ${isForced ? 'Désactiver le Kill Switch' : '🚨 Activer le Kill Switch'}
          </button>
        </div>

        <!-- Configuration Form Card -->
        <div style="background: var(--bg-card); border: 1px solid var(--border-color); border-radius: 12px; padding: 20px;">
          <h4 style="margin: 0 0 16px 0; font-size: 15px; font-weight: 700; color: var(--text-primary); display: flex; align-items: center; gap: 8px;">
            <i class="fa-solid fa-sliders"></i> Configuration des Versions & Liens de Téléchargement
          </h4>

          <form id="admin-version-form" style="display: flex; flex-direction: column; gap: 14px;">
            <div style="display: grid; grid-template-columns: repeat(auto-fit, minmax(200px, 1fr)); gap: 14px;">
              <div class="form-group" style="margin: 0;">
                <label style="display: block; font-size: 12px; font-weight: 600; color: var(--text-secondary); margin-bottom: 6px;">Version Minimale Requise (minVersion)</label>
                <input type="text" id="ver-min-input" value="${escapeHTML(config.minVersion || '1.1.0')}" style="width: 100%; padding: 8px 12px; background: var(--bg-input); border: 1px solid var(--border-color); color: var(--text-primary); border-radius: 6px; font-size: 13px; box-sizing: border-box;">
              </div>

              <div class="form-group" style="margin: 0;">
                <label style="display: block; font-size: 12px; font-weight: 600; color: var(--text-secondary); margin-bottom: 6px;">Dernière Version Disponible (latestVersion)</label>
                <input type="text" id="ver-latest-input" value="${escapeHTML(config.latestVersion || '1.1.0')}" style="width: 100%; padding: 8px 12px; background: var(--bg-input); border: 1px solid var(--border-color); color: var(--text-primary); border-radius: 6px; font-size: 13px; box-sizing: border-box;">
              </div>
            </div>

            <div class="form-group" style="margin: 0;">
              <label style="display: block; font-size: 12px; font-weight: 600; color: var(--text-secondary); margin-bottom: 6px;">Message de Notification</label>
              <textarea id="ver-msg-input" rows="2" style="width: 100%; padding: 8px 12px; background: var(--bg-input); border: 1px solid var(--border-color); color: var(--text-primary); border-radius: 6px; font-size: 13px; box-sizing: border-box;">${escapeHTML(config.updateMessage || '')}</textarea>
            </div>

            <hr style="border: none; border-top: 1px solid var(--border-color); margin: 6px 0;">

            <h5 style="margin: 0; font-size: 13.5px; font-weight: 700; color: var(--color-primary);"><i class="fa-solid fa-link"></i> Liens de Téléchargement Multi-Sources</h5>

            <div class="form-group" style="margin: 0;">
              <label style="display: block; font-size: 12px; font-weight: 600; color: var(--text-secondary); margin-bottom: 6px;"><i class="fa-solid fa-cloud-arrow-down" style="color: #00c875;"></i> Lien Uptodown (Button 1)</label>
              <input type="url" id="ver-uptodown-input" value="${escapeHTML(links.uptodownUrl || '')}" style="width: 100%; padding: 8px 12px; background: var(--bg-input); border: 1px solid var(--border-color); color: var(--text-primary); border-radius: 6px; font-size: 13px; box-sizing: border-box;">
            </div>

            <div class="form-group" style="margin: 0;">
              <label style="display: block; font-size: 12px; font-weight: 600; color: var(--text-secondary); margin-bottom: 6px;"><i class="fa-brands fa-telegram" style="color: #229ed9;"></i> Lien Canal Telegram (Button 2)</label>
              <input type="url" id="ver-telegram-input" value="${escapeHTML(links.telegramUrl || '')}" style="width: 100%; padding: 8px 12px; background: var(--bg-input); border: 1px solid var(--border-color); color: var(--text-primary); border-radius: 6px; font-size: 13px; box-sizing: border-box;">
            </div>

            <div class="form-group" style="margin: 0;">
              <label style="display: block; font-size: 12px; font-weight: 600; color: var(--text-secondary); margin-bottom: 6px;"><i class="fa-solid fa-globe" style="color: #06b6d4;"></i> Lien Direct Serveur / APK (Button 3)</label>
              <input type="text" id="ver-direct-input" value="${escapeHTML(links.directServerUrl || '')}" style="width: 100%; padding: 8px 12px; background: var(--bg-input); border: 1px solid var(--border-color); color: var(--text-primary); border-radius: 6px; font-size: 13px; box-sizing: border-box;">
            </div>

            <div style="display: flex; justify-content: flex-end; margin-top: 10px;">
              <button type="submit" id="ver-save-btn" style="padding: 10px 20px; background: var(--color-primary); color: #fff; border: none; border-radius: 8px; font-size: 13px; font-weight: 700; cursor: pointer; display: flex; align-items: center; gap: 8px; box-shadow: var(--shadow-md); transition: all 0.2s;">
                <i class="fa-solid fa-floppy-disk"></i> Enregistrer les Modifications
              </button>
            </div>
          </form>
        </div>
      </div>
    `;

    // Attach Toggle Kill Switch listener
    const toggleBtn = document.getElementById('admin-toggle-killswitch-btn');
    if (toggleBtn) {
      toggleBtn.addEventListener('click', async () => {
        const actionText = isForced ? 'désactiver' : 'ACTIVER';
        if (!confirm(`Voulez-vous vraiment ${actionText} la mise à jour obligatoire (Kill Switch) ?`)) return;

        try {
          showToast("Mise à jour du Kill Switch en cours...", "fa-spinner fa-spin", 1500);
          const updated = await api.updateVersionConfigOnServer({
            forceUpdateActive: !isForced,
            minVersion: document.getElementById('ver-min-input').value || '1.1.0',
            latestVersion: document.getElementById('ver-latest-input').value || '1.1.0'
          });

          if (updated.success) {
            showToast(`Kill Switch ${!isForced ? 'ACTIVÉ 🚨' : 'Désactivé 🟢'} avec succès !`, "fa-circle-check", 3500);
            renderAdminVersionTab(containerEl);
          }
        } catch (err) {
          console.error(err);
          showToast("Erreur: " + err.message, "fa-circle-exclamation", 4000);
        }
      });
    }

    // Attach Form Submit listener
    const form = document.getElementById('admin-version-form');
    if (form) {
      form.addEventListener('submit', async (e) => {
        e.preventDefault();
        try {
          showToast("Enregistrement de la configuration...", "fa-spinner fa-spin", 1500);
          const updated = await api.updateVersionConfigOnServer({
            minVersion: document.getElementById('ver-min-input').value,
            latestVersion: document.getElementById('ver-latest-input').value,
            updateMessage: document.getElementById('ver-msg-input').value,
            downloadLinks: {
              uptodownUrl: document.getElementById('ver-uptodown-input').value,
              telegramUrl: document.getElementById('ver-telegram-input').value,
              directServerUrl: document.getElementById('ver-direct-input').value
            }
          });

          if (updated.success) {
            showToast("Configuration enregistrée avec succès !", "fa-circle-check", 3000);
            renderAdminVersionTab(containerEl);
          }
        } catch (err) {
          console.error(err);
          showToast("Erreur: " + err.message, "fa-circle-exclamation", 4000);
        }
      });
    }

  } catch (err) {
    console.error("Error rendering Admin Version tab:", err);
    containerEl.innerHTML = `<div style="padding: 20px; color: var(--color-danger); text-align: center;">Erreur lors du chargement de la configuration de version.</div>`;
  }
}
