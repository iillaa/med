/**
 * Admin Panel — Kill Switch & Version Control Tab
 */

import * as api from '../../api.js';

function escapeHTML(str) {
  return String(str || '').replace(/[&<>'"]/g, 
    tag => ({ '&': '&amp;', '<': '&lt;', '>': '&gt;', "'": '&#39;', '"': '&quot;' }[tag] || tag)
  );
}

export async function renderAdminVersionTab(containerEl) {
  if (!containerEl) return;

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
              ${isForced ? 'Toutes les versions antérieures à v' + escapeHTML(config.minVersion || '1.1.6') + ' sont actuellement bloquées.' : 'L\'application fonctionne normalement pour tous les utilisateurs.'}
            </p>
          </div>

          <button id="admin-toggle-killswitch-btn" style="padding: 10px 18px; font-size: 13px; font-weight: 700; border-radius: 8px; cursor: pointer; border: none; display: flex; align-items: center; gap: 8px; background: ${isForced ? 'var(--color-success)' : 'var(--color-danger)'}; color: #fff; box-shadow: var(--shadow-md); transition: all 0.2s;">
            <i class="${isForced ? 'fa-solid fa-lock-open' : 'fa-solid fa-lock'}"></i>
            ${isForced ? 'Désactiver le Kill Switch' : '🚨 Activer le Kill Switch'}
          </button>
        </div>

        <!-- Standalone Analytics Lab Link Banner -->
        <div style="background: var(--bg-card); border: 1px solid var(--border-color); border-radius: 12px; padding: 16px; display: flex; align-items: center; justify-content: space-between; flex-wrap: wrap; gap: 12px;">
          <div>
            <div style="font-size: 14px; font-weight: 700; color: var(--text-primary); display: flex; align-items: center; gap: 8px;">
              <i class="fa-solid fa-chart-line" style="color: var(--color-primary);"></i> Analytics Lab & Télémétrie
            </div>
            <div style="font-size: 12px; color: var(--text-secondary); margin-top: 2px;">
              Consultez les appareils actifs (DAU/MAU) et la répartition des versions installées dans une interface dédiée.
            </div>
          </div>
          <a href="/analytics_lab.html" target="_blank" rel="noopener" style="padding: 9px 16px; font-size: 12px; font-weight: 700; border-radius: 8px; text-decoration: none; display: inline-flex; align-items: center; gap: 8px; background: rgba(6, 182, 212, 0.15); color: #06b6d4; border: 1px solid rgba(6, 182, 212, 0.3); transition: all 0.2s;">
            <i class="fa-solid fa-arrow-up-right-from-square"></i> Ouvrir Analytics Lab
          </a>
        </div>

        <!-- Configuration Form Card -->
        <div style="background: var(--bg-card); border: 1px solid var(--border-color); border-radius: 12px; padding: 20px;">
          <h4 style="margin: 0 0 16px 0; font-size: 15px; font-weight: 700; color: var(--text-primary); display: flex; align-items: center; gap: 8px;">
            <i class="fa-solid fa-sliders"></i> Configuration des Versions & Liens de Téléchargement
          </h4>

          <form id="admin-version-form" style="display: flex; flex-direction: column; gap: 14px;">
            <div style="display: grid; grid-template-columns: repeat(auto-fit, minmax(200px, 1fr)); gap: 14px;">
              <div>
                <label style="display: block; font-size: 12px; font-weight: 600; color: var(--text-secondary); margin-bottom: 4px;">Version Minimale Requise (minVersion)</label>
                <input type="text" id="ver-input-min" value="${escapeHTML(config.minVersion || '1.1.6')}" style="width: 100%; padding: 8px 12px; border-radius: 6px; border: 1px solid var(--border-color); background: var(--bg-input); color: var(--text-primary); font-size: 13px; font-weight: 600;">
              </div>

              <div>
                <label style="display: block; font-size: 12px; font-weight: 600; color: var(--text-secondary); margin-bottom: 4px;">Dernière Version Disponible (latestVersion)</label>
                <input type="text" id="ver-input-latest" value="${escapeHTML(config.latestVersion || '1.1.6')}" style="width: 100%; padding: 8px 12px; border-radius: 6px; border: 1px solid var(--border-color); background: var(--bg-input); color: var(--text-primary); font-size: 13px; font-weight: 600;">
              </div>
            </div>

            <div>
              <label style="display: block; font-size: 12px; font-weight: 600; color: var(--text-secondary); margin-bottom: 4px;">Message de Notification</label>
              <textarea id="ver-input-message" rows="2" style="width: 100%; padding: 8px 12px; border-radius: 6px; border: 1px solid var(--border-color); background: var(--bg-input); color: var(--text-primary); font-size: 13px; resize: vertical;">${escapeHTML(config.updateMessage || '')}</textarea>
            </div>

            <div style="border-top: 1px dashed var(--border-color); padding-top: 12px; margin-top: 4px;">
              <h5 style="margin: 0 0 10px 0; font-size: 13px; font-weight: 700; color: var(--text-primary);">Sources de Téléchargement Multi-Boutons</h5>
              
              <div style="display: flex; flex-direction: column; gap: 10px;">
                <div>
                  <label style="font-size: 11px; font-weight: 600; color: var(--text-secondary);">Bouton 1 : Lien Uptodown Store</label>
                  <input type="url" id="ver-input-uptodown" value="${escapeHTML(links.uptodownUrl || '')}" placeholder="https://dr-cat.en.uptodown.com/android" style="width: 100%; padding: 7px 10px; border-radius: 6px; border: 1px solid var(--border-color); background: var(--bg-input); color: var(--text-primary); font-size: 12px;">
                </div>

                <div>
                  <label style="font-size: 11px; font-weight: 600; color: var(--text-secondary);">Bouton 2 : Lien Canal Telegram Officiel</label>
                  <input type="url" id="ver-input-telegram" value="${escapeHTML(links.telegramUrl || '')}" placeholder="https://t.me/DrCatOfficialApp" style="width: 100%; padding: 7px 10px; border-radius: 6px; border: 1px solid var(--border-color); background: var(--bg-input); color: var(--text-primary); font-size: 12px;">
                </div>

                <div>
                  <label style="font-size: 11px; font-weight: 600; color: var(--text-secondary);">Bouton 3 : Lien Direct Serveur / APK</label>
                  <input type="text" id="ver-input-direct" value="${escapeHTML(links.directServerUrl || '')}" placeholder="/download/drcat-latest.apk" style="width: 100%; padding: 7px 10px; border-radius: 6px; border: 1px solid var(--border-color); background: var(--bg-input); color: var(--text-primary); font-size: 12px;">
                </div>
              </div>
            </div>

            <div style="display: flex; justify-content: flex-end; margin-top: 10px;">
              <button type="submit" id="admin-save-version-btn" style="padding: 10px 20px; font-size: 13px; font-weight: 700; border-radius: 8px; cursor: pointer; border: none; background: var(--color-primary); color: #fff; box-shadow: var(--shadow-sm); display: flex; align-items: center; gap: 8px;">
                <i class="fa-solid fa-floppy-disk"></i> Enregistrer les Modifications
              </button>
            </div>
          </form>
        </div>
      </div>
    `;

    // Attach Toggle Kill Switch listener
    const toggleBtn = containerEl.querySelector('#admin-toggle-killswitch-btn');
    if (toggleBtn) {
      toggleBtn.addEventListener('click', async () => {
        try {
          const newStatus = !isForced;
          toggleBtn.disabled = true;
          toggleBtn.innerHTML = '<i class="fa-solid fa-spinner fa-spin"></i> Mise à jour...';
          
          await api.updateVersionConfigOnServer({ forceUpdateActive: newStatus });
          alert(`Statut du Kill Switch mis à jour : ${newStatus ? 'ACTIVÉ 🚨' : 'DÉSACTIVÉ 🟢'}`);
          renderAdminVersionTab(containerEl);
        } catch (err) {
          alert(`Erreur lors du basculement : ${err.message}`);
          renderAdminVersionTab(containerEl);
        }
      });
    }

    // Attach Form Submit listener
    const formEl = containerEl.querySelector('#admin-version-form');
    if (formEl) {
      formEl.addEventListener('submit', async (e) => {
        e.preventDefault();
        const submitBtn = formEl.querySelector('#admin-save-version-btn');
        try {
          submitBtn.disabled = true;
          submitBtn.innerHTML = '<i class="fa-solid fa-spinner fa-spin"></i> Enregistrement...';

          const payload = {
            minVersion: formEl.querySelector('#ver-input-min').value.trim(),
            latestVersion: formEl.querySelector('#ver-input-latest').value.trim(),
            updateMessage: formEl.querySelector('#ver-input-message').value.trim(),
            downloadLinks: {
              uptodownUrl: formEl.querySelector('#ver-input-uptodown').value.trim(),
              telegramUrl: formEl.querySelector('#ver-input-telegram').value.trim(),
              directServerUrl: formEl.querySelector('#ver-input-direct').value.trim()
            }
          };

          await api.updateVersionConfigOnServer(payload);
          alert('Configuration des versions enregistrée avec succès !');
          renderAdminVersionTab(containerEl);
        } catch (err) {
          alert(`Erreur lors de l'enregistrement : ${err.message}`);
          if (submitBtn) {
            submitBtn.disabled = false;
            submitBtn.innerHTML = '<i class="fa-solid fa-floppy-disk"></i> Enregistrer les Modifications';
          }
        }
      });
    }

  } catch (err) {
    containerEl.innerHTML = `<div style="padding: 20px; color: var(--color-danger);">Erreur de chargement de la configuration de version : ${escapeHTML(err.message)}</div>`;
  }
}
