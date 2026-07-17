import { state } from '../../state.js';
import { parsePrescriptionText } from '../../utils.js';

export function renderPrescription(text) {
  const wsPrescription = document.getElementById('prescription-text');
  const selector = document.getElementById('prescription-variants-selector');
  if (!wsPrescription) return;

  if (!text) {
    wsPrescription.innerHTML = 'Pas d\'ordonnance type rédigée.';
    if (selector) selector.style.display = 'none';
    state.prescriptionVariants = [];
    return;
  }

  state.prescriptionVariants = parsePrescriptionText(text);

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
