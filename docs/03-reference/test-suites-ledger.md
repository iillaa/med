# 📐 Référence : Registre des 11 Suites de Tests Automatisées

> **Quadrant Diátaxis** : *03-Reference (Specifications)*  
> **Statut** : Production (v1.17.0+)  
> **Fichiers Associés** : `tests/run_all_tests.js`, `tests/*.js`

---

## 🎯 1. Vue d'Ensemble & Commande Maîtresse

Dr. CAT intègre **11 suites de tests automatisées** couvrant la sécurité, la pharmacologie, la télémétrie, le découpage de PDF et l'intégrité de la base de données.

```bash
# Lancement de l'ensemble des suites de tests automatisées
npm run test:suite
```

---

## 📊 2. Registre Détaillé des Suites de Tests

| N° | Fichier de Test | Périmètre & Assertions Clés | Commande Unitaire |
| :---: | :--- | :--- | :--- |
| **1** | `tests/test_api.js` | Démarrage serveur, routes publiques `/api/cats`, `/api/version`, CORS preflight. | `node tests/test_api.js` |
| **2** | `tests/test_auth_security.js` | Blocage 403 des IP distantes sur les routes admin, validation des tokens Bearer. | `node tests/test_auth_security.js` |
| **3** | `tests/test_telemetry.js` | Ingestion des crashs, déduplication SHA-256, escalade de sévérité, endpoints admin. | `node tests/test_telemetry.js` |
| **4** | `tests/test_medical_validator.js` | Validation en 7 sections, plafonds posologiques, détection des molécules inconnues. | `node tests/test_medical_validator.js` |
| **5** | `tests/test_pdf_lab_endpoints.js` | Liste PDF Lab, Visual Slicer, Sommaire GPS (TOC), compression unitaire. | `node tests/test_pdf_lab_endpoints.js` |
| **6** | `tests/test_suggestions_sync.js` | Vérification de la parité `SYNC_SECRET` et synchronisation bidirectionnelle KV. | `node tests/test_suggestions_sync.js` |
| **7** | `tests/test_storage_safety.js` | Non-effacement de `localStorage` lors de l'activation du Kill Switch. | `node tests/test_storage_safety.js` |
| **8** | `tests/test_canary_dosages.js` | Canaries de dosage : 15 expressions de posologie complexes soumises aux regex. | `node tests/test_canary_dosages.js` |
| **9** | `tests/test_golden_regression.js` | Régression clinique sur les 5 cas de référence (`golden_set.json`). | `node tests/test_golden_regression.js` |
| **10**| `tests/test_subcats_matrix.js` | Intégrité des 60 Master CATs et 63 Sub-CATs (IDs, titres, catégories). | `node tests/test_subcats_matrix.js` |
| **11**| `tests/run_all_tests.js` | Orchestrateur maître exécutant les 10 suites avec rapport de synthèse global. | `npm run test:suite` |

---

## 🔗 Liens & Documents Associés
- 🛠️ [Guide Onboarding Développeur](file:///data/data/com.termux/files/home/med/docs/02-guides/developer-onboarding.md)
- 🛡️ [Architecture de Sécurité](file:///data/data/com.termux/files/home/med/docs/01-architecture/security-isolation.md)
- 🤖 [Architecture du Moteur LLM](file:///data/data/com.termux/files/home/med/docs/01-architecture/llm-generation-engine.md)
