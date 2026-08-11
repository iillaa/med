# 📑 Guide de Standardisation des PDFs Médicaux pour Dr.CAT V3 RAG
> **Auteur**: Dr. Kibeche Ali Dia Eddine | **Système**: Dr.CAT Generator True V3

Ce guide explique comment structurer, formater et annoter n'importe quel document médical (PDF ou texte) pour qu'il soit **100% optimisé pour le moteur RAG V3** de Dr.CAT. 

Vous pouvez appliquer ce guide **manuellement** ou **copier-coller le prompt fourni à la fin dans une IA externe** (ChatGPT, Claude, Gemini Web) pour transformer un PDF brut en une référence clinique parfaite sans consommer vos tokens d'API.

---

## 🎯 POURQUOI STANDARDISER UN PDF ?

Notre moteur de recherche RAG attribue des **points de confiance clinique** :
1. **Sommaire avec Numéros de Page** ──► **+90 points (Navigation GPS Directe)**
2. **Phrase exacte du titre** ─────────► **+60 points**
3. **Ancres cliniques (`Traitement`, `Posologie`)** ──► **+20 points**
4. **Bloc de prescription structuré** ─► **Extraction complète de 2 000+ caractères**

Un PDF standardisé garantit que la prise en charge algérienne exacte et les posologies types arrivent en **position #1** dans le prompt de l'IA.

---

## 📐 LES 4 RÈGLES D'OR DE STRUCTURE

### Règle 1 : Nom de Fichier Clair et Explicite
- ✅ **Bon**: `CAT Gale Scabiose.pdf`, `Trt Anémie Ferriprive.pdf`, `150 Ordonnances Types.pdf`, `Urgences Gastro.pdf`
- ❌ **Mauvais**: `doc_scan_0123.pdf`, `cours1_final.pdf`

---

### Règle 2 : Le Sommaire "Pointeur GPS" (Pages 1 à 5)
Pour les gros documents multi-pathologies, insérez un **Sommaire / Table des matières** sur les premières pages avec des points `...` et le **numéro de page exact** :

```markdown
# Table des matières

- Intoxication alimentaire .................................... 94
- Gale humaine (Scabiose) .................................... 71
- Psoriasis du cuir chevelu .................................. 105
- Colique néphrétique aiguë .................................. 48
- Appendicite aiguë de l'enfant .............................. 112
```

> 💡 **Effet RAG** : Le moteur lit `Gale ..... 71`, saute instantanément à la **Page 71**, et extrait le protocole sans aucun bruit !

---

### Règle 3 : Les 5 Titres de Section Standard (Ancres Cliniques)
Chaque chapitre ou fiche doit contenir des titres clairs reconnaissables par l'analyseur :

```markdown
# [Titre de la Pathologie / Conduite à Tenir]

## 1. Évaluation initiale & Diagnostic
- Définition, signes cliniques majeurs, interrogatoire.

## 2. Drapeaux Rouges & Signes de Gravité (Urgences)
- Critères d'hospitalisation immédiate, choc, défaillance.

## 3. Examens Complémentaires (Bilan)
- Biologie (FNS, CRP, ionogramme), imagerie (ASP, Échographie, TDM).

## 4. Traitement & Prise en charge
- En urgence / Traitement initial de crise.
- Ordonnance de sortie type (DCI, Forme, Dosage, Posologie, Durée).
- Règles hygiéno-diététiques (RHD).

## 5. Orientation & Suivi
- Critères de transfert, surveillance, consultation de contrôle.
```

---

### Règle 4 : Modèle de Prescription Précis (Ordonnance Type)
Pour que les dosages soient fidèlement capturés et validés par le module de sécurité :

```markdown
# Ordonnance Type :

1. Benzoate de benzyle 10% (Ascabiol lotion) :
   - Application locale le soir après un bain tiède, laisser sécher 10 min.
   - 2ème application à J1, douche de rinçage à J2 (après 24h).
   - Répéter à J8 si persistance.

2. Ciprofloxacine 500 mg comprimé :
   - 1 comprimé 2 fois par jour pendant 5 jours.
   - ⚠️ CI absolue : Grossesse, enfant < 18 ans.

3. Paracétamol 1 g comprimé :
   - 1 comprimé 3 fois par jour si douleur/fièvre (max 4 g/j).
```

---

## 🤖 PROMPT CLÉ EN MAIN POUR IA EXTERNE (ChatGPT / Claude / Gemini)

Copiez-collez le prompt suivant dans une IA externe avec votre document brut :

````markdown
Agis comme un médecin réviseur expert en synthèse clinique et standardisation de bases de données médicales (Dr.CAT RAG Engine).

Voici un texte / cours médical brut. Réorganise-le et formate-le selon la structure standard suivante pour qu'il soit parfaitement optimisé pour un moteur RAG :

### STRUCTURE ATTENDUE :

# [Titre complet de la Pathologie]

## 1. Évaluation initiale & Diagnostic
- Définition concise et critères diagnostiques clés (signes fonctionnels, physiques).

## 2. Drapeaux Rouges & Signes de Gravité
- Signes d'alarme vitaux imposant une hospitalisation ou un geste d'urgence.

## 3. Examens Complémentaires
- Bilan paraclinique de première intention et imagerie utile.

## 4. Traitement & Conduite à Tenir
- Mesures d'urgence et stabilisation immédiate si nécessaire.
- **Ordonnance de Sortie Type** :
  * Nom de la molécule (DCI) + Spécialité commerciale courante.
  * Forme (comprimé, injectable, sachet, sirop) et dosage précis.
  * Posologie exacte (ex: 1 cp 3x/j) et durée du traitement (ex: pdt 5 jours).
  * Posologie pédiatrique en mg/kg si applicable.
- Règles Hygiéno-Diététiques (RHD) et mesures non médicamenteuses.

## 5. Orientation & Suivi
- Critères de recours au spécialiste et suivi post-traitement.

### CONSIGNES STRICTES :
1. Conserve tous les médicaments, molécules, dosages et durées exactes du document source.
2. Utilise des termes médicaux précis en français.
3. Rends les titres de sections exactement comme ci-dessus (avec `## 1.`, `## 2.`, etc.).
4. Évite tout texte de remplissage inutile. Sois direct, clinique et prêt à l'emploi.

Voici le document médical à transformer :
[COLLER VOTRE TEXTE / FICHIER ICI]
````

---

## 🔄 WORKFLOW APRÈS FORMATAGE DU PDF

Une fois votre document rédigé ou re-généré :

```
1. Enregistrez le document en format PDF (ex: CAT_Asthme_Aigu.pdf)
                       ↓
2. Placez-le dans : data/pdf_masters/
                       ↓
3. Dans Termux, lancez la commande :
   npm run reindex
   (ou utilisez le PDF Lab dans l'application)
                       ↓
4. Le fichier est automatiquement analysé, indexé dans pdf_index.json
   et prêt à 100% pour le générateur V3 !
```
