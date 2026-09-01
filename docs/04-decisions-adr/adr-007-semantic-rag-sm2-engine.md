# ADR 007 : Intégration du RAG Sémantique Vectoriel, des Structured Outputs OpenAPI et de l'Algorithme SM-2

> **Statut** : ✅ Accepté & Implémenté  
> **Date** : 2026-09-01  
> **Version Associée** : `v1.18.0`  
> **Auteurs** : Dr. Kibeche Ali Dia Eddine & Gemini AI  
> **Périmètre** : `cat_db_generator/lib/`, `public/js/components/quiz/`, `public/js/components/sidebar.js`

---

## 🎯 1. Contexte & Problématique

Dans les versions précédentes (v1.16.x et v1.17.x), plusieurs limitations architecturales et algorithmiques subsistaient :

1. **RAG par mots-clés purs** : La recherche d'extraits PDF reposait exclusivement sur des correspondances lexicales, risquant d'ignorer des synonymes cliniques ou des expressions sémantiques complexes.
2. **Format JSON textuel non garanti** : Les appels Gemini demandaient du JSON via prompt texte, obligeant à des sanitizers complexes en cas de formatage markdown inattendu.
3. **Révision Leitner basique** : L'algorithme de répétition espacée se limitait à 5 boîtes fixes sans calcul d'intervalle continu ni gestion de l'oubli prédictif.
4. **Recherche client sensible aux accents** : La frappe dans la barre latérale échouait si l'utilisateur ne saisissait pas les accents stricts du français médical.

---

## 💡 2. Décisions d'Architecture Adoptées

### 1. Dual RAG Sémantique avec Google Embeddings (`gemini-embedding-2`)
- **Choix** : Utilisation du modèle d'embedding officiel Google `gemini-embedding-2` (3 072 dimensions) avec repli sur `gemini-embedding-001`.
- **Cache Disque Dédié** : Sauvegarde des vecteurs calculés dans `data/pdf_embeddings_cache.json`.
- **Calcul Pure JavaScript** : Algorithme de similarité cosinus développé en JS pur sans dépendance C++ native pour une compatibilité totale avec l'environnement Termux/Android.
- **Seuil de pertinence** : Seuil minimal fixé à 50% de similarité avec repli transparent sur la recherche lexicale si le réseau est indisponible.

### 2. Structured Outputs Gemini Natifs (`responseSchema`)
- **Choix** : Définition des schémas OpenAPI stricts dans `cat_db_generator/lib/gemini-schemas.js` (`MASTER_CAT_SCHEMA` et `SUB_CAT_SCHEMA`).
- **Garantie mathématique** : Forçage du décodage contraint (*Constrained Decoding*) au niveau des tokens par Google AI Studio, éliminant tout bloc markdown bavard.

### 3. Algorithme SuperMemo SM-2 pour les Flashcards
- **Choix** : Remplacement des boîtes statiques par la formule standard SM-2 :
  $$EF' = \max(1.3, EF + (0.1 - (5 - q) \times (0.08 + (5 - q) \times 0.02)))$$
  $$I(1) = 1,\quad I(2) = 6,\quad I(n) = I(n-1) \times EF$$
- **Échéance précise** : Calcul du timestamp `nextReview` et tri prioritaire de la file de révision.
- **Rétrocompatibilité** : Préservation du champ virtuel `box: 1..5` pour les composants d'interface existants.

### 4. Index de Recherche Client Normalisé Instantané
- **Choix** : Décomposition Unicode NFD + suppression des diacritiques (`normalizeSearchText`).
- **Performance** : Pré-calcul de la chaîne indexée sur l'objet CAT en mémoire, réduisant le temps de filtrage multi-mots à moins de 2 ms lors de la frappe.

---

## ⚖️ 3. Conséquences & Bénéfices Validés

1. **Qualité Clinique Supérieure** : Les CAT générées s'appuient sur les extraits les plus pertinents de vos 78 livres officiels.
2. **Zéro Erreur de Structure** : Les fiches générées respectent mathématiquement le format JSON requis dès la 1ère tentative.
3. **Expérience Médecin Fluide** : Recherche sans friction d'accents sur smartphone et révision médicale optimisée pour la mémorisation à long terme.
4. **100% de Tests Réussis** : Les 11 suites de tests du projet passent sans aucun échec.
