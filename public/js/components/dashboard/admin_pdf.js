import * as api from '../../api.js';
import { showToast } from '../../utils.js';

export function renderAdminPdfTab(containerEl) {
  containerEl.innerHTML = `
    <div style="margin-bottom: 20px;">
      <div style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 14px; flex-wrap: wrap; gap: 10px;">
        <div>
          <h3 style="margin: 0; color: var(--text-primary); font-size: 16px; display: flex; align-items: center; gap: 8px;">
            <i class="fa-solid fa-flask" style="color: var(--color-primary);"></i> Command Center des Laboratoires & IA
          </h3>
          <p style="color: var(--text-secondary); font-size: 13px; margin: 4px 0 0 0;">
            Accédez aux studios de développement, de génération de cas cliniques et d'extraction de documents médicaux :
          </p>
        </div>
      </div>

      <!-- 3 Featured Lab Cards Grid -->
      <div style="display: grid; grid-template-columns: repeat(auto-fit, minmax(280px, 1fr)); gap: 14px; margin-bottom: 24px;">
        
        <!-- CARD 1: CAT GENERATOR LAB -->
        <div style="background: var(--bg-card); border: 1px solid var(--border-color); border-radius: var(--radius-md, 8px); padding: 18px; display: flex; flex-direction: column; justify-content: space-between; gap: 14px; box-shadow: var(--shadow-sm); transition: transform 0.2s ease, border-color 0.2s ease;">
          <div>
            <div style="display: flex; align-items: center; justify-content: space-between; margin-bottom: 8px;">
              <div style="display: flex; align-items: center; gap: 10px;">
                <div style="width: 36px; height: 36px; border-radius: 8px; background: rgba(14, 165, 233, 0.12); color: var(--color-primary); display: flex; align-items: center; justify-content: center; font-size: 18px;">
                  <i class="fa-solid fa-stethoscope"></i>
                </div>
                <h4 style="margin: 0; font-size: 15px; font-weight: 700; color: var(--text-primary);">CAT Generator Lab</h4>
              </div>
              <span class="cat-badge" style="font-size: 10px;">V3.5 Dual-RAG</span>
            </div>
            <p style="font-size: 12.5px; color: var(--text-secondary); line-height: 1.5; margin: 0;">
              Générez, synthétisez et validez les fiches médicales avec Gemini Dual-RAG, checksum anti-hallucination et ordonnances conformes.
            </p>
          </div>
          <a href="/admin/cat_generator_lab.html" target="_blank" style="padding: 9px 14px; background: rgba(14, 165, 233, 0.1); border: 1px solid var(--color-primary); color: var(--color-primary); border-radius: 6px; text-decoration: none; font-size: 12.5px; font-weight: 700; display: flex; align-items: center; justify-content: center; gap: 8px; transition: all 0.2s ease;">
            <i class="fa-solid fa-arrow-up-right-from-square"></i> Ouvrir le Labo CATs V3
          </a>
        </div>

        <!-- CARD 2: QUIZ & STAGING LAB -->
        <div style="background: var(--bg-card); border: 1px solid rgba(16, 185, 129, 0.3); border-radius: var(--radius-md, 8px); padding: 18px; display: flex; flex-direction: column; justify-content: space-between; gap: 14px; box-shadow: var(--shadow-sm); transition: transform 0.2s ease, border-color 0.2s ease;">
          <div>
            <div style="display: flex; align-items: center; justify-content: space-between; margin-bottom: 8px;">
              <div style="display: flex; align-items: center; gap: 10px;">
                <div style="width: 36px; height: 36px; border-radius: 8px; background: rgba(16, 185, 129, 0.12); color: var(--color-success); display: flex; align-items: center; justify-content: center; font-size: 18px;">
                  <i class="fa-solid fa-brain"></i>
                </div>
                <h4 style="margin: 0; font-size: 15px; font-weight: 700; color: var(--text-primary);">Quiz Lab & Staging</h4>
              </div>
              <span class="cat-badge" style="font-size: 10px; background: rgba(16, 185, 129, 0.2); color: var(--color-success);">Docimologie V2</span>
            </div>
            <p style="font-size: 12.5px; color: var(--text-secondary); line-height: 1.5; margin: 0;">
              Concevez et modérez les cas cliniques progressifs (KFQs/SCTs), QCMs d'ordonnances, justifications et publication du staging.
            </p>
          </div>
          <a href="/admin/quiz_lab.html" target="_blank" style="padding: 9px 14px; background: linear-gradient(135deg, var(--color-success), #059669); color: #fff; border: none; border-radius: 6px; text-decoration: none; font-size: 12.5px; font-weight: 700; display: flex; align-items: center; justify-content: center; gap: 8px; box-shadow: 0 2px 8px rgba(16, 185, 129, 0.3); transition: all 0.2s ease;">
            <i class="fa-solid fa-arrow-up-right-from-square"></i> Ouvrir le Labo Quiz V2
          </a>
        </div>

        <!-- CARD 3: PDF MASTER LAB -->
        <div style="background: var(--bg-card); border: 1px solid var(--border-color); border-radius: var(--radius-md, 8px); padding: 18px; display: flex; flex-direction: column; justify-content: space-between; gap: 14px; box-shadow: var(--shadow-sm); transition: transform 0.2s ease, border-color 0.2s ease;">
          <div>
            <div style="display: flex; align-items: center; justify-content: space-between; margin-bottom: 8px;">
              <div style="display: flex; align-items: center; gap: 10px;">
                <div style="width: 36px; height: 36px; border-radius: 8px; background: rgba(239, 68, 68, 0.12); color: var(--color-danger); display: flex; align-items: center; justify-content: center; font-size: 18px;">
                  <i class="fa-solid fa-file-pdf"></i>
                </div>
                <h4 style="margin: 0; font-size: 15px; font-weight: 700; color: var(--text-primary);">PDF Lab & Slicer</h4>
              </div>
              <span class="cat-badge" style="font-size: 10px;">84 Livres</span>
            </div>
            <p style="font-size: 12.5px; color: var(--text-secondary); line-height: 1.5; margin: 0;">
              Découpez des sections de manuels, extrayez le texte brut des cours, synchronisez la table des matières GPS et compressez pour APK.
            </p>
          </div>
          <a href="/admin/pdf_lab.html" target="_blank" style="padding: 9px 14px; background: rgba(239, 68, 68, 0.1); border: 1px solid rgba(239, 68, 68, 0.4); color: var(--color-danger); border-radius: 6px; text-decoration: none; font-size: 12.5px; font-weight: 700; display: flex; align-items: center; justify-content: center; gap: 8px; transition: all 0.2s ease;">
            <i class="fa-solid fa-arrow-up-right-from-square"></i> Ouvrir le Labo PDF Master
          </a>
        </div>

      </div>

      <!-- Quick Compact PDF Upload Strip -->
      <div style="background: rgba(0,0,0,0.15); border: 1px dashed var(--border-color); border-radius: var(--radius-md, 8px); padding: 14px 18px; display: flex; align-items: center; justify-content: space-between; flex-wrap: wrap; gap: 12px;">
        <div style="display: flex; align-items: center; gap: 10px;">
          <i class="fa-solid fa-cloud-arrow-up" style="font-size: 20px; color: var(--color-primary);"></i>
          <div>
            <div style="font-size: 13px; font-weight: 600; color: var(--text-primary);">Upload Rapide d'un nouveau document PDF</div>
            <div style="font-size: 11.5px; color: var(--text-muted);">Ajout immédiat au corpus médical avec auto-indexation.</div>
          </div>
        </div>
        <div style="display: flex; align-items: center; gap: 8px;">
          <input type="file" id="admin-pdf-upload-input" accept=".pdf" style="display: none;">
          <button class="action-btn" id="admin-pdf-trigger-btn" style="padding: 6px 12px; font-size: 12px; display: flex; align-items: center; gap: 6px;">
            <i class="fa-solid fa-folder-open"></i> Parcourir
          </button>
          <span id="admin-pdf-filename" style="font-size: 11.5px; color: var(--text-muted); max-width: 150px; white-space: nowrap; overflow: hidden; text-overflow: ellipsis; display: none;"></span>
          <button class="btn-outline-success" id="admin-pdf-submit-btn" disabled style="display: none; padding: 6px 12px; font-size: 12px; border-radius: 4px; cursor: pointer; font-weight: 600;">
            <i class="fa-solid fa-upload"></i> Indexer
          </button>
        </div>
      </div>

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
