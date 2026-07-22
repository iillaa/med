import * as api from '../../api.js';
import { showToast } from '../../utils.js';

export function renderAdminPdfTab(containerEl) {
  containerEl.innerHTML = `
    <div style="margin-bottom: 24px;">
      <h3 style="margin-top: 0; color: var(--text-primary); display: flex; align-items: center; gap: 8px;">
        <i class="fa-solid fa-file-pdf" style="color: var(--color-danger);"></i> Gestion des PDFs
      </h3>
      <p style="color: var(--text-secondary); font-size: 13.5px; line-height: 1.5; margin-bottom: 20px;">
        Uploadez des documents PDF médicaux. Ils seront automatiquement hashés, indexés et stockés dans la base de données de recherche pour l'application mobile.
      </p>
      
      <div class="pdf-upload-card" style="background: var(--bg-card); border: 1px dashed var(--border-color); border-radius: var(--radius-md); padding: 20px; text-align: center; display: flex; flex-direction: column; align-items: center; gap: 12px; transition: var(--transition-smooth);">
        <i class="fa-solid fa-cloud-arrow-up" style="font-size: 32px; color: var(--color-primary);"></i>
        <div style="font-size: 14px; font-weight: 500; color: var(--text-primary);">Déposez un fichier PDF ici ou cliquez pour parcourir</div>
        <input type="file" id="admin-pdf-upload-input" accept=".pdf" style="display: none;">
        <button class="btn-gradient-primary" id="admin-pdf-trigger-btn" style="padding: 8px 16px; border-radius: var(--radius-sm); border: none; color: white; cursor: pointer; font-weight: 600;">
          <i class="fa-solid fa-folder-open"></i> Sélectionner un fichier
        </button>
        <div id="admin-pdf-filename" style="font-size: 12px; color: var(--text-muted); max-width: 200px; white-space: nowrap; overflow: hidden; text-overflow: ellipsis; display: none;"></div>
        
        <button class="btn-outline-success" id="admin-pdf-submit-btn" disabled style="display: none; padding: 8px 16px; border-radius: var(--radius-sm); cursor: pointer; font-weight: 600; width: 100%; max-width: 250px;">
          <i class="fa-solid fa-upload"></i> Démarrer l'Indexation
        </button>
      </div>
    </div>

    <div style="margin-top: 24px; border-top: 1px solid var(--border-color); padding-top: 20px;">
      <h4 style="margin-top: 0; color: var(--text-primary); font-size: 14px;">🛠️ Outils de Développement</h4>
      <p style="color: var(--text-secondary); font-size: 12px; margin-bottom: 12px;">Accédez au laboratoire isolé pour tester les stratégies d'extraction (LlamaParse vs Offline).</p>
      <a href="/pdf_lab.html" target="_blank" style="display: inline-flex; align-items: center; gap: 6px; padding: 6px 12px; background: var(--bg-sidebar); border: 1px solid var(--border-color); color: var(--text-primary); text-decoration: none; border-radius: var(--radius-sm); font-size: 12px; transition: background 0.2s;">
        <i class="fa-solid fa-flask"></i> Ouvrir le Labo PDF
      </a>
    </div>
  `;

  attachPdfListeners();
}

function attachPdfListeners() {
  const fileInput = document.getElementById('admin-pdf-upload-input');
  const triggerBtn = document.getElementById('admin-pdf-trigger-btn');
  const fileNameEl = document.getElementById('admin-pdf-filename');
  const submitBtn = document.getElementById('admin-pdf-submit-btn');

  let currentFile = null;
  let base64Data = null;

  if (triggerBtn) {
    triggerBtn.addEventListener('click', () => fileInput.click());
  }

  if (fileInput) {
    fileInput.addEventListener('change', (e) => {
      const file = e.target.files[0];
      if (!file) {
        currentFile = null;
        base64Data = null;
        fileNameEl.style.display = 'none';
        submitBtn.style.display = 'none';
        submitBtn.disabled = true;
        return;
      }

      currentFile = file;
      fileNameEl.textContent = file.name;
      fileNameEl.style.display = 'block';
      submitBtn.style.display = 'flex';
      submitBtn.disabled = true;
      submitBtn.innerHTML = '<i class="fa-solid fa-spinner fa-spin"></i> Préparation...';

      const reader = new FileReader();
      reader.onload = (event) => {
        base64Data = event.target.result.split(',')[1];
        submitBtn.disabled = false;
        submitBtn.innerHTML = '<i class="fa-solid fa-upload"></i> Démarrer l\'Indexation';
      };
      reader.onerror = () => {
        showToast("Erreur lors de la lecture du fichier", "fa-triangle-exclamation", 4000);
      };
      reader.readAsDataURL(file);
    });
  }

  if (submitBtn) {
    submitBtn.addEventListener('click', async () => {
      if (!currentFile || !base64Data) return;

      submitBtn.disabled = true;
      submitBtn.innerHTML = '<i class="fa-solid fa-spinner fa-spin"></i> Envoi en cours...';

      try {
        const res = await api.fetchWithTimeout(api.getApiUrl('/api/admin/upload-pdf'), {
          method: 'POST',
          headers: api.getHeaders({ 'Content-Type': 'application/json' }),
          body: JSON.stringify({ filename: currentFile.name, base64Data })
        });
        
        if (!res.ok) {
          const errData = await res.json().catch(() => ({}));
          throw new Error(errData.error || "Failed to upload PDF");
        }

        showToast("Fichier PDF uploadé avec succès! L'indexation tourne en arrière-plan.", "fa-circle-check", 4000);
        
        // Reset UI
        fileInput.value = '';
        currentFile = null;
        base64Data = null;
        fileNameEl.style.display = 'none';
        submitBtn.style.display = 'none';

      } catch (err) {
        console.error('[Admin PDF]', err);
        showToast(`Échec: ${err.message}`, "fa-triangle-exclamation", 4000);
        submitBtn.disabled = false;
        submitBtn.innerHTML = '<i class="fa-solid fa-rotate-right"></i> Réessayer';
      }
    });
  }
}
