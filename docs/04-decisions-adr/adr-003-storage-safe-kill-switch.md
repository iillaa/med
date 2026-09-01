# 📜 ADR-003 : Protection Absolue du Stockage Utilisateur lors du Verrouillage de Sécurité (Kill Switch Non-Destructif)

> **Statut** : Accepté  
> **Date** : 2026-08-05  
> **Décideurs** : Dr. Kibeche Ali Dia Eddine & Lead Architect

---

## 🎯 Contexte & Problématique

Lorsqu'une version client présentait une faille de sécurité ou qu'une mise à jour majeure du schéma était requise, l'implémentation naïve initiale du module `version-checker.js` appelait `localStorage.clear()` lors de l'activation de l'écran de verrouillage d'urgence.

Cette action destructrice entraînait des pertes de données irréversibles pour les médecins utilisateurs :
- Destruction de leurs notes cliniques privées (`dr_cat_notes_*`).
- Perte de l'historique d'apprentissage et des statistiques Leitner (`dr_cat_leitner`).
- Réinitialisation des séries de révision quotidienne (`dr_cat_streak`).
- Perte de l'historique de lecture (`dr_cat_user_progress`).

---

## 💡 Décision Architecturale

Nous interdisons formellement l'utilisation de `localStorage.clear()`, `sessionStorage.clear()` ou `indexedDB.deleteDatabase()` dans tout écran de verrouillage ou protocole de Kill Switch.

### Règles d'Exécution :
1. **Blocage Strict de l'UI** : L'écran de verrouillage (`security-lock-root`) bloque tout clic ou accès visuel aux fiches tant que le client n'a pas été mis à jour.
2. **Purge Ciblée Réseau Uniquement** : Seule la clé temporaire du cache de synchronisation HTTP (`dr_cat_synced_db`) est supprimée.
3. **Restauration Transparente** : Dès que l'application est mise à jour (ou le verrou levé), `window.location.reload()` est invoqué, restaurant immédiatement l'ensemble des données personnelles sans la moindre perte.

---

## ⚖️ Conséquences & Bénéfices

### Positives :
- ✅ **Confiance médicale préservée** : Zéro perte de notes cliniques ou de révisions lors des montées de version.
- ✅ **Sécurité maintenue** : Les anciennes fiches potentiellement erronées ne peuvent pas être consultées tant que l'APK n'est pas à jour.

### Négatives / Contraintes :
- ⚠️ Nécessite des tests unitaires dédiés (`tests/test_storage_safety.js`) pour vérifier l'absence d'appels `localStorage.clear()`.
