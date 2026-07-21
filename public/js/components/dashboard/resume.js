export function renderResumeList(resumeList, activeCats, onSelectCat) {
  if (!resumeList) return;
  resumeList.innerHTML = '';

  const sorted = [...activeCats].sort((a, b) => (b.lastRead || 0) - (a.lastRead || 0));

  if (sorted.length === 0) {
    resumeList.innerHTML = '<li class="empty-state">Aucun cours en cours. Sélectionnez un cours dans la barre latérale pour commencer !</li>';
    return;
  }

  sorted.slice(0, 5).forEach(cat => {
    const li = document.createElement('li');
    li.style.cursor = 'pointer';
    li.innerHTML = `
      <div style="display: flex; justify-content: space-between; align-items: center; width: 100%;">
        <div>
          <span class="resume-title" style="font-weight: 600; color: var(--color-primary);">${cat.id}. ${cat.title}</span>
          <span style="font-size: 11px; color: var(--text-muted); display: block;">Spécialité : ${cat.category}</span>
        </div>
        <span class="badge ${cat.status === 'done' ? 'badge-success' : 'badge-warning'}" style="font-size: 11px; padding: 2px 8px; border-radius: 4px;">
          ${cat.status === 'done' ? 'Maîtrisé' : 'En cours'}
        </span>
      </div>
    `;
    li.addEventListener('click', () => onSelectCat(cat));
    resumeList.appendChild(li);
  });
}
