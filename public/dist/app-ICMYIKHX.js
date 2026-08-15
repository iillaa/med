import{a as c,b as q,c as Je,d as y,e as ut,f as Zt,g as S,h as Ge,i as en,j as Se,k as pt,l as Ce,m as Ie,n as U,o as tn,p as nn,q as Q}from"./chunk-VCPVUKHE.js";var ke="https://drcat.dr-cat.workers.dev",Le=["https://drcat.dr-cat.workers.dev","https://rendition-duchess-dry.ngrok-free.dev"];var Ae=[{id:"ngrok",name:"ngrok",urlPattern:/^(?:https?:\/\/)?(?:[^\/]+\.)?ngrok(-free)?\.(app|dev|io)(?:[:\/]|$)/i,extraHeaders:{"ngrok-skip-browser-warning":"true"},managementPort:4040,managementPath:"/api/tunnels",isDevHostname:e=>/(?:^|\.)ngrok(-free)?\.(app|dev|io)$/i.test(e),isTunnelOrigin:e=>/(?:^|\.)ngrok(-free)?\.(app|dev|io)(?::\d+)?$/i.test(e.replace(/^https?:\/\//,"")),tunnelLabel:"Tunnel"},{id:"localtunnel",name:"localtunnel",urlPattern:/^(?:https?:\/\/)?(?:[^\/]+\.)?loca\.lt(?:[:\/]|$)/i,extraHeaders:{},managementPort:null,managementPath:null,isDevHostname:e=>/(?:^|\.)loca\.lt$/i.test(e),isTunnelOrigin:e=>/(?:^|\.)loca\.lt(?::\d+)?$/i.test(e.replace(/^https?:\/\//,"")),tunnelLabel:"Tunnel"},{id:"cloudflare",name:"Cloudflare Tunnel",urlPattern:/^(?:https?:\/\/)?(?:[^\/]+\.)?(?:trycloudflare\.com|cfargotunnel\.com|pages\.dev|is-an\.app|is-a\.dev)(?:[:\/]|$)/i,extraHeaders:{},managementPort:null,managementPath:null,isDevHostname:e=>/(?:^|\.)(?:trycloudflare\.com|cfargotunnel\.com|pages\.dev|is-an\.app|is-a\.dev)$/i.test(e),isTunnelOrigin:e=>/(?:^|\.)(?:trycloudflare\.com|cfargotunnel\.com|pages\.dev|is-an\.app|is-a\.dev)(?::\d+)?$/i.test(e.replace(/^https?:\/\//,"")),tunnelLabel:"Cloudflare"},{id:"direct",name:"Direct Host",urlPattern:null,extraHeaders:{},managementPort:null,managementPath:null,isDevHostname:()=>!1,isTunnelOrigin:()=>!1,tunnelLabel:"Serveur direct"}];function ra(e){if(!e)return Ae[3];for(let t of Ae)if(t.urlPattern&&t.urlPattern.test(e))return t;return Ae[3]}function _e(e){return ra(e).extraHeaders||{}}function le(e,t=new Set){return t.has(e.id)||e.isOffline===!0||e.source==="offline"||typeof e.id=="string"&&e.id.startsWith("offline-")||typeof e.id=="number"&&e.id<0}function Ye(e,t={},n={}){return e.map(r=>{let o=t[r.id]||{},a=n[r.id]||{};return{...r,status:o.status||"todo",notes:o.notes||"",lastRead:o.lastRead||0,...a.summary?{customSummary:a.summary}:{},...a.ordonnance?{customOrdonnance:a.ordonnance}:{}}})}var ia=!!(typeof window<"u"&&(window.Capacitor||navigator.userAgent.includes("Capacitor"))),ft=ia?4e3:1e4,Ke=4e3;var mt=3,an=1200,Oa=3600*1e3,Ma=1440*60*1e3;var Ra=typeof process<"u"&&process.env&&process.env.DEBUG==="true"||typeof window<"u"&&localStorage.getItem("drCatDebug")==="true";var on="dr_cat_install_id";function sa(){return typeof crypto<"u"&&typeof crypto.randomUUID=="function"?crypto.randomUUID():"xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx".replace(/[xy]/g,function(e){let t=Math.random()*16|0;return(e==="x"?t:t&3|8).toString(16)})}function rn(){try{let e=localStorage.getItem(on);return e||(e=`drcat-inst-${typeof crypto<"u"&&typeof crypto.randomUUID=="function"?crypto.randomUUID():sa()}`,localStorage.setItem(on,e),console.log("[InstallID] Generated new anonymous installation ID:",e)),e}catch(e){return console.warn("[InstallID] Storage access warning, using fallback ID:",e),"drcat-inst-fallback-session"}}var ca=window.fetch;window.fetch=async function(...e){let t=performance.now(),n=typeof e[0]=="string"?e[0]:e[0]?.url||"",r=(e[1]?.method||"GET").toUpperCase();try{let o=await ca(...e),a=performance.now()-t;return window.perf&&window.perf.recordApiCall&&!n.includes("/api/performance/server-metrics")&&!n.includes("/api/search-status")&&window.perf.recordApiCall(n,o.status,a),window.dispatchEvent(new CustomEvent("drcat-fetch-event",{detail:{url:n,method:r,status:o.status,duration:Math.round(a)}})),o}catch(o){let a=performance.now()-t;throw window.perf&&window.perf.recordApiCall&&!n.includes("/api/performance/server-metrics")&&!n.includes("/api/search-status")&&window.perf.recordApiCall(n,0,a),window.dispatchEvent(new CustomEvent("drcat-fetch-event",{detail:{url:n,method:r,status:0,duration:Math.round(a),error:o.message}})),o}};var la=document.querySelector('meta[name="app-build-version"]')?.content||"0",de=`dr_cat_synced_database_v${la}`,B=window.location.protocol==="file:"||window.location.protocol.startsWith("capacitor")||window.location.hostname===""||window.location.hostname==="localhost"&&window.location.port!=="3000"&&window.location.port!=="8080"||!!window.Capacitor||navigator.userAgent.toLowerCase().includes("capacitor")||localStorage.getItem("dr_cat_force_offline")==="true";console.log("[API] Offline Standalone Mode:",B);var P={ADMIN_LOCAL:"admin_local",WEB_CLIENT:"web_client",ANDROID_ONLINE:"android_online",ANDROID_OFFLINE:"android_offline"},N=null;function Qe(e=window.location.hostname){return B?!0:e?e.endsWith(".workers.dev")||e.endsWith(".pages.dev")||e.endsWith(".github.io"):!1}function ee(){if(N)return N;let e=!!window.Capacitor||navigator.userAgent.includes("Capacitor"),t=window.location.hostname,n=t==="localhost"||t==="127.0.0.1"||t==="::1";return e?(N=P.ANDROID_OFFLINE,console.log(`[App Mode] Detected (Capacitor): ${N} (Host: ${t}). navigator.onLine ignored.`),N):(n?N=P.ADMIN_LOCAL:N=P.WEB_CLIENT,console.log(`[App Mode] Detected: ${N} (Host: ${t}, Static CDN: ${Qe(t)}).`),N)}function Ze(e){let t=N;N=e,t!==e&&(console.log(`[API] App Mode changed from ${t} to ${e}`),window.dispatchEvent(new CustomEvent("drcat-app-mode-changed",{detail:{oldMode:t,mode:e}})))}var Xe=null,Be=null,Z=0,Te=0,sn=0,cn=3;function ue(e,t){if(!e)return;let n=oe();if(!n.length)return;let r=n[Z]||n[0];if(e===r)if(t)Te=0;else{let o=Date.now();o-sn>1e3&&(Te++,sn=o,console.warn(`[ServerFailover] Provider "${e}" failed (${Te}/${cn})`)),Te>=cn&&(Te=0,n.length>1?(Z=(Z+1)%n.length,console.warn(`[ServerFailover] 3 consecutive failures reached. Switched active provider to: ${n[Z]}`)):(Z=0,console.warn(`[ServerFailover] 3 consecutive failures reached. Reverting to Primary server: ${n[0]}`)))}}function oe(){return Be&&Be.servers.length?Be.servers.slice().sort((e,t)=>e.priority-t.priority).map(e=>e.url):typeof Le<"u"&&Array.isArray(Le)&&Le.length>0?Le.slice():typeof ke<"u"&&ke?[ke]:[]}function gt(){let e=oe();return e.length?(Z>=e.length&&(Z=0),e[Z]):null}function dn(){return!!gt()}async function ln(){try{let e=await k(L("/api/server-providers"),{headers:A()});if(e.ok){let t=await e.json();Be={servers:t.servers||[],primaryProvider:t.primaryProvider||null}}}catch{}return Be}function L(e,t){let n=t||gt();if(!B&&(location.hostname==="localhost"||location.hostname==="127.0.0.1"||location.hostname==="::1"))return e;if(n)try{let o=new URL(n);if(B||location.origin!==o.origin){let a=n.replace(/\/+$/,""),l=e.startsWith("/")?e:`/${e}`,i=`${a}${l}`;return i.includes("ngrok-free.dev")||i.includes("ngrok")?i.includes("?")?`${i}&ngrok-skip-browser-warning=true`:`${i}?ngrok-skip-browser-warning=true`:i}}catch{}return e}var $e="drcat_pub_2f7a91c4e8",V={"x-app-key":$e,"ngrok-skip-browser-warning":"true"};function A(e={}){let t=localStorage.getItem("dr_cat_admin_token"),n=rn(),r=document.querySelector('meta[name="app-version"]')?.content||document.querySelector('meta[name="app-build-version"]')?.content||"1.5.2",o=gt()||ke,l=!B&&(location.hostname==="localhost"||location.hostname==="127.0.0.1"||location.hostname==="::1")?{}:_e(o);return{"Content-Type":"application/json","x-app-key":$e,"x-install-id":n,"x-app-version":r,"x-device-platform":B?"android_apk":"web_pwa","ngrok-skip-browser-warning":"true",...B?{"x-capacitor-platform":"android"}:{},...t?{"x-admin-token":t}:{},...l,...e}}async function yt(e){if(B)return{success:!1,error:"Connexion administrateur impossible en mode hors-ligne."};let t=await k(L("/api/login"),{method:"POST",headers:A(),body:JSON.stringify({password:e})}),n=await t.json();return t.ok&&n.token&&localStorage.setItem("dr_cat_admin_token",n.token),n}async function un(){if(B){localStorage.removeItem("dr_cat_admin_token");return}try{await k(L("/api/logout"),{method:"POST",headers:A()})}catch(e){console.error("Logout failed:",e)}localStorage.removeItem("dr_cat_admin_token")}async function pn(){if(B||!localStorage.getItem("dr_cat_admin_token")||B&&navigator.onLine===!1)return!1;try{let t=await k(L("/api/is-admin"),{headers:A()});return t.ok?!!(await t.json()).isAdmin:!1}catch(t){return console.error("Failed to check admin status:",t),!1}}async function k(e,t={}){let n=new AbortController,r=setTimeout(()=>n.abort(),ft);try{let o=await fetch(e,{...t,signal:n.signal});return clearTimeout(r),o}catch(o){throw clearTimeout(r),o.name==="AbortError"?new Error(`Request timed out after ${ft}ms: ${e}`):o}}async function et(e){let t=ee(),n=typeof e=="number"&&!isNaN(e)?`?since=${e}`:"";if(t===P.ADMIN_LOCAL){let i=await k(L(`/api/cats${n}`),{headers:A()});if(!i.ok)throw new Error("Failed to fetch CATs from local server");let d=await i.json(),s=i.headers.get("X-Active-Cat-IDs");return s&&(d.activeIds=s),d}if(t===P.ANDROID_OFFLINE||t!==P.ANDROID_ONLINE&&Qe()){let i=localStorage.getItem(de);if(i&&!n)try{let s=JSON.parse(i);if(Array.isArray(s)&&s.length>=40)return console.log("[fetchCats] Loading cached synced database."),s;console.warn("[fetchCats] Cached database looks corrupted or incomplete (length < 40). Falling back to static bundle.")}catch{}console.log("[fetchCats] Loading static bundled data.");let d=await k("data/cats_db.json",{headers:V});if(!d.ok)throw new Error("Failed to fetch CATs statically");return d.json()}let r=oe(),o=!1;for(let i of r)try{let d=new AbortController,s=setTimeout(()=>d.abort(),Ke),u=L("/api/search-status",i);await fetch(u,{method:"GET",signal:d.signal,headers:A()}),clearTimeout(s),ue(i,!0,Ke),o=!0;break}catch{ue(i,!1,Ke)}if(!o){console.log("[fetchCats] No remote server reachable within timeout \u2014 falling back to local bundle instantly.");let i=localStorage.getItem(de);if(i&&!n)try{let s=JSON.parse(i);if(Array.isArray(s)&&s.length>=40)return console.log("[fetchCats] Loaded cached synced database on unreachable remote."),s}catch{}let d=await k("data/cats_db.json",{headers:V});if(!d.ok)throw new Error("Failed to fetch CATs from fallback");return d.json()}for(let i of r)try{let d=await k(L(`/api/cats${n}`,i),{headers:A()});if(d.ok){ue(i,!0);let s=await d.json(),u=d.headers.get("X-Active-Cat-IDs");u&&(s.activeIds=u),console.log("[API] fetchCats: loaded from remote server",i,s.length);try{if(e==null)localStorage.setItem(de,JSON.stringify(s));else{let p=[],f=localStorage.getItem(de);if(f)try{p=JSON.parse(f)}catch{p=[]}else{let h=await k("data/cats_db.json",{headers:V});h.ok&&(p=await h.json())}if(s.forEach(h=>{let v=p.findIndex(m=>m.id===h.id);v!==-1?p[v]=h:p.push(h)}),u){let h=new Set(u.split(",").map(b=>parseInt(b))),v=[];try{v=JSON.parse(localStorage.getItem("dr_cat_custom_created_cats")||"[]")}catch{v=[]}let m=new Set(v.map(b=>b.id));p=p.filter(b=>le(b,m)?!0:h.has(b.id))}localStorage.setItem(de,JSON.stringify(p))}}catch(p){console.error("[API] Failed to cache synced database:",p)}return s}}catch{ue(i,!1),console.warn("[API] fetchCats: remote server",i,"unreachable")}console.warn("[API] fetchCats: all remote attempts failed, using local bundle.");let a=localStorage.getItem(de);if(a&&!n)try{let i=JSON.parse(a);if(Array.isArray(i)&&i.length>=40)return console.log("[fetchCats] Loaded cached synced database on ultimate fallback."),i}catch{}let l=await k("data/cats_db.json",{headers:V});if(!l.ok)throw new Error("Failed to fetch CATs from fallback");return l.json()}async function fn(){let e=ee();if(B||e===P.ANDROID_OFFLINE||Qe()){try{let t=await k("data/pdf_list.json",{headers:V});if(t.ok){let n=await t.json();if(Array.isArray(n))return n}}catch{}return[]}try{let t=await k(L("/api/pdfs"),{headers:A()});if(t.ok){let n=await t.json();if(Array.isArray(n))return n}}catch{}try{let t=await k("data/pdf_list.json",{headers:V});if(t.ok){let n=await t.json();if(Array.isArray(n))return n}}catch{}return[]}async function Pe(e,t){try{let r=await k(L(`/api/cats/${e}`),{method:"POST",headers:A(),body:JSON.stringify(t)});if(r.ok){try{let o=JSON.parse(localStorage.getItem("dr_cat_local_overrides")||"{}");o[e]&&(delete o[e],localStorage.setItem("dr_cat_local_overrides",JSON.stringify(o)))}catch{}return r.json()}}catch(r){console.warn("[API] saveCatDataToServer failed:",r.message)}let n=JSON.parse(localStorage.getItem("dr_cat_local_overrides")||"{}");return n[e]||(n[e]={}),t.summary!==void 0&&(n[e].customSummary=t.summary),t.ordonnance!==void 0&&(n[e].customOrdonnance=t.ordonnance),n[e].updatedAt=Date.now(),localStorage.setItem("dr_cat_local_overrides",JSON.stringify(n)),{success:!0,message:"Modifications enregistr\xE9es localement."}}async function mn(e){try{let n=await k(L(`/api/cats/${e}`),{method:"DELETE",headers:A()});if(n.ok)return n.json()}catch(n){console.warn("[API] deleteCatFromServer failed:",n.message)}let t=JSON.parse(localStorage.getItem("dr_cat_local_overrides")||"{}");return t[e]||(t[e]={}),t[e].deleted=!0,localStorage.setItem("dr_cat_local_overrides",JSON.stringify(t)),{success:!0,message:"Fiche supprim\xE9e localement."}}async function gn(e){try{let t=await k(L("/api/cats"),{method:"POST",headers:A(),body:JSON.stringify(e)});if(t.ok)return t.json()}catch(t){console.warn("[API] createCatOnServer failed:",t.message)}return{success:!1,error:"Failed to create CAT"}}async function yn(e){try{let t=await k(L("/api/cats/bulk-import"),{method:"POST",headers:A({"Content-Type":"application/json"}),body:JSON.stringify(e)});if(!t.ok){let n=await t.json().catch(()=>({}));throw new Error(n.error||"Failed to bulk import CATs")}return t.json()}catch(t){throw console.warn("[API] bulkImportCats failed:",t.message),t}}async function De(e,t){let n=ee();if(n===P.ANDROID_OFFLINE)return{success:!1,error:"Mode hors-ligne. Connexion Internet requise pour envoyer des suggestions."};if(n===P.ADMIN_LOCAL)return{success:!1,error:'Les administrateurs modifient directement les fiches. Utilisez le bouton "Modifier".'};let r=oe(),o=0;for(;o<mt;){o++,t&&t(o);for(let a of r.length?r:[null])try{let l=L("/api/suggestions",a),i=await k(l,{method:"POST",headers:A(a?_e(a):{}),body:JSON.stringify(e)});if(i.ok)return await i.json();if(i.status===404&&r.length>1){console.warn(`[API] submitSuggestion: static endpoint ${l} returned 404, trying next provider.`);continue}let d=await i.json().catch(()=>({}));if(i.status>=400&&i.status<500)return{success:!1,error:d.error||"Erreur client."}}catch(l){console.warn(`[API] submitSuggestion: attempt ${o} on ${a||"default"} failed.`,l.message)}o<mt&&await new Promise(a=>setTimeout(a,an))}return{success:!1,error:"Le serveur est injoignable apr\xE8s 3 tentatives."}}async function ht(){let e=await k(L("/api/suggestions"),{headers:A()});if(e.status===403)throw new Error("403 Forbidden");if(!e.ok)throw new Error("Failed to fetch suggestions");return e.json()}async function hn(e){let t=await k(L(`/api/suggestions/${e}/approve`),{method:"POST",headers:A()});if(t.status===403)throw new Error("403 Forbidden");if(!t.ok)throw new Error("Failed to approve suggestion");let n=await t.json();if(n.success&&n.cat)try{let r=JSON.parse(localStorage.getItem("dr_cat_local_overrides")||"{}");r[n.cat.id]&&(delete r[n.cat.id],localStorage.setItem("dr_cat_local_overrides",JSON.stringify(r)))}catch{}return n}async function vn(e){let t=await k(L(`/api/suggestions/${e}/reject`),{method:"POST",headers:A()});if(t.status===403)throw new Error("403 Forbidden");if(!t.ok)throw new Error("Failed to reject suggestion");return t.json()}async function bn(e,t){let n=await k(L(`/api/suggestions/${e}/edit`),{method:"POST",headers:A({"Content-Type":"application/json"}),body:JSON.stringify({data:t})});if(n.status===403)throw new Error("403 Forbidden");if(!n.ok)throw new Error("Failed to update suggestion");return n.json()}async function xn(){try{let e=await k(L("/api/search-status"),{headers:A()});if(e.ok)return await e.json()}catch{}return{isIndexing:!1,totalFiles:76,indexedFiles:76,currentFile:""}}async function wn(e){let t=e.trim().toLowerCase();if(!B)try{let n=await k(L(`/api/search-pdfs?q=${encodeURIComponent(e)}`),{headers:A()});if(n.ok)return n}catch(n){console.warn("[Search] Server PDF search failed or offline, using static index fallback.",n)}try{if(!Xe){let r=await fetch("data/pdf_index.json",{headers:V});if(!r.ok)throw new Error("Failed to load PDF index");Xe=await r.json()}let n=[];for(let r of Xe)r.pdf.toLowerCase().includes(t)&&n.push({pdf:r.pdf,page:1,snippet:"[Titre du fichier correspond] Document de r\xE9f\xE9rence disponible."});for(let r of Xe)if(r.pages){for(let o of r.pages){let a=o.content||o.text;if(!a||a.trim()==="NO_CONTENT_HERE"||n.some(d=>d.pdf===r.pdf&&d.page===o.page))continue;let i=a.toLowerCase().indexOf(t);if(i!==-1){let d=Math.max(0,i-60),s=Math.min(a.length,i+t.length+60),u=a.substring(d,s);if(d>0&&(u="..."+u),s<a.length&&(u=u+"..."),n.push({pdf:r.pdf,page:o.page,snippet:u}),n.length>=100)break}}if(n.length>=100)break}return{status:200,ok:!0,json:async()=>({results:n})}}catch(n){return console.error("PDF index search error:",n),{status:500,ok:!1,json:async()=>({error:"Impossible d'effectuer la recherche dans les PDFs.",results:[]})}}}async function En(){if(B)return{success:!0,message:"La r\xE9-indexation n'est pas prise en charge hors-ligne."};let e=await k(L("/api/reindex"),{method:"POST",headers:A()});if(e.status===403)throw new Error("403 Forbidden");if(!e.ok)throw new Error("Failed to trigger reindexing");return e.json()}async function Sn(){let e=ee();if(B||e===P.ANDROID_OFFLINE||Qe())try{let t=await k("data/pdf_index.json",{headers:V});if(t.ok){let n=await t.json(),r={};for(let o of n){let a=o.pages?o.pages.length:0,l=o.pages?o.pages.filter(d=>{let s=(d.content||d.text||"").trim();return s.length>15&&s!=="NO_CONTENT_HERE"}).length:0,i="red";if(a>0){let d=l/a;d>=.9?i="green":d>=.05&&(i="orange")}r[o.pdf]={status:i,totalPages:a,pagesWithText:l}}return r}}catch{}try{let t=await k(L("/api/pdf-index-status"),{headers:A()});if(t.ok)return await t.json()}catch{}try{let t=await fetch("data/pdf_index.json",{headers:V});if(!t.ok)throw new Error("Failed to load PDF index for status calculation");let n=await t.json(),r={};for(let o of n){let a=o.pages?o.pages.length:0,l=o.pages?o.pages.filter(d=>{let s=(d.content||d.text||"").trim();return s.length>15&&s!=="NO_CONTENT_HERE"}).length:0,i="red";if(a>0){let d=l/a;d>=.9?i="green":d>=.05&&(i="orange")}r[o.pdf]={status:i,pagesWithText:l,totalPages:a}}return r}catch{return{}}}async function Cn(){let e=await k(L("/api/version"),{method:"GET",headers:A()});if(!e.ok)throw new Error("Impossible de r\xE9cup\xE9rer la configuration de version.");return e.json()}async function vt(e){let t=await k(L("/api/admin/version"),{method:"PUT",headers:A({"Content-Type":"application/json"}),body:JSON.stringify(e)});if(!t.ok){let n=await t.json().catch(()=>({}));throw new Error(n.error||"\xC9chec de la mise \xE0 jour de la version.")}return t.json()}typeof window<"u"&&(ln().catch(()=>{}),window.addEventListener("online",()=>{ln().catch(()=>{})}),setInterval(()=>{let e=oe();for(let t of e)da(t).catch(()=>{})},6e4));async function da(e){try{let t=new AbortController,n=setTimeout(()=>t.abort(),4e3),r=performance.now(),o=L("/api/search-status",e);await fetch(o,{method:"GET",signal:t.signal,headers:A()}),clearTimeout(n),ue(e,!0,performance.now()-r)}catch{ue(e,!1)}}var re=[],Ln=200,Oe=!1,te={};function fe(e,t,n={}){let r=new Date().toLocaleTimeString("fr-FR",{hour12:!1}),o=t.map(a=>{if(a instanceof Error)return a.message+`
`+a.stack;if(typeof a=="object")try{return JSON.stringify(a)}catch{return String(a)}return String(a)}).join(" ");re.push({timestamp:r,level:e,message:o,...n}),re.length>Ln&&re.shift(),Oe&&xt()}var In=!1;function ua(e,t){fe(e,t)}function pa(){if(In)return;In=!0,te={log:console.log,warn:console.warn,error:console.error,info:console.info};let e={apply(t,n,r){let o=t===te.error?"ERROR":t===te.warn?"WARN":t===te.info?"INFO":"LOG";return ua(o,r),Reflect.apply(t,n,r)}};console.log=new Proxy(te.log,e),console.warn=new Proxy(te.warn,e),console.error=new Proxy(te.error,e),console.info=new Proxy(te.info,e),window.addEventListener("error",t=>{fe("ERROR",[`${t.message} at ${t.filename}:${t.lineno}:${t.colno}`,t.error])}),window.addEventListener("unhandledrejection",t=>{fe("ERROR",[`Unhandled Promise Rejection: ${t.reason}`])}),window.addEventListener("drcat-fetch-event",t=>{let{url:n,method:r,status:o,duration:a,error:l}=t.detail;l?fe("ERROR",[`${r} ${n} \u2192 FAILED (${a}ms): ${l}`],{network:{url:n,method:r,status:0,duration:a}}):fe("NETWORK",[`${r} ${n} \u2192 ${o} (${a}ms)`],{network:{url:n,method:r,status:o,duration:a}})}),fe("INFO",["\u{1F680} Debug Console initialized."])}function bt(e){return String(e||"").replace(/[&<>"']/g,t=>({"&":"&amp;","<":"&lt;",">":"&gt;",'"':"&quot;","'":"&#39;"})[t])}function xt(){let e=document.getElementById("debug-console-content");if(e){if(re.length===0){e.innerHTML='<div style="color: #64748b; padding: 20px; text-align: center;">Aucun log pour le moment.</div>';return}e.innerHTML=re.map(t=>`<div class="log-row ${(t.level||"info").toLowerCase()}" style="padding: 4px 8px; font-family: monospace; font-size: 11px; line-height: 1.4; display: flex; gap: 8px;">
      <span class="log-time" style="white-space: nowrap;">[${bt(t.timestamp)}]</span>
      <span class="log-level" style="font-weight: bold; min-width: 50px;">${bt(t.level)}</span>
      <span class="log-message" style="word-break: break-all;">${bt(t.message)}</span>
    </div>`).join(""),setTimeout(()=>{e.scrollTop=e.scrollHeight},0)}}function kn(){let e=document.getElementById("debug-console-panel");Oe=!Oe,e.style.display=Oe?"flex":"none",Oe&&xt()}function fa(){if(!document.getElementById("debug-console-styles")){let e=document.createElement("style");e.id="debug-console-styles",e.textContent=`
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
    `,document.head.appendChild(e)}if(!document.getElementById("debug-toggle-btn")){let e=document.createElement("div");e.id="debug-toggle-btn",e.innerHTML='\u{1F41B}<span class="badge" id="debug-badge"></span>';let t=localStorage.getItem("drCatDebugConsoleVisible")==="true";e.style.display=t?"flex":"none",document.body.appendChild(e),e.addEventListener("click",()=>{kn()})}if(!document.getElementById("debug-console-panel")){let e=document.createElement("div");e.id="debug-console-panel",e.innerHTML=`
      <div class="header">
        <h3>\u{1F41B} Debug Console <span style="font-size: 11px; color: #64748b; font-weight:400;">(${Ln} max)</span></h3>
        <div class="actions">
          <button id="debug-copy-btn">\u{1F4CB} Copier</button>
          <button id="debug-clear-btn">\u{1F5D1} Vider</button>
          <button class="close-btn" id="debug-close-btn">\u2715 Fermer</button>
        </div>
      </div>
      <div id="debug-console-content"></div>
    `,document.body.appendChild(e),e.style.display="none",document.getElementById("debug-close-btn")?.addEventListener("click",kn),document.getElementById("debug-clear-btn")?.addEventListener("click",()=>{re=[],xt()}),document.getElementById("debug-copy-btn")?.addEventListener("click",()=>{let t=re.map(n=>`[${n.timestamp}] [${n.level}] ${n.message}`).join(`
`);navigator.clipboard?.writeText(t).then(()=>{alert("Logs copi\xE9s dans le presse-papier !")}).catch(()=>{let n=document.createElement("textarea");n.value=t,document.body.appendChild(n),n.select(),document.execCommand("copy"),document.body.removeChild(n),alert("Logs copi\xE9s !")})})}}function An(){pa(),fa();let e=0,t=null,n=10,r=2e3,o=()=>{if(e++,t&&clearTimeout(t),t=setTimeout(()=>{e=0},r),e>=n){e=0,clearTimeout(t);let l=document.getElementById("debug-toggle-btn");l&&(l.style.display==="flex"?(l.style.display="none",localStorage.removeItem("drCatDebugConsoleVisible"),y("\u{1F41B} Mode D\xE9bogage d\xE9sactiv\xE9.","fa-bug",3e3)):(l.style.setProperty("display","flex","important"),localStorage.setItem("drCatDebugConsoleVisible","true"),y("\u{1F41B} Mode D\xE9bogage activ\xE9 !","fa-bug",5e3)))}},a=()=>{let l=document.getElementById("brand-logo"),i=document.getElementById("mobile-brand-logo");l&&(l.removeEventListener("click",o),l.addEventListener("click",o)),i&&(i.removeEventListener("click",o),i.addEventListener("click",o))};a(),setTimeout(a,500),console.log("\u{1F4F1} Dr.CAT Debug Console active.")}var D,tt,J,W,wt;function ma(e,t){let n=e.parentElement;if(!n)return;let r=document.createElement("div");r.className="ptr-indicator",r.innerHTML='<i class="fa-solid fa-arrows-rotate"></i>',n.insertBefore(r,e);let o=64,a=0,l=!1,i=!1,d=null,s=0,u=h=>{i||n.scrollTop>0||(a=h.touches?h.touches[0].clientY:h.clientY,l=!0,s=0)},p=h=>{if(!l||i)return;let m=(h.touches?h.touches[0].clientY:h.clientY)-a;if(m<=0){s=0,n.style.transform="",r.classList.remove("visible");return}if(n.scrollTop>0){l=!1;return}h.cancelable&&h.preventDefault(),s=Math.min(m*.5,o+24),!Q()&&(d||(d=requestAnimationFrame(()=>{n.style.transform=`translateY(${s}px)`,r.classList.add("visible"),r.style.opacity=String(Math.min(s/o,1)),d=null})))},f=async()=>{if(d&&(cancelAnimationFrame(d),d=null),!l||i){l=!1;return}l=!1;let h=s;if(s=0,n.style.transform="",r.style.opacity="",r.classList.remove("visible"),h>=o){i=!0,r.classList.add("spinning");try{await t()}finally{r.classList.remove("spinning"),i=!1}}};n.addEventListener("touchstart",u,{passive:!0}),n.addEventListener("touchmove",p,{passive:!1}),n.addEventListener("touchend",f),n.addEventListener("mousedown",u),n.addEventListener("mousemove",p),window.addEventListener("mouseup",f)}function St(e){switch(e){case"done":return"Ma\xEEtris\xE9";case"doing":return"En cours";default:return"\xC0 faire"}}function _n(e,t,n){D=document.getElementById("cat-list"),tt=document.getElementById("search-input"),J=document.getElementById("category-filter"),W=document.getElementById("sidebar"),wt=document.getElementById("sidebar-overlay");let r=document.getElementById("open-sidebar-btn"),o=document.getElementById("close-sidebar-btn");D&&D.addEventListener("click",p=>{let f=p.target.closest(".cat-item");if(!f)return;let h=parseInt(f.getAttribute("data-id"),10);if(isNaN(h))return;let v=c.allCats.find(m=>m.id===h);v&&(e(v),window.innerWidth<=850&&W&&W.classList.remove("open"))}),tt&&tt.addEventListener("input",nn(()=>Et(t),150)),J&&J.addEventListener("change",()=>Et(t));let a=document.querySelectorAll(".status-pill");a.forEach(p=>{p.addEventListener("click",()=>{a.forEach(f=>f.classList.remove("active")),p.classList.add("active"),c.activeStatusFilter=p.getAttribute("data-filter"),Et(t)})}),r&&r.addEventListener("click",()=>{W.classList.add("open")}),o&&o.addEventListener("click",()=>{W.classList.remove("open")});let l=document.getElementById("controls-toggle-btn"),i=document.getElementById("controls-panel"),d=document.getElementById("controls-toggle-icon");localStorage.getItem("sidebar_controls_collapsed")==="true"&&i&&(i.classList.add("collapsed"),d&&d.classList.add("rotated")),l&&i&&l.addEventListener("click",()=>{let p=i.classList.toggle("collapsed");d&&d.classList.toggle("rotated",p),localStorage.setItem("sidebar_controls_collapsed",p)}),W&&en(W),wt&&W&&wt.addEventListener("click",()=>{W.classList.remove("open")});let u=document.getElementById("apk-download-btn");u&&(!!window.Capacitor||window.Capacitor&&window.Capacitor.isNativePlatform&&window.Capacitor.isNativePlatform()||navigator.userAgent&&navigator.userAgent.toLowerCase().includes("capacitor")?u.style.display="none":u.style.display="inline-flex"),D&&n&&ma(D,n)}function Ct(e){if(J||(J=document.getElementById("category-filter")),!J)return;let t=new Set(e.map(n=>n.category));J.innerHTML='<option value="all">Toutes les sp\xE9cialit\xE9s</option>',t.forEach(n=>{let r=document.createElement("option");r.value=n,r.textContent=n,J.appendChild(r)})}var Me=new Map;function ga(e){let t=document.createElement("li"),n=!!e.parent_id;t.className=`cat-item ${n?"cat-item-subcat":""}`,t.setAttribute("data-id",e.id);let r="";return n&&(r='<span class="badge" style="font-size:9.5px; padding:1px 5px; background:rgba(168,85,247,0.15); color:#c084fc; border:1px solid rgba(168,85,247,0.3);"><i class="fa-solid fa-code-branch"></i> Sous-fiche</span>'),t.innerHTML=`
    <div class="cat-indicator ${e.status}"></div>
    <div class="cat-item-content">
      <span class="cat-item-title">${e.id}. ${S(e.title)}</span>
      <div class="cat-item-meta">
        <span class="cat-item-cat">${S(e.category)}</span>
        ${r}
        <span class="cat-item-status">${St(e.status)}</span>
      </div>
    </div>
  `,t}function ya(e,t){let n=!!t.parent_id;e.className=`cat-item ${n?"cat-item-subcat":""} ${c.activeCat&&c.activeCat.id===t.id?"active":""}`,e.setAttribute("data-id",t.id);let r=e.querySelector(".cat-item-title");r&&(r.textContent=`${t.id}. ${t.title}`);let o=e.querySelector(".cat-item-cat");o&&(o.textContent=t.category);let a=e.querySelector(".cat-item-status");a&&(a.textContent=St(t.status));let l=e.querySelector(".cat-indicator");l&&(l.className=`cat-indicator ${t.status}`)}function ha(e){if(!e||!e.isConnected)return;if(Q()){e.remove();return}e.classList.add("cat-item-exit");let t=!1,n=()=>{t||(t=!0,e.remove())};e.addEventListener("animationend",n,{once:!0}),setTimeout(n,250)}function Re(e,t){if(window.perf&&window.perf.startMeasure("sidebar.renderCatList"),D||(D=document.getElementById("cat-list")),!D)return;if(D.querySelectorAll(".cat-item-skeleton").forEach(i=>i.remove()),e.length===0){Me.clear();let i=!c.allCats||c.allCats.length===0;if(D.innerHTML=`
      <li class="empty-state">
        <div style="text-align: center; padding: 32px 16px; color: var(--text-muted);">
          <i class="fa-solid ${i?"fa-folder-open":"fa-filter-circle-xmark"}" style="font-size: 28px; margin-bottom: 10px; display: block; opacity: 0.6;"></i>
          <span style="font-size: 13px; line-height: 1.5;">${i?"Aucune fiche disponible pour le moment.":"Aucune fiche ne correspond \xE0 vos filtres actuels."}</span>
          ${i?'<button id="sidebar-retry-btn" class="btn-secondary" style="margin-top: 12px; padding: 6px 14px; border-radius: 8px; cursor: pointer; font-size: 12px;">Recharger</button>':""}
        </div>
      </li>`,i){let d=D.querySelector("#sidebar-retry-btn");d&&d.addEventListener("click",()=>location.reload())}window.perf&&(window.perf.endMeasure("sidebar.renderCatList"),window.perf.recordMilestone("sidebarRendered"));return}let n=new Set(e.map(i=>i.id));for(let[i,d]of Me)n.has(i)||(Me.delete(i),ha(d));let r=document.createDocumentFragment(),o=!1,a=0,l=null;e.forEach(i=>{let d=Me.get(i.id);d?ya(d,i):(d=ga(i),Me.set(i.id,d),r.appendChild(d),o=!0,Q()||(d.classList.add("cat-item-enter"),d.style.animationDelay=`${Math.min(a,8)*30}ms`,d.addEventListener("animationend",()=>{d.classList.remove("cat-item-enter"),d.style.animationDelay=""},{once:!0}),a++)),l?d!==l.nextSibling&&D.insertBefore(d,l.nextSibling):d!==D.firstChild&&D.insertBefore(d,D.firstChild),l=d}),o&&D.appendChild(r),window.perf&&(window.perf.endMeasure("sidebar.renderCatList"),window.perf.recordMilestone("sidebarRendered"))}function Tn(e){let t=document.querySelector(`.cat-item[data-id="${e.id}"]`);if(!t)return;let n=t.querySelector(".cat-indicator"),r=t.querySelector(".cat-item-meta span:last-child");n&&(n.className=`cat-indicator ${e.status}`),r&&(r.textContent=St(e.status))}function Et(e){let t=tt.value.toLowerCase().trim(),n=J.value,r=t?t.split(/\s+/).filter(Boolean):[],o=c.allCats.filter(a=>{if(!a)return!1;let l=(a.title||"").toLowerCase(),i=(a.summary||a.customSummary||"").toLowerCase(),d=(a.ordonnance||a.customOrdonnance||"").toLowerCase(),s=(a.red_flags||"").toLowerCase(),u=(a.category||"").toLowerCase(),p=(a.notes||"").toLowerCase(),f=Array.isArray(a.pdf_keywords)?a.pdf_keywords.join(" ").toLowerCase():(a.pdf_keywords||"").toLowerCase(),v=`${a.id!==void 0&&a.id!==null?String(a.id):""} ${l} ${u} ${i} ${d} ${s} ${f} ${p}`,m=r.length===0||r.every(x=>v.includes(x)),b=n==="all"||a.category===n,w=!0;return c.activeStatusFilter==="todo"?w=a.status==="todo":c.activeStatusFilter==="doing"?w=a.status==="doing":c.activeStatusFilter==="done"?w=a.status==="done":c.activeStatusFilter==="redflags"&&(w=s.length>0&&!s.includes("aucun signe de gravit\xE9")&&!s.includes("aucun")),m&&b&&w});e&&e(o)}function Bn(e){let t=new Date().toLocaleDateString("fr-FR"),n=["===========================================","\u{1FA7A} Dr.CAT \u2014 Aide \xE0 la D\xE9cision M\xE9dicale Clinique","\u{1F468}\u200D\u2695\uFE0F Dr. Kibeche Ali","===========================================",`
\u{1F4CB} FICHE N\xB0 ${e.id} : ${e.title.toUpperCase()}`,`\u{1F4C2} Sp\xE9cialit\xE9 : ${e.category}`,`\u{1F4C5} Date : ${t}`,"-------------------------------------------"];e.red_flags&&e.red_flags.trim()&&(n.push(`
\u{1F6A8} SIGNES DE GRAVIT\xC9 (RED FLAGS) :`),n.push(e.red_flags.trim()));let r=e.customSummary||e.summary;r&&r.trim()&&(n.push(`
\u{1F4D1} CONDUITE \xC0 TENIR PRINCIPALE :`),n.push(r.trim()));let o=e.customOrdonnance||e.ordonnance;return o&&o.trim()&&(n.push(`
\u{1F48A} ORDONNANCE TYPE & POSOLOGIES :`),n.push(o.trim())),Array.isArray(e.sub_cats)&&e.sub_cats.length>0&&(n.push(`
-------------------------------------------`),n.push(`\u{1F500} PROFILS PARTICULIERS & SOUS-FICHES (${e.sub_cats.length})`),n.push("-------------------------------------------"),e.sub_cats.forEach((a,l)=>{n.push(`
\u2501\u2501\u2501 \u{1F539} Sous-Fiche ${l+1} : ${a.label||"Profil Sp\xE9cialis\xE9"} \u2501\u2501\u2501`),a.red_flags&&a.red_flags.trim()&&a.red_flags!==e.red_flags&&n.push(`
\u{1F6A8} Red Flags Sp\xE9cifiques :
${a.red_flags.trim()}`),a.summary&&a.summary.trim()&&n.push(`
\u{1F4CB} Conduite \xE0 Tenir :
${a.summary.trim()}`),a.ordonnance&&a.ordonnance.trim()&&n.push(`
\u{1F48A} Ordonnance :
${a.ordonnance.trim()}`)})),e.notes&&e.notes.trim()&&(n.push(`
-------------------------------------------`),n.push("\u{1F4DD} MES NOTES & PROTOCOLES LOCAUX :"),n.push(e.notes.trim())),n.push(`
===========================================`),n.push("G\xE9n\xE9r\xE9 via Dr.CAT Rappel Clinique (Dr. Kibeche Ali)"),n.push("==========================================="),n.join(`
`)}function nt(e,t,n){let r=document.getElementById("summary-view");if(!r)return;let o="";if(c.activeSubCatIndex>0&&n&&(o=`
      <div class="subcat-intext-return-banner">
        <span class="subcat-intext-return-label">
          <i class="fa-solid fa-code-branch"></i> Sous-Fiche : <strong>${S(n)}</strong>
        </span>
        <button type="button" class="subcat-intext-return-btn" onclick="window.switchToSubProfile(0)">
          <i class="fa-solid fa-arrow-left"></i> Revenir \xE0 la fiche principale
        </button>
      </div>
    `),r.innerHTML=o+Ge(e),c.isAdmin&&t&&t.history&&t.history.length>0){let a='<div class="cat-history-section" style="margin-top:20px; border-top:1px dashed var(--border-color); padding-top:14px; pointer-events:none;">';a+='<h4 style="font-size:11.5px; color:var(--text-secondary); margin-bottom:8px; display:flex; align-items:center; gap:6px;"><i class="fa-solid fa-clock-rotate-left"></i> Historique des versions</h4>',a+='<ul style="list-style:none; padding:0; margin:0; font-size:11px; color:var(--text-muted); display:flex; flex-direction:column; gap:4px;">',t.history.slice(-10).reverse().forEach(i=>{let d=new Date(i.timestamp).toLocaleDateString("fr-FR",{day:"2-digit",month:"2-digit",year:"numeric",hour:"2-digit",minute:"2-digit"});a+=`<li><span style="font-weight:600; color:var(--text-secondary);">${d}</span> \u2014 ${S(i.detail||i.action)}</li>`}),a+="</ul></div>",r.innerHTML+=a}}function at(e){let t=document.getElementById("workspace-prescription"),n=document.getElementById("prescription-variants-selector"),r=document.getElementById("stamp-code");if(r){let o=c.activeCat&&c.activeCat.id!==void 0?String(c.activeCat.id).padStart(2,"0"):"01",a=new Date().getFullYear();r.textContent=`N\xB0 ${o}/CAT-${a}`}if(t){if(!e){t.innerHTML="Pas d'ordonnance type r\xE9dig\xE9e.",n&&(n.style.display="none"),c.prescriptionVariants=[];return}if(c.prescriptionVariants=Zt(e),c.prescriptionVariants.length<=1)n&&(n.style.display="none"),t.textContent=e;else{n&&(n.style.display="flex",n.innerHTML="",c.activePrescriptionVariantIndex>=c.prescriptionVariants.length&&(c.activePrescriptionVariantIndex=0),c.prescriptionVariants.forEach((a,l)=>{let i=document.createElement("button");i.className=`status-pill ${l===c.activePrescriptionVariantIndex?"active":""}`,i.style.fontSize="12px",i.style.padding="5px 12px",i.textContent=a.title,i.addEventListener("click",()=>{c.activePrescriptionVariantIndex=l,n.querySelectorAll(".status-pill").forEach((d,s)=>{s===l?d.classList.add("active"):d.classList.remove("active")}),t.textContent=a.content}),n.appendChild(i)}));let o=c.prescriptionVariants[c.activePrescriptionVariantIndex]||c.prescriptionVariants[0];t.textContent=o?o.content:e}}}function It(e,t=!1){if(!e||typeof e!="string")return document.createElement("div");let n=ut(e),r=document.createElement("a"),o=String(e),a=o.toLowerCase().endsWith(".docx");r.href=a?`pdfs/${encodeURIComponent(o)}`:`pdf_viewer.html?file=${encodeURIComponent(o)}&page=1`,a&&(r.target="_blank"),r.className="pdf-card";let l=a?"fa-regular fa-file-word text-primary":t?"fa-solid fa-book-open-reader":"fa-solid fa-file-pdf",i=c.pdfIndexStatus&&c.pdfIndexStatus[o]||{status:"red",pagesWithText:0,totalPages:0},d=a?"#ef4444":i.status==="green"?"#10b981":i.status==="orange"?"#f59e0b":"#ef4444",s=a?"Document Word (Non indexable, convertissez en PDF pour la recherche)":i.status==="green"?`Indexation compl\xE8te (${i.pagesWithText}/${i.totalPages} pages index\xE9es)`:i.status==="orange"?`Indexation partielle (${i.pagesWithText}/${i.totalPages} pages index\xE9es)`:`Non indexable (0/${i.totalPages} pages, PDF scann\xE9 sans texte)`;r.innerHTML=`
    <i class="${l}" style="${t&&!a?"color: var(--color-success);":""}"></i>
    <div style="flex-grow: 1; min-width: 0;">
      <h4 style="display: flex; align-items: center; justify-content: space-between; gap: 8px; width: 100%; margin: 0;">
        <span style="overflow: hidden; text-overflow: ellipsis; white-space: nowrap;">${n}</span>
        <span class="pdf-status-dot" style="width: 7px; height: 7px; background-color: ${d}; border-radius: 50%; display: inline-block; flex-shrink: 0;" title="${s}"></span>
      </h4>
      <span>${a?"Document Word":t?"Ouvrir le manuel g\xE9n\xE9ral":"Ouvrir le cours PDF"}</span>
    </div>
  `;let u=r.querySelector(".pdf-status-dot");return u&&u.addEventListener("click",p=>{p.preventDefault(),p.stopPropagation(),y(s,"fa-circle-info",4e3)}),r}function kt(e){let t=document.getElementById("all-pdfs-list");!t||!Array.isArray(e)||(t.innerHTML="",e.forEach(n=>{if(!n||typeof n!="string")return;let r=String(n),o=ut(r),a=document.createElement("li"),l=r.toLowerCase().endsWith(".docx"),i=l?"fa-regular fa-file-word":"fa-solid fa-file-pdf",d=l?`pdfs/${encodeURIComponent(r)}`:`pdf_viewer.html?file=${encodeURIComponent(r)}&page=1`,s=c.pdfIndexStatus&&c.pdfIndexStatus[r]||{status:"red",pagesWithText:0,totalPages:0},u=l?"#ef4444":s.status==="green"?"#10b981":s.status==="orange"?"#f59e0b":"#ef4444",p=l?"Document Word (Non indexable, convertissez en PDF pour la recherche)":s.status==="green"?`Indexation compl\xE8te (${s.pagesWithText}/${s.totalPages} pages index\xE9es)`:s.status==="orange"?`Indexation partielle (${s.pagesWithText}/${s.totalPages} pages index\xE9es)`:`Non indexable (0/${s.totalPages} pages, PDF scann\xE9 sans texte)`;a.innerHTML=`
      <a href="${d}" ${l?'target="_blank"':""} class="all-pdfs-list-item" style="display: flex; align-items: center; justify-content: space-between; width: 100%;">
        <div style="display: flex; align-items: center; gap: 10px; min-width: 0; flex-grow: 1;">
          <i class="${i}"></i>
          <span style="overflow: hidden; text-overflow: ellipsis; white-space: nowrap;">${o} (${l?"Word":"PDF"})</span>
        </div>
        <span class="pdf-status-dot" style="width: 8px; height: 8px; background-color: ${u}; border-radius: 50%; flex-shrink: 0; margin-left: 8px;" title="${p}"></span>
      </a>
    `;let f=a.querySelector(".pdf-status-dot");f&&f.addEventListener("click",h=>{h.preventDefault(),h.stopPropagation(),y(p,"fa-circle-info",4e3)}),t.appendChild(a)}))}function $n(){let e=document.getElementById("all-pdfs-list"),t=document.getElementById("pdf-search");if(!e||!t)return;let n=(t.value||"").toLowerCase().trim();e.querySelectorAll("li").forEach(o=>{let a=(o.textContent||"").toLowerCase();o.style.display=!n||a.includes(n)?"block":"none"})}function ot(){let e=document.querySelector(".tab-btn.active"),t=e?e.getAttribute("data-tab"):null,n=document.getElementById("pdf-content-search-input"),r=document.getElementById("pdf-search-results-container"),o={activeCatId:c.activeCat?c.activeCat.id:null,activeTab:t,pdfSearchQuery:n?n.value:"",pdfSearchResultsHTML:r?r.innerHTML:""};localStorage.setItem("dr_cat_navigation_state",JSON.stringify(o))}function At(){let e=localStorage.getItem("dr_cat_navigation_state");if(e)try{let t=JSON.parse(e);if(localStorage.removeItem("dr_cat_navigation_state"),t.activeCatId){let n=document.querySelector(`.cat-item[data-id="${t.activeCatId}"]`);n&&n.click()}if(t.activeTab&&t.activeTab!=="tab-summary"){let n=document.querySelector(`.tab-btn[data-tab="${t.activeTab}"]`);n&&n.click()}if(t.pdfSearchQuery){let n=document.getElementById("pdf-content-search-input");n&&(n.value=t.pdfSearchQuery)}if(t.pdfSearchResultsHTML){let n=document.getElementById("pdf-search-results-container");n&&(n.innerHTML=t.pdfSearchResultsHTML,n.querySelectorAll(".pdf-search-result-card").forEach(r=>{r.addEventListener("click",()=>{ot();let o=decodeURIComponent(r.getAttribute("data-pdf")),a=r.getAttribute("data-page");window.location.href=`pdf_viewer.html?file=${encodeURIComponent(o)}&page=${a}`})}))}}catch(t){console.error("Failed to restore app navigation state:",t)}}function Lt(e){if(!e)return"";let t=S(e);if(t.includes("|")){let a=t.split(`
`),l=!1,i='<table class="print-table">',d=!0;for(let s=0;s<a.length;s++){let u=a[s].trim();if(u.startsWith("|")&&u.endsWith("|")){if(l||(l=!0,d=!0),u.includes("---"))continue;let p=u.split("|").slice(1,-1).map(h=>h.trim()),f=d?"th":"td";i+="<tr>"+p.map(h=>`<${f}>${h}</${f}>`).join("")+"</tr>",d=!1}else l&&(l=!1,i+="</table>",a[s]=i+`
`+a[s],i='<table class="print-table">')}l&&(i+="</table>",a.push(i)),t=a.filter(s=>!(s.trim().startsWith("|")&&s.trim().endsWith("|"))).join(`
`)}t=t.replace(/\*\*([^*\n]+)\*\*/g,"<strong>$1</strong>"),t=t.replace(/\[(.*?)\]\(subcat:[0-9]+\)/g,'<span class="inline-sub-tag">\u21B3 $1</span>'),t=t.replace(/\[\[subcat:[0-9]+:(.*?)\]\]/g,'<span class="inline-sub-tag">\u21B3 $1</span>');let n=t.split(`
`),r=!1,o=[];for(let a=0;a<n.length;a++){let l=n[a].trim();if(!l){r&&(r=!1,o.push("</ul>"));continue}if(l.startsWith("<table")||l.startsWith("</table")||l.startsWith("<tr>")){r&&(r=!1,o.push("</ul>")),o.push(l);continue}l.startsWith("- ")||l.startsWith("\u2022 ")||l.startsWith("* ")?(r||(r=!0,o.push("<ul>")),o.push("<li>"+l.replace(/^[-•*]\s*/,"")+"</li>")):(r&&(r=!1,o.push("</ul>")),o.push("<p>"+l+"</p>"))}return r&&o.push("</ul>"),o.join("")}function Pn(e){if(!e)return"";let t=/(?:^|\n)(?:\*\*|#{2,4}\s*)([0-9]+(?:bis|ter)?\.\s*[^\n]+)(?:\n|$)/gi,n=[...e.matchAll(t)];if(n.length<2)return Lt(e);let r=[],o=0;for(let a=0;a<n.length;a++){let l=n[a],i=l[1].trim().replace(/^\*\*|\*\*$/g,"").replace(/:\s*$/,"").replace(/\*\*$/,"").trim(),d=l.index;if(a===0&&d>0){let s=e.substring(0,d).trim();s&&r.push({header:null,content:s})}a>0&&(r[r.length-1].content=e.substring(o,d).trim()),r.push({header:i,content:""}),o=d+l[0].length}return r.length>0&&(r[r.length-1].content=e.substring(o).trim()),r.map(a=>{if(!a.header)return`<div class="step-intro">${Lt(a.content)}</div>`;let l=a.header.charAt(0);return`
      <div class="step-block">
        <div class="step-title step-title-${["0","1","2","3","4"].includes(l)?l:"1"}">${S(a.header)}</div>
        <div class="step-body">${Lt(a.content)}</div>
      </div>
    `}).join("")}function Dn(e){if(!e)return;let t=new Date().toLocaleDateString("fr-FR"),n=`${e.id}. ${e.title}`,r=e.category||"M\xE9decine G\xE9n\xE9rale",o=e.red_flags||"",a=e.customSummary||e.summary||"",l=Pn(a),i=e.customOrdonnance||e.ordonnance||"",d=Array.isArray(e.sub_cats)?e.sub_cats:[],s=e.notes||"",u="";d.length>0&&(u=`
      <div class="subcats-section">
        <div class="subcats-header">\u{1F500} PROFILS PARTICULIERS & SOUS-FICHES (${d.length})</div>
        <div class="subcat-grid">
          ${d.map((v,m)=>`
            <div class="subcat-card">
              <div class="subcat-card-title"><span class="subcat-badge">${m+1}</span> ${S(v.label||"Profil Sp\xE9cialis\xE9")}</div>
              ${v.red_flags&&v.red_flags.trim()&&v.red_flags!==o?`
                <div class="subcat-rf"><strong>\u{1F6A8} Alerte :</strong> ${S(v.red_flags)}</div>
              `:""}
              <div class="subcat-body">
                ${Pn(v.summary||"")}
              </div>
              ${v.ordonnance&&v.ordonnance.trim()?`
                <div class="subcat-rx-box">
                  <span class="subcat-rx-tag">\u{1F48A} Rx :</span>
                  <pre class="subcat-rx-text">${S(v.ordonnance)}</pre>
                </div>
              `:""}
            </div>
          `).join("")}
        </div>
      </div>
    `);let p=`<!DOCTYPE html>
<html lang="fr">
<head>
  <meta charset="utf-8">
  <title>Dr.CAT \u2014 ${S(n)}</title>
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
    <span class="cat-badge">${S(r)}</span>
    <h1 class="main-title">${S(n)}</h1>
  </div>

  ${o&&o.trim()?`
    <div class="rf-banner">
      <span class="rf-label">\u{1F6A8} RED FLAGS :</span>${S(o)}
    </div>
  `:""}

  <div class="summary-section">
    ${l}
  </div>

  ${i&&i.trim()?`
    <div class="rx-card">
      <div class="rx-header">\u{1F48A} ORDONNANCE TYPE & POSOLOGIES RECOMMAND\xC9ES :</div>
      <pre class="rx-body">${S(i)}</pre>
    </div>
  `:""}

  ${u}

  ${s&&s.trim()?`
    <div class="notes-box">
      <strong>\u{1F4DD} Notes :</strong> ${S(s)}
    </div>
  `:""}

  <div class="doc-footer">
    <div>"Primum non nocere." \u2014 Dr.CAT Rappel Clinique (Protocoles Th\xE9rapeutiques)</div>
    <div>Auteur : Dr. Kibeche Ali</div>
  </div>
</body>
</html>`,f=document.createElement("iframe");f.style.position="fixed",f.style.right="0",f.style.bottom="0",f.style.width="0",f.style.height="0",f.style.border="none",f.style.opacity="0",f.style.pointerEvents="none",document.body.appendChild(f);let h=f.contentWindow.document;h.open(),h.write(p),h.close(),setTimeout(()=>{try{f.contentWindow.focus(),f.contentWindow.print()}catch(v){console.error("Iframe print failed:",v),window.print()}finally{setTimeout(()=>{f&&f.parentNode&&f.parentNode.removeChild(f)},3e3)}},250)}var H,He,Nt,ge,Ft,ie,ye,he,_t,ve,Tt,Bt,rt,it,$t,me,Pt,ne,Ne,Dt,st,Ot,Fe,ct,Mt,Rt;function Mn(e,t,n){if(H=document.getElementById("workspace"),He=document.getElementById("welcome-screen"),Nt=document.getElementById("workspace-cat-category"),ge=document.getElementById("workspace-cat-title"),Ft=document.getElementById("workspace-red-flags"),ie=document.getElementById("workspace-prescription"),ye=document.getElementById("notes-input"),he=document.getElementById("summary-view"),_t=document.getElementById("summary-editor"),ve=document.getElementById("summary-editor-wrapper"),Tt=document.getElementById("edit-summary-btn"),Bt=document.getElementById("cancel-summary-edit-btn"),rt=document.getElementById("save-summary-btn"),it=document.getElementById("save-notes-btn"),$t=document.getElementById("save-indicator"),me=document.getElementById("copy-prescription-btn"),Pt=document.getElementById("current-date"),ne=document.getElementById("pdf-list"),Ne=document.getElementById("all-pdfs-header"),Dt=document.getElementById("all-pdfs-content"),st=Ne?Ne.parentElement:null,Ot=document.getElementById("pdf-search"),Fe=document.getElementById("pdf-content-search-input"),ct=document.getElementById("pdf-content-search-btn"),Mt=document.getElementById("pdf-index-status"),Rt=document.getElementById("pdf-reindex-btn"),Pt){let g=new Date;Pt.textContent=g.toLocaleDateString("fr-FR")}let r=document.getElementById("red-flags-banner");r&&r.addEventListener("click",()=>{window.innerWidth<=850&&r.classList.toggle("expanded")});let o=document.querySelectorAll(".tab-btn");o.forEach(g=>{g.addEventListener("click",()=>{o.forEach(I=>{I.classList.remove("active"),I.setAttribute("aria-selected","false")}),document.querySelectorAll(".tab-pane").forEach(I=>I.classList.remove("active")),g.classList.add("active"),g.setAttribute("aria-selected","true");try{g.scrollIntoView({behavior:"smooth",inline:"center",block:"nearest"})}catch{}let E=g.getAttribute("data-tab"),C=document.getElementById(E);C&&C.classList.add("active"),E==="tab-pdfs"?(kt(c.allPdfs),c.activeCat&&Rn(c.activeCat)):E==="tab-search-pdf"&&Fe&&Fe.focus();let _=document.querySelector(".tab-content-container");_&&(_.scrollTop=0)})});let a=document.querySelectorAll(".status-btn");a.forEach(g=>{g.addEventListener("click",()=>{if(!c.activeCat)return;let E=g.getAttribute("data-status");a.forEach(_=>_.classList.remove("active")),g.classList.add("active"),c.activeCat.status=E,c.activeCat.lastRead=Date.now();let C=q();C[c.activeCat.id]||(C[c.activeCat.id]={}),C[c.activeCat.id].status=E,C[c.activeCat.id].notes=c.activeCat.notes||"",C[c.activeCat.id].lastRead=Date.now(),Je(C),e(c.activeCat),(E==="doing"||E==="done")&&Object.values(q()).filter(I=>I.status==="doing"||I.status==="done").length===20&&y("<strong>Beau travail, 20 fiches en cours ! \u{1F389}</strong><br>Pensez \xE0 exporter votre progression via le tableau de bord pour ne rien perdre.","fa-floppy-disk",8e3)})}),it&&it.addEventListener("click",()=>{if(!c.activeCat)return;let g=Ie(it,'<i class="fa-solid fa-floppy-disk"></i> Sauvegarder');c.activeCat.notes=ye.value,c.activeCat.lastRead=Date.now();let E=q();E[c.activeCat.id]||(E[c.activeCat.id]={}),E[c.activeCat.id].status=c.activeCat.status||"todo",E[c.activeCat.id].notes=c.activeCat.notes,E[c.activeCat.id].lastRead=Date.now(),Je(E),$t.classList.add("show"),setTimeout(()=>{$t.classList.remove("show")},2500),U(!0),setTimeout(()=>{g(),y("Notes sauvegard\xE9es localement. Exportez r\xE9guli\xE8rement vos donn\xE9es depuis le <strong>tableau de bord</strong> pour les s\xE9curiser.","fa-cloud-arrow-up",6e3)},400)});let l=document.getElementById("workspace-back-to-quiz-btn");l&&l.addEventListener("click",()=>{c.quizSession.quizViewingCatId=null,H&&(H.style.display="none");let g=document.getElementById("quiz-screen");g&&(g.style.display="flex"),document.querySelectorAll(".cat-item").forEach(E=>E.classList.remove("active"))});let i=document.getElementById("print-cat-btn");i&&i.addEventListener("click",async()=>{let g=c.activeCat;if(g)if(typeof window.Capacitor<"u"||B){let E=Bn(g);if(navigator.clipboard&&navigator.clipboard.writeText)try{await navigator.clipboard.writeText(E),y("Fiche compl\xE8te (avec sous-fiches) copi\xE9e dans le presse-papier !","fa-clipboard-check",4e3)}catch{y("L'impression native n'est pas disponible. Utilisez la version web.","fa-circle-info",5e3)}else y("L'impression native n'est pas disponible. Utilisez la version web.","fa-circle-info",5e3)}else Dn(g)}),Tt&&Tt.addEventListener("click",()=>{he.style.display="none",ve.style.display="flex";let g=c.activeSubCatIndex>0&&Array.isArray(c.activeCat?.sub_cats);_t.value=g?c.activeCat.sub_cats[c.activeSubCatIndex-1].summary||"":c.activeCat?.summary||""}),Bt&&Bt.addEventListener("click",()=>{he.style.display="block",ve.style.display="none"}),rt&&rt.addEventListener("click",async()=>{if(!c.activeCat)return;let g=_t.value;if(!g.trim()){y("La synth\xE8se ne peut pas \xEAtre vide.","fa-triangle-exclamation",3e3);return}let E=Ie(rt);try{let C=c.activeSubCatIndex>0&&Array.isArray(c.activeCat.sub_cats);if(c.isAdmin){let _;if(C?(c.activeCat.sub_cats[c.activeSubCatIndex-1].summary=g,_=await Pe(c.activeCat.id,{sub_cats:c.activeCat.sub_cats})):_=await Pe(c.activeCat.id,{summary:g}),_.success){C||(c.activeCat.summary=g);let I=(c.allCats||[]).find(Ee=>Ee.id===c.activeCat.id);I&&(C?I.sub_cats=c.activeCat.sub_cats:I.summary=g);let X=C?c.activeCat.sub_cats[c.activeSubCatIndex-1].label:null;nt(g,c.activeCat,X),y(C?"Sous-fiche mise \xE0 jour avec succ\xE8s !":"Synth\xE8se mise \xE0 jour avec succ\xE8s !","fa-circle-check",2500),U(!0)}else y("Erreur: "+_.error,"fa-circle-exclamation",4e3),U(!1)}else{if(!confirm(`Attention : Vos modifications ne seront pas appliqu\xE9es directement dans l'application. Elles seront envoy\xE9es \xE0 l'administrateur du site pour relecture et validation avant d'\xEAtre int\xE9gr\xE9es.

Souhaitez-vous envoyer cette proposition ?`)){E();return}let I=C?JSON.parse(JSON.stringify(c.activeCat.sub_cats)):null;I&&(I[c.activeSubCatIndex-1].summary=g),await Ce(De,{type:"edit",catId:c.activeCat.id,data:C?{sub_cats:I}:{summary:g}},"Votre proposition de modification a \xE9t\xE9 envoy\xE9e \xE0 l'administrateur pour validation.")}}catch(C){if(console.error(C),window.handleAdminError&&await window.handleAdminError(C)){E();return}y("Erreur lors de la sauvegarde.","fa-circle-exclamation",4e3),U(!1)}finally{E()}he.style.display="block",ve.style.display="none"}),me&&me.addEventListener("click",()=>{let g="";c.prescriptionVariants.length>0&&c.prescriptionVariants[c.activePrescriptionVariantIndex]?g=c.prescriptionVariants[c.activePrescriptionVariantIndex].content:g=ie.innerText,navigator.clipboard.writeText(g).then(()=>{let E=me.innerHTML;me.innerHTML='<i class="fa-solid fa-check"></i> Copi\xE9 !',setTimeout(()=>{me.innerHTML=E},2e3)})});let d=document.getElementById("edit-prescription-btn"),s=document.getElementById("cancel-prescription-edit-btn"),u=document.getElementById("save-prescription-btn"),p=document.getElementById("prescription-editor"),f=document.getElementById("prescription-editor-actions");d&&d.addEventListener("click",()=>{ie.style.display="none",p.style.display="block",f.style.display="flex";let g=c.activeSubCatIndex>0&&Array.isArray(c.activeCat?.sub_cats);p.value=g?c.activeCat.sub_cats[c.activeSubCatIndex-1].ordonnance||"":c.activeCat?.ordonnance||""}),s&&s.addEventListener("click",()=>{ie.style.display="block",p.style.display="none",f.style.display="none"}),u&&u.addEventListener("click",async()=>{if(!c.activeCat)return;let g=p.value;if(!g.trim()){y("L'ordonnance ne peut pas \xEAtre vide.","fa-triangle-exclamation",3e3);return}let E=Ie(u);try{let C=c.activeSubCatIndex>0&&Array.isArray(c.activeCat.sub_cats);if(c.isAdmin){let _;if(C?(c.activeCat.sub_cats[c.activeSubCatIndex-1].ordonnance=g,_=await Pe(c.activeCat.id,{sub_cats:c.activeCat.sub_cats})):_=await Pe(c.activeCat.id,{ordonnance:g}),_.success){C||(c.activeCat.ordonnance=g);let I=(c.allCats||[]).find(X=>X.id===c.activeCat.id);I&&(C?I.sub_cats=c.activeCat.sub_cats:I.ordonnance=g),at(g),y(C?"Ordonnance de la sous-fiche mise \xE0 jour !":"Ordonnance type mise \xE0 jour avec succ\xE8s !","fa-circle-check",2500),U(!0)}else y("Erreur: "+_.error,"fa-circle-exclamation",4e3),U(!1)}else{if(!confirm(`Attention : Vos modifications ne seront pas appliqu\xE9es directement dans l'application. Elles seront envoy\xE9es \xE0 l'administrateur du site pour relecture et validation avant d'\xEAtre int\xE9gr\xE9es.

Souhaitez-vous envoyer cette proposition ?`)){E();return}let I=C?JSON.parse(JSON.stringify(c.activeCat.sub_cats)):null;I&&(I[c.activeSubCatIndex-1].ordonnance=g),await Ce(De,{type:"edit",catId:c.activeCat.id,data:C?{sub_cats:I}:{ordonnance:g}},"Votre proposition de modification de l'ordonnance a \xE9t\xE9 envoy\xE9e \xE0 l'administrateur pour validation.")}}catch(C){if(console.error(C),window.handleAdminError&&await window.handleAdminError(C)){E();return}y("Erreur lors de la sauvegarde.","fa-circle-exclamation",4e3)}finally{E()}ie.style.display="block",p.style.display="none",f.style.display="none"}),Ne&&Ne.addEventListener("click",()=>{st.classList.contains("open")?(st.classList.remove("open"),Dt.style.display="none"):(st.classList.add("open"),Dt.style.display="block",kt(c.allPdfs))}),Ot&&Ot.addEventListener("input",$n);let h=document.getElementById("delete-cat-btn");h&&h.addEventListener("click",async()=>{if(!c.activeCat)return;let g=c.activeCat,E=g.id,C=g.title;if(confirm(`Voulez-vous vraiment supprimer d\xE9finitivement la fiche "${C}" (ID: ${E}) ?`))try{let _=await mn(E);_&&(_.success||_.message)?(y(`La fiche "${S(C)}" a \xE9t\xE9 supprim\xE9e avec succ\xE8s.`,"fa-circle-check",4e3),c.allCats=c.allCats.filter(I=>I.id!==E),t?await t(E):n&&await n(),be(null)):y(S(_.error||"\xC9chec de la suppression de la fiche."),"fa-triangle-exclamation",4e3)}catch(_){console.error("[Delete CAT Error]",_),y("Erreur lors de la suppression de la fiche.","fa-circle-exclamation",4e3)}});let v=document.getElementById("reset-progress-btn");v&&v.addEventListener("click",async()=>{confirm("Voulez-vous vraiment r\xE9initialiser toute votre progression et vos notes ? Cette action est irr\xE9versible et n'affectera que ce navigateur.")&&(localStorage.removeItem("dr_cat_user_progress"),localStorage.removeItem("dr_cat_leitner"),localStorage.removeItem("dr_cat_streak"),localStorage.removeItem("dr_cat_local_overrides"),c.allCats.forEach(g=>{g.status="todo",g.notes="",g.lastRead=0}),c.activeCat&&(c.activeCat.status="todo",c.activeCat.notes="",c.activeCat.lastRead=0,ye&&(ye.value=""),document.querySelectorAll(".status-btn").forEach(E=>{E.classList.remove("active"),E.getAttribute("data-status")==="todo"&&E.classList.add("active")})),y("Progression r\xE9initialis\xE9e avec succ\xE8s !","fa-circle-check",3e3),n&&await n())});let m=document.getElementById("reader-mode-btn"),b=document.getElementById("summary-reader-modal"),w=document.getElementById("close-reader-modal-btn"),x=document.getElementById("reader-cat-category"),$=document.getElementById("reader-cat-title"),M=document.getElementById("reader-summary-view");function z(){if(!c.activeCat||!b)return;x&&(x.textContent=c.activeCat.category),$&&($.textContent=`${c.activeCat.id}. ${c.activeCat.title}`);let g=c.activeCat.customSummary||c.activeCat.summary||"";M&&(M.innerHTML=Ge(g)),b.style.display="flex",document.body.style.overflow="hidden"}function F(){b&&(b.style.display="none",document.body.style.overflow="")}m&&m.addEventListener("click",z),w&&w.addEventListener("click",F),b&&b.addEventListener("click",g=>{g.target===b&&F()}),document.addEventListener("keydown",g=>{g.key==="Escape"&&b&&b.style.display==="flex"&&F()}),ct&&ct.addEventListener("click",On),Fe&&Fe.addEventListener("keydown",g=>{g.key==="Enter"&&On()}),Rt&&Rt.addEventListener("click",ba),B&&Mt&&(Mt.style.display="none"),document.addEventListener("click",g=>{let E=g.target.closest("a");E&&E.getAttribute("href")&&E.getAttribute("href").includes("pdf_viewer.html")&&ot()});let T=0,K=0,j=0,Qt=0,We=!1;H&&(H.addEventListener("touchstart",g=>{if(We=!1,!g.target||typeof g.target.closest!="function"||!(g.target.closest(".workspace-header")||g.target.closest("#red-flags-banner"))||g.target.closest("#subcat-selector-bar")||g.target.closest(".subcat-pill"))return;let C=g.target.tagName.toLowerCase(),_=g.target.closest("#summary-editor")||g.target.closest("#notes-input");C==="textarea"||C==="input"||_||(We=!0,T=g.changedTouches[0].screenX,K=g.changedTouches[0].screenY)},{passive:!0}),H.addEventListener("touchend",g=>{We&&(We=!1,!(!g.target||typeof g.target.closest!="function")&&(j=g.changedTouches[0].screenX,Qt=g.changedTouches[0].screenY,oa()))},{passive:!0}));function oa(){let g=j-T,E=Qt-K;if(Math.abs(g)>60&&Math.abs(g)>Math.abs(E)*2){let _=document.querySelector(".cat-item.active"),I=Array.from(document.querySelectorAll(".cat-item"));if(I.length===0||!_)return;let X=I.indexOf(_);if(X===-1)return;let Ee=X;g<0?Ee=(X+1)%I.length:Ee=(X-1+I.length)%I.length;let dt=I[Ee];dt&&(dt.click(),dt.scrollIntoView({block:"nearest",behavior:Q()?"auto":"smooth"}),U(!0))}}}function be(e,t=!1){if(window.perf&&window.perf.startMeasure("workspace.selectCat"),c.activeCat=e,c.activeSubCatIndex=0,c.activePrescriptionVariantIndex=0,!e){H&&(H.style.display="none"),He&&(He.style.display="flex"),document.querySelectorAll(".cat-item").forEach(u=>u.classList.remove("active")),window.perf&&window.perf.endMeasure("workspace.selectCat");return}if(!t){e.lastRead=Date.now();let u=q();u[e.id]||(u[e.id]={}),u[e.id].lastRead=Date.now(),u[e.id].status=e.status||"todo",u[e.id].notes=e.notes||"",Je(u)}document.querySelectorAll(".cat-item").forEach(u=>{u.classList.remove("active"),parseInt(u.getAttribute("data-id"))===e.id&&u.classList.add("active")}),He&&(He.style.display="none"),H&&(H.style.display="flex");let n=document.getElementById("quiz-screen");n&&(n.style.display="none");let r=document.getElementById("workspace-back-to-quiz-btn");if(r&&(c.quizSession&&c.quizSession.quizViewingCatId===e.id?r.style.display="inline-flex":r.style.display="none"),Nt&&(Nt.textContent=e.category),ge){let u=`${e.id}. ${e.title}`;if(u.length>50){ge.classList.add("very-long-title");let p=S(u);p.includes(" et ")?p=p.replace(" et ","<br>et "):p.includes(" avec ")?p=p.replace(" avec ","<br>avec "):p.includes(" : ")&&(p=p.replace(" : "," :<br>")),ge.innerHTML=p}else ge.classList.remove("very-long-title"),ge.textContent=u}Ft&&(Ft.textContent=e.red_flags);let o=document.getElementById("red-flags-banner");o&&(o.classList.remove("expanded"),e.red_flags&&e.red_flags.trim().length>0?o.style.display="block":o.style.display="none"),document.querySelectorAll(".status-btn").forEach(u=>{u.classList.remove("active"),u.getAttribute("data-status")===e.status&&u.classList.add("active")}),xa(e),nt(e.customSummary||e.summary,e),ye&&(ye.value=e.notes||""),at(e.customOrdonnance||e.ordonnance);let a=document.getElementById("prescription-editor"),l=document.getElementById("prescription-editor-actions");if(a&&(a.style.display="none"),l&&(l.style.display="none"),ie&&(ie.style.display="block"),Rn(e),!t){document.querySelectorAll(".tab-btn").forEach(f=>{f.classList.remove("active"),f.setAttribute("aria-selected","false")}),document.querySelectorAll(".tab-pane").forEach(f=>f.classList.remove("active"));let u=document.querySelector('.tab-btn[data-tab="tab-summary"]'),p=document.getElementById("tab-summary");u&&(u.classList.add("active"),u.setAttribute("aria-selected","true")),p&&p.classList.add("active")}he&&(he.style.display="block"),ve&&(ve.style.display="none");let i=document.getElementById("delete-cat-btn"),d=document.getElementById("edit-summary-btn"),s=document.getElementById("edit-prescription-btn");if(B){i&&(i.style.display="none");let u=c.isOnlineAtStartup?"inline-flex":"none";d&&(d.style.display=u),s&&(s.style.display=u)}else d&&(d.style.display="inline-flex"),s&&(s.style.display="inline-flex"),i&&(e.id>55&&c.isAdmin?i.style.display="inline-flex":i.style.display="none");window.perf&&window.perf.endMeasure("workspace.selectCat")}async function ze(){let e=document.getElementById("pdf-index-status");if(e)try{let t=await xn(),n="";t.isIndexing?(n=`<span class="status-text text-warning"><i class="fa-solid fa-circle-notch fa-spin"></i> Indexation en cours... (${t.indexedFiles}/${t.totalFiles} fichiers)</span>`,setTimeout(ze,2e3)):n=`<span class="status-text text-success"><i class="fa-solid fa-circle-check"></i> Indexation termin\xE9e (${t.indexedFiles}/${t.totalFiles} fichiers index\xE9s)</span>`;let r=e.querySelector(".status-text");r&&(r.innerHTML=n)}catch(t){console.error("Failed to fetch index status:",t)}}async function On(){let e=document.getElementById("pdf-content-search-input"),t=document.getElementById("pdf-search-loading"),n=document.getElementById("pdf-search-results-container");if(!e||!t||!n)return;let r=e.value.trim();if(!r)return;let o=Ie(ct,'<i class="fa-solid fa-magnifying-glass"></i> Rechercher');t.style.display="flex",n.innerHTML="";try{let a=await wn(r);if(a.status===503){let s=await a.json();n.innerHTML=`<p class="text-warning text-center" style="margin-top: 20px;"><i class="fa-solid fa-triangle-exclamation"></i> ${s.error}</p>`;return}let i=(await a.json()).results;if(!i||i.length===0){n.innerHTML=`<p class="text-muted text-center" style="margin-top: 30px;">Aucun r\xE9sultat trouv\xE9 pour "${r}". V\xE9rifiez l'orthographe.</p>`;return}let d="";i.forEach(s=>{let u=S(s.snippet),f=S(r).replace(/[-\\^$*+?.()|[\]{}]/g,"\\$&"),h=new RegExp(`(${f})`,"gi"),v=u.replace(h,"<mark>$1</mark>"),m=S(s.pdf.replace(/^\d+锔忊儯\d+锔忊儯/i,"").replace(/^\d+锔忊儯/i,"").replace(/馃[A-Z0-9]/g,"").replace(/_/g," ").replace(/\.pdf$/i,""));d+=`
        <div class="pdf-search-result-card" data-pdf="${encodeURIComponent(s.pdf)}" data-page="${s.page}">
          <div class="pdf-search-result-header">
            <span class="pdf-search-result-title"><i class="fa-solid fa-file-pdf"></i> ${m}</span>
            <span class="pdf-search-result-page">Page ${s.page}</span>
          </div>
          <div class="pdf-search-result-snippet">${v}</div>
        </div>
      `}),n.innerHTML=d,document.querySelectorAll(".pdf-search-result-card").forEach(s=>{s.addEventListener("click",()=>{ot();let u=decodeURIComponent(s.getAttribute("data-pdf")),p=s.getAttribute("data-page");window.location.href=`pdf_viewer.html?file=${encodeURIComponent(u)}&page=${p}`})})}catch(a){console.error("PDF search error:",a),n.innerHTML='<p class="text-danger text-center" style="margin-top: 20px;">Une erreur est survenue lors de la recherche.</p>'}finally{t.style.display="none",o&&o()}}async function ba(){try{(await En()).success&&ze()}catch(e){if(console.error("Failed to trigger re-index:",e),window.handleAdminError&&await window.handleAdminError(e))return;y("Erreur lors de la r\xE9indexation.","fa-circle-exclamation",4e3)}}function Rn(e){if(!ne)return;ne.innerHTML="";let t=Array.isArray(e?.pdf_keywords)?e.pdf_keywords:[],n=e?.category?e.category.toLowerCase():"",r=Array.isArray(e?.tags)?e.tags.map(s=>s.toLowerCase()):[],o=["urgence","urgences","traitement","th\xE9rapeutique","ordonnance","ordonnances","manuel","guide"],a=[n,...r,...o].filter(s=>s&&s.trim().length>2),l=c.allPdfs.filter(s=>{if(!s)return!1;let u=s.toLowerCase();return t.some(p=>p&&typeof p=="string"&&u.includes(p.toLowerCase()))}),i=c.allPdfs.filter(s=>{if(!s)return!1;let u=s.toLowerCase();return t.some(f=>f&&typeof f=="string"&&u.includes(f.toLowerCase()))?!1:a.some(f=>u.includes(f))}),d=document.createElement("h4");if(d.style.gridColumn="1 / -1",d.style.color="var(--color-primary)",d.style.margin="10px 0 5px",d.style.fontSize="14px",d.style.fontWeight="600",d.innerHTML='<i class="fa-solid fa-graduation-cap"></i> Cours & R\xE9f\xE9rences Sp\xE9cifiques',ne.appendChild(d),l.length===0){let s=document.createElement("p");s.className="text-muted",s.style.gridColumn="1 / -1",s.style.fontSize="13px",s.style.margin="5px 0 15px",s.textContent="Aucun PDF de sp\xE9cialit\xE9 sp\xE9cifique trouv\xE9 pour ce sujet dans vos fichiers.",ne.appendChild(s)}else l.forEach(s=>{ne.appendChild(It(s,!1))});if(i.length>0){let s=document.createElement("h4");s.style.gridColumn="1 / -1",s.style.color="var(--color-success)",s.style.margin="20px 0 5px",s.style.fontSize="14px",s.style.fontWeight="600",s.innerHTML=`<i class="fa-solid fa-book-medical"></i> Manuels & Guides (${e?.category||"G\xE9n\xE9raux"})`,ne.appendChild(s),i.forEach(u=>{ne.appendChild(It(u,!0))})}}function xa(e){let t=document.getElementById("subcat-selector-bar");t&&(t.style.display="none",t.innerHTML="")}window.switchToSubProfile=function(e){if(!c.activeCat)return;let t=Array.isArray(c.activeCat.sub_cats)&&c.activeCat.sub_cats.length>0?c.activeCat.sub_cats:[],n=[{label:"\u{1FA7A} Standard (Adulte)",summary:c.activeCat.summary,red_flags:c.activeCat.red_flags,ordonnance:c.activeCat.ordonnance},...t],r=Number(e);if(r<0||r>=n.length)return;c.activeSubCatIndex=r;let o=n[r],a=document.getElementById("workspace-red-flags");a&&(a.textContent=o.red_flags||c.activeCat.red_flags),nt(o.summary||c.activeCat.summary,c.activeCat,r>0?o.label:null),at(o.ordonnance||c.activeCat.ordonnance),U(!0);let l=document.getElementById("summary-view");l&&l.scrollIntoView({behavior:"smooth",block:"start"})};function Nn(e){let t=0,n=0,r=0;return e.forEach(o=>{o.status==="done"?r++:o.status==="doing"?n++:t++}),{todo:t,doing:n,done:r,total:e.length}}function Fn(){let e=0;try{let t=JSON.parse(localStorage.getItem("dr_cat_streak")||'{"count": 0}');e=t&&typeof t.count=="number"?t.count:0}catch(t){console.warn("Failed to parse study streak info",t)}return e}function Hn(e,t,n){if(!e)return;e.innerHTML="";let r=[...t].sort((o,a)=>(a.lastRead||0)-(o.lastRead||0));if(r.length===0){e.innerHTML='<li class="empty-state">Aucun cours en cours. S\xE9lectionnez un cours dans la barre lat\xE9rale pour commencer !</li>';return}r.slice(0,5).forEach(o=>{let a=document.createElement("li");a.style.cursor="pointer",a.innerHTML=`
      <div style="display: flex; justify-content: space-between; align-items: center; width: 100%;">
        <div>
          <span class="resume-title" style="font-weight: 600; color: var(--color-primary);">${o.id}. ${o.title}</span>
          <span style="font-size: 11px; color: var(--text-muted); display: block;">Sp\xE9cialit\xE9 : ${o.category}</span>
        </div>
        <span class="badge ${o.status==="done"?"badge-success":"badge-warning"}" style="font-size: 11px; padding: 2px 8px; border-radius: 4px;">
          ${o.status==="done"?"Ma\xEEtris\xE9":"En cours"}
        </span>
      </div>
    `,a.addEventListener("click",()=>n(o)),e.appendChild(a)})}function zn(e,t){if(!e)return;e.innerHTML="";let n={};t.forEach(r=>{n[r.category]||(n[r.category]={total:0,done:0}),n[r.category].total++,r.status==="done"&&n[r.category].done++}),Object.keys(n).forEach(r=>{let o=n[r],a=o.total>0?Math.round(o.done/o.total*100):0,l=document.createElement("div");l.className="category-progress-item",l.innerHTML=`
      <div class="category-progress-info">
        <span>${r}</span>
        <span>${o.done}/${o.total} (${a}%)</span>
      </div>
      <div class="progress-bar-bg">
        <div class="progress-bar-fill" style="width: ${a}%"></div>
      </div>
    `,e.appendChild(l)})}function jn(e){e.innerHTML=`
    <div style="margin-bottom: 24px;">
      <h3 style="margin-top: 0; color: var(--text-primary); display: flex; align-items: center; gap: 8px;">
        <i class="fa-solid fa-file-pdf" style="color: var(--color-danger);"></i> Gestion des PDFs
      </h3>
      <p style="color: var(--text-secondary); font-size: 13.5px; line-height: 1.5; margin-bottom: 20px;">
        Uploadez des documents PDF m\xE9dicaux. Ils seront automatiquement hash\xE9s, index\xE9s et stock\xE9s dans la base de donn\xE9es de recherche pour l'application mobile.
      </p>
      
      <div class="pdf-upload-card" style="background: var(--bg-card); border: 1px dashed var(--border-color); border-radius: var(--radius-md); padding: 20px; text-align: center; display: flex; flex-direction: column; align-items: center; gap: 12px; transition: var(--transition-smooth);">
        <i class="fa-solid fa-cloud-arrow-up" style="font-size: 32px; color: var(--color-primary);"></i>
        <div style="font-size: 14px; font-weight: 500; color: var(--text-primary);">D\xE9posez un fichier PDF ici ou cliquez pour parcourir</div>
        <input type="file" id="admin-pdf-upload-input" accept=".pdf" style="display: none;">
        <button class="btn-gradient-primary" id="admin-pdf-trigger-btn" style="padding: 8px 16px; border-radius: var(--radius-sm); border: none; color: white; cursor: pointer; font-weight: 600;">
          <i class="fa-solid fa-folder-open"></i> S\xE9lectionner un fichier
        </button>
        <div id="admin-pdf-filename" style="font-size: 12px; color: var(--text-muted); max-width: 200px; white-space: nowrap; overflow: hidden; text-overflow: ellipsis; display: none;"></div>
        
        <button class="btn-outline-success" id="admin-pdf-submit-btn" disabled style="display: none; padding: 8px 16px; border-radius: var(--radius-sm); cursor: pointer; font-weight: 600; width: 100%; max-width: 250px;">
          <i class="fa-solid fa-upload"></i> D\xE9marrer l'Indexation
        </button>
      </div>
    </div>

    <div style="margin-top: 24px; border-top: 1px solid var(--border-color); padding-top: 20px;">
      <h4 style="margin-top: 0; color: var(--text-primary); font-size: 14px;">\u{1F6E0}\uFE0F Outils de D\xE9veloppement & Laboratoires</h4>
      <p style="color: var(--text-secondary); font-size: 12px; margin-bottom: 12px;">Acc\xE9dez aux laboratoires isol\xE9s d'extraction PDF, d'analyse d'audience et de g\xE9n\xE9ration de base V2.</p>
      <div style="display: flex; gap: 10px; flex-wrap: wrap;">
        <a href="/admin/pdf_lab.html" target="_blank" style="display: inline-flex; align-items: center; gap: 6px; padding: 6px 12px; background: var(--bg-sidebar); border: 1px solid var(--border-color); color: var(--text-primary); text-decoration: none; border-radius: var(--radius-sm); font-size: 12px; transition: background 0.2s;">
          <i class="fa-solid fa-flask"></i> Ouvrir le Labo PDF
        </a>
        <a href="/admin/cat_generator_lab.html" target="_blank" style="display: inline-flex; align-items: center; gap: 6px; padding: 6px 12px; background: var(--bg-sidebar); border: 1px solid var(--border-color); color: var(--color-primary); text-decoration: none; border-radius: var(--radius-sm); font-size: 12px; transition: background 0.2s;">
          <i class="fa-solid fa-stethoscope"></i> Ouvrir le Labo CAT Generator V2
        </a>
      </div>
    </div>
  `,Ea()}function Ea(){let e=document.getElementById("admin-pdf-upload-input"),t=document.getElementById("admin-pdf-trigger-btn"),n=document.getElementById("admin-pdf-filename"),r=document.getElementById("admin-pdf-submit-btn"),o=null,a=null;t&&t.addEventListener("click",()=>e.click()),e&&e.addEventListener("change",l=>{let i=l.target.files[0];if(!i){o=null,a=null,n.style.display="none",r.style.display="none",r.disabled=!0;return}o=i,n.textContent=i.name,n.style.display="block",r.style.display="flex",r.disabled=!0,r.innerHTML='<i class="fa-solid fa-spinner fa-spin"></i> Pr\xE9paration...';let d=new FileReader;d.onload=s=>{a=s.target.result.split(",")[1],r.disabled=!1,r.innerHTML=`<i class="fa-solid fa-upload"></i> D\xE9marrer l'Indexation`},d.onerror=()=>{y("Erreur lors de la lecture du fichier","fa-triangle-exclamation",4e3)},d.readAsDataURL(i)}),r&&r.addEventListener("click",async()=>{if(!(!o||!a)){r.disabled=!0,r.innerHTML='<i class="fa-solid fa-spinner fa-spin"></i> Envoi en cours...';try{let l=await k(L("/api/admin/upload-pdf"),{method:"POST",headers:A({"Content-Type":"application/json"}),body:JSON.stringify({filename:o.name,base64Data:a})});if(!l.ok){let i=await l.json().catch(()=>({}));throw new Error(i.error||"Failed to upload PDF")}y("Fichier PDF upload\xE9 avec succ\xE8s! L'indexation tourne en arri\xE8re-plan.","fa-circle-check",4e3),e.value="",o=null,a=null,n.style.display="none",r.style.display="none"}catch(l){console.error("[Admin PDF]",l),y(`\xC9chec: ${l.message}`,"fa-triangle-exclamation",4e3),r.disabled=!1,r.innerHTML='<i class="fa-solid fa-rotate-right"></i> R\xE9essayer'}}})}function G(e){return String(e||"").replace(/[&<>'"]/g,t=>({"&":"&amp;","<":"&lt;",">":"&gt;","'":"&#39;",'"':"&quot;"})[t]||t)}async function xe(e){if(e)try{let t=await Cn(),n=!!t.forceUpdateActive,r=t.downloadLinks||{};e.innerHTML=`
      <div class="admin-version-panel" style="display: flex; flex-direction: column; gap: 20px;">
        
        <!-- Status Header Card -->
        <div style="background: ${n?"rgba(239, 68, 68, 0.15)":"rgba(16, 185, 129, 0.15)"}; border: 1px solid ${n?"rgba(239, 68, 68, 0.4)":"rgba(16, 185, 129, 0.4)"}; border-radius: 12px; padding: 18px; display: flex; align-items: center; justify-content: space-between; flex-wrap: wrap; gap: 12px;">
          <div>
            <h3 style="margin: 0 0 4px 0; font-size: 16px; font-weight: 700; color: var(--text-primary); display: flex; align-items: center; gap: 8px;">
              <i class="${n?"fa-solid fa-triangle-exclamation text-danger":"fa-solid fa-shield-check text-success"}"></i>
              Statut du Kill Switch : ${n?'<span style="color: var(--color-danger);">ACTIV\xC9 (Mise \xE0 jour obligatoire)</span>':'<span style="color: var(--color-success);">INACTIF (Acc\xE8s normal)</span>'}
            </h3>
            <p style="margin: 0; font-size: 13px; color: var(--text-secondary);">
              ${n?"Toutes les versions ant\xE9rieures \xE0 v"+G(t.minVersion||"1.1.6")+" sont actuellement bloqu\xE9es.":"L'application fonctionne normalement pour tous les utilisateurs."}
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
                <input type="text" id="ver-input-min" value="${G(t.minVersion||"1.1.6")}" style="width: 100%; padding: 8px 12px; border-radius: 6px; border: 1px solid var(--border-color); background: var(--bg-input); color: var(--text-primary); font-size: 13px; font-weight: 600;">
              </div>

              <div>
                <label style="display: block; font-size: 12px; font-weight: 600; color: var(--text-secondary); margin-bottom: 4px;">Derni\xE8re Version Disponible (latestVersion)</label>
                <input type="text" id="ver-input-latest" value="${G(t.latestVersion||"1.1.6")}" style="width: 100%; padding: 8px 12px; border-radius: 6px; border: 1px solid var(--border-color); background: var(--bg-input); color: var(--text-primary); font-size: 13px; font-weight: 600;">
              </div>
            </div>

            <div>
              <label style="display: block; font-size: 12px; font-weight: 600; color: var(--text-secondary); margin-bottom: 4px;">Message de Notification</label>
              <textarea id="ver-input-message" rows="2" style="width: 100%; padding: 8px 12px; border-radius: 6px; border: 1px solid var(--border-color); background: var(--bg-input); color: var(--text-primary); font-size: 13px; resize: vertical;">${G(t.updateMessage||"")}</textarea>
            </div>

            <div>
              <label style="display: block; font-size: 12px; font-weight: 600; color: var(--text-secondary); margin-bottom: 4px;">Nouveaut\xE9s de la mise \xE0 jour (Release Notes publiques - une note par ligne)</label>
              <textarea id="ver-input-releasenotes" rows="4" style="width: 100%; padding: 8px 12px; border-radius: 6px; border: 1px solid var(--border-color); background: var(--bg-input); color: var(--text-primary); font-size: 13px; resize: vertical;" placeholder="Am\xE9lioration g\xE9n\xE9rale de la rapidit\xE9 et de la stabilit\xE9&#10;Optimisation de la recherche et de la consultation des fiches cliniques&#10;Mise \xE0 jour de s\xE9curit\xE9 et corrections d'affichage">${G(Array.isArray(t.releaseNotes)?t.releaseNotes.join(`
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
                  <input type="url" id="ver-input-uptodown" value="${G(r.uptodownUrl||"")}" placeholder="https://dr-cat.en.uptodown.com/android" style="width: 100%; padding: 7px 10px; border-radius: 6px; border: 1px solid var(--border-color); background: var(--bg-input); color: var(--text-primary); font-size: 12px;">
                </div>

                <div>
                  <label style="font-size: 11px; font-weight: 600; color: var(--text-secondary);">Bouton 2 : Lien Canal Telegram Officiel</label>
                  <input type="url" id="ver-input-telegram" value="${G(r.telegramUrl||"")}" placeholder="https://t.me/DrCatOfficialApp" style="width: 100%; padding: 7px 10px; border-radius: 6px; border: 1px solid var(--border-color); background: var(--bg-input); color: var(--text-primary); font-size: 12px;">
                </div>

                <div>
                  <label style="font-size: 11px; font-weight: 600; color: var(--text-secondary);">Bouton 3 : Lien Direct Serveur / APK</label>
                  <input type="text" id="ver-input-direct" value="${G(r.directServerUrl||"")}" placeholder="/download/drcat-latest.apk" style="width: 100%; padding: 7px 10px; border-radius: 6px; border: 1px solid var(--border-color); background: var(--bg-input); color: var(--text-primary); font-size: 12px;">
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
    `;let o=e.querySelector("#admin-toggle-killswitch-btn");o&&o.addEventListener("click",async()=>{try{let l=!n;o.disabled=!0,o.innerHTML='<i class="fa-solid fa-spinner fa-spin"></i> Mise \xE0 jour...',await vt({forceUpdateActive:l}),alert(`Statut du Kill Switch mis \xE0 jour : ${l?"ACTIV\xC9 \u{1F6A8}":"D\xC9SACTIV\xC9 \u{1F7E2}"}`),xe(e)}catch(l){alert(`Erreur lors du basculement : ${l.message}`),xe(e)}});let a=e.querySelector("#admin-version-form");a&&a.addEventListener("submit",async l=>{l.preventDefault();let i=a.querySelector("#admin-save-version-btn");try{i.disabled=!0,i.innerHTML='<i class="fa-solid fa-spinner fa-spin"></i> Enregistrement...';let d={minVersion:a.querySelector("#ver-input-min").value.trim(),latestVersion:a.querySelector("#ver-input-latest").value.trim(),updateMessage:a.querySelector("#ver-input-message").value.trim(),releaseNotes:a.querySelector("#ver-input-releasenotes").value.trim(),downloadLinks:{uptodownUrl:a.querySelector("#ver-input-uptodown").value.trim(),telegramUrl:a.querySelector("#ver-input-telegram").value.trim(),directServerUrl:a.querySelector("#ver-input-direct").value.trim()}};await vt(d),alert("Configuration des versions enregistr\xE9e avec succ\xE8s !"),xe(e)}catch(d){alert(`Erreur lors de l'enregistrement : ${d.message}`),i&&(i.disabled=!1,i.innerHTML='<i class="fa-solid fa-floppy-disk"></i> Enregistrer les Modifications')}})}catch(t){e.innerHTML=`<div style="padding: 20px; color: var(--color-danger);">Erreur de chargement de la configuration de version : ${G(t.message)}</div>`}}var se=null;function qn(e){se=e;let t=document.getElementById("admin-pane-pdfs");t&&jn(t);let n=document.getElementById("admin-pane-version");n&&xe(n);let r=document.querySelectorAll(".admin-tab-btn");r.forEach(l=>{l.addEventListener("click",()=>{let i=l.getAttribute("data-target");if(!i)return;r.forEach(u=>{u.classList.remove("active"),u.setAttribute("aria-selected","false"),u.style.color="var(--text-secondary)",u.style.backgroundColor="transparent"}),l.classList.add("active"),l.setAttribute("aria-selected","true"),l.style.color="var(--color-primary)",l.style.backgroundColor="rgba(6, 182, 212, 0.1)",document.querySelectorAll(".admin-pane-content").forEach(u=>{u.style.display="none"});let s=document.getElementById(i);s&&(s.style.display="block",i==="admin-pane-version"&&xe(s)),window.dispatchEvent(new CustomEvent("drcat-admin-tab-changed",{detail:{activePaneId:i}}))})});let o=document.querySelector(".admin-tab-btn.active");o&&(o.style.color="var(--color-primary)",o.style.backgroundColor="rgba(6, 182, 212, 0.1)");let a=document.getElementById("btn-ai-auto-fill");a&&(a.style.display=c.isAdmin?"inline-flex":"none",a.addEventListener("click",async()=>{let l=document.getElementById("new-cat-title"),i=l?l.value.trim():"";if(!i||i.length<3){y("Veuillez saisir au moins un titre de CAT (ex: CAT devant colique n\xE9phr\xE9tique)","fa-circle-exclamation",4e3),l&&l.focus();return}let d=a.innerHTML;a.disabled=!0,a.innerHTML='<i class="fa-solid fa-spinner fa-spin"></i> Dual RAG...';try{y("Recherche Web RAG en cours...","fa-globe",3e3),await fetch(L("/api/admin/cat-generator/fetch-web"),{method:"POST",headers:A(),body:JSON.stringify({title:i,forceRefetch:!1})}).catch(()=>{}),y("Synth\xE8se IA Dual RAG en cours...","fa-wand-magic-sparkles",5e3);let s=await fetch(L("/api/admin/cat-generator/single"),{method:"POST",headers:A(),body:JSON.stringify({title:i,category})}),u=await s.json();if(!s.ok||!u.success)throw new Error(u.error||"Erreur lors de la g\xE9n\xE9ration IA.");let p=u.cat;if(p){if(p.category){let f=document.getElementById("new-cat-category");f&&(f.value=p.category)}if(p.red_flags){let f=document.getElementById("new-cat-red-flags");f&&(f.value=p.red_flags)}if(p.summary){let f=document.getElementById("new-cat-summary");f&&(f.value=p.summary)}if(p.ordonnance){let f=document.getElementById("new-cat-ordonnance");f&&(f.value=p.ordonnance)}if(p.pdf_keywords&&Array.isArray(p.pdf_keywords)){let f=document.getElementById("new-cat-pdf-keywords");f&&(f.value=p.pdf_keywords.join(", "))}y(`Fiche "${p.title}" g\xE9n\xE9r\xE9e et pr\xE9-remplie !`,"fa-circle-check",4e3)}}catch(s){console.error(s),y("Erreur IA: "+s.message,"fa-triangle-exclamation",5e3)}finally{a.disabled=!1,a.innerHTML=d}})),window.handleApproveSuggestion=async function(l){if(confirm("Voulez-vous vraiment accepter cette suggestion et l'int\xE9grer \xE0 la base de donn\xE9es ?"))try{let i=await hn(l);i.success?(y("Proposition approuv\xE9e !","fa-circle-check",3e3),se?await se():await je()):y("Erreur: "+(i.error||i.message),"fa-circle-exclamation",4e3)}catch(i){if(console.error(i),window.handleAdminError&&await window.handleAdminError(i))return;y("Erreur lors de la validation.","fa-circle-exclamation",4e3)}},window.handleRejectSuggestion=async function(l){if(confirm("Voulez-vous vraiment rejeter et supprimer cette proposition ?"))try{let i=await vn(l);i.success?(y("Proposition rejet\xE9e.","fa-circle-xmark",3e3),se?await se():await je()):y("Erreur: "+(i.error||i.message),"fa-circle-exclamation",4e3)}catch(i){if(console.error(i),window.handleAdminError&&await window.handleAdminError(i))return;y("Erreur lors du rejet.","fa-circle-exclamation",4e3)}},window.handleReviewSuggestion=async function(l){try{y("Chargement des d\xE9tails...","fa-spinner fa-spin",1500);let d=(await ht()).find(f=>f.id===l);if(!d){y("Proposition introuvable.","fa-circle-exclamation",3e3);return}let s=document.createElement("div");s.id="suggestion-review-modal",s.className="modal-overlay modal-overlay--sheet",s.setAttribute("role","dialog"),s.setAttribute("aria-modal","true");let u="";d.type==="add"&&(u=`
          <div class="form-group">
            <label for="review-sug-title">Titre de la fiche</label>
            <input type="text" id="review-sug-title" value="${S(d.data.title||"")}">
          </div>
          <div class="form-group">
            <label for="review-sug-category">Sp\xE9cialit\xE9</label>
            <input type="text" id="review-sug-category" value="${S(d.data.category||"")}">
          </div>
          <div class="form-group">
            <label for="review-sug-redflags">Red Flags (signes de gravit\xE9)</label>
            <textarea id="review-sug-redflags" rows="3">${S(d.data.red_flags||"")}</textarea>
          </div>
        `),u+=`
        <div class="form-group">
          <label for="review-sug-summary">Synth\xE8se de Conduite \xE0 Tenir</label>
          <textarea id="review-sug-summary" class="font-monospace" rows="12">${S(d.data.summary||"")}</textarea>
        </div>
        <div class="form-group">
          <label for="review-sug-ordonnance">Ordonnance Type</label>
          <textarea id="review-sug-ordonnance" class="font-monospace" rows="8">${S(d.data.ordonnance||"")}</textarea>
        </div>
      `,s.innerHTML=`
        <div class="modal-card modal-card-lg">
          <div class="modal-header">
            <h3><i class="fa-solid fa-pen-to-square"></i> R\xE9viser & \xC9diter la proposition</h3>
            <button class="close-modal-btn" id="review-modal-close" aria-label="Fermer"><i class="fa-solid fa-xmark"></i></button>
          </div>
          <div class="modal-body">
            ${u}
          </div>
          <div class="modal-footer">
            <button id="review-btn-cancel" class="cancel-btn">Annuler</button>
            <button id="review-btn-save" class="btn-solid-success"><i class="fa-solid fa-floppy-disk"></i> Enregistrer les corrections</button>
          </div>
        </div>
      `,document.body.appendChild(s);let p=()=>Se(s);document.getElementById("review-modal-close")?.addEventListener("click",p),document.getElementById("review-btn-cancel")?.addEventListener("click",p),document.getElementById("review-btn-save")?.addEventListener("click",async()=>{try{let f={};d.type==="add"&&(f.title=document.getElementById("review-sug-title").value,f.category=document.getElementById("review-sug-category").value,f.red_flags=document.getElementById("review-sug-redflags").value);let h=document.getElementById("review-sug-summary"),v=document.getElementById("review-sug-ordonnance");h&&(f.summary=h.value),v&&(f.ordonnance=v.value);let m=await bn(l,f);m.success?(y("Corrections enregistr\xE9es avec succ\xE8s !","fa-circle-check",3e3),Se(s),se?await se():await je()):y("Erreur: "+(m.error||m.message),"fa-circle-exclamation",4e3)}catch(f){console.error(f),y("Erreur lors de l'enregistrement.","fa-circle-exclamation",4e3)}})}catch(i){console.error(i),y("Impossible de charger les d\xE9tails de cette proposition.","fa-circle-exclamation",4e3)}}}async function je(e){let t=e||document.getElementById("suggestions-list");if(!(!c.isAdmin||!t))try{let n=await ht();if(n.length===0){t.innerHTML='<p class="text-muted text-center" style="padding: 10px 0;">Aucune proposition en attente.</p>';return}let r="";n.forEach(o=>{let a=new Date(o.timestamp).toLocaleString("fr-FR"),l=o.type==="add"?"add":"edit",i=o.type==="add"?"Ajout de fiche":`Modif de fiche (ID: ${o.catId})`,d="";if(o.type==="add")d=`<strong>Titre :</strong> ${S(o.data.title||"")}<br>
                    <strong>Sp\xE9cialit\xE9 :</strong> ${S(o.data.category||"")}<br>
                    <strong>Red Flags :</strong> ${S(o.data.red_flags||"")||"Aucun"}<br>
                    <strong>Synth\xE8se (extrait) :</strong> ${o.data.summary?S(o.data.summary.substring(0,150))+"...":"Aucune"}<br>
                    <strong>Ordonnance (extrait) :</strong> ${o.data.ordonnance?S(o.data.ordonnance.substring(0,100))+"...":"Aucune"}`;else if(o.type==="edit"){let s=c.allCats.find(p=>p.id===parseInt(o.catId)),u=s?s.title:`Fiche ${o.catId}`;if(d=`<strong>Fiche cibl\xE9e :</strong> ${S(u)}<br>`,o.data.summary){let p=o.data.summary.length>200?S(o.data.summary.substring(0,200))+"...":S(o.data.summary);d+=`<strong>Proposition Synth\xE8se (extrait) :</strong><div class="suggestion-diff-container">${p}</div>`}if(o.data.ordonnance){let p=o.data.ordonnance.length>150?S(o.data.ordonnance.substring(0,150))+"...":S(o.data.ordonnance);d+=`<strong>Proposition Ordonnance (extrait) :</strong><div class="suggestion-diff-container">${p}</div>`}}r+=`
        <div class="suggestion-card" data-sug-id="${S(o.id)}">
          <div class="suggestion-header">
            <span class="suggestion-badge ${l}">${i}</span>
            <span class="suggestion-time">${a}</span>
          </div>
          <div class="suggestion-body">
            <div class="suggestion-diff-content">${d}</div>
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
      `}),t.innerHTML=r,t.querySelectorAll('[data-action="approve"]').forEach(o=>{o.addEventListener("click",async a=>{let l=a.target.closest(".suggestion-card");if(!l)return;let i=l.getAttribute("data-sug-id");i&&window.handleApproveSuggestion&&await window.handleApproveSuggestion(i)})}),t.querySelectorAll('[data-action="review"]').forEach(o=>{o.addEventListener("click",async a=>{let l=a.target.closest(".suggestion-card");if(!l)return;let i=l.getAttribute("data-sug-id");i&&window.handleReviewSuggestion&&await window.handleReviewSuggestion(i)})}),t.querySelectorAll('[data-action="reject"]').forEach(o=>{o.addEventListener("click",async a=>{let l=a.target.closest(".suggestion-card");if(!l)return;let i=l.getAttribute("data-sug-id");i&&window.handleRejectSuggestion&&await window.handleRejectSuggestion(i)})})}catch(n){console.error("Failed to load suggestions:",n),t.innerHTML='<p class="text-danger text-center" style="padding: 10px 0;">Erreur lors du chargement des propositions.</p>'}}var Y,Ht,zt,jt,qt,Ut,Vt,Un,Vn,Wt,Wn,Jt=null;function Jn(){let e=c.allCats.length,t=c.allCats.filter(o=>o.status==="done").length,n=c.allCats.filter(o=>o.status==="doing").length,r=c.isAdmin?1:0;return`${e}|${t}|${n}|${r}`}function Gn(e,t){Y=document.getElementById("welcome-screen"),Ht=document.getElementById("workspace"),zt=document.getElementById("sidebar"),jt=document.getElementById("dash-mastery-rate"),qt=document.getElementById("dash-count-done"),Ut=document.getElementById("dash-count-doing"),Vt=document.getElementById("dash-count-todo"),Un=document.getElementById("dash-resume-list"),Vn=document.getElementById("dash-categories-progress"),Wt=document.getElementById("admin-moderation-panel"),Wn=document.getElementById("suggestions-list");let n=document.getElementById("brand-logo"),r=document.getElementById("mobile-brand-logo");n&&n.addEventListener("click",()=>ae(e)),r&&r.addEventListener("click",()=>ae(e)),qn(t);let o=document.getElementById("export-progress-btn");o&&o.addEventListener("click",()=>{let v=localStorage.getItem("dr_cat_user_progress");if(!v||v==="{}"){y("Aucune progression enregistr\xE9e \xE0 exporter.","fa-circle-exclamation",3e3);return}let m=`drcat-progression-${new Date().toISOString().slice(0,10)}.json`;pt(m,"Sauvegarde Progression",v)});let a=document.getElementById("import-progress-btn"),l=document.getElementById("import-progress-file");a&&l&&(a.addEventListener("click",()=>{l.click()}),l.addEventListener("change",v=>{let m=v.target.files[0];if(!m)return;let b=new FileReader;b.onload=async w=>{try{let x=JSON.parse(w.target.result),$=Object.keys(x);$.length>0&&typeof x[$[0]]=="object"?(localStorage.setItem("dr_cat_user_progress",JSON.stringify(x)),y("Progression import\xE9e avec succ\xE8s ! L'application va se recharger.","fa-circle-check",4e3),location.reload()):y("Format de fichier invalide.","fa-circle-exclamation",4e3)}catch(x){console.error(x),y("Erreur lors de la lecture du fichier d'importation.","fa-circle-exclamation",4e3)}},b.readAsText(m)}));let i=document.getElementById("admin-bulk-import-input"),d=document.getElementById("admin-bulk-import-trigger-btn"),s=document.getElementById("bulk-import-file-name"),u=document.getElementById("admin-bulk-import-submit-btn"),p=null;d&&i&&d.addEventListener("click",()=>i.click()),i&&i.addEventListener("change",v=>{let m=v.target.files[0];if(!m){s&&(s.textContent="Aucun fichier s\xE9lectionn\xE9"),u&&(u.disabled=!0,u.style.opacity="0.5",u.style.cursor="not-allowed"),p=null;return}s&&(s.textContent=m.name);let b=new FileReader;b.onload=w=>{try{let x=JSON.parse(w.target.result);if(!Array.isArray(x))throw new Error("Le fichier JSON doit contenir un tableau de fiches.");p=x,u&&(u.disabled=!1,u.style.opacity="1",u.style.cursor="pointer")}catch(x){y(`Erreur JSON: ${x.message}`,"fa-triangle-exclamation",4e3),s&&(s.textContent="Fichier JSON invalide"),u&&(u.disabled=!0,u.style.opacity="0.5",u.style.cursor="not-allowed"),p=null}},b.readAsText(m)}),u&&u.addEventListener("click",async()=>{if(p)try{u.disabled=!0,u.innerHTML='<i class="fa-solid fa-spinner fa-spin"></i> Importation...';let v=await yn(p);v.count>0&&v.skippedCount>0?y(`${v.count} fiches import\xE9es, ${v.skippedCount} ignor\xE9es (d\xE9j\xE0 existantes).`,"fa-circle-check",5e3):v.count===0&&v.skippedCount>0?y(`Aucune nouvelle fiche. Les ${v.skippedCount} fiches existaient d\xE9j\xE0.`,"fa-circle-exclamation",4e3):y(`${v.count} fiches import\xE9es avec succ\xE8s !`,"fa-circle-check",4e3),p=null,i&&(i.value=""),s&&(s.textContent="Aucun fichier s\xE9lectionn\xE9"),u.disabled=!0,u.style.opacity="0.5",u.style.cursor="not-allowed",u.innerHTML='<i class="fa-solid fa-cloud-arrow-up"></i> Importer',t&&await t()}catch(v){y(`\xC9chec de l'importation: ${v.message}`,"fa-triangle-exclamation",4e3),u.disabled=!1,u.innerHTML='<i class="fa-solid fa-cloud-arrow-up"></i> Importer'}});let f=document.getElementById("export-specialty-btn"),h=document.getElementById("export-specialty-select");f&&h&&f.addEventListener("click",()=>{let v=h.value;if(!v){y("Veuillez s\xE9lectionner une sp\xE9cialit\xE9.","fa-triangle-exclamation",3e3);return}let m=c.allCats.filter(b=>b.category===v).map(b=>({category:b.category,title:b.title,summary:b.summary,red_flags:b.red_flags,ordonnance:b.ordonnance,pdf_keywords:b.pdf_keywords||[]}));pt(`Fiches_DrCAT_${v.replace(/\s+/g,"_")}.json`,"Export Sp\xE9cialit\xE9",m),y(`Exportation r\xE9ussie de ${m.length} fiches !`,"fa-circle-check",3e3)})}function ae(e){c.activeCat=null,document.querySelectorAll(".cat-item").forEach(r=>r.classList.remove("active")),Ht&&(Ht.style.display="none"),Y&&(Y.style.display="flex");let t=document.getElementById("quiz-screen");t&&(t.style.display="none"),window.innerWidth<=850&&zt&&zt.classList.remove("open");let n=Jn();Jt===n&&Y&&Y.dataset.rendered==="true"||(Jt=n,qe(e))}async function qe(e){if(window.perf&&window.perf.startMeasure("dashboard.renderDashboard"),!Y||Y.style.display==="none")return;let t=document.getElementById("export-specialty-select");if(t){let u=Array.from(new Set(c.allCats.map(f=>f.category))).sort(),p=t.value;t.innerHTML='<option value="">Choisir sp\xE9cialit\xE9...</option>',u.forEach(f=>{let h=document.createElement("option");h.value=f,h.textContent=f,f===p&&(h.selected=!0),t.appendChild(h)})}let n=Nn(c.allCats),r=n.total,o=document.getElementById("total-cats-count");o&&(o.textContent=r);let a=r>0?Math.round(n.done/r*100):0;if(jt){jt.textContent=`${a}%`;let u=document.getElementById("dash-mastery-ring");if(u){let f=2*Math.PI*22,h=f-a/100*f;u.style.strokeDashoffset=h}}qt&&(qt.textContent=`${n.done} / ${r}`),Ut&&(Ut.textContent=`${n.doing} / ${r}`),Vt&&(Vt.textContent=`${n.todo} / ${r}`);let l=Fn(),i=document.getElementById("dash-streak-count");i&&(i.textContent=`${l} jour${l>1?"s":""}`);let d=c.allCats.filter(u=>u.status==="doing"||u.status==="done");Hn(Un,d,e),zn(Vn,c.allCats);let s=document.getElementById("dash-first-run-banner");if(s){let u=c.allCats.some(p=>p.status!=="todo"||p.notes);s.style.display=u?"none":"flex"}Wt&&(Wt.style.display=c.isAdmin?"block":"none"),c.isAdmin&&await je(Wn),Jt=Jn(),Y&&(Y.dataset.rendered="true"),window.perf&&(window.perf.endMeasure("dashboard.renderDashboard"),window.perf.recordMilestone("dashboardReady"))}function Yn(e={}){let t=window.Capacitor&&window.Capacitor.Plugins&&window.Capacitor.Plugins.App;return!t||typeof t.addListener!="function"?!1:(t.addListener("backButton",()=>{try{if(e.isModalOpen&&e.isModalOpen()){e.closeModal&&e.closeModal();return}if(e.isDrawerOpen&&e.isDrawerOpen()){e.closeDrawer&&e.closeDrawer();return}if(e.isDeepView&&e.isDeepView()){e.goToDashboard&&e.goToDashboard();return}e.confirmExit&&e.confirmExit()}catch(n){console.warn("[BackButton] handler error:",n)}}),!0)}function Kn(){let e=window.Capacitor&&window.Capacitor.Plugins&&window.Capacitor.Plugins.Keyboard;if(!e||typeof e.addListener!="function")return!1;let t=n=>{document.documentElement.style.setProperty("--capacitor-keyboard-height",`${n}px`)};return e.addListener("keyboardWillShow",n=>{try{let r=n&&typeof n.keyboardHeight=="number"?n.keyboardHeight:0;t(r);let o=document.activeElement;o&&(o.tagName==="INPUT"||o.tagName==="TEXTAREA")&&o.scrollIntoView({block:"center",behavior:"smooth"})}catch(r){console.warn("[Keyboard] show error:",r)}}),e.addListener("keyboardWillHide",()=>{try{t(0)}catch(n){console.warn("[Keyboard] hide error:",n)}}),!0}function Xn(e={}){let t=window.Capacitor&&window.Capacitor.Plugins&&window.Capacitor.Plugins.App;return!t||typeof t.addListener!="function"?!1:(typeof e.onPause=="function"&&t.addListener("pause",()=>{try{e.onPause()}catch(n){console.warn("[Lifecycle] pause error:",n)}}),typeof e.onResume=="function"&&t.addListener("resume",()=>{try{e.onResume()}catch(n){console.warn("[Lifecycle] resume error:",n)}}),!0)}var Qn=null,Ca=()=>Qn||(Qn=import("./chunk-X5UBM4CT.js")),Zn={light:"#f1f5f9",dark:"#090d16"};function ea(e){let t=e?Zn.light:Zn.dark,n=document.querySelector('meta[name="theme-color"]:not([media])');n||(n=document.createElement("meta"),n.name="theme-color",document.head.appendChild(n)),n.setAttribute("content",t);try{let r=window.Capacitor?.Plugins?.StatusBar;r&&(r.setBackgroundColor?.({color:t}),r.setStyle?.({style:e?"LIGHT":"DARK"}))}catch{}}window.handleAdminError=async function(e){if(e&&(e.message==="403 Forbidden"||e.message==="401 Unauthorized")){let t=prompt("Action r\xE9serv\xE9e aux administrateurs. Saisissez le mot de passe admin pour d\xE9verrouiller :");if(t)try{let n=await yt(t);if(n.success&&n.token)return y("Connexion r\xE9ussie ! L'action va \xEAtre relanc\xE9e.","fa-circle-check",3e3),location.reload(),!0;y("Mot de passe incorrect.","fa-circle-exclamation",3e3)}catch(n){console.error("Login failed:",n),y("Erreur lors de la connexion.","fa-circle-exclamation",4e3)}return!0}return!1};var Gt,R,Yt,Kt,ce;async function ta(){if(An(),window.addEventListener("error",m=>{y("Une erreur d'ex\xE9cution est survenue. D\xE9tails enregistr\xE9s dans l'onglet Diagnostic.","fa-triangle-exclamation",7e3)}),window.addEventListener("unhandledrejection",m=>{y("Erreur r\xE9seau ou r\xE9ponse de base de donn\xE9es non reconnue.","fa-circle-exclamation",5e3)}),"serviceWorker"in navigator){let m=location.hostname.includes("ngrok")||location.hostname.includes("loca.lt")||location.hostname.includes("trycloudflare.com")||location.hostname.includes("cfargotunnel.com");B||m?(navigator.serviceWorker.getRegistrations().then(b=>{b.forEach(w=>w.unregister())}),caches.keys().then(b=>b.forEach(w=>caches.delete(w))),console.log("[Startup] Service worker disabled on standalone app / remote tunnel host to prevent cache deadlocks.")):location.hostname==="localhost"||location.hostname==="127.0.0.1"||Ae.some(w=>w.isDevHostname(location.hostname))||window.addEventListener("load",()=>{navigator.serviceWorker.register("/service-worker.js").then(w=>{console.log("PWA SW registered:",w.scope),w&&w.addEventListener("updatefound",()=>{let x=w.installing;x&&x.addEventListener("statechange",()=>{x.state==="installed"&&navigator.serviceWorker.controller&&y("Mise \xE0 jour disponible. Rechargez pour l'appliquer.","fa-rotate",8e3)})})}).catch(w=>console.error("PWA SW failed:",w))})}(function(){try{let b=document.createElement("div");b.className="offline-badge",b.setAttribute("role","status"),b.setAttribute("aria-live","polite"),b.innerHTML='<i class="fa-solid fa-wifi" style="transform: rotate(45deg);"></i> Mode hors-ligne',document.body.appendChild(b),window.addEventListener("offline",()=>b.classList.add("show")),window.addEventListener("online",()=>b.classList.remove("show"))}catch{}})();let e=document.getElementById("theme-toggle-btn"),t=document.getElementById("theme-toggle-icon"),n=document.documentElement,r=n.classList.contains("light-theme");try{window.Capacitor?.Plugins?.StatusBar?.setOverlaysWebView?.({overlay:!1})}catch{}ea(r),t&&(t.classList.toggle("fa-sun",r),t.classList.toggle("fa-moon",!r)),requestAnimationFrame(()=>{requestAnimationFrame(()=>n.classList.remove("theme-booting"))}),e&&e.addEventListener("click",()=>{let m=()=>{n.classList.add("theme-switching");let x=n.classList.toggle("light-theme");localStorage.setItem("theme",x?"light":"dark"),n.style.colorScheme=x?"light":"dark",t&&(t.classList.toggle("fa-sun",x),t.classList.toggle("fa-moon",!x)),ea(x),requestAnimationFrame(()=>{requestAnimationFrame(()=>n.classList.remove("theme-switching"))})},b=window.matchMedia&&window.matchMedia("(prefers-reduced-motion: reduce)").matches,w=document.startViewTransition&&!b?document.startViewTransition:null;if(w){let x=e.getBoundingClientRect(),$=x.left+x.width/2,M=x.top+x.height/2,z=Math.hypot(Math.max($,innerWidth-$),Math.max(M,innerHeight-M)),F=document.createElement("style");F.textContent=`
          ::view-transition-new(root) {
            animation: themeReveal var(--motion-slow) var(--ease-emphasized);
          }
          @keyframes themeReveal {
            from { clip-path: circle(0px at ${$}px ${M}px); }
            to { clip-path: circle(${z}px at ${$}px ${M}px); }
          }
        `,document.head.appendChild(F);let T=w.call(document,m);T&&(T.finished&&typeof T.finished.catch=="function"&&T.finished.catch(()=>{}),T.ready&&typeof T.ready.catch=="function"&&T.ready.catch(()=>{}),T.updateCallbackDone&&typeof T.updateCallbackDone.catch=="function"&&T.updateCallbackDone.catch(()=>{})),setTimeout(()=>F.remove(),400)}else m()});let o=document.getElementById("about-legal-header");o&&o.addEventListener("click",()=>{let m=document.getElementById("about-legal-content"),b=document.getElementById("about-legal-chevron");if(!m||!b)return;let w=m.style.maxHeight==="500px";m.style.maxHeight=w?"0px":"500px",b.style.transform=w?"rotate(0deg)":"rotate(180deg)"}),_n(O,Aa,Ve),Mn(La,_a,Ta),Gn(O,Ba),Ca().then(m=>m.initQuiz(O)).catch(m=>console.warn("[lazy] quiz init failed",m)),Gt=document.getElementById("add-cat-btn"),R=document.getElementById("add-cat-modal"),Yt=document.getElementById("close-add-cat-modal-btn"),Kt=document.getElementById("cancel-add-cat-btn"),ce=document.getElementById("add-cat-form"),Gt&&Gt.addEventListener("click",()=>{let m=document.getElementById("new-cat-category-select"),b=document.getElementById("new-cat-category");if(m){let w=[...new Set(c.allCats.map(x=>x.category))].filter(Boolean).sort();m.innerHTML=`
          <option value="">-- S\xE9lectionner une sp\xE9cialit\xE9 existante --</option>
          ${w.map(x=>`<option value="${x}">${x}</option>`).join("")}
        `,m.onchange=()=>{m.value&&b&&(b.value=m.value)}}R&&(R.classList.remove("modal-overlay--sheet"),R.style.display="flex")});function a(){if(!R)return;if(window.matchMedia&&window.matchMedia("(prefers-reduced-motion: reduce)").matches){R.style.display="none",ce&&ce.reset();return}R.classList.add("modal-closing");let m=b=>{b.target!==R&&b.target!==R.querySelector(".modal-card")||(R.removeEventListener("animationend",m),R.classList.remove("modal-closing"),R.style.display="none",ce&&ce.reset())};R.addEventListener("animationend",m),setTimeout(()=>m({target:R}),600)}Yt&&Yt.addEventListener("click",a),Kt&&Kt.addEventListener("click",a),ce&&ce.addEventListener("submit",async m=>{m.preventDefault();let b=document.getElementById("new-cat-title").value.trim(),w=document.getElementById("new-cat-category").value.trim(),x=document.getElementById("new-cat-red-flags").value.trim(),$=document.getElementById("new-cat-summary").value.trim(),M=document.getElementById("new-cat-ordonnance").value.trim(),z=document.getElementById("new-cat-pdf-keywords").value,F=z?z.split(",").map(T=>T.trim()).filter(T=>T):[];if(c.isAdmin)try{let T=await gn({title:b,category:w,red_flags:x,summary:$,ordonnance:M,pdf_keywords:F});if(T.success){a();try{let j=JSON.parse(localStorage.getItem("dr_cat_local_overrides")||"{}");j[T.cat.id]&&(delete j[T.cat.id],localStorage.setItem("dr_cat_local_overrides",JSON.stringify(j)))}catch{}y(`La fiche CAT "${b}" a \xE9t\xE9 ajout\xE9e avec succ\xE8s !`,"fa-circle-check",3e3),await Ve();let K=c.allCats.find(j=>j.id===T.cat.id);K&&O(K)}else y("Erreur : "+T.error,"fa-circle-exclamation",4e3)}catch(T){if(console.error(T),window.handleAdminError&&await window.handleAdminError(T))return;y("Erreur lors de l'enregistrement de la nouvelle CAT.","fa-circle-exclamation",4e3)}else{if(!confirm(`Attention : Cette nouvelle fiche ne sera pas ajout\xE9e directement. Elle sera envoy\xE9e \xE0 l'administrateur du site pour relecture et validation avant d'\xEAtre int\xE9gr\xE9e.

Souhaitez-vous envoyer cette proposition ?`))return;try{await Ce(De,{type:"add",data:{title:b,category:w,red_flags:x,summary:$,ordonnance:M,pdf_keywords:F}},`Votre proposition de nouvelle fiche "${b}" a \xE9t\xE9 envoy\xE9e \xE0 l'administrateur pour validation.`)&&a()}catch(K){console.error(K),y("Erreur lors de l'envoi de la proposition.","fa-circle-exclamation",4e3)}}});let l=document.getElementById("admin-login-btn");l&&l.addEventListener("click",async()=>{if(c.isAdmin)confirm("Voulez-vous vous d\xE9connecter du mode administrateur ?")&&(await un(),y("D\xE9connexion r\xE9ussie.","fa-circle-check",3e3),location.reload());else{let m=prompt("Veuillez saisir le mot de passe administrateur :");if(m)try{let b=await yt(m);b.success&&b.token?(y("Connexion r\xE9ussie !","fa-circle-check",3e3),location.reload()):y(b.error||"Mot de passe incorrect.","fa-circle-exclamation",3e3)}catch(b){console.error("Login error:",b),y("Erreur lors de la connexion.","fa-circle-exclamation",4e3)}}}),l&&(l.style.display="none"),window.addEventListener("online",()=>{y("Connexion r\xE9seau d\xE9tect\xE9e. Synchronisation...","fa-wifi",4e3),Ue()}),window.addEventListener("offline",()=>{y("Connexion perdue. Mode hors-ligne activ\xE9.","fa-circle-xmark",6e3),B&&(Ze(P.ANDROID_OFFLINE),c.isOnlineAtStartup=!1)}),window.addEventListener("drcat-app-mode-changed",()=>{aa()});let i=document.getElementById("legal-modal"),d=[document.getElementById("open-legal-modal-btn"),document.getElementById("open-legal-from-banner")],s=document.getElementById("close-legal-modal-btn"),u=document.getElementById("legal-consent-banner"),p=document.getElementById("accept-legal-btn"),f=document.getElementById("dismiss-legal-btn"),h=()=>{u&&(u.classList.add("hidden"),u.style.display="none")};localStorage.getItem("drcat_legal_consent_v1")?h():u&&(u.style.display="flex",setTimeout(()=>u.classList.remove("hidden"),500)),p&&p.addEventListener("click",()=>{localStorage.setItem("drcat_legal_consent_v1","true"),h()}),f&&f.addEventListener("click",()=>{localStorage.setItem("drcat_legal_consent_v1","dismissed"),h()}),d.forEach(m=>{m&&m.addEventListener("click",b=>{b.preventDefault(),i&&(i.style.display="flex",i.classList.add("active"))})});let v=()=>{i&&(i.style.display="none",i.classList.remove("active"))};s&&s.addEventListener("click",v),i&&i.addEventListener("click",m=>{m.target===i&&v()}),window.addEventListener("keydown",m=>{let b=document.activeElement.tagName==="INPUT"||document.activeElement.tagName==="TEXTAREA";if(m.key.toLowerCase()==="s"&&!b){m.preventDefault();let w=document.getElementById("search-input");w&&(w.focus(),w.select())}if(m.key==="Escape"){let w=document.getElementById("add-cat-modal");if(w&&w.style.display!=="none"){w.style.display="none";let $=document.getElementById("add-cat-form");$&&$.reset()}let x=document.getElementById("legal-modal");x&&(x.classList.contains("active")||x.style.display!=="none")&&v()}if((m.key==="ArrowDown"||m.key==="ArrowUp")&&!b){m.preventDefault();let w=document.querySelector(".cat-item.active"),x=Array.from(document.querySelectorAll(".cat-item"));if(x.length===0)return;let $=0;if(w){let z=x.indexOf(w);m.key==="ArrowDown"?$=(z+1)%x.length:$=(z-1+x.length)%x.length}let M=x[$];M&&(M.click(),M.scrollIntoView({block:"nearest",behavior:Q()?"auto":"smooth"}))}}),await Ia(),ze()}document.readyState==="loading"?document.addEventListener("DOMContentLoaded",ta):ta();var na=!1,we=null,Xt=!1;async function Ia(){let e=document.getElementById("app-loading-overlay"),t=document.getElementById("app-loading-bar");e&&e.classList.remove("hidden"),t&&(t.style.width="5%");let n=s=>{window.setLoaderProgress?window.setLoaderProgress(s):t&&(t.style.width=`${s}%`)};n(10);let r=ee();console.log(`[Startup] Mode: ${r}`),n(20);try{c.isAdmin=await pn(),console.log("Admin mode:",c.isAdmin)}catch(s){console.warn("[Startup] Admin status check failed.",s),c.isAdmin=!1}aa(),n(40);let o=[];try{o=await et(),window.perf&&window.perf.recordMilestone("catsFetched")}catch(s){console.error("[Startup Error] Fetch CATs failed, using emergency fallback.",s);try{let u=await fetch("data/cats_db.json",{headers:{"x-app-key":$e}});if(!u.ok)throw new Error("Emergency fallback failed");o=await u.json(),y("Chargement de secours local.","fa-triangle-exclamation",4e3)}catch(u){console.error("[Startup Critical] No data available.",u),y("Base de donn\xE9es indisponible.","fa-circle-exclamation",9e3),e&&e.classList.add("hidden");let p=window.Capacitor&&window.Capacitor.Plugins&&window.Capacitor.Plugins.SplashScreen;if(p&&typeof p.hide=="function")try{p.hide()}catch{}return}}n(60);let a=q(),l={},i=[];try{l=JSON.parse(localStorage.getItem("dr_cat_local_overrides")||"{}"),i=JSON.parse(localStorage.getItem("dr_cat_custom_created_cats")||"[]").map(u=>({...u,isOffline:!0}))}catch{}B&&(o=o.filter(s=>!l[s.id]||!l[s.id].deleted),o=[...o,...i.filter(s=>!l[s.id]||!l[s.id].deleted)]),c.allCats=Ye(o,a,l),n(75);try{Ct(c.allCats),Re(c.allCats,O),lt(),qe(O)}catch(s){console.error("[Startup Render Error]",s)}n(90);try{At()}catch(s){console.error("[Startup Navigation Error]",s)}setTimeout(()=>{Promise.all([fn().catch(s=>(console.warn("[Background] PDF fetch failed, using local list.",s),fetch("data/pdf_list.json").then(u=>u.json()).catch(()=>[]))),Sn().catch(s=>(console.warn("[Background] Index status failed.",s),{}))]).then(([s,u])=>{c.allPdfs=s,c.pdfIndexStatus=u,ze(),c.activeCat&&be(c.activeCat,!0),console.log("[Background] PDFs loaded.")}).catch(s=>console.error("[Background] PDF load failed:",s))},100),n(100),e&&e.classList.add("hidden");let d=window.Capacitor&&window.Capacitor.Plugins&&window.Capacitor.Plugins.SplashScreen;d&&typeof d.hide=="function"&&setTimeout(()=>{try{d.hide()}catch{}},350),tn(),Yn({isModalOpen:()=>!!document.querySelector('.modal-overlay:not([style*="display: none"])'),closeModal:()=>{let s=document.querySelector('.modal-overlay:not([style*="display: none"])');s&&(s.id==="add-cat-modal"?closeAddCatModal():Se(s))},isDrawerOpen:()=>{let s=document.querySelector(".sidebar");return!!s&&s.classList.contains("open")},closeDrawer:()=>{let s=document.querySelector(".sidebar");s&&s.classList.remove("open")},isDeepView:()=>{let s=document.getElementById("workspace"),u=document.getElementById("quiz-screen");return s&&s.style.display!=="none"||u&&u.style.display!=="none"},goToDashboard:()=>ae(O),confirmExit:()=>{if(window.__drCatExitArmed){let s=window.Capacitor&&window.Capacitor.Plugins&&window.Capacitor.Plugins.App;s&&typeof s.exitApp=="function"&&s.exitApp();return}window.__drCatExitArmed=!0,y("Appuyez encore sur Retour pour quitter.","fa-right-from-bracket",2e3),setTimeout(()=>{window.__drCatExitArmed=!1},2e3)}}),na||(na=!0,setTimeout(()=>{Ue(),we=setInterval(Ue,3e4)},1e3)),Xn({onPause:()=>{we&&(clearInterval(we),we=null,Xt=!0)},onResume:()=>{Xt&&!we&&(Xt=!1,Ue(),we=setInterval(Ue,3e4))}}),Kn()}async function Ue(){if(!(!B||!dn())){console.log("[Background Sync] Checking for remote updates...");try{let e=oe(),t=!1;for(let r of e)try{let o=new AbortController,a=setTimeout(()=>o.abort(),5e3),l={...A(),..._e(r)},i=L("/api/search-status",r);if(!(await fetch(i,{signal:o.signal,headers:l})).ok)throw new Error("Server returned error status");clearTimeout(a),t=!0;break}catch{}let n=ee()===P.ANDROID_OFFLINE;if(t){console.log("[Background Sync] Server reachable! Fetching latest data..."),Ze(P.ANDROID_ONLINE),c.isOnlineAtStartup=!0;let r=localStorage.getItem("dr_cat_last_sync_time"),o=r?parseInt(r):null,a=await et(o),l=!1,i=null,d=[];try{d=JSON.parse(localStorage.getItem("dr_cat_custom_created_cats")||"[]")}catch{d=[]}let s=new Set(d.map(h=>h.id));if(a.activeIds){i=new Set(a.activeIds.split(",").map(v=>parseInt(v)));let h=(c.allCats||[]).filter(v=>!le(v,s));for(let v of h)if(!i.has(v.id)){l=!0;break}}if(a.length===0&&!l){console.log("[Background Sync] Remote database is in sync. No action needed."),localStorage.setItem("dr_cat_last_sync_time",Date.now().toString()),n&&y("\u{1F4E1} Connexion serveur \xE9tablie. Donn\xE9es synchronis\xE9es !","fa-cloud-arrow-up",4e3);return}let u=(c.allCats||[]).filter(h=>!le(h,s)),p=a.length<u.length*.7,f=l;if(!f){if(p)for(let h of a){let v=u.find(m=>m.id===h.id);if(!v||v.title!==h.title||v.summary!==h.summary||v.ordonnance!==h.ordonnance){f=!0;break}}else if(f=u.length!==a.length,!f)for(let h of a){let v=u.find(m=>m.id===h.id);if(!v||v.title!==h.title||v.summary!==h.summary||v.ordonnance!==h.ordonnance){f=!0;break}}}if(f){console.log("[Background Sync] Server changes detected! Offering update...");let h=document.createElement("span");h.id="update-app-toast-btn",h.style.cssText="color:#06b6d4;font-weight:700;text-decoration:underline;cursor:pointer;",h.textContent="Actualiser ?",h.addEventListener("click",v=>{v.preventDefault(),ka(a,p,i);let m=document.getElementById("drcat-toast");m&&m.remove(),y("Mise \xE0 jour appliqu\xE9e avec succ\xE8s !","fa-circle-check",3e3)}),y("Nouvelles fiches ou modifications disponibles \u2014","fa-arrows-rotate",15e3,h)}else console.log("[Background Sync] Remote database is in sync. No action needed."),localStorage.setItem("dr_cat_last_sync_time",Date.now().toString());n&&y("\u{1F4E1} Connexion serveur \xE9tablie. Donn\xE9es synchronis\xE9es !","fa-cloud-arrow-up",4e3)}else console.log("[Background Sync] Server not reachable, staying offline."),Ze(P.ANDROID_OFFLINE),c.isOnlineAtStartup=!1}catch(e){console.warn("[Background Sync] Failed:",e.message)}}}function ka(e,t,n){let r=q(),o=JSON.parse(localStorage.getItem("dr_cat_local_overrides")||"{}");if(t){if(e.forEach(a=>{let l=c.allCats.findIndex(u=>u.id===a.id),i=r[a.id]||{},d=o[a.id]||{},s={...a,status:i.status||"todo",notes:i.notes||"",summary:d.customSummary||a.summary,customSummary:d.customSummary||a.summary,ordonnance:d.customOrdonnance||a.ordonnance,customOrdonnance:d.customOrdonnance||a.ordonnance};l!==-1?c.allCats[l]=s:c.allCats.push(s)}),n){let a=[];try{a=JSON.parse(localStorage.getItem("dr_cat_custom_created_cats")||"[]")}catch{a=[]}let l=new Set(a.map(i=>i.id));c.allCats=c.allCats.filter(i=>le(i,l)?!0:n.has(i.id))}}else{let a=new Set(e.map(d=>d.id)),l=[];try{l=JSON.parse(localStorage.getItem("dr_cat_custom_created_cats")||"[]")}catch{l=[]}let i=l.filter(d=>!a.has(d.id)).map(d=>({...d,isOffline:!0}));c.allCats=Ye([...e,...i],r,o)}if(localStorage.setItem("dr_cat_last_sync_time",Date.now().toString()),Re(c.allCats,O),lt(),qe(O),c.activeCat){let a=c.activeCat.id,l=c.allCats.find(i=>i.id===a);l?be(l,!0):ae(O)}}function O(e){be(e)}function La(e){Tn(e),lt()}function Aa(e){Re(e,O)}async function Ve(){let e=[];try{e=await et()}catch(o){console.error("[Refresh Error] Fetch CATs failed, using emergency fallback.",o);try{let a=await fetch("data/cats_db.json",{headers:{"x-app-key":$e}});if(!a.ok)throw new Error("Emergency fallback failed");e=await a.json()}catch(a){console.error("[Refresh Critical] No data available.",a);return}}let t=q(),n={},r=[];try{n=JSON.parse(localStorage.getItem("dr_cat_local_overrides")||"{}"),r=JSON.parse(localStorage.getItem("dr_cat_custom_created_cats")||"[]").map(a=>({...a,isOffline:!0}))}catch{}if(B&&(e=e.filter(o=>!n[o.id]||!n[o.id].deleted),e=[...e,...r.filter(o=>!n[o.id]||!n[o.id].deleted)]),c.allCats=Ye(e,t,n),Ct(c.allCats),Re(c.allCats,O),lt(),qe(O),c.activeCat){let o=c.activeCat.id,a=c.allCats.find(l=>l.id===o);a?be(a,!0):ae(O)}}async function _a(){await Ve(),ae(O)}async function Ta(){await Ve(),ae(O)}async function Ba(){await Ve()}function lt(){let e=0,t=0,n=0;c.allCats.forEach(u=>{u.status==="done"?n++:u.status==="doing"?t++:e++});let r=document.getElementById("count-todo"),o=document.getElementById("count-doing"),a=document.getElementById("count-done"),l=document.getElementById("progress-percent"),i=document.getElementById("progress-fill");r&&(r.textContent=e),o&&(o.textContent=t),a&&(a.textContent=n);let d=c.allCats.length,s=d>0?Math.round(n/d*100):0;l&&(l.textContent=`${s}%`),i&&(i.style.width=`${s}%`)}function aa(){let e=document.getElementById("add-cat-btn"),t=document.getElementById("admin-login-btn"),n=ee(),r=n===P.ADMIN_LOCAL,o=[P.WEB_CLIENT,P.ANDROID_ONLINE].includes(n);t&&(r?(t.style.display="flex",c.isAdmin?(t.innerHTML='<i class="fa-solid fa-lock-open"></i> D\xE9connexion Admin',t.style.backgroundColor="rgba(16, 185, 129, 0.15)",t.style.color="var(--color-success)"):(t.innerHTML='<i class="fa-solid fa-lock"></i> Connexion Admin',t.style.backgroundColor="var(--bg-card)",t.style.color="var(--text-primary)")):t.style.display="none"),e&&(r?(e.style.display="flex",e.innerHTML='<i class="fa-solid fa-plus"></i> CAT'):o?(e.style.display="flex",e.innerHTML='<i class="fa-solid fa-lightbulb"></i> Sugg\xE9rer CAT'):e.style.display="none");let a=document.getElementById("edit-summary-btn"),l=document.getElementById("edit-prescription-btn"),i=document.getElementById("delete-cat-btn");r&&c.isAdmin?(a&&(a.innerHTML='<i class="fa-solid fa-pen"></i> Modifier la fiche',a.style.display="inline-flex"),l&&(l.innerHTML='<i class="fa-solid fa-pen"></i> Modifier ordonnance',l.style.display="inline-flex"),i&&(i.style.display=c.activeCat&&c.activeCat.id>55?"inline-flex":"none")):o?(a&&(a.innerHTML='<i class="fa-solid fa-pen-fancy"></i> Proposer modif.',a.style.display="inline-flex"),l&&(l.innerHTML='<i class="fa-solid fa-pen-fancy"></i> Proposer ordonnance',l.style.display="inline-flex"),i&&(i.style.display="none")):(a&&(a.style.display="none"),l&&(l.style.display="none"),i&&(i.style.display="none"));let d=document.querySelector(".specialty-export-container");d&&(r&&c.isAdmin?d.style.display="flex":d.style.display="none");let s=document.getElementById("pdf-reindex-btn");s&&(s.style.display=r&&c.isAdmin?"inline-flex":"none")}export{lt as calculateStats,Ue as runBackgroundSync,aa as updateEditButtonsVisibility};
