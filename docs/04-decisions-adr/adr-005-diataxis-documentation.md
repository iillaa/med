# 📜 ADR-005 : Standardisation de la Documentation Technique sur le Framework Diátaxis

> **Statut** : Accepté  
> **Date** : 2026-08-27  
> **Décideurs** : Dr. Kibeche Ali Dia Eddine & Lead Architect

---

## 🎯 Contexte & Problématique

Avec la multiplication des briques techniques de Dr. CAT (Moteur LLM V3.5, Pipeline RAG, Sentry-Grade Telemetry, Sécurité Termux/Android, PWA & Cloudflare Workers), la documentation technique accumulée dans `docs/` souffrait de plusieurs limitations :
1. **Mélange des Genres** : Des fichiers uniques mélangeant tutoriels opérationnels, spéculations théoriques, bouts de code et historiques de bugs.
2. **Difficulté de Navigation** : Absence de taxonomie documentaire claire pour les nouveaux contributeurs ou pour les agents d'assistance IA.
3. **Pertes d'Historique de Choix** : Décisions d'ingénierie majeures disséminées dans des commits ou des messages de chat.

---

## 💡 Décision Architecturale

Nous adoptons le standard international **Diátaxis Documentation Framework** complété par un registre formel d'**Architecture Decision Records (ADRs)** :

```text
docs/
├── 01-architecture/   # Explanations (Comprendre le "Pourquoi" et la théorie)
├── 02-guides/         # How-To Guides (Résoudre un problème concret pas-à-pas)
├── 03-reference/      # Reference (Spécifications techniques, schémas, API)
└── 04-decisions-adr/  # ADRs (Mémoire immuable des choix d'ingénierie)
```

Chaque document technique doit s'inscrire strictement dans l'un de ces 4 quadrants et comporter un en-tête d'identification standardisé.

---

## ⚖️ Conséquences & Bénéfices

### Positives :
- ✅ **Clarté Cognitive** : Séparation nette entre apprentissage, action immédiate et consultation de référence.
- ✅ **Efficacité des Agents IA** : Indexation optimisée pour les modèles de langage à large contexte.
- ✅ **Pérennité du Savoir** : Registre ADR préservant le contexte des décisions passées.

### Négatives / Contraintes :
- ⚠️ Nécessite de maintenir l'arborescence à jour lors de l'ajout de nouvelles fonctionnalités.
