/**
 * public/js/components/workspace/prescription.js
 * 
 * Dr.CAT — Module de Gestion et Rendu de l'Ordonnance Type
 * Dual-View Architecture:
 * - ⚡ Mode Express (Format Prescription de Cabinet / 70%+ des cas)
 * - 📖 Mode Détaillé (Protocole Clinique Complet, RHD & Alternatives)
 * 
 * Persistent sticky state via localStorage with default on cold-boot = 'detailed'.
 */

import { state } from '../../state.js';
import { parsePrescriptionText } from '../../utils.js';

const ORDO_MODE_KEY = 'dr_cat_ordonnance_mode';

/**
 * Retrieves the current ordonnance view mode preference.
 * Defaults to 'detailed' on cold boot / first visit for clinical safety.
 */
export function getOrdonnanceMode() {
  try {
    return localStorage.getItem(ORDO_MODE_KEY) || 'detailed';
  } catch (e) {
    return 'detailed';
  }
}

/**
 * Persists the user's preferred ordonnance view mode.
 */
export function setOrdonnanceMode(mode) {
  try {
    localStorage.setItem(ORDO_MODE_KEY, mode);
  } catch (e) {}
}

/**
 * Intelligent Extractor & Formatter for Express Prescription (Cabinet / Pharmacy Rx format).
 * Isolates 1st-line molecules and standard symptom relief, formatting with clean QSP / Posology lines.
 */
export function formatExpressPrescription(rawText) {
  if (!rawText || typeof rawText !== 'string') return "Pas d'ordonnance type rédigée.";

  const lines = rawText.split('\n');
  const rxItems = [];
  let currentSection = '';
  let currentMolecule = null;
  let currentPosologies = [];

  for (let i = 0; i < lines.length; i++) {
    const trimmed = lines[i].trim();
    if (!trimmed) continue;

    // Detect section headers
    if (/\b1[èe]re\s+INTENTION\b/i.test(trimmed)) {
      currentSection = '1ere';
      continue;
    } else if (/\bALTERNATIVES?\s*\[OU\]/i.test(trimmed) || /\b2[èe]me\s+INTENTION\b/i.test(trimmed)) {
      currentSection = 'alternatives';
      continue;
    } else if (/\bTRAITEMENT\s+NON\s+M[ÉE]DICAMENTEUX\b/i.test(trimmed) || /\bRHD\b/i.test(trimmed)) {
      currentSection = 'rhd';
      continue;
    } else if (/\bTRAITEMENT\s+SYMPTOMATIQUE\b/i.test(trimmed) || /\bADJUVANT\b/i.test(trimmed)) {
      currentSection = 'adjuvant';
      continue;
    }

    // Process lines inside 1ère INTENTION or essential ADJUVANT
    if (currentSection === '1ere' || currentSection === 'adjuvant') {
      // Check for bullet point with a new molecule
      const isBullet = trimmed.startsWith('-') || trimmed.startsWith('*') || trimmed.startsWith('•');
      const cleanLine = trimmed.replace(/^[-*•]\s*/, '').trim();

      // Skip pure warnings / RHD text
      if (/^[⚠️ℹ️💡]/.test(cleanLine) || /^Vérifier\s+impérativement/i.test(cleanLine) || /^Rappels?\b/i.test(cleanLine)) {
        continue;
      }

      // Check if this is a primary drug line (e.g. "Xylène (CERULYSE 5g/100ml...) :" or "Paracétamol 1g (DOLIPRANE...) :")
      if (isBullet && (cleanLine.includes('(') || cleanLine.includes(':') || cleanLine.includes('mg') || cleanLine.includes('g/'))) {
        if (currentMolecule) {
          rxItems.push({
            drug: currentMolecule,
            posology: currentPosologies.join(' ').trim()
          });
        }
        const parts = cleanLine.split(':');
        currentMolecule = parts[0].replace(/\*\*/g, '').trim();
        currentPosologies = [];
        if (parts.length > 1 && parts[1].trim()) {
          const sub = parts[1].replace(/\*\*/g, '').replace(/^[⚠️ℹ️💡].*$/, '').trim();
          if (sub) currentPosologies.push(sub);
        }
      } else if (currentMolecule && (trimmed.startsWith('*') || trimmed.startsWith('-') || trimmed.startsWith('•') || trimmed.startsWith('└'))) {
        // Sub-instruction / posology line
        const subLine = trimmed.replace(/^[-*•└─]\s*/, '').replace(/\*\*/g, '').trim();
        if (!/^[⚠️ℹ️💡]/.test(subLine) && !/^Vérifier/i.test(subLine)) {
          currentPosologies.push(subLine);
        }
      } else if (!currentMolecule && isBullet && cleanLine.length > 5) {
        // Single stand-alone prescription line
        rxItems.push({
          drug: cleanLine.replace(/\*\*/g, ''),
          posology: ''
        });
      }
    }
  }

  // Flush last item
  if (currentMolecule) {
    rxItems.push({
      drug: currentMolecule,
      posology: currentPosologies.join(' ').trim()
    });
  }

  // If structured extraction found nothing (e.g. custom legacy note), return clean raw text without markdown hashes
  if (rxItems.length === 0) {
    return rawText
      .replace(/\*\*(.*?)\*\*/g, '$1')
      .replace(/^[#-]\s*/gm, '')
      .trim();
  }

  // Format into authentic pharmacy prescription format
  let output = '';
  rxItems.forEach((item, index) => {
    // Extract QSP duration if present in posology or drug string
    let durationMatch = item.posology.match(/pendant\s+(\d+\s*(?:jours?|semaines?|mois))/i) ||
                        item.drug.match(/pendant\s+(\d+\s*(?:jours?|semaines?|mois))/i);
    let qspDuration = durationMatch ? durationMatch[1] : '';

    let qspStr = qspDuration ? ` ────── QSP ${qspDuration}` : '';
    let drugTitle = item.drug.replace(/:\s*$/, '').trim();

    output += `${index + 1}. ${drugTitle}${qspStr}\n`;
    if (item.posology) {
      // Clean up internal bullet repetitions
      let cleanPoso = item.posology
        .replace(/\s*\*+\s*/g, ' ')
        .replace(/\s+/g, ' ')
        .trim();
      output += `   Posologie : ${cleanPoso}\n\n`;
    } else {
      output += '\n';
    }
  });

  return output.trim();
}

/**
 * Formats the full detailed prescription guide (RHD, 1st line, Alternatives [OU], Adjuvants).
 */
export function formatDetailedPrescription(rawText) {
  if (!rawText || typeof rawText !== 'string') return "Pas d'ordonnance type rédigée.";
  return rawText;
}

/**
 * Initializes the Segmented Switch UI event listeners.
 */
let isSegmentedInitialized = false;
export function initOrdonnanceSegmentedControl() {
  if (isSegmentedInitialized) return;
  const detailedBtn = document.getElementById('ordo-mode-detailed');
  const expressBtn = document.getElementById('ordo-mode-express');

  if (detailedBtn && expressBtn) {
    detailedBtn.addEventListener('click', () => {
      setOrdonnanceMode('detailed');
      renderPrescription();
    });

    expressBtn.addEventListener('click', () => {
      setOrdonnanceMode('express');
      renderPrescription();
    });

    isSegmentedInitialized = true;
  }
}

/**
 * Renders the Prescription Pad and updates segmented controls.
 */
export function renderPrescription(text, cat) {
  const wsPrescription = document.getElementById('workspace-prescription');
  const selector = document.getElementById('prescription-variants-selector');
  const stampCodeEl = document.getElementById('stamp-code');
  const detailedBtn = document.getElementById('ordo-mode-detailed');
  const expressBtn = document.getElementById('ordo-mode-express');

  // Make sure buttons are bound
  initOrdonnanceSegmentedControl();

  const currentCat = cat || state.activeCat;

  if (stampCodeEl) {
    const catId = currentCat && currentCat.id !== undefined ? String(currentCat.id).padStart(2, '0') : '01';
    const year = new Date().getFullYear();
    stampCodeEl.textContent = `N° ${catId}/CAT-${year}`;
  }

  if (!wsPrescription) return;

  const rawText = text || currentCat?.ordonnance || currentCat?.prescription || '';

  if (!rawText) {
    wsPrescription.textContent = "Pas d'ordonnance type rédigée.";
    if (selector) selector.style.display = 'none';
    state.prescriptionVariants = [];
    return;
  }

  // Parse variants if any (e.g. --- Cas Général ---)
  state.prescriptionVariants = parsePrescriptionText(rawText);

  let activeContent = rawText;
  if (state.prescriptionVariants.length > 1) {
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
          renderPrescription();
        });

        selector.appendChild(pill);
      });
    }

    const activeVar = state.prescriptionVariants[state.activePrescriptionVariantIndex] || state.prescriptionVariants[0];
    activeContent = activeVar ? activeVar.content : rawText;
  } else {
    if (selector) selector.style.display = 'none';
  }

  // Get active view mode ('detailed' | 'express')
  const mode = getOrdonnanceMode();

  // Update Segmented Button States
  if (detailedBtn && expressBtn) {
    if (mode === 'express') {
      expressBtn.classList.add('active');
      detailedBtn.classList.remove('active');
    } else {
      detailedBtn.classList.add('active');
      expressBtn.classList.remove('active');
    }
  }

  // Render according to active mode
  if (mode === 'express') {
    wsPrescription.textContent = formatExpressPrescription(activeContent);
  } else {
    wsPrescription.textContent = formatDetailedPrescription(activeContent);
  }
}
