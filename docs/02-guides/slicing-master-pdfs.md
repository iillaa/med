# ✂️ Guide : Découpage Visuel de PDFs & Sommaire GPS (PDF Lab)

> **Quadrant Diátaxis** : *02-Guides (How-To Guides)*  
> **Statut** : Production (v1.17.0+)  
> **Composants Clés** : `admin/pdf_lab.html`, `admin/js/pdf_lab.js`, `server/pdf_extractor.js`, `scripts/compress_pdfs.js`

---

## 🎯 1. Vue d'Ensemble du PDF Lab

Le **PDF Lab** est le studio d'ingénierie documentaire intégré à Dr. CAT. Il permet aux médecins administrateurs de :
1. Inspecter visuellement des polycopiés et consensus médicaux volumineux.
2. Découper avec précision chirurgicale les chapitres d'intérêt via le **Visual Slicer**.
3. Construire des **Sommaires GPS (TOC)** pour le guidage du moteur RAG.
4. Compresser et optimiser les fichiers pour l'application mobile Android.

---

## 🖥️ 2. Procédure Pas-à-Pas de Découpage d'un Document

### Étape 1 : Accéder au PDF Lab
1. Lancez le serveur local : `npm start`
2. Ouvrez votre navigateur sur : `http://localhost:3000/admin/pdf_lab.html`
3. Authentifiez-vous avec votre mot de passe administrateur.

### Étape 2 : Sélectionner et Inspecter le Document Master
- Dans la colonne de gauche, cliquez sur le document cible (ex: `Gastro_Enterologie_Cours.pdf`).
- L'aperçu vectoriel s'affiche au centre. Utilisez la molette ou les flèches pour feuilleter le document.

### Étape 3 : Définir la Plage de Découpage (Visual Slicer)
1. Repérez les pages de début et de fin du chapitre souhaité (ex: Page 14 à 18 : *Hémorragie Digestive Haute*).
2. Dans le panneau de droite **Visual Slicer** :
   - Renseignez **Page Début** : `14`
   - Renseignez **Page Fin** : `18`
   - Renseignez le nom de sortie : `Hemorragie_Digestive_Haute.pdf`
3. Cliquez sur **Découper & Extraire le Texte**.
4. Le système génère instantanément le fichier PDF découpé et extrait le texte vectoriel dans l'espace de staging.

---

## 📑 3. Construction d'un Sommaire GPS (Table des Matières)

Pour permettre au moteur LLM de savoir précisément où chercher dans un document de 200 pages sans découper le fichier physique :

1. Dans le PDF Lab, cliquez sur l'onglet **Sommaire GPS / TOC**.
2. Ajoutez les entrées d'index :
   - Chapitre : `Reflux Gastro-Œsophagien (RGO)` ➔ Pages `5 - 9`
   - Chapitre : `Ulcère Gastro-Duodénal` ➔ Pages `10 - 13`
   - Chapitre : `Hémorragie Digestive` ➔ Pages `14 - 18`
3. Cliquez sur **Enregistrer le Sommaire GPS**.
4. Le fichier TOC est indexé dans `data/pdf_cache/` et injecté automatiquement lors des requêtes RAG.

---

## 🗜️ 4. Compression des PDFs pour l'APK Android

Avant de compiler l'APK, optimisez le poids de l'ensemble des PDFs :

```bash
# Lancement de la compression dual-stream (Ghostscript + PDF-Lib)
npm run compress:pdfs
```

Le script :
- Réduit la résolution des images scannées à 150 DPI.
- Supprime les polices vectorielles redondantes.
- Réindexe les fichiers dans `public/data/pdf_index.json`.

---

## 📦 5. Archivage des Fichiers Traités

Une fois un document Master entièrement découpé et ses fiches intégrées :
- Dans le PDF Lab, cliquez sur **Archiver le Master**.
- Le document est déplacé dans `pdf_done/` pour alléger l'espace de travail actif tout en restant restaurable en 1 clic.

---

## 🔗 Liens & Documents Associés
- 📄 [Architecture du Pipeline RAG](file:///data/data/com.termux/files/home/med/docs/01-architecture/pdf-rag-pipeline.md)
- 📱 [Guide de Compilation de l'APK Android](file:///data/data/com.termux/files/home/med/docs/02-guides/compiling-android-apk.md)
- 🛠️ [Guide de Génération des CATs](file:///data/data/com.termux/files/home/med/docs/02-guides/generating-validating-cats.md)
