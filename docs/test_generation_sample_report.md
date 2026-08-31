# 📊 Rapport de Test Réel — Génération des 6 Fiches Témoins

> **Date** : 31/08/2026 13:28:38
> **Moteur** : Gemini AI (Dual RAG + Charte Clinique v1.17.0)

---

## 📋 Synthèse des Résultats

| # | Pathologie | Spécialité | Attente | Sub-CATs Réels | Statut | Validation |
|---|------------|------------|---------|----------------|:------:|:----------:|
| 1 | **Bouchon de Cérumen** | ORL | 0 Sub-CAT (Simple) | 0 (0) | ✅ OK | 🟢 Valide |
| 2 | **Blépharite** | Ophtalmologie | 0 Sub-CAT (Simple) | 1 (🚨 Blépharite à Demodex) | ✅ OK | 🟢 Valide |
| 3 | **Angine Aiguë** | ORL | 1-2 Sub-CAT (Phlegmon / Complication) | 2 (🚨 Phlegmon Péri-Amygdalien (Complication), 👅 Angine de Vincent) | ✅ OK | 🟢 Valide |
| 4 | **Abcès Dentaire** | Stomatologie | 1-2 Sub-CAT (Cellulite / Grossesse AINS) | ÉCHEC | ❌ ERREUR | N/A |
| 5 | **Diabète de Type 2** | Endocrinologie | 2-4 Sub-CAT (Acidocétose / Hyperosmolaire / Pied) | 1 (🚨 Acidocétose Diabétique) | ✅ OK | 🟢 Valide |
| 6 | **Hypertension Artérielle** | Cardiologie | 1-3 Sub-CAT (Urgence HTA / HTA Gravidique) | 1 (🚨 Urgence Hypertensive & Encéphalopathie) | ✅ OK | 🟢 Valide |

---

## 🔍 Analyse Détaillée par Fiche

### 1. Bouchon de Cérumen (ORL)

- **Modèle utilisé** : `gemini-3.5-flash`
- **Tokens utilisés** : 14083 (12634 in / 1449 out)
- **Latence** : 100122 ms
- **Nombre de Sub-CATs** : **0**
- **Sub-CATs** : *Aucun (Fiche univoque monobloc - Règle d'abstention respectée)*

#### 📄 Extrait Fiche Principale (Master) :
```markdown
**1. Évaluation initiale & Diagnostic :**
- **Symptomatologie :** Sensation d'oreille bouchée (souvent accentuée après la douche ou une baignade par gonflement du bouchon), hypoacousie de transmission, autophonie, bourdonnements/acouphènes, parfois otalgie réflexe ou prurit.
- **Otoscopie (indispensable) :** Visualisation d'une masse obstruant totalement ou partiellement le conduit auditif externe...
```

#### 💊 Extrait Ordonnance Master :
```markdown
**TRAITEMENT NON MÉDICAMENTEUX & RHD :**
- Proscription définitive de l'usage des cotons-tiges dans le conduit auditif externe.
- Nettoyage de l'oreille limité au pavillon et à l'entrée du conduit avec une serviette humide.
- En cas de bouchon dur : programmer un lavage d'oreille en consultation après 5 jours de traitement préparatoire.

**1ère INTENTION (Traitement médicamenteux de choix) :**
- X...
```

---

### 2. Blépharite (Ophtalmologie)

- **Modèle utilisé** : `gemini-3.5-flash`
- **Tokens utilisés** : 8431 (6430 in / 2001 out)
- **Latence** : 16172 ms
- **Nombre de Sub-CATs** : **1**
- **Titres des Sub-CATs** :
  * **🚨 Blépharite à Demodex**
    - *Summary :* **0. Spécificités & Urgence du Profil :** Forme de blépharite chronique résistante aux traitements classiques, caractérisée par la prolifération de l'...
    - *Ordonnance :* **TRAITEMENT NON MÉDICAMENTEUX & RHD :**
- Nettoyage quotidien des paupières avec des lingettes spécifiques imprégnées d'huile d'arbre à thé (Tea Tree...

#### 📄 Extrait Fiche Principale (Master) :
```markdown
**1. Évaluation initiale & Diagnostic :**
- **Interrogatoire :** Recherche de prurit, sensation de brûlure ou de corps étranger, larmoiement, photophobie, rougeur du rebord palpébral, antécédents de rosacée, de dermatite atopique ou de dermite séborrhéique.
- **Examen clinique (lampe à fente) :** 
  * *Blépharite antérieure :* Squames ou croûtes à la base des cils (collerettes), téléangiectasies d...
```

#### 💊 Extrait Ordonnance Master :
```markdown
**TRAITEMENT NON MÉDICAMENTEUX & RHD :**
- Application de compresses d'eau chaude (environ 40°C) sur les paupières fermées pendant 10 à 15 minutes, 2 fois par jour, pour liquéfier le sébum.
- Massage doux des paupières du haut vers le bas pour la paupière supérieure, et du bas vers le haut pour la paupière inférieure, pour exprimer les glandes de Meibomius.
- Nettoyage quotidien du bord libre des ...
```

---

### 3. Angine Aiguë (ORL)

- **Modèle utilisé** : `gemini-3.5-flash`
- **Tokens utilisés** : 18320 (15198 in / 3122 out)
- **Latence** : 141381 ms
- **Nombre de Sub-CATs** : **2**
- **Titres des Sub-CATs** :
  * **🚨 Phlegmon Péri-Amygdalien (Complication)**
    - *Summary :* **0. Spécificités & Urgence du Profil :** Urgence médico-chirurgicale ORL. Risque d'obstruction des voies aériennes supérieures et de diffusion de l'i...
    - *Ordonnance :* **TRAITEMENT NON MÉDICAMENTEUX & RHD :**
- Hospitalisation en milieu spécialisé ORL.
- À jeun strict initialement dans l'attente du geste de drainage....
  * **👅 Angine de Vincent**
    - *Summary :* **0. Spécificités & Urgence du Profil :** Angine ulcéro-nécrotique unilatérale liée à une association fuso-spirillaire, survenant typiquement sur un t...
    - *Ordonnance :* **TRAITEMENT NON MÉDICAMENTEUX & RHD :**
- Hygiène bucco-dentaire stricte : brossage doux des dents après chaque repas.
- Consultation dentaire obliga...

#### 📄 Extrait Fiche Principale (Master) :
```markdown
**1. Évaluation initiale & Diagnostic :**
- **Anamnèse :** Odynophagie d'apparition brutale, dysphagie, fièvre variable, frissons, parfois toux, rhinorrhée ou myalgies.
- **Examen clinique :** Amygdales tuméfiées, congestives (angine érythémateuse) ou recouvertes d'un enduit blanchâtre pultacé (angine érythémato-pultacée). Présence d'adénopathies cervicales sensibles.
- **Orientation étiologique (...
```

#### 💊 Extrait Ordonnance Master :
```markdown
**TRAITEMENT NON MÉDICAMENTEUX & RHD :**
- Repos au calme et hydratation abondante (boissons fraîches ou tièdes).
- Alimentation semi-liquide ou molle facile à avaler en cas d'odynophagie intense.

**1ère INTENTION (Si TDR Streptocoque A Positif) :**
- ⚠️ *Vérifier l'absence d'allergie aux pénicillines et aux bêta-lactamines.*
- **Amoxicilline (Clamoxyl) 1g comprimé :** 1 comprimé matin et soir (s...
```

---

### 4. Abcès Dentaire (Stomatologie)

❌ **Erreur** : Règles de sécurité clinique non résolues après 3 tentatives :
• Field "category" must be one of: Gastro-entérologie, Cardiologie, Pneumologie, Pédiatrie, Gynécologie-Obstétrique, Gynécologie / Obstétrique, Dermatologie, ORL / Ophtalmologie, ORL, Ophtalmologie, Neurologie / Psychiatrie, Neurologie, Psychiatrie, Rhumatologie / Traumatologie, Rhumatologie, Traumatologie, Hématologie, Infectiologie, Infectiologie / MST, Urologie / Néphrologie, Urologie, Néphrologie, Endocrinologie, Urgences, Administratif. Got: "Stomatologie"

### 5. Diabète de Type 2 (Endocrinologie)

- **Modèle utilisé** : `gemini-3.5-flash-lite`
- **Tokens utilisés** : 15726 (12706 in / 3020 out)
- **Latence** : 11457 ms
- **Nombre de Sub-CATs** : **1**
- **Titres des Sub-CATs** :
  * **🚨 Acidocétose Diabétique**
    - *Summary :* **0. Spécificités & Urgence du Profil :**
- Urgence médicale absolue mettant en jeu le pronostic vital. Hospitalisation immédiate en unité de soins in...
    - *Ordonnance :* **TRAITEMENT NON MÉDICAMENTEUX & RHD :**
- Mise en condition stricte : Patient à jeun, décubitus dorsal, alitement strict sous monitorage multiparamét...

#### 📄 Extrait Fiche Principale (Master) :
```markdown
**1. Évaluation initiale & Diagnostic :**
- Interrogatoire : Recherche de la triade classique (polyurie, polydipsie, asthénie), antécédents familiaux de diabète, facteurs de risque cardiovasculaire (HTA, dyslipidémie, tabac, obésité abdominale).
- Diagnostic positif : Glycémie à jeun ≥ 1,26 g/L (7,0 mmol/L) à deux reprises, ou glycémie aléatoire ≥ 2,0 g/L (11,1 mmol/L) avec symptômes cardinaux, ou...
```

#### 💊 Extrait Ordonnance Master :
```markdown
**TRAITEMENT NON MÉDICAMENTEUX & RHD :**
- Régime diabétique hypocalorique, pauvre en sucres rapides et en graisses saturées, riche en fibres.
- Activité physique régulière adaptée (ex: marche rapide 30 minutes par jour, 5 jours par semaine).
- Arrêt impératif du tabac et limitation de la consommation d'alcool.
- Auto-surveillance glycémique capillaire biquotidienne (à jeun et post-prandiale en al...
```

---

### 6. Hypertension Artérielle (Cardiologie)

- **Modèle utilisé** : `gemini-3.5-flash-lite`
- **Tokens utilisés** : 13567 (11366 in / 2201 out)
- **Latence** : 8596 ms
- **Nombre de Sub-CATs** : **1**
- **Titres des Sub-CATs** :
  * **🚨 Urgence Hypertensive & Encéphalopathie**
    - *Summary :* **0. Spécificités & Urgence du Profil :**
- Urgence médicale absolue menaçant le pronostic vital à court terme par atteinte viscérale aiguë.
- Hospita...
    - *Ordonnance :* **TRAITEMENT NON MÉDICAMENTEUX & RHD :**
- Conditionnement immédiat : patient en position demi-assise, pose de deux voies veineuses périphériques (VVP...

#### 📄 Extrait Fiche Principale (Master) :
```markdown
**1. Évaluation initiale & Diagnostic :**
- Définition : Pression Artérielle (PA) mesurée au cabinet ≥ 140/90 mmHg lors de consultations répétées (MAPA ou autodesantation automesure conseillée > 135/85 mmHg).
- Classification : Grade 1 (140-159 / 90-99 mmHg), Grade 2 (160-179 / 100-109 mmHg), Grade 3 (≥ 180 / ≥ 110 mmHg).
- Recherche des facteurs de risque cardiovasculaire (âge, tabac, diabète, dy...
```

#### 💊 Extrait Ordonnance Master :
```markdown
**TRAITEMENT NON MÉDICAMENTEUX & RHD :**
- Mesures hygiéno-diététiques strictes : régime hyposodé (< 6 g/j), arrêt du tabac, diminution de la consommation d'alcool, pratique d'une activité physique régulière (30 minutes par jour), perte de poids en cas de surpoids.

**1ère INTENTION (Traitement médicamenteux de choix) :**
- Vérifier l'absence d'allergie aux inhibiteurs de l'enzyme de conversion et...
```

---

