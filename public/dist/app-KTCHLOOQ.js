import{f as Bn}from"./chunk-5IYLHDAW.js";import{$ as se,A as yn,B as Me,C as yt,D as bn,E as vn,F as hn,G as xn,H as bt,I as wn,J as nt,K as En,L as Cn,M as Sn,N as vt,O as b,P as he,Q as In,R as w,S as at,T as Ln,U as Pe,V as ht,W as Re,X as xe,Y as X,Z as kn,_ as An,a as l,b as Q,c as _e,d as rn,e as sn,f as Je,g as Xe,h as J,i as re,j as Ze,k as et,l as ln,m as cn,n as fe,o as mt,p as me,q as gt,r as dn,s as pn,t as un,u as tt,w as fn,x as De,y as mn,z as gn}from"./chunk-AMF7JEYV.js";import{a as P,b as O,c as te,d as F}from"./chunk-BFZZBIPU.js";var ce=[],_n=200,ze=!1,le={};function we(e,t,n={}){let i=new Date().toLocaleTimeString("fr-FR",{hour12:!1}),o=t.map(a=>{if(a instanceof Error)return a.message+`
`+a.stack;if(typeof a=="object")try{return JSON.stringify(a)}catch{return String(a)}return String(a)}).join(" ");ce.push({timestamp:i,level:e,message:o,...n}),ce.length>_n&&ce.shift(),ze&&Et()}var Tn=!1;function Sa(e,t){we(e,t)}function xt(e,t="",n="runtime_error"){try{let i=String(e||"");if(i.includes("403")||i.includes("Forbidden")||i.includes("Unauthorized")||i.includes("Failed to load reports"))return;Bn({error:e,stack:t,logs:ce,type:n}).catch(()=>{})}catch{}}function Ia(){if(Tn)return;Tn=!0,le={log:console.log,warn:console.warn,error:console.error,info:console.info};let e={apply(t,n,i){let o=t===le.error?"ERROR":t===le.warn?"WARN":t===le.info?"INFO":"LOG";if(Sa(o,i),o==="ERROR"){let a=i.find(c=>c instanceof Error),s=a?a.message:i.map(c=>typeof c=="object"?JSON.stringify(c):String(c)).join(" "),r=a&&a.stack?a.stack:"";xt(s,r,"console_error")}return Reflect.apply(t,n,i)}};console.log=new Proxy(le.log,e),console.warn=new Proxy(le.warn,e),console.error=new Proxy(le.error,e),console.info=new Proxy(le.info,e),window.addEventListener("error",t=>{let n=`${t.message} at ${t.filename}:${t.lineno}:${t.colno}`;we("ERROR",[n,t.error]),xt(t.message||n,t.error?.stack||n,"unhandled_error")}),window.addEventListener("unhandledrejection",t=>{let n=t.reason,i=n?.message||String(n);we("ERROR",[`Unhandled Promise Rejection: ${i}`]),xt(`Unhandled Rejection: ${i}`,n?.stack||String(n),"unhandled_rejection")}),window.addEventListener("drcat-fetch-event",t=>{let{url:n,method:i,status:o,duration:a,error:s}=t.detail;s?we("ERROR",[`${i} ${n} \u2192 FAILED (${a}ms): ${s}`],{network:{url:n,method:i,status:0,duration:a}}):we("NETWORK",[`${i} ${n} \u2192 ${o} (${a}ms)`],{network:{url:n,method:i,status:o,duration:a}})}),we("INFO",["\u{1F680} Debug Console initialized."])}function wt(e){return String(e||"").replace(/[&<>"']/g,t=>({"&":"&amp;","<":"&lt;",">":"&gt;",'"':"&quot;","'":"&#39;"})[t])}function Et(){let e=document.getElementById("debug-console-content");if(e){if(ce.length===0){e.innerHTML='<div style="color: #64748b; padding: 20px; text-align: center;">Aucun log pour le moment.</div>';return}e.innerHTML=ce.map(t=>`<div class="log-row ${(t.level||"info").toLowerCase()}" style="padding: 4px 8px; font-family: monospace; font-size: 11px; line-height: 1.4; display: flex; gap: 8px;">
      <span class="log-time" style="white-space: nowrap;">[${wt(t.timestamp)}]</span>
      <span class="log-level" style="font-weight: bold; min-width: 50px;">${wt(t.level)}</span>
      <span class="log-message" style="word-break: break-all;">${wt(t.message)}</span>
    </div>`).join(""),setTimeout(()=>{e.scrollTop=e.scrollHeight},0)}}function $n(){let e=document.getElementById("debug-console-panel");ze=!ze,e.style.display=ze?"flex":"none",ze&&Et()}function La(){if(!document.getElementById("debug-console-styles")){let e=document.createElement("style");e.id="debug-console-styles",e.textContent=`
      #debug-toggle-btn {
        position: fixed;
        bottom: 20px;
        right: 20px;
        width: 48px;
        height: 48px;
        border-radius: 50%;
        background: #0f172a;
        border: 2px solid #06b6d4;
        color: #06b6d4;
        font-size: 22px;
        z-index: 999999;
        display: flex;
        align-items: center;
        justify-content: center;
        cursor: pointer;
        box-shadow: 0 4px 20px rgba(6, 182, 212, 0.4);
        transition: transform 0.2s ease;
        font-family: sans-serif;
        user-select: none;
        -webkit-tap-highlight-color: transparent;
      }
      #debug-toggle-btn:hover {
        transform: scale(1.1);
      }
      #debug-toggle-btn .badge {
        position: absolute;
        top: -4px;
        right: -4px;
        background: #ef4444;
        color: white;
        font-size: 9px;
        font-weight: 700;
        width: 18px;
        height: 18px;
        border-radius: 50%;
        display: flex;
        align-items: center;
        justify-content: center;
        border: 2px solid #0f172a;
        display: none;
      }
      #debug-toggle-btn .badge.show {
        display: flex;
      }

      #debug-console-panel {
        position: fixed;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        background: rgba(9, 13, 22, 0.95);
        backdrop-filter: blur(8px);
        z-index: 999998;
        display: none;
        flex-direction: column;
        padding: 16px;
        box-sizing: border-box;
      }
      #debug-console-panel .header {
        display: flex;
        justify-content: space-between;
        align-items: center;
        padding-bottom: 12px;
        border-bottom: 1px solid #334155;
        flex-shrink: 0;
      }
      #debug-console-panel .header h3 {
        color: #06b6d4;
        margin: 0;
        font-size: 16px;
        display: flex;
        align-items: center;
        gap: 10px;
        font-family: sans-serif;
      }
      #debug-console-panel .header .actions {
        display: flex;
        gap: 10px;
      }
      #debug-console-panel .header .actions button {
        background: #1e293b;
        border: 1px solid #334155;
        color: #94a3b8;
        padding: 6px 12px;
        border-radius: 6px;
        font-size: 11px;
        font-weight: 600;
        cursor: pointer;
        font-family: sans-serif;
      }
      #debug-console-panel .header .actions button:hover {
        background: #334155;
        color: #f8fafc;
      }
      #debug-console-panel .header .actions button.close-btn {
        background: rgba(239, 68, 68, 0.15);
        border-color: rgba(239, 68, 68, 0.3);
        color: #f87171;
      }
      #debug-console-content {
        flex-grow: 1;
        overflow-y: auto;
        margin-top: 12px;
        background: rgba(0,0,0,0.3);
        border-radius: 8px;
        padding: 8px 0;
        font-family: monospace;
        font-size: 11px;
        line-height: 1.4;
        color: #e2e8f0;
        scroll-behavior: smooth;
      }
      #debug-console-content::-webkit-scrollbar {
        width: 4px;
      }
      #debug-console-content::-webkit-scrollbar-thumb {
        background: #334155;
        border-radius: 4px;
      }
      .light-theme #debug-toggle-btn {
        background: #ffffff;
        border-color: #0891b2;
        color: #0891b2;
        box-shadow: 0 4px 20px rgba(8, 145, 178, 0.2);
      }
      .light-theme #debug-console-panel {
        background: rgba(241, 245, 249, 0.95);
      }
      .light-theme #debug-console-panel .header h3 {
        color: #0891b2;
      }
      .light-theme #debug-console-content {
        color: #0f172a;
        background: rgba(0,0,0,0.03);
      }
      .light-theme #debug-console-content div {
        border-bottom-color: rgba(0,0,0,0.05);
      }

      /* Dynamic high-contrast theme-friendly log text colors */
      #debug-console-content .log-row {
        border-bottom: 1px solid rgba(255,255,255,0.03);
      }
      .light-theme #debug-console-content .log-row {
        border-bottom-color: rgba(0,0,0,0.05);
      }
      #debug-console-content .log-time {
        color: #64748b;
      }
      .light-theme #debug-console-content .log-time {
        color: #475569;
      }
      #debug-console-content .log-message {
        color: #e2e8f0;
      }
      .light-theme #debug-console-content .log-message {
        color: #0f172a;
      }

      /* Dark Theme Log Colors (Vibrant/Light) */
      #debug-console-content .log-row.error .log-level { color: #f87171; }
      #debug-console-content .log-row.warn .log-level { color: #fbbf24; }
      #debug-console-content .log-row.info .log-level { color: #38bdf8; }
      #debug-console-content .log-row.network .log-level { color: #a78bfa; }
      #debug-console-content .log-row .log-level { color: #94a3b8; }

      /* Light Theme Log Colors (High Contrast/Darker) */
      .light-theme #debug-console-content .log-row.error .log-level { color: #dc2626; }
      .light-theme #debug-console-content .log-row.warn .log-level { color: #b45309; }
      .light-theme #debug-console-content .log-row.info .log-level { color: #0891b2; }
      .light-theme #debug-console-content .log-row.network .log-level { color: #6d28d9; }
      .light-theme #debug-console-content .log-row .log-level { color: #475569; }
    `,document.head.appendChild(e)}if(!document.getElementById("debug-toggle-btn")){let e=document.createElement("div");e.id="debug-toggle-btn",e.innerHTML='\u{1F41B}<span class="badge" id="debug-badge"></span>';let t=P("drCatDebugConsoleVisible")==="true";e.style.display=t?"flex":"none",document.body.appendChild(e),e.addEventListener("click",()=>{$n()})}if(!document.getElementById("debug-console-panel")){let e=document.createElement("div");e.id="debug-console-panel",e.innerHTML=`
      <div class="header">
        <h3>\u{1F41B} Debug Console <span style="font-size: 11px; color: #64748b; font-weight:400;">(${_n} max)</span></h3>
        <div class="actions">
          <button id="debug-copy-btn">\u{1F4CB} Copier</button>
          <button id="debug-clear-btn">\u{1F5D1} Vider</button>
          <button class="close-btn" id="debug-close-btn">\u2715 Fermer</button>
        </div>
      </div>
      <div id="debug-console-content"></div>
    `,document.body.appendChild(e),e.style.display="none",document.getElementById("debug-close-btn")?.addEventListener("click",$n),document.getElementById("debug-clear-btn")?.addEventListener("click",()=>{ce=[],Et()}),document.getElementById("debug-copy-btn")?.addEventListener("click",()=>{let t=ce.map(n=>`[${n.timestamp}] [${n.level}] ${n.message}`).join(`
`);navigator.clipboard?.writeText(t).then(()=>{alert("Logs copi\xE9s dans le presse-papier !")}).catch(()=>{let n=document.createElement("textarea");n.value=t,document.body.appendChild(n),n.select(),document.execCommand("copy"),document.body.removeChild(n),alert("Logs copi\xE9s !")})})}}function Dn(){Ia(),La();let e=0,t=null,n=10,i=2e3,o=()=>{if(e++,t&&clearTimeout(t),t=setTimeout(()=>{e=0},i),e>=n){e=0,clearTimeout(t);let s=document.getElementById("debug-toggle-btn");s&&(s.style.display==="flex"?(s.style.display="none",te("drCatDebugConsoleVisible"),b("\u{1F41B} Mode D\xE9bogage d\xE9sactiv\xE9.","fa-bug",3e3)):(s.style.setProperty("display","flex","important"),O("drCatDebugConsoleVisible","true"),b("\u{1F41B} Mode D\xE9bogage activ\xE9 !","fa-bug",5e3)))}},a=()=>{let s=document.getElementById("brand-logo"),r=document.getElementById("mobile-brand-logo");s&&(s.removeEventListener("click",o),s.addEventListener("click",o)),r&&(r.removeEventListener("click",o),r.addEventListener("click",o))};a(),setTimeout(a,500),console.log("\u{1F4F1} Dr.CAT Debug Console active.")}var j,it,ne,U,Ct;function ka(e,t){let n=e.parentElement;if(!n)return;let i=document.createElement("div");i.className="ptr-indicator",i.innerHTML='<i class="fa-solid fa-arrows-rotate"></i>',n.insertBefore(i,e);let o=64,a=0,s=!1,r=!1,c=null,p=0,d=m=>{r||n.scrollTop>0||(a=m.touches?m.touches[0].clientY:m.clientY,s=!0,p=0)},f=m=>{if(!s||r)return;let E=(m.touches?m.touches[0].clientY:m.clientY)-a;if(E<=0){p=0,n.style.transform="",i.classList.remove("visible");return}if(n.scrollTop>0){s=!1;return}m.cancelable&&m.preventDefault(),p=Math.min(E*.5,o+24),!se()&&(c||(c=requestAnimationFrame(()=>{n.style.transform=`translateY(${p}px)`,i.classList.add("visible"),i.style.opacity=String(Math.min(p/o,1)),c=null})))},u=async()=>{if(c&&(cancelAnimationFrame(c),c=null),!s||r){s=!1;return}s=!1;let m=p;if(p=0,n.style.transform="",i.style.opacity="",i.classList.remove("visible"),m>=o){r=!0,i.classList.add("spinning");try{await t()}finally{i.classList.remove("spinning"),r=!1}}};n.addEventListener("touchstart",d,{passive:!0}),n.addEventListener("touchmove",f,{passive:!1}),n.addEventListener("touchend",u),n.addEventListener("mousedown",d),n.addEventListener("mousemove",f),window.addEventListener("mouseup",u)}function It(e){switch(e){case"done":return"Ma\xEEtris\xE9";case"doing":return"En cours";default:return"\xC0 faire"}}function Mn(e,t,n){j=document.getElementById("cat-list"),it=document.getElementById("search-input"),ne=document.getElementById("category-filter"),U=document.getElementById("sidebar"),Ct=document.getElementById("sidebar-overlay");let i=document.getElementById("open-sidebar-btn"),o=document.getElementById("close-sidebar-btn");j&&j.addEventListener("click",E=>{let y=E.target.closest(".cat-item");if(!y)return;let x=parseInt(y.getAttribute("data-id"),10);if(isNaN(x))return;let C=l.allCats.find(T=>T.id===x);if(C){let T=parseInt(y.getAttribute("data-matched-subcat")||"0",10);e(C,T),window.innerWidth<=850&&U&&U.classList.remove("open")}}),it&&it.addEventListener("input",An(()=>St(t),150)),ne&&ne.addEventListener("change",()=>St(t));let a=document.querySelectorAll(".status-pill");a.forEach(E=>{E.addEventListener("click",()=>{a.forEach(y=>y.classList.remove("active")),E.classList.add("active"),l.activeStatusFilter=E.getAttribute("data-filter"),St(t)})}),i&&i.addEventListener("click",()=>{U.classList.add("open")}),o&&o.addEventListener("click",()=>{U.classList.remove("open")});let s=document.getElementById("sidebar-tab-cats"),r=document.getElementById("sidebar-tab-pdfs"),c=document.getElementById("sidebar-tab-quiz");function p(E){[s,r,c].forEach(y=>{y&&y.classList.remove("active")}),E&&E.classList.add("active")}s&&s.addEventListener("click",()=>{if(p(s),l.activeCat)e(l.activeCat);else{let E=document.getElementById("brand-logo");E&&E.click()}window.innerWidth<=850&&U&&U.classList.remove("open")}),r&&r.addEventListener("click",()=>{p(r),window.openStandaloneLibrary&&window.openStandaloneLibrary(),window.innerWidth<=850&&U&&U.classList.remove("open")}),c&&c.addEventListener("click",()=>{p(c);let E=document.getElementById("start-quiz-nav-btn");E&&E.click(),window.innerWidth<=850&&U&&U.classList.remove("open")});let d=document.getElementById("controls-toggle-btn"),f=document.getElementById("controls-panel"),u=document.getElementById("controls-toggle-icon");P("sidebar_controls_collapsed")==="true"&&f&&(f.classList.add("collapsed"),u&&u.classList.add("rotated")),d&&f&&d.addEventListener("click",()=>{let E=f.classList.toggle("collapsed");u&&u.classList.toggle("rotated",E),O("sidebar_controls_collapsed",E)}),U&&Ln(U),Ct&&U&&Ct.addEventListener("click",()=>{U.classList.remove("open")});let v=document.getElementById("apk-download-btn");v&&(!!window.Capacitor||window.Capacitor&&window.Capacitor.isNativePlatform&&window.Capacitor.isNativePlatform()||navigator.userAgent&&navigator.userAgent.toLowerCase().includes("capacitor")?v.style.display="none":v.style.display="inline-flex"),j&&n&&ka(j,n)}function Lt(e){if(ne||(ne=document.getElementById("category-filter")),!ne)return;let t=new Set(e.map(n=>n.category));ne.innerHTML='<option value="all">Toutes les sp\xE9cialit\xE9s</option>',t.forEach(n=>{let i=document.createElement("option");i.value=n,i.textContent=n,ne.appendChild(i)})}var Oe=new Map;function Aa(e){let t=document.createElement("li"),n=!!e.parent_id;t.className=`cat-item ${n?"cat-item-subcat":""}`,t.setAttribute("data-id",e.id);let i="";n&&(i='<span class="badge" style="font-size:9.5px; padding:1px 5px; background:rgba(168,85,247,0.15); color:#c084fc; border:1px solid rgba(168,85,247,0.3);"><i class="fa-solid fa-code-branch"></i> Sous-fiche</span>');let o="";if(e._matchedSubCatIdx>=0&&Array.isArray(e.sub_cats)&&e.sub_cats[e._matchedSubCatIdx]){let a=e.sub_cats[e._matchedSubCatIdx].label||`Sous-fiche ${e._matchedSubCatIdx+1}`,s=a.length>35?a.substring(0,32)+"\u2026":a;o=`<div class="cat-item-subcat-match" style="font-size:9.5px; padding:2px 6px; margin-top:2px; border-radius:6px; background:rgba(168,85,247,0.12); color:#c084fc; border:1px solid rgba(168,85,247,0.25); white-space:nowrap; overflow:hidden; text-overflow:ellipsis; max-width:100%;"><i class="fa-solid fa-arrow-turn-down" style="margin-right:3px;"></i> ${w(s)}</div>`,t.setAttribute("data-matched-subcat",String(e._matchedSubCatIdx+1))}else t.setAttribute("data-matched-subcat","0");return t.innerHTML=`
    <div class="cat-indicator ${e.status}"></div>
    <div class="cat-item-content">
      <span class="cat-item-title">${e.id}. ${w(e.title)}</span>
      <div class="cat-item-meta">
        <span class="cat-item-cat">${w(e.category)}</span>
        ${i}
        <span class="cat-item-status">${It(e.status)}</span>
      </div>
      ${o}
    </div>
  `,t}function Ba(e,t){let n=!!t.parent_id;e.className=`cat-item ${n?"cat-item-subcat":""} ${l.activeCat&&l.activeCat.id===t.id?"active":""}`,e.setAttribute("data-id",t.id);let i=e.querySelector(".cat-item-title");i&&(i.textContent=`${t.id}. ${t.title}`);let o=e.querySelector(".cat-item-cat");o&&(o.textContent=t.category);let a=e.querySelector(".cat-item-status");a&&(a.textContent=It(t.status));let s=e.querySelector(".cat-indicator");s&&(s.className=`cat-indicator ${t.status}`);let r=e.querySelector(".cat-item-subcat-match");if(t._matchedSubCatIdx>=0&&Array.isArray(t.sub_cats)&&t.sub_cats[t._matchedSubCatIdx]){let c=t.sub_cats[t._matchedSubCatIdx].label||`Sous-fiche ${t._matchedSubCatIdx+1}`,p=c.length>35?c.substring(0,32)+"\u2026":c;if(e.setAttribute("data-matched-subcat",String(t._matchedSubCatIdx+1)),r)r.innerHTML=`<i class="fa-solid fa-arrow-turn-down" style="margin-right:3px;"></i> ${w(p)}`;else{let d=e.querySelector(".cat-item-content");if(d){let f=document.createElement("div");f.className="cat-item-subcat-match",f.style.cssText="font-size:9.5px; padding:2px 6px; margin-top:2px; border-radius:6px; background:rgba(168,85,247,0.12); color:#c084fc; border:1px solid rgba(168,85,247,0.25); white-space:nowrap; overflow:hidden; text-overflow:ellipsis; max-width:100%;",f.innerHTML=`<i class="fa-solid fa-arrow-turn-down" style="margin-right:3px;"></i> ${w(p)}`,d.appendChild(f)}}}else e.setAttribute("data-matched-subcat","0"),r&&r.remove()}function Ta(e){if(!e||!e.isConnected)return;if(se()){e.remove();return}e.classList.add("cat-item-exit");let t=!1,n=()=>{t||(t=!0,e.remove())};e.addEventListener("animationend",n,{once:!0}),setTimeout(n,250)}function He(e,t){if(window.perf&&window.perf.startMeasure("sidebar.renderCatList"),j||(j=document.getElementById("cat-list")),!j)return;if(j.querySelectorAll(".cat-item-skeleton").forEach(r=>r.remove()),e.length===0){Oe.clear();let r=!l.allCats||l.allCats.length===0;if(j.innerHTML=`
      <li class="empty-state">
        <div style="text-align: center; padding: 32px 16px; color: var(--text-muted);">
          <i class="fa-solid ${r?"fa-folder-open":"fa-filter-circle-xmark"}" style="font-size: 28px; margin-bottom: 10px; display: block; opacity: 0.6;"></i>
          <span style="font-size: 13px; line-height: 1.5;">${r?"Aucune fiche disponible pour le moment.":"Aucune fiche ne correspond \xE0 vos filtres actuels."}</span>
          ${r?'<button id="sidebar-retry-btn" class="btn-secondary" style="margin-top: 12px; padding: 6px 14px; border-radius: 8px; cursor: pointer; font-size: 12px;">Recharger</button>':""}
        </div>
      </li>`,r){let c=j.querySelector("#sidebar-retry-btn");c&&c.addEventListener("click",()=>location.reload())}window.perf&&(window.perf.endMeasure("sidebar.renderCatList"),window.perf.recordMilestone("sidebarRendered"));return}let n=new Set(e.map(r=>r.id));for(let[r,c]of Oe)n.has(r)||(Oe.delete(r),Ta(c));let i=document.createDocumentFragment(),o=!1,a=0,s=null;e.forEach(r=>{let c=Oe.get(r.id);c?Ba(c,r):(c=Aa(r),Oe.set(r.id,c),i.appendChild(c),o=!0,se()||(c.classList.add("cat-item-enter"),c.style.animationDelay=`${Math.min(a,8)*30}ms`,c.addEventListener("animationend",()=>{c.classList.remove("cat-item-enter"),c.style.animationDelay=""},{once:!0}),a++)),s?c!==s.nextSibling&&j.insertBefore(c,s.nextSibling):c!==j.firstChild&&j.insertBefore(c,j.firstChild),s=c}),o&&j.appendChild(i),window.perf&&(window.perf.endMeasure("sidebar.renderCatList"),window.perf.recordMilestone("sidebarRendered"))}function Pn(e){let t=document.querySelector(`.cat-item[data-id="${e.id}"]`);if(!t)return;let n=t.querySelector(".cat-indicator"),i=t.querySelector(".cat-item-meta span:last-child");n&&(n.className=`cat-indicator ${e.status}`),i&&(i.textContent=It(e.status))}function q(e){return e?String(e).normalize("NFD").replace(/[\u0300-\u036f]/g,"").toLowerCase().replace(/[`'’"“”«»\-–—_:;,?.!/\\()[\]{}*+]/g," ").replace(/\s+/g," ").trim():""}function St(e){let t=q(it.value),n=ne.value,i=t?t.split(/\s+/).filter(Boolean):[],o=l.allCats.filter(a=>{if(!a)return!1;if(!a._searchTokenStr){let p=q(a.title),d=q(a.summary||a.customSummary),f=q(a.ordonnance||a.customOrdonnance),u=q(a.red_flags),m=q(a.category),v=q(a.notes),E=Array.isArray(a.pdf_keywords)?a.pdf_keywords.filter(C=>C&&typeof C=="string").map(C=>q(C)).join(" "):q(a.pdf_keywords),y=Array.isArray(a.sub_cats)?a.sub_cats.map(C=>`${q(C.label)} ${q(C.summary)} ${q(C.ordonnance)}`).join(" "):"",x=a.id!==void 0&&a.id!==null?String(a.id):"";a._searchTokenStr=`${x} ${p} ${m} ${d} ${f} ${u} ${E} ${v} ${y}`}let s=i.length===0||i.every(p=>a._searchTokenStr.includes(p));if(a._matchedSubCatIdx=-1,s&&i.length>0&&Array.isArray(a.sub_cats)&&a.sub_cats.length>0){let p=`${q(a.title)} ${q(a.category)}`;if(!i.every(f=>p.includes(f)))for(let f=0;f<a.sub_cats.length;f++){let u=a.sub_cats[f],m=`${q(u.label)} ${q(u.summary)} ${q(u.ordonnance)} ${q(u.red_flags)}`;if(i.every(v=>m.includes(v))){a._matchedSubCatIdx=f;break}}}let r=n==="all"||a.category===n,c=!0;if(l.activeStatusFilter==="todo")c=a.status==="todo";else if(l.activeStatusFilter==="doing")c=a.status==="doing";else if(l.activeStatusFilter==="done")c=a.status==="done";else if(l.activeStatusFilter==="redflags"){let p=(a.red_flags||"").toLowerCase();c=p.length>0&&!p.includes("aucun signe de gravit\xE9")&&!p.includes("aucun")}return s&&r&&c});e&&e(o)}function Rn(e){let t=new Date().toLocaleDateString("fr-FR"),n=["===========================================","\u{1FA7A} Dr.CAT \u2014 Aide \xE0 la D\xE9cision M\xE9dicale Clinique","\u{1F468}\u200D\u2695\uFE0F Dr. Kibeche Ali","===========================================",`
\u{1F4CB} FICHE N\xB0 ${e.id} : ${e.title.toUpperCase()}`,`\u{1F4C2} Sp\xE9cialit\xE9 : ${e.category}`,`\u{1F4C5} Date : ${t}`,"-------------------------------------------"];e.red_flags&&e.red_flags.trim()&&(n.push(`
\u{1F6A8} SIGNES DE GRAVIT\xC9 (RED FLAGS) :`),n.push(e.red_flags.trim()));let i=e.customSummary||e.summary;i&&i.trim()&&(n.push(`
\u{1F4D1} CONDUITE \xC0 TENIR PRINCIPALE :`),n.push(i.trim()));let o=e.customOrdonnance||e.ordonnance;return o&&o.trim()&&(n.push(`
\u{1F48A} ORDONNANCE TYPE & POSOLOGIES :`),n.push(o.trim())),Array.isArray(e.sub_cats)&&e.sub_cats.length>0&&(n.push(`
-------------------------------------------`),n.push(`\u{1F500} PROFILS PARTICULIERS & SOUS-FICHES (${e.sub_cats.length})`),n.push("-------------------------------------------"),e.sub_cats.forEach((a,s)=>{n.push(`
\u2501\u2501\u2501 \u{1F539} Sous-Fiche ${s+1} : ${a.label||"Profil Sp\xE9cialis\xE9"} \u2501\u2501\u2501`),a.red_flags&&a.red_flags.trim()&&a.red_flags!==e.red_flags&&n.push(`
\u{1F6A8} Red Flags Sp\xE9cifiques :
${a.red_flags.trim()}`),a.summary&&a.summary.trim()&&n.push(`
\u{1F4CB} Conduite \xE0 Tenir :
${a.summary.trim()}`),a.ordonnance&&a.ordonnance.trim()&&n.push(`
\u{1F48A} Ordonnance :
${a.ordonnance.trim()}`)})),e.notes&&e.notes.trim()&&(n.push(`
-------------------------------------------`),n.push("\u{1F4DD} MES NOTES & PROTOCOLES LOCAUX :"),n.push(e.notes.trim())),n.push(`
===========================================`),n.push("G\xE9n\xE9r\xE9 via Dr.CAT Rappel Clinique (Dr. Kibeche Ali)"),n.push("==========================================="),n.join(`
`)}function Ee(e,t,n){let i=document.getElementById("summary-view");if(!i)return;let o=e||t?.summary||t?.synthese||"",a="";if(l.activeSubCatIndex>0&&n&&(a=`
      <div class="subcat-intext-return-banner">
        <span class="subcat-intext-return-label">
          <i class="fa-solid fa-code-branch"></i> Sous-Fiche : <strong>${w(n)}</strong>
        </span>
        <button type="button" class="subcat-intext-return-btn" onclick="window.switchToSubProfile(0)">
          <i class="fa-solid fa-arrow-left"></i> Revenir \xE0 la fiche principale
        </button>
      </div>
    `),i.innerHTML=a+at(o),l.isAdmin&&t&&t.history&&t.history.length>0){let s='<div class="cat-history-section" style="margin-top:20px; border-top:1px dashed var(--border-color); padding-top:14px; pointer-events:none;">';s+='<h4 style="font-size:11.5px; color:var(--text-secondary); margin-bottom:8px; display:flex; align-items:center; gap:6px;"><i class="fa-solid fa-clock-rotate-left"></i> Historique des versions</h4>',s+='<ul style="list-style:none; padding:0; margin:0; font-size:11px; color:var(--text-muted); display:flex; flex-direction:column; gap:4px;">',t.history.slice(-10).reverse().forEach(c=>{let p=new Date(c.timestamp).toLocaleDateString("fr-FR",{day:"2-digit",month:"2-digit",year:"numeric",hour:"2-digit",minute:"2-digit"});s+=`<li><span style="font-weight:600; color:var(--text-secondary);">${p}</span> \u2014 ${w(c.detail||c.action)}</li>`}),s+="</ul></div>",i.innerHTML+=s}}var Hn="dr_cat_ordonnance_mode";function _a(){try{return localStorage.getItem(Hn)||"detailed"}catch{return"detailed"}}function zn(e){try{localStorage.setItem(Hn,e)}catch{}}function Da(e){if(!e||typeof e!="string")return"Pas d'ordonnance type r\xE9dig\xE9e.";let t=e.split(`
`),n=[],i="",o=null,a=[];for(let r=0;r<t.length;r++){let c=t[r].trim();if(c){if(/\b1[èe]re\s+INTENTION\b/i.test(c)){i="1ere";continue}else if(/\bALTERNATIVES?\s*\[OU\]/i.test(c)||/\b2[èe]me\s+INTENTION\b/i.test(c)){i="alternatives";continue}else if(/\bTRAITEMENT\s+NON\s+M[ÉE]DICAMENTEUX\b/i.test(c)||/\bRHD\b/i.test(c)){i="rhd";continue}else if(/\bTRAITEMENT\s+SYMPTOMATIQUE\b/i.test(c)||/\bADJUVANT\b/i.test(c)){i="adjuvant";continue}if(i==="1ere"||i==="adjuvant"){let p=c.startsWith("-")||c.startsWith("*")||c.startsWith("\u2022"),d=c.replace(/^[-*•]\s*/,"").trim();if(/^[⚠️ℹ️💡]/.test(d)||/^Vérifier\s+impérativement/i.test(d)||/^Rappels?\b/i.test(d))continue;if(p&&(d.includes("(")||d.includes(":")||d.includes("mg")||d.includes("g/"))){o&&n.push({drug:o,posology:a.join(" ").trim()});let f=d.split(":");if(o=f[0].replace(/\*\*/g,"").trim(),a=[],f.length>1&&f[1].trim()){let u=f[1].replace(/\*\*/g,"").replace(/^[⚠️ℹ️💡].*$/,"").trim();u&&a.push(u)}}else if(o&&(c.startsWith("*")||c.startsWith("-")||c.startsWith("\u2022")||c.startsWith("\u2514"))){let f=c.replace(/^[-*•└─]\s*/,"").replace(/\*\*/g,"").trim();!/^[⚠️ℹ️💡]/.test(f)&&!/^Vérifier/i.test(f)&&a.push(f)}else!o&&p&&d.length>5&&n.push({drug:d.replace(/\*\*/g,""),posology:""})}}}if(o&&n.push({drug:o,posology:a.join(" ").trim()}),n.length===0)return e.replace(/\*\*(.*?)\*\*/g,"$1").replace(/^[#-]\s*/gm,"").trim();let s="";return n.forEach((r,c)=>{let p=r.posology.match(/pendant\s+(\d+\s*(?:jours?|semaines?|mois))/i)||r.drug.match(/pendant\s+(\d+\s*(?:jours?|semaines?|mois))/i),d=p?p[1]:"",f=d?` \u2500\u2500\u2500\u2500\u2500\u2500 QSP ${d}`:"",u=r.drug.replace(/:\s*$/,"").trim();if(s+=`${c+1}. ${u}${f}
`,r.posology){let m=r.posology.replace(/\s*\*+\s*/g," ").replace(/\s+/g," ").trim();s+=`   Posologie : ${m}

`}else s+=`
`}),s.trim()}function Ma(e){return!e||typeof e!="string"?"Pas d'ordonnance type r\xE9dig\xE9e.":e}var On=!1;function kt(){if(On)return;let e=document.getElementById("ordo-mode-detailed"),t=document.getElementById("ordo-mode-express");e&&t&&(e.addEventListener("click",()=>{zn("detailed"),ae()}),t.addEventListener("click",()=>{zn("express"),ae()}),On=!0)}function ae(e,t){let n=document.getElementById("workspace-prescription"),i=document.getElementById("prescription-variants-selector"),o=document.getElementById("stamp-code"),a=document.getElementById("ordo-mode-detailed"),s=document.getElementById("ordo-mode-express");kt();let r=t||l.activeCat;if(o){let f=r&&r.id!==void 0?String(r.id).padStart(2,"0"):"01",u=new Date().getFullYear();o.textContent=`N\xB0 ${f}/CAT-${u}`}if(!n)return;let c=e||r?.ordonnance||r?.prescription||"";if(!c){n.textContent="Pas d'ordonnance type r\xE9dig\xE9e.",i&&(i.style.display="none"),l.prescriptionVariants=[];return}l.prescriptionVariants=In(c);let p=c;if(l.prescriptionVariants.length>1){i&&(i.style.display="flex",i.innerHTML="",l.activePrescriptionVariantIndex>=l.prescriptionVariants.length&&(l.activePrescriptionVariantIndex=0),l.prescriptionVariants.forEach((u,m)=>{let v=document.createElement("button");v.className=`status-pill ${m===l.activePrescriptionVariantIndex?"active":""}`,v.style.fontSize="12px",v.style.padding="5px 12px",v.textContent=u.title,v.addEventListener("click",()=>{l.activePrescriptionVariantIndex=m,i.querySelectorAll(".status-pill").forEach((E,y)=>{y===m?E.classList.add("active"):E.classList.remove("active")}),ae()}),i.appendChild(v)}));let f=l.prescriptionVariants[l.activePrescriptionVariantIndex]||l.prescriptionVariants[0];p=f?f.content:c}else i&&(i.style.display="none");let d=_a();a&&s&&(d==="express"?(s.classList.add("active"),a.classList.remove("active")):(a.classList.add("active"),s.classList.remove("active"))),d==="express"?n.textContent=Da(p):n.textContent=Ma(p)}function de(){let e=document.getElementById("library-screen"),t=document.getElementById("quiz-screen"),n=document.getElementById("workspace"),i="dashboard";e&&e.style.display!=="none"?i="library":t&&t.style.display!=="none"?i="quiz":n&&n.style.display!=="none"&&l.activeCat&&(i="workspace");let o=document.querySelector(".tab-btn.active"),a=o?o.getAttribute("data-tab"):null,s=document.getElementById("pdf-content-search-input"),r=document.getElementById("pdf-search-results-container"),c=document.getElementById("lib-deep-search-input"),p=document.getElementById("lib-filter-input"),d=document.getElementById("lib-search-results-container"),f=document.getElementById("lib-search-results-card"),u=document.getElementById("omni-search-input"),m=document.getElementById("omni-search-results"),v={currentView:i,scrollY:window.scrollY||document.documentElement.scrollTop||0,activeCatId:l.activeCat?l.activeCat.id:null,activeSubCatIndex:typeof l.activeSubCatIndex=="number"?l.activeSubCatIndex:0,activeTab:a,activePrescriptionVariantIndex:l.activePrescriptionVariantIndex||0,pdfSearchQuery:s?s.value:"",pdfSearchResultsHTML:r?r.innerHTML:"",libSearchQuery:c?c.value:"",libFilterQuery:p?p.value:"",libSearchResultsHTML:d?d.innerHTML:"",libResultsVisible:f?f.style.display!=="none":!1,omniQuery:u?u.value:"",omniVisible:m?m.style.display!=="none":!1};O("dr_cat_navigation_state",JSON.stringify(v))}function Bt(){let e=P("dr_cat_navigation_state");if(e)try{let t=F(e,{});if(te("dr_cat_navigation_state"),t.currentView==="library"){if(typeof window.openStandaloneLibrary=="function"&&window.openStandaloneLibrary(t.libSearchQuery||""),t.libFilterQuery){let n=document.getElementById("lib-filter-input");n&&(n.value=t.libFilterQuery,n.dispatchEvent(new Event("input",{bubbles:!0})))}if(t.libSearchResultsHTML&&t.libSearchResultsHTML.trim().length>0){let n=document.getElementById("lib-search-results-container"),i=document.getElementById("lib-search-results-card");n&&(n.innerHTML=t.libSearchResultsHTML,i&&t.libResultsVisible&&(i.style.display="block"),n.querySelectorAll(".pdf-search-result-card, [data-pdf]").forEach(o=>{o.addEventListener("click",()=>{de();let a=decodeURIComponent(o.getAttribute("data-pdf")||""),s=o.getAttribute("data-page")||"1";a&&(window.location.href=`pdf_viewer.html?file=${encodeURIComponent(a)}&page=${s}`)})}))}typeof t.scrollY=="number"&&t.scrollY>0&&setTimeout(()=>window.scrollTo({top:t.scrollY,behavior:"instant"}),60);return}if(t.activeCatId){let n=document.querySelector(`.cat-item[data-id="${t.activeCatId}"]`);if(n&&n.click(),typeof t.activeSubCatIndex=="number"&&t.activeSubCatIndex>0&&setTimeout(()=>{let i=document.querySelector(`.subcat-pill[data-sub-index="${t.activeSubCatIndex}"]`);i&&i.click()},40),t.activeTab&&t.activeTab!=="tab-summary"&&setTimeout(()=>{let i=document.querySelector(`.tab-btn[data-tab="${t.activeTab}"]`);i&&i.click()},60),t.pdfSearchQuery){let i=document.getElementById("pdf-content-search-input");i&&(i.value=t.pdfSearchQuery)}if(t.pdfSearchResultsHTML){let i=document.getElementById("pdf-search-results-container");i&&(i.innerHTML=t.pdfSearchResultsHTML,i.querySelectorAll(".pdf-search-result-card").forEach(o=>{o.addEventListener("click",()=>{de();let a=decodeURIComponent(o.getAttribute("data-pdf")),s=o.getAttribute("data-page");window.location.href=`pdf_viewer.html?file=${encodeURIComponent(a)}&page=${s}`})}))}typeof t.scrollY=="number"&&t.scrollY>0&&setTimeout(()=>window.scrollTo({top:t.scrollY,behavior:"instant"}),90);return}if(t.currentView==="quiz"){let n=document.getElementById("start-quiz-nav-btn");n&&n.click()}}catch(t){console.error("Failed to restore app navigation state:",t)}}function At(e){if(!e)return"";let t=w(e);if(t.includes("|")){let a=t.split(`
`),s=!1,r='<table class="print-table">',c=!0;for(let p=0;p<a.length;p++){let d=a[p].trim();if(d.startsWith("|")&&d.endsWith("|")){if(s||(s=!0,c=!0),d.includes("---"))continue;let f=d.split("|").slice(1,-1).map(m=>m.trim()),u=c?"th":"td";r+="<tr>"+f.map(m=>`<${u}>${m}</${u}>`).join("")+"</tr>",c=!1}else s&&(s=!1,r+="</table>",a[p]=r+`
`+a[p],r='<table class="print-table">')}s&&(r+="</table>",a.push(r)),t=a.filter(p=>!(p.trim().startsWith("|")&&p.trim().endsWith("|"))).join(`
`)}t=t.replace(/\*\*([^*\n]+)\*\*/g,"<strong>$1</strong>"),t=t.replace(/\[(.*?)\]\(subcat:[0-9]+\)/g,'<span class="inline-sub-tag">\u21B3 $1</span>'),t=t.replace(/\[\[subcat:[0-9]+:(.*?)\]\]/g,'<span class="inline-sub-tag">\u21B3 $1</span>');let n=t.split(`
`),i=!1,o=[];for(let a=0;a<n.length;a++){let s=n[a].trim();if(!s){i&&(i=!1,o.push("</ul>"));continue}if(s.startsWith("<table")||s.startsWith("</table")||s.startsWith("<tr>")){i&&(i=!1,o.push("</ul>")),o.push(s);continue}s.startsWith("- ")||s.startsWith("\u2022 ")||s.startsWith("* ")?(i||(i=!0,o.push("<ul>")),o.push("<li>"+s.replace(/^[-•*]\s*/,"")+"</li>")):(i&&(i=!1,o.push("</ul>")),o.push("<p>"+s+"</p>"))}return i&&o.push("</ul>"),o.join("")}function Nn(e){if(!e)return"";let t=/(?:^|\n)(?:\*\*|#{2,4}\s*)([0-9]+(?:bis|ter)?\.\s*[^\n]+)(?:\n|$)/gi,n=[...e.matchAll(t)];if(n.length<2)return At(e);let i=[],o=0;for(let a=0;a<n.length;a++){let s=n[a],r=s[1].trim().replace(/^\*\*|\*\*$/g,"").replace(/:\s*$/,"").replace(/\*\*$/,"").trim(),c=s.index;if(a===0&&c>0){let p=e.substring(0,c).trim();p&&i.push({header:null,content:p})}a>0&&(i[i.length-1].content=e.substring(o,c).trim()),i.push({header:r,content:""}),o=c+s[0].length}return i.length>0&&(i[i.length-1].content=e.substring(o).trim()),i.map(a=>{if(!a.header)return`<div class="step-intro">${At(a.content)}</div>`;let s=a.header.charAt(0);return`
      <div class="step-block">
        <div class="step-title step-title-${["0","1","2","3","4"].includes(s)?s:"1"}">${w(a.header)}</div>
        <div class="step-body">${At(a.content)}</div>
      </div>
    `}).join("")}function qn(e){if(!e)return;let t=new Date().toLocaleDateString("fr-FR"),n=`${e.id}. ${e.title}`,i=e.category||"M\xE9decine G\xE9n\xE9rale",o=e.red_flags||"",a=e.customSummary||e.summary||"",s=Nn(a),r=e.customOrdonnance||e.ordonnance||"",c=Array.isArray(e.sub_cats)?e.sub_cats:[],p=e.notes||"",d="";c.length>0&&(d=`
      <div class="subcats-section">
        <div class="subcats-header">\u{1F500} PROFILS PARTICULIERS & SOUS-FICHES (${c.length})</div>
        <div class="subcat-grid">
          ${c.map((v,E)=>`
            <div class="subcat-card">
              <div class="subcat-card-title"><span class="subcat-badge">${E+1}</span> ${w(v.label||"Profil Sp\xE9cialis\xE9")}</div>
              ${v.red_flags&&v.red_flags.trim()&&v.red_flags!==o?`
                <div class="subcat-rf"><strong>\u{1F6A8} Alerte :</strong> ${w(v.red_flags)}</div>
              `:""}
              <div class="subcat-body">
                ${Nn(v.summary||"")}
              </div>
              ${v.ordonnance&&v.ordonnance.trim()?`
                <div class="subcat-rx-box">
                  <span class="subcat-rx-tag">\u{1F48A} Rx :</span>
                  <pre class="subcat-rx-text">${w(v.ordonnance)}</pre>
                </div>
              `:""}
            </div>
          `).join("")}
        </div>
      </div>
    `);let f=`<!DOCTYPE html>
<html lang="fr">
<head>
  <meta charset="utf-8">
  <title>Dr.CAT \u2014 ${w(n)}</title>
  <style>
    @page {
      size: A4 portrait;
      margin: 10mm 12mm 10mm 12mm;
    }
    * {
      box-sizing: border-box;
      -webkit-print-color-adjust: exact !important;
      print-color-adjust: exact !important;
    }
    body {
      margin: 0;
      padding: 0;
      font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Helvetica, Arial, sans-serif;
      color: #0f172a;
      background: #ffffff;
      font-size: 10.5pt;
      line-height: 1.45;
    }
    /* Sleek Doctor-Grade Letterhead */
    .doc-header {
      display: flex;
      justify-content: space-between;
      align-items: flex-end;
      border-bottom: 2.5px solid #0891b2;
      padding-bottom: 4px;
      margin-bottom: 8px;
    }
    .brand-title {
      font-size: 13.5pt;
      font-weight: 800;
      color: #0891b2;
      letter-spacing: -0.3px;
    }
    .brand-sub {
      font-size: 9pt;
      color: #64748b;
      font-weight: 500;
      margin-left: 4px;
    }
    .doc-meta {
      text-align: right;
      font-size: 9pt;
      color: #475569;
      line-height: 1.3;
    }
    .author-name {
      font-weight: 800;
      color: #0891b2;
    }
    /* Main Title Strip */
    .title-strip {
      display: flex;
      align-items: center;
      gap: 8px;
      margin-bottom: 8px;
    }
    .cat-badge {
      background: #0891b2;
      color: #ffffff;
      font-size: 8.5pt;
      font-weight: 800;
      text-transform: uppercase;
      padding: 2.5px 7px;
      border-radius: 4px;
      letter-spacing: 0.3px;
      white-space: nowrap;
    }
    .main-title {
      font-size: 14pt;
      font-weight: 800;
      color: #0f172a;
      margin: 0;
      line-height: 1.25;
    }
    /* Compact Red Flags Banner */
    .rf-banner {
      background: #fef2f2;
      border: 1px solid #fecaca;
      border-left: 4px solid #dc2626;
      padding: 5px 9px;
      margin-bottom: 8px;
      border-radius: 4px;
      font-size: 9.5pt;
      color: #991b1b;
      line-height: 1.35;
      page-break-inside: avoid;
      break-inside: avoid;
    }
    .rf-label {
      font-weight: 800;
      color: #b91c1c;
      margin-right: 5px;
    }
    /* Clinical Steps Typography */
    .step-block {
      margin-bottom: 6px;
      page-break-inside: avoid;
      break-inside: avoid;
    }
    .step-title {
      font-size: 10.5pt;
      font-weight: 800;
      padding: 2.5px 7px;
      border-radius: 4px;
      margin-bottom: 3px;
      display: inline-block;
      letter-spacing: 0.2px;
    }
    .step-title-0 { background: #fee2e2; color: #991b1b; border-left: 3px solid #ef4444; }
    .step-title-1 { background: #e0f2fe; color: #0369a1; border-left: 3px solid #0284c7; }
    .step-title-2 { background: #dcfce7; color: #15803d; border-left: 3px solid #16a34a; }
    .step-title-3 { background: #fef3c7; color: #b45309; border-left: 3px solid #d97706; }
    .step-title-4 { background: #f3e8ff; color: #6b21a8; border-left: 3px solid #9333ea; }
    
    .step-body {
      font-size: 10pt;
      line-height: 1.4;
      color: #1e293b;
      padding-left: 6px;
    }
    .step-body p {
      margin: 0 0 4px 0;
    }
    .step-body ul {
      margin: 2px 0 4px 16px;
      padding: 0;
    }
    .step-body li {
      margin-bottom: 2px;
    }
    .step-body strong {
      color: #0f172a;
    }
    /* Tables */
    .print-table {
      width: 100%;
      border-collapse: collapse;
      margin: 6px 0 8px 0;
      font-size: 9pt;
    }
    .print-table th, .print-table td {
      border: 1px solid #cbd5e1;
      padding: 4px 7px;
      text-align: left;
    }
    .print-table th {
      background: #f1f5f9;
      font-weight: 800;
    }
    /* In-Text Subcat References */
    .inline-sub-tag {
      background: #ecfeff;
      border: 1px solid #a5f3fc;
      color: #0891b2;
      font-weight: 700;
      font-size: 9pt;
      padding: 1px 5px;
      border-radius: 3px;
      display: inline-block;
    }
    /* Compact Rx Card */
    .rx-card {
      background: #f8fafc;
      border: 1px solid #cbd5e1;
      border-left: 4px solid #0891b2;
      padding: 7px 10px;
      border-radius: 4px;
      margin: 8px 0;
      page-break-inside: avoid;
      break-inside: avoid;
    }
    .rx-header {
      font-size: 10pt;
      font-weight: 800;
      color: #0891b2;
      margin-bottom: 3px;
    }
    .rx-body {
      font-family: inherit;
      font-size: 9.5pt;
      line-height: 1.4;
      white-space: pre-wrap;
      margin: 0;
      color: #0f172a;
    }
    /* Sub-CATs Section */
    .subcats-section {
      border-top: 1.5px dashed #cbd5e1;
      padding-top: 6px;
      margin-top: 8px;
    }
    .subcats-header {
      font-size: 10.5pt;
      font-weight: 800;
      color: #0891b2;
      margin-bottom: 5px;
    }
    .subcat-grid {
      display: grid;
      grid-template-columns: 1fr;
      gap: 8px;
    }
    .subcat-card {
      background: #fafafa;
      border: 1px solid #e2e8f0;
      border-left: 3.5px solid #06b6d4;
      border-radius: 4px;
      padding: 6px 8px;
      page-break-inside: avoid;
      break-inside: avoid;
    }
    .subcat-card-title {
      font-size: 10pt;
      font-weight: 800;
      color: #0891b2;
      margin-bottom: 3px;
    }
    .subcat-badge {
      background: #0891b2;
      color: #ffffff;
      font-size: 8pt;
      padding: 1px 5px;
      border-radius: 8px;
      margin-right: 3px;
    }
    .subcat-rf {
      background: #fff5f5;
      border-left: 2.5px solid #ef4444;
      padding: 3px 6px;
      font-size: 9pt;
      color: #991b1b;
      margin-bottom: 4px;
      border-radius: 2px;
    }
    .subcat-body {
      font-size: 9.5pt;
      line-height: 1.35;
    }
    .subcat-body p {
      margin: 0 0 3px 0;
    }
    .subcat-rx-box {
      background: #ffffff;
      border: 1px dashed #cbd5e1;
      padding: 4px 7px;
      margin-top: 4px;
      border-radius: 3px;
    }
    .subcat-rx-tag {
      font-weight: 800;
      color: #0891b2;
      font-size: 8.5pt;
      margin-right: 4px;
    }
    .subcat-rx-text {
      margin: 0;
      font-family: inherit;
      font-size: 8.5pt;
      line-height: 1.3;
      white-space: pre-wrap;
      display: inline;
    }
    /* Notes */
    .notes-box {
      border: 1px solid #e2e8f0;
      border-left: 3.5px solid #8b5cf6;
      border-radius: 4px;
      padding: 5px 8px;
      background: #faf5ff;
      font-style: italic;
      font-size: 9.5pt;
      margin-top: 6px;
      page-break-inside: avoid;
      break-inside: avoid;
    }
    /* Footer */
    .doc-footer {
      border-top: 1px solid #cbd5e1;
      padding-top: 4px;
      margin-top: 10px;
      display: flex;
      justify-content: space-between;
      font-size: 8pt;
      color: #64748b;
      page-break-inside: avoid;
      break-inside: avoid;
    }
  </style>
</head>
<body>
  <div class="doc-header">
    <div>
      <span class="brand-title">Dr.CAT \u{1FA7A}</span>
      <span class="brand-sub">\u2014 Aide \xE0 la D\xE9cision Clinique</span>
    </div>
    <div class="doc-meta">
      <div>\xC9dit\xE9 le ${t}</div>
      <div class="author-name">Dr. Kibeche Ali</div>
    </div>
  </div>

  <div class="title-strip">
    <span class="cat-badge">${w(i)}</span>
    <h1 class="main-title">${w(n)}</h1>
  </div>

  ${o&&o.trim()?`
    <div class="rf-banner">
      <span class="rf-label">\u{1F6A8} RED FLAGS :</span>${w(o)}
    </div>
  `:""}

  <div class="summary-section">
    ${s}
  </div>

  ${r&&r.trim()?`
    <div class="rx-card">
      <div class="rx-header">\u{1F48A} ORDONNANCE TYPE & POSOLOGIES RECOMMAND\xC9ES :</div>
      <pre class="rx-body">${w(r)}</pre>
    </div>
  `:""}

  ${d}

  ${p&&p.trim()?`
    <div class="notes-box">
      <strong>\u{1F4DD} Notes :</strong> ${w(p)}
    </div>
  `:""}

  <div class="doc-footer">
    <div>"Primum non nocere." \u2014 Dr.CAT Rappel Clinique (Protocoles Th\xE9rapeutiques)</div>
    <div>Auteur : Dr. Kibeche Ali</div>
  </div>
</body>
</html>`,u=document.createElement("iframe");u.style.position="fixed",u.style.right="0",u.style.bottom="0",u.style.width="0",u.style.height="0",u.style.border="none",u.style.opacity="0",u.style.pointerEvents="none",document.body.appendChild(u);let m=u.contentWindow.document;m.open(),m.write(f),m.close(),setTimeout(()=>{try{u.contentWindow.focus(),u.contentWindow.print()}catch(v){console.error("Iframe print failed:",v),window.print()}finally{setTimeout(()=>{u&&u.parentNode&&u.parentNode.removeChild(u)},3e3)}},250)}function ot(e,t=!1){if(!e||typeof e!="string")return document.createElement("div");let n=he(e),i=document.createElement("a"),o=String(e),a=o.toLowerCase().endsWith(".docx");i.href=a?`pdfs/${encodeURIComponent(o)}`:`pdf_viewer.html?file=${encodeURIComponent(o)}&page=1`,a&&(i.target="_blank"),i.className="pdf-card";let s=a?"fa-regular fa-file-word text-primary":t?"fa-solid fa-book-open-reader":"fa-solid fa-file-pdf",r=l.pdfIndexStatus&&l.pdfIndexStatus[o]||{status:"red",pagesWithText:0,totalPages:0},c=a?"#ef4444":r.status==="green"?"#10b981":r.status==="orange"?"#f59e0b":"#ef4444",p=a?"Document Word (Non indexable, convertissez en PDF pour la recherche)":r.status==="green"?`Indexation compl\xE8te (${r.pagesWithText}/${r.totalPages} pages index\xE9es)`:r.status==="orange"?`Indexation partielle (${r.pagesWithText}/${r.totalPages} pages index\xE9es)`:`Non indexable (0/${r.totalPages} pages, PDF scann\xE9 sans texte)`;i.innerHTML=`
    <i class="${s}" style="${t&&!a?"color: var(--color-success);":""}"></i>
    <div style="flex-grow: 1; min-width: 0;">
      <h4 style="display: flex; align-items: center; justify-content: space-between; gap: 8px; width: 100%; margin: 0;">
        <span style="overflow: hidden; text-overflow: ellipsis; white-space: nowrap;">${n}</span>
        <span class="pdf-status-dot" style="width: 7px; height: 7px; background-color: ${c}; border-radius: 50%; display: inline-block; flex-shrink: 0;" title="${p}"></span>
      </h4>
      <span>${a?"Document Word":t?"Ouvrir le manuel g\xE9n\xE9ral":"Ouvrir le cours PDF"}</span>
    </div>
  `;let d=i.querySelector(".pdf-status-dot");return d&&d.addEventListener("click",f=>{f.preventDefault(),f.stopPropagation(),b(p,"fa-circle-info",4e3)}),i}function Tt(e){let t=document.getElementById("all-pdfs-list");!t||!Array.isArray(e)||(t.innerHTML="",e.forEach(n=>{if(!n||typeof n!="string")return;let i=String(n),o=he(i),a=document.createElement("li"),s=i.toLowerCase().endsWith(".docx"),r=s?"fa-regular fa-file-word":"fa-solid fa-file-pdf",c=s?`pdfs/${encodeURIComponent(i)}`:`pdf_viewer.html?file=${encodeURIComponent(i)}&page=1`,p=l.pdfIndexStatus&&l.pdfIndexStatus[i]||{status:"red",pagesWithText:0,totalPages:0},d=s?"#ef4444":p.status==="green"?"#10b981":p.status==="orange"?"#f59e0b":"#ef4444",f=s?"Document Word (Non indexable, convertissez en PDF pour la recherche)":p.status==="green"?`Indexation compl\xE8te (${p.pagesWithText}/${p.totalPages} pages index\xE9es)`:p.status==="orange"?`Indexation partielle (${p.pagesWithText}/${p.totalPages} pages index\xE9es)`:`Non indexable (0/${p.totalPages} pages, PDF scann\xE9 sans texte)`;a.innerHTML=`
      <a href="${c}" ${s?'target="_blank"':""} class="all-pdfs-list-item" style="display: flex; align-items: center; justify-content: space-between; width: 100%;">
        <div style="display: flex; align-items: center; gap: 10px; min-width: 0; flex-grow: 1;">
          <i class="${r}"></i>
          <span style="overflow: hidden; text-overflow: ellipsis; white-space: nowrap;">${o} (${s?"Word":"PDF"})</span>
        </div>
        <span class="pdf-status-dot" style="width: 8px; height: 8px; background-color: ${d}; border-radius: 50%; flex-shrink: 0; margin-left: 8px;" title="${f}"></span>
      </a>
    `;let u=a.querySelector(".pdf-status-dot");u&&u.addEventListener("click",m=>{m.preventDefault(),m.stopPropagation(),b(f,"fa-circle-info",4e3)}),t.appendChild(a)}))}function Fn(){let e=document.getElementById("all-pdfs-list"),t=document.getElementById("pdf-search");if(!e||!t)return;let n=(t.value||"").toLowerCase().trim();e.querySelectorAll("li").forEach(o=>{let a=(o.textContent||"").toLowerCase();o.style.display=!n||a.includes(n)?"block":"none"})}function Pa(e){let t=(e||"").toLowerCase(),n=he(e).toLowerCase();if(Array.isArray(l.allCats)){let i=Array.from(new Set(l.allCats.map(o=>o.category))).filter(Boolean);for(let o of i){let a=o.toLowerCase();if(n.includes(a)||t.includes(a.slice(0,5)))return o}}return t.includes("urgenc")||t.includes("reanimat")||t.includes("choc")||t.includes("ecg")||t.includes("reflex")?"Urgences & R\xE9animation":t.includes("pediatr")||t.includes("eruptiv")||t.includes("nourrisson")?"P\xE9diatrie":t.includes("gyneco")||t.includes("grossesse")||t.includes("contracept")||t.includes("femme")?"Gyn\xE9cologie - Obst\xE9trique":t.includes("gastro")||t.includes("digestif")||t.includes("asp")?"Gastro-ent\xE9rologie":t.includes("dermato")||t.includes("gale")||t.includes("panaris")?"Dermatologie":t.includes("pneumo")||t.includes("thoracique")||t.includes("poumon")?"Pneumologie":t.includes("cardio")||t.includes("hta")||t.includes("coronaire")?"Cardiologie":t.includes("orl")||t.includes("ophtalmo")||t.includes("blepharite")?"ORL & Ophtalmologie":t.includes("infect")||t.includes("antibiot")||t.includes("inflammatoire")?"Infectiologie":t.includes("neuro")||t.includes("psycho")||t.includes("psychiatr")?"Neurologie & Psychiatrie":t.includes("medicament")||t.includes("ordonnance")||t.includes("posolog")||t.includes("formule")?"Th\xE9rapeutique & Pharmacologie":t.includes("radio")||t.includes("bilan")||t.includes("certificat")||t.includes("accident")?"Imagerie, Bilans & L\xE9gislation":"M\xE9decine G\xE9n\xE9rale & Divers"}function jn(e){let t=document.getElementById("library-screen"),n=document.getElementById("welcome-screen"),i=document.getElementById("workspace"),o=document.getElementById("quiz-screen"),a=document.getElementById("library-back-dash-btn");a&&e&&(a.onclick=()=>e());let s=F(P("drcat_lib_accordions_state"),{})||{},r=P("drcat_lib_search_collapsed")==="true";function c(){O("drcat_lib_accordions_state",JSON.stringify(s))}function p(z=""){let g=document.getElementById("lib-specialties-container"),I=document.getElementById("lib-pdf-count");if(!g||!Array.isArray(l.allPdfs))return;let B=z.toLowerCase().trim(),$={};l.allPdfs.forEach(D=>{if(!D||typeof D!="string")return;let G=he(D),Y=Pa(D);B&&!G.toLowerCase().includes(B)&&!Y.toLowerCase().includes(B)||($[Y]||($[Y]=[]),$[Y].push(D))});let k=Object.keys($).sort(),N=0;if(k.forEach(D=>{N+=$[D].length}),I&&(I.textContent=N),k.length===0){g.innerHTML=`<div style="padding: 24px; text-align: center; color: var(--text-muted);">Aucun manuel ne correspond \xE0 votre recherche "${w(z)}".</div>`;return}g.innerHTML="",k.forEach((D,G)=>{let Y=$[D],K=document.createElement("div");K.className="lib-category-section",K.style.background="var(--bg-card)",K.style.border="1px solid var(--border-color)",K.style.borderRadius="var(--radius-md)",K.style.overflow="hidden";let an=B.length>0?!0:s[D]!==void 0?s[D]:G<3;K.innerHTML=`
        <div class="lib-cat-header" style="display: flex; justify-content: space-between; align-items: center; padding: 10px 14px; background: rgba(0,0,0,0.18); cursor: pointer; user-select: none;">
          <div style="display: flex; align-items: center; gap: 8px; font-weight: 700; font-size: 13px; color: var(--color-primary);">
            <i class="fa-solid fa-folder"></i> <span>${w(D)}</span>
            <span style="font-size: 11px; padding: 1px 6px; border-radius: 10px; background: rgba(6, 182, 212, 0.15); color: var(--color-primary);">${Y.length}</span>
          </div>
          <i class="fa-solid fa-chevron-down lib-cat-chevron" style="font-size: 11px; color: var(--text-muted); transition: transform 0.2s ease; transform: ${an?"rotate(180deg)":"rotate(0deg)"};"></i>
        </div>
        <div class="lib-cat-body" style="display: ${an?"grid":"none"}; grid-template-columns: repeat(auto-fill, minmax(280px, 1fr)); gap: 8px; padding: 12px;"></div>
      `;let Ea=K.querySelector(".lib-cat-header"),ft=K.querySelector(".lib-cat-body"),Ca=K.querySelector(".lib-cat-chevron");Y.forEach(on=>{let $e=ot(on,!1);ft.appendChild($e)}),Ea.onclick=()=>{let $e=!(ft.style.display!=="none");ft.style.display=$e?"grid":"none",Ca.style.transform=$e?"rotate(180deg)":"rotate(0deg)",s[D]=$e,c()},g.appendChild(K)})}let d=document.getElementById("lib-filter-pdf-input");d&&d.addEventListener("input",()=>{p(d.value||"")});let f=document.getElementById("lib-deep-search-input"),u=document.getElementById("lib-deep-search-btn"),m=document.getElementById("lib-search-results-section"),v=document.getElementById("lib-search-results-container"),E=document.getElementById("lib-search-results-count"),y=document.getElementById("lib-search-loading"),x=document.getElementById("lib-clear-search-btn"),C=document.getElementById("lib-toggle-results-btn"),T=document.getElementById("lib-toggle-results-icon"),R=document.getElementById("lib-toggle-results-text"),h=document.getElementById("lib-search-expand-banner"),L=document.getElementById("lib-show-all-results-btn"),_=document.getElementById("lib-remaining-results-count"),A=[];function M(){v&&(r&&A.length>4?(v.className="lib-search-container-collapsed",T&&(T.className="fa-solid fa-expand"),R&&(R.textContent="Agrandir"),h&&(h.style.display="block",_&&(_.textContent=A.length-4))):(v.className="lib-search-container-full",T&&(T.className="fa-solid fa-compress"),R&&(R.textContent="R\xE9duire"),h&&(h.style.display="none")))}C&&(C.onclick=()=>{r=!r,O("drcat_lib_search_collapsed",String(r)),M()}),L&&(L.onclick=()=>{r=!1,O("drcat_lib_search_collapsed","false"),M()}),x&&m&&(x.onclick=()=>{m.style.display="none"});let S=0;async function H(z){if(!z)return;let g=++S;m&&(m.style.display="block"),y&&(y.style.display="block"),v&&(v.innerHTML=""),h&&(h.style.display="none"),E&&(E.textContent=`Recherche pour "${z}"...`);try{let I=await nt(z);if(g!==S)return;if(y&&(y.style.display="none"),!I.ok){v&&(v.innerHTML='<p class="text-warning" style="padding: 12px; text-align: center;">Service de recherche temporairement indisponible.</p>');return}let B=await I.json();if(g!==S)return;if(A=B.results||[],E&&(E.textContent=`${A.length} passage(s) trouv\xE9(s) pour "${z}"`),A.length===0){v&&(v.innerHTML='<p class="text-muted" style="padding: 16px; text-align: center;">Aucun passage trouv\xE9 pour cette expression dans les livres de r\xE9f\xE9rence.</p>');return}let $="";A.forEach(k=>{let N=he(k.pdf),D=w(k.snippet),G=w(z).replace(/[-\\^$*+?.()|[\]{}]/g,"\\$&"),Y=D.replace(new RegExp(`(${G})`,"gi"),"<mark>$1</mark>");$+=`
          <div class="pdf-search-result-card" data-pdf="${encodeURIComponent(k.pdf)}" data-page="${k.page}" style="padding: 12px; background: var(--bg-card); border: 1px solid var(--border-color); border-radius: 8px; cursor: pointer; display: flex; flex-direction: column; gap: 6px;">
            <div style="display: flex; justify-content: space-between; font-size: 12px; font-weight: 700; color: var(--color-primary);">
              <span><i class="fa-solid fa-book-open"></i> ${w(N)}</span>
              <span style="color: var(--color-warning);">Page ${k.page}</span>
            </div>
            <div style="font-size: 11.5px; color: var(--text-secondary); line-height: 1.4;">${Y}</div>
          </div>
        `}),v&&(v.innerHTML=$,v.querySelectorAll(".pdf-search-result-card").forEach(k=>{k.onclick=()=>{de();let N=decodeURIComponent(k.getAttribute("data-pdf")),D=k.getAttribute("data-page");window.location.href=`pdf_viewer.html?file=${encodeURIComponent(N)}&page=${D}`}})),M()}catch{y&&(y.style.display="none"),v&&(v.innerHTML='<p class="text-danger" style="padding: 12px; text-align: center;">Erreur lors de la recherche dans les documents.</p>')}}u&&f&&(u.onclick=()=>H(f.value.trim()),f.onkeydown=z=>{z.key==="Enter"&&H(f.value.trim())}),window.openStandaloneLibrary=function(z=""){l.activeCat=null,document.querySelectorAll(".cat-item").forEach(g=>g.classList.remove("active")),i&&(i.style.display="none"),n&&(n.style.display="none"),o&&(o.style.display="none"),t&&(t.style.display="flex",window.scrollTo({top:0,behavior:"smooth"})),p(d?d.value:""),z&&f&&(f.value=z,H(z))}}function Vn(e){let t=document.getElementById("workspace-profile-wrapper"),n=document.getElementById("workspace-profile-select");if(!t||!n)return;let i=Array.isArray(e.sub_cats)&&e.sub_cats.length>0?e.sub_cats:[];if(i.length===0){t.style.display="none",n.innerHTML="";return}t.style.display="inline-flex",n.innerHTML="",[{label:"\u2B50 Fiche Principale"},...i].forEach((a,s)=>{let r=document.createElement("option");r.value=String(s),r.textContent=a.label||`Profil ${s}`,l.activeSubCatIndex===s&&(r.selected=!0),n.appendChild(r)}),n.onchange=a=>{window.switchToSubProfile(parseInt(a.target.value,10))}}function Un(){window.switchToSubProfile=function(e){if(!l.activeCat)return;let t=Array.isArray(l.activeCat.sub_cats)&&l.activeCat.sub_cats.length>0?l.activeCat.sub_cats:[],n=[{label:"\u2B50 Fiche Principale",summary:l.activeCat.summary,red_flags:l.activeCat.red_flags,ordonnance:l.activeCat.ordonnance},...t],i=Number(e);if(i<0||i>=n.length)return;l.activeSubCatIndex=i;let o=n[i],a=document.getElementById("workspace-red-flags");a&&(a.textContent=o.red_flags||l.activeCat.red_flags),Ee(o.summary||l.activeCat.summary,l.activeCat,i>0?o.label:null),ae(o.ordonnance||l.activeCat.ordonnance),X(!0);let s=document.getElementById("workspace-profile-select");s&&(s.value=String(i));let r=document.getElementById("summary-view");r&&r.scrollIntoView({behavior:"smooth",block:"start"})}}async function Ce(){let e=document.getElementById("pdf-index-status");if(e)try{let t=await wn(),n="";t.isIndexing?(n=`<span class="status-text text-warning"><i class="fa-solid fa-circle-notch fa-spin"></i> Indexation en cours... (${t.indexedFiles}/${t.totalFiles} fichiers)</span>`,setTimeout(Ce,2e3)):n=`<span class="status-text text-success"><i class="fa-solid fa-circle-check"></i> Indexation termin\xE9e (${t.indexedFiles}/${t.totalFiles} fichiers index\xE9s)</span>`;let i=e.querySelector(".status-text");i&&(i.innerHTML=n)}catch(t){console.error("Failed to fetch index status:",t)}}async function $t(e){let t=document.getElementById("pdf-content-search-input"),n=document.getElementById("pdf-search-loading"),i=document.getElementById("pdf-search-results-container");if(!t||!n||!i)return;let o=t.value.trim();if(!o)return;let a=xe(e,'<i class="fa-solid fa-magnifying-glass"></i> Rechercher');n.style.display="flex",i.innerHTML="";try{let s=await nt(o);if(s.status===503){let d=await s.json();i.innerHTML=`<p class="text-warning text-center" style="margin-top: 20px;"><i class="fa-solid fa-triangle-exclamation"></i> ${w(d.error||"Indexation en cours...")}</p>`;return}let c=(await s.json()).results;if(!c||c.length===0){i.innerHTML=`<p class="text-muted text-center" style="margin-top: 30px;">Aucun r\xE9sultat trouv\xE9 pour "${w(o)}". V\xE9rifiez l'orthographe.</p>`;return}let p="";c.forEach(d=>{let f=w(d.snippet),m=w(o).replace(/[-\\^$*+?.()|[\]{}]/g,"\\$&"),v=new RegExp(`(${m})`,"gi"),E=f.replace(v,"<mark>$1</mark>"),y=w(d.pdf.replace(/^[\d\uFE0F\u20E3]+\s*/,"").replace(/[\u{1F300}-\u{1F9FF}]/gu,"").replace(/_/g," ").replace(/\.pdf$/i,""));p+=`
        <div class="pdf-search-result-card" data-pdf="${encodeURIComponent(d.pdf)}" data-page="${d.page}">
          <div class="pdf-search-result-header">
            <span class="pdf-search-result-title"><i class="fa-solid fa-file-pdf"></i> ${y}</span>
            <span class="pdf-search-result-page">Page ${d.page}</span>
          </div>
          <div class="pdf-search-result-snippet">${E}</div>
        </div>
      `}),i.innerHTML=p,document.querySelectorAll(".pdf-search-result-card").forEach(d=>{d.addEventListener("click",()=>{de();let f=decodeURIComponent(d.getAttribute("data-pdf")),u=d.getAttribute("data-page");window.location.href=`pdf_viewer.html?file=${encodeURIComponent(f)}&page=${u}`})})}catch(s){console.error("PDF search error:",s),i.innerHTML='<p class="text-danger text-center" style="margin-top: 20px;">Une erreur est survenue lors de la recherche.</p>'}finally{n.style.display="none",a&&a()}}async function Wn(){try{(await En()).success&&Ce()}catch(e){if(console.error("Failed to trigger re-index:",e),window.handleAdminError&&await window.handleAdminError(e))return;b("Erreur lors de la r\xE9indexation.","fa-circle-exclamation",4e3)}}function _t(e){let t=document.getElementById("pdf-list");if(!t)return;t.innerHTML="";let n=Array.isArray(e?.pdf_keywords)?e.pdf_keywords:[],i=e?.category?e.category.toLowerCase():"",o=Array.isArray(e?.tags)?e.tags.filter(d=>d&&typeof d=="string").map(d=>d.toLowerCase()):[],a=["urgence","urgences","traitement","th\xE9rapeutique","ordonnance","ordonnances","manuel","guide"],s=[i,...o,...a].filter(d=>d&&d.trim().length>2),r=l.allPdfs.filter(d=>{if(!d)return!1;let f=d.toLowerCase();return n.some(u=>u!=null&&typeof u=="string"&&f.includes(u.toLowerCase()))}),c=l.allPdfs.filter(d=>{if(!d)return!1;let f=d.toLowerCase();return n.some(m=>m!=null&&typeof m=="string"&&f.includes(m.toLowerCase()))?!1:s.some(m=>f.includes(m))}),p=document.createElement("h4");if(p.style.gridColumn="1 / -1",p.style.color="var(--color-primary)",p.style.margin="10px 0 5px",p.style.fontSize="14px",p.style.fontWeight="600",p.innerHTML='<i class="fa-solid fa-graduation-cap"></i> Cours & R\xE9f\xE9rences Sp\xE9cifiques',t.appendChild(p),r.length===0){let d=document.createElement("p");d.className="text-muted",d.style.gridColumn="1 / -1",d.style.fontSize="13px",d.style.margin="5px 0 15px",d.textContent="Aucun PDF de sp\xE9cialit\xE9 sp\xE9cifique trouv\xE9 pour ce sujet dans vos fichiers.",t.appendChild(d)}else r.forEach(d=>{t.appendChild(ot(d,!1))});if(c.length>0){let d=document.createElement("h4");d.style.gridColumn="1 / -1",d.style.color="var(--color-success)",d.style.margin="20px 0 5px",d.style.fontSize="14px",d.style.fontWeight="600",d.innerHTML=`<i class="fa-solid fa-book-medical"></i> Manuels & Guides (${w(e?.category||"G\xE9n\xE9raux")})`,t.appendChild(d),c.forEach(f=>{t.appendChild(ot(f,!0))})}}var Z,je,qt,Le,Ve,ge,ee,ke,Dt,Ae,Mt,Pt,rt,st,Se,Ie,Rt,Ra,Ne,zt,lt,Ot,qe,Fe,Ht,Nt,Ue=null;function ct(){if(!l.activeCat||!ee)return!1;let e=ee.value;if(e===(l.activeCat.notes||""))return!1;let t=l.activeCat;t.notes=e,t.lastRead=Date.now();let n=Q();return n[t.id]||(n[t.id]={}),n[t.id].status=t.status||"todo",n[t.id].notes=e,n[t.id].lastRead=Date.now(),_e(n),!0}function Gn(e,t,n){if(Z=document.getElementById("workspace"),je=document.getElementById("welcome-screen"),qt=document.getElementById("workspace-cat-category"),Le=document.getElementById("workspace-cat-title"),Ve=document.getElementById("workspace-red-flags"),ge=document.getElementById("workspace-prescription"),ee=document.getElementById("notes-input"),ke=document.getElementById("summary-view"),Dt=document.getElementById("summary-editor"),Ae=document.getElementById("summary-editor-wrapper"),Mt=document.getElementById("edit-summary-btn"),Pt=document.getElementById("cancel-summary-edit-btn"),rt=document.getElementById("save-summary-btn"),st=document.getElementById("save-notes-btn"),Se=document.getElementById("save-indicator"),Ie=document.getElementById("copy-prescription-btn"),Rt=document.getElementById("current-date"),Ra=document.getElementById("pdf-list"),Ne=document.getElementById("all-pdfs-header"),zt=document.getElementById("all-pdfs-content"),lt=Ne?Ne.parentElement:null,Ot=document.getElementById("pdf-search"),qe=document.getElementById("pdf-content-search-input"),Fe=document.getElementById("pdf-content-search-btn"),Ht=document.getElementById("pdf-index-status"),Nt=document.getElementById("pdf-reindex-btn"),Rt){let g=new Date;Rt.textContent=g.toLocaleDateString("fr-FR")}kt();let i=document.getElementById("red-flags-banner");i&&i.addEventListener("click",()=>{window.innerWidth<=850&&i.classList.toggle("expanded")});let o=document.querySelectorAll(".tab-btn");o.forEach(g=>{g.addEventListener("click",()=>{o.forEach(k=>{k.classList.remove("active"),k.setAttribute("aria-selected","false")}),document.querySelectorAll(".tab-pane").forEach(k=>k.classList.remove("active")),g.classList.add("active"),g.setAttribute("aria-selected","true");try{g.scrollIntoView({behavior:"smooth",inline:"center",block:"nearest"})}catch{}let I=g.getAttribute("data-tab"),B=document.getElementById(I);B&&B.classList.add("active"),I==="tab-pdfs"?(Tt(l.allPdfs),l.activeCat&&_t(l.activeCat)):I==="tab-search-pdf"&&qe&&qe.focus();let $=document.querySelector(".tab-content-container");$&&($.scrollTop=0)})});let a=document.querySelectorAll(".status-btn");a.forEach(g=>{g.addEventListener("click",()=>{if(!l.activeCat)return;let I=g.getAttribute("data-status");a.forEach($=>$.classList.remove("active")),g.classList.add("active"),l.activeCat.status=I,l.activeCat.lastRead=Date.now();let B=Q();B[l.activeCat.id]||(B[l.activeCat.id]={}),B[l.activeCat.id].status=I,B[l.activeCat.id].notes=l.activeCat.notes||"",B[l.activeCat.id].lastRead=Date.now(),_e(B),e(l.activeCat),(I==="doing"||I==="done")&&Object.values(Q()).filter(k=>k.status==="doing"||k.status==="done").length===20&&b("<strong>Beau travail, 20 fiches en cours ! \u{1F389}</strong><br>Pensez \xE0 exporter votre progression via le tableau de bord pour ne rien perdre.","fa-floppy-disk",8e3)})}),st&&st.addEventListener("click",()=>{if(!l.activeCat)return;let g=xe(st,'<i class="fa-solid fa-floppy-disk"></i> Sauvegarder');l.activeCat.notes=ee.value,l.activeCat.lastRead=Date.now();let I=Q();I[l.activeCat.id]||(I[l.activeCat.id]={}),I[l.activeCat.id].status=l.activeCat.status||"todo",I[l.activeCat.id].notes=l.activeCat.notes,I[l.activeCat.id].lastRead=Date.now(),_e(I),Se.classList.add("show"),setTimeout(()=>{Se.classList.remove("show")},2500),X(!0),setTimeout(()=>{g(),b("Notes sauvegard\xE9es localement. Exportez r\xE9guli\xE8rement vos donn\xE9es depuis le <strong>tableau de bord</strong> pour les s\xE9curiser.","fa-cloud-arrow-up",6e3)},400)}),ee&&(ee.addEventListener("input",()=>{clearTimeout(Ue),Ue=setTimeout(()=>{ct()&&Se&&(Se.classList.add("show"),setTimeout(()=>Se.classList.remove("show"),1500))},900)}),document.addEventListener("visibilitychange",()=>{document.visibilityState==="hidden"&&(clearTimeout(Ue),ct())}),window.addEventListener("pagehide",()=>{clearTimeout(Ue),ct()}));let s=document.getElementById("workspace-back-to-quiz-btn");s&&s.addEventListener("click",()=>{l.quizSession.quizViewingCatId=null,Z&&(Z.style.display="none");let g=document.getElementById("quiz-screen");g&&(g.style.display="flex"),document.querySelectorAll(".cat-item").forEach(I=>I.classList.remove("active"))}),jn(()=>{let g=document.getElementById("brand-logo");g&&g.click()});let r=document.getElementById("print-cat-btn");r&&r.addEventListener("click",async()=>{let g=l.activeCat;if(g)if(typeof window.Capacitor<"u"||J){let I=Rn(g);if(navigator.clipboard&&navigator.clipboard.writeText)try{await navigator.clipboard.writeText(I),b("Fiche compl\xE8te (avec sous-fiches) copi\xE9e dans le presse-papier !","fa-clipboard-check",4e3)}catch{b("L'impression native n'est pas disponible. Utilisez la version web.","fa-circle-info",5e3)}else b("L'impression native n'est pas disponible. Utilisez la version web.","fa-circle-info",5e3)}else qn(g)}),Mt&&Mt.addEventListener("click",()=>{ke.style.display="none",Ae.style.display="flex";let g=l.activeSubCatIndex>0&&Array.isArray(l.activeCat?.sub_cats);Dt.value=g?l.activeCat.sub_cats[l.activeSubCatIndex-1].summary||"":l.activeCat?.summary||""}),Pt&&Pt.addEventListener("click",()=>{ke.style.display="block",Ae.style.display="none"}),rt&&rt.addEventListener("click",async()=>{if(!l.activeCat)return;let g=Dt.value;if(!g.trim()){b("La synth\xE8se ne peut pas \xEAtre vide.","fa-triangle-exclamation",3e3);return}let I=xe(rt);try{let B=l.activeSubCatIndex>0&&Array.isArray(l.activeCat.sub_cats);if(l.isAdmin){let $;if(B?(l.activeCat.sub_cats[l.activeSubCatIndex-1].summary=g,$=await De(l.activeCat.id,{sub_cats:l.activeCat.sub_cats})):$=await De(l.activeCat.id,{summary:g}),$.success){B||(l.activeCat.summary=g);let k=(l.allCats||[]).find(D=>D.id===l.activeCat.id);k&&(B?k.sub_cats=l.activeCat.sub_cats:k.summary=g);let N=B?l.activeCat.sub_cats[l.activeSubCatIndex-1].label:null;Ee(g,l.activeCat,N),b(B?"Sous-fiche mise \xE0 jour avec succ\xE8s !":"Synth\xE8se mise \xE0 jour avec succ\xE8s !","fa-circle-check",2500),X(!0)}else b("Erreur: "+$.error,"fa-circle-exclamation",4e3),X(!1)}else{if(!confirm(`Attention : Vos modifications ne seront pas appliqu\xE9es directement dans l'application. Elles seront envoy\xE9es \xE0 l'administrateur du site pour relecture et validation avant d'\xEAtre int\xE9gr\xE9es.

Souhaitez-vous envoyer cette proposition ?`)){I();return}let k=B?JSON.parse(JSON.stringify(l.activeCat.sub_cats)):null;k&&(k[l.activeSubCatIndex-1].summary=g),await Re(Me,{type:"edit",catId:l.activeCat.id,data:B?{sub_cats:k}:{summary:g}},"Votre proposition de modification a \xE9t\xE9 envoy\xE9e \xE0 l'administrateur pour validation.")}}catch(B){if(console.error(B),window.handleAdminError&&await window.handleAdminError(B)){I();return}b("Erreur lors de la sauvegarde.","fa-circle-exclamation",4e3),X(!1)}finally{I()}ke.style.display="block",Ae.style.display="none"}),Ie&&Ie.addEventListener("click",()=>{let g="";l.prescriptionVariants.length>0&&l.prescriptionVariants[l.activePrescriptionVariantIndex]?g=l.prescriptionVariants[l.activePrescriptionVariantIndex].content:g=ge.innerText,navigator.clipboard.writeText(g).then(()=>{let I=Ie.innerHTML;Ie.innerHTML='<i class="fa-solid fa-check" style="color: var(--color-success);"></i>',b("Ordonnance copi\xE9e dans le presse-papier !","fa-check",2e3),setTimeout(()=>{Ie.innerHTML=I},1800)}).catch(I=>{b("Impossible de copier automatiquement dans le presse-papier.","fa-triangle-exclamation",2500)})});let c=document.getElementById("edit-prescription-btn"),p=document.getElementById("cancel-prescription-edit-btn"),d=document.getElementById("save-prescription-btn"),f=document.getElementById("prescription-editor"),u=document.getElementById("prescription-editor-actions");c&&c.addEventListener("click",()=>{ge.style.display="none",f.style.display="block",u.style.display="flex";let g=l.activeSubCatIndex>0&&Array.isArray(l.activeCat?.sub_cats);f.value=g?l.activeCat.sub_cats[l.activeSubCatIndex-1].ordonnance||"":l.activeCat?.ordonnance||""}),p&&p.addEventListener("click",()=>{ge.style.display="block",f.style.display="none",u.style.display="none"}),d&&d.addEventListener("click",async()=>{if(!l.activeCat)return;let g=f.value;if(!g.trim()){b("L'ordonnance ne peut pas \xEAtre vide.","fa-triangle-exclamation",3e3);return}let I=xe(d);try{let B=l.activeSubCatIndex>0&&Array.isArray(l.activeCat.sub_cats);if(l.isAdmin){let $;if(B?(l.activeCat.sub_cats[l.activeSubCatIndex-1].ordonnance=g,$=await De(l.activeCat.id,{sub_cats:l.activeCat.sub_cats})):$=await De(l.activeCat.id,{ordonnance:g}),$.success){B||(l.activeCat.ordonnance=g);let k=(l.allCats||[]).find(N=>N.id===l.activeCat.id);k&&(B?k.sub_cats=l.activeCat.sub_cats:k.ordonnance=g),ae(g),b(B?"Ordonnance de la sous-fiche mise \xE0 jour !":"Ordonnance type mise \xE0 jour avec succ\xE8s !","fa-circle-check",2500),X(!0)}else b("Erreur: "+$.error,"fa-circle-exclamation",4e3),X(!1)}else{if(!confirm(`Attention : Vos modifications ne seront pas appliqu\xE9es directement dans l'application. Elles seront envoy\xE9es \xE0 l'administrateur du site pour relecture et validation avant d'\xEAtre int\xE9gr\xE9es.

Souhaitez-vous envoyer cette proposition ?`)){I();return}let k=B?JSON.parse(JSON.stringify(l.activeCat.sub_cats)):null;k&&(k[l.activeSubCatIndex-1].ordonnance=g),await Re(Me,{type:"edit",catId:l.activeCat.id,data:B?{sub_cats:k}:{ordonnance:g}},"Votre proposition de modification de l'ordonnance a \xE9t\xE9 envoy\xE9e \xE0 l'administrateur pour validation.")}}catch(B){if(console.error(B),window.handleAdminError&&await window.handleAdminError(B)){I();return}b("Erreur lors de la sauvegarde.","fa-circle-exclamation",4e3)}finally{I()}ge.style.display="block",f.style.display="none",u.style.display="none"}),Ne&&Ne.addEventListener("click",()=>{lt.classList.contains("open")?(lt.classList.remove("open"),zt.style.display="none"):(lt.classList.add("open"),zt.style.display="block",Tt(l.allPdfs))}),Ot&&Ot.addEventListener("input",Fn);let m=document.getElementById("delete-cat-btn");m&&m.addEventListener("click",async()=>{if(!l.activeCat)return;let g=l.activeCat,I=g.id,B=g.title;if(confirm(`Voulez-vous vraiment supprimer d\xE9finitivement la fiche "${B}" (ID: ${I}) ?`))try{let $=await mn(I);$&&($.success||$.message)?(b(`La fiche "${w(B)}" a \xE9t\xE9 supprim\xE9e avec succ\xE8s.`,"fa-circle-check",4e3),l.allCats=l.allCats.filter(k=>k.id!==I),t?await t(I):n&&await n(),Be(null)):b(w($.error||"\xC9chec de la suppression de la fiche."),"fa-triangle-exclamation",4e3)}catch($){console.error("[Delete CAT Error]",$),b("Erreur lors de la suppression de la fiche.","fa-circle-exclamation",4e3)}});let v=document.getElementById("reset-progress-btn");v&&v.addEventListener("click",async()=>{confirm("Voulez-vous vraiment r\xE9initialiser toute votre progression et vos notes ? Cette action est irr\xE9versible et n'affectera que ce navigateur.")&&(te("dr_cat_user_progress"),te("dr_cat_leitner"),te("dr_cat_streak"),te("dr_cat_local_overrides"),l.allCats.forEach(g=>{g.status="todo",g.notes="",g.lastRead=0}),l.activeCat&&(l.activeCat.status="todo",l.activeCat.notes="",l.activeCat.lastRead=0,ee&&(ee.value=""),document.querySelectorAll(".status-btn").forEach(I=>{I.classList.remove("active"),I.getAttribute("data-status")==="todo"&&I.classList.add("active")})),b("Progression r\xE9initialis\xE9e avec succ\xE8s !","fa-circle-check",3e3),n&&await n())});let E=document.getElementById("reader-mode-btn"),y=document.getElementById("summary-reader-modal"),x=document.getElementById("close-reader-modal-btn"),C=document.getElementById("reader-cat-category"),T=document.getElementById("reader-cat-title"),R=document.getElementById("reader-summary-view");function h(){if(!l.activeCat||!y)return;C&&(C.textContent=l.activeCat.category),T&&(T.textContent=`${l.activeCat.id}. ${l.activeCat.title}`);let g=l.activeCat.customSummary||l.activeCat.summary||"";R&&(R.innerHTML=at(g)),y.style.display="flex",document.body.style.overflow="hidden"}function L(){y&&(y.style.display="none",document.body.style.overflow="")}E&&E.addEventListener("click",h),x&&x.addEventListener("click",L),y&&y.addEventListener("click",g=>{g.target===y&&L()}),document.addEventListener("keydown",g=>{g.key==="Escape"&&y&&y.style.display==="flex"&&L()}),Un(),Fe&&Fe.addEventListener("click",()=>$t(Fe)),qe&&qe.addEventListener("keydown",g=>{g.key==="Enter"&&$t(Fe)}),Nt&&Nt.addEventListener("click",Wn),J&&Ht&&(Ht.style.display="none"),document.addEventListener("click",g=>{let I=g.target.closest("a");I&&I.getAttribute("href")&&I.getAttribute("href").includes("pdf_viewer.html")&&de()});let _=0,A=0,M=0,S=0,H=!1;Z&&(Z.addEventListener("touchstart",g=>{if(H=!1,!g.target||typeof g.target.closest!="function"||!(g.target.closest(".workspace-header")||g.target.closest("#red-flags-banner"))||g.target.closest("#subcat-selector-bar")||g.target.closest(".subcat-pill"))return;let B=g.target.tagName.toLowerCase(),$=g.target.closest("#summary-editor")||g.target.closest("#notes-input");B==="textarea"||B==="input"||$||(H=!0,_=g.changedTouches[0].screenX,A=g.changedTouches[0].screenY)},{passive:!0}),Z.addEventListener("touchend",g=>{H&&(H=!1,!(!g.target||typeof g.target.closest!="function")&&(M=g.changedTouches[0].screenX,S=g.changedTouches[0].screenY,z()))},{passive:!0}));function z(){let g=M-_,I=S-A;if(Math.abs(g)>60&&Math.abs(g)>Math.abs(I)*2){let $=document.querySelector(".cat-item.active"),k=Array.from(document.querySelectorAll(".cat-item"));if(k.length===0||!$)return;let N=k.indexOf($);if(N===-1)return;let D=N;g<0?D=(N+1)%k.length:D=(N-1+k.length)%k.length;let G=k[D];G&&(G.click(),G.scrollIntoView({block:"nearest",behavior:se()?"auto":"smooth"}),X(!0))}}}function Be(e,t=!1,n=0){if(window.perf&&window.perf.startMeasure("workspace.selectCat"),clearTimeout(Ue),ct(),l.activeCat=e,l.activeSubCatIndex=n,l.activePrescriptionVariantIndex=0,!e){Z&&(Z.style.display="none"),je&&(je.style.display="flex"),document.querySelectorAll(".cat-item").forEach(u=>u.classList.remove("active")),window.perf&&window.perf.endMeasure("workspace.selectCat");return}if(!t){e.lastRead=Date.now();let u=Q();u[e.id]||(u[e.id]={}),u[e.id].lastRead=Date.now(),u[e.id].status=e.status||"todo",u[e.id].notes=e.notes||"",_e(u)}document.querySelectorAll(".cat-item").forEach(u=>{u.classList.remove("active"),parseInt(u.getAttribute("data-id"))===e.id&&u.classList.add("active")}),je&&(je.style.display="none"),Z&&(Z.style.display="flex");let i=document.getElementById("quiz-screen");i&&(i.style.display="none");let o=document.getElementById("library-screen");o&&(o.style.display="none");let a=document.getElementById("workspace-back-to-quiz-btn");if(a&&(l.quizSession&&l.quizSession.quizViewingCatId===e.id?a.style.display="inline-flex":a.style.display="none"),qt&&(qt.textContent=e.category),Le){let u=`${e.id}. ${e.title}`;if(u.length>50){Le.classList.add("very-long-title");let m=w(u);m.includes(" et ")?m=m.replace(" et ","<br>et "):m.includes(" avec ")?m=m.replace(" avec ","<br>avec "):m.includes(" : ")&&(m=m.replace(" : "," :<br>")),Le.innerHTML=m}else Le.classList.remove("very-long-title"),Le.textContent=u}Ve&&(Ve.textContent=e.red_flags);let s=document.getElementById("red-flags-banner");if(s&&(s.classList.remove("expanded"),e.red_flags&&e.red_flags.trim().length>0?s.style.display="block":s.style.display="none"),document.querySelectorAll(".status-btn").forEach(u=>{u.classList.remove("active"),u.getAttribute("data-status")===e.status&&u.classList.add("active")}),Vn(e),n>0&&Array.isArray(e.sub_cats)&&e.sub_cats[n-1]){let u=e.sub_cats[n-1];Ee(u.summary||e.summary,e,u.label),Ve&&(Ve.textContent=u.red_flags||e.red_flags),ae(u.ordonnance||e.ordonnance)}else Ee(e.customSummary||e.summary,e),ae(e.customOrdonnance||e.ordonnance);ee&&(ee.value=e.notes||"");let r=document.getElementById("prescription-editor"),c=document.getElementById("prescription-editor-actions");if(r&&(r.style.display="none"),c&&(c.style.display="none"),ge&&(ge.style.display="block"),_t(e),!t){document.querySelectorAll(".tab-btn").forEach(v=>{v.classList.remove("active"),v.setAttribute("aria-selected","false")}),document.querySelectorAll(".tab-pane").forEach(v=>v.classList.remove("active"));let u=document.querySelector('.tab-btn[data-tab="tab-summary"]'),m=document.getElementById("tab-summary");u&&(u.classList.add("active"),u.setAttribute("aria-selected","true")),m&&m.classList.add("active")}ke&&(ke.style.display="block"),Ae&&(Ae.style.display="none");let p=document.getElementById("delete-cat-btn"),d=document.getElementById("edit-summary-btn"),f=document.getElementById("edit-prescription-btn");if(J){p&&(p.style.display="none");let u=l.isOnlineAtStartup?"inline-flex":"none";d&&(d.style.display=u),f&&(f.style.display=u)}else d&&(d.style.display="inline-flex"),f&&(f.style.display="inline-flex"),p&&(e.id>55&&l.isAdmin?p.style.display="inline-flex":p.style.display="none");window.perf&&window.perf.endMeasure("workspace.selectCat")}function Yn(e){let t=0,n=0,i=0,o=Array.isArray(e)?e:[];return o.forEach(a=>{a?.status==="done"?i++:a?.status==="doing"?n++:t++}),{todo:t,doing:n,done:i,total:o.length}}function Kn(){let e=0;try{let t=P("dr_cat_streak",'{"count": 0}'),n=F(t,{count:0});e=n&&typeof n.count=="number"?n.count:0}catch(t){console.warn("Failed to parse study streak info",t)}return e}function Qn(e,t,n){if(!e)return;e.innerHTML="";let i=[...t].sort((o,a)=>(a.lastRead||0)-(o.lastRead||0));if(i.length===0){e.innerHTML='<li class="empty-state">Aucun cours en cours. S\xE9lectionnez un cours dans la barre lat\xE9rale pour commencer !</li>';return}i.slice(0,5).forEach(o=>{let a=document.createElement("li");a.style.cursor="pointer",a.innerHTML=`
      <div style="display: flex; justify-content: space-between; align-items: center; width: 100%;">
        <div>
          <span class="resume-title" style="font-weight: 600; color: var(--color-primary);">${o.id}. ${o.title}</span>
          <span style="font-size: 11px; color: var(--text-muted); display: block;">Sp\xE9cialit\xE9 : ${o.category}</span>
        </div>
        <span class="badge ${o.status==="done"?"badge-success":"badge-warning"}" style="font-size: 11px; padding: 2px 8px; border-radius: 4px;">
          ${o.status==="done"?"Ma\xEEtris\xE9":"En cours"}
        </span>
      </div>
    `,a.addEventListener("click",()=>n(o)),e.appendChild(a)})}function Jn(e,t){if(!e)return;e.innerHTML="";let n={};t.forEach(c=>{n[c.category]||(n[c.category]={total:0,done:0,items:[]}),n[c.category].total++,n[c.category].items.push(c),c.status==="done"&&n[c.category].done++});let i=Object.keys(n).sort(),o=document.getElementById("categories-summary-badge");o&&(o.textContent=`${i.length} domaines`),i.forEach(c=>{let p=n[c],d=p.total>0?Math.round(p.done/p.total*100):0,f=document.createElement("div");f.className="category-progress-item",f.innerHTML=`
      <div class="category-progress-info">
        <span>${c}</span>
        <span>${p.done}/${p.total} (${d}%)</span>
      </div>
      <div class="progress-bar-bg">
        <div class="progress-bar-fill" style="width: ${d}%"></div>
      </div>
    `,e.appendChild(f)});let a=document.getElementById("categories-progress-toggle"),s=document.getElementById("categories-progress-content"),r=document.getElementById("categories-toggle-chevron");a&&s&&r&&!a._hasListener&&(a._hasListener=!0,P("dash_categories_expanded")==="true"?(s.style.display="block",r.style.transform="rotate(180deg)"):(s.style.display="none",r.style.transform="rotate(0deg)"),a.addEventListener("click",()=>{s.style.display!=="none"?(s.style.display="none",r.style.transform="rotate(0deg)",O("dash_categories_expanded","false")):(s.style.display="block",r.style.transform="rotate(180deg)",O("dash_categories_expanded","true"))}))}function Xn(e){e.innerHTML=`
    <div style="margin-bottom: 20px;">
      <div style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 14px; flex-wrap: wrap; gap: 10px;">
        <div>
          <h3 style="margin: 0; color: var(--text-primary); font-size: 16px; display: flex; align-items: center; gap: 8px;">
            <i class="fa-solid fa-flask" style="color: var(--color-primary);"></i> Command Center des Laboratoires & IA
          </h3>
          <p style="color: var(--text-secondary); font-size: 13px; margin: 4px 0 0 0;">
            Acc\xE9dez aux studios de d\xE9veloppement, de g\xE9n\xE9ration de cas cliniques et d'extraction de documents m\xE9dicaux :
          </p>
        </div>
      </div>

      <!-- 3 Featured Lab Cards Grid -->
      <div class="admin-lab-cards" style="display: grid; grid-template-columns: repeat(auto-fit, minmax(260px, 1fr)); gap: 14px; margin-bottom: 24px;">
        
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
              G\xE9n\xE9rez, synth\xE9tisez et validez les fiches m\xE9dicales avec Gemini Dual-RAG, checksum anti-hallucination et ordonnances conformes.
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
              Concevez et mod\xE9rez les cas cliniques progressifs (KFQs/SCTs), QCMs d'ordonnances, justifications et publication du staging.
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
              D\xE9coupez des sections de manuels, extrayez le texte brut des cours, synchronisez la table des mati\xE8res GPS et compressez pour APK.
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
            <div style="font-size: 11.5px; color: var(--text-muted);">Ajout imm\xE9diat au corpus m\xE9dical avec auto-indexation.</div>
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
  `,Oa()}function Oa(){let e=document.getElementById("admin-pdf-upload-input"),t=document.getElementById("admin-pdf-trigger-btn"),n=document.getElementById("admin-pdf-filename"),i=document.getElementById("admin-pdf-submit-btn"),o=null,a=null;t&&t.addEventListener("click",()=>e.click()),e&&e.addEventListener("change",s=>{let r=s.target.files[0];if(!r){o=null,a=null,n.style.display="none",i.style.display="none",i.disabled=!0;return}o=r,n.textContent=r.name,n.style.display="block",i.style.display="flex",i.disabled=!0,i.innerHTML='<i class="fa-solid fa-spinner fa-spin"></i> Pr\xE9paration...';let c=new FileReader;c.onload=p=>{a=p.target.result.split(",")[1],i.disabled=!1,i.innerHTML=`<i class="fa-solid fa-upload"></i> D\xE9marrer l'Indexation`},c.onerror=()=>{b("Erreur lors de la lecture du fichier","fa-triangle-exclamation",4e3)},c.readAsDataURL(r)}),i&&i.addEventListener("click",async()=>{if(!(!o||!a)){i.disabled=!0,i.innerHTML='<i class="fa-solid fa-spinner fa-spin"></i> Envoi en cours...';try{let s=await un(fe("/api/admin/upload-pdf"),{method:"POST",headers:me({"Content-Type":"application/json"}),body:JSON.stringify({filename:o.name,base64Data:a})});if(!s.ok){let r=await s.json().catch(()=>({}));throw new Error(r.error||"Failed to upload PDF")}b("Fichier PDF upload\xE9 avec succ\xE8s! L'indexation tourne en arri\xE8re-plan.","fa-circle-check",4e3),e.value="",o=null,a=null,n.style.display="none",i.style.display="none"}catch(s){console.error("[Admin PDF]",s),b(`\xC9chec: ${s.message}`,"fa-triangle-exclamation",4e3),i.disabled=!1,i.innerHTML='<i class="fa-solid fa-rotate-right"></i> R\xE9essayer'}}})}function ie(e){return String(e||"").replace(/[&<>'"]/g,t=>({"&":"&amp;","<":"&lt;",">":"&gt;","'":"&#39;",'"':"&quot;"})[t]||t)}async function We(e){if(e)try{let t=await Sn(),n=!!t.forceUpdateActive,i=t.downloadLinks||{};e.innerHTML=`
      <div class="admin-version-panel" style="display: flex; flex-direction: column; gap: 20px;">
        
        <!-- Status Header Card -->
        <div style="background: ${n?"rgba(239, 68, 68, 0.15)":"rgba(16, 185, 129, 0.15)"}; border: 1px solid ${n?"rgba(239, 68, 68, 0.4)":"rgba(16, 185, 129, 0.4)"}; border-radius: 12px; padding: 18px; display: flex; align-items: center; justify-content: space-between; flex-wrap: wrap; gap: 12px;">
          <div>
            <h3 style="margin: 0 0 4px 0; font-size: 16px; font-weight: 700; color: var(--text-primary); display: flex; align-items: center; gap: 8px;">
              <i class="${n?"fa-solid fa-triangle-exclamation text-danger":"fa-solid fa-shield-check text-success"}"></i>
              Statut du Kill Switch : ${n?'<span style="color: var(--color-danger);">ACTIV\xC9 (Mise \xE0 jour obligatoire)</span>':'<span style="color: var(--color-success);">INACTIF (Acc\xE8s normal)</span>'}
            </h3>
            <p style="margin: 0; font-size: 13px; color: var(--text-secondary);">
              ${n?"Toutes les versions ant\xE9rieures \xE0 v"+ie(t.minVersion||"1.1.6")+" sont actuellement bloqu\xE9es.":"L'application fonctionne normalement pour tous les utilisateurs."}
            </p>
          </div>

          <button id="admin-toggle-killswitch-btn" style="padding: 10px 18px; font-size: 13px; font-weight: 700; border-radius: 8px; cursor: pointer; border: none; display: flex; align-items: center; gap: 8px; background: ${n?"var(--color-success)":"var(--color-danger)"}; color: #fff; box-shadow: var(--shadow-md); transition: all 0.2s;">
            <i class="${n?"fa-solid fa-lock-open":"fa-solid fa-lock"}"></i>
            ${n?"D\xE9sactiver le Kill Switch":"\u{1F6A8} Activer le Kill Switch"}
          </button>
        </div>

        <!-- Standalone Analytics Lab Link Banner -->
        <div style="background: var(--bg-card); border: 1px solid var(--border-color); border-radius: 12px; padding: 16px; display: flex; align-items: center; justify-content: space-between; flex-wrap: wrap; gap: 12px;">
          <div>
            <div style="font-size: 14px; font-weight: 700; color: var(--text-primary); display: flex; align-items: center; gap: 8px;">
              <i class="fa-solid fa-chart-line" style="color: var(--color-primary);"></i> Analytics Lab & T\xE9l\xE9m\xE9trie
            </div>
            <div style="font-size: 12px; color: var(--text-secondary); margin-top: 2px;">
              Consultez les appareils actifs (DAU/MAU) et la r\xE9partition des versions install\xE9es dans une interface d\xE9di\xE9e.
            </div>
          </div>
          <a href="/analytics_lab.html" target="_blank" rel="noopener" style="padding: 9px 16px; font-size: 12px; font-weight: 700; border-radius: 8px; text-decoration: none; display: inline-flex; align-items: center; gap: 8px; background: rgba(6, 182, 212, 0.15); color: #06b6d4; border: 1px solid rgba(6, 182, 212, 0.3); transition: all 0.2s;">
            <i class="fa-solid fa-arrow-up-right-from-square"></i> Ouvrir Analytics Lab
          </a>
        </div>

        <!-- Configuration Form Card -->
        <div style="background: var(--bg-card); border: 1px solid var(--border-color); border-radius: 12px; padding: 20px;">
          <h4 style="margin: 0 0 16px 0; font-size: 15px; font-weight: 700; color: var(--text-primary); display: flex; align-items: center; gap: 8px;">
            <i class="fa-solid fa-sliders"></i> Configuration des Versions & Liens de T\xE9l\xE9chargement
          </h4>

          <form id="admin-version-form" style="display: flex; flex-direction: column; gap: 14px;">
            <div style="display: grid; grid-template-columns: repeat(auto-fit, minmax(200px, 1fr)); gap: 14px;">
              <div>
                <label style="display: block; font-size: 12px; font-weight: 600; color: var(--text-secondary); margin-bottom: 4px;">Version Minimale Requise (minVersion)</label>
                <input type="text" id="ver-input-min" value="${ie(t.minVersion||"1.1.6")}" style="width: 100%; padding: 8px 12px; border-radius: 6px; border: 1px solid var(--border-color); background: var(--bg-input); color: var(--text-primary); font-size: 13px; font-weight: 600;">
              </div>

              <div>
                <label style="display: block; font-size: 12px; font-weight: 600; color: var(--text-secondary); margin-bottom: 4px;">Derni\xE8re Version Disponible (latestVersion)</label>
                <input type="text" id="ver-input-latest" value="${ie(t.latestVersion||"1.1.6")}" style="width: 100%; padding: 8px 12px; border-radius: 6px; border: 1px solid var(--border-color); background: var(--bg-input); color: var(--text-primary); font-size: 13px; font-weight: 600;">
              </div>
            </div>

            <div>
              <label style="display: block; font-size: 12px; font-weight: 600; color: var(--text-secondary); margin-bottom: 4px;">Message de Notification</label>
              <textarea id="ver-input-message" rows="2" style="width: 100%; padding: 8px 12px; border-radius: 6px; border: 1px solid var(--border-color); background: var(--bg-input); color: var(--text-primary); font-size: 13px; resize: vertical;">${ie(t.updateMessage||"")}</textarea>
            </div>

            <div>
              <label style="display: block; font-size: 12px; font-weight: 600; color: var(--text-secondary); margin-bottom: 4px;">Nouveaut\xE9s de la mise \xE0 jour (Release Notes publiques - une note par ligne)</label>
              <textarea id="ver-input-releasenotes" rows="4" style="width: 100%; padding: 8px 12px; border-radius: 6px; border: 1px solid var(--border-color); background: var(--bg-input); color: var(--text-primary); font-size: 13px; resize: vertical;" placeholder="Am\xE9lioration g\xE9n\xE9rale de la rapidit\xE9 et de la stabilit\xE9&#10;Optimisation de la recherche et de la consultation des fiches cliniques&#10;Mise \xE0 jour de s\xE9curit\xE9 et corrections d'affichage">${ie(Array.isArray(t.releaseNotes)?t.releaseNotes.join(`
`):t.releaseNotes||"")}</textarea>
              <small style="display: block; font-size: 11px; color: var(--text-muted); margin-top: 4px;">
                <i class="fa-solid fa-circle-info"></i> R\xE9digez ici les notes destin\xE9es aux utilisateurs. Ne divulguez pas de d\xE9tails techniques internes.
              </small>
            </div>

            <div style="border-top: 1px dashed var(--border-color); padding-top: 12px; margin-top: 4px;">
              <h5 style="margin: 0 0 10px 0; font-size: 13px; font-weight: 700; color: var(--text-primary);">Sources de T\xE9l\xE9chargement Multi-Boutons</h5>
              
              <div style="display: flex; flex-direction: column; gap: 10px;">
                <div>
                  <label style="font-size: 11px; font-weight: 600; color: var(--text-secondary);">Bouton 1 : Lien Uptodown Store</label>
                  <input type="url" id="ver-input-uptodown" value="${ie(i.uptodownUrl||"")}" placeholder="https://dr-cat.en.uptodown.com/android" style="width: 100%; padding: 7px 10px; border-radius: 6px; border: 1px solid var(--border-color); background: var(--bg-input); color: var(--text-primary); font-size: 12px;">
                </div>

                <div>
                  <label style="font-size: 11px; font-weight: 600; color: var(--text-secondary);">Bouton 2 : Lien Canal Telegram Officiel</label>
                  <input type="url" id="ver-input-telegram" value="${ie(i.telegramUrl||"")}" placeholder="https://t.me/DrCatOfficialApp" style="width: 100%; padding: 7px 10px; border-radius: 6px; border: 1px solid var(--border-color); background: var(--bg-input); color: var(--text-primary); font-size: 12px;">
                </div>

                <div>
                  <label style="font-size: 11px; font-weight: 600; color: var(--text-secondary);">Bouton 3 : Lien Direct Serveur / APK</label>
                  <input type="text" id="ver-input-direct" value="${ie(i.directServerUrl||"")}" placeholder="/download/drcat-latest.apk" style="width: 100%; padding: 7px 10px; border-radius: 6px; border: 1px solid var(--border-color); background: var(--bg-input); color: var(--text-primary); font-size: 12px;">
                </div>
              </div>
            </div>

            <div style="display: flex; justify-content: flex-end; margin-top: 10px;">
              <button type="submit" id="admin-save-version-btn" style="padding: 10px 20px; font-size: 13px; font-weight: 700; border-radius: 8px; cursor: pointer; border: none; background: var(--color-primary); color: #fff; box-shadow: var(--shadow-sm); display: flex; align-items: center; gap: 8px;">
                <i class="fa-solid fa-floppy-disk"></i> Enregistrer les Modifications
              </button>
            </div>
          </form>
        </div>
      </div>
    `;let o=e.querySelector("#admin-toggle-killswitch-btn");o&&o.addEventListener("click",async()=>{try{let s=!n;o.disabled=!0,o.innerHTML='<i class="fa-solid fa-spinner fa-spin"></i> Mise \xE0 jour...',await vt({forceUpdateActive:s}),alert(`Statut du Kill Switch mis \xE0 jour : ${s?"ACTIV\xC9 \u{1F6A8}":"D\xC9SACTIV\xC9 \u{1F7E2}"}`),We(e)}catch(s){alert(`Erreur lors du basculement : ${s.message}`),We(e)}});let a=e.querySelector("#admin-version-form");a&&a.addEventListener("submit",async s=>{s.preventDefault();let r=a.querySelector("#admin-save-version-btn");try{r.disabled=!0,r.innerHTML='<i class="fa-solid fa-spinner fa-spin"></i> Enregistrement...';let c={minVersion:a.querySelector("#ver-input-min").value.trim(),latestVersion:a.querySelector("#ver-input-latest").value.trim(),updateMessage:a.querySelector("#ver-input-message").value.trim(),releaseNotes:a.querySelector("#ver-input-releasenotes").value.trim(),downloadLinks:{uptodownUrl:a.querySelector("#ver-input-uptodown").value.trim(),telegramUrl:a.querySelector("#ver-input-telegram").value.trim(),directServerUrl:a.querySelector("#ver-input-direct").value.trim()}};await vt(c),alert("Configuration des versions enregistr\xE9e avec succ\xE8s !"),We(e)}catch(c){alert(`Erreur lors de l'enregistrement : ${c.message}`),r&&(r.disabled=!1,r.innerHTML='<i class="fa-solid fa-floppy-disk"></i> Enregistrer les Modifications')}})}catch(t){e.innerHTML=`<div style="padding: 20px; color: var(--color-danger);">Erreur de chargement de la configuration de version : ${ie(t.message)}</div>`}}async function Zn(e){if(!e)return;e.innerHTML=`
    <div style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 12px;">
      <div>
        <h4 style="margin: 0; color: var(--color-primary); font-size: 14.5px; display: flex; align-items: center; gap: 8px;">
          <i class="fa-solid fa-bug"></i> Rapports de Crash & Diagnostics Re\xE7us
        </h4>
        <p class="block-desc" style="margin: 4px 0 0 0;">Inspectez les erreurs et traces de vos coll\xE8gues/testeurs transmises en 1 clic :</p>
      </div>
      <div style="display: flex; gap: 8px;">
        <button id="admin-telemetry-refresh-btn" class="action-btn" style="padding: 6px 12px; font-size: 11.5px; display: flex; align-items: center; gap: 6px; background: rgba(6,182,212,0.1); border: 1px solid var(--color-primary); color: var(--color-primary); border-radius: 4px; cursor: pointer;">
          <i class="fa-solid fa-arrows-rotate"></i> Actualiser
        </button>
        <button id="admin-telemetry-clear-all-btn" class="action-btn" style="padding: 6px 12px; font-size: 11.5px; display: flex; align-items: center; gap: 6px; background: rgba(239,68,68,0.1); border: 1px solid var(--color-danger); color: var(--color-danger); border-radius: 4px; cursor: pointer;">
          <i class="fa-solid fa-trash-can"></i> Tout Effacer
        </button>
      </div>
    </div>

    <div id="admin-telemetry-list" style="display: flex; flex-direction: column; gap: 12px; margin-top: 16px;">
      <p class="text-muted text-center" style="padding: 20px 0;"><i class="fa-solid fa-spinner fa-spin"></i> Chargement des rapports...</p>
    </div>
  `;let t=e.querySelector("#admin-telemetry-refresh-btn"),n=e.querySelector("#admin-telemetry-clear-all-btn"),i=e.querySelector("#admin-telemetry-list");async function o(s=!1){try{s&&t?(t.disabled=!0,t.innerHTML='<i class="fa-solid fa-arrows-rotate fa-spin"></i> Actualisation...'):i.innerHTML='<p class="text-muted text-center" style="padding: 20px 0;"><i class="fa-solid fa-spinner fa-spin"></i> Chargement des rapports...</p>';let r=await xn();a(r),s&&b("Flux d'incidents actualis\xE9.","fa-check",2e3)}catch(r){console.error("[AdminTelemetry] Failed to load reports:",r),i.innerHTML=`<p class="text-danger text-center" style="padding: 20px 0;">Erreur lors de la r\xE9cup\xE9ration des rapports : ${w(r.message)}</p>`}finally{t&&(t.disabled=!1,t.innerHTML='<i class="fa-solid fa-arrows-rotate"></i> Actualiser')}}function a(s){if(!Array.isArray(s)||s.length===0){i.innerHTML=`
        <div style="text-align: center; padding: 32px 16px; background: var(--surface-card); border-radius: var(--radius-md); border: 1px dashed var(--border-color);">
          <i class="fa-solid fa-shield-heart" style="font-size: 32px; color: var(--color-success); margin-bottom: 8px;"></i>
          <p style="margin: 0; font-weight: 600; color: var(--text-primary);">Aucun crash ni rapport signal\xE9 !</p>
          <p style="margin: 4px 0 0 0; font-size: 12px; color: var(--text-muted);">L'application fonctionne normalement sur tous les appareils connect\xE9s.</p>
        </div>
      `;return}i.innerHTML=s.map(r=>{let c=new Date(r.firstSeen||r.timestamp||Date.now()).toLocaleTimeString("fr-FR",{hour:"2-digit",minute:"2-digit"}),p=new Date(r.lastSeen||r.timestamp||Date.now()).toLocaleString("fr-FR"),d=r.device||{},f=r.occurrences||1,u=r.severity||(f>=20?"critical":f>=5?"warning":"info"),m='<span style="background: #059669; color: #fff; font-size: 10px; font-weight: 700; padding: 2px 7px; border-radius: 4px;">\u{1F7E2} MINEUR</span>',v="var(--border-color)";u==="critical"?(m='<span style="background: #ef4444; color: #fff; font-size: 10px; font-weight: 800; padding: 2px 7px; border-radius: 4px; box-shadow: 0 0 8px rgba(239,68,68,0.5); animation: pulse 2s infinite;"><i class="fa-solid fa-triangle-exclamation"></i> \u{1F534} PANNE GLOBALE</span>',v="#ef4444"):u==="warning"&&(m='<span style="background: #f59e0b; color: #000; font-size: 10px; font-weight: 700; padding: 2px 7px; border-radius: 4px;"><i class="fa-solid fa-bell"></i> \u{1F7E0} FR\xC9QUENT</span>',v="#f59e0b");let E="";r.affectedDevices&&typeof r.affectedDevices=="object"?E=Object.entries(r.affectedDevices).map(([C,T])=>`
          <span style="font-size: 11px; background: rgba(255,255,255,0.06); border: 1px solid var(--border-color); padding: 1px 6px; border-radius: 4px; color: var(--text-secondary);">
            <i class="fa-solid fa-mobile-screen"></i> ${w(C)} <strong>(${T})</strong>
          </span>
        `).join(" "):E=`
          <span style="font-size: 11px; background: rgba(255,255,255,0.06); border: 1px solid var(--border-color); padding: 1px 6px; border-radius: 4px; color: var(--text-secondary);">
            <i class="fa-solid fa-mobile-screen"></i> ${w(d.model||"Inconnu")}
          </span>
        `;let y=Array.isArray(r.logs)?r.logs.length:0,x=y>0?r.logs.map(C=>`<div style="font-family: monospace; font-size: 11px; padding: 2px 0; color: ${C.level==="error"?"#f87171":C.level==="warn"?"#fbbf24":"var(--text-secondary)"};">[${w(C.timestamp||"")}] [${w(C.level||"log")}] ${w(C.message||"")}</div>`).join(""):'<p class="text-muted" style="font-size: 11px; margin: 0;">Aucun log joint.</p>';return`
        <div class="telemetry-card" style="background: var(--surface-card); border: 1.5px solid ${v}; border-radius: var(--radius-md); padding: 14px; box-shadow: var(--shadow-sm);">
          <div style="display: flex; justify-content: space-between; align-items: flex-start; gap: 8px; margin-bottom: 8px;">
            <div style="display: flex; align-items: center; gap: 8px; flex-wrap: wrap;">
              ${m}
              <span style="background: rgba(14,116,144,0.15); color: var(--color-primary); font-size: 11px; font-weight: 700; padding: 2px 8px; border-radius: 4px;">
                \u26A1 ${f} ${f>1?"\xE9v\xE9nements":"\xE9v\xE9nement"}
              </span>
              <span style="font-size: 11px; color: var(--text-muted);">
                <i class="fa-regular fa-clock"></i> Dernier: ${w(p)}
              </span>
              <span style="font-size: 10.5px; color: var(--text-muted); font-family: monospace;">
                #${w(r.fingerprint||r.id||"incident")}
              </span>
            </div>
            <button class="delete-report-btn" data-id="${w(r.id)}" title="Supprimer cet incident" style="background: none; border: none; color: var(--text-muted); cursor: pointer; padding: 4px 8px; border-radius: 4px; font-size: 12px; transition: color 0.2s;">
              <i class="fa-solid fa-trash"></i>
            </button>
          </div>

          <div style="background: rgba(239,68,68,0.08); border-left: 3px solid #ef4444; padding: 8px 12px; border-radius: 4px; margin-bottom: 10px;">
            <p style="margin: 0; font-family: monospace; font-size: 12px; color: var(--text-primary); font-weight: 600; word-break: break-word;">
              ${w(r.error||"Erreur inconnue")}
            </p>
          </div>

          <div style="margin-bottom: 10px; display: flex; align-items: center; gap: 6px; flex-wrap: wrap;">
            <span style="font-size: 11px; color: var(--text-muted); font-weight: 600;">Appareils touch\xE9s :</span>
            ${E}
          </div>

          ${r.stack?`
            <details style="margin-bottom: 8px;">
              <summary style="font-size: 11.5px; color: var(--color-primary); cursor: pointer; font-weight: 500;">
                <i class="fa-solid fa-code"></i> Afficher la pile d'ex\xE9cution (Stack trace)
              </summary>
              <div style="display: flex; justify-content: space-between; align-items: center; margin-top: 6px;">
                <span style="font-size: 11px; color: var(--text-muted);">Pile JavaScript :</span>
                <button class="copy-stack-ai-btn action-btn" data-id="${w(r.id)}" style="padding: 3px 8px; font-size: 11px; display: flex; align-items: center; gap: 4px; background: rgba(6,182,212,0.15); border: 1px solid var(--color-primary); color: var(--color-primary); border-radius: 4px; cursor: pointer; transition: all 0.2s;">
                  <i class="fa-solid fa-robot"></i> \u{1F4CB} Copier pour l'IA
                </button>
              </div>
              <pre style="margin: 6px 0 0 0; background: rgba(0,0,0,0.25); padding: 8px; border-radius: 4px; font-size: 10.5px; max-height: 160px; overflow-y: auto; color: var(--text-secondary); white-space: pre-wrap;">${w(r.stack)}</pre>
            </details>
          `:""}

          ${y>0?`
            <details>
              <summary style="font-size: 11.5px; color: var(--color-primary); cursor: pointer; font-weight: 500;">
                <i class="fa-solid fa-list-check"></i> Traces console (${y} logs)
              </summary>
              <div style="display: flex; justify-content: space-between; align-items: center; margin-top: 6px;">
                <span style="font-size: 11px; color: var(--text-muted);">${y} traces enregistr\xE9es :</span>
                <button class="copy-logs-btn action-btn" data-id="${w(r.id)}" style="padding: 3px 8px; font-size: 11px; display: flex; align-items: center; gap: 4px; background: rgba(255,255,255,0.06); border: 1px solid var(--border-color); color: var(--text-secondary); border-radius: 4px; cursor: pointer; transition: all 0.2s;">
                  <i class="fa-solid fa-copy"></i> Copier les logs
                </button>
              </div>
              <div style="margin-top: 6px; background: rgba(0,0,0,0.25); padding: 8px; border-radius: 4px; max-height: 160px; overflow-y: auto;">
                ${x}
              </div>
            </details>
          `:""}
        </div>
      `}).join(""),i.querySelectorAll(".copy-stack-ai-btn").forEach(r=>{r.addEventListener("click",c=>{c.stopPropagation();let p=r.getAttribute("data-id"),d=s.find(E=>E&&E.id===p);if(!d)return;let f=d.device||{},u=d.affectedDevices&&typeof d.affectedDevices=="object"?Object.entries(d.affectedDevices).map(([E,y])=>`${E} (${y})`).join(", "):f.model||"Inconnu",m=Array.isArray(d.logs)&&d.logs.length>0?d.logs.map(E=>`[${E.timestamp||""}] [${E.level||"LOG"}] ${E.message||""}`).join(`
`):"Aucun log console disponible.",v=`\u{1F6A8} [Dr. CAT Diagnostic Incident Report]
\u2022 Incident ID: #${d.fingerprint||d.id}
\u2022 Type: ${d.type||"runtime_error"}
\u2022 S\xE9v\xE9rit\xE9: ${(d.severity||"info").toUpperCase()}
\u2022 Occurrences: ${d.occurrences||1}
\u2022 App Version: v${d.appVersion||"1.16.2"}
\u2022 Appareils touch\xE9s: ${u}
\u2022 Dernier signalement: ${new Date(d.lastSeen||d.timestamp||Date.now()).toLocaleString("fr-FR")}

--- ERREUR & STACK TRACE ---
${d.error||"Erreur non sp\xE9cifi\xE9e"}
${d.stack||"(Aucune trace JavaScript disponible)"}

--- TRACES CONSOLE JOINTES ---
${m}

\u{1F449} Instruction pour l'IA :
Analyse cette trace d'erreur et ces logs de Dr. CAT, diagnostique la cause exacte du probl\xE8me et fournis les modifications de code pr\xE9cises pour le corriger.`;navigator.clipboard?.writeText(v).then(()=>{b("\u{1F4CB} Rapport complet format\xE9 pour l'IA copi\xE9 !","fa-robot",3e3)}).catch(()=>{let E=document.createElement("textarea");E.value=v,document.body.appendChild(E),E.select(),document.execCommand("copy"),document.body.removeChild(E),b("\u{1F4CB} Rapport complet format\xE9 pour l'IA copi\xE9 !","fa-robot",3e3)})})}),i.querySelectorAll(".copy-logs-btn").forEach(r=>{r.addEventListener("click",c=>{c.stopPropagation();let p=r.getAttribute("data-id"),d=s.find(u=>u&&u.id===p);if(!d||!Array.isArray(d.logs))return;let f=d.logs.map(u=>`[${u.timestamp||""}] [${u.level||"LOG"}] ${u.message||""}`).join(`
`);navigator.clipboard?.writeText(f).then(()=>{b("Logs console copi\xE9s !","fa-copy",2e3)}).catch(()=>{let u=document.createElement("textarea");u.value=f,document.body.appendChild(u),u.select(),document.execCommand("copy"),document.body.removeChild(u),b("Logs console copi\xE9s !","fa-copy",2e3)})})}),i.querySelectorAll(".delete-report-btn").forEach(r=>{r.addEventListener("click",async()=>{let c=r.getAttribute("data-id");if(c)try{await bt(c),b("Rapport supprim\xE9.","fa-check",2e3),o()}catch{b("Erreur lors de la suppression.","fa-triangle-exclamation",3e3)}})})}t&&t.addEventListener("click",()=>o(!0)),n&&n.addEventListener("click",async()=>{if(confirm("Voulez-vous vraiment effacer tous les rapports de crash enregistr\xE9s ?"))try{await bt("all"),b("Tous les rapports ont \xE9t\xE9 effac\xE9s.","fa-check",2e3),o()}catch{b("Erreur lors de la suppression.","fa-triangle-exclamation",3e3)}}),o()}var ye=null;function ea(e){ye=e;let t=document.querySelectorAll(".admin-tab-btn");t.forEach(o=>{o.addEventListener("click",()=>{let a=o.getAttribute("data-target");if(!a)return;t.forEach(c=>{c.classList.remove("active"),c.setAttribute("aria-selected","false"),c.style.color="var(--text-secondary)",c.style.backgroundColor="transparent"}),o.classList.add("active"),o.setAttribute("aria-selected","true"),o.style.color="var(--color-primary)",o.style.backgroundColor="rgba(6, 182, 212, 0.1)",document.querySelectorAll(".admin-pane-content").forEach(c=>{c.style.display="none"});let r=document.getElementById(a);r&&(r.style.display="block",a==="admin-pane-version"?We(r):a==="admin-pane-telemetry"?Zn(r):a==="admin-pane-pdfs"&&Xn(r)),window.dispatchEvent(new CustomEvent("drcat-admin-tab-changed",{detail:{activePaneId:a}}))})});let n=document.querySelector(".admin-tab-btn.active");n&&(n.style.color="var(--color-primary)",n.style.backgroundColor="rgba(6, 182, 212, 0.1)");let i=document.getElementById("btn-ai-auto-fill");i&&(i.style.display=l.isAdmin?"inline-flex":"none",i.addEventListener("click",async()=>{let o=document.getElementById("new-cat-title"),a=o?o.value.trim():"";if(!a||a.length<3){b("Veuillez saisir au moins un titre de CAT (ex: CAT devant colique n\xE9phr\xE9tique)","fa-circle-exclamation",4e3),o&&o.focus();return}let s=i.innerHTML;i.disabled=!0,i.innerHTML='<i class="fa-solid fa-spinner fa-spin"></i> Dual RAG...';try{b("Recherche Web RAG en cours...","fa-globe",3e3),await fetch(fe("/api/admin/cat-generator/fetch-web"),{method:"POST",headers:me(),body:JSON.stringify({title:a,forceRefetch:!1})}).catch(()=>{}),b("Synth\xE8se IA Dual RAG en cours...","fa-wand-magic-sparkles",5e3);let r=await fetch(fe("/api/admin/cat-generator/single"),{method:"POST",headers:me(),body:JSON.stringify({title:a})}),c=await r.json();if(!r.ok||!c.success)throw new Error(c.error||"Erreur lors de la g\xE9n\xE9ration IA.");let p=c.cat;if(p){if(p.category){let d=document.getElementById("new-cat-category");d&&(d.value=p.category)}if(p.red_flags){let d=document.getElementById("new-cat-red-flags");d&&(d.value=p.red_flags)}if(p.summary){let d=document.getElementById("new-cat-summary");d&&(d.value=p.summary)}if(p.ordonnance){let d=document.getElementById("new-cat-ordonnance");d&&(d.value=p.ordonnance)}if(p.pdf_keywords&&Array.isArray(p.pdf_keywords)){let d=document.getElementById("new-cat-pdf-keywords");d&&(d.value=p.pdf_keywords.join(", "))}b(`Fiche "${p.title}" g\xE9n\xE9r\xE9e et pr\xE9-remplie !`,"fa-circle-check",4e3)}}catch(r){console.error(r),b("Erreur IA: "+r.message,"fa-triangle-exclamation",5e3)}finally{i.disabled=!1,i.innerHTML=s}})),window.handleApproveSuggestion=async function(o){if(confirm("Voulez-vous vraiment accepter cette suggestion et l'int\xE9grer \xE0 la base de donn\xE9es ?"))try{let a=await bn(o);a.success?(b("Proposition approuv\xE9e !","fa-circle-check",3e3),ye?await ye():await Ge()):b("Erreur: "+(a.error||a.message),"fa-circle-exclamation",4e3)}catch(a){if(console.error(a),window.handleAdminError&&await window.handleAdminError(a))return;b("Erreur lors de la validation.","fa-circle-exclamation",4e3)}},window.handleRejectSuggestion=async function(o){if(confirm("Voulez-vous vraiment rejeter et supprimer cette proposition ?"))try{let a=await vn(o);a.success?(b("Proposition rejet\xE9e.","fa-circle-xmark",3e3),ye?await ye():await Ge()):b("Erreur: "+(a.error||a.message),"fa-circle-exclamation",4e3)}catch(a){if(console.error(a),window.handleAdminError&&await window.handleAdminError(a))return;b("Erreur lors du rejet.","fa-circle-exclamation",4e3)}},window.handleReviewSuggestion=async function(o){try{b("Chargement des d\xE9tails...","fa-spinner fa-spin",1500);let s=(await yt()).find(d=>d.id===o);if(!s){b("Proposition introuvable.","fa-circle-exclamation",3e3);return}let r=document.createElement("div");r.id="suggestion-review-modal",r.className="modal-overlay modal-overlay--sheet",r.setAttribute("role","dialog"),r.setAttribute("aria-modal","true");let c="";s.type==="add"&&(c=`
          <div class="form-group">
            <label for="review-sug-title">Titre de la fiche</label>
            <input type="text" id="review-sug-title" value="${w(s.data.title||"")}">
          </div>
          <div class="form-group">
            <label for="review-sug-category">Sp\xE9cialit\xE9</label>
            <input type="text" id="review-sug-category" value="${w(s.data.category||"")}">
          </div>
          <div class="form-group">
            <label for="review-sug-redflags">Red Flags (signes de gravit\xE9)</label>
            <textarea id="review-sug-redflags" rows="3">${w(s.data.red_flags||"")}</textarea>
          </div>
        `),c+=`
        <div class="form-group">
          <label for="review-sug-summary">Synth\xE8se de Conduite \xE0 Tenir</label>
          <textarea id="review-sug-summary" class="font-monospace" rows="12">${w(s.data.summary||"")}</textarea>
        </div>
        <div class="form-group">
          <label for="review-sug-ordonnance">Ordonnance Type</label>
          <textarea id="review-sug-ordonnance" class="font-monospace" rows="8">${w(s.data.ordonnance||"")}</textarea>
        </div>
      `,r.innerHTML=`
        <div class="modal-card modal-card-lg">
          <div class="modal-header">
            <h3><i class="fa-solid fa-pen-to-square"></i> R\xE9viser & \xC9diter la proposition</h3>
            <button class="close-modal-btn" id="review-modal-close" aria-label="Fermer"><i class="fa-solid fa-xmark"></i></button>
          </div>
          <div class="modal-body">
            ${c}
          </div>
          <div class="modal-footer">
            <button id="review-btn-cancel" class="cancel-btn">Annuler</button>
            <button id="review-btn-save" class="btn-solid-success"><i class="fa-solid fa-floppy-disk"></i> Enregistrer les corrections</button>
          </div>
        </div>
      `,document.body.appendChild(r);let p=()=>Pe(r);document.getElementById("review-modal-close")?.addEventListener("click",p),document.getElementById("review-btn-cancel")?.addEventListener("click",p),document.getElementById("review-btn-save")?.addEventListener("click",async()=>{try{let d={};s.type==="add"&&(d.title=document.getElementById("review-sug-title").value,d.category=document.getElementById("review-sug-category").value,d.red_flags=document.getElementById("review-sug-redflags").value);let f=document.getElementById("review-sug-summary"),u=document.getElementById("review-sug-ordonnance");f&&(d.summary=f.value),u&&(d.ordonnance=u.value);let m=await hn(o,d);m.success?(b("Corrections enregistr\xE9es avec succ\xE8s !","fa-circle-check",3e3),Pe(r),ye?await ye():await Ge()):b("Erreur: "+(m.error||m.message),"fa-circle-exclamation",4e3)}catch(d){console.error(d),b("Erreur lors de l'enregistrement.","fa-circle-exclamation",4e3)}})}catch(a){console.error(a),b("Impossible de charger les d\xE9tails de cette proposition.","fa-circle-exclamation",4e3)}}}async function Ge(e){let t=e||document.getElementById("suggestions-list");if(!(!l.isAdmin||!t))try{let n=await yt();if(n.length===0){t.innerHTML='<p class="text-muted text-center" style="padding: 10px 0;">Aucune proposition en attente.</p>';return}let i="";n.forEach(o=>{let a=new Date(o.timestamp).toLocaleString("fr-FR"),s=o.type==="add"?"add":"edit",r=o.type==="add"?"Ajout de fiche":`Modif de fiche (ID: ${o.catId})`,c="";if(o.type==="add")c=`<strong>Titre :</strong> ${w(o.data.title||"")}<br>
                    <strong>Sp\xE9cialit\xE9 :</strong> ${w(o.data.category||"")}<br>
                    <strong>Red Flags :</strong> ${w(o.data.red_flags||"")||"Aucun"}<br>
                    <strong>Synth\xE8se (extrait) :</strong> ${o.data.summary?w(o.data.summary.substring(0,150))+"...":"Aucune"}<br>
                    <strong>Ordonnance (extrait) :</strong> ${o.data.ordonnance?w(o.data.ordonnance.substring(0,100))+"...":"Aucune"}`;else if(o.type==="edit"){let p=l.allCats.find(f=>f.id===parseInt(o.catId)),d=p?p.title:`Fiche ${o.catId}`;if(c=`<strong>Fiche cibl\xE9e :</strong> ${w(d)}<br>`,o.data.summary){let f=o.data.summary.length>200?w(o.data.summary.substring(0,200))+"...":w(o.data.summary);c+=`<strong>Proposition Synth\xE8se (extrait) :</strong><div class="suggestion-diff-container">${f}</div>`}if(o.data.ordonnance){let f=o.data.ordonnance.length>150?w(o.data.ordonnance.substring(0,150))+"...":w(o.data.ordonnance);c+=`<strong>Proposition Ordonnance (extrait) :</strong><div class="suggestion-diff-container">${f}</div>`}}i+=`
        <div class="suggestion-card" data-sug-id="${w(o.id)}">
          <div class="suggestion-header">
            <span class="suggestion-badge ${s}">${r}</span>
            <span class="suggestion-time">${a}</span>
          </div>
          <div class="suggestion-body">
            <div class="suggestion-diff-content">${c}</div>
          </div>
          <div class="suggestion-actions">
            <button class="suggestion-btn btn-reject" data-action="reject">
              <i class="fa-solid fa-xmark"></i> Rejeter
            </button>
            <button class="suggestion-btn btn-review" data-action="review">
              <i class="fa-solid fa-pen-to-square"></i> R\xE9viser
            </button>
            <button class="suggestion-btn btn-approve" data-action="approve">
              <i class="fa-solid fa-check"></i> Accepter
            </button>
          </div>
        </div>
      `}),t.innerHTML=i,t.querySelectorAll('[data-action="approve"]').forEach(o=>{o.addEventListener("click",async a=>{let s=a.target.closest(".suggestion-card");if(!s)return;let r=s.getAttribute("data-sug-id");r&&window.handleApproveSuggestion&&await window.handleApproveSuggestion(r)})}),t.querySelectorAll('[data-action="review"]').forEach(o=>{o.addEventListener("click",async a=>{let s=a.target.closest(".suggestion-card");if(!s)return;let r=s.getAttribute("data-sug-id");r&&window.handleReviewSuggestion&&await window.handleReviewSuggestion(r)})}),t.querySelectorAll('[data-action="reject"]').forEach(o=>{o.addEventListener("click",async a=>{let s=a.target.closest(".suggestion-card");if(!s)return;let r=s.getAttribute("data-sug-id");r&&window.handleRejectSuggestion&&await window.handleRejectSuggestion(r)})})}catch(n){console.error("Failed to load suggestions:",n),t.innerHTML='<p class="text-danger text-center" style="padding: 10px 0;">Erreur lors du chargement des propositions.</p>'}}var oe,Ft,jt,Vt,Ut,Wt,Gt,ta,na,Yt,aa,Kt=null;function ia(){let e=l.allCats.length,t=l.allCats.filter(o=>o.status==="done").length,n=l.allCats.filter(o=>o.status==="doing").length,i=l.isAdmin?1:0;return`${e}|${t}|${n}|${i}`}function Ha(e){if(!Array.isArray(e)||e.length===0)return[];let t=["urgence","aigu","choc","d\xE9tresse","h\xE9morragie","coma","convulsion","douleur","br\xFBlure","intoxication","anaphylaxie","asthme","c\xE9phal\xE9e"],n=e.filter(c=>{let p=(c.title||"").toLowerCase(),d=(c.red_flags||"").toLowerCase();return t.some(f=>p.includes(f)||d.includes(f))}),i=n.length>=4?n:e,o=new Date,s=(o.getFullYear()*1e4+(o.getMonth()+1)*100+o.getDate())%i.length,r=[];for(let c=0;c<Math.min(4,i.length);c++)r.push(i[(s+c)%i.length]);return r}function oa(e,t){oe=document.getElementById("welcome-screen"),Ft=document.getElementById("workspace"),jt=document.getElementById("sidebar"),Vt=document.getElementById("dash-mastery-rate"),Ut=document.getElementById("dash-count-done"),Wt=document.getElementById("dash-count-doing"),Gt=document.getElementById("dash-count-todo"),ta=document.getElementById("dash-resume-list"),na=document.getElementById("dash-categories-progress"),Yt=document.getElementById("admin-moderation-panel"),aa=document.getElementById("suggestions-list");let n=document.getElementById("brand-logo"),i=document.getElementById("mobile-brand-logo");n&&n.addEventListener("click",()=>ue(e)),i&&i.addEventListener("click",()=>ue(e)),ea(t);function o(){let h=document.getElementById("emergency-shortcuts-chips-container");if(!h||!l.allCats||l.allCats.length===0)return;let L=Ha(l.allCats);h.innerHTML="",L.forEach(_=>{let A=document.createElement("button");A.className="emergency-chip",A.innerHTML=`<i class="fa-solid fa-heart-pulse"></i> <span>${w(_.title)}</span>`,A.onclick=()=>{e&&e(_)},h.appendChild(A)})}let a=document.getElementById("omni-search-input"),s=document.getElementById("omni-search-btn"),r=document.getElementById("omni-search-results");async function c(){if(!a||!r)return;let h=a.value.trim().toLowerCase();if(!h){r.style.display="none";return}let L=[];(l.allCats||[]).forEach(S=>{let H=(S.title||"").toLowerCase(),z=(S.category||"").toLowerCase(),g=(S.summary||"").toLowerCase(),I=(S.ordonnance||"").toLowerCase(),B=Array.isArray(S.search_keywords)?S.search_keywords.join(" ").toLowerCase():Array.isArray(S.pdf_keywords)?S.pdf_keywords.join(" ").toLowerCase():"",$=Array.isArray(S.sub_cats)?S.sub_cats.map(N=>`${N.label||""} ${N.summary||""} ${N.ordonnance||""}`).join(" ").toLowerCase():"";if((H.includes(h)||z.includes(h)||g.includes(h)||I.includes(h)||B.includes(h)||$.includes(h))&&L.length<6){let N=-1;if(Array.isArray(S.sub_cats)&&S.sub_cats.length>0&&!H.includes(h)&&!z.includes(h))for(let D=0;D<S.sub_cats.length;D++){let G=S.sub_cats[D];if(`${(G.label||"").toLowerCase()} ${(G.summary||"").toLowerCase()} ${(G.ordonnance||"").toLowerCase()}`.includes(h)){N=D;break}}L.push({cat:S,matchedSubIdx:N})}});let _=(l.allPdfs||[]).filter(S=>!S||typeof S!="string"?!1:S.toLowerCase().includes(h)).slice(0,4);if(L.length===0&&_.length===0){r.innerHTML=`
        <div style="padding: 14px; font-size: 12.5px; color: var(--text-muted); text-align: center;">
          Aucun r\xE9sultat direct pour "<strong>${w(h)}</strong>".
          <div style="margin-top: 8px;">
            <button id="omni-search-pdf-deep" class="action-btn" style="display: inline-flex; font-size: 11.5px; margin: 0 auto; gap: 6px;">
              <i class="fa-solid fa-file-magnifying-glass" style="color: var(--color-primary);"></i> Fouiller le texte int\xE9gral des 78 Livres PDF \u2794
            </button>
          </div>
        </div>
      `,r.style.display="flex";let S=document.getElementById("omni-search-pdf-deep");S&&(S.onclick=()=>{r.style.display="none",window.openGlobalPdfSearch(h)});return}let A="";L.length>0&&(A+=`<div style="padding: 6px 10px; font-size: 10.5px; font-weight: 700; color: var(--text-secondary); background: rgba(0,0,0,0.15); border-bottom: 1px solid var(--border-color); display: flex; justify-content: space-between;"><span>FICHES CAT (${L.length})</span><span style="color: var(--color-primary); cursor: pointer;" id="omni-search-pdf-link"><i class="fa-solid fa-file-pdf"></i> Fouiller les PDFs \u2794</span></div>`,L.forEach(({cat:S,matchedSubIdx:H})=>{let z="";if(H>=0&&S.sub_cats[H]){let g=S.sub_cats[H].label||`Sous-fiche ${H+1}`,I=g.length>30?g.substring(0,27)+"\u2026":g;z=`<div style="font-size:9px; padding:1px 5px; margin-top:1px; border-radius:4px; background:rgba(168,85,247,0.12); color:#c084fc; border:1px solid rgba(168,85,247,0.25); white-space:nowrap; overflow:hidden; text-overflow:ellipsis;"><i class="fa-solid fa-arrow-turn-down" style="margin-right:2px;"></i> ${w(I)}</div>`}A+=`
          <div class="omni-result-item" data-cat-id="${S.id}" data-sub-idx="${H>=0?H+1:0}" style="padding: 8px 10px; border-radius: 6px; cursor: pointer; display: flex; align-items: center; justify-content: space-between; gap: 8px; transition: background 0.15s ease;">
            <div style="display: flex; flex-direction: column; gap: 2px; min-width: 0;">
              <strong style="font-size: 12px; color: var(--text-primary); text-overflow: ellipsis; overflow: hidden; white-space: nowrap;">${w(S.title)}</strong>
              <span style="font-size: 10px; color: var(--color-primary);">${w(S.category||"")}</span>
              ${z}
            </div>
            <span style="font-size: 10px; padding: 2px 6px; border-radius: 12px; background: rgba(255,255,255,0.05); color: var(--text-muted);">${S.status==="done"?"\u2705":S.status==="doing"?"\u23F3":"\u26AA"}</span>
          </div>
        `})),_.length>0&&(A+=`<div style="padding: 6px 10px; font-size: 10.5px; font-weight: 700; color: var(--color-success); background: rgba(0,0,0,0.15); border-top: 1px solid var(--border-color); border-bottom: 1px solid var(--border-color);">MANUELS & DOCUMENTS PDF (${_.length})</div>`,_.forEach(S=>{let H=S.replace(/^\d+[\s\-_]*/,"").replace(/\.pdf$/i,"").replace(/_/g," ");A+=`
          <a class="omni-result-item" href="pdf_viewer.html?file=${encodeURIComponent(S)}&page=1" style="padding: 8px 10px; border-radius: 6px; text-decoration: none; display: flex; align-items: center; justify-content: space-between; gap: 8px; transition: background 0.15s ease;">
            <div style="display: flex; align-items: center; gap: 8px; min-width: 0;">
              <i class="fa-solid fa-file-pdf" style="color: var(--color-danger); font-size: 14px;"></i>
              <strong style="font-size: 12px; color: var(--text-primary); text-overflow: ellipsis; overflow: hidden; white-space: nowrap;">${w(H)}</strong>
            </div>
            <span style="font-size: 10px; color: var(--color-primary); font-weight: 600;">Ouvrir \u2794</span>
          </a>
        `})),r.innerHTML=A,r.style.display="flex",r.querySelectorAll(".omni-result-item[data-cat-id]").forEach(S=>{S.onclick=()=>{let H=parseInt(S.getAttribute("data-cat-id"),10),z=parseInt(S.getAttribute("data-sub-idx")||"0",10),g=(l.allCats||[]).find(I=>I.id===H);g&&e&&(r.style.display="none",e(g,z))},S.onmouseenter=()=>{S.style.background="rgba(6, 182, 212, 0.1)"},S.onmouseleave=()=>{S.style.background="transparent"}});let M=document.getElementById("omni-search-pdf-link");M&&(M.onclick=()=>{r.style.display="none",window.openGlobalPdfSearch(h)})}a&&(a.addEventListener("input",()=>{clearTimeout(window._omniTimer),window._omniTimer=setTimeout(c,200)}),a.addEventListener("keydown",h=>{h.key==="Enter"&&c(),h.key==="Escape"&&r&&(r.style.display="none")})),s&&s.addEventListener("click",c),document.addEventListener("click",h=>{r&&r.style.display!=="none"&&(h.target.closest(".omni-search-container")||(r.style.display="none"))}),document.addEventListener("keydown",h=>{if((h.ctrlKey||h.metaKey)&&(h.key==="k"||h.key==="K")){h.preventDefault();let L=document.getElementById("omni-search-input"),_=document.getElementById("search-input"),A=document.getElementById("workspace");if(!(A&&A.style.display!=="none")&&L&&L.offsetParent!==null)L.focus(),L.select();else if(_){let S=document.getElementById("sidebar");S&&!S.classList.contains("open")&&window.innerWidth<=850&&S.classList.add("open"),_.focus(),_.select()}}});let p=document.getElementById("dash-quick-lib-card");if(p){let h=()=>{window.openStandaloneLibrary&&window.openStandaloneLibrary()};p.onclick=h,p.onkeydown=L=>{(L.key==="Enter"||L.key===" ")&&(L.preventDefault(),h())}}let d=document.getElementById("dash-quick-quiz-card");if(d){let h=()=>{let L=document.getElementById("start-quiz-nav-btn");L&&L.click()};d.onclick=h,d.onkeydown=L=>{(L.key==="Enter"||L.key===" ")&&(L.preventDefault(),h())}}window.openGlobalPdfSearch=function(h=""){window.openStandaloneLibrary&&window.openStandaloneLibrary(h)},window.renderDailyEmergencyChips=o;let f=document.getElementById("export-progress-btn");f&&f.addEventListener("click",()=>{let h=P("dr_cat_user_progress");if(!h||h==="{}"){b("Aucune progression enregistr\xE9e \xE0 exporter.","fa-circle-exclamation",3e3);return}let L=`drcat-progression-${new Date().toISOString().slice(0,10)}.json`;ht(L,"Sauvegarde Progression",h)});let u=document.getElementById("import-progress-btn"),m=document.getElementById("import-progress-file");u&&m&&(u.addEventListener("click",()=>{m.click()}),m.addEventListener("change",h=>{let L=h.target.files[0];if(!L)return;let _=new FileReader;_.onload=async A=>{try{let M=JSON.parse(A.target.result),S=Object.keys(M);S.length>0&&typeof M[S[0]]=="object"?(O("dr_cat_user_progress",JSON.stringify(M)),b("Progression import\xE9e avec succ\xE8s ! L'application va se recharger.","fa-circle-check",4e3),location.reload()):b("Format de fichier invalide.","fa-circle-exclamation",4e3)}catch(M){console.error(M),b("Erreur lors de la lecture du fichier d'importation.","fa-circle-exclamation",4e3)}},_.readAsText(L)}));let v=document.getElementById("admin-bulk-import-input"),E=document.getElementById("admin-bulk-import-trigger-btn"),y=document.getElementById("bulk-import-file-name"),x=document.getElementById("admin-bulk-import-submit-btn"),C=null;E&&v&&E.addEventListener("click",()=>v.click()),v&&v.addEventListener("change",h=>{let L=h.target.files[0];if(!L){y&&(y.textContent="Aucun fichier s\xE9lectionn\xE9"),x&&(x.disabled=!0,x.style.opacity="0.5",x.style.cursor="not-allowed"),C=null;return}y&&(y.textContent=L.name);let _=new FileReader;_.onload=A=>{try{let M=JSON.parse(A.target.result);if(!Array.isArray(M))throw new Error("Le fichier JSON doit contenir un tableau de fiches.");C=M,x&&(x.disabled=!1,x.style.opacity="1",x.style.cursor="pointer")}catch(M){b(`Erreur JSON: ${M.message}`,"fa-triangle-exclamation",4e3),y&&(y.textContent="Fichier JSON invalide"),x&&(x.disabled=!0,x.style.opacity="0.5",x.style.cursor="not-allowed"),C=null}},_.readAsText(L)}),x&&x.addEventListener("click",async()=>{if(C)try{x.disabled=!0,x.innerHTML='<i class="fa-solid fa-spinner fa-spin"></i> Importation...';let h=await yn(C);h.count>0&&h.skippedCount>0?b(`${h.count} fiches import\xE9es, ${h.skippedCount} ignor\xE9es (d\xE9j\xE0 existantes).`,"fa-circle-check",5e3):h.count===0&&h.skippedCount>0?b(`Aucune nouvelle fiche. Les ${h.skippedCount} fiches existaient d\xE9j\xE0.`,"fa-circle-exclamation",4e3):b(`${h.count} fiches import\xE9es avec succ\xE8s !`,"fa-circle-check",4e3),C=null,v&&(v.value=""),y&&(y.textContent="Aucun fichier s\xE9lectionn\xE9"),x.disabled=!0,x.style.opacity="0.5",x.style.cursor="not-allowed",x.innerHTML='<i class="fa-solid fa-cloud-arrow-up"></i> Importer',t&&await t()}catch(h){b(`\xC9chec de l'importation: ${h.message}`,"fa-triangle-exclamation",4e3),x.disabled=!1,x.innerHTML='<i class="fa-solid fa-cloud-arrow-up"></i> Importer'}});let T=document.getElementById("export-specialty-btn"),R=document.getElementById("export-specialty-select");T&&R&&T.addEventListener("click",()=>{let h=R.value;if(!h){b("Veuillez s\xE9lectionner une sp\xE9cialit\xE9.","fa-triangle-exclamation",3e3);return}let L=l.allCats.filter(_=>_.category===h).map(_=>({category:_.category,title:_.title,summary:_.summary,red_flags:_.red_flags,ordonnance:_.ordonnance,pdf_keywords:_.pdf_keywords||[]}));ht(`Fiches_DrCAT_${h.replace(/\s+/g,"_")}.json`,"Export Sp\xE9cialit\xE9",L),b(`Exportation r\xE9ussie de ${L.length} fiches !`,"fa-circle-check",3e3)})}function ue(e){l.activeCat=null,document.querySelectorAll(".cat-item").forEach(o=>o.classList.remove("active")),Ft&&(Ft.style.display="none"),oe&&(oe.style.display="flex");let t=document.getElementById("quiz-screen");t&&(t.style.display="none");let n=document.getElementById("library-screen");n&&(n.style.display="none"),window.innerWidth<=850&&jt&&jt.classList.remove("open");let i=ia();Kt===i&&oe&&oe.dataset.rendered==="true"||(Kt=i,Ye(e))}async function Ye(e){if(window.perf&&window.perf.startMeasure("dashboard.renderDashboard"),!oe||oe.style.display==="none")return;let t=document.getElementById("export-specialty-select");if(t){let d=Array.from(new Set(l.allCats.map(u=>u.category))).sort(),f=t.value;t.innerHTML='<option value="">Choisir sp\xE9cialit\xE9...</option>',d.forEach(u=>{let m=document.createElement("option");m.value=u,m.textContent=u,u===f&&(m.selected=!0),t.appendChild(m)})}let n=Yn(l.allCats),i=n.total,o=document.getElementById("total-cats-count");o&&(o.textContent=i);let a=i>0?Math.round(n.done/i*100):0;if(Vt){Vt.textContent=`${a}%`;let d=document.getElementById("dash-mastery-ring");if(d){let u=2*Math.PI*22,m=u-a/100*u;d.style.strokeDashoffset=m}}Ut&&(Ut.textContent=`${n.done} / ${i}`),Wt&&(Wt.textContent=`${n.doing} / ${i}`),Gt&&(Gt.textContent=`${n.todo} / ${i}`);let s=Kn(),r=document.getElementById("dash-streak-count");r&&(r.textContent=`${s} jour${s>1?"s":""}`);let c=l.allCats.filter(d=>d.status==="doing"||d.status==="done");Qn(ta,c,e),Jn(na,l.allCats),typeof window.renderDailyEmergencyChips=="function"&&window.renderDailyEmergencyChips();let p=document.getElementById("dash-first-run-banner");if(p){let d=l.allCats.some(f=>f.status!=="todo"||f.notes);p.style.display=d?"none":"flex"}Yt&&(Yt.style.display=l.isAdmin?"block":"none"),l.isAdmin&&await Ge(aa),Kt=ia(),oe&&(oe.dataset.rendered="true"),window.perf&&(window.perf.endMeasure("dashboard.renderDashboard"),window.perf.recordMilestone("dashboardReady"))}var ca="dr_cat_last_douaa_time",ra="dr_cat_last_douaa_idx";var Qt=[{id:1,badge:"\u0628\u0631 \u0627\u0644\u0648\u0627\u0644\u062F\u064A\u0646",verse:"\uFD3F \u0631\u0651\u064E\u0628\u0651\u0650 \u0627\u0631\u0652\u062D\u064E\u0645\u0652\u0647\u064F\u0645\u064E\u0627 \u0643\u064E\u0645\u064E\u0627 \u0631\u064E\u0628\u0651\u064E\u064A\u064E\u0627\u0646\u0650\u064A \u0635\u064E\u063A\u0650\u064A\u0631\u064B\u0627 \uFD3E",supplication:"\u0627\u0644\u0644\u0651\u064E\u0647\u064F\u0645\u0651\u064E \u0627\u063A\u0652\u0641\u0650\u0631\u0652 \u0644\u0650\u0645\u064F\u0639\u0650\u062F\u0651\u0650 \u0647\u064E\u0630\u064E\u0627 \u0627\u0644\u062A\u0651\u064E\u0637\u0652\u0628\u0650\u064A\u0642\u0650 \u0648\u064E\u0644\u0650\u0648\u064E\u0627\u0644\u0650\u062F\u064E\u064A\u0652\u0647\u0650 \u0648\u064E\u0627\u062C\u0652\u0639\u064E\u0644\u0652\u0647\u064F \u0635\u064E\u062F\u064E\u0642\u064E\u0629\u064B \u062C\u064E\u0627\u0631\u0650\u064A\u064E\u0629\u064B \u0639\u064E\u0646\u0652\u0647\u064F\u0645\u064E\u0627 \u{1F932}"},{id:2,badge:"\u0645\u063A\u0641\u0631\u0629 \u0648\u0631\u062D\u0645\u0629",verse:"\uFD3F \u0631\u064E\u0628\u0651\u064E\u0646\u064E\u0627 \u0627\u063A\u0652\u0641\u0650\u0631\u0652 \u0644\u0650\u064A \u0648\u064E\u0644\u0650\u0648\u064E\u0627\u0644\u0650\u062F\u064E\u064A\u0651\u064E \u0648\u064E\u0644\u0650\u0644\u0652\u0645\u064F\u0624\u0652\u0645\u0650\u0646\u0650\u064A\u0646\u064E \u064A\u064E\u0648\u0652\u0645\u064E \u064A\u064E\u0642\u064F\u0648\u0645\u064F \u0627\u0644\u0652\u062D\u0650\u0633\u064E\u0627\u0628\u064F \uFD3E",supplication:"\u0646\u064E\u0633\u0652\u0623\u064E\u0644\u064F\u0643\u064F\u0645 \u062F\u064E\u0639\u0652\u0648\u064E\u0629\u064B \u0635\u064E\u0627\u0644\u0650\u062D\u064E\u0629\u064B \u0628\u0650\u0638\u064E\u0647\u0652\u0631\u0650 \u0627\u0644\u063A\u064E\u064A\u0652\u0628\u0650 \u0644\u0650\u0644\u0637\u0651\u064E\u0628\u0650\u064A\u0628\u0650 \u0645\u064F\u0639\u0650\u062F\u0651\u0650 \u0627\u0644\u0639\u064E\u0645\u064E\u0644\u0650 \u0648\u064E\u0648\u064E\u0627\u0644\u0650\u062F\u064E\u064A\u0652\u0647\u0650"},{id:3,badge:"\u062F\u0639\u0627\u0621 \u062C\u0627\u0645\u0639",verse:"\uFD3F \u0631\u0651\u064E\u0628\u0651\u0650 \u0627\u063A\u0652\u0641\u0650\u0631\u0652 \u0644\u0650\u064A \u0648\u064E\u0644\u0650\u0648\u064E\u0627\u0644\u0650\u062F\u064E\u064A\u0651\u064E \u0648\u064E\u0644\u0650\u0645\u064E\u0646 \u062F\u064E\u062E\u064E\u0644\u064E \u0628\u064E\u064A\u0652\u062A\u0650\u064A\u064E \u0645\u064F\u0624\u0652\u0645\u0650\u0646\u064B\u0627 \uFD3E",supplication:"\u0627\u0644\u0644\u0651\u064E\u0647\u064F\u0645\u0651\u064E \u0627\u062C\u0652\u0632\u0650 \u0648\u064E\u0627\u0644\u0650\u062F\u064E\u064A\u0652\u0646\u064E\u0627 \u0639\u064E\u0646\u0651\u064E\u0627 \u062E\u064E\u064A\u0652\u0631\u064E \u0627\u0644\u062C\u064E\u0632\u064E\u0627\u0621\u0650 \u0648\u064E\u0627\u0631\u0652\u0641\u064E\u0639\u0652 \u062F\u064E\u0631\u064E\u062C\u064E\u0627\u062A\u0650\u0647\u0650\u0645\u064E\u0627 \u0641\u0650\u064A \u0639\u0650\u0644\u0651\u0650\u064A\u0651\u0650\u064A\u0646\u064E"},{id:4,badge:"\u0639\u0644\u0645 \u0646\u0627\u0641\u0639 \u0648\u0634\u0641\u0627\u0621",verse:"\xAB \u0627\u0644\u0644\u0651\u064E\u0647\u064F\u0645\u0651\u064E \u0627\u0646\u0652\u0641\u064E\u0639\u0652\u0646\u064E\u0627 \u0628\u0650\u0645\u064E\u0627 \u0639\u064E\u0644\u0651\u064E\u0645\u0652\u062A\u064E\u0646\u064E\u0627\u060C \u0648\u064E\u0639\u064E\u0644\u0651\u0650\u0645\u0652\u0646\u064E\u0627 \u0645\u064E\u0627 \u064A\u064E\u0646\u0652\u0641\u064E\u0639\u064F\u0646\u064E\u0627\u060C \u0648\u064E\u0632\u0650\u062F\u0652\u0646\u064E\u0627 \u0639\u0650\u0644\u0652\u0645\u064B\u0627 \xBB",supplication:"\u0627\u0644\u0644\u0651\u064E\u0647\u064F\u0645\u0651\u064E \u0627\u0634\u0652\u0641\u0650 \u0643\u064F\u0644\u0651\u064E \u0645\u064E\u0631\u0650\u064A\u0636\u064D\u060C \u0648\u064E\u0628\u064E\u0627\u0631\u0650\u0643\u0652 \u0641\u0650\u064A \u0635\u064E\u0627\u062D\u0650\u0628\u0650 \u0647\u064E\u0630\u064E\u0627 \u0627\u0644\u062A\u0651\u064E\u0637\u0652\u0628\u0650\u064A\u0642\u0650 \u0648\u064E\u0648\u064E\u0627\u0644\u0650\u062F\u064E\u064A\u0652\u0647\u0650"},{id:5,badge:"\u0634\u0643\u0631 \u0627\u0644\u0646\u0639\u0645\u0629",verse:"\uFD3F \u0631\u064E\u0628\u0651\u0650 \u0623\u064E\u0648\u0652\u0632\u0650\u0639\u0652\u0646\u0650\u064A \u0623\u064E\u0646\u0652 \u0623\u064E\u0634\u0652\u0643\u064F\u0631\u064E \u0646\u0650\u0639\u0652\u0645\u064E\u062A\u064E\u0643\u064E \u0627\u0644\u0651\u064E\u062A\u0650\u064A \u0623\u064E\u0646\u0652\u0639\u064E\u0645\u0652\u062A\u064E \u0639\u064E\u0644\u064E\u064A\u0651\u064E \u0648\u064E\u0639\u064E\u0644\u064E\u0649\u0670 \u0648\u064E\u0627\u0644\u0650\u062F\u064E\u064A\u0651\u064E \uFD3E",supplication:"\u0627\u0644\u0644\u0651\u064E\u0647\u064F\u0645\u0651\u064E \u062A\u064E\u0642\u064E\u0628\u0651\u064E\u0644\u0652 \u0647\u064E\u0630\u064E\u0627 \u0627\u0644\u062C\u064F\u0647\u0652\u062F\u064E \u062E\u064E\u0627\u0644\u0650\u0635\u064B\u0627 \u0644\u0650\u0648\u064E\u062C\u0652\u0647\u0650\u0643\u064E \u0627\u0644\u0643\u064E\u0631\u0650\u064A\u0645\u0650 \u0639\u064E\u0646\u0651\u064E\u0627 \u0648\u064E\u0639\u064E\u0646\u0652 \u0648\u064E\u0627\u0644\u0650\u062F\u064E\u064A\u0652\u0646\u064E\u0627"}],da=null,be=null,dt=9e3,Xt=0;function qa(){let e=-1;try{e=parseInt(localStorage.getItem(ra)||"-1",10)}catch{}let t=Qt.map((i,o)=>o).filter(i=>i!==e);t.length===0&&(t=Qt.map((i,o)=>o));let n=t[Math.floor(Math.random()*t.length)];try{localStorage.setItem(ra,String(n))}catch{}return Qt[n]}function pa(){try{let e=localStorage.getItem(ca);if(!e)return!0;let t=parseInt(e,10);return isNaN(t)?!0:Date.now()-t>=12e5}catch{return!1}}function Fa(){try{localStorage.setItem(ca,String(Date.now()))}catch{}}function Jt(e=!1){if(!e&&!pa()||document.getElementById("dr-cat-douaa-toast"))return;let t=qa();Fa();let n=document.createElement("aside");n.id="dr-cat-douaa-toast",n.className="douaa-toast-container",n.setAttribute("role","alert"),n.setAttribute("aria-live","polite"),n.innerHTML=`
    <div class="douaa-toast-header">
      <div class="douaa-badge-wrapper">
        <span class="douaa-badge">
          <span class="douaa-badge-icon">\u{1F33F}</span>
          <span class="douaa-badge-text">${t.badge}</span>
        </span>
      </div>
      <button class="douaa-close-btn" id="douaa-close-trigger" aria-label="Fermer" title="\u0625\u063A\u0644\u0627\u0642">\xD7</button>
    </div>
    <div class="douaa-verse">${t.verse}</div>
    <div class="douaa-supplication">${t.supplication}</div>
    <div class="douaa-toast-footer">
      <button class="douaa-btn-ameen" id="douaa-ameen-trigger">
        <span>\u0622\u0645\u064A\u0646 \u{1F932}</span>
      </button>
    </div>
  `,document.body.appendChild(n),da=n,requestAnimationFrame(()=>{n.classList.add("douaa-visible")}),ja(),n.addEventListener("mouseenter",sa),n.addEventListener("mouseleave",la),n.addEventListener("touchstart",sa,{passive:!0}),n.addEventListener("touchend",la,{passive:!0});let i=n.querySelector("#douaa-close-trigger");i&&i.addEventListener("click",()=>{pt()});let o=n.querySelector("#douaa-ameen-trigger");o&&o.addEventListener("click",()=>{o.classList.add("douaa-ameen-accepted"),o.innerHTML="<span>\u062C\u0632\u0627\u0643\u0645 \u0627\u0644\u0644\u0647 \u062E\u064A\u0631\u0627\u064B \u{1F49A}</span>",clearTimeout(be),setTimeout(()=>{pt()},1400)})}function ja(){clearTimeout(be),Xt=Date.now(),dt=9e3,be=setTimeout(()=>{pt()},9e3)}function sa(){clearTimeout(be);let e=Date.now()-Xt;dt=Math.max(1e3,dt-e)}function la(){clearTimeout(be),Xt=Date.now(),be=setTimeout(()=>{pt()},dt)}function pt(){clearTimeout(be);let e=document.getElementById("dr-cat-douaa-toast");e&&(e.classList.remove("douaa-visible"),e.classList.add("douaa-hiding"),setTimeout(()=>{e&&e.parentNode&&e.parentNode.removeChild(e),da=null},400))}function ua(){setTimeout(()=>{Jt(!1)},5e3),setInterval(()=>{pa()&&!document.getElementById("dr-cat-douaa-toast")&&Jt(!1)},120*1e3)}typeof window<"u"&&(window.showDouaaToast=Jt);function fa(e={}){let t=window.Capacitor&&window.Capacitor.Plugins&&window.Capacitor.Plugins.App;return!t||typeof t.addListener!="function"?!1:(t.addListener("backButton",()=>{try{if(e.isModalOpen&&e.isModalOpen()){e.closeModal&&e.closeModal();return}if(e.isDrawerOpen&&e.isDrawerOpen()){e.closeDrawer&&e.closeDrawer();return}if(e.isDeepView&&e.isDeepView()){e.goToDashboard&&e.goToDashboard();return}e.confirmExit&&e.confirmExit()}catch(n){console.warn("[BackButton] handler error:",n)}}),!0)}function ma(){let e=window.Capacitor&&window.Capacitor.Plugins&&window.Capacitor.Plugins.Keyboard;if(!e||typeof e.addListener!="function")return!1;let t=n=>{document.documentElement.style.setProperty("--capacitor-keyboard-height",`${n}px`)};return e.addListener("keyboardWillShow",n=>{try{let i=n&&typeof n.keyboardHeight=="number"?n.keyboardHeight:0;t(i);let o=document.activeElement;o&&(o.tagName==="INPUT"||o.tagName==="TEXTAREA")&&o.scrollIntoView({block:"center",behavior:"smooth"})}catch(i){console.warn("[Keyboard] show error:",i)}}),e.addListener("keyboardWillHide",()=>{try{t(0)}catch(n){console.warn("[Keyboard] hide error:",n)}}),!0}function ga(e={}){let t=window.Capacitor&&window.Capacitor.Plugins&&window.Capacitor.Plugins.App;return!t||typeof t.addListener!="function"?!1:(typeof e.onPause=="function"&&t.addListener("pause",()=>{try{e.onPause()}catch(n){console.warn("[Lifecycle] pause error:",n)}}),typeof e.onResume=="function"&&t.addListener("resume",()=>{try{e.onResume()}catch(n){console.warn("[Lifecycle] resume error:",n)}}),!0)}var ya=null,Va=()=>ya||(ya=import("./chunk-5RRT3DDV.js")),ba={light:"#f1f5f9",dark:"#090d16"};function va(e){let t=e?ba.light:ba.dark,n=document.querySelector('meta[name="theme-color"]:not([media])');n||(n=document.createElement("meta"),n.name="theme-color",document.head.appendChild(n)),n.setAttribute("content",t);try{let i=window.Capacitor?.Plugins?.StatusBar;i&&(i.setBackgroundColor?.({color:t}),i.setStyle?.({style:e?"LIGHT":"DARK"}))}catch{}}window.handleAdminError=async function(e){if(e&&(e.message==="403 Forbidden"||e.message==="401 Unauthorized")){let t=prompt("Action r\xE9serv\xE9e aux administrateurs. Saisissez le mot de passe admin pour d\xE9verrouiller :");if(t)try{let n=await gt(t);if(n.success&&n.token)return b("Connexion r\xE9ussie ! L'action va \xEAtre relanc\xE9e.","fa-circle-check",3e3),location.reload(),!0;b("Mot de passe incorrect.","fa-circle-exclamation",3e3)}catch(n){console.error("Login failed:",n),b("Erreur lors de la connexion.","fa-circle-exclamation",4e3)}return!0}return!1};var Zt,W,en,tn,ve;async function ha(){if(Dn(),window.addEventListener("error",y=>{b("Une erreur d'ex\xE9cution est survenue. D\xE9tails enregistr\xE9s dans l'onglet Diagnostic.","fa-triangle-exclamation",7e3)}),window.addEventListener("unhandledrejection",y=>{b("Erreur r\xE9seau ou r\xE9ponse de base de donn\xE9es non reconnue.","fa-circle-exclamation",5e3)}),"serviceWorker"in navigator){let y=location.hostname.includes("ngrok")||location.hostname.includes("loca.lt")||location.hostname.includes("trycloudflare.com")||location.hostname.includes("cfargotunnel.com");J||y?(navigator.serviceWorker.getRegistrations().then(x=>{x.forEach(C=>C.unregister())}),caches.keys().then(x=>x.forEach(C=>caches.delete(C))),console.log("[Startup] Service worker disabled on standalone app / remote tunnel host to prevent cache deadlocks.")):location.hostname==="localhost"||location.hostname==="127.0.0.1"||rn.some(C=>C.isDevHostname(location.hostname))||window.addEventListener("load",()=>{navigator.serviceWorker.register("/service-worker.js").then(C=>{console.log("PWA SW registered:",C.scope),C&&C.addEventListener("updatefound",()=>{let T=C.installing;T&&T.addEventListener("statechange",()=>{T.state==="installed"&&navigator.serviceWorker.controller&&b("Mise \xE0 jour disponible. Rechargez pour l'appliquer.","fa-rotate",8e3)})})}).catch(C=>console.error("PWA SW failed:",C))})}(function(){try{let x=document.createElement("div");x.className="offline-badge",x.setAttribute("role","status"),x.setAttribute("aria-live","polite"),x.innerHTML='<i class="fa-solid fa-wifi" style="transform: rotate(45deg);"></i> Mode hors-ligne',document.body.appendChild(x),window.addEventListener("offline",()=>x.classList.add("show")),window.addEventListener("online",()=>x.classList.remove("show"))}catch{}})();let e=document.getElementById("theme-toggle-btn"),t=document.getElementById("theme-toggle-icon"),n=document.documentElement,i=n.classList.contains("light-theme");try{window.Capacitor?.Plugins?.StatusBar?.setOverlaysWebView?.({overlay:!1})}catch{}va(i),t&&(t.classList.toggle("fa-sun",i),t.classList.toggle("fa-moon",!i)),requestAnimationFrame(()=>{requestAnimationFrame(()=>n.classList.remove("theme-booting"))});let o=/firefox|fxios/i.test(navigator.userAgent);o&&n.classList.add("is-firefox"),e&&e.addEventListener("click",()=>{e.blur();let y=()=>{let A=n.classList.toggle("light-theme");O("theme",A?"light":"dark"),n.style.colorScheme=A?"light":"dark",t&&(t.classList.toggle("fa-sun",A),t.classList.toggle("fa-moon",!A)),va(A)},x=window.matchMedia&&window.matchMedia("(prefers-reduced-motion: reduce)").matches;if(!document.startViewTransition||x){y();return}let C=e.getBoundingClientRect(),T=C.left+C.width/2,R=C.top+C.height/2,h=Math.hypot(Math.max(T,window.innerWidth-T),Math.max(R,window.innerHeight-R));n.style.setProperty("--theme-x",`${T}px`),n.style.setProperty("--theme-y",`${R}px`);let L=document.startViewTransition(()=>{y()}),_=o?750:520;L.ready.then(()=>{document.documentElement.animate({clipPath:[`circle(0px at ${T}px ${R}px)`,`circle(${h}px at ${T}px ${R}px)`]},{duration:_,easing:"cubic-bezier(0.25, 1, 0.5, 1)",pseudoElement:"::view-transition-new(root)"})}).catch(()=>{})});let a=document.getElementById("about-legal-header");a&&a.addEventListener("click",()=>{let y=document.getElementById("about-legal-content"),x=document.getElementById("about-legal-chevron");if(!y||!x)return;let C=y.style.maxHeight==="500px";y.style.maxHeight=C?"0px":"500px",x.style.transform=C?"rotate(0deg)":"rotate(180deg)"}),Mn(V,Ya,Qe),Gn(Ga,Ka,Qa),oa(V,Ja),Va().then(y=>y.initQuiz(V)).catch(y=>console.warn("[lazy] quiz init failed",y)),Zt=document.getElementById("add-cat-btn"),W=document.getElementById("add-cat-modal"),en=document.getElementById("close-add-cat-modal-btn"),tn=document.getElementById("cancel-add-cat-btn"),ve=document.getElementById("add-cat-form"),Zt&&Zt.addEventListener("click",()=>{let y=document.getElementById("new-cat-category-select"),x=document.getElementById("new-cat-category");if(y){let C=[...new Set(l.allCats.map(T=>T.category))].filter(Boolean).sort();y.innerHTML=`
          <option value="">-- S\xE9lectionner une sp\xE9cialit\xE9 existante --</option>
          ${C.map(T=>`<option value="${T}">${T}</option>`).join("")}
        `,y.onchange=()=>{y.value&&x&&(x.value=y.value)}}W&&(W.classList.remove("modal-overlay--sheet"),W.style.display="flex")});function s(){if(!W)return;if(window.matchMedia&&window.matchMedia("(prefers-reduced-motion: reduce)").matches){W.style.display="none",ve&&ve.reset();return}W.classList.add("modal-closing");let y=x=>{x.target!==W&&x.target!==W.querySelector(".modal-card")||(W.removeEventListener("animationend",y),W.classList.remove("modal-closing"),W.style.display="none",ve&&ve.reset())};W.addEventListener("animationend",y),setTimeout(()=>y({target:W}),600)}en&&en.addEventListener("click",s),tn&&tn.addEventListener("click",s),ve&&ve.addEventListener("submit",async y=>{y.preventDefault();let x=document.getElementById("new-cat-title").value.trim(),C=document.getElementById("new-cat-category").value.trim(),T=document.getElementById("new-cat-red-flags").value.trim(),R=document.getElementById("new-cat-summary").value.trim(),h=document.getElementById("new-cat-ordonnance").value.trim(),L=document.getElementById("new-cat-pdf-keywords").value,_=L?L.split(",").map(A=>A.trim()).filter(A=>A):[];if(l.isAdmin)try{let A=await gn({title:x,category:C,red_flags:T,summary:R,ordonnance:h,pdf_keywords:_});if(A.success){s();try{let S=F(P("dr_cat_local_overrides"),{});S[A.cat.id]&&(delete S[A.cat.id],O("dr_cat_local_overrides",JSON.stringify(S)))}catch{}b(`La fiche CAT "${x}" a \xE9t\xE9 ajout\xE9e avec succ\xE8s !`,"fa-circle-check",3e3),await Qe();let M=l.allCats.find(S=>S.id===A.cat.id);M&&V(M)}else b("Erreur : "+A.error,"fa-circle-exclamation",4e3)}catch(A){if(console.error(A),window.handleAdminError&&await window.handleAdminError(A))return;b("Erreur lors de l'enregistrement de la nouvelle CAT.","fa-circle-exclamation",4e3)}else{if(!confirm(`Attention : Cette nouvelle fiche ne sera pas ajout\xE9e directement. Elle sera envoy\xE9e \xE0 l'administrateur du site pour relecture et validation avant d'\xEAtre int\xE9gr\xE9e.

Souhaitez-vous envoyer cette proposition ?`))return;try{await Re(Me,{type:"add",data:{title:x,category:C,red_flags:T,summary:R,ordonnance:h,pdf_keywords:_}},`Votre proposition de nouvelle fiche "${x}" a \xE9t\xE9 envoy\xE9e \xE0 l'administrateur pour validation.`)&&s()}catch(M){console.error(M),b("Erreur lors de l'envoi de la proposition.","fa-circle-exclamation",4e3)}}});let r=document.getElementById("admin-login-btn");r&&r.addEventListener("click",async()=>{if(l.isAdmin)confirm("Voulez-vous vous d\xE9connecter du mode administrateur ?")&&(await dn(),b("D\xE9connexion r\xE9ussie.","fa-circle-check",3e3),location.reload());else{let y=prompt("Veuillez saisir le mot de passe administrateur :");if(y)try{let x=await gt(y);x.success&&x.token?(b("Connexion r\xE9ussie !","fa-circle-check",3e3),location.reload()):b(x.error||"Mot de passe incorrect.","fa-circle-exclamation",3e3)}catch(x){console.error("Login error:",x),b("Erreur lors de la connexion.","fa-circle-exclamation",4e3)}}}),r&&(r.style.display="none"),window.addEventListener("online",()=>{b("Connexion r\xE9seau d\xE9tect\xE9e. Synchronisation...","fa-wifi",4e3),Ke()}),window.addEventListener("offline",()=>{b("Connexion perdue. Mode hors-ligne activ\xE9.","fa-circle-xmark",6e3),J&&(et(re.ANDROID_OFFLINE),l.isOnlineAtStartup=!1)}),window.addEventListener("drcat-app-mode-changed",()=>{wa()});let c=document.getElementById("legal-modal"),p=[document.getElementById("open-legal-modal-btn"),document.getElementById("open-legal-from-banner")],d=document.getElementById("close-legal-modal-btn"),f=document.getElementById("legal-consent-banner"),u=document.getElementById("accept-legal-btn"),m=document.getElementById("dismiss-legal-btn"),v=()=>{f&&(f.classList.add("hidden"),f.style.display="none")};P("drcat_legal_consent_v1")?v():f&&(f.style.display="flex",setTimeout(()=>f.classList.remove("hidden"),500)),u&&u.addEventListener("click",()=>{O("drcat_legal_consent_v1","true"),v()}),m&&m.addEventListener("click",()=>{O("drcat_legal_consent_v1","dismissed"),v()}),p.forEach(y=>{y&&y.addEventListener("click",x=>{x.preventDefault(),c&&(c.style.display="flex",c.classList.add("active"))})});let E=()=>{c&&(c.style.display="none",c.classList.remove("active"))};d&&d.addEventListener("click",E),c&&c.addEventListener("click",y=>{y.target===c&&E()}),window.addEventListener("keydown",y=>{let x=document.activeElement.tagName==="INPUT"||document.activeElement.tagName==="TEXTAREA";if(y.key.toLowerCase()==="s"&&!x){y.preventDefault();let C=document.getElementById("search-input");C&&(C.focus(),C.select())}if(y.key==="Escape"){let C=document.getElementById("add-cat-modal");if(C&&C.style.display!=="none"){C.style.display="none";let R=document.getElementById("add-cat-form");R&&R.reset()}let T=document.getElementById("legal-modal");T&&(T.classList.contains("active")||T.style.display!=="none")&&E()}if((y.key==="ArrowDown"||y.key==="ArrowUp")&&!x){y.preventDefault();let C=document.querySelector(".cat-item.active"),T=Array.from(document.querySelectorAll(".cat-item"));if(T.length===0)return;let R=0;if(C){let L=T.indexOf(C);y.key==="ArrowDown"?R=(L+1)%T.length:R=(L-1+T.length)%T.length}let h=T[R];h&&(h.click(),h.scrollIntoView({block:"nearest",behavior:se()?"auto":"smooth"}))}}),await Ua(),Ce(),ua(),import("./chunk-NLYQQBEF.js").then(y=>{y.sendHeartbeatPing&&(y.sendHeartbeatPing(),setInterval(()=>y.sendHeartbeatPing(),600*1e3),window.addEventListener("focus",()=>y.sendHeartbeatPing()))}).catch(()=>{})}document.readyState==="loading"?document.addEventListener("DOMContentLoaded",ha):ha();var xa=!1,Te=null,nn=!1;async function Ua(){let e=document.getElementById("app-loading-overlay"),t=document.getElementById("app-loading-bar");e&&e.classList.remove("hidden"),t&&(t.style.width="5%");let n=p=>{window.setLoaderProgress?window.setLoaderProgress(p):t&&(t.style.width=`${p}%`)};n(10);let i=Ze();console.log(`[Startup] Mode: ${i}`),n(20);try{l.isAdmin=await pn(),console.log("Admin mode:",l.isAdmin)}catch(p){console.warn("[Startup] Admin status check failed.",p),l.isAdmin=!1}wa(),n(40);let o=[];try{o=await tt(),window.perf&&window.perf.recordMilestone("catsFetched")}catch(p){console.error("[Startup Error] Fetch CATs failed, using emergency fallback.",p);try{let d=await fetch("data/cats_db.json",{headers:{"x-app-key":mt}});if(!d.ok)throw new Error("Emergency fallback failed");o=await d.json(),b("Chargement de secours local.","fa-triangle-exclamation",4e3)}catch(d){console.error("[Startup Critical] No data available.",d),b("Base de donn\xE9es indisponible.","fa-circle-exclamation",9e3),e&&e.classList.add("hidden");let f=window.Capacitor&&window.Capacitor.Plugins&&window.Capacitor.Plugins.SplashScreen;if(f&&typeof f.hide=="function")try{f.hide()}catch{}return}}n(60);let a=Q(),s={},r=[];try{s=F(P("dr_cat_local_overrides"),{}),r=F(P("dr_cat_custom_created_cats"),[]).map(d=>({...d,isOffline:!0}))}catch{}J&&(o=o.filter(p=>!s[p.id]||!s[p.id].deleted),o=[...o,...r.filter(p=>!s[p.id]||!s[p.id].deleted)]),l.allCats=Xe(o,a,s),n(75);try{Lt(l.allCats),He(l.allCats,V),ut(),Ye(V)}catch(p){console.error("[Startup Render Error]",p)}n(90);try{Bt()}catch(p){console.error("[Startup Navigation Error]",p)}setTimeout(()=>{Promise.all([fn().catch(p=>(console.warn("[Background] PDF fetch failed, using local list.",p),fetch("data/pdf_list.json").then(d=>d.json()).catch(()=>[]))),Cn().catch(p=>(console.warn("[Background] Index status failed.",p),{}))]).then(([p,d])=>{l.allPdfs=p,l.pdfIndexStatus=d,Ce(),l.activeCat&&Be(l.activeCat,!0),console.log("[Background] PDFs loaded.")}).catch(p=>console.error("[Background] PDF load failed:",p))},100),n(100),e&&e.classList.add("hidden");let c=window.Capacitor&&window.Capacitor.Plugins&&window.Capacitor.Plugins.SplashScreen;c&&typeof c.hide=="function"&&setTimeout(()=>{try{c.hide()}catch{}},350),kn(),fa({isModalOpen:()=>!!document.querySelector('.modal-overlay:not([style*="display: none"])'),closeModal:()=>{let p=document.querySelector('.modal-overlay:not([style*="display: none"])');p&&(p.id==="add-cat-modal"?closeAddCatModal():Pe(p))},isDrawerOpen:()=>{let p=document.querySelector(".sidebar");return!!p&&p.classList.contains("open")},closeDrawer:()=>{let p=document.querySelector(".sidebar");p&&p.classList.remove("open")},isDeepView:()=>{let p=document.getElementById("workspace"),d=document.getElementById("quiz-screen");return p&&p.style.display!=="none"||d&&d.style.display!=="none"},goToDashboard:()=>ue(V),confirmExit:()=>{if(window.__drCatExitArmed){let p=window.Capacitor&&window.Capacitor.Plugins&&window.Capacitor.Plugins.App;p&&typeof p.exitApp=="function"&&p.exitApp();return}window.__drCatExitArmed=!0,b("Appuyez encore sur Retour pour quitter.","fa-right-from-bracket",2e3),setTimeout(()=>{window.__drCatExitArmed=!1},2e3)}}),xa||(xa=!0,setTimeout(()=>{Ke(),Te=setInterval(Ke,3e4)},1e3)),ga({onPause:()=>{Te&&(clearInterval(Te),Te=null,nn=!0)},onResume:()=>{nn&&!Te&&(nn=!1,Ke(),Te=setInterval(Ke,3e4))}}),ma()}async function Ke(){if(!(!J||!cn())){console.log("[Background Sync] Checking for remote updates...");try{let e=ln(),t=!1;for(let i of e)try{let o=new AbortController,a=setTimeout(()=>o.abort(),5e3),s={...me(),...sn(i)},r=fe("/api/search-status",i);if(!(await fetch(r,{signal:o.signal,headers:s})).ok)throw new Error("Server returned error status");clearTimeout(a),t=!0;break}catch{}let n=Ze()===re.ANDROID_OFFLINE;if(t){console.log("[Background Sync] Server reachable! Fetching latest data..."),et(re.ANDROID_ONLINE),l.isOnlineAtStartup=!0;let i=P("dr_cat_last_sync_time"),o=i?parseInt(i):null,a=await tt(o),s=!1,r=null,c=[];try{c=F(P("dr_cat_custom_created_cats"),[])}catch{c=[]}let p=new Set(c.map(m=>m.id));if(a.activeIds){r=new Set(a.activeIds.split(",").map(v=>parseInt(v)));let m=(l.allCats||[]).filter(v=>!Je(v,p));for(let v of m)if(!r.has(v.id)){s=!0;break}}if(a.length===0&&!s){console.log("[Background Sync] Remote database is in sync. No action needed."),O("dr_cat_last_sync_time",Date.now().toString()),n&&b("\u{1F4E1} Connexion serveur \xE9tablie. Donn\xE9es synchronis\xE9es !","fa-cloud-arrow-up",4e3);return}let d=(l.allCats||[]).filter(m=>!Je(m,p)),f=a.length<d.length*.7,u=s;if(!u){if(f)for(let m of a){let v=d.find(E=>E.id===m.id);if(!v||v.title!==m.title||v.summary!==m.summary||v.ordonnance!==m.ordonnance){u=!0;break}}else if(u=d.length!==a.length,!u)for(let m of a){let v=d.find(E=>E.id===m.id);if(!v||v.title!==m.title||v.summary!==m.summary||v.ordonnance!==m.ordonnance){u=!0;break}}}if(u){console.log("[Background Sync] Server changes detected! Offering update...");let m=document.createElement("span");m.id="update-app-toast-btn",m.style.cssText="color:#06b6d4;font-weight:700;text-decoration:underline;cursor:pointer;",m.textContent="Actualiser ?",m.addEventListener("click",v=>{v.preventDefault(),Wa(a,f,r);let E=document.getElementById("drcat-toast");E&&E.remove(),b("Mise \xE0 jour appliqu\xE9e avec succ\xE8s !","fa-circle-check",3e3)}),b("Nouvelles fiches ou modifications disponibles \u2014","fa-arrows-rotate",15e3,m)}else console.log("[Background Sync] Remote database is in sync. No action needed."),O("dr_cat_last_sync_time",Date.now().toString());n&&b("\u{1F4E1} Connexion serveur \xE9tablie. Donn\xE9es synchronis\xE9es !","fa-cloud-arrow-up",4e3)}else console.log("[Background Sync] Server not reachable, staying offline."),et(re.ANDROID_OFFLINE),l.isOnlineAtStartup=!1}catch(e){console.warn("[Background Sync] Failed:",e.message)}}}function Wa(e,t,n){let i=Q(),o=F(P("dr_cat_local_overrides"),{});if(t){if(e.forEach(a=>{let s=l.allCats.findIndex(d=>d.id===a.id),r=i[a.id]||{},c=o[a.id]||{},p={...a,status:r.status||"todo",notes:r.notes||"",summary:c.customSummary||a.summary,customSummary:c.customSummary||a.summary,ordonnance:c.customOrdonnance||a.ordonnance,customOrdonnance:c.customOrdonnance||a.ordonnance};s!==-1?l.allCats[s]=p:l.allCats.push(p)}),n){let a=[];try{a=F(P("dr_cat_custom_created_cats"),[])}catch{a=[]}let s=new Set(a.map(r=>r.id));l.allCats=l.allCats.filter(r=>Je(r,s)?!0:n.has(r.id))}}else{let a=new Set(e.map(c=>c.id)),s=[];try{s=F(P("dr_cat_custom_created_cats"),[])}catch{s=[]}let r=s.filter(c=>!a.has(c.id)).map(c=>({...c,isOffline:!0}));l.allCats=Xe([...e,...r],i,o)}if(O("dr_cat_last_sync_time",Date.now().toString()),He(l.allCats,V),ut(),Ye(V),l.activeCat){let a=l.activeCat.id,s=l.allCats.find(r=>r.id===a);s?Be(s,!0):ue(V)}}function V(e,t){Be(e,!1,t||0)}function Ga(e){Pn(e),ut()}function Ya(e){He(e,V)}async function Qe(){let e=[];try{e=await tt()}catch(o){console.error("[Refresh Error] Fetch CATs failed, using emergency fallback.",o);try{let a=await fetch("data/cats_db.json",{headers:{"x-app-key":mt}});if(!a.ok)throw new Error("Emergency fallback failed");e=await a.json()}catch(a){console.error("[Refresh Critical] No data available.",a);return}}let t=Q(),n={},i=[];try{n=F(P("dr_cat_local_overrides"),{}),i=F(P("dr_cat_custom_created_cats"),[]).map(a=>({...a,isOffline:!0}))}catch{}if(J&&(e=e.filter(o=>!n[o.id]||!n[o.id].deleted),e=[...e,...i.filter(o=>!n[o.id]||!n[o.id].deleted)]),l.allCats=Xe(e,t,n),Lt(l.allCats),He(l.allCats,V),ut(),Ye(V),l.activeCat){let o=l.activeCat.id,a=l.allCats.find(s=>s.id===o);a?Be(a,!0):ue(V)}}async function Ka(){await Qe(),ue(V)}async function Qa(){await Qe(),ue(V)}async function Ja(){await Qe()}function ut(){let e=0,t=0,n=0;l.allCats.forEach(d=>{d.status==="done"?n++:d.status==="doing"?t++:e++});let i=document.getElementById("count-todo"),o=document.getElementById("count-doing"),a=document.getElementById("count-done"),s=document.getElementById("progress-percent"),r=document.getElementById("progress-fill");i&&(i.textContent=e),o&&(o.textContent=t),a&&(a.textContent=n);let c=l.allCats.length,p=c>0?Math.round(n/c*100):0;s&&(s.textContent=`${p}%`),r&&(r.style.width=`${p}%`)}function wa(){let e=document.getElementById("add-cat-btn"),t=document.getElementById("admin-login-btn"),n=Ze(),i=n===re.ADMIN_LOCAL,o=[re.WEB_CLIENT,re.ANDROID_ONLINE].includes(n);t&&(i?(t.style.display="flex",l.isAdmin?(t.innerHTML='<i class="fa-solid fa-lock-open"></i> D\xE9connexion Admin',t.style.backgroundColor="rgba(16, 185, 129, 0.15)",t.style.color="var(--color-success)"):(t.innerHTML='<i class="fa-solid fa-lock"></i> Connexion Admin',t.style.backgroundColor="var(--bg-card)",t.style.color="var(--text-primary)")):t.style.display="none"),e&&(i?(e.style.display="flex",e.innerHTML='<i class="fa-solid fa-plus"></i> CAT'):o?(e.style.display="flex",e.innerHTML='<i class="fa-solid fa-lightbulb"></i> Sugg\xE9rer CAT'):e.style.display="none");let a=document.getElementById("edit-summary-btn"),s=document.getElementById("edit-prescription-btn"),r=document.getElementById("delete-cat-btn");i&&l.isAdmin?(a&&(a.innerHTML='<i class="fa-solid fa-pen"></i> Modifier la fiche',a.style.display="inline-flex"),s&&(s.innerHTML='<i class="fa-solid fa-pen"></i>',s.title="Modifier l'ordonnance",s.setAttribute("aria-label","Modifier l'ordonnance"),s.style.display="inline-flex"),r&&(r.style.display=l.activeCat&&l.activeCat.id>55?"inline-flex":"none")):o?(a&&(a.innerHTML='<i class="fa-solid fa-pen-fancy"></i> Proposer modif.',a.style.display="inline-flex"),s&&(s.innerHTML='<i class="fa-solid fa-pen-fancy"></i>',s.title="Proposer une modification de l'ordonnance",s.setAttribute("aria-label","Proposer une modification de l'ordonnance"),s.style.display="inline-flex"),r&&(r.style.display="none")):(a&&(a.style.display="none"),s&&(s.style.display="none"),r&&(r.style.display="none"));let c=document.querySelector(".specialty-export-container");c&&(i&&l.isAdmin?c.style.display="flex":c.style.display="none");let p=document.getElementById("pdf-reindex-btn");p&&(p.style.display=i&&l.isAdmin?"inline-flex":"none")}export{ut as calculateStats,Ke as runBackgroundSync,wa as updateEditButtonsVisibility};
