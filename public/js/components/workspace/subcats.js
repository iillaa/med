/**
 * Sub-CATs & Clinical Profiles UI Component
 * Handles the interactive profile selector, switching views, and synchronizing tabs.
 */

import { state } from '../../state.js';
import { triggerHaptic } from '../../utils.js';
import { renderSummary } from './summary.js';
import { renderPrescription } from './prescription.js';

export function getSubCatIcon(textOrType) {
  const t = (textOrType || '').toLowerCase();
  if (t.includes('urgence') || t.includes('grave') || t.includes('aigu') || t.includes('glairo') || t.includes('sanglant')) return 'fa-truck-medical';
  if (t.includes('enceinte') || t.includes('grossesse')) return 'fa-person-pregnant';
  if (t.includes('enfant') || t.includes('pédiatr') || t.includes('nourrisson') || t.includes('sro')) return 'fa-child';
  if (t.includes('âgé') || t.includes('gériatr') || t.includes('senior')) return 'fa-person-cane';
  if (t.includes('diabét') || t.includes('diabete')) return 'fa-droplet';
  if (t.includes('rénal') || t.includes('renal')) return 'fa-kidneys';
  if (t.includes('psych') || t.includes('neuro')) return 'fa-brain';
  return 'fa-stethoscope';
}

/**
 * Render sleek Sub-CAT / Clinical Profile Dropdown Selector
 */
export function renderSubCatBar(cat) {
  const profileWrapper = document.getElementById('workspace-profile-wrapper');
  const profileSelect = document.getElementById('workspace-profile-select');
  if (!profileWrapper || !profileSelect) return;

  const subCats = Array.isArray(cat.sub_cats) && cat.sub_cats.length > 0 ? cat.sub_cats : [];
  if (subCats.length === 0) {
    profileWrapper.style.display = 'none';
    profileSelect.innerHTML = '';
    return;
  }

  profileWrapper.style.display = 'inline-flex';
  profileSelect.innerHTML = '';

  const profiles = [
    { label: '⭐ Fiche Principale' },
    ...subCats
  ];

  profiles.forEach((prof, idx) => {
    const opt = document.createElement('option');
    opt.value = String(idx);
    opt.textContent = prof.label || `Profil ${idx}`;
    if (state.activeSubCatIndex === idx) {
      opt.selected = true;
    }
    profileSelect.appendChild(opt);
  });

  profileSelect.onchange = (e) => {
    window.switchToSubProfile(parseInt(e.target.value, 10));
  };
}

/**
 * Global In-Place Sub-Profile Switcher
 * Callable directly by contextual in-text badges or top dropdown!
 */
export function setupGlobalSubProfileSwitcher() {
  window.switchToSubProfile = function(idx) {
    if (!state.activeCat) return;
    const subCats = Array.isArray(state.activeCat.sub_cats) && state.activeCat.sub_cats.length > 0 ? state.activeCat.sub_cats : [];
    const profiles = [
      {
        label: '⭐ Fiche Principale',
        summary: state.activeCat.summary,
        red_flags: state.activeCat.red_flags,
        ordonnance: state.activeCat.ordonnance
      },
      ...subCats
    ];

    const targetIdx = Number(idx);
    if (targetIdx < 0 || targetIdx >= profiles.length) return;
    state.activeSubCatIndex = targetIdx;

    const prof = profiles[targetIdx];
    const wsRedFlags = document.getElementById('workspace-red-flags');
    if (wsRedFlags) wsRedFlags.textContent = prof.red_flags || state.activeCat.red_flags;

    renderSummary(prof.summary || state.activeCat.summary, state.activeCat, targetIdx > 0 ? prof.label : null);
    renderPrescription(prof.ordonnance || state.activeCat.ordonnance);
    triggerHaptic(true);

    const profileSelect = document.getElementById('workspace-profile-select');
    if (profileSelect) {
      profileSelect.value = String(targetIdx);
    }

    const summaryView = document.getElementById('summary-view');
    if (summaryView) summaryView.scrollIntoView({ behavior: 'smooth', block: 'start' });
  };
}
