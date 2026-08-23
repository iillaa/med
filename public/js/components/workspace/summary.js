import { state } from '../../state.js';
import { parseSummaryMarkdown, escapeHTML } from '../../utils.js';

export function renderSummary(text, cat, subProfileLabel) {
  const summaryView = document.getElementById('summary-view');
  if (!summaryView) return;

  const contentText = text || cat?.summary || cat?.synthese || '';

  let bannerHtml = '';
  if (state.activeSubCatIndex > 0 && subProfileLabel) {
    bannerHtml = `
      <div class="subcat-intext-return-banner">
        <span class="subcat-intext-return-label">
          <i class="fa-solid fa-code-branch"></i> Sous-Fiche : <strong>${escapeHTML(subProfileLabel)}</strong>
        </span>
        <button type="button" class="subcat-intext-return-btn" onclick="window.switchToSubProfile(0)">
          <i class="fa-solid fa-arrow-left"></i> Revenir à la fiche principale
        </button>
      </div>
    `;
  }

  summaryView.innerHTML = bannerHtml + parseSummaryMarkdown(contentText);


  if (state.isAdmin && cat && cat.history && cat.history.length > 0) {
    let historyHtml = '<div class="cat-history-section" style="margin-top:20px; border-top:1px dashed var(--border-color); padding-top:14px; pointer-events:none;">';
    historyHtml += '<h4 style="font-size:11.5px; color:var(--text-secondary); margin-bottom:8px; display:flex; align-items:center; gap:6px;"><i class="fa-solid fa-clock-rotate-left"></i> Historique des versions</h4>';
    historyHtml += '<ul style="list-style:none; padding:0; margin:0; font-size:11px; color:var(--text-muted); display:flex; flex-direction:column; gap:4px;">';

    const recentHistory = cat.history.slice(-10).reverse();
    recentHistory.forEach(h => {
      const dateStr = new Date(h.timestamp).toLocaleDateString('fr-FR', { day: '2-digit', month: '2-digit', year: 'numeric', hour: '2-digit', minute: '2-digit' });
      historyHtml += `<li><span style="font-weight:600; color:var(--text-secondary);">${dateStr}</span> — ${escapeHTML(h.detail || h.action)}</li>`;
    });
    historyHtml += '</ul></div>';
    summaryView.innerHTML += historyHtml;
  }
}
