import { state } from '../../state.js';
import { parsePrescriptionText } from '../../utils.js';

export function renderPrescription(text, cat) {
  const wsPrescription = document.getElementById('workspace-prescription');
  const selector = document.getElementById('prescription-variants-selector');
  const stampCodeEl = document.getElementById('stamp-code');

  const currentCat = cat || state.activeCat;

  if (stampCodeEl) {
    const catId = currentCat && currentCat.id !== undefined ? String(currentCat.id).padStart(2, '0') : '01';
    const year = new Date().getFullYear();
    stampCodeEl.textContent = `N° ${catId}/CAT-${year}`;
  }

  if (!wsPrescription) return;

  const rawText = text || currentCat?.ordonnance || currentCat?.prescription || '';

  if (!rawText) {
    wsPrescription.innerHTML = 'Pas d\'ordonnance type rédigée.';
    if (selector) selector.style.display = 'none';
    state.prescriptionVariants = [];
    return;
  }

  state.prescriptionVariants = parsePrescriptionText(rawText);


  if (state.prescriptionVariants.length <= 1) {
    if (selector) selector.style.display = 'none';
    wsPrescription.textContent = text;
  } else {
    if (selector) {
      selector.style.display = 'flex';
      selector.innerHTML = '';

      if (state.activePrescriptionVariantIndex >= state.prescriptionVariants.length) {
        state.activePrescriptionVariantIndex = 0;
      }

      state.prescriptionVariants.forEach((v, idx) => {
        const pill = document.createElement('button');
        pill.className = `status-pill ${idx === state.activePrescriptionVariantIndex ? 'active' : ''}`;
        pill.style.fontSize = '12px';
        pill.style.padding = '5px 12px';
        pill.textContent = v.title;

        pill.addEventListener('click', () => {
          state.activePrescriptionVariantIndex = idx;
          selector.querySelectorAll('.status-pill').forEach((p, i) => {
            if (i === idx) p.classList.add('active');
            else p.classList.remove('active');
          });
          wsPrescription.textContent = v.content;
        });

        selector.appendChild(pill);
      });
    }

    const activeVar = state.prescriptionVariants[state.activePrescriptionVariantIndex] || state.prescriptionVariants[0];
    wsPrescription.textContent = activeVar ? activeVar.content : text;
  }
}
