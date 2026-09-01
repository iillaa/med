# 📐 Référence : Matrice Exhaustive des Endpoints HTTP / REST

> **Quadrant Diátaxis** : *03-Reference (Specifications)*  
> **Statut** : Production (v1.17.0+)  
> **Fichiers Associés** : `server/routes/*.js`, `worker.js`, `server/api.js`

---

## 🌐 1. Endpoints Publics (Client & PWA)

| Méthode | Route | Rôle & Description | Authentification | Payload Requis | Réponse Type |
| :--- | :--- | :--- | :--- | :--- | :--- |
| `GET` | `/api/cats` | Liste complète des fiches médicales | Public (Clé App) | Aucun | `200 OK` (Array JSON) |
| `GET` | `/api/version` | Version active, minVersion et Kill Switch | Public | Aucun | `200 OK` (`{ version, minVersion, forceUpdateActive }`) |
| `POST`| `/api/suggestions`| Envoi d'une proposition de fiche par un utilisateur | Public (Rate-Limited) | `{ title, category, summary, ... }` | `200 OK` (`{ success: true, id }`) |
| `POST`| `/api/telemetry` | Envoi d'un rapport de crash ou log anonymisé | Public (Rate-Limited) | `{ errorType, message, stack, ... }` | `200 OK` (`{ success: true, fingerprint }`) |
| `GET` | `/api/is-local` | Vérifie si le client tourne sur localhost | Public | Aucun | `200 OK` (`{ isLocal: boolean }`) |
| `GET` | `/api/is-admin` | Vérifie si la session détient un token admin | Public | Aucun | `200 OK` (`{ isAdmin: boolean }`) |

---

## 🔐 2. Endpoints d'Authentification

| Méthode | Route | Rôle & Description | Authentification | Payload Requis | Réponse Type |
| :--- | :--- | :--- | :--- | :--- | :--- |
| `POST` | `/api/login` | Authentification admin et émission du token | Localhost / Public | `{ password: string }` | `200 OK` (`{ token: string }`) / `401 Unauthorized` |

---

## 🛠️ 3. Endpoints d'Administration & Staging

*Note : Tous les endpoints `/api/admin/*` exigent `Authorization: Bearer <TOKEN>` ET une IP localhost.*

| Méthode | Route | Rôle & Description | Payload Requis | Réponse Type |
| :--- | :--- | :--- | :--- | :--- |
| `GET` | `/api/admin/staging-list` | Liste des fiches en cours de validation | Aucun | `200 OK` (`{ files: [...] }`) |
| `POST`| `/api/admin/staging-save` | Création ou mise à jour d'une fiche en staging | `{ doc: { ... } }` | `200 OK` (`{ success: true }`) |
| `POST`| `/api/admin/staging-delete`| Suppression d'une fiche en staging | `{ id: string }` | `200 OK` (`{ success: true }`) |
| `POST`| `/api/admin/staging-clean-ocr`| Nettoyage de l'OCR d'un document staging | `{ id: string, text: string }` | `200 OK` (`{ success: true }`) |
| `GET` | `/api/admin/cat-generator/data`| Récupère l'état et schéma du générateur | Aucun | `200 OK` (`{ schema_version: "3.5", ... }`) |
| `POST`| `/api/admin/cat-generator/generate`| Déclenche la génération d'une CAT par l'IA | `{ topic: string, category: string }`| `200 OK` (`{ cat: { ... } }`) |
| `POST`| `/api/admin/rag-simulate` | Simule le matching vectoriel sur les PDFs | `{ query: string, keywords: [...] }` | `200 OK` (`{ results: [...] }`) |

---

## ✂️ 4. Endpoints du PDF Lab & Visual Slicer

| Méthode | Route | Rôle & Description | Payload Requis | Réponse Type |
| :--- | :--- | :--- | :--- | :--- |
| `GET` | `/api/admin/pdf-lab-list` | Liste des fichiers PDF du corpus master | Aucun | `200 OK` (`{ files: [...] }`) |
| `GET` | `/api/admin/pdf-lab-json` | Inspection détaillée du JSON indexé d'un PDF | Query: `?filename=...` | `200 OK` (`{ pages: [...] }`) |
| `POST`| `/api/admin/pdf-lab-parse`| Lancement d'un parse complet sur un PDF | `{ filename: string }` | `200 OK` (`{ success: true }`) |
| `POST`| `/api/admin/save-pdf-toc` | Sauvegarde d'un sommaire GPS (TOC) | `{ filename: string, toc: [...] }` | `200 OK` (`{ success: true }`) |
| `POST`| `/api/admin/slice-pdf` | Découpage visuel d'une plage de pages PDF | `{ sourceFile, startPage, endPage, outputFile }` | `200 OK` (`{ success: true, text }`) |
| `POST`| `/api/admin/compress-pdf`| Compression unitaire d'un PDF pour l'APK | `{ filename: string }` | `200 OK` (`{ success: true }`) |
| `POST`| `/api/admin/archive-pdf-master`| Déplacement d'un PDF traité dans `pdf_done/` | `{ filename: string }` | `200 OK` (`{ success: true }`) |
| `POST`| `/api/admin/restore-pdf-master`| Restauration d'un PDF archivé | `{ filename: string }` | `200 OK` (`{ success: true }`) |

---

## 🚨 5. Endpoints de Télémétrie & Crash Reporting

| Méthode | Route | Rôle & Description | Payload Requis | Réponse Type |
| :--- | :--- | :--- | :--- | :--- |
| `GET` | `/api/admin/telemetry` | Liste agrégée des incidents de crash | Aucun | `200 OK` (`{ reports: [...] }`) |
| `DELETE`| `/api/admin/telemetry/:id`| Suppression d'un incident résolu | Param: `:id` | `200 OK` (`{ success: true }`) |
| `DELETE`| `/api/admin/telemetry/all`| Vidage complet du registre des crashs | Aucun | `200 OK` (`{ success: true }`) |

---

## 🔗 Liens & Documents Associés
- 🛡️ [Architecture de Sécurité & Isolation](file:///data/data/com.termux/files/home/med/docs/01-architecture/security-isolation.md)
- 🌐 [Architecture Réseau Dual-Rail](file:///data/data/com.termux/files/home/med/docs/01-architecture/dual-rail-network.md)
- 📐 [Inventaire des Secrets & Environnements](file:///data/data/com.termux/files/home/med/docs/03-reference/environment-secrets.md)
