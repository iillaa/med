import{$ as xe,A as mn,B as De,C as gn,D as yn,E as bn,F as Me,G as yt,H as vn,I as hn,J as xn,K as wn,L as bt,M as En,N as nt,O as Cn,P as Sn,Q as In,R as vt,S as y,T as he,U as Ln,V as w,W as at,X as kn,Y as Pe,Z as ht,_ as Re,a as D,aa as X,b as z,ba as An,c as te,ca as Tn,d as F,da as se,e as l,f as Q,g as _e,h as sn,i as ln,j as Je,k as Xe,l as J,m as re,n as Ze,o as et,p as cn,q as dn,r as fe,s as mt,t as me,u as gt,v as pn,w as un,x as fn,y as tt}from"./chunk-UGGWLN3R.js";function ka(){if(typeof window>"u")return{};let e=navigator.userAgent||"",t="Appareil inconnu";/Xiaomi/i.test(e)?t="Xiaomi":/Poco/i.test(e)||/2311DRK48G|22081212UG/i.test(e)?t="Xiaomi / Poco":/Redmi/i.test(e)?t="Redmi":/Samsung|SM-/i.test(e)?t="Samsung Galaxy":/Huawei|Honor/i.test(e)?t="Huawei / Honor":/Pixel/i.test(e)?t="Google Pixel":/iPhone/i.test(e)?t="Apple iPhone":/iPad/i.test(e)?t="Apple iPad":/Android/i.test(e)?t="Android Device":/Windows/i.test(e)?t="Windows PC":/Macintosh/i.test(e)?t="macOS":/Linux/i.test(e)&&(t="Linux");let n=window.matchMedia?.("(display-mode: standalone)")?.matches||window.navigator?.standalone,r=!!window.Capacitor?"Android APK":n?"PWA":"Web Browser";return{model:t,userAgent:e,appMode:r,screen:`${window.innerWidth}x${window.innerHeight} (dpr: ${window.devicePixelRatio||1})`,language:navigator.language||"fr-FR",online:!!navigator.onLine,connection:navigator.connection?.effectiveType||"unknown",memory:navigator.deviceMemory?`${navigator.deviceMemory} GB`:"unknown",timestamp:new Date().toISOString()}}function Aa(){if(typeof document>"u")return"1.15.2";let e=document.querySelector('meta[name="app-version"]');return e?e.getAttribute("content"):"1.15.2"}function Ta(){return D("dr_cat_install_id")||"unknown"}function Ba(e="",t=""){let n=String(e).trim().split(`
`)[0].replace(/:\d+:\d+/g,""),r=(String(t).split(`
`).find(o=>o.includes(".js")||o.includes("at "))||"").replace(/https?:\/\/[^\/]+\//g,"").replace(/:\d+:\d+/g,"").trim(),a=`${n}::${r}`.toLowerCase(),s=0;for(let o=0;o<a.length;o++)s=(s<<5)-s+a.charCodeAt(o),s|=0;return"fp_"+Math.abs(s).toString(36)}var Bn=new Set,xt=0,$n=Date.now(),$a=3;async function _n({error:e="Erreur inconnue",stack:t="",logs:n=[],type:i="unhandled_error",userNote:r="",force:a=!1}={}){let s=Date.now();s-$n>600*1e3&&(xt=0,$n=s);let o=Ba(e,t);if(!a&&Bn.has(o))return{success:!0,deduplicated:!0,message:"Erreur d\xE9j\xE0 signal\xE9e r\xE9cemment."};if(!a&&xt>=$a)return{success:!1,throttled:!0,message:"Limite de rapports atteinte pour cette session."};Bn.add(o),xt++;let c=ka(),p=Aa(),d=Ta(),f={type:i,fingerprint:o,error:String(e).slice(0,500),stack:String(t).slice(0,1500),logs:Array.isArray(n)?n.slice(-20):[],device:c,appVersion:p,installId:d,userNote:String(r).slice(0,500),timestamp:s},u=[];typeof window<"u"&&window.REMOTE_SERVER_URLS&&Array.isArray(window.REMOTE_SERVER_URLS)&&window.REMOTE_SERVER_URLS.forEach(b=>u.push(`${b.replace(/\/+$/,"")}/api/telemetry`)),u.push("/api/telemetry");let m=null;for(let b of u)try{let E=await fetch(b,{method:"POST",headers:{"Content-Type":"application/json","x-app-key":"drcat_pub_2f7a91c4e8","ngrok-skip-browser-warning":"true"},body:JSON.stringify(f)});if(E.ok)return{success:!0,id:(await E.json()).id,fingerprint:o,message:"Rapport envoy\xE9 avec succ\xE8s !"}}catch(E){m=E}return console.warn("[Telemetry] Remote transmission failed, offering email fallback:",m),{success:!1,fallbackToMail:!0,payload:f}}var ce=[],Pn=200,Oe=!1,le={};function we(e,t,n={}){let i=new Date().toLocaleTimeString("fr-FR",{hour12:!1}),r=t.map(a=>{if(a instanceof Error)return a.message+`
`+a.stack;if(typeof a=="object")try{return JSON.stringify(a)}catch{return String(a)}return String(a)}).join(" ");ce.push({timestamp:i,level:e,message:r,...n}),ce.length>Pn&&ce.shift(),Oe&&Ct()}var Dn=!1;function _a(e,t){we(e,t)}function wt(e,t="",n="runtime_error"){try{let i=String(e||"");if(i.includes("403")||i.includes("Forbidden")||i.includes("Unauthorized")||i.includes("Failed to load reports"))return;_n({error:e,stack:t,logs:ce,type:n}).catch(()=>{})}catch{}}function Da(){if(Dn)return;Dn=!0,le={log:console.log,warn:console.warn,error:console.error,info:console.info};let e={apply(t,n,i){let r=t===le.error?"ERROR":t===le.warn?"WARN":t===le.info?"INFO":"LOG";if(_a(r,i),r==="ERROR"){let a=i.find(c=>c instanceof Error),s=a?a.message:i.map(c=>typeof c=="object"?JSON.stringify(c):String(c)).join(" "),o=a&&a.stack?a.stack:"";wt(s,o,"console_error")}return Reflect.apply(t,n,i)}};console.log=new Proxy(le.log,e),console.warn=new Proxy(le.warn,e),console.error=new Proxy(le.error,e),console.info=new Proxy(le.info,e),window.addEventListener("error",t=>{let n=`${t.message} at ${t.filename}:${t.lineno}:${t.colno}`;we("ERROR",[n,t.error]),wt(t.message||n,t.error?.stack||n,"unhandled_error")}),window.addEventListener("unhandledrejection",t=>{let n=t.reason,i=n?.message||String(n);we("ERROR",[`Unhandled Promise Rejection: ${i}`]),wt(`Unhandled Rejection: ${i}`,n?.stack||String(n),"unhandled_rejection")}),window.addEventListener("drcat-fetch-event",t=>{let{url:n,method:i,status:r,duration:a,error:s}=t.detail;s?we("ERROR",[`${i} ${n} \u2192 FAILED (${a}ms): ${s}`],{network:{url:n,method:i,status:0,duration:a}}):we("NETWORK",[`${i} ${n} \u2192 ${r} (${a}ms)`],{network:{url:n,method:i,status:r,duration:a}})}),we("INFO",["\u{1F680} Debug Console initialized."])}function Et(e){return String(e||"").replace(/[&<>"']/g,t=>({"&":"&amp;","<":"&lt;",">":"&gt;",'"':"&quot;","'":"&#39;"})[t])}function Ct(){let e=document.getElementById("debug-console-content");if(e){if(ce.length===0){e.innerHTML='<div style="color: #64748b; padding: 20px; text-align: center;">Aucun log pour le moment.</div>';return}e.innerHTML=ce.map(t=>`<div class="log-row ${(t.level||"info").toLowerCase()}" style="padding: 4px 8px; font-family: monospace; font-size: 11px; line-height: 1.4; display: flex; gap: 8px;">
      <span class="log-time" style="white-space: nowrap;">[${Et(t.timestamp)}]</span>
      <span class="log-level" style="font-weight: bold; min-width: 50px;">${Et(t.level)}</span>
      <span class="log-message" style="word-break: break-all;">${Et(t.message)}</span>
    </div>`).join(""),setTimeout(()=>{e.scrollTop=e.scrollHeight},0)}}function Mn(){let e=document.getElementById("debug-console-panel");Oe=!Oe,e.style.display=Oe?"flex":"none",Oe&&Ct()}function Ma(){if(!document.getElementById("debug-console-styles")){let e=document.createElement("style");e.id="debug-console-styles",e.textContent=`
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
    `,document.head.appendChild(e)}if(!document.getElementById("debug-toggle-btn")){let e=document.createElement("div");e.id="debug-toggle-btn",e.innerHTML='\u{1F41B}<span class="badge" id="debug-badge"></span>';let t=D("drCatDebugConsoleVisible")==="true";e.style.display=t?"flex":"none",document.body.appendChild(e),e.addEventListener("click",()=>{Mn()})}if(!document.getElementById("debug-console-panel")){let e=document.createElement("div");e.id="debug-console-panel",e.innerHTML=`
      <div class="header">
        <h3>\u{1F41B} Debug Console <span style="font-size: 11px; color: #64748b; font-weight:400;">(${Pn} max)</span></h3>
        <div class="actions">
          <button id="debug-copy-btn">\u{1F4CB} Copier</button>
          <button id="debug-clear-btn">\u{1F5D1} Vider</button>
          <button class="close-btn" id="debug-close-btn">\u2715 Fermer</button>
        </div>
      </div>
      <div id="debug-console-content"></div>
    `,document.body.appendChild(e),e.style.display="none",document.getElementById("debug-close-btn")?.addEventListener("click",Mn),document.getElementById("debug-clear-btn")?.addEventListener("click",()=>{ce=[],Ct()}),document.getElementById("debug-copy-btn")?.addEventListener("click",()=>{let t=ce.map(n=>`[${n.timestamp}] [${n.level}] ${n.message}`).join(`
`);navigator.clipboard?.writeText(t).then(()=>{alert("Logs copi\xE9s dans le presse-papier !")}).catch(()=>{let n=document.createElement("textarea");n.value=t,document.body.appendChild(n),n.select(),document.execCommand("copy"),document.body.removeChild(n),alert("Logs copi\xE9s !")})})}}function Rn(){Da(),Ma();let e=0,t=null,n=10,i=2e3,r=()=>{if(e++,t&&clearTimeout(t),t=setTimeout(()=>{e=0},i),e>=n){e=0,clearTimeout(t);let s=document.getElementById("debug-toggle-btn");s&&(s.style.display==="flex"?(s.style.display="none",te("drCatDebugConsoleVisible"),y("\u{1F41B} Mode D\xE9bogage d\xE9sactiv\xE9.","fa-bug",3e3)):(s.style.setProperty("display","flex","important"),z("drCatDebugConsoleVisible","true"),y("\u{1F41B} Mode D\xE9bogage activ\xE9 !","fa-bug",5e3)))}},a=()=>{let s=document.getElementById("brand-logo"),o=document.getElementById("mobile-brand-logo");s&&(s.removeEventListener("click",r),s.addEventListener("click",r)),o&&(o.removeEventListener("click",r),o.addEventListener("click",r))};a(),setTimeout(a,500),console.log("\u{1F4F1} Dr.CAT Debug Console active.")}var j,it,ne,U,St;function Pa(e,t){let n=e.parentElement;if(!n)return;let i=document.createElement("div");i.className="ptr-indicator",i.innerHTML='<i class="fa-solid fa-arrows-rotate"></i>',n.insertBefore(i,e);let r=64,a=0,s=!1,o=!1,c=null,p=0,d=m=>{o||n.scrollTop>0||(a=m.touches?m.touches[0].clientY:m.clientY,s=!0,p=0)},f=m=>{if(!s||o)return;let E=(m.touches?m.touches[0].clientY:m.clientY)-a;if(E<=0){p=0,n.style.transform="",i.classList.remove("visible");return}if(n.scrollTop>0){s=!1;return}m.cancelable&&m.preventDefault(),p=Math.min(E*.5,r+24),!se()&&(c||(c=requestAnimationFrame(()=>{n.style.transform=`translateY(${p}px)`,i.classList.add("visible"),i.style.opacity=String(Math.min(p/r,1)),c=null})))},u=async()=>{if(c&&(cancelAnimationFrame(c),c=null),!s||o){s=!1;return}s=!1;let m=p;if(p=0,n.style.transform="",i.style.opacity="",i.classList.remove("visible"),m>=r){o=!0,i.classList.add("spinning");try{await t()}finally{i.classList.remove("spinning"),o=!1}}};n.addEventListener("touchstart",d,{passive:!0}),n.addEventListener("touchmove",f,{passive:!1}),n.addEventListener("touchend",u),n.addEventListener("mousedown",d),n.addEventListener("mousemove",f),window.addEventListener("mouseup",u)}function Lt(e){switch(e){case"done":return"Ma\xEEtris\xE9";case"doing":return"En cours";default:return"\xC0 faire"}}function On(e,t,n){j=document.getElementById("cat-list"),it=document.getElementById("search-input"),ne=document.getElementById("category-filter"),U=document.getElementById("sidebar"),St=document.getElementById("sidebar-overlay");let i=document.getElementById("open-sidebar-btn"),r=document.getElementById("close-sidebar-btn");j&&j.addEventListener("click",E=>{let v=E.target.closest(".cat-item");if(!v)return;let x=parseInt(v.getAttribute("data-id"),10);if(isNaN(x))return;let C=l.allCats.find(B=>B.id===x);if(C){let B=parseInt(v.getAttribute("data-matched-subcat")||"0",10);e(C,B),window.innerWidth<=850&&U&&U.classList.remove("open")}}),it&&it.addEventListener("input",Tn(()=>It(t),150)),ne&&ne.addEventListener("change",()=>It(t));let a=document.querySelectorAll(".status-pill");a.forEach(E=>{E.addEventListener("click",()=>{a.forEach(v=>v.classList.remove("active")),E.classList.add("active"),l.activeStatusFilter=E.getAttribute("data-filter"),It(t)})}),i&&i.addEventListener("click",()=>{U.classList.add("open")}),r&&r.addEventListener("click",()=>{U.classList.remove("open")});let s=document.getElementById("sidebar-tab-cats"),o=document.getElementById("sidebar-tab-pdfs"),c=document.getElementById("sidebar-tab-quiz");function p(E){[s,o,c].forEach(v=>{v&&v.classList.remove("active")}),E&&E.classList.add("active")}s&&s.addEventListener("click",()=>{if(p(s),l.activeCat)e(l.activeCat);else{let E=document.getElementById("brand-logo");E&&E.click()}window.innerWidth<=850&&U&&U.classList.remove("open")}),o&&o.addEventListener("click",()=>{p(o),window.openStandaloneLibrary&&window.openStandaloneLibrary(),window.innerWidth<=850&&U&&U.classList.remove("open")}),c&&c.addEventListener("click",()=>{p(c);let E=document.getElementById("start-quiz-nav-btn");E&&E.click(),window.innerWidth<=850&&U&&U.classList.remove("open")});let d=document.getElementById("controls-toggle-btn"),f=document.getElementById("controls-panel"),u=document.getElementById("controls-toggle-icon");D("sidebar_controls_collapsed")==="true"&&f&&(f.classList.add("collapsed"),u&&u.classList.add("rotated")),d&&f&&d.addEventListener("click",()=>{let E=f.classList.toggle("collapsed");u&&u.classList.toggle("rotated",E),z("sidebar_controls_collapsed",E)}),U&&kn(U),St&&U&&St.addEventListener("click",()=>{U.classList.remove("open")});let b=document.getElementById("apk-download-btn");b&&(!!window.Capacitor||window.Capacitor&&window.Capacitor.isNativePlatform&&window.Capacitor.isNativePlatform()||navigator.userAgent&&navigator.userAgent.toLowerCase().includes("capacitor")?b.style.display="none":b.style.display="inline-flex"),j&&n&&Pa(j,n)}function kt(e){if(ne||(ne=document.getElementById("category-filter")),!ne)return;let t=new Set(e.map(n=>n.category));ne.innerHTML='<option value="all">Toutes les sp\xE9cialit\xE9s</option>',t.forEach(n=>{let i=document.createElement("option");i.value=n,i.textContent=n,ne.appendChild(i)})}var ze=new Map;function Ra(e){let t=document.createElement("li"),n=!!e.parent_id;t.className=`cat-item ${n?"cat-item-subcat":""}`,t.setAttribute("data-id",e.id);let i="";n&&(i='<span class="badge" style="font-size:9.5px; padding:1px 5px; background:rgba(168,85,247,0.15); color:#c084fc; border:1px solid rgba(168,85,247,0.3);"><i class="fa-solid fa-code-branch"></i> Sous-fiche</span>');let r="";if(e._matchedSubCatIdx>=0&&Array.isArray(e.sub_cats)&&e.sub_cats[e._matchedSubCatIdx]){let a=e.sub_cats[e._matchedSubCatIdx].label||`Sous-fiche ${e._matchedSubCatIdx+1}`,s=a.length>35?a.substring(0,32)+"\u2026":a;r=`<div class="cat-item-subcat-match" style="font-size:9.5px; padding:2px 6px; margin-top:2px; border-radius:6px; background:rgba(168,85,247,0.12); color:#c084fc; border:1px solid rgba(168,85,247,0.25); white-space:nowrap; overflow:hidden; text-overflow:ellipsis; max-width:100%;"><i class="fa-solid fa-arrow-turn-down" style="margin-right:3px;"></i> ${w(s)}</div>`,t.setAttribute("data-matched-subcat",String(e._matchedSubCatIdx+1))}else t.setAttribute("data-matched-subcat","0");return t.innerHTML=`
    <div class="cat-indicator ${e.status}"></div>
    <div class="cat-item-content">
      <span class="cat-item-title">${e.id}. ${w(e.title)}</span>
      <div class="cat-item-meta">
        <span class="cat-item-cat">${w(e.category)}</span>
        ${i}
        <span class="cat-item-status">${Lt(e.status)}</span>
      </div>
      ${r}
    </div>
  `,t}function Oa(e,t){let n=!!t.parent_id;e.className=`cat-item ${n?"cat-item-subcat":""} ${l.activeCat&&l.activeCat.id===t.id?"active":""}`,e.setAttribute("data-id",t.id);let i=e.querySelector(".cat-item-title");i&&(i.textContent=`${t.id}. ${t.title}`);let r=e.querySelector(".cat-item-cat");r&&(r.textContent=t.category);let a=e.querySelector(".cat-item-status");a&&(a.textContent=Lt(t.status));let s=e.querySelector(".cat-indicator");s&&(s.className=`cat-indicator ${t.status}`);let o=e.querySelector(".cat-item-subcat-match");if(t._matchedSubCatIdx>=0&&Array.isArray(t.sub_cats)&&t.sub_cats[t._matchedSubCatIdx]){let c=t.sub_cats[t._matchedSubCatIdx].label||`Sous-fiche ${t._matchedSubCatIdx+1}`,p=c.length>35?c.substring(0,32)+"\u2026":c;if(e.setAttribute("data-matched-subcat",String(t._matchedSubCatIdx+1)),o)o.innerHTML=`<i class="fa-solid fa-arrow-turn-down" style="margin-right:3px;"></i> ${w(p)}`;else{let d=e.querySelector(".cat-item-content");if(d){let f=document.createElement("div");f.className="cat-item-subcat-match",f.style.cssText="font-size:9.5px; padding:2px 6px; margin-top:2px; border-radius:6px; background:rgba(168,85,247,0.12); color:#c084fc; border:1px solid rgba(168,85,247,0.25); white-space:nowrap; overflow:hidden; text-overflow:ellipsis; max-width:100%;",f.innerHTML=`<i class="fa-solid fa-arrow-turn-down" style="margin-right:3px;"></i> ${w(p)}`,d.appendChild(f)}}}else e.setAttribute("data-matched-subcat","0"),o&&o.remove()}function za(e){if(!e||!e.isConnected)return;if(se()){e.remove();return}e.classList.add("cat-item-exit");let t=!1,n=()=>{t||(t=!0,e.remove())};e.addEventListener("animationend",n,{once:!0}),setTimeout(n,250)}function Ne(e,t){if(window.perf&&window.perf.startMeasure("sidebar.renderCatList"),j||(j=document.getElementById("cat-list")),!j)return;if(j.querySelectorAll(".cat-item-skeleton").forEach(o=>o.remove()),e.length===0){ze.clear();let o=!l.allCats||l.allCats.length===0;if(j.innerHTML=`
      <li class="empty-state">
        <div style="text-align: center; padding: 32px 16px; color: var(--text-muted);">
          <i class="fa-solid ${o?"fa-folder-open":"fa-filter-circle-xmark"}" style="font-size: 28px; margin-bottom: 10px; display: block; opacity: 0.6;"></i>
          <span style="font-size: 13px; line-height: 1.5;">${o?"Aucune fiche disponible pour le moment.":"Aucune fiche ne correspond \xE0 vos filtres actuels."}</span>
          ${o?'<button id="sidebar-retry-btn" class="btn-secondary" style="margin-top: 12px; padding: 6px 14px; border-radius: 8px; cursor: pointer; font-size: 12px;">Recharger</button>':""}
        </div>
      </li>`,o){let c=j.querySelector("#sidebar-retry-btn");c&&c.addEventListener("click",()=>location.reload())}window.perf&&(window.perf.endMeasure("sidebar.renderCatList"),window.perf.recordMilestone("sidebarRendered"));return}let n=new Set(e.map(o=>o.id));for(let[o,c]of ze)n.has(o)||(ze.delete(o),za(c));let i=document.createDocumentFragment(),r=!1,a=0,s=null;e.forEach(o=>{let c=ze.get(o.id);c?Oa(c,o):(c=Ra(o),ze.set(o.id,c),i.appendChild(c),r=!0,se()||(c.classList.add("cat-item-enter"),c.style.animationDelay=`${Math.min(a,8)*30}ms`,c.addEventListener("animationend",()=>{c.classList.remove("cat-item-enter"),c.style.animationDelay=""},{once:!0}),a++)),s?c!==s.nextSibling&&j.insertBefore(c,s.nextSibling):c!==j.firstChild&&j.insertBefore(c,j.firstChild),s=c}),r&&j.appendChild(i),window.perf&&(window.perf.endMeasure("sidebar.renderCatList"),window.perf.recordMilestone("sidebarRendered"))}function zn(e){let t=document.querySelector(`.cat-item[data-id="${e.id}"]`);if(!t)return;let n=t.querySelector(".cat-indicator"),i=t.querySelector(".cat-item-meta span:last-child");n&&(n.className=`cat-indicator ${e.status}`),i&&(i.textContent=Lt(e.status))}function q(e){return e?String(e).normalize("NFD").replace(/[\u0300-\u036f]/g,"").toLowerCase().replace(/[`'’"“”«»\-–—_:;,?.!/\\()[\]{}*+]/g," ").replace(/\s+/g," ").trim():""}function It(e){let t=q(it.value),n=ne.value,i=t?t.split(/\s+/).filter(Boolean):[],r=l.allCats.filter(a=>{if(!a)return!1;if(!a._searchTokenStr){let p=q(a.title),d=q(a.summary||a.customSummary),f=q(a.ordonnance||a.customOrdonnance),u=q(a.red_flags),m=q(a.category),b=q(a.notes),E=Array.isArray(a.pdf_keywords)?a.pdf_keywords.filter(C=>C&&typeof C=="string").map(C=>q(C)).join(" "):q(a.pdf_keywords),v=Array.isArray(a.sub_cats)?a.sub_cats.map(C=>`${q(C.label)} ${q(C.summary)} ${q(C.ordonnance)}`).join(" "):"",x=a.id!==void 0&&a.id!==null?String(a.id):"";a._searchTokenStr=`${x} ${p} ${m} ${d} ${f} ${u} ${E} ${b} ${v}`}let s=i.length===0||i.every(p=>a._searchTokenStr.includes(p));if(a._matchedSubCatIdx=-1,s&&i.length>0&&Array.isArray(a.sub_cats)&&a.sub_cats.length>0){let p=`${q(a.title)} ${q(a.category)}`;if(!i.every(f=>p.includes(f)))for(let f=0;f<a.sub_cats.length;f++){let u=a.sub_cats[f],m=`${q(u.label)} ${q(u.summary)} ${q(u.ordonnance)} ${q(u.red_flags)}`;if(i.every(b=>m.includes(b))){a._matchedSubCatIdx=f;break}}}let o=n==="all"||a.category===n,c=!0;if(l.activeStatusFilter==="todo")c=a.status==="todo";else if(l.activeStatusFilter==="doing")c=a.status==="doing";else if(l.activeStatusFilter==="done")c=a.status==="done";else if(l.activeStatusFilter==="redflags"){let p=(a.red_flags||"").toLowerCase();c=p.length>0&&!p.includes("aucun signe de gravit\xE9")&&!p.includes("aucun")}return s&&o&&c});e&&e(r)}function Nn(e){let t=new Date().toLocaleDateString("fr-FR"),n=["===========================================","\u{1FA7A} Dr.CAT \u2014 Aide \xE0 la D\xE9cision M\xE9dicale Clinique","\u{1F468}\u200D\u2695\uFE0F Dr. Kibeche Ali","===========================================",`
\u{1F4CB} FICHE N\xB0 ${e.id} : ${e.title.toUpperCase()}`,`\u{1F4C2} Sp\xE9cialit\xE9 : ${e.category}`,`\u{1F4C5} Date : ${t}`,"-------------------------------------------"];e.red_flags&&e.red_flags.trim()&&(n.push(`
\u{1F6A8} SIGNES DE GRAVIT\xC9 (RED FLAGS) :`),n.push(e.red_flags.trim()));let i=e.customSummary||e.summary;i&&i.trim()&&(n.push(`
\u{1F4D1} CONDUITE \xC0 TENIR PRINCIPALE :`),n.push(i.trim()));let r=e.customOrdonnance||e.ordonnance;return r&&r.trim()&&(n.push(`
\u{1F48A} ORDONNANCE TYPE & POSOLOGIES :`),n.push(r.trim())),Array.isArray(e.sub_cats)&&e.sub_cats.length>0&&(n.push(`
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
`)}function Ee(e,t,n){let i=document.getElementById("summary-view");if(!i)return;let r=e||t?.summary||t?.synthese||"",a="";if(l.activeSubCatIndex>0&&n&&(a=`
      <div class="subcat-intext-return-banner">
        <span class="subcat-intext-return-label">
          <i class="fa-solid fa-code-branch"></i> Sous-Fiche : <strong>${w(n)}</strong>
        </span>
        <button type="button" class="subcat-intext-return-btn" onclick="window.switchToSubProfile(0)">
          <i class="fa-solid fa-arrow-left"></i> Revenir \xE0 la fiche principale
        </button>
      </div>
    `),i.innerHTML=a+at(r),l.isAdmin&&t&&t.history&&t.history.length>0){let s='<div class="cat-history-section" style="margin-top:20px; border-top:1px dashed var(--border-color); padding-top:14px; pointer-events:none;">';s+='<h4 style="font-size:11.5px; color:var(--text-secondary); margin-bottom:8px; display:flex; align-items:center; gap:6px;"><i class="fa-solid fa-clock-rotate-left"></i> Historique des versions</h4>',s+='<ul style="list-style:none; padding:0; margin:0; font-size:11px; color:var(--text-muted); display:flex; flex-direction:column; gap:4px;">',t.history.slice(-10).reverse().forEach(c=>{let p=new Date(c.timestamp).toLocaleDateString("fr-FR",{day:"2-digit",month:"2-digit",year:"numeric",hour:"2-digit",minute:"2-digit"});s+=`<li><span style="font-weight:600; color:var(--text-secondary);">${p}</span> \u2014 ${w(c.detail||c.action)}</li>`}),s+="</ul></div>",i.innerHTML+=s}}var Fn="dr_cat_ordonnance_mode";function Ha(){try{return localStorage.getItem(Fn)||"detailed"}catch{return"detailed"}}function Hn(e){try{localStorage.setItem(Fn,e)}catch{}}function qa(e){if(!e||typeof e!="string")return"Pas d'ordonnance type r\xE9dig\xE9e.";let t=e.split(`
`),n=[],i="",r=null,a=[];for(let o=0;o<t.length;o++){let c=t[o].trim();if(c){if(/\b1[èe]re\s+INTENTION\b/i.test(c)){i="1ere";continue}else if(/\bALTERNATIVES?\s*\[OU\]/i.test(c)||/\b2[èe]me\s+INTENTION\b/i.test(c)){i="alternatives";continue}else if(/\bTRAITEMENT\s+NON\s+M[ÉE]DICAMENTEUX\b/i.test(c)||/\bRHD\b/i.test(c)){i="rhd";continue}else if(/\bTRAITEMENT\s+SYMPTOMATIQUE\b/i.test(c)||/\bADJUVANT\b/i.test(c)){i="adjuvant";continue}if(i==="1ere"||i==="adjuvant"){let p=c.startsWith("-")||c.startsWith("*")||c.startsWith("\u2022"),d=c.replace(/^[-*•]\s*/,"").trim();if(/^[⚠️ℹ️💡]/.test(d)||/^Vérifier\s+impérativement/i.test(d)||/^Rappels?\b/i.test(d))continue;if(p&&(d.includes("(")||d.includes(":")||d.includes("mg")||d.includes("g/"))){r&&n.push({drug:r,posology:a.join(" ").trim()});let f=d.split(":");if(r=f[0].replace(/\*\*/g,"").trim(),a=[],f.length>1&&f[1].trim()){let u=f[1].replace(/\*\*/g,"").replace(/^[⚠️ℹ️💡].*$/,"").trim();u&&a.push(u)}}else if(r&&(c.startsWith("*")||c.startsWith("-")||c.startsWith("\u2022")||c.startsWith("\u2514"))){let f=c.replace(/^[-*•└─]\s*/,"").replace(/\*\*/g,"").trim();!/^[⚠️ℹ️💡]/.test(f)&&!/^Vérifier/i.test(f)&&a.push(f)}else!r&&p&&d.length>5&&n.push({drug:d.replace(/\*\*/g,""),posology:""})}}}if(r&&n.push({drug:r,posology:a.join(" ").trim()}),n.length===0)return e.replace(/\*\*(.*?)\*\*/g,"$1").replace(/^[#-]\s*/gm,"").trim();let s="";return n.forEach((o,c)=>{let p=o.posology.match(/pendant\s+(\d+\s*(?:jours?|semaines?|mois))/i)||o.drug.match(/pendant\s+(\d+\s*(?:jours?|semaines?|mois))/i),d=p?p[1]:"",f=d?` \u2500\u2500\u2500\u2500\u2500\u2500 QSP ${d}`:"",u=o.drug.replace(/:\s*$/,"").trim();if(s+=`${c+1}. ${u}${f}
`,o.posology){let m=o.posology.replace(/\s*\*+\s*/g," ").replace(/\s+/g," ").trim();s+=`   Posologie : ${m}

`}else s+=`
`}),s.trim()}function Fa(e){return!e||typeof e!="string"?"Pas d'ordonnance type r\xE9dig\xE9e.":e}var qn=!1;function At(){if(qn)return;let e=document.getElementById("ordo-mode-detailed"),t=document.getElementById("ordo-mode-express");e&&t&&(e.addEventListener("click",()=>{Hn("detailed"),ae()}),t.addEventListener("click",()=>{Hn("express"),ae()}),qn=!0)}function ae(e,t){let n=document.getElementById("workspace-prescription"),i=document.getElementById("prescription-variants-selector"),r=document.getElementById("stamp-code"),a=document.getElementById("ordo-mode-detailed"),s=document.getElementById("ordo-mode-express");At();let o=t||l.activeCat;if(r){let f=o&&o.id!==void 0?String(o.id).padStart(2,"0"):"01",u=new Date().getFullYear();r.textContent=`N\xB0 ${f}/CAT-${u}`}if(!n)return;let c=e||o?.ordonnance||o?.prescription||"";if(!c){n.textContent="Pas d'ordonnance type r\xE9dig\xE9e.",i&&(i.style.display="none"),l.prescriptionVariants=[];return}l.prescriptionVariants=Ln(c);let p=c;if(l.prescriptionVariants.length>1){i&&(i.style.display="flex",i.innerHTML="",l.activePrescriptionVariantIndex>=l.prescriptionVariants.length&&(l.activePrescriptionVariantIndex=0),l.prescriptionVariants.forEach((u,m)=>{let b=document.createElement("button");b.className=`status-pill ${m===l.activePrescriptionVariantIndex?"active":""}`,b.style.fontSize="12px",b.style.padding="5px 12px",b.textContent=u.title,b.addEventListener("click",()=>{l.activePrescriptionVariantIndex=m,i.querySelectorAll(".status-pill").forEach((E,v)=>{v===m?E.classList.add("active"):E.classList.remove("active")}),ae()}),i.appendChild(b)}));let f=l.prescriptionVariants[l.activePrescriptionVariantIndex]||l.prescriptionVariants[0];p=f?f.content:c}else i&&(i.style.display="none");let d=Ha();a&&s&&(d==="express"?(s.classList.add("active"),a.classList.remove("active")):(a.classList.add("active"),s.classList.remove("active"))),d==="express"?n.textContent=qa(p):n.textContent=Fa(p)}function de(){let e=document.getElementById("library-screen"),t=document.getElementById("quiz-screen"),n=document.getElementById("workspace"),i="dashboard";e&&e.style.display!=="none"?i="library":t&&t.style.display!=="none"?i="quiz":n&&n.style.display!=="none"&&l.activeCat&&(i="workspace");let r=document.querySelector(".tab-btn.active"),a=r?r.getAttribute("data-tab"):null,s=document.getElementById("pdf-content-search-input"),o=document.getElementById("pdf-search-results-container"),c=document.getElementById("lib-deep-search-input"),p=document.getElementById("lib-filter-input"),d=document.getElementById("lib-search-results-container"),f=document.getElementById("lib-search-results-card"),u=document.getElementById("omni-search-input"),m=document.getElementById("omni-search-results"),b={currentView:i,scrollY:window.scrollY||document.documentElement.scrollTop||0,activeCatId:l.activeCat?l.activeCat.id:null,activeSubCatIndex:typeof l.activeSubCatIndex=="number"?l.activeSubCatIndex:0,activeTab:a,activePrescriptionVariantIndex:l.activePrescriptionVariantIndex||0,pdfSearchQuery:s?s.value:"",pdfSearchResultsHTML:o?o.innerHTML:"",libSearchQuery:c?c.value:"",libFilterQuery:p?p.value:"",libSearchResultsHTML:d?d.innerHTML:"",libResultsVisible:f?f.style.display!=="none":!1,omniQuery:u?u.value:"",omniVisible:m?m.style.display!=="none":!1};z("dr_cat_navigation_state",JSON.stringify(b))}function Bt(){let e=D("dr_cat_navigation_state");if(e)try{let t=F(e,{});if(te("dr_cat_navigation_state"),t.currentView==="library"){if(typeof window.openStandaloneLibrary=="function"&&window.openStandaloneLibrary(t.libSearchQuery||""),t.libFilterQuery){let n=document.getElementById("lib-filter-input");n&&(n.value=t.libFilterQuery,n.dispatchEvent(new Event("input",{bubbles:!0})))}if(t.libSearchResultsHTML&&t.libSearchResultsHTML.trim().length>0){let n=document.getElementById("lib-search-results-container"),i=document.getElementById("lib-search-results-card");n&&(n.innerHTML=t.libSearchResultsHTML,i&&t.libResultsVisible&&(i.style.display="block"),n.querySelectorAll(".pdf-search-result-card, [data-pdf]").forEach(r=>{r.addEventListener("click",()=>{de();let a=decodeURIComponent(r.getAttribute("data-pdf")||""),s=r.getAttribute("data-page")||"1";a&&(window.location.href=`pdf_viewer.html?file=${encodeURIComponent(a)}&page=${s}`)})}))}typeof t.scrollY=="number"&&t.scrollY>0&&setTimeout(()=>window.scrollTo({top:t.scrollY,behavior:"instant"}),60);return}if(t.activeCatId){let n=document.querySelector(`.cat-item[data-id="${t.activeCatId}"]`);if(n&&n.click(),typeof t.activeSubCatIndex=="number"&&t.activeSubCatIndex>0&&setTimeout(()=>{let i=document.querySelector(`.subcat-pill[data-sub-index="${t.activeSubCatIndex}"]`);i&&i.click()},40),t.activeTab&&t.activeTab!=="tab-summary"&&setTimeout(()=>{let i=document.querySelector(`.tab-btn[data-tab="${t.activeTab}"]`);i&&i.click()},60),t.pdfSearchQuery){let i=document.getElementById("pdf-content-search-input");i&&(i.value=t.pdfSearchQuery)}if(t.pdfSearchResultsHTML){let i=document.getElementById("pdf-search-results-container");i&&(i.innerHTML=t.pdfSearchResultsHTML,i.querySelectorAll(".pdf-search-result-card").forEach(r=>{r.addEventListener("click",()=>{de();let a=decodeURIComponent(r.getAttribute("data-pdf")),s=r.getAttribute("data-page");window.location.href=`pdf_viewer.html?file=${encodeURIComponent(a)}&page=${s}`})}))}typeof t.scrollY=="number"&&t.scrollY>0&&setTimeout(()=>window.scrollTo({top:t.scrollY,behavior:"instant"}),90);return}if(t.currentView==="quiz"){let n=document.getElementById("start-quiz-nav-btn");n&&n.click()}}catch(t){console.error("Failed to restore app navigation state:",t)}}function Tt(e){if(!e)return"";let t=w(e);if(t.includes("|")){let a=t.split(`
`),s=!1,o='<table class="print-table">',c=!0;for(let p=0;p<a.length;p++){let d=a[p].trim();if(d.startsWith("|")&&d.endsWith("|")){if(s||(s=!0,c=!0),d.includes("---"))continue;let f=d.split("|").slice(1,-1).map(m=>m.trim()),u=c?"th":"td";o+="<tr>"+f.map(m=>`<${u}>${m}</${u}>`).join("")+"</tr>",c=!1}else s&&(s=!1,o+="</table>",a[p]=o+`
`+a[p],o='<table class="print-table">')}s&&(o+="</table>",a.push(o)),t=a.filter(p=>!(p.trim().startsWith("|")&&p.trim().endsWith("|"))).join(`
`)}t=t.replace(/\*\*([^*\n]+)\*\*/g,"<strong>$1</strong>"),t=t.replace(/\[(.*?)\]\(subcat:[0-9]+\)/g,'<span class="inline-sub-tag">\u21B3 $1</span>'),t=t.replace(/\[\[subcat:[0-9]+:(.*?)\]\]/g,'<span class="inline-sub-tag">\u21B3 $1</span>');let n=t.split(`
`),i=!1,r=[];for(let a=0;a<n.length;a++){let s=n[a].trim();if(!s){i&&(i=!1,r.push("</ul>"));continue}if(s.startsWith("<table")||s.startsWith("</table")||s.startsWith("<tr>")){i&&(i=!1,r.push("</ul>")),r.push(s);continue}s.startsWith("- ")||s.startsWith("\u2022 ")||s.startsWith("* ")?(i||(i=!0,r.push("<ul>")),r.push("<li>"+s.replace(/^[-•*]\s*/,"")+"</li>")):(i&&(i=!1,r.push("</ul>")),r.push("<p>"+s+"</p>"))}return i&&r.push("</ul>"),r.join("")}function jn(e){if(!e)return"";let t=/(?:^|\n)(?:\*\*|#{2,4}\s*)([0-9]+(?:bis|ter)?\.\s*[^\n]+)(?:\n|$)/gi,n=[...e.matchAll(t)];if(n.length<2)return Tt(e);let i=[],r=0;for(let a=0;a<n.length;a++){let s=n[a],o=s[1].trim().replace(/^\*\*|\*\*$/g,"").replace(/:\s*$/,"").replace(/\*\*$/,"").trim(),c=s.index;if(a===0&&c>0){let p=e.substring(0,c).trim();p&&i.push({header:null,content:p})}a>0&&(i[i.length-1].content=e.substring(r,c).trim()),i.push({header:o,content:""}),r=c+s[0].length}return i.length>0&&(i[i.length-1].content=e.substring(r).trim()),i.map(a=>{if(!a.header)return`<div class="step-intro">${Tt(a.content)}</div>`;let s=a.header.charAt(0);return`
      <div class="step-block">
        <div class="step-title step-title-${["0","1","2","3","4"].includes(s)?s:"1"}">${w(a.header)}</div>
        <div class="step-body">${Tt(a.content)}</div>
      </div>
    `}).join("")}function Vn(e){if(!e)return;let t=new Date().toLocaleDateString("fr-FR"),n=`${e.id}. ${e.title}`,i=e.category||"M\xE9decine G\xE9n\xE9rale",r=e.red_flags||"",a=e.customSummary||e.summary||"",s=jn(a),o=e.customOrdonnance||e.ordonnance||"",c=Array.isArray(e.sub_cats)?e.sub_cats:[],p=e.notes||"",d="";c.length>0&&(d=`
      <div class="subcats-section">
        <div class="subcats-header">\u{1F500} PROFILS PARTICULIERS & SOUS-FICHES (${c.length})</div>
        <div class="subcat-grid">
          ${c.map((b,E)=>`
            <div class="subcat-card">
              <div class="subcat-card-title"><span class="subcat-badge">${E+1}</span> ${w(b.label||"Profil Sp\xE9cialis\xE9")}</div>
              ${b.red_flags&&b.red_flags.trim()&&b.red_flags!==r?`
                <div class="subcat-rf"><strong>\u{1F6A8} Alerte :</strong> ${w(b.red_flags)}</div>
              `:""}
              <div class="subcat-body">
                ${jn(b.summary||"")}
              </div>
              ${b.ordonnance&&b.ordonnance.trim()?`
                <div class="subcat-rx-box">
                  <span class="subcat-rx-tag">\u{1F48A} Rx :</span>
                  <pre class="subcat-rx-text">${w(b.ordonnance)}</pre>
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

  ${r&&r.trim()?`
    <div class="rf-banner">
      <span class="rf-label">\u{1F6A8} RED FLAGS :</span>${w(r)}
    </div>
  `:""}

  <div class="summary-section">
    ${s}
  </div>

  ${o&&o.trim()?`
    <div class="rx-card">
      <div class="rx-header">\u{1F48A} ORDONNANCE TYPE & POSOLOGIES RECOMMAND\xC9ES :</div>
      <pre class="rx-body">${w(o)}</pre>
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
</html>`,u=document.createElement("iframe");u.style.position="fixed",u.style.right="0",u.style.bottom="0",u.style.width="0",u.style.height="0",u.style.border="none",u.style.opacity="0",u.style.pointerEvents="none",document.body.appendChild(u);let m=u.contentWindow.document;m.open(),m.write(f),m.close(),setTimeout(()=>{try{u.contentWindow.focus(),u.contentWindow.print()}catch(b){console.error("Iframe print failed:",b),window.print()}finally{setTimeout(()=>{u&&u.parentNode&&u.parentNode.removeChild(u)},3e3)}},250)}function ot(e,t=!1){if(!e||typeof e!="string")return document.createElement("div");let n=he(e),i=document.createElement("a"),r=String(e),a=r.toLowerCase().endsWith(".docx");i.href=a?`pdfs/${encodeURIComponent(r)}`:`pdf_viewer.html?file=${encodeURIComponent(r)}&page=1`,a&&(i.target="_blank"),i.className="pdf-card";let s=a?"fa-regular fa-file-word text-primary":t?"fa-solid fa-book-open-reader":"fa-solid fa-file-pdf",o=l.pdfIndexStatus&&l.pdfIndexStatus[r]||{status:"red",pagesWithText:0,totalPages:0},c=a?"#ef4444":o.status==="green"?"#10b981":o.status==="orange"?"#f59e0b":"#ef4444",p=a?"Document Word (Non indexable, convertissez en PDF pour la recherche)":o.status==="green"?`Indexation compl\xE8te (${o.pagesWithText}/${o.totalPages} pages index\xE9es)`:o.status==="orange"?`Indexation partielle (${o.pagesWithText}/${o.totalPages} pages index\xE9es)`:`Non indexable (0/${o.totalPages} pages, PDF scann\xE9 sans texte)`;i.innerHTML=`
    <i class="${s}" style="${t&&!a?"color: var(--color-success);":""}"></i>
    <div style="flex-grow: 1; min-width: 0;">
      <h4 style="display: flex; align-items: center; justify-content: space-between; gap: 8px; width: 100%; margin: 0;">
        <span style="overflow: hidden; text-overflow: ellipsis; white-space: nowrap;">${n}</span>
        <span class="pdf-status-dot" style="width: 7px; height: 7px; background-color: ${c}; border-radius: 50%; display: inline-block; flex-shrink: 0;" title="${p}"></span>
      </h4>
      <span>${a?"Document Word":t?"Ouvrir le manuel g\xE9n\xE9ral":"Ouvrir le cours PDF"}</span>
    </div>
  `;let d=i.querySelector(".pdf-status-dot");return d&&d.addEventListener("click",f=>{f.preventDefault(),f.stopPropagation(),y(p,"fa-circle-info",4e3)}),i}function $t(e){let t=document.getElementById("all-pdfs-list");!t||!Array.isArray(e)||(t.innerHTML="",e.forEach(n=>{if(!n||typeof n!="string")return;let i=String(n),r=he(i),a=document.createElement("li"),s=i.toLowerCase().endsWith(".docx"),o=s?"fa-regular fa-file-word":"fa-solid fa-file-pdf",c=s?`pdfs/${encodeURIComponent(i)}`:`pdf_viewer.html?file=${encodeURIComponent(i)}&page=1`,p=l.pdfIndexStatus&&l.pdfIndexStatus[i]||{status:"red",pagesWithText:0,totalPages:0},d=s?"#ef4444":p.status==="green"?"#10b981":p.status==="orange"?"#f59e0b":"#ef4444",f=s?"Document Word (Non indexable, convertissez en PDF pour la recherche)":p.status==="green"?`Indexation compl\xE8te (${p.pagesWithText}/${p.totalPages} pages index\xE9es)`:p.status==="orange"?`Indexation partielle (${p.pagesWithText}/${p.totalPages} pages index\xE9es)`:`Non indexable (0/${p.totalPages} pages, PDF scann\xE9 sans texte)`;a.innerHTML=`
      <a href="${c}" ${s?'target="_blank"':""} class="all-pdfs-list-item" style="display: flex; align-items: center; justify-content: space-between; width: 100%;">
        <div style="display: flex; align-items: center; gap: 10px; min-width: 0; flex-grow: 1;">
          <i class="${o}"></i>
          <span style="overflow: hidden; text-overflow: ellipsis; white-space: nowrap;">${r} (${s?"Word":"PDF"})</span>
        </div>
        <span class="pdf-status-dot" style="width: 8px; height: 8px; background-color: ${d}; border-radius: 50%; flex-shrink: 0; margin-left: 8px;" title="${f}"></span>
      </a>
    `;let u=a.querySelector(".pdf-status-dot");u&&u.addEventListener("click",m=>{m.preventDefault(),m.stopPropagation(),y(f,"fa-circle-info",4e3)}),t.appendChild(a)}))}function Un(){let e=document.getElementById("all-pdfs-list"),t=document.getElementById("pdf-search");if(!e||!t)return;let n=(t.value||"").toLowerCase().trim();e.querySelectorAll("li").forEach(r=>{let a=(r.textContent||"").toLowerCase();r.style.display=!n||a.includes(n)?"block":"none"})}function ja(e){let t=(e||"").toLowerCase(),n=he(e).toLowerCase();if(Array.isArray(l.allCats)){let i=Array.from(new Set(l.allCats.map(r=>r.category))).filter(Boolean);for(let r of i){let a=r.toLowerCase();if(n.includes(a)||t.includes(a.slice(0,5)))return r}}return t.includes("urgenc")||t.includes("reanimat")||t.includes("choc")||t.includes("ecg")||t.includes("reflex")?"Urgences & R\xE9animation":t.includes("pediatr")||t.includes("eruptiv")||t.includes("nourrisson")?"P\xE9diatrie":t.includes("gyneco")||t.includes("grossesse")||t.includes("contracept")||t.includes("femme")?"Gyn\xE9cologie - Obst\xE9trique":t.includes("gastro")||t.includes("digestif")||t.includes("asp")?"Gastro-ent\xE9rologie":t.includes("dermato")||t.includes("gale")||t.includes("panaris")?"Dermatologie":t.includes("pneumo")||t.includes("thoracique")||t.includes("poumon")?"Pneumologie":t.includes("cardio")||t.includes("hta")||t.includes("coronaire")?"Cardiologie":t.includes("orl")||t.includes("ophtalmo")||t.includes("blepharite")?"ORL & Ophtalmologie":t.includes("infect")||t.includes("antibiot")||t.includes("inflammatoire")?"Infectiologie":t.includes("neuro")||t.includes("psycho")||t.includes("psychiatr")?"Neurologie & Psychiatrie":t.includes("medicament")||t.includes("ordonnance")||t.includes("posolog")||t.includes("formule")?"Th\xE9rapeutique & Pharmacologie":t.includes("radio")||t.includes("bilan")||t.includes("certificat")||t.includes("accident")?"Imagerie, Bilans & L\xE9gislation":"M\xE9decine G\xE9n\xE9rale & Divers"}function Wn(e){let t=document.getElementById("library-screen"),n=document.getElementById("welcome-screen"),i=document.getElementById("workspace"),r=document.getElementById("quiz-screen"),a=document.getElementById("library-back-dash-btn");a&&e&&(a.onclick=()=>e());let s=F(D("drcat_lib_accordions_state"),{})||{},o=D("drcat_lib_search_collapsed")==="true";function c(){z("drcat_lib_accordions_state",JSON.stringify(s))}function p(O=""){let g=document.getElementById("lib-specialties-container"),I=document.getElementById("lib-pdf-count");if(!g||!Array.isArray(l.allPdfs))return;let T=O.toLowerCase().trim(),$={};l.allPdfs.forEach(M=>{if(!M||typeof M!="string")return;let G=he(M),K=ja(M);T&&!G.toLowerCase().includes(T)&&!K.toLowerCase().includes(T)||($[K]||($[K]=[]),$[K].push(M))});let k=Object.keys($).sort(),H=0;if(k.forEach(M=>{H+=$[M].length}),I&&(I.textContent=H),k.length===0){g.innerHTML=`<div style="padding: 24px; text-align: center; color: var(--text-muted);">Aucun manuel ne correspond \xE0 votre recherche "${w(O)}".</div>`;return}g.innerHTML="",k.forEach((M,G)=>{let K=$[M],Y=document.createElement("div");Y.className="lib-category-section",Y.style.background="var(--bg-card)",Y.style.border="1px solid var(--border-color)",Y.style.borderRadius="var(--radius-md)",Y.style.overflow="hidden";let on=T.length>0?!0:s[M]!==void 0?s[M]:G<3;Y.innerHTML=`
        <div class="lib-cat-header" style="display: flex; justify-content: space-between; align-items: center; padding: 10px 14px; background: rgba(0,0,0,0.18); cursor: pointer; user-select: none;">
          <div style="display: flex; align-items: center; gap: 8px; font-weight: 700; font-size: 13px; color: var(--color-primary);">
            <i class="fa-solid fa-folder"></i> <span>${w(M)}</span>
            <span style="font-size: 11px; padding: 1px 6px; border-radius: 10px; background: rgba(6, 182, 212, 0.15); color: var(--color-primary);">${K.length}</span>
          </div>
          <i class="fa-solid fa-chevron-down lib-cat-chevron" style="font-size: 11px; color: var(--text-muted); transition: transform 0.2s ease; transform: ${on?"rotate(180deg)":"rotate(0deg)"};"></i>
        </div>
        <div class="lib-cat-body" style="display: ${on?"grid":"none"}; grid-template-columns: repeat(auto-fill, minmax(280px, 1fr)); gap: 8px; padding: 12px;"></div>
      `;let Ia=Y.querySelector(".lib-cat-header"),ft=Y.querySelector(".lib-cat-body"),La=Y.querySelector(".lib-cat-chevron");K.forEach(rn=>{let $e=ot(rn,!1);ft.appendChild($e)}),Ia.onclick=()=>{let $e=!(ft.style.display!=="none");ft.style.display=$e?"grid":"none",La.style.transform=$e?"rotate(180deg)":"rotate(0deg)",s[M]=$e,c()},g.appendChild(Y)})}let d=document.getElementById("lib-filter-pdf-input");d&&d.addEventListener("input",()=>{p(d.value||"")});let f=document.getElementById("lib-deep-search-input"),u=document.getElementById("lib-deep-search-btn"),m=document.getElementById("lib-search-results-section"),b=document.getElementById("lib-search-results-container"),E=document.getElementById("lib-search-results-count"),v=document.getElementById("lib-search-loading"),x=document.getElementById("lib-clear-search-btn"),C=document.getElementById("lib-toggle-results-btn"),B=document.getElementById("lib-toggle-results-icon"),R=document.getElementById("lib-toggle-results-text"),h=document.getElementById("lib-search-expand-banner"),L=document.getElementById("lib-show-all-results-btn"),_=document.getElementById("lib-remaining-results-count"),A=[];function P(){b&&(o&&A.length>4?(b.className="lib-search-container-collapsed",B&&(B.className="fa-solid fa-expand"),R&&(R.textContent="Agrandir"),h&&(h.style.display="block",_&&(_.textContent=A.length-4))):(b.className="lib-search-container-full",B&&(B.className="fa-solid fa-compress"),R&&(R.textContent="R\xE9duire"),h&&(h.style.display="none")))}C&&(C.onclick=()=>{o=!o,z("drcat_lib_search_collapsed",String(o)),P()}),L&&(L.onclick=()=>{o=!1,z("drcat_lib_search_collapsed","false"),P()}),x&&m&&(x.onclick=()=>{m.style.display="none"});let S=0;async function N(O){if(!O)return;let g=++S;m&&(m.style.display="block"),v&&(v.style.display="block"),b&&(b.innerHTML=""),h&&(h.style.display="none"),E&&(E.textContent=`Recherche pour "${O}"...`);try{let I=await nt(O);if(g!==S)return;if(v&&(v.style.display="none"),!I.ok){b&&(b.innerHTML='<p class="text-warning" style="padding: 12px; text-align: center;">Service de recherche temporairement indisponible.</p>');return}let T=await I.json();if(g!==S)return;if(A=T.results||[],E&&(E.textContent=`${A.length} passage(s) trouv\xE9(s) pour "${O}"`),A.length===0){b&&(b.innerHTML='<p class="text-muted" style="padding: 16px; text-align: center;">Aucun passage trouv\xE9 pour cette expression dans les livres de r\xE9f\xE9rence.</p>');return}let $="";A.forEach(k=>{let H=he(k.pdf),M=w(k.snippet),G=w(O).replace(/[-\\^$*+?.()|[\]{}]/g,"\\$&"),K=M.replace(new RegExp(`(${G})`,"gi"),"<mark>$1</mark>");$+=`
          <div class="pdf-search-result-card" data-pdf="${encodeURIComponent(k.pdf)}" data-page="${k.page}" style="padding: 12px; background: var(--bg-card); border: 1px solid var(--border-color); border-radius: 8px; cursor: pointer; display: flex; flex-direction: column; gap: 6px;">
            <div style="display: flex; justify-content: space-between; font-size: 12px; font-weight: 700; color: var(--color-primary);">
              <span><i class="fa-solid fa-book-open"></i> ${w(H)}</span>
              <span style="color: var(--color-warning);">Page ${k.page}</span>
            </div>
            <div style="font-size: 11.5px; color: var(--text-secondary); line-height: 1.4;">${K}</div>
          </div>
        `}),b&&(b.innerHTML=$,b.querySelectorAll(".pdf-search-result-card").forEach(k=>{k.onclick=()=>{de();let H=decodeURIComponent(k.getAttribute("data-pdf")),M=k.getAttribute("data-page");window.location.href=`pdf_viewer.html?file=${encodeURIComponent(H)}&page=${M}`}})),P()}catch{v&&(v.style.display="none"),b&&(b.innerHTML='<p class="text-danger" style="padding: 12px; text-align: center;">Erreur lors de la recherche dans les documents.</p>')}}u&&f&&(u.onclick=()=>N(f.value.trim()),f.onkeydown=O=>{O.key==="Enter"&&N(f.value.trim())}),window.openStandaloneLibrary=function(O=""){l.activeCat=null,document.querySelectorAll(".cat-item").forEach(g=>g.classList.remove("active")),i&&(i.style.display="none"),n&&(n.style.display="none"),r&&(r.style.display="none"),t&&(t.style.display="flex",window.scrollTo({top:0,behavior:"smooth"})),p(d?d.value:""),O&&f&&(f.value=O,N(O))}}function Gn(e){let t=document.getElementById("workspace-profile-wrapper"),n=document.getElementById("workspace-profile-select");if(!t||!n)return;let i=Array.isArray(e.sub_cats)&&e.sub_cats.length>0?e.sub_cats:[];if(i.length===0){t.style.display="none",n.innerHTML="";return}t.style.display="inline-flex",n.innerHTML="",[{label:"\u2B50 Fiche Principale"},...i].forEach((a,s)=>{let o=document.createElement("option");o.value=String(s),o.textContent=a.label||`Profil ${s}`,l.activeSubCatIndex===s&&(o.selected=!0),n.appendChild(o)}),n.onchange=a=>{window.switchToSubProfile(parseInt(a.target.value,10))}}function Kn(){window.switchToSubProfile=function(e){if(!l.activeCat)return;let t=Array.isArray(l.activeCat.sub_cats)&&l.activeCat.sub_cats.length>0?l.activeCat.sub_cats:[],n=[{label:"\u2B50 Fiche Principale",summary:l.activeCat.summary,red_flags:l.activeCat.red_flags,ordonnance:l.activeCat.ordonnance},...t],i=Number(e);if(i<0||i>=n.length)return;l.activeSubCatIndex=i;let r=n[i],a=document.getElementById("workspace-red-flags");a&&(a.textContent=r.red_flags||l.activeCat.red_flags),Ee(r.summary||l.activeCat.summary,l.activeCat,i>0?r.label:null),ae(r.ordonnance||l.activeCat.ordonnance),X(!0);let s=document.getElementById("workspace-profile-select");s&&(s.value=String(i));let o=document.getElementById("summary-view");o&&o.scrollIntoView({behavior:"smooth",block:"start"})}}async function Ce(){let e=document.getElementById("pdf-index-status");if(e)try{let t=await En(),n="";t.isIndexing?(n=`<span class="status-text text-warning"><i class="fa-solid fa-circle-notch fa-spin"></i> Indexation en cours... (${t.indexedFiles}/${t.totalFiles} fichiers)</span>`,setTimeout(Ce,2e3)):n=`<span class="status-text text-success"><i class="fa-solid fa-circle-check"></i> Indexation termin\xE9e (${t.indexedFiles}/${t.totalFiles} fichiers index\xE9s)</span>`;let i=e.querySelector(".status-text");i&&(i.innerHTML=n)}catch(t){console.error("Failed to fetch index status:",t)}}async function _t(e){let t=document.getElementById("pdf-content-search-input"),n=document.getElementById("pdf-search-loading"),i=document.getElementById("pdf-search-results-container");if(!t||!n||!i)return;let r=t.value.trim();if(!r)return;let a=xe(e,'<i class="fa-solid fa-magnifying-glass"></i> Rechercher');n.style.display="flex",i.innerHTML="";try{let s=await nt(r);if(s.status===503){let d=await s.json();i.innerHTML=`<p class="text-warning text-center" style="margin-top: 20px;"><i class="fa-solid fa-triangle-exclamation"></i> ${w(d.error||"Indexation en cours...")}</p>`;return}let c=(await s.json()).results;if(!c||c.length===0){i.innerHTML=`<p class="text-muted text-center" style="margin-top: 30px;">Aucun r\xE9sultat trouv\xE9 pour "${w(r)}". V\xE9rifiez l'orthographe.</p>`;return}let p="";c.forEach(d=>{let f=w(d.snippet),m=w(r).replace(/[-\\^$*+?.()|[\]{}]/g,"\\$&"),b=new RegExp(`(${m})`,"gi"),E=f.replace(b,"<mark>$1</mark>"),v=w(d.pdf.replace(/^[\d\uFE0F\u20E3]+\s*/,"").replace(/[\u{1F300}-\u{1F9FF}]/gu,"").replace(/_/g," ").replace(/\.pdf$/i,""));p+=`
        <div class="pdf-search-result-card" data-pdf="${encodeURIComponent(d.pdf)}" data-page="${d.page}">
          <div class="pdf-search-result-header">
            <span class="pdf-search-result-title"><i class="fa-solid fa-file-pdf"></i> ${v}</span>
            <span class="pdf-search-result-page">Page ${d.page}</span>
          </div>
          <div class="pdf-search-result-snippet">${E}</div>
        </div>
      `}),i.innerHTML=p,document.querySelectorAll(".pdf-search-result-card").forEach(d=>{d.addEventListener("click",()=>{de();let f=decodeURIComponent(d.getAttribute("data-pdf")),u=d.getAttribute("data-page");window.location.href=`pdf_viewer.html?file=${encodeURIComponent(f)}&page=${u}`})})}catch(s){console.error("PDF search error:",s),i.innerHTML='<p class="text-danger text-center" style="margin-top: 20px;">Une erreur est survenue lors de la recherche.</p>'}finally{n.style.display="none",a&&a()}}async function Yn(){try{(await Cn()).success&&Ce()}catch(e){if(console.error("Failed to trigger re-index:",e),window.handleAdminError&&await window.handleAdminError(e))return;y("Erreur lors de la r\xE9indexation.","fa-circle-exclamation",4e3)}}function Dt(e){let t=document.getElementById("pdf-list");if(!t)return;t.innerHTML="";let n=Array.isArray(e?.pdf_keywords)?e.pdf_keywords:[],i=e?.category?e.category.toLowerCase():"",r=Array.isArray(e?.tags)?e.tags.filter(d=>d&&typeof d=="string").map(d=>d.toLowerCase()):[],a=["urgence","urgences","traitement","th\xE9rapeutique","ordonnance","ordonnances","manuel","guide"],s=[i,...r,...a].filter(d=>d&&d.trim().length>2),o=l.allPdfs.filter(d=>{if(!d)return!1;let f=d.toLowerCase();return n.some(u=>u!=null&&typeof u=="string"&&f.includes(u.toLowerCase()))}),c=l.allPdfs.filter(d=>{if(!d)return!1;let f=d.toLowerCase();return n.some(m=>m!=null&&typeof m=="string"&&f.includes(m.toLowerCase()))?!1:s.some(m=>f.includes(m))}),p=document.createElement("h4");if(p.style.gridColumn="1 / -1",p.style.color="var(--color-primary)",p.style.margin="10px 0 5px",p.style.fontSize="14px",p.style.fontWeight="600",p.innerHTML='<i class="fa-solid fa-graduation-cap"></i> Cours & R\xE9f\xE9rences Sp\xE9cifiques',t.appendChild(p),o.length===0){let d=document.createElement("p");d.className="text-muted",d.style.gridColumn="1 / -1",d.style.fontSize="13px",d.style.margin="5px 0 15px",d.textContent="Aucun PDF de sp\xE9cialit\xE9 sp\xE9cifique trouv\xE9 pour ce sujet dans vos fichiers.",t.appendChild(d)}else o.forEach(d=>{t.appendChild(ot(d,!1))});if(c.length>0){let d=document.createElement("h4");d.style.gridColumn="1 / -1",d.style.color="var(--color-success)",d.style.margin="20px 0 5px",d.style.fontSize="14px",d.style.fontWeight="600",d.innerHTML=`<i class="fa-solid fa-book-medical"></i> Manuels & Guides (${w(e?.category||"G\xE9n\xE9raux")})`,t.appendChild(d),c.forEach(f=>{t.appendChild(ot(f,!0))})}}var Z,je,Ft,Le,Ve,ge,ee,ke,Mt,Ae,Pt,Rt,rt,st,Se,Ie,Ot,Va,He,zt,lt,Nt,qe,Fe,Ht,qt,Ue=null;function ct(){if(!l.activeCat||!ee)return!1;let e=ee.value;if(e===(l.activeCat.notes||""))return!1;let t=l.activeCat;t.notes=e,t.lastRead=Date.now();let n=Q();return n[t.id]||(n[t.id]={}),n[t.id].status=t.status||"todo",n[t.id].notes=e,n[t.id].lastRead=Date.now(),_e(n),!0}function Qn(e,t,n){if(Z=document.getElementById("workspace"),je=document.getElementById("welcome-screen"),Ft=document.getElementById("workspace-cat-category"),Le=document.getElementById("workspace-cat-title"),Ve=document.getElementById("workspace-red-flags"),ge=document.getElementById("workspace-prescription"),ee=document.getElementById("notes-input"),ke=document.getElementById("summary-view"),Mt=document.getElementById("summary-editor"),Ae=document.getElementById("summary-editor-wrapper"),Pt=document.getElementById("edit-summary-btn"),Rt=document.getElementById("cancel-summary-edit-btn"),rt=document.getElementById("save-summary-btn"),st=document.getElementById("save-notes-btn"),Se=document.getElementById("save-indicator"),Ie=document.getElementById("copy-prescription-btn"),Ot=document.getElementById("current-date"),Va=document.getElementById("pdf-list"),He=document.getElementById("all-pdfs-header"),zt=document.getElementById("all-pdfs-content"),lt=He?He.parentElement:null,Nt=document.getElementById("pdf-search"),qe=document.getElementById("pdf-content-search-input"),Fe=document.getElementById("pdf-content-search-btn"),Ht=document.getElementById("pdf-index-status"),qt=document.getElementById("pdf-reindex-btn"),Ot){let g=new Date;Ot.textContent=g.toLocaleDateString("fr-FR")}At();let i=document.getElementById("red-flags-banner");i&&i.addEventListener("click",()=>{window.innerWidth<=850&&i.classList.toggle("expanded")});let r=document.querySelectorAll(".tab-btn");r.forEach(g=>{g.addEventListener("click",()=>{r.forEach(k=>{k.classList.remove("active"),k.setAttribute("aria-selected","false")}),document.querySelectorAll(".tab-pane").forEach(k=>k.classList.remove("active")),g.classList.add("active"),g.setAttribute("aria-selected","true");try{g.scrollIntoView({behavior:"smooth",inline:"center",block:"nearest"})}catch{}let I=g.getAttribute("data-tab"),T=document.getElementById(I);T&&T.classList.add("active"),I==="tab-pdfs"?($t(l.allPdfs),l.activeCat&&Dt(l.activeCat)):I==="tab-search-pdf"&&qe&&qe.focus();let $=document.querySelector(".tab-content-container");$&&($.scrollTop=0)})});let a=document.querySelectorAll(".status-btn");a.forEach(g=>{g.addEventListener("click",()=>{if(!l.activeCat)return;let I=g.getAttribute("data-status");a.forEach($=>$.classList.remove("active")),g.classList.add("active"),l.activeCat.status=I,l.activeCat.lastRead=Date.now();let T=Q();T[l.activeCat.id]||(T[l.activeCat.id]={}),T[l.activeCat.id].status=I,T[l.activeCat.id].notes=l.activeCat.notes||"",T[l.activeCat.id].lastRead=Date.now(),_e(T),e(l.activeCat),(I==="doing"||I==="done")&&Object.values(Q()).filter(k=>k.status==="doing"||k.status==="done").length===20&&y("<strong>Beau travail, 20 fiches en cours ! \u{1F389}</strong><br>Pensez \xE0 exporter votre progression via le tableau de bord pour ne rien perdre.","fa-floppy-disk",8e3)})}),st&&st.addEventListener("click",()=>{if(!l.activeCat)return;let g=xe(st,'<i class="fa-solid fa-floppy-disk"></i> Sauvegarder');l.activeCat.notes=ee.value,l.activeCat.lastRead=Date.now();let I=Q();I[l.activeCat.id]||(I[l.activeCat.id]={}),I[l.activeCat.id].status=l.activeCat.status||"todo",I[l.activeCat.id].notes=l.activeCat.notes,I[l.activeCat.id].lastRead=Date.now(),_e(I),Se.classList.add("show"),setTimeout(()=>{Se.classList.remove("show")},2500),X(!0),setTimeout(()=>{g(),y("Notes sauvegard\xE9es localement. Exportez r\xE9guli\xE8rement vos donn\xE9es depuis le <strong>tableau de bord</strong> pour les s\xE9curiser.","fa-cloud-arrow-up",6e3)},400)}),ee&&(ee.addEventListener("input",()=>{clearTimeout(Ue),Ue=setTimeout(()=>{ct()&&Se&&(Se.classList.add("show"),setTimeout(()=>Se.classList.remove("show"),1500))},900)}),document.addEventListener("visibilitychange",()=>{document.visibilityState==="hidden"&&(clearTimeout(Ue),ct())}),window.addEventListener("pagehide",()=>{clearTimeout(Ue),ct()}));let s=document.getElementById("workspace-back-to-quiz-btn");s&&s.addEventListener("click",()=>{l.quizSession.quizViewingCatId=null,Z&&(Z.style.display="none");let g=document.getElementById("quiz-screen");g&&(g.style.display="flex"),document.querySelectorAll(".cat-item").forEach(I=>I.classList.remove("active"))}),Wn(()=>{let g=document.getElementById("brand-logo");g&&g.click()});let o=document.getElementById("print-cat-btn");o&&o.addEventListener("click",async()=>{let g=l.activeCat;if(g)if(typeof window.Capacitor<"u"||J){let I=Nn(g);if(navigator.clipboard&&navigator.clipboard.writeText)try{await navigator.clipboard.writeText(I),y("Fiche compl\xE8te (avec sous-fiches) copi\xE9e dans le presse-papier !","fa-clipboard-check",4e3)}catch{y("L'impression native n'est pas disponible. Utilisez la version web.","fa-circle-info",5e3)}else y("L'impression native n'est pas disponible. Utilisez la version web.","fa-circle-info",5e3)}else Vn(g)}),Pt&&Pt.addEventListener("click",()=>{ke.style.display="none",Ae.style.display="flex";let g=l.activeSubCatIndex>0&&Array.isArray(l.activeCat?.sub_cats);Mt.value=g?l.activeCat.sub_cats[l.activeSubCatIndex-1].summary||"":l.activeCat?.summary||""}),Rt&&Rt.addEventListener("click",()=>{ke.style.display="block",Ae.style.display="none"}),rt&&rt.addEventListener("click",async()=>{if(!l.activeCat)return;let g=Mt.value;if(!g.trim()){y("La synth\xE8se ne peut pas \xEAtre vide.","fa-triangle-exclamation",3e3);return}let I=xe(rt);try{let T=l.activeSubCatIndex>0&&Array.isArray(l.activeCat.sub_cats);if(l.isAdmin){let $;if(T?(l.activeCat.sub_cats[l.activeSubCatIndex-1].summary=g,$=await De(l.activeCat.id,{sub_cats:l.activeCat.sub_cats})):$=await De(l.activeCat.id,{summary:g}),$.success){T||(l.activeCat.summary=g);let k=(l.allCats||[]).find(M=>M.id===l.activeCat.id);k&&(T?k.sub_cats=l.activeCat.sub_cats:k.summary=g);let H=T?l.activeCat.sub_cats[l.activeSubCatIndex-1].label:null;Ee(g,l.activeCat,H),y(T?"Sous-fiche mise \xE0 jour avec succ\xE8s !":"Synth\xE8se mise \xE0 jour avec succ\xE8s !","fa-circle-check",2500),X(!0)}else y("Erreur: "+$.error,"fa-circle-exclamation",4e3),X(!1)}else{if(!confirm(`Attention : Vos modifications ne seront pas appliqu\xE9es directement dans l'application. Elles seront envoy\xE9es \xE0 l'administrateur du site pour relecture et validation avant d'\xEAtre int\xE9gr\xE9es.

Souhaitez-vous envoyer cette proposition ?`)){I();return}let k=T?JSON.parse(JSON.stringify(l.activeCat.sub_cats)):null;k&&(k[l.activeSubCatIndex-1].summary=g),await Re(Me,{type:"edit",catId:l.activeCat.id,data:T?{sub_cats:k}:{summary:g}},"Votre proposition de modification a \xE9t\xE9 envoy\xE9e \xE0 l'administrateur pour validation.")}}catch(T){if(console.error(T),window.handleAdminError&&await window.handleAdminError(T)){I();return}y("Erreur lors de la sauvegarde.","fa-circle-exclamation",4e3),X(!1)}finally{I()}ke.style.display="block",Ae.style.display="none"}),Ie&&Ie.addEventListener("click",()=>{let g="";l.prescriptionVariants.length>0&&l.prescriptionVariants[l.activePrescriptionVariantIndex]?g=l.prescriptionVariants[l.activePrescriptionVariantIndex].content:g=ge.innerText,navigator.clipboard.writeText(g).then(()=>{let I=Ie.innerHTML;Ie.innerHTML='<i class="fa-solid fa-check" style="color: var(--color-success);"></i>',y("Ordonnance copi\xE9e dans le presse-papier !","fa-check",2e3),setTimeout(()=>{Ie.innerHTML=I},1800)}).catch(I=>{y("Impossible de copier automatiquement dans le presse-papier.","fa-triangle-exclamation",2500)})});let c=document.getElementById("edit-prescription-btn"),p=document.getElementById("cancel-prescription-edit-btn"),d=document.getElementById("save-prescription-btn"),f=document.getElementById("prescription-editor"),u=document.getElementById("prescription-editor-actions");c&&c.addEventListener("click",()=>{ge.style.display="none",f.style.display="block",u.style.display="flex";let g=l.activeSubCatIndex>0&&Array.isArray(l.activeCat?.sub_cats);f.value=g?l.activeCat.sub_cats[l.activeSubCatIndex-1].ordonnance||"":l.activeCat?.ordonnance||""}),p&&p.addEventListener("click",()=>{ge.style.display="block",f.style.display="none",u.style.display="none"}),d&&d.addEventListener("click",async()=>{if(!l.activeCat)return;let g=f.value;if(!g.trim()){y("L'ordonnance ne peut pas \xEAtre vide.","fa-triangle-exclamation",3e3);return}let I=xe(d);try{let T=l.activeSubCatIndex>0&&Array.isArray(l.activeCat.sub_cats);if(l.isAdmin){let $;if(T?(l.activeCat.sub_cats[l.activeSubCatIndex-1].ordonnance=g,$=await De(l.activeCat.id,{sub_cats:l.activeCat.sub_cats})):$=await De(l.activeCat.id,{ordonnance:g}),$.success){T||(l.activeCat.ordonnance=g);let k=(l.allCats||[]).find(H=>H.id===l.activeCat.id);k&&(T?k.sub_cats=l.activeCat.sub_cats:k.ordonnance=g),ae(g),y(T?"Ordonnance de la sous-fiche mise \xE0 jour !":"Ordonnance type mise \xE0 jour avec succ\xE8s !","fa-circle-check",2500),X(!0)}else y("Erreur: "+$.error,"fa-circle-exclamation",4e3),X(!1)}else{if(!confirm(`Attention : Vos modifications ne seront pas appliqu\xE9es directement dans l'application. Elles seront envoy\xE9es \xE0 l'administrateur du site pour relecture et validation avant d'\xEAtre int\xE9gr\xE9es.

Souhaitez-vous envoyer cette proposition ?`)){I();return}let k=T?JSON.parse(JSON.stringify(l.activeCat.sub_cats)):null;k&&(k[l.activeSubCatIndex-1].ordonnance=g),await Re(Me,{type:"edit",catId:l.activeCat.id,data:T?{sub_cats:k}:{ordonnance:g}},"Votre proposition de modification de l'ordonnance a \xE9t\xE9 envoy\xE9e \xE0 l'administrateur pour validation.")}}catch(T){if(console.error(T),window.handleAdminError&&await window.handleAdminError(T)){I();return}y("Erreur lors de la sauvegarde.","fa-circle-exclamation",4e3)}finally{I()}ge.style.display="block",f.style.display="none",u.style.display="none"}),He&&He.addEventListener("click",()=>{lt.classList.contains("open")?(lt.classList.remove("open"),zt.style.display="none"):(lt.classList.add("open"),zt.style.display="block",$t(l.allPdfs))}),Nt&&Nt.addEventListener("input",Un);let m=document.getElementById("delete-cat-btn");m&&m.addEventListener("click",async()=>{if(!l.activeCat)return;let g=l.activeCat,I=g.id,T=g.title;if(confirm(`Voulez-vous vraiment supprimer d\xE9finitivement la fiche "${T}" (ID: ${I}) ?`))try{let $=await gn(I);$&&($.success||$.message)?(y(`La fiche "${w(T)}" a \xE9t\xE9 supprim\xE9e avec succ\xE8s.`,"fa-circle-check",4e3),l.allCats=l.allCats.filter(k=>k.id!==I),t?await t(I):n&&await n(),Te(null)):y(w($.error||"\xC9chec de la suppression de la fiche."),"fa-triangle-exclamation",4e3)}catch($){console.error("[Delete CAT Error]",$),y("Erreur lors de la suppression de la fiche.","fa-circle-exclamation",4e3)}});let b=document.getElementById("reset-progress-btn");b&&b.addEventListener("click",async()=>{confirm("Voulez-vous vraiment r\xE9initialiser toute votre progression et vos notes ? Cette action est irr\xE9versible et n'affectera que ce navigateur.")&&(te("dr_cat_user_progress"),te("dr_cat_leitner"),te("dr_cat_streak"),te("dr_cat_local_overrides"),l.allCats.forEach(g=>{g.status="todo",g.notes="",g.lastRead=0}),l.activeCat&&(l.activeCat.status="todo",l.activeCat.notes="",l.activeCat.lastRead=0,ee&&(ee.value=""),document.querySelectorAll(".status-btn").forEach(I=>{I.classList.remove("active"),I.getAttribute("data-status")==="todo"&&I.classList.add("active")})),y("Progression r\xE9initialis\xE9e avec succ\xE8s !","fa-circle-check",3e3),n&&await n())});let E=document.getElementById("reader-mode-btn"),v=document.getElementById("summary-reader-modal"),x=document.getElementById("close-reader-modal-btn"),C=document.getElementById("reader-cat-category"),B=document.getElementById("reader-cat-title"),R=document.getElementById("reader-summary-view");function h(){if(!l.activeCat||!v)return;C&&(C.textContent=l.activeCat.category),B&&(B.textContent=`${l.activeCat.id}. ${l.activeCat.title}`);let g=l.activeCat.customSummary||l.activeCat.summary||"";R&&(R.innerHTML=at(g)),v.style.display="flex",document.body.style.overflow="hidden"}function L(){v&&(v.style.display="none",document.body.style.overflow="")}E&&E.addEventListener("click",h),x&&x.addEventListener("click",L),v&&v.addEventListener("click",g=>{g.target===v&&L()}),document.addEventListener("keydown",g=>{g.key==="Escape"&&v&&v.style.display==="flex"&&L()}),Kn(),Fe&&Fe.addEventListener("click",()=>_t(Fe)),qe&&qe.addEventListener("keydown",g=>{g.key==="Enter"&&_t(Fe)}),qt&&qt.addEventListener("click",Yn),J&&Ht&&(Ht.style.display="none"),document.addEventListener("click",g=>{let I=g.target.closest("a");I&&I.getAttribute("href")&&I.getAttribute("href").includes("pdf_viewer.html")&&de()});let _=0,A=0,P=0,S=0,N=!1;Z&&(Z.addEventListener("touchstart",g=>{if(N=!1,!g.target||typeof g.target.closest!="function"||!(g.target.closest(".workspace-header")||g.target.closest("#red-flags-banner"))||g.target.closest("#subcat-selector-bar")||g.target.closest(".subcat-pill"))return;let T=g.target.tagName.toLowerCase(),$=g.target.closest("#summary-editor")||g.target.closest("#notes-input");T==="textarea"||T==="input"||$||(N=!0,_=g.changedTouches[0].screenX,A=g.changedTouches[0].screenY)},{passive:!0}),Z.addEventListener("touchend",g=>{N&&(N=!1,!(!g.target||typeof g.target.closest!="function")&&(P=g.changedTouches[0].screenX,S=g.changedTouches[0].screenY,O()))},{passive:!0}));function O(){let g=P-_,I=S-A;if(Math.abs(g)>60&&Math.abs(g)>Math.abs(I)*2){let $=document.querySelector(".cat-item.active"),k=Array.from(document.querySelectorAll(".cat-item"));if(k.length===0||!$)return;let H=k.indexOf($);if(H===-1)return;let M=H;g<0?M=(H+1)%k.length:M=(H-1+k.length)%k.length;let G=k[M];G&&(G.click(),G.scrollIntoView({block:"nearest",behavior:se()?"auto":"smooth"}),X(!0))}}}function Te(e,t=!1,n=0){if(window.perf&&window.perf.startMeasure("workspace.selectCat"),clearTimeout(Ue),ct(),l.activeCat=e,l.activeSubCatIndex=n,l.activePrescriptionVariantIndex=0,!e){Z&&(Z.style.display="none"),je&&(je.style.display="flex"),document.querySelectorAll(".cat-item").forEach(u=>u.classList.remove("active")),window.perf&&window.perf.endMeasure("workspace.selectCat");return}if(!t){e.lastRead=Date.now();let u=Q();u[e.id]||(u[e.id]={}),u[e.id].lastRead=Date.now(),u[e.id].status=e.status||"todo",u[e.id].notes=e.notes||"",_e(u)}document.querySelectorAll(".cat-item").forEach(u=>{u.classList.remove("active"),parseInt(u.getAttribute("data-id"))===e.id&&u.classList.add("active")}),je&&(je.style.display="none"),Z&&(Z.style.display="flex");let i=document.getElementById("quiz-screen");i&&(i.style.display="none");let r=document.getElementById("library-screen");r&&(r.style.display="none");let a=document.getElementById("workspace-back-to-quiz-btn");if(a&&(l.quizSession&&l.quizSession.quizViewingCatId===e.id?a.style.display="inline-flex":a.style.display="none"),Ft&&(Ft.textContent=e.category),Le){let u=`${e.id}. ${e.title}`;if(u.length>50){Le.classList.add("very-long-title");let m=w(u);m.includes(" et ")?m=m.replace(" et ","<br>et "):m.includes(" avec ")?m=m.replace(" avec ","<br>avec "):m.includes(" : ")&&(m=m.replace(" : "," :<br>")),Le.innerHTML=m}else Le.classList.remove("very-long-title"),Le.textContent=u}Ve&&(Ve.textContent=e.red_flags);let s=document.getElementById("red-flags-banner");if(s&&(s.classList.remove("expanded"),e.red_flags&&e.red_flags.trim().length>0?s.style.display="block":s.style.display="none"),document.querySelectorAll(".status-btn").forEach(u=>{u.classList.remove("active"),u.getAttribute("data-status")===e.status&&u.classList.add("active")}),Gn(e),n>0&&Array.isArray(e.sub_cats)&&e.sub_cats[n-1]){let u=e.sub_cats[n-1];Ee(u.summary||e.summary,e,u.label),Ve&&(Ve.textContent=u.red_flags||e.red_flags),ae(u.ordonnance||e.ordonnance)}else Ee(e.customSummary||e.summary,e),ae(e.customOrdonnance||e.ordonnance);ee&&(ee.value=e.notes||"");let o=document.getElementById("prescription-editor"),c=document.getElementById("prescription-editor-actions");if(o&&(o.style.display="none"),c&&(c.style.display="none"),ge&&(ge.style.display="block"),Dt(e),!t){document.querySelectorAll(".tab-btn").forEach(b=>{b.classList.remove("active"),b.setAttribute("aria-selected","false")}),document.querySelectorAll(".tab-pane").forEach(b=>b.classList.remove("active"));let u=document.querySelector('.tab-btn[data-tab="tab-summary"]'),m=document.getElementById("tab-summary");u&&(u.classList.add("active"),u.setAttribute("aria-selected","true")),m&&m.classList.add("active")}ke&&(ke.style.display="block"),Ae&&(Ae.style.display="none");let p=document.getElementById("delete-cat-btn"),d=document.getElementById("edit-summary-btn"),f=document.getElementById("edit-prescription-btn");if(J){p&&(p.style.display="none");let u=l.isOnlineAtStartup?"inline-flex":"none";d&&(d.style.display=u),f&&(f.style.display=u)}else d&&(d.style.display="inline-flex"),f&&(f.style.display="inline-flex"),p&&(e.id>55&&l.isAdmin?p.style.display="inline-flex":p.style.display="none");window.perf&&window.perf.endMeasure("workspace.selectCat")}function Jn(e){let t=0,n=0,i=0,r=Array.isArray(e)?e:[];return r.forEach(a=>{a?.status==="done"?i++:a?.status==="doing"?n++:t++}),{todo:t,doing:n,done:i,total:r.length}}function Xn(){let e=0;try{let t=D("dr_cat_streak",'{"count": 0}'),n=F(t,{count:0});e=n&&typeof n.count=="number"?n.count:0}catch(t){console.warn("Failed to parse study streak info",t)}return e}function Zn(e,t,n){if(!e)return;e.innerHTML="";let i=[...t].sort((r,a)=>(a.lastRead||0)-(r.lastRead||0));if(i.length===0){e.innerHTML='<li class="empty-state">Aucun cours en cours. S\xE9lectionnez un cours dans la barre lat\xE9rale pour commencer !</li>';return}i.slice(0,5).forEach(r=>{let a=document.createElement("li");a.style.cursor="pointer",a.innerHTML=`
      <div style="display: flex; justify-content: space-between; align-items: center; width: 100%;">
        <div>
          <span class="resume-title" style="font-weight: 600; color: var(--color-primary);">${r.id}. ${r.title}</span>
          <span style="font-size: 11px; color: var(--text-muted); display: block;">Sp\xE9cialit\xE9 : ${r.category}</span>
        </div>
        <span class="badge ${r.status==="done"?"badge-success":"badge-warning"}" style="font-size: 11px; padding: 2px 8px; border-radius: 4px;">
          ${r.status==="done"?"Ma\xEEtris\xE9":"En cours"}
        </span>
      </div>
    `,a.addEventListener("click",()=>n(r)),e.appendChild(a)})}function ea(e,t){if(!e)return;e.innerHTML="";let n={};t.forEach(c=>{n[c.category]||(n[c.category]={total:0,done:0,items:[]}),n[c.category].total++,n[c.category].items.push(c),c.status==="done"&&n[c.category].done++});let i=Object.keys(n).sort(),r=document.getElementById("categories-summary-badge");r&&(r.textContent=`${i.length} domaines`),i.forEach(c=>{let p=n[c],d=p.total>0?Math.round(p.done/p.total*100):0,f=document.createElement("div");f.className="category-progress-item",f.innerHTML=`
      <div class="category-progress-info">
        <span>${c}</span>
        <span>${p.done}/${p.total} (${d}%)</span>
      </div>
      <div class="progress-bar-bg">
        <div class="progress-bar-fill" style="width: ${d}%"></div>
      </div>
    `,e.appendChild(f)});let a=document.getElementById("categories-progress-toggle"),s=document.getElementById("categories-progress-content"),o=document.getElementById("categories-toggle-chevron");a&&s&&o&&!a._hasListener&&(a._hasListener=!0,D("dash_categories_expanded")==="true"?(s.style.display="block",o.style.transform="rotate(180deg)"):(s.style.display="none",o.style.transform="rotate(0deg)"),a.addEventListener("click",()=>{s.style.display!=="none"?(s.style.display="none",o.style.transform="rotate(0deg)",z("dash_categories_expanded","false")):(s.style.display="block",o.style.transform="rotate(180deg)",z("dash_categories_expanded","true"))}))}function ta(e){e.innerHTML=`
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
  `,Wa()}function Wa(){let e=document.getElementById("admin-pdf-upload-input"),t=document.getElementById("admin-pdf-trigger-btn"),n=document.getElementById("admin-pdf-filename"),i=document.getElementById("admin-pdf-submit-btn"),r=null,a=null;t&&t.addEventListener("click",()=>e.click()),e&&e.addEventListener("change",s=>{let o=s.target.files[0];if(!o){r=null,a=null,n.style.display="none",i.style.display="none",i.disabled=!0;return}r=o,n.textContent=o.name,n.style.display="block",i.style.display="flex",i.disabled=!0,i.innerHTML='<i class="fa-solid fa-spinner fa-spin"></i> Pr\xE9paration...';let c=new FileReader;c.onload=p=>{a=p.target.result.split(",")[1],i.disabled=!1,i.innerHTML=`<i class="fa-solid fa-upload"></i> D\xE9marrer l'Indexation`},c.onerror=()=>{y("Erreur lors de la lecture du fichier","fa-triangle-exclamation",4e3)},c.readAsDataURL(o)}),i&&i.addEventListener("click",async()=>{if(!(!r||!a)){i.disabled=!0,i.innerHTML='<i class="fa-solid fa-spinner fa-spin"></i> Envoi en cours...';try{let s=await fn(fe("/api/admin/upload-pdf"),{method:"POST",headers:me({"Content-Type":"application/json"}),body:JSON.stringify({filename:r.name,base64Data:a})});if(!s.ok){let o=await s.json().catch(()=>({}));throw new Error(o.error||"Failed to upload PDF")}y("Fichier PDF upload\xE9 avec succ\xE8s! L'indexation tourne en arri\xE8re-plan.","fa-circle-check",4e3),e.value="",r=null,a=null,n.style.display="none",i.style.display="none"}catch(s){console.error("[Admin PDF]",s),y(`\xC9chec: ${s.message}`,"fa-triangle-exclamation",4e3),i.disabled=!1,i.innerHTML='<i class="fa-solid fa-rotate-right"></i> R\xE9essayer'}}})}function ie(e){return String(e||"").replace(/[&<>'"]/g,t=>({"&":"&amp;","<":"&lt;",">":"&gt;","'":"&#39;",'"':"&quot;"})[t]||t)}async function We(e){if(e)try{let t=await In(),n=!!t.forceUpdateActive,i=t.downloadLinks||{};e.innerHTML=`
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
    `;let r=e.querySelector("#admin-toggle-killswitch-btn");r&&r.addEventListener("click",async()=>{try{let s=!n;r.disabled=!0,r.innerHTML='<i class="fa-solid fa-spinner fa-spin"></i> Mise \xE0 jour...',await vt({forceUpdateActive:s}),alert(`Statut du Kill Switch mis \xE0 jour : ${s?"ACTIV\xC9 \u{1F6A8}":"D\xC9SACTIV\xC9 \u{1F7E2}"}`),We(e)}catch(s){alert(`Erreur lors du basculement : ${s.message}`),We(e)}});let a=e.querySelector("#admin-version-form");a&&a.addEventListener("submit",async s=>{s.preventDefault();let o=a.querySelector("#admin-save-version-btn");try{o.disabled=!0,o.innerHTML='<i class="fa-solid fa-spinner fa-spin"></i> Enregistrement...';let c={minVersion:a.querySelector("#ver-input-min").value.trim(),latestVersion:a.querySelector("#ver-input-latest").value.trim(),updateMessage:a.querySelector("#ver-input-message").value.trim(),releaseNotes:a.querySelector("#ver-input-releasenotes").value.trim(),downloadLinks:{uptodownUrl:a.querySelector("#ver-input-uptodown").value.trim(),telegramUrl:a.querySelector("#ver-input-telegram").value.trim(),directServerUrl:a.querySelector("#ver-input-direct").value.trim()}};await vt(c),alert("Configuration des versions enregistr\xE9e avec succ\xE8s !"),We(e)}catch(c){alert(`Erreur lors de l'enregistrement : ${c.message}`),o&&(o.disabled=!1,o.innerHTML='<i class="fa-solid fa-floppy-disk"></i> Enregistrer les Modifications')}})}catch(t){e.innerHTML=`<div style="padding: 20px; color: var(--color-danger);">Erreur de chargement de la configuration de version : ${ie(t.message)}</div>`}}async function na(e){if(!e)return;e.innerHTML=`
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
  `;let t=e.querySelector("#admin-telemetry-refresh-btn"),n=e.querySelector("#admin-telemetry-clear-all-btn"),i=e.querySelector("#admin-telemetry-list");async function r(s=!1){try{s&&t?(t.disabled=!0,t.innerHTML='<i class="fa-solid fa-arrows-rotate fa-spin"></i> Actualisation...'):i.innerHTML='<p class="text-muted text-center" style="padding: 20px 0;"><i class="fa-solid fa-spinner fa-spin"></i> Chargement des rapports...</p>';let o=await wn();a(o),s&&y("Flux d'incidents actualis\xE9.","fa-check",2e3)}catch(o){console.error("[AdminTelemetry] Failed to load reports:",o),i.innerHTML=`<p class="text-danger text-center" style="padding: 20px 0;">Erreur lors de la r\xE9cup\xE9ration des rapports : ${w(o.message)}</p>`}finally{t&&(t.disabled=!1,t.innerHTML='<i class="fa-solid fa-arrows-rotate"></i> Actualiser')}}function a(s){if(!Array.isArray(s)||s.length===0){i.innerHTML=`
        <div style="text-align: center; padding: 32px 16px; background: var(--surface-card); border-radius: var(--radius-md); border: 1px dashed var(--border-color);">
          <i class="fa-solid fa-shield-heart" style="font-size: 32px; color: var(--color-success); margin-bottom: 8px;"></i>
          <p style="margin: 0; font-weight: 600; color: var(--text-primary);">Aucun crash ni rapport signal\xE9 !</p>
          <p style="margin: 4px 0 0 0; font-size: 12px; color: var(--text-muted);">L'application fonctionne normalement sur tous les appareils connect\xE9s.</p>
        </div>
      `;return}i.innerHTML=s.map(o=>{let c=new Date(o.firstSeen||o.timestamp||Date.now()).toLocaleTimeString("fr-FR",{hour:"2-digit",minute:"2-digit"}),p=new Date(o.lastSeen||o.timestamp||Date.now()).toLocaleString("fr-FR"),d=o.device||{},f=o.occurrences||1,u=o.severity||(f>=20?"critical":f>=5?"warning":"info"),m='<span style="background: #059669; color: #fff; font-size: 10px; font-weight: 700; padding: 2px 7px; border-radius: 4px;">\u{1F7E2} MINEUR</span>',b="var(--border-color)";u==="critical"?(m='<span style="background: #ef4444; color: #fff; font-size: 10px; font-weight: 800; padding: 2px 7px; border-radius: 4px; box-shadow: 0 0 8px rgba(239,68,68,0.5); animation: pulse 2s infinite;"><i class="fa-solid fa-triangle-exclamation"></i> \u{1F534} PANNE GLOBALE</span>',b="#ef4444"):u==="warning"&&(m='<span style="background: #f59e0b; color: #000; font-size: 10px; font-weight: 700; padding: 2px 7px; border-radius: 4px;"><i class="fa-solid fa-bell"></i> \u{1F7E0} FR\xC9QUENT</span>',b="#f59e0b");let E="";o.affectedDevices&&typeof o.affectedDevices=="object"?E=Object.entries(o.affectedDevices).map(([C,B])=>`
          <span style="font-size: 11px; background: rgba(255,255,255,0.06); border: 1px solid var(--border-color); padding: 1px 6px; border-radius: 4px; color: var(--text-secondary);">
            <i class="fa-solid fa-mobile-screen"></i> ${w(C)} <strong>(${B})</strong>
          </span>
        `).join(" "):E=`
          <span style="font-size: 11px; background: rgba(255,255,255,0.06); border: 1px solid var(--border-color); padding: 1px 6px; border-radius: 4px; color: var(--text-secondary);">
            <i class="fa-solid fa-mobile-screen"></i> ${w(d.model||"Inconnu")}
          </span>
        `;let v=Array.isArray(o.logs)?o.logs.length:0,x=v>0?o.logs.map(C=>`<div style="font-family: monospace; font-size: 11px; padding: 2px 0; color: ${C.level==="error"?"#f87171":C.level==="warn"?"#fbbf24":"var(--text-secondary)"};">[${w(C.timestamp||"")}] [${w(C.level||"log")}] ${w(C.message||"")}</div>`).join(""):'<p class="text-muted" style="font-size: 11px; margin: 0;">Aucun log joint.</p>';return`
        <div class="telemetry-card" style="background: var(--surface-card); border: 1.5px solid ${b}; border-radius: var(--radius-md); padding: 14px; box-shadow: var(--shadow-sm);">
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
                #${w(o.fingerprint||o.id||"incident")}
              </span>
            </div>
            <button class="delete-report-btn" data-id="${w(o.id)}" title="Supprimer cet incident" style="background: none; border: none; color: var(--text-muted); cursor: pointer; padding: 4px 8px; border-radius: 4px; font-size: 12px; transition: color 0.2s;">
              <i class="fa-solid fa-trash"></i>
            </button>
          </div>

          <div style="background: rgba(239,68,68,0.08); border-left: 3px solid #ef4444; padding: 8px 12px; border-radius: 4px; margin-bottom: 10px;">
            <p style="margin: 0; font-family: monospace; font-size: 12px; color: var(--text-primary); font-weight: 600; word-break: break-word;">
              ${w(o.error||"Erreur inconnue")}
            </p>
          </div>

          <div style="margin-bottom: 10px; display: flex; align-items: center; gap: 6px; flex-wrap: wrap;">
            <span style="font-size: 11px; color: var(--text-muted); font-weight: 600;">Appareils touch\xE9s :</span>
            ${E}
          </div>

          ${o.stack?`
            <details style="margin-bottom: 8px;">
              <summary style="font-size: 11.5px; color: var(--color-primary); cursor: pointer; font-weight: 500;">
                <i class="fa-solid fa-code"></i> Afficher la pile d'ex\xE9cution (Stack trace)
              </summary>
              <div style="display: flex; justify-content: space-between; align-items: center; margin-top: 6px;">
                <span style="font-size: 11px; color: var(--text-muted);">Pile JavaScript :</span>
                <button class="copy-stack-ai-btn action-btn" data-id="${w(o.id)}" style="padding: 3px 8px; font-size: 11px; display: flex; align-items: center; gap: 4px; background: rgba(6,182,212,0.15); border: 1px solid var(--color-primary); color: var(--color-primary); border-radius: 4px; cursor: pointer; transition: all 0.2s;">
                  <i class="fa-solid fa-robot"></i> \u{1F4CB} Copier pour l'IA
                </button>
              </div>
              <pre style="margin: 6px 0 0 0; background: rgba(0,0,0,0.25); padding: 8px; border-radius: 4px; font-size: 10.5px; max-height: 160px; overflow-y: auto; color: var(--text-secondary); white-space: pre-wrap;">${w(o.stack)}</pre>
            </details>
          `:""}

          ${v>0?`
            <details>
              <summary style="font-size: 11.5px; color: var(--color-primary); cursor: pointer; font-weight: 500;">
                <i class="fa-solid fa-list-check"></i> Traces console (${v} logs)
              </summary>
              <div style="display: flex; justify-content: space-between; align-items: center; margin-top: 6px;">
                <span style="font-size: 11px; color: var(--text-muted);">${v} traces enregistr\xE9es :</span>
                <button class="copy-logs-btn action-btn" data-id="${w(o.id)}" style="padding: 3px 8px; font-size: 11px; display: flex; align-items: center; gap: 4px; background: rgba(255,255,255,0.06); border: 1px solid var(--border-color); color: var(--text-secondary); border-radius: 4px; cursor: pointer; transition: all 0.2s;">
                  <i class="fa-solid fa-copy"></i> Copier les logs
                </button>
              </div>
              <div style="margin-top: 6px; background: rgba(0,0,0,0.25); padding: 8px; border-radius: 4px; max-height: 160px; overflow-y: auto;">
                ${x}
              </div>
            </details>
          `:""}
        </div>
      `}).join(""),i.querySelectorAll(".copy-stack-ai-btn").forEach(o=>{o.addEventListener("click",c=>{c.stopPropagation();let p=o.getAttribute("data-id"),d=s.find(E=>E&&E.id===p);if(!d)return;let f=d.device||{},u=d.affectedDevices&&typeof d.affectedDevices=="object"?Object.entries(d.affectedDevices).map(([E,v])=>`${E} (${v})`).join(", "):f.model||"Inconnu",m=Array.isArray(d.logs)&&d.logs.length>0?d.logs.map(E=>`[${E.timestamp||""}] [${E.level||"LOG"}] ${E.message||""}`).join(`
`):"Aucun log console disponible.",b=`\u{1F6A8} [Dr. CAT Diagnostic Incident Report]
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
Analyse cette trace d'erreur et ces logs de Dr. CAT, diagnostique la cause exacte du probl\xE8me et fournis les modifications de code pr\xE9cises pour le corriger.`;navigator.clipboard?.writeText(b).then(()=>{y("\u{1F4CB} Rapport complet format\xE9 pour l'IA copi\xE9 !","fa-robot",3e3)}).catch(()=>{let E=document.createElement("textarea");E.value=b,document.body.appendChild(E),E.select(),document.execCommand("copy"),document.body.removeChild(E),y("\u{1F4CB} Rapport complet format\xE9 pour l'IA copi\xE9 !","fa-robot",3e3)})})}),i.querySelectorAll(".copy-logs-btn").forEach(o=>{o.addEventListener("click",c=>{c.stopPropagation();let p=o.getAttribute("data-id"),d=s.find(u=>u&&u.id===p);if(!d||!Array.isArray(d.logs))return;let f=d.logs.map(u=>`[${u.timestamp||""}] [${u.level||"LOG"}] ${u.message||""}`).join(`
`);navigator.clipboard?.writeText(f).then(()=>{y("Logs console copi\xE9s !","fa-copy",2e3)}).catch(()=>{let u=document.createElement("textarea");u.value=f,document.body.appendChild(u),u.select(),document.execCommand("copy"),document.body.removeChild(u),y("Logs console copi\xE9s !","fa-copy",2e3)})})}),i.querySelectorAll(".delete-report-btn").forEach(o=>{o.addEventListener("click",async()=>{let c=o.getAttribute("data-id");if(c)try{await bt(c),y("Rapport supprim\xE9.","fa-check",2e3),r()}catch{y("Erreur lors de la suppression.","fa-triangle-exclamation",3e3)}})})}t&&t.addEventListener("click",()=>r(!0)),n&&n.addEventListener("click",async()=>{if(confirm("Voulez-vous vraiment effacer tous les rapports de crash enregistr\xE9s ?"))try{await bt("all"),y("Tous les rapports ont \xE9t\xE9 effac\xE9s.","fa-check",2e3),r()}catch{y("Erreur lors de la suppression.","fa-triangle-exclamation",3e3)}}),r()}var ye=null;function aa(e){ye=e;let t=document.querySelectorAll(".admin-tab-btn");t.forEach(r=>{r.addEventListener("click",()=>{let a=r.getAttribute("data-target");if(!a)return;t.forEach(c=>{c.classList.remove("active"),c.setAttribute("aria-selected","false"),c.style.color="var(--text-secondary)",c.style.backgroundColor="transparent"}),r.classList.add("active"),r.setAttribute("aria-selected","true"),r.style.color="var(--color-primary)",r.style.backgroundColor="rgba(6, 182, 212, 0.1)",document.querySelectorAll(".admin-pane-content").forEach(c=>{c.style.display="none"});let o=document.getElementById(a);o&&(o.style.display="block",a==="admin-pane-version"?We(o):a==="admin-pane-telemetry"?na(o):a==="admin-pane-pdfs"&&ta(o)),window.dispatchEvent(new CustomEvent("drcat-admin-tab-changed",{detail:{activePaneId:a}}))})});let n=document.querySelector(".admin-tab-btn.active");n&&(n.style.color="var(--color-primary)",n.style.backgroundColor="rgba(6, 182, 212, 0.1)");let i=document.getElementById("btn-ai-auto-fill");i&&(i.style.display=l.isAdmin?"inline-flex":"none",i.addEventListener("click",async()=>{let r=document.getElementById("new-cat-title"),a=r?r.value.trim():"";if(!a||a.length<3){y("Veuillez saisir au moins un titre de CAT (ex: CAT devant colique n\xE9phr\xE9tique)","fa-circle-exclamation",4e3),r&&r.focus();return}let s=i.innerHTML;i.disabled=!0,i.innerHTML='<i class="fa-solid fa-spinner fa-spin"></i> Dual RAG...';try{y("Recherche Web RAG en cours...","fa-globe",3e3),await fetch(fe("/api/admin/cat-generator/fetch-web"),{method:"POST",headers:me(),body:JSON.stringify({title:a,forceRefetch:!1})}).catch(()=>{}),y("Synth\xE8se IA Dual RAG en cours...","fa-wand-magic-sparkles",5e3);let o=await fetch(fe("/api/admin/cat-generator/single"),{method:"POST",headers:me(),body:JSON.stringify({title:a})}),c=await o.json();if(!o.ok||!c.success)throw new Error(c.error||"Erreur lors de la g\xE9n\xE9ration IA.");let p=c.cat;if(p){if(p.category){let d=document.getElementById("new-cat-category");d&&(d.value=p.category)}if(p.red_flags){let d=document.getElementById("new-cat-red-flags");d&&(d.value=p.red_flags)}if(p.summary){let d=document.getElementById("new-cat-summary");d&&(d.value=p.summary)}if(p.ordonnance){let d=document.getElementById("new-cat-ordonnance");d&&(d.value=p.ordonnance)}if(p.pdf_keywords&&Array.isArray(p.pdf_keywords)){let d=document.getElementById("new-cat-pdf-keywords");d&&(d.value=p.pdf_keywords.join(", "))}y(`Fiche "${p.title}" g\xE9n\xE9r\xE9e et pr\xE9-remplie !`,"fa-circle-check",4e3)}}catch(o){console.error(o),y("Erreur IA: "+o.message,"fa-triangle-exclamation",5e3)}finally{i.disabled=!1,i.innerHTML=s}})),window.handleApproveSuggestion=async function(r){if(confirm("Voulez-vous vraiment accepter cette suggestion et l'int\xE9grer \xE0 la base de donn\xE9es ?"))try{let a=await vn(r);a.success?(y("Proposition approuv\xE9e !","fa-circle-check",3e3),ye?await ye():await Ge()):y("Erreur: "+(a.error||a.message),"fa-circle-exclamation",4e3)}catch(a){if(console.error(a),window.handleAdminError&&await window.handleAdminError(a))return;y("Erreur lors de la validation.","fa-circle-exclamation",4e3)}},window.handleRejectSuggestion=async function(r){if(confirm("Voulez-vous vraiment rejeter et supprimer cette proposition ?"))try{let a=await hn(r);a.success?(y("Proposition rejet\xE9e.","fa-circle-xmark",3e3),ye?await ye():await Ge()):y("Erreur: "+(a.error||a.message),"fa-circle-exclamation",4e3)}catch(a){if(console.error(a),window.handleAdminError&&await window.handleAdminError(a))return;y("Erreur lors du rejet.","fa-circle-exclamation",4e3)}},window.handleReviewSuggestion=async function(r){try{y("Chargement des d\xE9tails...","fa-spinner fa-spin",1500);let s=(await yt()).find(d=>d.id===r);if(!s){y("Proposition introuvable.","fa-circle-exclamation",3e3);return}let o=document.createElement("div");o.id="suggestion-review-modal",o.className="modal-overlay modal-overlay--sheet",o.setAttribute("role","dialog"),o.setAttribute("aria-modal","true");let c="";s.type==="add"&&(c=`
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
      `,o.innerHTML=`
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
      `,document.body.appendChild(o);let p=()=>Pe(o);document.getElementById("review-modal-close")?.addEventListener("click",p),document.getElementById("review-btn-cancel")?.addEventListener("click",p),document.getElementById("review-btn-save")?.addEventListener("click",async()=>{try{let d={};s.type==="add"&&(d.title=document.getElementById("review-sug-title").value,d.category=document.getElementById("review-sug-category").value,d.red_flags=document.getElementById("review-sug-redflags").value);let f=document.getElementById("review-sug-summary"),u=document.getElementById("review-sug-ordonnance");f&&(d.summary=f.value),u&&(d.ordonnance=u.value);let m=await xn(r,d);m.success?(y("Corrections enregistr\xE9es avec succ\xE8s !","fa-circle-check",3e3),Pe(o),ye?await ye():await Ge()):y("Erreur: "+(m.error||m.message),"fa-circle-exclamation",4e3)}catch(d){console.error(d),y("Erreur lors de l'enregistrement.","fa-circle-exclamation",4e3)}})}catch(a){console.error(a),y("Impossible de charger les d\xE9tails de cette proposition.","fa-circle-exclamation",4e3)}}}async function Ge(e){let t=e||document.getElementById("suggestions-list");if(!(!l.isAdmin||!t))try{let n=await yt();if(n.length===0){t.innerHTML='<p class="text-muted text-center" style="padding: 10px 0;">Aucune proposition en attente.</p>';return}let i="";n.forEach(r=>{let a=new Date(r.timestamp).toLocaleString("fr-FR"),s=r.type==="add"?"add":"edit",o=r.type==="add"?"Ajout de fiche":`Modif de fiche (ID: ${r.catId})`,c="";if(r.type==="add")c=`<strong>Titre :</strong> ${w(r.data.title||"")}<br>
                    <strong>Sp\xE9cialit\xE9 :</strong> ${w(r.data.category||"")}<br>
                    <strong>Red Flags :</strong> ${w(r.data.red_flags||"")||"Aucun"}<br>
                    <strong>Synth\xE8se (extrait) :</strong> ${r.data.summary?w(r.data.summary.substring(0,150))+"...":"Aucune"}<br>
                    <strong>Ordonnance (extrait) :</strong> ${r.data.ordonnance?w(r.data.ordonnance.substring(0,100))+"...":"Aucune"}`;else if(r.type==="edit"){let p=l.allCats.find(f=>f.id===parseInt(r.catId)),d=p?p.title:`Fiche ${r.catId}`;if(c=`<strong>Fiche cibl\xE9e :</strong> ${w(d)}<br>`,r.data.summary){let f=r.data.summary.length>200?w(r.data.summary.substring(0,200))+"...":w(r.data.summary);c+=`<strong>Proposition Synth\xE8se (extrait) :</strong><div class="suggestion-diff-container">${f}</div>`}if(r.data.ordonnance){let f=r.data.ordonnance.length>150?w(r.data.ordonnance.substring(0,150))+"...":w(r.data.ordonnance);c+=`<strong>Proposition Ordonnance (extrait) :</strong><div class="suggestion-diff-container">${f}</div>`}}i+=`
        <div class="suggestion-card" data-sug-id="${w(r.id)}">
          <div class="suggestion-header">
            <span class="suggestion-badge ${s}">${o}</span>
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
      `}),t.innerHTML=i,t.querySelectorAll('[data-action="approve"]').forEach(r=>{r.addEventListener("click",async a=>{let s=a.target.closest(".suggestion-card");if(!s)return;let o=s.getAttribute("data-sug-id");o&&window.handleApproveSuggestion&&await window.handleApproveSuggestion(o)})}),t.querySelectorAll('[data-action="review"]').forEach(r=>{r.addEventListener("click",async a=>{let s=a.target.closest(".suggestion-card");if(!s)return;let o=s.getAttribute("data-sug-id");o&&window.handleReviewSuggestion&&await window.handleReviewSuggestion(o)})}),t.querySelectorAll('[data-action="reject"]').forEach(r=>{r.addEventListener("click",async a=>{let s=a.target.closest(".suggestion-card");if(!s)return;let o=s.getAttribute("data-sug-id");o&&window.handleRejectSuggestion&&await window.handleRejectSuggestion(o)})})}catch(n){console.error("Failed to load suggestions:",n),t.innerHTML='<p class="text-danger text-center" style="padding: 10px 0;">Erreur lors du chargement des propositions.</p>'}}var oe,jt,Vt,Ut,Wt,Gt,Kt,ia,oa,Yt,ra,Qt=null;function sa(){let e=l.allCats.length,t=l.allCats.filter(r=>r.status==="done").length,n=l.allCats.filter(r=>r.status==="doing").length,i=l.isAdmin?1:0;return`${e}|${t}|${n}|${i}`}function Ga(e){if(!Array.isArray(e)||e.length===0)return[];let t=["urgence","aigu","choc","d\xE9tresse","h\xE9morragie","coma","convulsion","douleur","br\xFBlure","intoxication","anaphylaxie","asthme","c\xE9phal\xE9e"],n=e.filter(c=>{let p=(c.title||"").toLowerCase(),d=(c.red_flags||"").toLowerCase();return t.some(f=>p.includes(f)||d.includes(f))}),i=n.length>=4?n:e,r=new Date,s=(r.getFullYear()*1e4+(r.getMonth()+1)*100+r.getDate())%i.length,o=[];for(let c=0;c<Math.min(4,i.length);c++)o.push(i[(s+c)%i.length]);return o}function la(e,t){oe=document.getElementById("welcome-screen"),jt=document.getElementById("workspace"),Vt=document.getElementById("sidebar"),Ut=document.getElementById("dash-mastery-rate"),Wt=document.getElementById("dash-count-done"),Gt=document.getElementById("dash-count-doing"),Kt=document.getElementById("dash-count-todo"),ia=document.getElementById("dash-resume-list"),oa=document.getElementById("dash-categories-progress"),Yt=document.getElementById("admin-moderation-panel"),ra=document.getElementById("suggestions-list");let n=document.getElementById("brand-logo"),i=document.getElementById("mobile-brand-logo");n&&n.addEventListener("click",()=>ue(e)),i&&i.addEventListener("click",()=>ue(e)),aa(t);function r(){let h=document.getElementById("emergency-shortcuts-chips-container");if(!h||!l.allCats||l.allCats.length===0)return;let L=Ga(l.allCats);h.innerHTML="",L.forEach(_=>{let A=document.createElement("button");A.className="emergency-chip",A.innerHTML=`<i class="fa-solid fa-heart-pulse"></i> <span>${w(_.title)}</span>`,A.onclick=()=>{e&&e(_)},h.appendChild(A)})}let a=document.getElementById("omni-search-input"),s=document.getElementById("omni-search-btn"),o=document.getElementById("omni-search-results");async function c(){if(!a||!o)return;let h=a.value.trim().toLowerCase();if(!h){o.style.display="none";return}let L=[];(l.allCats||[]).forEach(S=>{let N=(S.title||"").toLowerCase(),O=(S.category||"").toLowerCase(),g=(S.summary||"").toLowerCase(),I=(S.ordonnance||"").toLowerCase(),T=Array.isArray(S.search_keywords)?S.search_keywords.join(" ").toLowerCase():Array.isArray(S.pdf_keywords)?S.pdf_keywords.join(" ").toLowerCase():"",$=Array.isArray(S.sub_cats)?S.sub_cats.map(H=>`${H.label||""} ${H.summary||""} ${H.ordonnance||""}`).join(" ").toLowerCase():"";if((N.includes(h)||O.includes(h)||g.includes(h)||I.includes(h)||T.includes(h)||$.includes(h))&&L.length<6){let H=-1;if(Array.isArray(S.sub_cats)&&S.sub_cats.length>0&&!N.includes(h)&&!O.includes(h))for(let M=0;M<S.sub_cats.length;M++){let G=S.sub_cats[M];if(`${(G.label||"").toLowerCase()} ${(G.summary||"").toLowerCase()} ${(G.ordonnance||"").toLowerCase()}`.includes(h)){H=M;break}}L.push({cat:S,matchedSubIdx:H})}});let _=(l.allPdfs||[]).filter(S=>!S||typeof S!="string"?!1:S.toLowerCase().includes(h)).slice(0,4);if(L.length===0&&_.length===0){o.innerHTML=`
        <div style="padding: 14px; font-size: 12.5px; color: var(--text-muted); text-align: center;">
          Aucun r\xE9sultat direct pour "<strong>${w(h)}</strong>".
          <div style="margin-top: 8px;">
            <button id="omni-search-pdf-deep" class="action-btn" style="display: inline-flex; font-size: 11.5px; margin: 0 auto; gap: 6px;">
              <i class="fa-solid fa-file-magnifying-glass" style="color: var(--color-primary);"></i> Fouiller le texte int\xE9gral des 78 Livres PDF \u2794
            </button>
          </div>
        </div>
      `,o.style.display="flex";let S=document.getElementById("omni-search-pdf-deep");S&&(S.onclick=()=>{o.style.display="none",window.openGlobalPdfSearch(h)});return}let A="";L.length>0&&(A+=`<div style="padding: 6px 10px; font-size: 10.5px; font-weight: 700; color: var(--text-secondary); background: rgba(0,0,0,0.15); border-bottom: 1px solid var(--border-color); display: flex; justify-content: space-between;"><span>FICHES CAT (${L.length})</span><span style="color: var(--color-primary); cursor: pointer;" id="omni-search-pdf-link"><i class="fa-solid fa-file-pdf"></i> Fouiller les PDFs \u2794</span></div>`,L.forEach(({cat:S,matchedSubIdx:N})=>{let O="";if(N>=0&&S.sub_cats[N]){let g=S.sub_cats[N].label||`Sous-fiche ${N+1}`,I=g.length>30?g.substring(0,27)+"\u2026":g;O=`<div style="font-size:9px; padding:1px 5px; margin-top:1px; border-radius:4px; background:rgba(168,85,247,0.12); color:#c084fc; border:1px solid rgba(168,85,247,0.25); white-space:nowrap; overflow:hidden; text-overflow:ellipsis;"><i class="fa-solid fa-arrow-turn-down" style="margin-right:2px;"></i> ${w(I)}</div>`}A+=`
          <div class="omni-result-item" data-cat-id="${S.id}" data-sub-idx="${N>=0?N+1:0}" style="padding: 8px 10px; border-radius: 6px; cursor: pointer; display: flex; align-items: center; justify-content: space-between; gap: 8px; transition: background 0.15s ease;">
            <div style="display: flex; flex-direction: column; gap: 2px; min-width: 0;">
              <strong style="font-size: 12px; color: var(--text-primary); text-overflow: ellipsis; overflow: hidden; white-space: nowrap;">${w(S.title)}</strong>
              <span style="font-size: 10px; color: var(--color-primary);">${w(S.category||"")}</span>
              ${O}
            </div>
            <span style="font-size: 10px; padding: 2px 6px; border-radius: 12px; background: rgba(255,255,255,0.05); color: var(--text-muted);">${S.status==="done"?"\u2705":S.status==="doing"?"\u23F3":"\u26AA"}</span>
          </div>
        `})),_.length>0&&(A+=`<div style="padding: 6px 10px; font-size: 10.5px; font-weight: 700; color: var(--color-success); background: rgba(0,0,0,0.15); border-top: 1px solid var(--border-color); border-bottom: 1px solid var(--border-color);">MANUELS & DOCUMENTS PDF (${_.length})</div>`,_.forEach(S=>{let N=S.replace(/^\d+[\s\-_]*/,"").replace(/\.pdf$/i,"").replace(/_/g," ");A+=`
          <a class="omni-result-item" href="pdf_viewer.html?file=${encodeURIComponent(S)}&page=1" style="padding: 8px 10px; border-radius: 6px; text-decoration: none; display: flex; align-items: center; justify-content: space-between; gap: 8px; transition: background 0.15s ease;">
            <div style="display: flex; align-items: center; gap: 8px; min-width: 0;">
              <i class="fa-solid fa-file-pdf" style="color: var(--color-danger); font-size: 14px;"></i>
              <strong style="font-size: 12px; color: var(--text-primary); text-overflow: ellipsis; overflow: hidden; white-space: nowrap;">${w(N)}</strong>
            </div>
            <span style="font-size: 10px; color: var(--color-primary); font-weight: 600;">Ouvrir \u2794</span>
          </a>
        `})),o.innerHTML=A,o.style.display="flex",o.querySelectorAll(".omni-result-item[data-cat-id]").forEach(S=>{S.onclick=()=>{let N=parseInt(S.getAttribute("data-cat-id"),10),O=parseInt(S.getAttribute("data-sub-idx")||"0",10),g=(l.allCats||[]).find(I=>I.id===N);g&&e&&(o.style.display="none",e(g,O))},S.onmouseenter=()=>{S.style.background="rgba(6, 182, 212, 0.1)"},S.onmouseleave=()=>{S.style.background="transparent"}});let P=document.getElementById("omni-search-pdf-link");P&&(P.onclick=()=>{o.style.display="none",window.openGlobalPdfSearch(h)})}a&&(a.addEventListener("input",()=>{clearTimeout(window._omniTimer),window._omniTimer=setTimeout(c,200)}),a.addEventListener("keydown",h=>{h.key==="Enter"&&c(),h.key==="Escape"&&o&&(o.style.display="none")})),s&&s.addEventListener("click",c),document.addEventListener("click",h=>{o&&o.style.display!=="none"&&(h.target.closest(".omni-search-container")||(o.style.display="none"))}),document.addEventListener("keydown",h=>{if((h.ctrlKey||h.metaKey)&&(h.key==="k"||h.key==="K")){h.preventDefault();let L=document.getElementById("omni-search-input"),_=document.getElementById("search-input"),A=document.getElementById("workspace");if(!(A&&A.style.display!=="none")&&L&&L.offsetParent!==null)L.focus(),L.select();else if(_){let S=document.getElementById("sidebar");S&&!S.classList.contains("open")&&window.innerWidth<=850&&S.classList.add("open"),_.focus(),_.select()}}});let p=document.getElementById("dash-quick-lib-card");if(p){let h=()=>{window.openStandaloneLibrary&&window.openStandaloneLibrary()};p.onclick=h,p.onkeydown=L=>{(L.key==="Enter"||L.key===" ")&&(L.preventDefault(),h())}}let d=document.getElementById("dash-quick-quiz-card");if(d){let h=()=>{let L=document.getElementById("start-quiz-nav-btn");L&&L.click()};d.onclick=h,d.onkeydown=L=>{(L.key==="Enter"||L.key===" ")&&(L.preventDefault(),h())}}window.openGlobalPdfSearch=function(h=""){window.openStandaloneLibrary&&window.openStandaloneLibrary(h)},window.renderDailyEmergencyChips=r;let f=document.getElementById("export-progress-btn");f&&f.addEventListener("click",()=>{let h=D("dr_cat_user_progress");if(!h||h==="{}"){y("Aucune progression enregistr\xE9e \xE0 exporter.","fa-circle-exclamation",3e3);return}let L=`drcat-progression-${new Date().toISOString().slice(0,10)}.json`;ht(L,"Sauvegarde Progression",h)});let u=document.getElementById("import-progress-btn"),m=document.getElementById("import-progress-file");u&&m&&(u.addEventListener("click",()=>{m.click()}),m.addEventListener("change",h=>{let L=h.target.files[0];if(!L)return;let _=new FileReader;_.onload=async A=>{try{let P=JSON.parse(A.target.result),S=Object.keys(P);S.length>0&&typeof P[S[0]]=="object"?(z("dr_cat_user_progress",JSON.stringify(P)),y("Progression import\xE9e avec succ\xE8s ! L'application va se recharger.","fa-circle-check",4e3),location.reload()):y("Format de fichier invalide.","fa-circle-exclamation",4e3)}catch(P){console.error(P),y("Erreur lors de la lecture du fichier d'importation.","fa-circle-exclamation",4e3)}},_.readAsText(L)}));let b=document.getElementById("admin-bulk-import-input"),E=document.getElementById("admin-bulk-import-trigger-btn"),v=document.getElementById("bulk-import-file-name"),x=document.getElementById("admin-bulk-import-submit-btn"),C=null;E&&b&&E.addEventListener("click",()=>b.click()),b&&b.addEventListener("change",h=>{let L=h.target.files[0];if(!L){v&&(v.textContent="Aucun fichier s\xE9lectionn\xE9"),x&&(x.disabled=!0,x.style.opacity="0.5",x.style.cursor="not-allowed"),C=null;return}v&&(v.textContent=L.name);let _=new FileReader;_.onload=A=>{try{let P=JSON.parse(A.target.result);if(!Array.isArray(P))throw new Error("Le fichier JSON doit contenir un tableau de fiches.");C=P,x&&(x.disabled=!1,x.style.opacity="1",x.style.cursor="pointer")}catch(P){y(`Erreur JSON: ${P.message}`,"fa-triangle-exclamation",4e3),v&&(v.textContent="Fichier JSON invalide"),x&&(x.disabled=!0,x.style.opacity="0.5",x.style.cursor="not-allowed"),C=null}},_.readAsText(L)}),x&&x.addEventListener("click",async()=>{if(C)try{x.disabled=!0,x.innerHTML='<i class="fa-solid fa-spinner fa-spin"></i> Importation...';let h=await bn(C);h.count>0&&h.skippedCount>0?y(`${h.count} fiches import\xE9es, ${h.skippedCount} ignor\xE9es (d\xE9j\xE0 existantes).`,"fa-circle-check",5e3):h.count===0&&h.skippedCount>0?y(`Aucune nouvelle fiche. Les ${h.skippedCount} fiches existaient d\xE9j\xE0.`,"fa-circle-exclamation",4e3):y(`${h.count} fiches import\xE9es avec succ\xE8s !`,"fa-circle-check",4e3),C=null,b&&(b.value=""),v&&(v.textContent="Aucun fichier s\xE9lectionn\xE9"),x.disabled=!0,x.style.opacity="0.5",x.style.cursor="not-allowed",x.innerHTML='<i class="fa-solid fa-cloud-arrow-up"></i> Importer',t&&await t()}catch(h){y(`\xC9chec de l'importation: ${h.message}`,"fa-triangle-exclamation",4e3),x.disabled=!1,x.innerHTML='<i class="fa-solid fa-cloud-arrow-up"></i> Importer'}});let B=document.getElementById("export-specialty-btn"),R=document.getElementById("export-specialty-select");B&&R&&B.addEventListener("click",()=>{let h=R.value;if(!h){y("Veuillez s\xE9lectionner une sp\xE9cialit\xE9.","fa-triangle-exclamation",3e3);return}let L=l.allCats.filter(_=>_.category===h).map(_=>({category:_.category,title:_.title,summary:_.summary,red_flags:_.red_flags,ordonnance:_.ordonnance,pdf_keywords:_.pdf_keywords||[]}));ht(`Fiches_DrCAT_${h.replace(/\s+/g,"_")}.json`,"Export Sp\xE9cialit\xE9",L),y(`Exportation r\xE9ussie de ${L.length} fiches !`,"fa-circle-check",3e3)})}function ue(e){l.activeCat=null,document.querySelectorAll(".cat-item").forEach(r=>r.classList.remove("active")),jt&&(jt.style.display="none"),oe&&(oe.style.display="flex");let t=document.getElementById("quiz-screen");t&&(t.style.display="none");let n=document.getElementById("library-screen");n&&(n.style.display="none"),window.innerWidth<=850&&Vt&&Vt.classList.remove("open");let i=sa();Qt===i&&oe&&oe.dataset.rendered==="true"||(Qt=i,Ke(e))}async function Ke(e){if(window.perf&&window.perf.startMeasure("dashboard.renderDashboard"),!oe||oe.style.display==="none")return;let t=document.getElementById("export-specialty-select");if(t){let d=Array.from(new Set(l.allCats.map(u=>u.category))).sort(),f=t.value;t.innerHTML='<option value="">Choisir sp\xE9cialit\xE9...</option>',d.forEach(u=>{let m=document.createElement("option");m.value=u,m.textContent=u,u===f&&(m.selected=!0),t.appendChild(m)})}let n=Jn(l.allCats),i=n.total,r=document.getElementById("total-cats-count");r&&(r.textContent=i);let a=i>0?Math.round(n.done/i*100):0;if(Ut){Ut.textContent=`${a}%`;let d=document.getElementById("dash-mastery-ring");if(d){let u=2*Math.PI*22,m=u-a/100*u;d.style.strokeDashoffset=m}}Wt&&(Wt.textContent=`${n.done} / ${i}`),Gt&&(Gt.textContent=`${n.doing} / ${i}`),Kt&&(Kt.textContent=`${n.todo} / ${i}`);let s=Xn(),o=document.getElementById("dash-streak-count");o&&(o.textContent=`${s} jour${s>1?"s":""}`);let c=l.allCats.filter(d=>d.status==="doing"||d.status==="done");Zn(ia,c,e),ea(oa,l.allCats),typeof window.renderDailyEmergencyChips=="function"&&window.renderDailyEmergencyChips();let p=document.getElementById("dash-first-run-banner");if(p){let d=l.allCats.some(f=>f.status!=="todo"||f.notes);p.style.display=d?"none":"flex"}Yt&&(Yt.style.display=l.isAdmin?"block":"none"),l.isAdmin&&await Ge(ra),Qt=sa(),oe&&(oe.dataset.rendered="true"),window.perf&&(window.perf.endMeasure("dashboard.renderDashboard"),window.perf.recordMilestone("dashboardReady"))}var ua="dr_cat_last_douaa_time",ca="dr_cat_last_douaa_idx";var Jt=[{id:1,badge:"\u0628\u0631 \u0627\u0644\u0648\u0627\u0644\u062F\u064A\u0646",verse:"\uFD3F \u0631\u0651\u064E\u0628\u0651\u0650 \u0627\u0631\u0652\u062D\u064E\u0645\u0652\u0647\u064F\u0645\u064E\u0627 \u0643\u064E\u0645\u064E\u0627 \u0631\u064E\u0628\u0651\u064E\u064A\u064E\u0627\u0646\u0650\u064A \u0635\u064E\u063A\u0650\u064A\u0631\u064B\u0627 \uFD3E",supplication:"\u0627\u0644\u0644\u0651\u064E\u0647\u064F\u0645\u0651\u064E \u0627\u063A\u0652\u0641\u0650\u0631\u0652 \u0644\u0650\u0645\u064F\u0639\u0650\u062F\u0651\u0650 \u0647\u064E\u0630\u064E\u0627 \u0627\u0644\u062A\u0651\u064E\u0637\u0652\u0628\u0650\u064A\u0642\u0650 \u0648\u064E\u0644\u0650\u0648\u064E\u0627\u0644\u0650\u062F\u064E\u064A\u0652\u0647\u0650 \u0648\u064E\u0627\u062C\u0652\u0639\u064E\u0644\u0652\u0647\u064F \u0635\u064E\u062F\u064E\u0642\u064E\u0629\u064B \u062C\u064E\u0627\u0631\u0650\u064A\u064E\u0629\u064B \u0639\u064E\u0646\u0652\u0647\u064F\u0645\u064E\u0627 \u{1F932}"},{id:2,badge:"\u0645\u063A\u0641\u0631\u0629 \u0648\u0631\u062D\u0645\u0629",verse:"\uFD3F \u0631\u064E\u0628\u0651\u064E\u0646\u064E\u0627 \u0627\u063A\u0652\u0641\u0650\u0631\u0652 \u0644\u0650\u064A \u0648\u064E\u0644\u0650\u0648\u064E\u0627\u0644\u0650\u062F\u064E\u064A\u0651\u064E \u0648\u064E\u0644\u0650\u0644\u0652\u0645\u064F\u0624\u0652\u0645\u0650\u0646\u0650\u064A\u0646\u064E \u064A\u064E\u0648\u0652\u0645\u064E \u064A\u064E\u0642\u064F\u0648\u0645\u064F \u0627\u0644\u0652\u062D\u0650\u0633\u064E\u0627\u0628\u064F \uFD3E",supplication:"\u0646\u064E\u0633\u0652\u0623\u064E\u0644\u064F\u0643\u064F\u0645 \u062F\u064E\u0639\u0652\u0648\u064E\u0629\u064B \u0635\u064E\u0627\u0644\u0650\u062D\u064E\u0629\u064B \u0628\u0650\u0638\u064E\u0647\u0652\u0631\u0650 \u0627\u0644\u063A\u064E\u064A\u0652\u0628\u0650 \u0644\u0650\u0644\u0637\u0651\u064E\u0628\u0650\u064A\u0628\u0650 \u0645\u064F\u0639\u0650\u062F\u0651\u0650 \u0627\u0644\u0639\u064E\u0645\u064E\u0644\u0650 \u0648\u064E\u0648\u064E\u0627\u0644\u0650\u062F\u064E\u064A\u0652\u0647\u0650"},{id:3,badge:"\u062F\u0639\u0627\u0621 \u062C\u0627\u0645\u0639",verse:"\uFD3F \u0631\u0651\u064E\u0628\u0651\u0650 \u0627\u063A\u0652\u0641\u0650\u0631\u0652 \u0644\u0650\u064A \u0648\u064E\u0644\u0650\u0648\u064E\u0627\u0644\u0650\u062F\u064E\u064A\u0651\u064E \u0648\u064E\u0644\u0650\u0645\u064E\u0646 \u062F\u064E\u062E\u064E\u0644\u064E \u0628\u064E\u064A\u0652\u062A\u0650\u064A\u064E \u0645\u064F\u0624\u0652\u0645\u0650\u0646\u064B\u0627 \uFD3E",supplication:"\u0627\u0644\u0644\u0651\u064E\u0647\u064F\u0645\u0651\u064E \u0627\u062C\u0652\u0632\u0650 \u0648\u064E\u0627\u0644\u0650\u062F\u064E\u064A\u0652\u0646\u064E\u0627 \u0639\u064E\u0646\u0651\u064E\u0627 \u062E\u064E\u064A\u0652\u0631\u064E \u0627\u0644\u062C\u064E\u0632\u064E\u0627\u0621\u0650 \u0648\u064E\u0627\u0631\u0652\u0641\u064E\u0639\u0652 \u062F\u064E\u0631\u064E\u062C\u064E\u0627\u062A\u0650\u0647\u0650\u0645\u064E\u0627 \u0641\u0650\u064A \u0639\u0650\u0644\u0651\u0650\u064A\u0651\u0650\u064A\u0646\u064E"},{id:4,badge:"\u0639\u0644\u0645 \u0646\u0627\u0641\u0639 \u0648\u0634\u0641\u0627\u0621",verse:"\xAB \u0627\u0644\u0644\u0651\u064E\u0647\u064F\u0645\u0651\u064E \u0627\u0646\u0652\u0641\u064E\u0639\u0652\u0646\u064E\u0627 \u0628\u0650\u0645\u064E\u0627 \u0639\u064E\u0644\u0651\u064E\u0645\u0652\u062A\u064E\u0646\u064E\u0627\u060C \u0648\u064E\u0639\u064E\u0644\u0651\u0650\u0645\u0652\u0646\u064E\u0627 \u0645\u064E\u0627 \u064A\u064E\u0646\u0652\u0641\u064E\u0639\u064F\u0646\u064E\u0627\u060C \u0648\u064E\u0632\u0650\u062F\u0652\u0646\u064E\u0627 \u0639\u0650\u0644\u0652\u0645\u064B\u0627 \xBB",supplication:"\u0627\u0644\u0644\u0651\u064E\u0647\u064F\u0645\u0651\u064E \u0627\u0634\u0652\u0641\u0650 \u0643\u064F\u0644\u0651\u064E \u0645\u064E\u0631\u0650\u064A\u0636\u064D\u060C \u0648\u064E\u0628\u064E\u0627\u0631\u0650\u0643\u0652 \u0641\u0650\u064A \u0635\u064E\u0627\u062D\u0650\u0628\u0650 \u0647\u064E\u0630\u064E\u0627 \u0627\u0644\u062A\u0651\u064E\u0637\u0652\u0628\u0650\u064A\u0642\u0650 \u0648\u064E\u0648\u064E\u0627\u0644\u0650\u062F\u064E\u064A\u0652\u0647\u0650"},{id:5,badge:"\u0634\u0643\u0631 \u0627\u0644\u0646\u0639\u0645\u0629",verse:"\uFD3F \u0631\u064E\u0628\u0651\u0650 \u0623\u064E\u0648\u0652\u0632\u0650\u0639\u0652\u0646\u0650\u064A \u0623\u064E\u0646\u0652 \u0623\u064E\u0634\u0652\u0643\u064F\u0631\u064E \u0646\u0650\u0639\u0652\u0645\u064E\u062A\u064E\u0643\u064E \u0627\u0644\u0651\u064E\u062A\u0650\u064A \u0623\u064E\u0646\u0652\u0639\u064E\u0645\u0652\u062A\u064E \u0639\u064E\u0644\u064E\u064A\u0651\u064E \u0648\u064E\u0639\u064E\u0644\u064E\u0649\u0670 \u0648\u064E\u0627\u0644\u0650\u062F\u064E\u064A\u0651\u064E \uFD3E",supplication:"\u0627\u0644\u0644\u0651\u064E\u0647\u064F\u0645\u0651\u064E \u062A\u064E\u0642\u064E\u0628\u0651\u064E\u0644\u0652 \u0647\u064E\u0630\u064E\u0627 \u0627\u0644\u062C\u064F\u0647\u0652\u062F\u064E \u062E\u064E\u0627\u0644\u0650\u0635\u064B\u0627 \u0644\u0650\u0648\u064E\u062C\u0652\u0647\u0650\u0643\u064E \u0627\u0644\u0643\u064E\u0631\u0650\u064A\u0645\u0650 \u0639\u064E\u0646\u0651\u064E\u0627 \u0648\u064E\u0639\u064E\u0646\u0652 \u0648\u064E\u0627\u0644\u0650\u062F\u064E\u064A\u0652\u0646\u064E\u0627"}],fa=null,be=null,dt=9e3,Zt=0;function Ya(){let e=-1;try{e=parseInt(localStorage.getItem(ca)||"-1",10)}catch{}let t=Jt.map((i,r)=>r).filter(i=>i!==e);t.length===0&&(t=Jt.map((i,r)=>r));let n=t[Math.floor(Math.random()*t.length)];try{localStorage.setItem(ca,String(n))}catch{}return Jt[n]}function ma(){try{let e=localStorage.getItem(ua);if(!e)return!0;let t=parseInt(e,10);return isNaN(t)?!0:Date.now()-t>=12e5}catch{return!1}}function Qa(){try{localStorage.setItem(ua,String(Date.now()))}catch{}}function Xt(e=!1){if(!e&&!ma()||document.getElementById("dr-cat-douaa-toast"))return;let t=Ya();Qa();let n=document.createElement("aside");n.id="dr-cat-douaa-toast",n.className="douaa-toast-container",n.setAttribute("role","alert"),n.setAttribute("aria-live","polite"),n.innerHTML=`
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
  `,document.body.appendChild(n),fa=n,requestAnimationFrame(()=>{n.classList.add("douaa-visible")}),Ja(),n.addEventListener("mouseenter",da),n.addEventListener("mouseleave",pa),n.addEventListener("touchstart",da,{passive:!0}),n.addEventListener("touchend",pa,{passive:!0});let i=n.querySelector("#douaa-close-trigger");i&&i.addEventListener("click",()=>{pt()});let r=n.querySelector("#douaa-ameen-trigger");r&&r.addEventListener("click",()=>{r.classList.add("douaa-ameen-accepted"),r.innerHTML="<span>\u062C\u0632\u0627\u0643\u0645 \u0627\u0644\u0644\u0647 \u062E\u064A\u0631\u0627\u064B \u{1F49A}</span>",clearTimeout(be),setTimeout(()=>{pt()},1400)})}function Ja(){clearTimeout(be),Zt=Date.now(),dt=9e3,be=setTimeout(()=>{pt()},9e3)}function da(){clearTimeout(be);let e=Date.now()-Zt;dt=Math.max(1e3,dt-e)}function pa(){clearTimeout(be),Zt=Date.now(),be=setTimeout(()=>{pt()},dt)}function pt(){clearTimeout(be);let e=document.getElementById("dr-cat-douaa-toast");e&&(e.classList.remove("douaa-visible"),e.classList.add("douaa-hiding"),setTimeout(()=>{e&&e.parentNode&&e.parentNode.removeChild(e),fa=null},400))}function ga(){setTimeout(()=>{Xt(!1)},5e3),setInterval(()=>{ma()&&!document.getElementById("dr-cat-douaa-toast")&&Xt(!1)},120*1e3)}typeof window<"u"&&(window.showDouaaToast=Xt);function ya(e={}){let t=window.Capacitor&&window.Capacitor.Plugins&&window.Capacitor.Plugins.App;return!t||typeof t.addListener!="function"?!1:(t.addListener("backButton",()=>{try{if(e.isModalOpen&&e.isModalOpen()){e.closeModal&&e.closeModal();return}if(e.isDrawerOpen&&e.isDrawerOpen()){e.closeDrawer&&e.closeDrawer();return}if(e.isDeepView&&e.isDeepView()){e.goToDashboard&&e.goToDashboard();return}e.confirmExit&&e.confirmExit()}catch(n){console.warn("[BackButton] handler error:",n)}}),!0)}function ba(){let e=window.Capacitor&&window.Capacitor.Plugins&&window.Capacitor.Plugins.Keyboard;if(!e||typeof e.addListener!="function")return!1;let t=n=>{document.documentElement.style.setProperty("--capacitor-keyboard-height",`${n}px`)};return e.addListener("keyboardWillShow",n=>{try{let i=n&&typeof n.keyboardHeight=="number"?n.keyboardHeight:0;t(i);let r=document.activeElement;r&&(r.tagName==="INPUT"||r.tagName==="TEXTAREA")&&r.scrollIntoView({block:"center",behavior:"smooth"})}catch(i){console.warn("[Keyboard] show error:",i)}}),e.addListener("keyboardWillHide",()=>{try{t(0)}catch(n){console.warn("[Keyboard] hide error:",n)}}),!0}function va(e={}){let t=window.Capacitor&&window.Capacitor.Plugins&&window.Capacitor.Plugins.App;return!t||typeof t.addListener!="function"?!1:(typeof e.onPause=="function"&&t.addListener("pause",()=>{try{e.onPause()}catch(n){console.warn("[Lifecycle] pause error:",n)}}),typeof e.onResume=="function"&&t.addListener("resume",()=>{try{e.onResume()}catch(n){console.warn("[Lifecycle] resume error:",n)}}),!0)}var ha=null,Xa=()=>ha||(ha=import("./chunk-HDOXPEFD.js")),xa={light:"#f1f5f9",dark:"#090d16"};function wa(e){let t=e?xa.light:xa.dark,n=document.querySelector('meta[name="theme-color"]:not([media])');n||(n=document.createElement("meta"),n.name="theme-color",document.head.appendChild(n)),n.setAttribute("content",t);try{let i=window.Capacitor?.Plugins?.StatusBar;i&&(i.setBackgroundColor?.({color:t}),i.setStyle?.({style:e?"LIGHT":"DARK"}))}catch{}}window.handleAdminError=async function(e){if(e&&(e.message==="403 Forbidden"||e.message==="401 Unauthorized")){let t=prompt("Action r\xE9serv\xE9e aux administrateurs. Saisissez le mot de passe admin pour d\xE9verrouiller :");if(t)try{let n=await gt(t);if(n.success&&n.token)return y("Connexion r\xE9ussie ! L'action va \xEAtre relanc\xE9e.","fa-circle-check",3e3),location.reload(),!0;y("Mot de passe incorrect.","fa-circle-exclamation",3e3)}catch(n){console.error("Login failed:",n),y("Erreur lors de la connexion.","fa-circle-exclamation",4e3)}return!0}return!1};var en,W,tn,nn,ve;async function Ea(){if(Rn(),window.addEventListener("error",v=>{y("Une erreur d'ex\xE9cution est survenue. D\xE9tails enregistr\xE9s dans l'onglet Diagnostic.","fa-triangle-exclamation",7e3)}),window.addEventListener("unhandledrejection",v=>{y("Erreur r\xE9seau ou r\xE9ponse de base de donn\xE9es non reconnue.","fa-circle-exclamation",5e3)}),"serviceWorker"in navigator){let v=location.hostname.includes("ngrok")||location.hostname.includes("loca.lt")||location.hostname.includes("trycloudflare.com")||location.hostname.includes("cfargotunnel.com");J||v?(navigator.serviceWorker.getRegistrations().then(x=>{x.forEach(C=>C.unregister())}),caches.keys().then(x=>x.forEach(C=>caches.delete(C))),console.log("[Startup] Service worker disabled on standalone app / remote tunnel host to prevent cache deadlocks.")):location.hostname==="localhost"||location.hostname==="127.0.0.1"||sn.some(C=>C.isDevHostname(location.hostname))||window.addEventListener("load",()=>{navigator.serviceWorker.register("/service-worker.js").then(C=>{console.log("PWA SW registered:",C.scope),C&&C.addEventListener("updatefound",()=>{let B=C.installing;B&&B.addEventListener("statechange",()=>{B.state==="installed"&&navigator.serviceWorker.controller&&y("Mise \xE0 jour disponible. Rechargez pour l'appliquer.","fa-rotate",8e3)})})}).catch(C=>console.error("PWA SW failed:",C))})}(function(){try{let x=document.createElement("div");x.className="offline-badge",x.setAttribute("role","status"),x.setAttribute("aria-live","polite"),x.innerHTML='<i class="fa-solid fa-wifi" style="transform: rotate(45deg);"></i> Mode hors-ligne',document.body.appendChild(x),window.addEventListener("offline",()=>x.classList.add("show")),window.addEventListener("online",()=>x.classList.remove("show"))}catch{}})();let e=document.getElementById("theme-toggle-btn"),t=document.getElementById("theme-toggle-icon"),n=document.documentElement,i=n.classList.contains("light-theme");try{window.Capacitor?.Plugins?.StatusBar?.setOverlaysWebView?.({overlay:!1})}catch{}wa(i),t&&(t.classList.toggle("fa-sun",i),t.classList.toggle("fa-moon",!i)),requestAnimationFrame(()=>{requestAnimationFrame(()=>n.classList.remove("theme-booting"))});let r=/firefox|fxios/i.test(navigator.userAgent);r&&n.classList.add("is-firefox"),e&&e.addEventListener("click",()=>{e.blur();let v=()=>{let A=n.classList.toggle("light-theme");z("theme",A?"light":"dark"),n.style.colorScheme=A?"light":"dark",t&&(t.classList.toggle("fa-sun",A),t.classList.toggle("fa-moon",!A)),wa(A)},x=window.matchMedia&&window.matchMedia("(prefers-reduced-motion: reduce)").matches;if(!document.startViewTransition||x){v();return}let C=e.getBoundingClientRect(),B=C.left+C.width/2,R=C.top+C.height/2,h=Math.hypot(Math.max(B,window.innerWidth-B),Math.max(R,window.innerHeight-R));n.style.setProperty("--theme-x",`${B}px`),n.style.setProperty("--theme-y",`${R}px`);let L=document.startViewTransition(()=>{v()}),_=r?750:520;L.ready.then(()=>{document.documentElement.animate({clipPath:[`circle(0px at ${B}px ${R}px)`,`circle(${h}px at ${B}px ${R}px)`]},{duration:_,easing:"cubic-bezier(0.25, 1, 0.5, 1)",pseudoElement:"::view-transition-new(root)"})}).catch(()=>{})});let a=document.getElementById("about-legal-header");a&&a.addEventListener("click",()=>{let v=document.getElementById("about-legal-content"),x=document.getElementById("about-legal-chevron");if(!v||!x)return;let C=v.style.maxHeight==="500px";v.style.maxHeight=C?"0px":"500px",x.style.transform=C?"rotate(0deg)":"rotate(180deg)"}),On(V,ni,Qe),Qn(ti,ai,ii),la(V,oi),Xa().then(v=>v.initQuiz(V)).catch(v=>console.warn("[lazy] quiz init failed",v)),en=document.getElementById("add-cat-btn"),W=document.getElementById("add-cat-modal"),tn=document.getElementById("close-add-cat-modal-btn"),nn=document.getElementById("cancel-add-cat-btn"),ve=document.getElementById("add-cat-form"),en&&en.addEventListener("click",()=>{let v=document.getElementById("new-cat-category-select"),x=document.getElementById("new-cat-category");if(v){let C=[...new Set(l.allCats.map(B=>B.category))].filter(Boolean).sort();v.innerHTML=`
          <option value="">-- S\xE9lectionner une sp\xE9cialit\xE9 existante --</option>
          ${C.map(B=>`<option value="${B}">${B}</option>`).join("")}
        `,v.onchange=()=>{v.value&&x&&(x.value=v.value)}}W&&(W.classList.remove("modal-overlay--sheet"),W.style.display="flex")});function s(){if(!W)return;if(window.matchMedia&&window.matchMedia("(prefers-reduced-motion: reduce)").matches){W.style.display="none",ve&&ve.reset();return}W.classList.add("modal-closing");let v=x=>{x.target!==W&&x.target!==W.querySelector(".modal-card")||(W.removeEventListener("animationend",v),W.classList.remove("modal-closing"),W.style.display="none",ve&&ve.reset())};W.addEventListener("animationend",v),setTimeout(()=>v({target:W}),600)}tn&&tn.addEventListener("click",s),nn&&nn.addEventListener("click",s),ve&&ve.addEventListener("submit",async v=>{v.preventDefault();let x=document.getElementById("new-cat-title").value.trim(),C=document.getElementById("new-cat-category").value.trim(),B=document.getElementById("new-cat-red-flags").value.trim(),R=document.getElementById("new-cat-summary").value.trim(),h=document.getElementById("new-cat-ordonnance").value.trim(),L=document.getElementById("new-cat-pdf-keywords").value,_=L?L.split(",").map(A=>A.trim()).filter(A=>A):[];if(l.isAdmin)try{let A=await yn({title:x,category:C,red_flags:B,summary:R,ordonnance:h,pdf_keywords:_});if(A.success){s();try{let S=F(D("dr_cat_local_overrides"),{});S[A.cat.id]&&(delete S[A.cat.id],z("dr_cat_local_overrides",JSON.stringify(S)))}catch{}y(`La fiche CAT "${x}" a \xE9t\xE9 ajout\xE9e avec succ\xE8s !`,"fa-circle-check",3e3),await Qe();let P=l.allCats.find(S=>S.id===A.cat.id);P&&V(P)}else y("Erreur : "+A.error,"fa-circle-exclamation",4e3)}catch(A){if(console.error(A),window.handleAdminError&&await window.handleAdminError(A))return;y("Erreur lors de l'enregistrement de la nouvelle CAT.","fa-circle-exclamation",4e3)}else{if(!confirm(`Attention : Cette nouvelle fiche ne sera pas ajout\xE9e directement. Elle sera envoy\xE9e \xE0 l'administrateur du site pour relecture et validation avant d'\xEAtre int\xE9gr\xE9e.

Souhaitez-vous envoyer cette proposition ?`))return;try{await Re(Me,{type:"add",data:{title:x,category:C,red_flags:B,summary:R,ordonnance:h,pdf_keywords:_}},`Votre proposition de nouvelle fiche "${x}" a \xE9t\xE9 envoy\xE9e \xE0 l'administrateur pour validation.`)&&s()}catch(P){console.error(P),y("Erreur lors de l'envoi de la proposition.","fa-circle-exclamation",4e3)}}});let o=document.getElementById("admin-login-btn");o&&o.addEventListener("click",async()=>{if(l.isAdmin)confirm("Voulez-vous vous d\xE9connecter du mode administrateur ?")&&(await pn(),y("D\xE9connexion r\xE9ussie.","fa-circle-check",3e3),location.reload());else{let v=prompt("Veuillez saisir le mot de passe administrateur :");if(v)try{let x=await gt(v);x.success&&x.token?(y("Connexion r\xE9ussie !","fa-circle-check",3e3),location.reload()):y(x.error||"Mot de passe incorrect.","fa-circle-exclamation",3e3)}catch(x){console.error("Login error:",x),y("Erreur lors de la connexion.","fa-circle-exclamation",4e3)}}}),o&&(o.style.display="none"),window.addEventListener("online",()=>{y("Connexion r\xE9seau d\xE9tect\xE9e. Synchronisation...","fa-wifi",4e3),Ye()}),window.addEventListener("offline",()=>{y("Connexion perdue. Mode hors-ligne activ\xE9.","fa-circle-xmark",6e3),J&&(et(re.ANDROID_OFFLINE),l.isOnlineAtStartup=!1)}),window.addEventListener("drcat-app-mode-changed",()=>{Sa()});let c=document.getElementById("legal-modal"),p=[document.getElementById("open-legal-modal-btn"),document.getElementById("open-legal-from-banner")],d=document.getElementById("close-legal-modal-btn"),f=document.getElementById("legal-consent-banner"),u=document.getElementById("accept-legal-btn"),m=document.getElementById("dismiss-legal-btn"),b=()=>{f&&(f.classList.add("hidden"),f.style.display="none")};D("drcat_legal_consent_v1")?b():f&&(f.style.display="flex",setTimeout(()=>f.classList.remove("hidden"),500)),u&&u.addEventListener("click",()=>{z("drcat_legal_consent_v1","true"),b()}),m&&m.addEventListener("click",()=>{z("drcat_legal_consent_v1","dismissed"),b()}),p.forEach(v=>{v&&v.addEventListener("click",x=>{x.preventDefault(),c&&(c.style.display="flex",c.classList.add("active"))})});let E=()=>{c&&(c.style.display="none",c.classList.remove("active"))};d&&d.addEventListener("click",E),c&&c.addEventListener("click",v=>{v.target===c&&E()}),window.addEventListener("keydown",v=>{let x=document.activeElement.tagName==="INPUT"||document.activeElement.tagName==="TEXTAREA";if(v.key.toLowerCase()==="s"&&!x){v.preventDefault();let C=document.getElementById("search-input");C&&(C.focus(),C.select())}if(v.key==="Escape"){let C=document.getElementById("add-cat-modal");if(C&&C.style.display!=="none"){C.style.display="none";let R=document.getElementById("add-cat-form");R&&R.reset()}let B=document.getElementById("legal-modal");B&&(B.classList.contains("active")||B.style.display!=="none")&&E()}if((v.key==="ArrowDown"||v.key==="ArrowUp")&&!x){v.preventDefault();let C=document.querySelector(".cat-item.active"),B=Array.from(document.querySelectorAll(".cat-item"));if(B.length===0)return;let R=0;if(C){let L=B.indexOf(C);v.key==="ArrowDown"?R=(L+1)%B.length:R=(L-1+B.length)%B.length}let h=B[R];h&&(h.click(),h.scrollIntoView({block:"nearest",behavior:se()?"auto":"smooth"}))}}),await Za(),Ce(),ga()}document.readyState==="loading"?document.addEventListener("DOMContentLoaded",Ea):Ea();var Ca=!1,Be=null,an=!1;async function Za(){let e=document.getElementById("app-loading-overlay"),t=document.getElementById("app-loading-bar");e&&e.classList.remove("hidden"),t&&(t.style.width="5%");let n=p=>{window.setLoaderProgress?window.setLoaderProgress(p):t&&(t.style.width=`${p}%`)};n(10);let i=Ze();console.log(`[Startup] Mode: ${i}`),n(20);try{l.isAdmin=await un(),console.log("Admin mode:",l.isAdmin)}catch(p){console.warn("[Startup] Admin status check failed.",p),l.isAdmin=!1}Sa(),n(40);let r=[];try{r=await tt(),window.perf&&window.perf.recordMilestone("catsFetched")}catch(p){console.error("[Startup Error] Fetch CATs failed, using emergency fallback.",p);try{let d=await fetch("data/cats_db.json",{headers:{"x-app-key":mt}});if(!d.ok)throw new Error("Emergency fallback failed");r=await d.json(),y("Chargement de secours local.","fa-triangle-exclamation",4e3)}catch(d){console.error("[Startup Critical] No data available.",d),y("Base de donn\xE9es indisponible.","fa-circle-exclamation",9e3),e&&e.classList.add("hidden");let f=window.Capacitor&&window.Capacitor.Plugins&&window.Capacitor.Plugins.SplashScreen;if(f&&typeof f.hide=="function")try{f.hide()}catch{}return}}n(60);let a=Q(),s={},o=[];try{s=F(D("dr_cat_local_overrides"),{}),o=F(D("dr_cat_custom_created_cats"),[]).map(d=>({...d,isOffline:!0}))}catch{}J&&(r=r.filter(p=>!s[p.id]||!s[p.id].deleted),r=[...r,...o.filter(p=>!s[p.id]||!s[p.id].deleted)]),l.allCats=Xe(r,a,s),n(75);try{kt(l.allCats),Ne(l.allCats,V),ut(),Ke(V)}catch(p){console.error("[Startup Render Error]",p)}n(90);try{Bt()}catch(p){console.error("[Startup Navigation Error]",p)}setTimeout(()=>{Promise.all([mn().catch(p=>(console.warn("[Background] PDF fetch failed, using local list.",p),fetch("data/pdf_list.json").then(d=>d.json()).catch(()=>[]))),Sn().catch(p=>(console.warn("[Background] Index status failed.",p),{}))]).then(([p,d])=>{l.allPdfs=p,l.pdfIndexStatus=d,Ce(),l.activeCat&&Te(l.activeCat,!0),console.log("[Background] PDFs loaded.")}).catch(p=>console.error("[Background] PDF load failed:",p))},100),n(100),e&&e.classList.add("hidden");let c=window.Capacitor&&window.Capacitor.Plugins&&window.Capacitor.Plugins.SplashScreen;c&&typeof c.hide=="function"&&setTimeout(()=>{try{c.hide()}catch{}},350),An(),ya({isModalOpen:()=>!!document.querySelector('.modal-overlay:not([style*="display: none"])'),closeModal:()=>{let p=document.querySelector('.modal-overlay:not([style*="display: none"])');p&&(p.id==="add-cat-modal"?closeAddCatModal():Pe(p))},isDrawerOpen:()=>{let p=document.querySelector(".sidebar");return!!p&&p.classList.contains("open")},closeDrawer:()=>{let p=document.querySelector(".sidebar");p&&p.classList.remove("open")},isDeepView:()=>{let p=document.getElementById("workspace"),d=document.getElementById("quiz-screen");return p&&p.style.display!=="none"||d&&d.style.display!=="none"},goToDashboard:()=>ue(V),confirmExit:()=>{if(window.__drCatExitArmed){let p=window.Capacitor&&window.Capacitor.Plugins&&window.Capacitor.Plugins.App;p&&typeof p.exitApp=="function"&&p.exitApp();return}window.__drCatExitArmed=!0,y("Appuyez encore sur Retour pour quitter.","fa-right-from-bracket",2e3),setTimeout(()=>{window.__drCatExitArmed=!1},2e3)}}),Ca||(Ca=!0,setTimeout(()=>{Ye(),Be=setInterval(Ye,3e4)},1e3)),va({onPause:()=>{Be&&(clearInterval(Be),Be=null,an=!0)},onResume:()=>{an&&!Be&&(an=!1,Ye(),Be=setInterval(Ye,3e4))}}),ba()}async function Ye(){if(!(!J||!dn())){console.log("[Background Sync] Checking for remote updates...");try{let e=cn(),t=!1;for(let i of e)try{let r=new AbortController,a=setTimeout(()=>r.abort(),5e3),s={...me(),...ln(i)},o=fe("/api/search-status",i);if(!(await fetch(o,{signal:r.signal,headers:s})).ok)throw new Error("Server returned error status");clearTimeout(a),t=!0;break}catch{}let n=Ze()===re.ANDROID_OFFLINE;if(t){console.log("[Background Sync] Server reachable! Fetching latest data..."),et(re.ANDROID_ONLINE),l.isOnlineAtStartup=!0;let i=D("dr_cat_last_sync_time"),r=i?parseInt(i):null,a=await tt(r),s=!1,o=null,c=[];try{c=F(D("dr_cat_custom_created_cats"),[])}catch{c=[]}let p=new Set(c.map(m=>m.id));if(a.activeIds){o=new Set(a.activeIds.split(",").map(b=>parseInt(b)));let m=(l.allCats||[]).filter(b=>!Je(b,p));for(let b of m)if(!o.has(b.id)){s=!0;break}}if(a.length===0&&!s){console.log("[Background Sync] Remote database is in sync. No action needed."),z("dr_cat_last_sync_time",Date.now().toString()),n&&y("\u{1F4E1} Connexion serveur \xE9tablie. Donn\xE9es synchronis\xE9es !","fa-cloud-arrow-up",4e3);return}let d=(l.allCats||[]).filter(m=>!Je(m,p)),f=a.length<d.length*.7,u=s;if(!u){if(f)for(let m of a){let b=d.find(E=>E.id===m.id);if(!b||b.title!==m.title||b.summary!==m.summary||b.ordonnance!==m.ordonnance){u=!0;break}}else if(u=d.length!==a.length,!u)for(let m of a){let b=d.find(E=>E.id===m.id);if(!b||b.title!==m.title||b.summary!==m.summary||b.ordonnance!==m.ordonnance){u=!0;break}}}if(u){console.log("[Background Sync] Server changes detected! Offering update...");let m=document.createElement("span");m.id="update-app-toast-btn",m.style.cssText="color:#06b6d4;font-weight:700;text-decoration:underline;cursor:pointer;",m.textContent="Actualiser ?",m.addEventListener("click",b=>{b.preventDefault(),ei(a,f,o);let E=document.getElementById("drcat-toast");E&&E.remove(),y("Mise \xE0 jour appliqu\xE9e avec succ\xE8s !","fa-circle-check",3e3)}),y("Nouvelles fiches ou modifications disponibles \u2014","fa-arrows-rotate",15e3,m)}else console.log("[Background Sync] Remote database is in sync. No action needed."),z("dr_cat_last_sync_time",Date.now().toString());n&&y("\u{1F4E1} Connexion serveur \xE9tablie. Donn\xE9es synchronis\xE9es !","fa-cloud-arrow-up",4e3)}else console.log("[Background Sync] Server not reachable, staying offline."),et(re.ANDROID_OFFLINE),l.isOnlineAtStartup=!1}catch(e){console.warn("[Background Sync] Failed:",e.message)}}}function ei(e,t,n){let i=Q(),r=F(D("dr_cat_local_overrides"),{});if(t){if(e.forEach(a=>{let s=l.allCats.findIndex(d=>d.id===a.id),o=i[a.id]||{},c=r[a.id]||{},p={...a,status:o.status||"todo",notes:o.notes||"",summary:c.customSummary||a.summary,customSummary:c.customSummary||a.summary,ordonnance:c.customOrdonnance||a.ordonnance,customOrdonnance:c.customOrdonnance||a.ordonnance};s!==-1?l.allCats[s]=p:l.allCats.push(p)}),n){let a=[];try{a=F(D("dr_cat_custom_created_cats"),[])}catch{a=[]}let s=new Set(a.map(o=>o.id));l.allCats=l.allCats.filter(o=>Je(o,s)?!0:n.has(o.id))}}else{let a=new Set(e.map(c=>c.id)),s=[];try{s=F(D("dr_cat_custom_created_cats"),[])}catch{s=[]}let o=s.filter(c=>!a.has(c.id)).map(c=>({...c,isOffline:!0}));l.allCats=Xe([...e,...o],i,r)}if(z("dr_cat_last_sync_time",Date.now().toString()),Ne(l.allCats,V),ut(),Ke(V),l.activeCat){let a=l.activeCat.id,s=l.allCats.find(o=>o.id===a);s?Te(s,!0):ue(V)}}function V(e,t){Te(e,!1,t||0)}function ti(e){zn(e),ut()}function ni(e){Ne(e,V)}async function Qe(){let e=[];try{e=await tt()}catch(r){console.error("[Refresh Error] Fetch CATs failed, using emergency fallback.",r);try{let a=await fetch("data/cats_db.json",{headers:{"x-app-key":mt}});if(!a.ok)throw new Error("Emergency fallback failed");e=await a.json()}catch(a){console.error("[Refresh Critical] No data available.",a);return}}let t=Q(),n={},i=[];try{n=F(D("dr_cat_local_overrides"),{}),i=F(D("dr_cat_custom_created_cats"),[]).map(a=>({...a,isOffline:!0}))}catch{}if(J&&(e=e.filter(r=>!n[r.id]||!n[r.id].deleted),e=[...e,...i.filter(r=>!n[r.id]||!n[r.id].deleted)]),l.allCats=Xe(e,t,n),kt(l.allCats),Ne(l.allCats,V),ut(),Ke(V),l.activeCat){let r=l.activeCat.id,a=l.allCats.find(s=>s.id===r);a?Te(a,!0):ue(V)}}async function ai(){await Qe(),ue(V)}async function ii(){await Qe(),ue(V)}async function oi(){await Qe()}function ut(){let e=0,t=0,n=0;l.allCats.forEach(d=>{d.status==="done"?n++:d.status==="doing"?t++:e++});let i=document.getElementById("count-todo"),r=document.getElementById("count-doing"),a=document.getElementById("count-done"),s=document.getElementById("progress-percent"),o=document.getElementById("progress-fill");i&&(i.textContent=e),r&&(r.textContent=t),a&&(a.textContent=n);let c=l.allCats.length,p=c>0?Math.round(n/c*100):0;s&&(s.textContent=`${p}%`),o&&(o.style.width=`${p}%`)}function Sa(){let e=document.getElementById("add-cat-btn"),t=document.getElementById("admin-login-btn"),n=Ze(),i=n===re.ADMIN_LOCAL,r=[re.WEB_CLIENT,re.ANDROID_ONLINE].includes(n);t&&(i?(t.style.display="flex",l.isAdmin?(t.innerHTML='<i class="fa-solid fa-lock-open"></i> D\xE9connexion Admin',t.style.backgroundColor="rgba(16, 185, 129, 0.15)",t.style.color="var(--color-success)"):(t.innerHTML='<i class="fa-solid fa-lock"></i> Connexion Admin',t.style.backgroundColor="var(--bg-card)",t.style.color="var(--text-primary)")):t.style.display="none"),e&&(i?(e.style.display="flex",e.innerHTML='<i class="fa-solid fa-plus"></i> CAT'):r?(e.style.display="flex",e.innerHTML='<i class="fa-solid fa-lightbulb"></i> Sugg\xE9rer CAT'):e.style.display="none");let a=document.getElementById("edit-summary-btn"),s=document.getElementById("edit-prescription-btn"),o=document.getElementById("delete-cat-btn");i&&l.isAdmin?(a&&(a.innerHTML='<i class="fa-solid fa-pen"></i> Modifier la fiche',a.style.display="inline-flex"),s&&(s.innerHTML='<i class="fa-solid fa-pen"></i>',s.title="Modifier l'ordonnance",s.setAttribute("aria-label","Modifier l'ordonnance"),s.style.display="inline-flex"),o&&(o.style.display=l.activeCat&&l.activeCat.id>55?"inline-flex":"none")):r?(a&&(a.innerHTML='<i class="fa-solid fa-pen-fancy"></i> Proposer modif.',a.style.display="inline-flex"),s&&(s.innerHTML='<i class="fa-solid fa-pen-fancy"></i>',s.title="Proposer une modification de l'ordonnance",s.setAttribute("aria-label","Proposer une modification de l'ordonnance"),s.style.display="inline-flex"),o&&(o.style.display="none")):(a&&(a.style.display="none"),s&&(s.style.display="none"),o&&(o.style.display="none"));let c=document.querySelector(".specialty-export-container");c&&(i&&l.isAdmin?c.style.display="flex":c.style.display="none");let p=document.getElementById("pdf-reindex-btn");p&&(p.style.display=i&&l.isAdmin?"inline-flex":"none")}export{ut as calculateStats,Ye as runBackgroundSync,Sa as updateEditButtonsVisibility};
