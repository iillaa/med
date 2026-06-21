# Dr. CAT - Réfresher Médical de Poche 🩺

**Dr. CAT** est une application web de révision clinique légère et premium, conçue spécifiquement pour tourner localement sur un smartphone Android via **Termux** et s'ouvrir directement dans votre navigateur mobile. 

Elle permet à un médecin généraliste d'étudier 55 cas pratiques de "Conduite à tenir" (CAT) essentiels, de conserver des observations cliniques locales, d'ajuster des ordonnances types adaptatives et d'ouvrir instantanément ses cours PDF de référence.

---

## 🚀 Fonctionnalités Clés

1. **Fiches de Synthèse Clinique** : 55 fiches pré-remplies en français (Diagnostic, Clinique, Red Flags) enrichies de règles claires d'**Orientation et Avis Spécialisé** (quand référer le patient et vers quel spécialiste).
2. **Ordonnances Types Multiples & Adaptatives** : 
   - Modèles d'ordonnances réalistes éditables.
   - Support des variantes en insérant des séparateurs `--- Nom de la Variante ---` dans l'éditeur (ex: `--- Adulte ---` et `--- Enfant ---`). L'application génère automatiquement des boutons pour naviguer entre elles.
   - Bouton de copie en 1 clic de la variante active.
3. **Notes Personnelles & Observations** : Zone de prise de notes persistantes pour documenter vos protocoles locaux.
4. **Intégration PDF de Référence** :
   - Association automatique des fichiers PDF/DOCX de votre répertoire `reference-pdfs` avec la fiche selon des mots-clés.
   - Section *Manuels & Guides Généraux* pour garder en accès permanent vos gros ouvrages de référence (guides d'ordonnances, manuels généraux).
5. **Recherche Clinique Totale & Filtres Rapides** :
   - Barre de recherche filtrant par titre, spécialité, contenu de synthèse, et signes de gravité (Red Flags).
   - Filtres de statut d'apprentissage (`Tous`, `À faire`, `En cours`, `Maîtrisé`) et filtre prioritaire `Red Flags ⚠️` pour afficher les cas d'urgences critiques.
6. **Widget de Lancement Rapide (Xiaomi Poco F6)** : Script d'intégration avec le module `Termux:Widget` pour lancer le serveur et ouvrir l'application en 1 clic depuis votre écran d'accueil Android.

---

## 📂 Architecture du Projet

```text
/data/data/com.termux/files/home/med/
├── cats_db.json                 # Base de données globale des fiches (IDs 1-55 + personnalisées)
├── cats_db.json.bak             # Copie de sauvegarde automatique de la base
├── data.json                    # Données d'avancement utilisateur (notes, statuts, personnalisations)
├── data.json.bak                # Copie de sauvegarde automatique de votre avancement
├── server.js                    # Serveur Express.js local (Backend)
├── package.json                 # Dépendances Node.js (express)
├── cat-med/
│   └── reference-pdfs/          # Répertoire contenant vos fichiers PDF/DOCX de cours
└── public/                      # Dossier statique de l'interface (Frontend)
    ├── index.html               # Structure HTML5
    ├── style.css                # Design sombre clinique moderne & responsive
    └── app.js                   # Interactivité JavaScript (recherche, filtres, variantes)
```

---

## 🔒 Intégrité et Sécurité des Données (Data Integrity)

Pour parer aux risques de corruption de fichiers sous Termux (ex: si l'application s'arrête brutalement ou si le téléphone s'éteint lors de la sauvegarde), Dr. CAT intègre les mécanismes de sécurité suivants :
- **Sauvegarde Préventive Automatique (`.bak`)** : À chaque fois qu'une modification est apportée à votre progression (`data.json`) ou à la base (`cats_db.json`), le serveur effectue une copie miroir de sauvegarde (`.bak`) du fichier original sur le disque avant de lancer l'écriture.
- **Écriture Atomique (Atomic Writes)** : Les données sont d'abord écrites dans un fichier temporaire (`.tmp`). Une fois l'écriture validée, le fichier temporaire remplace l'original via un renommage atomique (`fs.renameSync`). Cela garantit qu'en cas d'interruption électrique, vos fichiers originaux ne seront jamais corrompus ou vidés.

---

## 🛠️ Utilisation et Lancement

### Lancement Manuel (Termux)
1. Allez dans le répertoire du projet :
   ```bash
   cd ~/med
   ```
2. Démarrez le serveur :
   ```bash
   node server.js
   ```
3. Ouvrez votre navigateur mobile sur [http://localhost:3000](http://localhost:3000).

### Lancement par Raccourci Écran d'Accueil
L'application est pré-configurée avec le widget Termux. Cliquez simplement sur le widget **`start_med.sh`** sur votre écran d'accueil Poco F6. Le serveur démarrera automatiquement et le navigateur s'ouvrira directement sur la bonne adresse.
