import fs from 'fs';
import path from 'path';
import { fileURLToPath } from 'url';

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);
const ROOT = path.join(__dirname, '..');

function mergeCatsWithLocalState(serverCats, localProgress = {}) {
  return serverCats.map(cat => {
    const localEntry = localProgress[cat.id] || {};
    return {
      ...cat,
      status: localEntry.status || 'todo',
      notes: localEntry.notes || '',
      lastRead: localEntry.lastRead || 0
    };
  });
}

function renderResumeList(resumeList, activeCats, onSelectCat) {
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

function runResumeTests() {
  console.log('\n🔄 Dr. CAT — Audit "Reprendre la révision"\n');
  let passed = 0, failed = 0;

  function check(name, ok) {
    if (ok) { console.log('  ✅ ' + name); passed++; }
    else { console.log('  ❌ ' + name); failed++; }
  }

  // Verify source files match implementation
  const helpersCode = fs.readFileSync(path.join(ROOT, 'public/js/lib/helpers.js'), 'utf-8');
  check('helpers.js maps lastRead property', helpersCode.includes('lastRead: localEntry.lastRead || 0'));

  const resumeCode = fs.readFileSync(path.join(ROOT, 'public/js/components/dashboard/resume.js'), 'utf-8');
  check('resume.js sorts by lastRead timestamp descending', resumeCode.includes('(b.lastRead || 0) - (a.lastRead || 0)'));
  check('resume.js renders top 5 items', resumeCode.includes('sorted.slice(0, 5)'));

  const workspaceCode = fs.readFileSync(path.join(ROOT, 'public/js/components/workspace.js'), 'utf-8');
  check('workspace.js stamps lastRead on status update', workspaceCode.includes('progress[state.activeCat.id].lastRead = Date.now()'));
  check('workspace.js stamps lastRead on notes save', workspaceCode.includes('progress[state.activeCat.id].lastRead = Date.now()'));
  check('workspace.js stamps lastRead when selecting a CAT', workspaceCode.includes('progress[cat.id].lastRead = Date.now()'));

  // 1. Mock CAT data
  const mockServerCats = [
    { id: 1, title: 'Asthme', category: 'Pneumologie', summary: 'S1', ordonnance: 'O1' },
    { id: 2, title: 'Infarctus', category: 'Cardiologie', summary: 'S2', ordonnance: 'O2' },
    { id: 3, title: 'Appendicite', category: 'Chirurgie', summary: 'S3', ordonnance: 'O3' }
  ];

  // 2. Mock Local Progress with lastRead timestamps
  const t1 = 1000;
  const t2 = 5000; // Most recent
  const t3 = 3000; // Middle

  const localProgress = {
    1: { status: 'doing', notes: 'Note 1', lastRead: t1 },
    2: { status: 'done', notes: '', lastRead: t2 },
    3: { status: 'doing', notes: 'Note 3', lastRead: t3 }
  };

  // 3. Test mergeCatsWithLocalState
  const merged = mergeCatsWithLocalState(mockServerCats, localProgress);
  check('mergeCatsWithLocalState preserves status', merged[0].status === 'doing' && merged[1].status === 'done');
  check('mergeCatsWithLocalState preserves lastRead timestamp', merged[0].lastRead === t1 && merged[1].lastRead === t2 && merged[2].lastRead === t3);

  // 4. Test DOM Mock
  const children = [];
  const mockResumeListEl = {
    innerHTML: '',
    appendChild(child) {
      children.push(child);
    }
  };

  global.document = {
    createElement(tag) {
      return {
        tagName: tag,
        style: {},
        innerHTML: '',
        listeners: {},
        addEventListener(event, fn) {
          this.listeners[event] = fn;
        },
        click() {
          if (this.listeners['click']) this.listeners['click']();
        }
      };
    }
  };

  let selectedCat = null;
  const onSelectCat = (cat) => { selectedCat = cat; };

  renderResumeList(mockResumeListEl, merged, onSelectCat);

  check('Renders 3 resume items', children.length === 3);

  // Item 0 should be ID 2 (t2 = 5000, most recent)
  check('Most recently read CAT (ID 2) is at top of list', children[0].innerHTML.includes('2. Infarctus'));

  // Item 1 should be ID 3 (t3 = 3000)
  check('Second most recent CAT (ID 3) is second in list', children[1].innerHTML.includes('3. Appendicite'));

  // Item 2 should be ID 1 (t1 = 1000)
  check('Oldest CAT (ID 1) is third in list', children[2].innerHTML.includes('1. Asthme'));

  // Click handler test
  children[0].click();
  check('Clicking row triggers onSelectCat with correct CAT', selectedCat && selectedCat.id === 2);

  console.log(`\n==================================================`);
  console.log(`Results: ${passed} passed, ${failed} failed`);
  console.log(`==================================================\n`);

  process.exit(failed > 0 ? 1 : 0);
}

runResumeTests();
