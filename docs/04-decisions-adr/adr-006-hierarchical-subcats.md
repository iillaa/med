# 📜 ADR-006 : Modèle Taxonomique 2-Tiers (60 Master CATs & 63 Sub-CATs)

> **Statut** : Accepté  
> **Date** : 2026-08-30  
> **Décideurs** : Dr. Kibeche Ali Dia Eddine & Lead Architect

---

## 🎯 Contexte & Problématique

Dans les versions initiales, la base clinique était conçue comme une liste plate de fiches médicales. 
Avec l'expansion du corpus vers plus de 120 pathologies :
1. **Surcharge Cognitive** : Les médecins perdaient du temps à parcourir une liste linéaire trop dense lors d'urgences.
2. **Fragmentation Clinique** : Des pathologies étroitement liées (ex: *Asthme chronique* et *Crise d'asthme grave*) étaient éclatées en fiches distinctes sans filiation évidente.
3. **Recherche Moins Efficace** : Difficulté à hiérarchiser les résultats principaux par rapport aux complications rares.

---

## 💡 Décision Architecturale

Nous adoptons une **taxonomie hiérarchique à 2 niveaux** :
1. **60 Master CATs Fondamentales** : Représentant les grands syndromes et motifs de consultation majeurs (ex: *Cardiologie > Syndrome Coronarien Aigu*).
2. **63 Sub-CATs Spécifiques** : Rattachées directement à leur Master CAT sous forme de sous-tableau `subcats: [...]` dans le schéma JSON.
3. **Routage & Deep-Linking Dédié** : Support des ancres URL `#cat-<id>-<sub_id>` avec ouverture automatique des accordéons de navigation et affichage d'onglets segmentés dans le workspace.
4. **Indexation Profonde** : Le moteur de recherche client indexe simultanément le contenu des fiches mères et des sous-fiches.

---

## ⚖️ Conséquences & Bénéfices

### Positives :
- ✅ **Navigation intuitive et rapide** : Accès direct aux complications et urgences depuis la fiche principale.
- ✅ **Cohérence médicale** : Regroupement logique conforme aux arbres décisionnels hospitaliers.
- ✅ **Rétrocompatibilité** : Les applications n'exploitant pas encore les sous-fiches continuent d'afficher les Master CATs sans erreur.

### Négatives / Contraintes :
- ⚠️ Nécessite de maintenir la matrice canonique (`data/official_master_subcats_matrix.json`).
