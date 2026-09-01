let appData = { v1: [], v2: [], validations: [] };

    function escapeHTML(str) {
      if (str === null || str === undefined) return '';
      return String(str)
        .replace(/&/g, '&amp;')
        .replace(/</g, '&lt;')
        .replace(/>/g, '&gt;')
        .replace(/"/g, '&quot;')
        .replace(/'/g, '&#039;');
    }

    function getAdminHeaders() {
      const token = localStorage.getItem('dr_cat_admin_token') || '';
      return {
        'Content-Type': 'application/json',
        'x-admin-token': token
      };
    }

    function showAuthOverlay() {
      let overlay = document.getElementById('admin-auth-lock-overlay');
      if (!overlay) {
        overlay = document.createElement('div');
        overlay.id = 'admin-auth-lock-overlay';
        overlay.style.cssText = 'position:fixed;inset:0;background:rgba(15,23,42,0.95);backdrop-filter:blur(10px);z-index:99999;display:flex;flex-direction:column;align-items:center;justify-content:center;padding:20px;';
        overlay.innerHTML = `
          <div style="background:#1e293b;border:1px solid #334155;border-radius:12px;padding:30px;max-width:400px;width:100%;text-align:center;box-shadow:0 20px 40px rgba(0,0,0,0.5);">
            <div style="font-size:40px;margin-bottom:15px;">🔐</div>
            <h2 style="color:#f8fafc;font-size:20px;margin-bottom:10px;">Connexion Admin Requise</h2>
            <p style="color:#94a3b8;font-size:13px;margin-bottom:20px;">Veuillez saisir votre mot de passe administrateur pour accéder au Generator Lab V3.</p>
            <input type="password" id="lab-auth-password" placeholder="Mot de passe admin..." style="width:100%;padding:10px 14px;background:#0f172a;border:1px solid #334155;border-radius:6px;color:#fff;font-size:14px;margin-bottom:15px;box-sizing:border-box;">
            <button onclick="submitLabLogin()" style="width:100%;padding:10px;background:linear-gradient(135deg,#06b6d4,#3b82f6);color:#fff;border:none;border-radius:6px;font-weight:bold;cursor:pointer;font-size:14px;">Se Connecter</button>
            <div id="lab-auth-error" style="color:#ef4444;font-size:12px;margin-top:12px;display:none;"></div>
          </div>
        `;
        document.body.appendChild(overlay);
      }
      overlay.style.display = 'flex';
    }

    async function submitLabLogin() {
      const pwdInput = document.getElementById('lab-auth-password');
      const errDiv = document.getElementById('lab-auth-error');
      const pwd = pwdInput ? pwdInput.value : '';
      if (!pwd) return;

      try {
        const res = await fetch('/api/login', {
          method: 'POST',
          headers: { 'Content-Type': 'application/json' },
          body: JSON.stringify({ password: pwd })
        });
        const data = await res.json();
        if (res.ok && data.token) {
          localStorage.setItem('dr_cat_admin_token', data.token);
          const overlay = document.getElementById('admin-auth-lock-overlay');
          if (overlay) overlay.style.display = 'none';
          await loadData();
        } else {
          errDiv.textContent = data.error || 'Mot de passe incorrect.';
          errDiv.style.display = 'block';
        }
      } catch (e) {
        errDiv.textContent = 'Erreur réseau lors de la connexion.';
        errDiv.style.display = 'block';
      }
    }

    async function loadData() {
      try {
        const res = await fetch('/api/admin/cat-generator/data', { headers: getAdminHeaders() });
        if (res.status === 403 || res.status === 401) {
          showAuthOverlay();
          return;
        }
        if (!res.ok) throw new Error('API request failed');
        appData = await res.json();
        
        const totalCount = Math.max(appData.summary.v1Total || 0, appData.summary.v2Total || 0);
        document.querySelectorAll('.lbl-total-count').forEach(el => el.textContent = totalCount);
        document.getElementById('stat-total-sub').textContent = `Out of ${totalCount} clinical definitions`;

        document.getElementById('stat-total').textContent = appData.summary.v2Total;
        document.getElementById('stat-passrate').textContent = `${appData.summary.passRate}%`;
        document.getElementById('stat-tokens').textContent = appData.summary.totalTokensConsumed.toLocaleString();

        renderTable();
      } catch (err) {
        console.error(err);
        showAuthOverlay();
      }
    }

    function renderTable() {
      const query = document.getElementById('search-input').value.toLowerCase().trim();
      const tbody = document.getElementById('cat-table-body');
      tbody.innerHTML = '';

      // Merge v1 and v2 so all items in production or v2 are visible
      const allCatsMap = new Map();

      // First add v1 prod items (strictly title, category, id as ungenerated targets)
      (appData.v1 || []).forEach(cat => {
        const key = cat.id ? `id_${cat.id}` : (cat.title || '').toLowerCase().trim();
        allCatsMap.set(key, {
          id: cat.id,
          category: cat.category,
          title: cat.title,
          isV2: false
        });
      });

      // Overlay v2 generated items (take precedence by Primary Key ID)
      (appData.v2 || []).forEach(cat => {
        const key = cat.id ? `id_${cat.id}` : (cat.title || '').toLowerCase().trim();
        allCatsMap.set(key, {
          ...cat,
          isV2: true
        });
      });

      const allMerged = Array.from(allCatsMap.values());

      const filtered = allMerged.filter(c => 
        (c.title || '').toLowerCase().includes(query) ||
        (c.category || '').toLowerCase().includes(query)
      );

      document.getElementById('record-count').textContent = `Affichage de ${filtered.length} sur ${allMerged.length} fiches`;

      if (filtered.length === 0) {
        tbody.innerHTML = `<tr><td colspan="8" style="text-align: center; color: var(--text-muted);">Aucune fiche trouvée.</td></tr>`;
        return;
      }

      filtered.forEach(c => {
        const valObj = appData.validations.find(v => v.id === c.id) || {};
        const isValid = c.isV2 ? (valObj.validation ? valObj.validation.valid : true) : null;
        const isAdmin = (c.category || '').toLowerCase() === 'administratif' || /certificat|lettre|attestation/i.test(c.title);
        const isHumanEdited = !!c._human_edited;
        const metrics = c._execution_metrics || {};

        const isSubCat = !!c.parent_id;
        let subBadge = '';
        if (isSubCat) {
          subBadge = `<span class="badge" style="font-size:10px; background:rgba(168,85,247,0.15); color:#c084fc; border:1px solid rgba(168,85,247,0.3); margin-left:6px;"><i class="fa-solid fa-code-branch"></i> Sous-fiche #${c.parent_id}</span>`;
        } else if (Array.isArray(c.sub_cats) && c.sub_cats.length > 0) {
          subBadge = `<span class="badge" style="font-size:10px; background:rgba(168,85,247,0.25); color:#e9d5ff; border:1px solid rgba(168,85,247,0.6); margin-left:6px;"><i class="fa-solid fa-layer-group"></i> ${c.sub_cats.length} Sous-Fiches</span>`;
        }

        const tr = document.createElement('tr');
        tr.innerHTML = `
          <td><strong>#${c.id || '-'}</strong></td>
          <td><span style="font-weight: 500;">${c.category || 'Non spécifiée'}</span></td>
          <td>
            <strong>${c.title}</strong>
            ${subBadge}
          </td>
          <td>
            <span class="badge ${isAdmin ? 'badge-admin' : 'badge-clinical'}">
              ${isAdmin ? '📋 Admin Schema Lock' : '🩺 5-Step Clinical Lock'}
            </span>
          </td>
          <td>
            <span class="badge badge-clinical" style="font-size: 10px;">📚 PDF RAG</span>
            ${isHumanEdited ? '<span class="badge badge-valid" style="font-size: 10px;">🧠 Human Memory</span>' : ''}
            ${!c.isV2 ? '<span class="badge badge-warning" style="font-size: 10px;">📜 Prod Baseline</span>' : ''}
          </td>
          <td>
            ${c.isV2 ? `
              <span class="badge ${isValid ? 'badge-valid' : 'badge-error'}">
                ${isValid ? '✅ VALID' : '❌ REJECTED'}
              </span>
            ` : `
              <span class="badge badge-warning">⚠️ EN ATTENTE V3</span>
            `}
          </td>
          <td>
            <div style="font-size: 11px; font-family: monospace;">
              ${c.isV2 ? `${metrics.model || 'gemini-3.6-flash'} | ${metrics.latencyMs ? metrics.latencyMs + 'ms' : '-'} | ${metrics.totalTokens ? metrics.totalTokens + ' tok' : '-'}` : 'Pas encore générée en V3'}
            </div>
          </td>
          <td style="white-space: nowrap;">
            <button onclick="run1TapPipelineSingle('${(c.title || '').replace(/'/g, "\\'")}', '${c.category}', ${c.id})" class="btn-outline" style="padding: 4px 8px; font-size: 11px; color: #10b981; border-color: #10b981; font-weight: bold;" title="Web Fetch + IA Dual RAG + Approbation Auto en 1 Clic !">⚡ 1-Tap Auto</button>
            ${c.isV2 ? `<button onclick="inspectCAT(${c.id})" class="btn-outline" style="padding: 4px 8px; font-size: 11px;">👁️ Inspecter</button>` : ''}
            ${c.isV2 ? `<button onclick="promoteSingleCAT(${c.id})" class="btn-outline" style="padding: 4px 8px; font-size: 11px; color: var(--success); border-color: var(--success);">💾 Promouvoir (1)</button>` : ''}
            ${c.isV2 ? `<button onclick="openEditModal(${c.id})" class="btn-outline" style="padding: 4px 8px; font-size: 11px; color: var(--primary); border-color: var(--primary);">✏️ Éditer</button>` : ''}
            <button onclick="runStep1WebFetch('${(c.title || '').replace(/'/g, "\\'")}', false)" class="btn-outline" style="padding: 4px 8px; font-size: 11px;" title="Mode incrémental : complète les sources manquantes">🌐 Step 1 Web</button>
            <button onclick="runStep1WebFetch('${(c.title || '').replace(/'/g, "\\'")}', true)" class="btn-outline" style="padding: 4px 8px; font-size: 11px; color: var(--primary); border-color: var(--primary);" title="Forcer la recherche en ligne (remplace le cache)">🔄 Recharger Web</button>
            <button onclick="purgeWebCache('${(c.title || '').replace(/'/g, "\\'")}')" class="btn-outline" style="padding: 4px 8px; font-size: 11px; color: var(--danger); border-color: var(--danger);" title="Effacer les fichiers de cache Web pour cette fiche">🗑️ Vider Cache</button>
            <button onclick="regenerateSingleCAT('${(c.title || '').replace(/'/g, "\\'")}', '${c.category}', ${c.id})" class="btn-outline" style="padding: 4px 8px; font-size: 11px; color: var(--warning); border-color: var(--warning);">${c.isV2 ? '🔄 Régénérer' : '⚡ Générer V3'}</button>
            ${c.isV2 ? `<button onclick="deleteCAT(${c.id}, '${(c.title || '').replace(/'/g, "\\'")}')" class="btn-outline" style="padding: 4px 8px; font-size: 11px; color: var(--danger); border-color: var(--danger);">🗑️ Supprimer</button>` : ''}
          </td>
        `;
        tbody.appendChild(tr);
      });
    }

    async function run1TapPipelineSingle(title, category, id) {
      if (!confirm(`Lancer le pipeline 1-Tap Auto (Web Fetch + IA Dual RAG V3) pour : "${title}" ?`)) return;

      try {
        const res = await fetch('/api/admin/cat-generator/pipeline-full', {
          method: 'POST',
          headers: getAdminHeaders(),
          body: JSON.stringify({ id, title, category, forceRefetch: false })
        });
        const data = await res.json();
        if (!res.ok || !data.success) throw new Error(data.error || 'Échec du pipeline 1-Tap');

        alert(`⚡ Fiche #${id} "${title}" générée avec succès en V3 ! (${data.metrics ? data.metrics.model : 'Dual RAG'})`);
        await loadData();
      } catch (err) {
        alert(`❌ Erreur 1-Tap Auto: ${err.message}`);
      }
    }

    async function run1TapBatchPipeline() {
      const allProd = appData.v1 || [];
      if (allProd.length === 0) {
        alert('Aucune fiche disponible dans la base !');
        return;
      }

      const ungenerated = allProd.filter(cat => {
        return !appData.v2 || !appData.v2.some(v2 => Number(v2.id) === Number(cat.id));
      });

      let targetList = ungenerated;

      if (ungenerated.length > 0) {
        const runOnlyPending = confirm(`Lancer le Batch 1-Tap Global pour les ${ungenerated.length} fiches en attente ?\n\n(Cliquez sur Annuler si vous préférez régénérer TOUTES les ${allProd.length} fiches).`);
        if (!runOnlyPending) {
          if (!confirm(`Confirmer la régénération 1-Tap Global pour TOUTES les ${allProd.length} fiches de la base ?`)) return;
          targetList = allProd;
        }
      } else {
        if (!confirm(`Toutes les fiches sont déjà en V3. Voulez-vous relancer le Batch 1-Tap Global (Web Fetch + Dual RAG IA V3) pour TOUTES les ${allProd.length} fiches ?`)) return;
        targetList = allProd;
      }

      alert(`⚡ Démarrage du Batch 1-Tap Global pour ${targetList.length} fiches...`);

      for (let i = 0; i < targetList.length; i++) {
        const cat = targetList[i];
        try {
          await fetch('/api/admin/cat-generator/pipeline-full', {
            method: 'POST',
            headers: getAdminHeaders(),
            body: JSON.stringify({ id: cat.id, title: cat.title, category: cat.category, forceRefetch: false })
          });
        } catch (e) {
          console.warn(`Error on "${cat.title}":`, e);
        }

        await new Promise(r => setTimeout(r, 1000));
      }

      alert('🎉 Batch 1-Tap Global Terminé !');
      await loadData();
    }

    async function runStep1WebFetch(title, forceRefetch = false) {
      const msg = forceRefetch ? 
        `Forcer le rechargement Web (recherche en ligne) pour : "${title}" ?` : 
        `Lancer la recherche Web Step 1 (mode incrémental) pour : "${title}" ?`;
      if (!confirm(msg)) return;

      try {
        const res = await fetch('/api/admin/cat-generator/fetch-web', {
          method: 'POST',
          headers: getAdminHeaders(),
          body: JSON.stringify({ title, forceRefetch })
        });
        const data = await res.json();
        if (!res.ok || !data.success) throw new Error(data.error || 'Échec de la recherche web');

        alert(`🌐 ${data.message}`);
        await loadData();
      } catch (err) {
        alert(`❌ Erreur Web Fetch: ${err.message}`);
      }
    }

    async function purgeWebCache(title) {
      if (!confirm(`Voulez-vous vraiment effacer tous les fichiers du cache Web pour : "${title}" ?`)) return;

      try {
        const res = await fetch('/api/admin/cat-generator/clear-web-cache', {
          method: 'POST',
          headers: getAdminHeaders(),
          body: JSON.stringify({ title })
        });
        const data = await res.json();
        if (!res.ok || !data.success) throw new Error(data.error || 'Échec de la suppression du cache');

        alert(`🗑️ ${data.message}`);
        await loadData();
      } catch (err) {
        alert(`❌ Erreur Effacement Cache: ${err.message}`);
      }
    }

    async function runStep1BatchWebFetch(forceRefetch = false) {
      const msg = forceRefetch ? 
        `Forcer la recherche Web en ligne pour TOUTES les fiches (${appData.v1.length} CATs) ? Le cache existant sera remplacé.` :
        `Lancer la recherche Web Step 1 (mode incrémental) pour TOUTES les fiches (${appData.v1.length} CATs) ?`;
      if (!confirm(msg)) return;

      try {
        const res = await fetch('/api/admin/cat-generator/batch-web', {
          method: 'POST',
          headers: getAdminHeaders(),
          body: JSON.stringify({ forceRefetch })
        });
        const data = await res.json();
        if (!res.ok || !data.success) throw new Error(data.error || 'Échec du lancement du batch web');

        alert(`🌐 ${data.message}`);
        pollProgress();
        await loadData();
      } catch (err) {
        alert(`❌ Erreur Batch Web Fetch: ${err.message}`);
      }
    }

    async function purgeAllWebCache() {
      if (!confirm('⚠️ ATTENTION : Voulez-vous vraiment effacer DÉFINITIVEMENT TOUT le dossier de cache Web sur disque ?')) return;

      try {
        const res = await fetch('/api/admin/cat-generator/clear-web-cache', {
          method: 'POST',
          headers: getAdminHeaders(),
          body: JSON.stringify({ all: true })
        });
        const data = await res.json();
        if (!res.ok || !data.success) throw new Error(data.error || 'Échec de la suppression globale du cache');

        alert(`🗑️ ${data.message}`);
        await loadData();
      } catch (err) {
        alert(`❌ Erreur Effacement Global: ${err.message}`);
      }
    }

    let currentInspectedV2 = null;
    let activeInspectorSubCatIdx = -1;

    function toggleSubCatDrawer() {
      const drawer = document.getElementById('subcat-generator-drawer');
      if (drawer) {
        drawer.style.display = drawer.style.display === 'none' ? 'block' : 'none';
      }
    }

    function setSubCatPreset(preset) {
      const input = document.getElementById('custom-subcat-input');
      if (input) {
        input.value = preset;
        input.focus();
      }
    }

    async function submitGenerateSubCat() {
      if (!currentInspectedV2 || !currentInspectedV2.id) {
        alert('Veuillez inspecter une fiche valide.');
        return;
      }
      const input = document.getElementById('custom-subcat-input');
      const profile = (input ? input.value : '').trim();
      if (!profile) {
        alert('Veuillez choisir un preset ou saisir un profil clinique.');
        return;
      }

      const btn = document.getElementById('btn-submit-subcat');
      const originalText = btn ? btn.innerHTML : '';
      if (btn) {
        btn.disabled = true;
        btn.innerHTML = '⏳ Synthèse IA...';
      }

      try {
        const res = await fetch('/api/admin/cat-generator/subcat', {
          method: 'POST',
          headers: getAdminHeaders(),
          body: JSON.stringify({
            id: currentInspectedV2.id,
            title: currentInspectedV2.title,
            subProfileType: profile
          })
        });

        const data = await res.json();
        if (!res.ok || !data.success) {
          throw new Error(data.error || 'Échec de génération de la sous-fiche');
        }

        // Update in-memory data
        const catIdx = appData.v2.findIndex(c => c.id === currentInspectedV2.id);
        if (catIdx >= 0) {
          appData.v2[catIdx] = data.cat;
        }
        currentInspectedV2 = data.cat;
        activeInspectorSubCatIdx = (data.cat.sub_cats || []).length - 1;

        if (input) input.value = '';
        renderInspectorTabs(data.cat);
        updateInspectorProfile(data.cat);

        alert(`✅ Sous-fiche "${data.sub_cat.label || profile}" générée avec succès !`);
      } catch (err) {
        alert(`❌ Erreur: ${err.message}`);
      } finally {
        if (btn) {
          btn.disabled = false;
          btn.innerHTML = originalText;
        }
      }
    }

    async function deleteSubCatFromInspector(e, idx, label) {
      if (e) e.stopPropagation();
      if (!currentInspectedV2 || !currentInspectedV2.id) return;
      if (!confirm(`Supprimer définitivement la sous-fiche "${label || idx + 1}" ?`)) return;

      try {
        const res = await fetch('/api/admin/cat-generator/subcat', {
          method: 'DELETE',
          headers: getAdminHeaders(),
          body: JSON.stringify({
            id: currentInspectedV2.id,
            subIndex: idx
          })
        });

        const data = await res.json();
        if (!res.ok || !data.success) {
          throw new Error(data.error || 'Échec de suppression');
        }

        const catIdx = appData.v2.findIndex(c => c.id === currentInspectedV2.id);
        if (catIdx >= 0) {
          appData.v2[catIdx] = data.cat;
        }
        currentInspectedV2 = data.cat;
        activeInspectorSubCatIdx = -1;

        renderInspectorTabs(data.cat);
        updateInspectorProfile(data.cat);
      } catch (err) {
        alert(`❌ Erreur: ${err.message}`);
      }
    }

    function renderInspectorTabs(v2Cat) {
      const container = document.getElementById('inspector-subcat-tabs');
      const countEl = document.getElementById('inspector-subcat-count');
      if (!container) return;
      container.innerHTML = '';

      const subs = Array.isArray(v2Cat.sub_cats) ? v2Cat.sub_cats : [];
      if (countEl) countEl.textContent = `${subs.length} sous-fiche(s)`;

      // Main Tab Button
      const mainBtn = document.createElement('button');
      mainBtn.className = `btn-outline ${activeInspectorSubCatIdx === -1 ? 'btn-success' : ''}`;
      mainBtn.style.cssText = 'padding: 4px 10px; font-size: 11px; font-weight: 600;';
      mainBtn.innerHTML = '⭐ Master Hub';
      mainBtn.onclick = () => {
        activeInspectorSubCatIdx = -1;
        updateInspectorProfile(v2Cat);
        renderInspectorTabs(v2Cat);
      };
      container.appendChild(mainBtn);

      // Sub-CAT Tab Buttons (with delete action)
      subs.forEach((sub, idx) => {
        const btnWrapper = document.createElement('div');
        btnWrapper.style.cssText = 'display: inline-flex; align-items: center; border-radius: 6px; overflow: hidden;';

        const btn = document.createElement('button');
        btn.className = `btn-outline ${activeInspectorSubCatIdx === idx ? 'btn-success' : ''}`;
        btn.style.cssText = 'padding: 4px 8px; font-size: 11px; font-weight: 600; border-top-right-radius: 0; border-bottom-right-radius: 0;';
        btn.innerHTML = `🏷️ ${escapeHTML(sub.label || `Option ${idx + 1}`)}`;
        btn.onclick = () => {
          activeInspectorSubCatIdx = idx;
          updateInspectorProfile(v2Cat);
          renderInspectorTabs(v2Cat);
        };

        const delBtn = document.createElement('button');
        delBtn.className = 'btn-outline';
        delBtn.style.cssText = 'padding: 4px 6px; font-size: 10px; color: var(--danger); border-left: none; border-top-left-radius: 0; border-bottom-left-radius: 0;';
        delBtn.title = 'Supprimer cette sous-fiche';
        delBtn.innerHTML = '✕';
        delBtn.onclick = (e) => deleteSubCatFromInspector(e, idx, sub.label);

        btnWrapper.appendChild(btn);
        btnWrapper.appendChild(delBtn);
        container.appendChild(btnWrapper);
      });
    }

    function updateInspectorProfile(v2Cat) {
      const headerEl = document.getElementById('v2-active-profile-header');
      if (activeInspectorSubCatIdx === -1) {
        if (headerEl) headerEl.innerHTML = '<span style="color: #38bdf8;">⭐ Fiche Principale (Master Hub)</span>';
        document.getElementById('v2-cat-summary').textContent = v2Cat.summary || 'Non disponible';
        document.getElementById('v2-cat-redflags').textContent = v2Cat.red_flags || 'Non disponible';
        document.getElementById('v2-cat-ordonnance').textContent = v2Cat.ordonnance || 'Non disponible';
      } else if (v2Cat.sub_cats && v2Cat.sub_cats[activeInspectorSubCatIdx]) {
        const sub = v2Cat.sub_cats[activeInspectorSubCatIdx];
        if (headerEl) headerEl.innerHTML = `<span style="color: #c084fc;">🏷️ Sous-Fiche ${activeInspectorSubCatIdx + 1} : ${escapeHTML(sub.label || 'Spécialisée')}</span>`;
        document.getElementById('v2-cat-summary').textContent = sub.summary || 'Non disponible';
        document.getElementById('v2-cat-redflags').textContent = sub.red_flags || 'Non disponible';
        document.getElementById('v2-cat-ordonnance').textContent = sub.ordonnance || 'Non disponible';
      }
    }

    function inspectCAT(id) {
      try {
        const v1Cat = appData.v1.find(c => c.id === id) || { summary: 'Non présent en V1', red_flags: '-', ordonnance: '-' };
        const v2Cat = appData.v2.find(c => c.id === id);

        if (!v2Cat) {
          alert(`Fiche V3 [ID ${id}] introuvable.`);
          return;
        }

        currentInspectedV2 = v2Cat;
        activeInspectorSubCatIdx = -1;

        const titleEl = document.getElementById('modal-cat-title');
        if (titleEl) titleEl.textContent = `[ID ${id}] ${v2Cat.title}`;
        
        // Legacy V1 Panel
        const v1CatEl = document.getElementById('v1-cat-category');
        if (v1CatEl) v1CatEl.textContent = `Catégorie V1: ${v1Cat.category || 'Non spécifiée'}`;
        const v1SumEl = document.getElementById('v1-cat-summary');
        if (v1SumEl) v1SumEl.textContent = v1Cat.summary || 'Non disponible';
        const v1RfEl = document.getElementById('v1-cat-redflags');
        if (v1RfEl) v1RfEl.textContent = v1Cat.red_flags || 'Non disponible';
        const v1OrdEl = document.getElementById('v1-cat-ordonnance');
        if (v1OrdEl) v1OrdEl.textContent = v1Cat.ordonnance || 'Non disponible';

        // V2 Panel
        const isAdmin = (v2Cat.category || '').toLowerCase() === 'administratif' || /certificat|lettre|attestation/i.test(v2Cat.title);
        const schemaBadge = document.getElementById('v2-schema-badge');
        if (schemaBadge) {
          schemaBadge.textContent = isAdmin ? '📋 Admin Schema Lock' : '🩺 5-Step Clinical Lock';
          schemaBadge.className = `badge ${isAdmin ? 'badge-admin' : 'badge-clinical'}`;
        }

        const metrics = v2Cat._execution_metrics || {};
        const modelEl = document.getElementById('metric-model');
        if (modelEl) modelEl.textContent = metrics.model || 'gemini-3.6-flash';
        const latEl = document.getElementById('metric-latency');
        if (latEl) latEl.textContent = metrics.latencyMs ? `${metrics.latencyMs} ms` : '-';
        const tokEl = document.getElementById('metric-tokens');
        if (tokEl) tokEl.textContent = metrics.totalTokens ? `${metrics.totalTokens} tokens (${metrics.promptTokens} in / ${metrics.completionTokens} out)` : '-';

        renderInspectorTabs(v2Cat);
        updateInspectorProfile(v2Cat);

        const compareModal = document.getElementById('compare-modal');
        if (compareModal) {
          compareModal.classList.add('active');
          syncModalBodyLock();
        }
      } catch (err) {
        console.error('Error in inspectCAT:', err);
        alert(`Erreur d'ouverture de l'inspecteur : ${err.message}`);
      }
    }

    function syncModalBodyLock() {
      const hasActive = document.querySelector('.modal-overlay.active');
      if (hasActive) {
        document.body.classList.add('modal-open');
      } else {
        document.body.classList.remove('modal-open');
      }
    }

    function closeCompareModal() {
      document.getElementById('compare-modal').classList.remove('active');
      syncModalBodyLock();
    }

    function openEditModal(id) {
      const cat = appData.v2.find(c => c.id === id);
      if (!cat) {
        alert('Fiche introuvable.');
        return;
      }

      document.getElementById('edit-cat-id').value = cat.id;
      document.getElementById('edit-modal-header-title').textContent = `✏️ Édition Humaine : [ID #${cat.id}] ${cat.title}`;
      document.getElementById('edit-title').value = cat.title || '';
      document.getElementById('edit-category').value = cat.category || 'Gastro-entérologie';
      document.getElementById('edit-keywords').value = Array.isArray(cat.search_keywords) ? cat.search_keywords.join(', ') : (cat.search_keywords || '');
      document.getElementById('edit-summary').value = cat.summary || '';
      document.getElementById('edit-redflags').value = cat.red_flags || '';
      document.getElementById('edit-ordonnance').value = cat.ordonnance || '';
      document.getElementById('edit-subcats').value = Array.isArray(cat.sub_cats) && cat.sub_cats.length > 0 ? JSON.stringify(cat.sub_cats, null, 2) : '';

      document.getElementById('edit-modal').classList.add('active');
      syncModalBodyLock();
    }

    function closeEditModal() {
      document.getElementById('edit-modal').classList.remove('active');
      syncModalBodyLock();
    }

    async function saveCatEdit() {
      const id = parseInt(document.getElementById('edit-cat-id').value, 10);
      const title = document.getElementById('edit-title').value.trim();
      const category = document.getElementById('edit-category').value;
      const search_keywords = document.getElementById('edit-keywords').value;
      const summary = document.getElementById('edit-summary').value;
      const red_flags = document.getElementById('edit-redflags').value;
      const ordonnance = document.getElementById('edit-ordonnance').value;
      const subcatsRaw = document.getElementById('edit-subcats').value.trim();

      if (!id || !title) {
        alert('Titre obligatoire.');
        return;
      }

      let sub_cats = [];
      if (subcatsRaw) {
        try {
          sub_cats = JSON.parse(subcatsRaw);
        } catch (err) {
          alert('Format JSON invalide dans le champ Sous-Fiches : ' + err.message);
          return;
        }
      }

      try {
        const res = await fetch('/api/admin/cat-generator/update', {
          method: 'POST',
          headers: getAdminHeaders(),
          body: JSON.stringify({ id, title, category, search_keywords, summary, red_flags, ordonnance, sub_cats })
        });
        const data = await res.json();

        if (!res.ok || !data.success) throw new Error(data.error || 'Échec de l\'enregistrement');

        if (!data.validation.valid) {
          alert(`⚠️ Modifications enregistrées, mais avertissements de validation :\n${data.validation.errors.join('\n')}`);
        } else {
          alert(`✅ Fiche #${id} enregistrée avec succès!`);
        }

        closeEditModal();
        await loadData();
      } catch (err) {
        alert(`❌ Erreur: ${err.message}`);
      }
    }

    let customSubCatTags = [];

    function renderCustomSubCatTags() {
      const container = document.getElementById('custom-subcats-tags-list');
      if (!container) return;
      if (customSubCatTags.length === 0) {
        container.innerHTML = '<span style="font-size: 10.5px; color: var(--text-muted); font-style: italic;">Aucun profil personnalisé ajouté pour le moment.</span>';
        return;
      }
      container.innerHTML = customSubCatTags.map((tag, idx) => `
        <span style="display: inline-flex; align-items: center; gap: 4px; background: rgba(56, 189, 248, 0.15); border: 1px solid rgba(56, 189, 248, 0.4); color: #38bdf8; padding: 2px 7px; border-radius: 12px; font-size: 11px;">
          <span>${escapeHTML(tag)}</span>
          <button type="button" onclick="removeCustomSubCatTag(${idx})" style="background: none; border: none; color: var(--danger); cursor: pointer; padding: 0 2px; font-size: 11px; line-height: 1;">✕</button>
        </span>
      `).join('');
    }

    function addCustomSubCatTag() {
      const input = document.getElementById('single-custom-subcat-input');
      if (!input) return;
      const val = input.value.trim();
      if (!val) return;
      
      const parts = val.split(',').map(s => s.trim()).filter(Boolean);
      parts.forEach(p => {
        if (!customSubCatTags.includes(p)) customSubCatTags.push(p);
      });
      input.value = '';
      renderCustomSubCatTags();
      input.focus();
    }

    function removeCustomSubCatTag(idx) {
      customSubCatTags.splice(idx, 1);
      renderCustomSubCatTags();
    }

    function toggleGenMode() {
      const mode = document.querySelector('input[name="gen-mode"]:checked')?.value || 'auto';
      const panel = document.getElementById('subcats-config-panel');
      if (panel) {
        panel.style.display = mode === 'multi' ? 'block' : 'none';
      }
    }

    function openSingleModal() {
      document.getElementById('single-title').value = '';
      document.getElementById('single-category').value = 'Gastro-entérologie';
      const customUrlsEl = document.getElementById('single-custom-urls');
      if (customUrlsEl) customUrlsEl.value = '';

      // Reset generation mode to auto
      const autoRadio = document.querySelector('input[name="gen-mode"][value="auto"]');
      if (autoRadio) autoRadio.checked = true;
      document.querySelectorAll('.subcat-chk').forEach(c => c.checked = false);
      const customSubInput = document.getElementById('single-custom-subcat-input');
      if (customSubInput) customSubInput.value = '';
      customSubCatTags = [];
      renderCustomSubCatTags();
      toggleGenMode();

      document.getElementById('single-modal').classList.add('active');
      syncModalBodyLock();
    }

    function closeSingleModal() {
      document.getElementById('single-modal').classList.remove('active');
      syncModalBodyLock();
    }

    async function submitSingleCAT() {
      const title = document.getElementById('single-title').value.trim();
      const category = document.getElementById('single-category').value;
      const customUrlsEl = document.getElementById('single-custom-urls');
      const customUrls = customUrlsEl ? customUrlsEl.value.trim() : '';

      if (!title) {
        alert('Veuillez entrer un titre pour la CAT.');
        return;
      }

      const mode = document.querySelector('input[name="gen-mode"]:checked')?.value || 'auto';
      let requestedSubCats = [];
      let standardSingleOnly = false;

      if (mode === 'multi') {
        // Collect checked presets
        document.querySelectorAll('.subcat-chk:checked').forEach(c => {
          if (c.value && !requestedSubCats.includes(c.value)) requestedSubCats.push(c.value);
        });

        // Also check if any unsubmitted text remains in the custom input
        const remainingInput = document.getElementById('single-custom-subcat-input')?.value.trim();
        if (remainingInput) {
          const parts = remainingInput.split(',').map(s => s.trim()).filter(Boolean);
          parts.forEach(p => {
            if (!customSubCatTags.includes(p)) customSubCatTags.push(p);
          });
        }

        // Add all custom tags
        customSubCatTags.forEach(t => {
          if (t && !requestedSubCats.includes(t)) requestedSubCats.push(t);
        });

        if (requestedSubCats.length === 0) {
          if (!confirm("Aucun profil ni sous-fiche n'a été coché ou ajouté. Voulez-vous continuer en mode Automatique standard ?")) {
            return;
          }
        }
      } else if (mode === 'single_only') {
        standardSingleOnly = true;
      } else {
        // 'auto' mode: standardSingleOnly is false, requestedSubCats is []
        standardSingleOnly = false;
        requestedSubCats = [];
      }

      // Compute next available ID from v1 and v2
      const existingIds = [
        ...(appData.v1 || []).map(c => Number(c.id) || 0),
        ...(appData.v2 || []).map(c => Number(c.id) || 0)
      ];
      const nextId = existingIds.length > 0 ? Math.max(...existingIds) + 1 : 1;

      closeSingleModal();

      try {
        const isWebEnabled = document.getElementById('chk-enable-web')?.checked !== false;
        const offlineOnly = !isWebEnabled;

        // Step 1: Web Fetch with custom doctor URLs (only if web fetch enabled)
        if (isWebEnabled) {
          const webRes = await fetch('/api/admin/cat-generator/fetch-web', {
            method: 'POST',
            headers: getAdminHeaders(),
            body: JSON.stringify({ title, forceRefetch: false, customUrls })
          });
          const webData = await webRes.json();
          if (!webRes.ok || !webData.success) throw new Error(webData.error || 'Échec de la recherche web');
        }

        // Step 2: Dual RAG Single Generation
        const genRes = await fetch('/api/admin/cat-generator/single', {
          method: 'POST',
          headers: getAdminHeaders(),
          body: JSON.stringify({ 
            id: nextId, 
            title, 
            category,
            offlineOnly,
            customUrls,
            requestedSubCats,
            standardSingleOnly
          })
        });
        const genData = await genRes.json();
        if (!genRes.ok || !genData.success) throw new Error(genData.error || 'Échec de la génération V3');

        const subInfo = requestedSubCats.length > 0 
          ? ` (${requestedSubCats.length} sous-fiches incluses)` 
          : (standardSingleOnly ? ' (Fiche unique 1-tab)' : ' (Mode Auto)');
        alert(`✨ Nouvelle fiche #${nextId} "${title}" générée avec succès en V3 !${subInfo}`);
        await loadData();
      } catch (err) {
        alert(`❌ Erreur Création Nouvelle CAT: ${err.message}`);
      }
    }

    function initWebFetchOption() {
      const saved = localStorage.getItem('dr_cat_web_fetch_enabled');
      const chk = document.getElementById('chk-enable-web');
      if (chk) {
        // Default to true (enabled) unless admin explicitly disabled it
        chk.checked = saved !== 'false';
        toggleWebFetchOptions(false);
      }
    }

    function toggleWebFetchOptions(save = true) {
      const chk = document.getElementById('chk-enable-web');
      const enabled = chk ? chk.checked : true;
      if (save) {
        localStorage.setItem('dr_cat_web_fetch_enabled', enabled ? 'true' : 'false');
      }
      const container = document.getElementById('custom-url-container');
      const input = document.getElementById('custom-urls-input');
      const badge = document.getElementById('web-mode-badge');

      if (enabled) {
        if (container) { container.style.opacity = '1'; container.style.pointerEvents = 'auto'; }
        if (input) input.disabled = false;
        if (badge) {
          badge.textContent = '(Actuellement : 🌐 Web Fetch Activé — Dual RAG Web + PDFs)';
          badge.style.color = 'var(--primary)';
        }
      } else {
        if (container) { container.style.opacity = '0.4'; container.style.pointerEvents = 'none'; }
        if (input) input.disabled = true;
        if (badge) {
          badge.textContent = '(Actuellement : ⚡ 100% Hors-Ligne — Rapide 3s, PDFs uniquement)';
          badge.style.color = 'var(--success)';
        }
      }
    }

    async function regenerateSingleCAT(title, category, id) {
      const isV2 = appData.v2 && appData.v2.some(c => Number(c.id) === Number(id));
      const actionLabel = isV2 ? 'Régénérer' : 'Générer V3';
      const isWebEnabled = document.getElementById('chk-enable-web')?.checked || false;
      const offlineOnly = !isWebEnabled;
      const customUrls = isWebEnabled ? (document.getElementById('custom-urls-input')?.value || '')
        .split(',')
        .map(u => u.trim())
        .filter(Boolean) : [];

      const modeText = offlineOnly 
        ? 'Mode 100% Hors-Ligne (PDFs + Base Locale)' 
        : (customUrls.length > 0 ? `Mode Web Fetch avec Lien Manuel (${customUrls[0]})` : 'Mode Dual RAG (Web PubMed/MSD + PDFs)');

      if (!confirm(`Lancer la synthèse IA Step 2 (${modeText}) pour : "${title}" ?`)) return;

      try {
        const genRes = await fetch('/api/admin/cat-generator/single', {
          method: 'POST',
          headers: getAdminHeaders(),
          body: JSON.stringify({ id, title, category, offlineOnly, customUrls })
        });
        const genData = await genRes.json();
        if (!genRes.ok || !genData.success) throw new Error(genData.error || 'Échec de la génération V3');

        alert(`✨ Fiche #${id} "${title}" générée avec succès en V3 ! (${genData.metrics ? genData.metrics.model : 'Dual RAG'})`);
        await loadData();
      } catch (err) {
        alert(`❌ Erreur ${actionLabel}: ${err.message}`);
      }
    }

    async function deleteCAT(id, title) {
      if (!confirm(`Supprimer la fiche #${id} ("${title}") de la base V2 générée ?`)) return;

      try {
        const res = await fetch('/api/admin/cat-generator/delete', {
          method: 'POST',
          headers: getAdminHeaders(),
          body: JSON.stringify({ id })
        });
        const data = await res.json();
        if (!res.ok || !data.success) throw new Error(data.error || 'Échec de suppression');

        alert(`🗑️ ${data.message}`);
        await loadData();
      } catch (err) {
        alert(`❌ Erreur: ${err.message}`);
      }
    }

    async function promoteSingleCAT(id) {
      const cat = appData.v2.find(c => c.id === id);
      if (!cat) {
        alert("Fiche CAT introuvable.");
        return;
      }

      if (!confirm(`Promouvoir UNIQUEMENT la fiche #${id} ("${cat.title}") dans la base de production (cats_db.json) ?`)) return;

      try {
        const res = await fetch('/api/admin/cat-generator/promote-single', {
          method: 'POST',
          headers: getAdminHeaders(),
          body: JSON.stringify({ cat })
        });
        const data = await res.json();
        if (!res.ok || !data.success) throw new Error(data.error || 'Échec de la promotion individuelle');

        alert(`✅ ${data.message}`);
        await loadData();
      } catch (err) {
        alert(`❌ Erreur Promotion Individuelle: ${err.message}`);
      }
    }

    async function promoteV2() {
      if (!confirm(`Attention: Voulez-vous remplacer TOUTE la base de production (cats_db.json) par l'ensemble des ${appData.v2.length} fiches V3 ?`)) return;

      try {
        const res = await fetch('/api/admin/cat-generator/promote', {
          method: 'POST',
          headers: getAdminHeaders()
        });
        const data = await res.json();
        if (!res.ok || !data.success) throw new Error(data.error || 'Échec de promotion');

        alert(`💾 ${data.message}`);
        await loadData();
      } catch (err) {
        alert(`❌ Erreur Promotion: ${err.message}`);
      }
    }

    async function runBatchGeneration() {
      if (!confirm('Lancer la régénération Batch Step 2 de toutes les 55 CATs via Gemini 3.6 Flash en arrière-plan ?')) return;

      try {
        const res = await fetch('/api/admin/cat-generator/batch', {
          method: 'POST',
          headers: getAdminHeaders()
        });
        const data = await res.json();
        if (!res.ok || !data.success) throw new Error(data.error || 'Échec du lancement batch');

        alert(`🚀 ${data.message}`);
        pollProgress();
      } catch (err) {
        alert(`❌ Erreur: ${err.message}`);
      }
    }

    // --- V3 TELEMETRY & DIAGNOSTIC INSPECTOR ENGINE ---
    let debugLogs = [];
    let currentLogFilter = 'all';
    let isStreamPaused = false;
    let sseEventSource = null;

    function getEventCategory(type) {
      if (type.startsWith('web_')) return 'web';
      if (type.startsWith('pdf_')) return 'pdf';
      if (type.startsWith('active_learning')) return 'active_learning';
      if (type.startsWith('llm_') || type.startsWith('generation_')) return 'llm';
      if (type.startsWith('validation_') || type.startsWith('medical_')) return 'validation';
      return 'other';
    }

    function updateCategoryCounts() {
      const counts = { all: debugLogs.length, web: 0, pdf: 0, active_learning: 0, llm: 0, validation: 0 };
      for (const log of debugLogs) {
        const cat = getEventCategory(log.type);
        if (counts[cat] !== undefined) counts[cat]++;
      }
      for (const [k, v] of Object.entries(counts)) {
        const el = document.getElementById(`count-${k}`);
        if (el) el.textContent = v;
      }
    }

    function setLogFilter(filter) {
      currentLogFilter = filter;
      document.querySelectorAll('.btn-filter').forEach(btn => {
        btn.className = 'btn-filter badge badge-outline';
        btn.style.background = 'transparent';
      });
      const activeBtn = document.getElementById(`filter-${filter}`);
      if (activeBtn) {
        activeBtn.className = 'btn-filter badge badge-clinical';
      }
      renderDebugLogs();
    }

    function togglePauseStream() {
      isStreamPaused = !isStreamPaused;
      const btn = document.getElementById('btn-pause-stream');
      if (btn) {
        btn.textContent = isStreamPaused ? '▶️ Reprendre' : '⏸️ Pause';
        btn.style.color = isStreamPaused ? '#F59E0B' : 'inherit';
      }
    }

    async function clearDebugLogs() {
      try {
        await fetch('/api/admin/cat-generator/debug-logs', {
          method: 'DELETE',
          headers: getAdminHeaders()
        });
      } catch (_) {}
      debugLogs = [];
      updateCategoryCounts();
      renderDebugLogs();
    }

    async function copyDebugLogsToClipboard() {
      if (debugLogs.length === 0) {
        alert('ℹ️ Aucun log de télémétrie à copier.');
        return;
      }
      try {
        const payload = JSON.stringify(debugLogs, null, 2);
        await navigator.clipboard.writeText(payload);
        alert(`✅ ${debugLogs.length} événements de télémétrie JSON copiés dans le presse-papier !`);
      } catch (err) {
        // Fallback for non-secure contexts
        const ta = document.createElement('textarea');
        ta.value = JSON.stringify(debugLogs, null, 2);
        document.body.appendChild(ta);
        ta.select();
        document.execCommand('copy');
        document.body.removeChild(ta);
        alert(`✅ ${debugLogs.length} événements copiés dans le presse-papier !`);
      }
    }

    function renderDebugLogs() {
      const consoleBox = document.getElementById('terminal-console');
      if (!consoleBox) return;

      const filtered = currentLogFilter === 'all' 
        ? debugLogs 
        : debugLogs.filter(l => getEventCategory(l.type) === currentLogFilter);

      if (filtered.length === 0) {
        consoleBox.innerHTML = `<div style="color: #64748B; font-style: italic;">[Filtre: ${currentLogFilter}] Aucun événement enregistré dans cette catégorie.</div>`;
        return;
      }

      consoleBox.innerHTML = filtered.map(item => {
        const timeStr = item.timestamp ? item.timestamp.split('T')[1].replace('Z', '') : '--:--:--';
        const type = item.type || 'info';
        const p = item.payload || {};

        let badgeColor = '#38BDF8';
        let badgeIcon = 'ℹ️';
        let categoryName = type;

        if (type.startsWith('web_')) {
          badgeColor = '#38BDF8';
          badgeIcon = '🌐';
        } else if (type.startsWith('pdf_')) {
          badgeColor = '#F59E0B';
          badgeIcon = '📚';
        } else if (type.startsWith('active_learning')) {
          badgeColor = '#A855F7';
          badgeIcon = '🧠';
        } else if (type.startsWith('llm_') || type.startsWith('generation_')) {
          badgeColor = '#10B981';
          badgeIcon = '🤖';
        } else if (type.startsWith('validation_') || type.startsWith('medical_')) {
          badgeColor = p.valid === false ? '#EF4444' : '#EC4899';
          badgeIcon = '🩺';
        }

        // Build human-readable formatted summary
        let detailsHtml = '';
        if (type === 'web_fetch_start') {
          detailsHtml = `Recherche Web lancée pour <strong>"${p.title}"</strong> | Mots-clés: <code>${(p.keywords || []).join(', ')}</code>`;
        } else if (type === 'web_fetch_result') {
          detailsHtml = `<span style="color: #10B981;">✅ Source Recueillie:</span> <strong>${p.sourceName}</strong> (${p.domain}) — ${p.contentLength} car. ${p.isHighDensity ? '<span style="color: #F59E0B; font-weight: bold;">[High Density]</span>' : ''}<br><span style="color: #94A3B8; font-size: 10.5px; font-style: italic;">"${(p.previewSnippet || '').replace(/</g, '&lt;')}"</span>`;
        } else if (type === 'web_cache_hit') {
          detailsHtml = `Cache Web réutilisé pour <strong>"${p.title}"</strong> (${p.cachedCount} sources existantes sur disque).`;
        } else if (type === 'web_fetch_fail') {
          detailsHtml = `<span style="color: #EF4444;">⚠️ Échec Source Web (${p.source}):</span> ${p.error}`;
        } else if (type === 'pdf_search_start') {
          detailsHtml = `Scan Index PDF pour <strong>"${p.queryTerm}"</strong> | Tokens: <code>[${(p.tokens || []).join(', ')}]</code> (${p.totalDocuments} manuels indexés)`;
        } else if (type === 'pdf_match_found') {
          detailsHtml = `<span style="color: #F59E0B;">📄 Extrait PDF Trouvé:</span> <strong>${p.pdfFile}</strong> (Page ${p.page}) [Qualité: ${p.quality}]<br><span style="color: #94A3B8; font-size: 10.5px; font-style: italic;">"${(p.snippetPreview || '').replace(/</g, '&lt;')}"</span>`;
        } else if (type === 'pdf_top_slice_matched') {
          detailsHtml = `<span style="color: #10B981; font-weight: bold;">⭐ [Fiche Ciblée Détectée]</span> <strong>${p.count} document(s) dédié(s) :</strong> <code>${(p.slices || []).join(', ')}</code>`;
        } else if (type === 'pdf_search_done') {
          detailsHtml = `Scan PDF terminé pour "${p.queryTerm}" : <strong>${p.matchedDocumentsCount} document(s) pertinent(s)</strong> extraits.`;
        } else if (type === 'active_learning_checked') {
          detailsHtml = p.found 
            ? `<span style="color: #A855F7; font-weight: bold;">🧠 Mémoire Active Trouvée:</span> Corrections manuelles du médecin chargées pour "${p.title}".`
            : `Aucune mémoire manuelle précédente trouvée pour "${p.title}".`;
        } else if (type === 'llm_prompt_built') {
          detailsHtml = `Prompt IA assemblé pour <strong>"${p.title}"</strong> | Estim: <strong>${p.estimatedTokens} tokens</strong> (Sys: ${p.systemPromptChars} car / Usr: ${p.userPromptChars} car | Web: ${p.ragWebCount} | PDF: ${p.ragPdfCount})`;
        } else if (type === 'llm_model_attempt') {
          detailsHtml = `Tentative Modèle IA: <strong>${p.model}</strong> (Tentative ${p.attemptNumber}/${p.totalModelsAvailable})`;
        } else if (type === 'llm_response_received') {
          detailsHtml = `Réponse reçue de <strong>${p.model}</strong> en <strong>${p.latencyMs}ms</strong> | Tokens: <strong>${p.totalTokens}</strong> (${p.promptTokens} in / ${p.completionTokens} out)`;
        } else if (type === 'llm_parse_success') {
          detailsHtml = `<span style="color: #10B981;">✅ JSON Parser Réussi (Tentative ${p.attempt}):</span> Clés valides trouvées: [${(p.keysParsed || []).join(', ')}]`;
        } else if (type === 'validation_result') {
          detailsHtml = p.valid 
            ? `<span style="color: #10B981; font-weight: bold;">✅ Checksum Médical & Règles Thérapeutiques VALIDÉES</span> (0 erreur)`
            : `<span style="color: #EF4444; font-weight: bold;">❌ Échec Checksum Médical (Tentative ${p.attempt}):</span> ${(p.errors || []).join(' | ')}`;
        } else if (type === 'generation_done') {
          detailsHtml = `<strong style="color: #10B981;">🎉 Synthèse Complète Terminée pour "${p.title}":</strong> Modèle: ${p.model} | Latence: ${p.latencyMs}ms | Tokens: ${p.totalTokens}`;
        } else {
          detailsHtml = `<code>${JSON.stringify(p)}</code>`;
        }

        return `<div style="margin-bottom: 8px; padding-bottom: 6px; border-bottom: 1px solid rgba(255,255,255,0.04);">
          <span style="color: #64748B;">[${timeStr}]</span>
          <span style="color: ${badgeColor}; font-weight: 600;">${badgeIcon} [${type}]</span>
          <span style="color: #E2E8F0; margin-left: 4px;">${detailsHtml}</span>
        </div>`;
      }).join('');

      const chkAuto = document.getElementById('chk-autoscroll');
      if (chkAuto && chkAuto.checked) {
        consoleBox.scrollTop = consoleBox.scrollHeight;
      }
    }

    function initDebugSSE() {
      if (sseEventSource) {
        try { sseEventSource.close(); } catch (_) {}
      }

      const sseBadge = document.getElementById('sse-status-badge');
      
      try {
        sseEventSource = new EventSource('/api/admin/cat-generator/debug-stream');

        sseEventSource.onopen = () => {
          if (sseBadge) {
            sseBadge.textContent = '🟢 SSE Connecté';
            sseBadge.className = 'badge badge-valid';
          }
        };

        sseEventSource.onmessage = (event) => {
          if (isStreamPaused) return;
          try {
            const parsed = JSON.parse(event.data);
            if (parsed && parsed.type) {
              debugLogs.push(parsed);
              if (debugLogs.length > 500) debugLogs.shift();
              updateCategoryCounts();
              renderDebugLogs();
            }
          } catch (e) {}
        };

        sseEventSource.onerror = () => {
          if (sseBadge) {
            sseBadge.textContent = '🟡 Reconnexion SSE...';
            sseBadge.className = 'badge badge-warning';
          }
        };
      } catch (err) {
        if (sseBadge) {
          sseBadge.textContent = '🔴 SSE Non Disponible';
          sseBadge.className = 'badge badge-error';
        }
      }
    }

    let isPolling = false;

    async function pollProgress() {
      if (isPolling) return;
      isPolling = true;

      try {
        const res = await fetch('/api/admin/cat-generator/progress', {
          headers: getAdminHeaders()
        });
        if (!res.ok) return;
        const data = await res.json();
        const p = data.progress || {};

        const badge = document.getElementById('progress-badge');
        const percentEl = document.getElementById('progress-percent');
        const barFill = document.getElementById('progress-bar-fill');
        const statusText = document.getElementById('progress-status-text');

        if (p.running) {
          badge.textContent = p.type === 'batch_web' ? '🌐 Step 1 Web Fetch Active' : '⚡ Step 2 Dual RAG AI Active';
          badge.className = 'badge badge-warning';
          percentEl.textContent = `${p.percent}% (${p.current} / ${p.total})`;
          barFill.style.width = `${p.percent}%`;
          statusText.textContent = `En cours : ${p.currentTitle || p.statusText}`;
        } else {
          if (p.percent === 100 && badge.textContent !== 'Inactif') {
            badge.textContent = 'Terminé';
            badge.className = 'badge badge-valid';
            percentEl.textContent = '100% (55 / 55)';
            barFill.style.width = '100%';
            statusText.textContent = 'Dernière opération terminée avec succès.';
            await loadData();
          }
        }
      } catch (e) {
        console.error('Progress poll error', e);
      } finally {
        isPolling = false;
      }
    }

    function copyMasterPrompt() {
      const masterPrompt = `Tu es le moteur d'intelligence médicale de Dr. CAT (Doctor Clinical Action Protocol) alimenté par Gemini 3.6 Flash (Dual RAG + Human Active Learning Engine).
Ta mission est de synthétiser et de structurer une conduite à tenir (CAT) clinique ou administrative hautement précise, vérifiée et conforme aux recommandations médicales actuelles.

SOURCES ET RÉFÉRENCES (4 ANCRES DE VÉRITÉ MÉDICALE) :
- PubMed / NCBI PMC (ncbi.nlm.nih.gov) : Littérature scientifique évaluée par les pairs
- Manuel MSD Professionnel (msdmanuals.com) : Références diagnostiques et thérapeutiques
- MedG (medg.fr) : Consensus et synthèses cliniques françaises
- Wikipedia Médical FR (fr.wikipedia.org) : Définitions nosologiques et physiopathologie
- Algérie : Ministère de la Santé (sante.gov.dz), CNPM (cnpm.org.dz), SAMI (samidz.com).
- France & International : Vidal, HAS, SFMU, ANSM, MSF, WHO/OMS, CRAT.

1. HIÉRARCHIE DES SOURCES DE CONNAISSANCES :
   - PRIORITÉ 1 (SOCLE CLINIQUE DE RÉFÉRENCE) : FICHES DÉDIÉES DU CORPUS LOCAL (PDF Index)
     * Utilise les molécules disponibles localement, les posologies usuelles et les habitudes de prescription comme ancre thérapeutique prioritaire.
   - PRIORITÉ 2 (ENRICHISSEMENT CLINIQUE EN LIGNE) : DONNÉES WEB RAG (PubMed/NCBI, MSD Manuals, MedG, Wiki FR)
     * Fournit les critères diagnostiques récents, les scores pronostiques et les bilans paracliniques recommandés.
   - PRIORITÉ 3 (MÉMOIRE MÉDICALE ACTIVE) : Corrections et préférences de l'utilisateur médecin.
   - PRIORITÉ 4 (SYNTHÈSE ET VALIDATION) : Moteur de raisonnement Gemini (structuration élégante, fluidité médicale et anti-hallucination).

2. RÈGLE DE RÉDACTION DE L'ORDONNANCE (RÉPLIQUE RÉELLE EN 4 SECTIONS) :
   - Le champ "ordonnance" est une RÉPLIQUE CONCRÈTE D'ORDONNANCE DE CABINET prête à être imprimée/copiée.
   - Interdiction formelle de la liste plate numérotée (1, 2, 3, 4) confondant traitements et alternatives.
   - Structuration obligatoire en Markdown :

   **TRAITEMENT NON MÉDICAMENTEUX & RHD :**
   - Mesures diététiques, hydratation, repos, kinésithérapie, éviction des toxiques et éducation du patient.

   **1ère INTENTION (Traitement médicamenteux de choix) :**
   - DCI et/ou nom commercial usuel, forme galénique exacte (cp, sirop, sachet), posologie journalière concrète (ex: 1 cp matin, midi et soir au milieu des repas pendant 7 jours).
   - ⚠️ Mentionner le rappel d'allergie préalable si pertinent (ex: 'Vérifier l'absence d'allergie aux pénicillines/bêta-lactamines').

   **ALTERNATIVES [OU] (En cas d'allergie, échec, intolérance ou terrain spécifique) :**
   - Précéder TOUJOURS par la mention claire '[OU] Alternative' ou '2ème intention' avec le motif clinique (ex: '[OU] Alternative si allergie aux pénicillines : Azithromycine 500 mg à J1 puis 250 mg/j de J2 à J5').
   - Si deux traitements sont des alternatives exclusives, ajouter : '⚠️ ALTERNATIVE : Ne pas associer en première intention'.

   **TRAITEMENT SYMPTOMATIQUE / ADJUVANT (Si besoin / En option) :**
   - Traitements de confort ciblés uniquement sur les symptômes associés (ex: 'Uniquement si fièvre > 38.5°C : Paracétamol 1g...').

3. RÈGLES DE SÉCURITÉ CLINIQUE PAR TERRAIN :
   - Pédiatrie : Posologies obligatoirement exprimées en dose-poids (mg/kg/j ou cuillère-mesure selon le poids). Rappel du seuil néonatal (< 2 mois = avis spécialisé/hospitalier).
   - Grossesse / Allaitement : Respect strict des données du CRAT. Mentionner les contre-indications absolues (ex: IEC/ARA2, AINS aux T2/T3).
   - Insuffisance Rénale / Gériatrie : Adapter les doses selon le DFG (Cockcroft) et éliminer les molécules néphrotoxiques.
   - Psychiatrie & Interactions : Alerte sur le risque de syndrome sérotoninergique (ISRS + Tramadol) et d'allongement du QTc.
   - Anti-Hallucination : N'invente AUCUNE section pédiatrique ou gynécologique si la pathologie ne la concerne pas.

STRUCTURE MODULAIRE CLINIQUE DU CHAMP "summary" (Inclure uniquement les étapes pertinentes. Ne JAMAIS écrire "sans objet" ou "non disponible" ; si une étape n'est pas pertinente, l'omettre entièrement) :
- **0. Stabilisation Immédiate & ABCDE :** (Uniquement en cas d'urgence vitale détresse respiratoire/choc/coma. Omettre si non-urgent).
- **1. Évaluation initiale & Diagnostic :** (Interrogatoire, sémiologie clinique fine, critères diagnostiques positifs).
- **2. Conduite immédiate si drapeau rouge :** (Mesures urgentes : transfert SMUR, hospitalisation, isolement, arrêt du traitement suspect. Ne pas dupliquer la liste descriptive des symptômes qui figure dans le champ red_flags).
- **3. Examens complémentaires :** (Bilan de 1ère intention et 2nde intention, imagerie, biologie, ECG).
- **3bis. Terrain, Comorbidités & Contrôle Iatrogène :** (Filtre Allergies, adaptation au DFG/clairance, précautions grossesse/pédiatrie, évitement des interactions médicamenteuses à risque. Omettre entièrement si sans objet).
- **4. Prise en charge & Stratégie Thérapeutique :** (Stratégie thérapeutique globale, mesures d'hygiène/RHD, et DCI académiques de référence avec leurs fourchettes posologiques cibles ex: Amoxicilline 50-80 mg/kg/j).
- **5. Orientation, Suivi & Volet Médico-Légal :** (Suivi ambulatoire vs hospitalier, éviction scolaire/collective, MDO - Maladies à Déclaration Obligatoire, aptitude à la conduite, ALD 30, arrêt de travail).

FORMAT DE RÉPONSE ATTENDU (EXCLUSIVEMENT DU JSON VALIDE) :
{
  "category": "Gastro-entérologie",
  "title": "CAT devant [PATHOLOGIE]",
  "search_keywords": ["mot-clé 1", "mot-clé 2"],
  "summary": "...",
  "red_flags": "Critères de gravité / Signes d'alarme cliniques (liste à puces)...",
  "ordonnance": "Réplique d'ordonnance de cabinet en 4 sections...",
  "sub_cats": []
}`;

      navigator.clipboard.writeText(masterPrompt).then(() => {
        alert('📋 Prompt Maître Dr.CAT copié dans le presse-papier !');
      }).catch(() => {
        prompt('Copiez le prompt maître :', masterPrompt);
      });
    }

    // Auto-poll progress every 2 seconds for batch progress bar
    setInterval(pollProgress, 2000);

    // Initializations
    initWebFetchOption();
    loadData();
    pollProgress();
    initDebugSSE();
