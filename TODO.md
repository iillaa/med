# Dr. CAT — Todo List

## 🔴 Haute priorité (prochaine session)

### Quiz — réduction de complexité
- [ ] Réduire le nombre de variables DOM globales dans `quiz.js` (trop de `let` en haut de fichier)
- [ ] Séparer la logique de grading (QCM vs write-in) dans des fonctions dédiées
- [ ] Réduire la duplication entre `submitWriteInAnswer` et `saveWriteInGrade`
- [ ] Viser < 400 lignes pour `quiz.js`
- [ ] Ajouter une garde pour réinitialiser `quizViewingCatId` quand on quitte le quiz
- [ ] centraliser les sélecteurs DOM dans un objet `els` au lieu de variables éparpillées

### Impression — amélioration & fallback
- [x] Créer `public/css/print.css` avec règles `@media print`
- [ ] Tester l'impression depuis un navigateur desktop
- [ ] Ajouter un fallback "Copier le texte" pour mobile/Capacitor (pas de `window.print()`)
- [ ] Ajouter une option "Importer / Exporter les notes" depuis le dashboard
- [ ] Vérifier que les tableaux et markdown s'impriment proprement

### Capacitor Android — debug & build
- [ ] Vérifier `capacitor.config.json` (configuration de base OK)
- [ ] Documenter la commande pour générer le projet Android (`npx cap add android`)
- [ ] Tester un build APK sur un appareil Android
- [ ] Vérifier que le print/export fonctionne sur Android WebView
- [ ] Tester le mode offline sur Android (localStorage, custom CATs)
- [ ] Vérifier les permissions Android (stockage, réseau)

## 🟡 Moyenne priorité (2-3 prochaines sessions)

### UI/UX polish
- [ ] Migrer les styles inline restants vers CSS modules
- [ ] Ajouter des états de loading sur toutes les actions async
- [ ] Améliorer les empty states et messages d'erreur
- [ ] Ajouter des skeleton loaders pour les listes
- [ ] Accessibilité: vérifier labels, rôles ARIA, focus management
- [ ] Ajouter un mode "compact" pour les petits écrans
- [ ] Améliorer les transitions entre quiz → workspace → dashboard

### Sécurité hardening
- [ ] Ajouter des guards de taille sur tous les inputs serveur
- [ ] Valider les champs côté client avant envoi
- [ ] Vérifier que toutes les routes admin sont localhost-only
- [ ] Logger les actions admin (qui modifie quoi et quand)
- [ ] Ajouter un token CSRF pour les actions admin POST
- [ ] Rate limiting sur les suggestions (pas seulement login)

### Tests automatisés
- [ ] Ajouter Jest pour utils.js, api.js, server-providers.js
- [ ] Ajouter Playwright pour scénarios E2E critiques
- [ ] Couvrir les cas d'erreur réseau (timeouts, CORS)

## 🟢 Basse priorité (nice-to-have)

- [ ] **Mode sombre / thèmes** — système de thèmes extensible
- [ ] **Export/Import données** — sauvegarder/restaurer progression
- [ ] **Mode offline avancé** — merge CATs créées hors-ligne vers serveur
- [ ] **Performance: lazy loading PDFs** — charger PDFs à la demande
- [ ] **Multi-utilisateurs** — auth par compte, rôles
- [ ] **Notifications push** — alerts suggestion approuvée/rejetée
- [ ] **Internationalisation** — FR/EN/AR
- [ ] **Animations micro-interactions** — transitions, skeletons, haptic

## ✅ Complété (session du 2026-07-04)

- [x] Fix startup freeze (remote_config.js stale + service worker)
- [x] Fix CORS admin depuis localhost
- [x] Fix Service Worker cache JS (v4, exclude .js)
- [x] Fix bouton quiz bloqué après validation
- [x] Fix "Retour au Quiz" depuis résultats
- [x] Provider-agnostic server registry (server-providers.js)
- [x] Auto-build au démarrage (server.js → build.js)
- [x] Labels HTML associés (accessibilité)
- [x] 21 tests API passent
- [x] Documentation session (docs/SESSION_2026-07-04.md)
