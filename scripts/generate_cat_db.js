const fs = require('fs');
const path = require('path');

const cats = [
  {
    id: 1,
    category: "Gastro-entérologie",
    title: "CAT devant intoxication alimentaire",
    summary: `**1. Évaluation initiale & Diagnostic :**
- Interrogatoire : Notion de cas similaires (repas commun), délai d'apparition (court pour Staph. aureus, long pour Salmonella), nature des aliments.
- Clinique : Douleurs abdominales, vomissements, diarrhée, fièvre, signes de déshydratation.

**2. Conduite à tenir :**
- Évaluer l'état d'hydratation (pli cutané, soif, tension, diurèse).
- Repos digestif initial puis réalimentation progressive (éviter lait, graisses, fibres).
- Réhydratation orale (SRO) prioritaire.

**3. Traitement :**
- Anti-sécrétoire : Racécadotril (Tiorfan) 100mg, 1 gélule 3x/jour (max 7 jours).
- Antispasmodique : Phloroglucinol (Spasfon) 80mg, 2 cp au moment de la crise.
- Antibiotiques : Généralement contre-indiqués (sauf cas sévères avec fièvre élevée, syndrome dysentérique : Ciprofloxacine 500mg 2x/j pendant 3-5 jours).`,
    red_flags: "Fièvre > 38.5°C, syndrome dysentérique (sang/glaires dans les selles), déshydratation clinique (perte de poids > 5%), terrain à risque (nourrisson, sujet âgé, immunodéprimé).",
    ordonnance: "1. SRO (Solutés de Réhydratation Orale) : 1 sachet dans 1L d'eau minérale, à boire par petites gorgées.\n2. Tiorfan (Racécadotril) 100mg : 1 gélule 3 fois par jour, max 7 jours.\n3. Spasfon (Phloroglucinol) 80mg : 2 comprimés en cas de douleur abdominale, max 3 fois par jour.",
    pdf_keywords: ["Gastrologie", "Médicaments en Gastrologie", "Urgences"]
  },
  {
    id: 2,
    category: "Gastro-entérologie",
    title: "CAT devant diarrhée",
    summary: `**1. Évaluation :**
- Diarrhée aiguë (< 2 semaines) vs chronique (> 4 semaines).
- Recherche de cause infectieuse (virale ++, bactérienne, parasitaire) ou iatrogène (antibiotiques).

**2. Conduite à tenir :**
- Privilégier la réhydratation.
- Ne pas utiliser de ralentisseurs du transit (Lopéramide) en cas de diarrhée fébrile ou sanglante (risque de mégacôlon toxique).

**3. Traitement :**
- Réhydratation orale.
- Racécadotril (Tiorfan) ou Smecta (Diosmectite).
- Probiotiques pour restaurer la flore.`,
    red_flags: "Diarrhée fébrile, rectorragies ou méléna, déshydratation, immunodépression, retour de voyage tropical, persistance au-delà de 5 jours.",
    ordonnance: "1. Diosmectite (Smecta) : 1 sachet 3 fois par jour au moment des repas pendant 3 à 5 jours.\n2. Racécadotril 100mg : 1 gélule 3 fois par jour.\n3. Paracétamol 1g : 1 comprimé en cas de fièvre, max 4 par jour.",
    pdf_keywords: ["Gastrologie", "Médicaments en Gastrologie", "Urgences"]
  },
  {
    id: 3,
    category: "Gastro-entérologie",
    title: "CAT devant vomissements / RGO",
    summary: `**1. Vomissements :**
- Rechercher une cause digestive (occlusion, gastro-entérite, cholécystite), neurologique (HTIC, méningite), métabolique (acidocétose diabétique) ou médicamenteuse.
- Traitement symptomatique : Antiémétiques (Métoclopramide ou Dompéridone). Attention aux effets secondaires extrapyramidaux chez le sujet jeune (préférer le Métopimazine - Vogalène).

**2. RGO (Reflux Gastro-Œsophagien) :**
- Diagnostic clinique devant un pyrosis typique (brûlure ascendante rétrosternale) et des régurgitations acides.
- Traitement de première intention : Règles hygiéno-diététiques + IPP (Inhibiteurs de la Pompe à Protons) à demi-dose ou pleine dose selon la sévérité et la présence de signes d'œsophagite.`,
    red_flags: "Pour les vomissements : Céphalées violentes, raideur de nuque (méningite), douleur abdominale aiguë, arrêt des matières et des gaz (occlusion). Pour le RGO : Dysphagie (difficulté à avaler), odynophagie, perte de poids inexpliquée, anémie.",
    ordonnance: "**Pour le RGO atypique ou sévère :**\n1. Oméprazole 20mg : 1 gélule le matin à jeun pendant 4 semaines.\n2. Gaviscon (Alginate de sodium / Bicarbonate de sodium) : 1 sachet après les 3 repas principaux et au coucher si nécessaire.\n\n**Pour les vomissements :**\n1. Vogalène (Métopimazine) 15mg : 1 gélule en cas de nausée ou vomissement (max 3/j).",
    pdf_keywords: ["Gastrologie", "Médicaments en Gastrologie", "Urgences"]
  },
  {
    id: 4,
    category: "Gastro-entérologie",
    title: "CAT devant constipation",
    summary: `**1. Évaluation :**
- Distinguer constipation passagère (aiguë) et chronique (> 6 mois).
- Rechercher des causes secondaires : Médicamenteuse (opioïdes, anticholinergiques), métabolique (hypothyroïdie, hypercalcémie), ou organique (cancer colorectal).

**2. Prise en charge :**
- RHD en première intention : Augmentation des fibres alimentaires, hydratation suffisante (> 1.5L/jour), activité physique, heure régulière pour aller à la selle.
- Laxatifs de première ligne : Laxatifs osmotiques (Macrogol, Lactulose) ou de lest (Psyllium).
- Laxatifs stimulants (Séné, Bisacodyl) à réserver au court terme pour éviter la maladie des laxatifs.`,
    red_flags: "Apparition récente chez un patient de > 50 ans, sang dans les selles (rectorragies), perte de poids, altération de l'état général, douleurs abdominales intenses ou arrêt des gaz (occlusion).",
    ordonnance: "1. Macrogol 4000 (Forlax) 10g : 1 à 2 sachets par jour, de préférence le matin dans un verre d'eau.\n2. Lactulose sirop : 1 à 2 cuillères à soupe par jour en cas de selles dures.\n3. Suppositoire de Glycérine : 1 suppositoire à la demande en cas de constipation terminale (dyschésie).",
    pdf_keywords: ["Gastrologie", "Médicaments en Gastrologie"]
  },
  {
    id: 5,
    category: "Gastro-entérologie",
    title: "CAT devant colique hépatique",
    summary: `**1. Diagnostic :**
- Douleur brutale, intense, siégeant au niveau de l'hypochondre droit (HD) ou de l'épigastre, irradiant vers l'épaule droite ou l'omoplate.
- Inhibition inspiratoire (signe de Murphy positif à la palpation sous-costale droite).
- Souvent accompagnée de nausées/vomissements. Apyrétique (pas de fièvre).

**2. Prise en charge :**
- Repos strict, mise à jeun initiale si vomissements.
- Calmer la douleur en urgence par des antalgiques et antispasmodiques. Les AINS (Kétoprofène) sont particulièrement efficaces car ils réduisent la tension de la vésicule biliaire.
- Échographie abdominale à réaliser rapidement pour confirmer la lithiase vésiculaire.`,
    red_flags: "Présence de fièvre ou frissons (suggérant une cholécystite ou angiocholite), ictère (jaunisse) ou urines foncées (migration dans la voie biliaire principale).",
    ordonnance: "1. Profénid (Kétoprofène) 100mg : 1 comprimé 2 fois par jour pendant les repas (max 5 jours) + IPP protecteur si antécédents d'ulcère.\n2. Spasfon (Phloroglucinol) 80mg : 2 comprimés à renouveler en cas de spasme douloureux.\n3. Paracétamol 1g : 1 comprimé toutes les 6 heures si douleur résiduelle.",
    pdf_keywords: ["Gastrologie", "Médicaments en Gastrologie", "Urgences"]
  },
  {
    id: 6,
    category: "Gastro-entérologie",
    title: "Différence entre colique hépatique et cholécystite",
    summary: `**Tableau comparatif clinique et paraclinique :**

| Critère | Colique Hépatique | Cholécystite Aiguë |
| :--- | :--- | :--- |
| **Mécanisme** | Obstruction transitoire du canal cystique | Obstruction prolongée + Infection bactérienne de la paroi vésiculaire |
| **Douleur** | < 6 heures, cède spontanément ou sous antalgiques | > 6 heures, persistante, intense |
| **Fièvre** | Absente (Température normale) | Présente (Fièvre > 38.5°C, frissons) |
| **Défense / Murphy** | Murphy douloureux mais pas de défense | Murphy très douloureux + défense sous-costale droite |
| **Biologie** | Bilan hépatique et NFS normaux | Hyperleucocytose à PNN, CRP élevée |
| **Échographie** | Calcul(s) vésiculaire(s) sans modification de la paroi | Calcul enclavé, paroi vésiculaire épaissie (> 4 mm), épanchement péri-vésiculaire, signe de Murphy échographique |

**Conduite à tenir :**
- Colique hépatique simple : Ambulatoire, antalgiques + chirurgie programmée (cholécystectomie).
- Cholécystite : Hospitalisation en chirurgie, antibiothérapie IV, mise à jeun, chirurgie dans les 24-72h.`,
    red_flags: "Signes de sepsis (tachycardie, hypotension), ictère associé (suspicion d'angiocholite sous-jacente - urgence extrême).",
    ordonnance: "**En cas de suspicion de Cholécystite :** Référencer immédiatement aux urgences chirurgicales avec :\n1. Lettre d'orientation détaillée.\n2. Échographie abdominale si disponible.\n3. NFS, CRP, Bilan hépatique (ASAT/ALAT, Bilirubine totale/libre, PAL, GGT).",
    pdf_keywords: ["Gastrologie", "Urgences", "Médicaments des urgences"]
  },
  {
    id: 7,
    category: "Gastro-entérologie",
    title: "Interprétation du bilan de l’hépatite B/C",
    summary: `**1. Hépatite B (VHB) :**
- **Ag HBs** : Signe la présence du virus (Infection aiguë si récent, chronique si > 6 mois).
- **Ac anti-HBs** : Signe l'immunité (Guérison si Ac anti-HBc positifs, Vaccination si Ac anti-HBc négatifs).
- **Ac anti-HBc** : Signe le contact avec le virus (IgM = infection récente, IgG = contact ancien).
- **ADN VHB (charge virale)** : Évalue la réplication virale en cas d'Ag HBs positif.

**Guide rapide VHB :**
- *Ag HBs (-), Ac anti-HBc (-), Ac anti-HBs (-)* : Non immunisé, à vacciner.
- *Ag HBs (-), Ac anti-HBc (+), Ac anti-HBs (+)* : Hépatite B guérie.
- *Ag HBs (-), Ac anti-HBc (-), Ac anti-HBs (+)* : Immunisé par vaccination.
- *Ag HBs (+), Ac anti-HBc (+), IgM anti-HBc (+)* : Hépatite B aiguë.
- *Ag HBs (+), Ac anti-HBc (+), IgM anti-HBc (-)* : Hépatite B chronique (demander ADN VHB et référer en Gastro).

**2. Hépatite C (VHC) :**
- Dépistage par la recherche des **Ac anti-VHC**.
- Si Ac anti-VHC (+) : Effectuer une recherche d'**ARN VHC** par PCR.
- Si ARN VHC (+) : Infection active. Référer pour traitement par antiviraux d'action directe (AAD - guérison > 95%).
- Si ARN VHC (-) : Infection ancienne guérie ou faux positif.`,
    red_flags: "Signes d'insuffisance hépatocellulaire (TP bas, encéphalopathie, ictère sévère), suspicion de cirrhose décompensée (ascite, hémorragie digestive).",
    ordonnance: "**Bilan initial à prescrire devant une suspicion d'hépatite B ou C :**\n1. Sérologie Hépatite B (Ag HBs, Ac anti-HBs, Ac anti-HBc).\n2. Sérologie Hépatite C (Ac anti-VHC).\n3. Bilan hépatique complet (ASAT, ALAT, PAL, GGT, Bilirubine totale et fractionnée, TP).",
    pdf_keywords: ["Bilans", "Gastrologie", "Infectieux"]
  },
  {
    id: 8,
    category: "Gastro-entérologie",
    title: "Médicaments disponibles : antispasmodiques…",
    summary: `**Classes thérapeutiques courantes en Gastro-entérologie :**

**1. Antispasmodiques :**
- *Musculotropes* : Phloroglucinol (Spasfon) 80mg (cp, lyoc, injectable), Mébéverine (Duspatalin) 200mg (1 gélule 2x/j) pour les colopathies.
- *Anticholinergiques / Mixtes* : Trimébutine (Debridat) 200mg (1 cp 3x/j) - régulateur de motricité. Pinavérium (Dicétel) 50-100mg.

**2. Anti-sécrétoires gastriques :**
- *IPP* : Oméprazole, Esoméprazole, Pantoprazole (20mg ou 40mg). À prendre 30 minutes avant le petit-déjeuner.
- *Anti-H2* : Famotidine (rarement utilisé en première ligne désormais).

**3. Anti-acides et Topiques :**
- *Alginates* (Gaviscon) : Crée une barrière physique au-dessus du bol gastrique.
- *Phosphates d'aluminium* (Phosphalugel), Diosmectite (Smecta). À prendre à distance des autres médicaments (diminuent leur absorption).

**4. Antiémétiques :**
- Dompéridone (Motilium) 10mg, Métoclopramide (Primpéran) 10mg, Métopimazine (Vogalène) 15mg. Attention au risque d'allongement de l'intervalle QT (surtout Dompéridone).`,
    red_flags: "Surdosage en antispasmodiques ou effets indésirables des IPP au long cours (carence Vit B12, ostéoporose, infections digestives à C. difficile).",
    ordonnance: "**Prescription type pour colopathie fonctionnelle douloureuse :**\n1. Duspatalin (Mébéverine) 200mg : 1 gélule matin et soir au moment des repas pendant 15 jours.\n2. Debridat (Trimébutine) 200mg : 1 comprimé 3 fois par jour en cas de spasme ou ballonnements.",
    pdf_keywords: ["Médicaments en Gastrologie", "Médicaments", "Gastrologie"]
  },
  {
    id: 9,
    category: "Gastro-entérologie",
    title: "CAT devant hémorroïdes chez l’adulte et la femme enceinte",
    summary: `**1. Clinique :**
- Hémorroïdes internes (saignement rouge vif après la selle, prolapsus) vs externes (douleur vive si thrombose).
- Diagnostic par inspection anale et toucher rectal (pour éliminer un cancer colorectal devant des rectorragies).

**2. Conduite à tenir :**
- Lutter contre la constipation (règles hygiéno-diététiques, laxatifs osmotiques).
- Éviter la station assise prolongée et les épices.

**3. Traitement chez l'adulte :**
- Crème ou suppositoire anti-hémorroïdaire (contenant des corticoïdes et/ou anesthésique local : Titanoréine lidocaïne, Proctolog) sur une courte durée (< 7 jours).
- Veinotoniques à forte dose en cure courte (Daflon/Diosmine 500mg : 6 cp/j pendant 4 jours, puis 4 cp/j pendant 3 jours).
- En cas de thrombose hémorroïdaire externe : Incision sous anesthésie locale en cabinet (soulagement immédiat) ou AINS + antalgiques + Daflon.

**4. Spécificités de la femme enceinte :**
- Très fréquent (pression utérine + constipation).
- **Pas d'AINS** (surtout après 24 SA).
- Traitement local par topiques sans corticoïdes de préférence ou corticoïdes de façon très brève.
- Veinotoniques (Daflon) autorisés. Laxatifs osmotiques (Macrogol) indispensables pour ramollir les selles.`,
    red_flags: "Saignement abondant provoquant une anémie, thrombose hémorroïdaire interne irréductible et hyperalgique (étranglement hémorroïdaire - urgence).",
    ordonnance: "**Pour crise hémorroïdaire simple (Adulte) :**\n1. Daflon 500mg : 2 cp midi et soir pendant 4 jours, puis 1 cp midi et soir pendant 3 jours.\n2. Titanoréine à la Lidocaïne crème : 1 application locale après la toilette et après chaque selle, max 3x/j pendant 5 jours.\n3. Macrogol 10g : 1 sachet le matin dans un verre d'eau.",
    pdf_keywords: ["Gastrologie", "Gynécologie", "Médicaments et Grossesse"]
  },
  {
    id: 10,
    category: "Pédiatrie",
    title: "CAT devant diarrhée / vomissements chez l’enfant",
    summary: `**1. Évaluation de la Déshydratation (Score de Vesikari ou échelle clinique) :**
- Légère (< 5% perte de poids) : Enfant tonique, muqueuses humides.
- Modérée (5-10% perte de poids) : Pli cutané persistant, yeux cernés, soif vive.
- Sévère (> 10% perte de poids) : Léthargie, hypotonie, extrémités froides, choc hypovolémique.

**2. Conduite à tenir :**
- **Déshydratation légère à modérée** : Réhydratation orale (SRO) exclusive à domicile. Donner par petites quantités (cuillère ou seringue toutes les 5-10 min) pour éviter les vomissements. Ne jamais forcer.
- Alimentation habituelle poursuivie (lait maternel ou artificiel sans dilution). Pas de régime restrictif prolongé.
- **Déshydratation sévère ou refus des SRO/vomissements incoercibles** : Hospitalisation pour réhydratation IV (Sérum Salé Isotonique / SGI).

**3. Traitement médicamenteux :**
- SRO indispensables ++
- Anti-sécrétoire : Racécadotril pédiatrique (Tiorfan nourrisson/enfant en sachets).
- Antiémétique : L'Ondansétron (Zophren) en dose unique orale peut être proposé en cas de vomissements gênant la réhydratation (hors AMM en France pour la GEA mais largement utilisé). Éviter le Métoclopramide ou Dompéridone (risques neurologiques).`,
    red_flags: "Léthargie, somnolence, pli cutané persistant, absence d'urines depuis > 6 heures, perte de poids > 10%, vomissements bilieux ou fécaloïdes, fièvre élevée mal tolérée.",
    ordonnance: "1. Adiaril (SRO) : 1 sachet à diluer dans 200 ml d'eau peu minéralisée. Proposer à volonté les premières heures par petites gorgées fréquemment répétées.\n2. Tiorfan Nourrisson (10mg) ou Enfant (30mg) selon le poids : 1 sachet 3 fois par jour à mélanger à l'alimentation ou l'eau.\n3. Paracétamol sirop (pédiatrique) : 1 dose-poids toutes les 6 heures en cas de fièvre > 38.5°C.",
    pdf_keywords: ["Pédiatrie", "Médicaments en Pédiatrie", "Urgences"]
  },
  {
    id: 11,
    category: "Pédiatrie",
    title: "CAT devant hépatite A chez l’enfant",
    summary: `**1. Diagnostic :**
- Transmission féco-orale (eau/aliments contaminés). Très souvent asymptomatique ou bénigne chez le jeune enfant.
- Clinique : Syndrome pseudo-grippal, troubles digestifs (nausées, anorexie), puis phase ictérique (urines foncées, selles décolorées, ictère conjonctival).
- Biologie : Cytolyse hépatique majeure (ALAT/ASAT > 10 à 50 fois la normale). Confirmé par les IgM anti-VHA (+).

**2. Conduite à tenir :**
- Maladie bénigne à résolution spontanée (guérison en 2-4 semaines). Pas de passage à la chronicité.
- Repos, éviction scolaire (10 jours après le début de l'ictère).
- Éviter les médicaments hépatotoxiques (limiter le Paracétamol au strict minimum indispensable).
- Proposer la vaccination des sujets contact de l'entourage dans les 14 jours.`,
    red_flags: "Signes d'hépatite fulminante (extrêmement rare mais grave) : Somnolence, troubles du comportement (encéphalopathie hépatique), effondrement du taux de prothrombine (TP < 50%).",
    ordonnance: "1. Repos à domicile.\n2. Mesures d'hygiène stricte des mains pour l'entourage.\n3. Éviter tout médicament inutile.\n4. Paracétamol : Uniquement en cas de fièvre mal tolérée à dose minimale (10 mg/kg par prise, max 4x/j, à espacer).",
    pdf_keywords: ["Pédiatrie", "Infectieux", "Bilans"]
  },
  {
    id: 12,
    category: "Neurologie",
    title: "CAT devant migraine",
    summary: `**1. Diagnostic :**
- Céphalée récurrente, paroxystique, durant 4 à 72 heures.
- Au moins 2 caractères parmi : unilatérale, pulsatile, intensité modérée à sévère, aggravée par l'effort physique.
- Au moins 1 signe associé : nausées/vomissements, photophobie/phonophobie.
- Recherche de prodromes ou d'aura (visuelle, sensitive ou dysphasique précédant la douleur de moins d'1 heure).

**2. Prise en charge de la crise :**
- Traitement précoce, dès le début de la crise.
- Première ligne : AINS (Ibuprofène 400mg, Kétoprofène 150mg) ou Aspirine.
- Deuxième ligne (ou si échec) : Triptans (Sumatriptan 50mg, Zolmitriptan 2.5mg). Possibilité d'associer un AINS + Triptan d'emblée si la crise est sévère.
- Éviter les opioïdes (risque de céphalées par abus médicamenteux).

**3. Traitement de fond :**
- Indiqué si crises fréquentes (> 3-4 par mois) ou très invalidantes.
- Molécules : Bêtabloquants (Propranolol), Amitriptyline (Laroxyl) à faible dose, Topiramate.`,
    red_flags: "Céphalée brutale en \"coup de tonnerre\" (suspicion d'hémorragie sous-arachnoïdienne - urgence vitale), céphalée progressive d'apparition récente après 50 ans, fièvre ou raideur de nuque associée, anomalie à l'examen neurologique.",
    ordonnance: "**Traitement de crise :**\n1. Kétoprofène (Bi-Profénid) 150mg : 1 comprimé à prendre dès le début de la crise migraineuse. À renouveler après 2 heures si nécessaire (max 2/j).\n2. Zolmitriptan 2.5mg : 1 comprimé en cas d'échec de l'AINS après 2 heures (ne pas dépasser 2 cp/24h).\n3. Vogalène 15mg : 1 gélule si nausées associées.",
    pdf_keywords: ["Neurologie", "Médicaments"]
  },
  {
    id: 13,
    category: "Rhumatologie",
    title: "CAT devant lombosciatalgie",
    summary: `**1. Diagnostic :**
- Douleur lombaire irradiant le long du trajet du nerf sciatique (L4, L5 ou S1), d'origine disco-radiculaire le plus souvent.
- Évaluer le retentissement fonctionnel et le caractère mécanique (calmé par le repos) vs inflammatoire (réveils nocturnes).
- Examen physique : Signe de Lasègue, recherche de déficits moteurs (marche sur les talons pour L5, sur les pointes pour S1).

**2. Prise en charge (Symptomatique en phase aiguë) :**
- Maintenir une activité physique minimale compatible avec la douleur. Le repos au lit prolongé est contre-indiqué.
- Traitement antalgique : Paliers 1 (Paracétamol), AINS (Ibuprofène, Kétoprofène) en cure courte (5-7 jours), +/- dérivés morphiniques faibles (Codéine, Tramadol).
- Myorelaxants (Thiocolchicoside : attention aux restrictions d'AMM).
- Imagerie (Radiographie, IRM) non indiquée en première intention si sciatique commune < 4-6 semaines sans signe de gravité.`,
    red_flags: "Sciatique paralysante (déficit moteur < 3/5), syndrome de la queue de cheval (troubles sphinctériens : rétention urinaire, incontinence, anesthésie en selle - URGENCE CHIRURGICALE), suspicion de cause tumorale ou infectieuse (fièvre, perte de poids, douleur inflammatoire continue).",
    ordonnance: "1. Bi-Profénid (Kétoprofène) 150mg : 1 comprimé matin et soir pendant le repas pendant 7 jours.\n2. Esoméprazole 20mg : 1 gélule par jour (si terrain à risque digestif pour l'AINS).\n3. Tramadol / Paracétamol (Ixprim) : 1 à 2 comprimés toutes les 6 à 8 heures en cas de douleur modérée à intense.",
    pdf_keywords: ["Rhumatologie", "Médicaments", "Urgences"]
  },
  {
    id: 14,
    category: "Hématologie",
    title: "CAT devant anémie ferriprive chez l’enfant et l’adulte",
    summary: `**1. Diagnostic biologique :**
- Anémie : Hb < 13 g/dL chez l'homme, < 12 g/dL chez la femme (et < 11 g/dL chez la femme enceinte et l'enfant).
- Microcytaire (VGM < 80 fl) et hypochrome (CCMH < 32%).
- Bilan martial : **Ferritine basse** (< 30 ng/mL chez l'adulte, < 12-15 ng/mL chez l'enfant) - c'est le marqueur le plus fiable. Le fer sérique n'est pas utile en première intention.

**2. Enquête étiologique (Indispensable avant tout traitement) :**
- Chez la femme en période d'activité génitale : Pertes gynécologiques (ménorragies) ++.
- Chez l'homme ou la femme ménopausée : Pertes digestives ++ (saignement occulte : ulcère, polype, cancer colorectal). Prévoir une fibroscopie digestive haute et coloscopie.
- Chez l'enfant : Carence d'apport (excès de lait de vache au détriment d'une alimentation diversifiée).

**3. Traitement :**
- Supplémentation en Fer oral (Fer ferreux : Fumafer, Tardyferon) : 100 à 200 mg de fer métal/jour chez l'adulte, 3 à 5 mg/kg/jour chez l'enfant.
- À prendre de préférence le matin à jeun, associé à de la vitamine C (jus d'orange) pour améliorer l'absorption. Éviter le thé/café.
- Durée : 3 à 6 mois pour corriger l'anémie et reconstituer les réserves (contrôle de la ferritine 3 mois après normalisation de l'hémoglobine).`,
    red_flags: "Mauvaise tolérance clinique (dyspnée d'effort ou de repos, angor, tachycardie importante), anémie sévère (Hb < 7-8 g/dL chez le sujet âgé ou coronarien - nécessite une transfusion).",
    ordonnance: "**Pour l'adulte :**\n1. Tardyferon 80mg (Fer) : 1 à 2 comprimés par jour à prendre avec un grand verre d'eau le matin avant le repas pendant 3 mois.\n\n**Pour l'enfant :**\n1. Inofer sirop ou Fumafer poudre : Dose correspondant à 3 mg/kg/j de fer métal en 2 prises par jour.",
    pdf_keywords: ["Hématologie", "Trt Anémie_", "Bilans", "Pédiatrie"]
  },
  {
    id: 15,
    category: "Hématologie",
    title: "CAT devant anémie macrocytaire",
    summary: `**1. Diagnostic biologique :**
- Hémoglobine basse associée à un VGM > 100 fl.
- Éliminer d'emblée une fausse macrocytose (réticulocytose élevée témoignant d'une régénération après hémorragie ou hémolyse : faire un taux de réticulocytes).

**2. Démarche étiologique :**
- Taux de réticulocytes :
  - Régénérative (Réticulocytes > 150 000/mm³) : Cause périphérique (hémorragie aiguë, hémolyse).
  - Arégénérative (Réticulocytes < 120 000/mm³) : Cause centrale.
- Causes principales d'anémie macrocytaire centrale :
  - **Carence en Vitamine B12** (Maladie de Biermer, malabsorption, régime végétalien strict).
  - **Carence en Folates / Vitamine B9** (Dénutrition, éthylisme, grossesse).
  - **Éthylisme chronique** (sans carence associée parfois).
  - **Hypothyroïdie**, insuffisance rénale, syndromes myélodysplasiques.

**3. Traitement :**
- Carence en B12 : Cyanocobalamine ou Hydroxocobalamine (IM ou per os à forte dose). Si Biermer : traitement par injections IM à vie (1000 µg/j pendant 1 semaine, puis/semaine pendant 1 mois, puis/mois).
- Carence en B9 : Acide folique (Foldine) 5mg/jour par voie orale pendant 1 à 2 mois.`,
    red_flags: "Signes neurologiques de la carence en Vit B12 (syndrome cordonal postérieur : paresthésies, troubles de la sensibilité profonde, ataxie - urgence thérapeutique pour éviter des séquelles irréversibles).",
    ordonnance: "**Devant une carence avérée en B12 (Maladie de Biermer) :**\n1. Vitamine B12 (Hydroxocobalamine) 1000 µg / 2ml injectable : 1 ampoule en IM tous les deux jours pendant 10 jours (phase d'attaque), puis 1 ampoule par mois à vie (phase d'entretien).\n\n**Devant une carence en B9 :**\n1. Acide Folique (Foldine) 5mg : 1 comprimé par jour pendant 2 mois.",
    pdf_keywords: ["Hématologie", "Trt Anémie_", "Bilans"]
  },
  {
    id: 16,
    category: "ORL",
    title: "CAT devant angines chez l’adulte et l’enfant",
    summary: `**1. Diagnostic et orientation étiologique :**
- Angine érythémateuse (rouge) ou érythémato-pultacée (blanche).
- Objectif majeur : Distinguer l'origine virale (80-90% chez l'adulte, 60-75% chez l'enfant) de l'origine bactérienne à Streptocoque du groupe A (SGA) pour éviter le RAA (Rhumatisme Articulaire Aigu).
- **Score de Mac Isaac** (ou score de Centor modifié) chez l'adulte et l'enfant de > 3 ans :
  - Fièvre > 38°C (+1)
  - Absence de toux (+1)
  - Adénopathies cervicales antérieures douloureuses (+1)
  - Augmentation/exsudat amygdalien (+1)
  - Âge : 3-14 ans (+1), 15-44 ans (0), >= 45 ans (-1).
- Si Score >= 2 (enfant) ou >= 3 (adulte) : Réaliser un **TROD (Test Rapide d'Orientation Diagnostic) SGA**.

**2. Traitement :**
- TROD (-) ou score bas : Traitement symptomatique uniquement (Antalgiques). Pas d'antibiotiques !
- TROD (+) : Antibiothérapie par Amoxicilline :
  - Adulte : 2g/jour en 2 prises pendant 6 jours.
  - Enfant : 50 mg/kg/jour en 2 prises pendant 6 jours.
  - En cas d'allergie vraie aux pénicillines (sans contre-indication aux céphalosporines) : Céfuroxime-axétil pendant 4 jours. Si allergie aux bêta-lactamines : Macrolides (Azithromycine 3 jours ou Clarithromycine 5 jours).`,
    red_flags: "Difficulté à avaler la salive (sialorrhée), modification de la voix (\"voix de patate chaude\"), trismus (difficulté à ouvrir la bouche), dyspnée (suspicion de phlegmon amygdalien ou d'épiglottite - urgence chirurgicale).",
    ordonnance: "**Si TROD SGA Positif (Adulte) :**\n1. Amoxicilline 1g : 1 comprimé matin et soir pendant le repas pendant 6 jours.\n2. Paracétamol 1g : 1 comprimé toutes les 6 heures en cas de douleur ou fièvre (max 4 cp/j).\n\n**Si TROD SGA Négatif ou non indiqué :**\n1. Paracétamol 1g : 1 cp en cas de besoin.",
    pdf_keywords: ["ORL", "CAT ORL", "Infectieux", "Médicaments en Pédiatrie"]
  },
  {
    id: 17,
    category: "ORL",
    title: "Angines révélant des pathologies dysimmunitaires",
    summary: `**1. Contexte clinique :**
- Une angine atypique, trainante, récidivante ou ulcéro-nécrotique peut être le premier signe d'une pathologie générale grave (dysimmunitaire ou hématologique).

**2. Diagnostics à évoquer :**
- **Mononucléose Infectieuse (MNI)** : Angine pseudomembraneuse, asthénie majeure, poly-adénopathies, splénomégalie. Confirmée par le MNI-Test et la présence de lymphocytes activés (syndrome mononucléosique) à la NFS.
- **Neutropénie / Agranulocytose** (médicamenteuse ou hémopathie) : Angine ulcéro-nécrotique très douloureuse avec fièvre élevée et altération de l'état général. NFS urgente indispensable !
- **Hémopathies malignes** (Leucémie Aiguë) : Angine résistante aux antibiotiques associée à un syndrome tumoral (adénopathies, splénomégalie) et des signes d'insuffisance médullaire (anémie, thrombopénie, purpura).
- **Syndrome de PFAPA** (fièvre périodique, stomatite aphteuse, pharyngite, adénopathies) chez l'enfant.

**3. Conduite à tenir :**
- Devant toute angine traînante ou atypique : Prescrire une NFS (Numération Formule Sanguine) en urgence.`,
    red_flags: "Agranulocytose (NFS montrant des PNN < 500/mm³) - Risque de sepsis grave, isolement protecteur et antibiothérapie IV urgente en milieu hospitalier.",
    ordonnance: "**Bilan d'orientation en urgence :**\n1. NFS (Numération Formule Sanguine) avec formule complète.\n2. CRP (Protéine C-Réactive).\n3. Sérologie MNI (ou test d'Eppstein-Barr) si suspicion clinique.",
    pdf_keywords: ["ORL", "Hématologie", "Bilans"]
  },
  {
    id: 18,
    category: "ORL",
    title: "CAT devant pharyngite",
    summary: `**1. Diagnostic :**
- Inflammation diffuse de la muqueuse pharyngée, le plus souvent d'origine virale (Rhinovirus, Coronavirus, Adenovirus).
- Se distingue de l'angine par l'absence d'amygdalite prédominante et la présence fréquente d'un rhinorrhée, d'une toux et d'un enrouement associés.

**2. Conduite à tenir :**
- Traitement purement symptomatique. L'antibiothérapie est inutile et abusive dans la pharyngite aiguë simple.
- Hydratation, lavages de nez au sérum salé si rhinorrhée associée.

**3. Pharyngite chronique :**
- Rechercher des facteurs favorisants : Tabagisme, alcoolisme, reflux gastro-œsophagien (RGO), exposition professionnelle à des irritants, respiration buccale par obstruction nasale.`,
    red_flags: "Dyspnée inspiratoire, impossibilité d'avaler la salive, altération rapide de l'état général, persistance des symptômes au-delà de 10 jours sans amélioration.",
    ordonnance: "1. Paracétamol 1g : 1 comprimé à renouveler si nécessaire toutes les 6 heures (max 4/jour) en cas de douleur de gorge.\n2. Lavage nasal au sérum physiologique ou spray d'eau de mer micro-diffusé : 3 à 4 fois par jour en cas de congestion nasale.\n3. Collutoire ou pastilles adoucissantes (sans antibiotique ni anesthésique local puissant de longue durée).",
    pdf_keywords: ["ORL", "CAT ORL", "Infectieux"]
  },
  {
    id: 19,
    category: "Neurologie",
    title: "CAT devant paralysie faciale périphérique",
    summary: `**1. Diagnostic positif :**
- Atteinte du nerf facial (VII) touchant le haut et le bas du visage (effacement des rides du front, impossibilité de fermer l'œil avec signe de Charles Bell - globe oculaire dévié en haut et en dehors lors de la tentative de fermeture de la paupière, déviation de la bouche du côté sain).

**2. Démarche étiologique :**
- **Paralysie faciale a frigore (de Bell)** : Cause la plus fréquente (probablement virale, réactivation HSV-1). Diagnostic d'exclusion.
- Rechercher : Zone (zona auriculaire avec vésicules dans la zone de Ramsay-Hunt), maladie de Lyme (piqûre de tique, érythème migrant), otite moyenne aiguë ou chronique.

**3. Traitement (Paralysie de Bell) :**
- **Corticothérapie précoce** (idéalement dans les 72h) : Prednisolone 1 mg/kg/jour pendant 7 à 10 jours. Elle accélère et améliore la récupération.
- **Protection oculaire indispensable** si fermeture incomplète de l'œil (risque de kératite d'exposition) : Larmes artificielles la journée, pansement occlusif et pommade ophtalmique la nuit.
- +/- Antiviraux (Valacyclovir) uniquement en cas d'atteinte sévère ou suspicion de zona.`,
    red_flags: "Atteinte bilatérale, présence d'autres signes neurologiques (déficit moteur d'un membre, hypoesthésie, atteinte d'autres nerfs crâniens), apparition progressive sur plusieurs semaines (suggère une tumeur nerveuse).",
    ordonnance: "1. Prednisolone (Solupred) 20mg : X comprimés (soit 1 mg/kg) en 1 prise le matin pendant le petit-déjeuner pendant 10 jours.\n2. Dacudoses ou larmes artificielles : 1 goutte dans l'œil atteint 4 à 6 fois par jour.\n3. Vitamine A ophtalmique pommade : 1 application dans l'œil atteint le soir au coucher.\n4. Pansement occlusif (type Opticlude) pour fermer l'œil la nuit.",
    pdf_keywords: ["Neurologie", "Médicaments", "Ophtalmologie"]
  },
  {
    id: 20,
    category: "ORL",
    title: "CAT devant bouchon de cérumen",
    summary: `**1. Clinique :**
- Hypoacousie de survenue brutale (souvent après douche ou baignade), sensation d'oreille bouchée, autophonie, parfois acouphènes ou prurit.
- Otoscopie : Masse jaunâtre, brunâtre ou noirâtre obstruant totalement le conduit auditif externe.

**2. Conduite à tenir :**
- Contre-indications absolues à l'irrigation d'oreille : **Perforation tympanique** (antécédent d'otite récurrente, chirurgie de l'oreille, traumatisme), otite externe en cours.
- Si pas de contre-indication : Instillation d'un agent céruménolytique (ou eau oxygénée diluée, huile d'amande douce) pour ramollir le bouchon pendant 2-3 jours.
- Extraction par irrigation d'eau tiède (à 37°C pour éviter les vertiges) à l'aide d'une seringue d'oreille ou d'un poire, en dirigeant le jet vers la paroi postéro-supérieure du conduit auditif (jamais directement vers le tympan).`,
    red_flags: "Douleur intense lors de l'irrigation, vertiges rotatoires immédiats, saignement ou issue de pus (interrompre immédiatement le geste, suspicion de perforation tympanique provoquée ou préexistante).",
    ordonnance: "1. Cérulyse (xylène) solution auriculaire : Instiller 10 à 15 gouttes dans l'oreille atteinte, 2 fois par jour pendant les 3 jours précédant l'extraction au cabinet médical. Garder la tête penchée pendant 10 minutes.",
    pdf_keywords: ["ORL", "CAT ORL"]
  },
  {
    id: 21,
    category: "ORL",
    title: "CAT devant épistaxis",
    summary: `**1. Évaluation de la gravité :**
- Abondance du saignement, retentissement hémodynamique (pouls, TA, pâleur), antécédents médicaux (HTA, prise d'anticoagulants, antiagrégants, maladie de Rendu-Osler).

**2. Prise en charge immédiate (Épistaxis bénigne) :**
- Rassurer le patient. Assis, tête penchée en **avant** (ne pas pencher la tête en arrière pour éviter l'inhalation du sang et nausées).
- Moucher doucement pour évacuer les caillots.
- Compression digitale bilatérale ou unilatérale de l'aile du nez contre la cloison nasale pendant 10 minutes montre en main (souvent suffisant).

**3. Si persistance :**
- Tamponnement local : Mèche hémostatique (Coalgan, alginate de calcium) ou tampon expansible (Merocel) lubrifié, introduit horizontalement le long du plancher des fosses nasales.
- Si HTA associée : Contrôler la tension artérielle (le saignement maintient l'HTA, mais l'HTA aggrave le saignement). Traiter la douleur et l'anxiété.`,
    red_flags: "Saignement bilatéral ou postérieur incoercible, signes de choc hypovolémique (tachycardie, hypotension), patient sous anticoagulants avec INR instable, épistaxis récidivante unilatérale chez le sujet jeune (rechercher un fibrome nasopharyngien) ou sujet âgé (tumeur sinusienne).",
    ordonnance: "**Pour la trousse d'urgence ou soins locaux à domicile :**\n1. Coalgan mèches hémostatiques : 1 boîte. Introduire une mèche dans la fosse nasale en cas de reprise du saignement, laisser en place 24 heures.\n2. HEC pommade nasale : 1 application 2 fois par jour dans les narines pendant 5 jours après l'arrêt du saignement pour favoriser la cicatrisation.",
    pdf_keywords: ["ORL", "CAT ORL", "Urgences"]
  },
  {
    id: 22,
    category: "ORL",
    title: "CAT devant otite moyenne aiguë chez l’enfant",
    summary: `**1. Diagnostic positif :**
- Otalgie (pleurs inexpliqués, l'enfant touche son oreille) + Fièvre.
- Otoscopie indispensable : Tympan congestif (insuffisant pour traiter par antibiotiques), ou **tympan bombé et opaque** (signe l'OMA purulente), ou otorrhée (perforation tympanique).

**2. Indication de l'antibiothérapie :**
- **Nourrisson de < 3 mois** : Hospitalisation systématique.
- **Nourrisson de < 2 ans** : Antibiothérapie systématique pour toute OMA congestive ou purulente bilatérale ou unilatérale.
- **Enfant de >= 2 ans** :
  - Si symptômes frustes (fièvre modérée, otalgie tolérée) : Abstention antibiotique, traitement antalgique simple, réévaluation à 48-72h.
  - Si OMA purulente sévère (fièvre élevée, otalgie intense, otorrhée) : Antibiothérapie.

**3. Choix de l'antibiotique :**
- Première intention : **Amoxicilline** 80 à 90 mg/kg/jour en 2 ou 3 prises pendant 8 à 10 jours (< 2 ans) ou 5 jours (>= 2 ans).
- Si syndrome otite-conjonctivite (suggérant H. influenzae sécréteur de bêta-lactamase) : **Amoxicilline + Acide clavulanique** (Augmentin) à dose de 80 mg/kg/j d'amoxicilline.`,
    red_flags: "Rétro-auriculaire inflammatoire et décollant le pavillon de l'oreille (mastoïdite - urgence chirurgicale absolue), raideur de nuque, léthargie, paralysie faciale.",
    ordonnance: "**Pour un enfant de 18 mois (12 kg) avec OMA purulente :**\n1. Amoxicilline sirop 500mg/5ml : 1 dose-poids (12kg) 3 fois par jour pendant 8 jours.\n2. Paracétamol sirop : 1 dose-poids toutes les 6 heures en cas de douleur ou de fièvre.\n\n*Pas de gouttes auriculaires si tympan perforé ou non vu !*",
    pdf_keywords: ["ORL", "Pédiatrie", "Médicaments en Pédiatrie"]
  },
  {
    id: 23,
    category: "ORL",
    title: "CAT devant laryngite chez l’enfant",
    summary: `**1. Diagnostic :**
- Dyspnée laryngée : Bradypnée inspiratoire avec tirage sous-glottique ou intercostal, stridor ou cornage (bruit inspiratoire).
- Voix éteinte ou rauque, toux aboyante (voix de phoque). Fièvre modérée d'origine virale ++ (Parainfluenza).

**2. Évaluation de la gravité (Score de Westley) :**
- Gravité si tirage majeur, cyanose, troubles du comportement (agitation par hypoxie, puis épuisement/somnolence).

**3. Conduite à tenir (Laryngite aiguë sous-glottique banale) :**
- Ne jamais examiner la gorge de l'enfant avec un abaisse-langue si suspicion d'épiglottite (risque de spasme laryngé mortel). Laisser l'enfant dans les bras de ses parents, au calme.
- **Corticothérapie orale** en dose unique (très efficace, diminue l'œdème laryngé) : Dexaméthasone (0.15 à 0.6 mg/kg) ou Bétaméthasone (Célestène : 0.2 mg/kg soit 10 gouttes/kg).
- Si détresse respiratoire modérée à sévère : Nébulisation d'Adrénaline (0.5 mg/kg, max 5 mg) + Dexaméthasone IV ou IM + oxygénothérapie + transfert par SAMU.`,
    red_flags: "Suspicion d'épiglottite (fièvre très élevée, enfant assis penché en avant, bave car incapable d'avaler sa salive, absence de toux aboyante - URGENCE EXTRÊME, ne pas coucher l'enfant, appeler le SAMU).",
    ordonnance: "1. Célestène (Bétaméthasone) 0.05% solution buvable en gouttes : Donner une dose unique de 10 gouttes par kg de poids corporel le matin (soit 0.2 mg/kg).\n2. Paracétamol pédiatrique : 1 dose-poids toutes les 6 heures en cas de fièvre.",
    pdf_keywords: ["ORL", "Pédiatrie", "Médicaments en Pédiatrie", "Urgences"]
  },
  {
    id: 24,
    category: "Pneumologie",
    title: "CAT devant état grippal",
    summary: `**1. Diagnostic :**
- Début brutal (vire-volte), fièvre élevée (> 39°C), frissons, céphalées, myalgies (courbatures), arthralgies, suivis de signes respiratoires (toux sèche, rhinorrhée).

**2. Prise en charge :**
- Repos strict au lit, hydratation abondante.
- Traitement symptomatique : Antalgiques et antipyretiques (Paracétamol ++). Éviter les AINS chez l'enfant et l'adulte en cas de suspicion de complication pulmonaire (risque de pneumopathie compliquée).
- Antiviraux (Oseltamivir - Tamiflu) : Indiqués uniquement chez les patients à risque de complications (sujets âgés, insuffisants cardiaques/respiratoires, immunodéprimés) s'ils sont prescrits dans les 48 heures suivant le début des symptômes.
- Pas d'antibiotiques en première intention !`,
    red_flags: "Dyspnée, polypnée (fréquence respiratoire > 20/min chez l'adulte), désaturation (SpO2 < 95%), confusion mentale, persistance ou reprise de la fièvre après une rémission transitoire (suggérant une surinfection bactérienne).",
    ordonnance: "1. Paracétamol 1g : 1 comprimé toutes les 6 à 8 heures en cas de fièvre ou de douleurs musculaires (max 4g/j).\n2. Lavage de nez au sérum salé si nez bouché.\n3. Si toux sèche irritante : Dextrométhorphane sirop (uniquement chez l'adulte, max 5 jours).",
    pdf_keywords: ["Pneumologie", "Infectieux", "Médicaments"]
  },
  {
    id: 25,
    category: "Pneumologie",
    title: "CAT devant bronchite",
    summary: `**1. Diagnostic :**
- Inflammation des bronches d'origine virale dans > 90% des cas.
- Clinique : Toux initialement sèche puis productive (expectorations claires ou purulentes - la purulence ne signifie pas une infection bactérienne !), brûlure rétrosternale à la toux, râles bronchiques à l'auscultation. Fièvre modérée ou absente.

**2. Prise en charge :**
- **Pas d'antibiotiques** chez l'adulte sain (recommandation forte pour lutter contre l'antibiorésistance).
- Traitement symptomatique : Hydratation, antitussifs uniquement si toux sèche invalidante et nocturne. Bronchodilatateurs inhalés (Salbutamol) uniquement s'il existe des sibilants à l'auscultation (bronchospasme).
- Les fluidifiants bronchiques et l'expectoration dirigée n'ont pas fait preuve d'efficacité majeure.`,
    red_flags: "Foyer de crépitants localisé à l'auscultation (pneumonie), polypnée, cyanose, confusion chez le sujet âgé, insuffisance respiratoire chronique sous-jacente (BPCO nécessitant une antibiothérapie si exacerbation).",
    ordonnance: "1. Paracétamol 1g : 1 comprimé en cas de fièvre ou de douleur rétrosternale, max 3 à 4 par jour.\n2. Si toux sèche nocturne gênante : Toplexil (Oxomémazine) sirop : 1 à 2 cuillères à soupe le soir au coucher (max 3 jours, attention à la somnolence).\n3. Lavage des fosses nasales.",
    pdf_keywords: ["Pneumologie", "Infectieux"]
  },
  {
    id: 26,
    category: "Pneumologie",
    title: "Différence entre bronchite et pneumopathie communautaire",
    summary: `**Tableau comparatif clinique et paraclinique :**

| Critère | Bronchite Aiguë | Pneumopathie Aiguë Communautaire (PAC) |
| :--- | :--- | :--- |
| **Auscultation** | Normale ou râles bronchiques diffus (ronchus) | Foyer localisé de râles crépitants +/- syndrome de condensation (souffle tubaire, augmentation des vibrations vocales) |
| **Fièvre** | Modérée (< 38.5°C) ou absente | Élevée (> 38.5 - 39°C), frissons, début brutal |
| **Signes Généraux** | Conservés (fatigue modérée) | Altérés (asthénie marquée, faciès toxique) |
| **Signes Fonctionnels** | Toux sèche puis productive | Toux productive, douleur thoracique unilatérale de type pleural (point de côté), dyspnée |
| **Radiographie Thorax** | Normale (arbre bronchique non visible) | Foyer d'alvéolite (opacité alvéolaire systématisée ou infiltrats interstitiels) |
| **Biologie** | CRP normale ou peu élevée | CRP très élevée (> 50-100 mg/L), hyperleucocytose à PNN |

**Conduite à tenir :**
- Bronchite : Symptomatique (pas d'antibiotique).
- PAC : Antibiothérapie empirique systématique (Amoxicilline 3g/jour en 3 prises pendant 7 jours en première intention chez l'adulte sain).`,
    red_flags: "Signes de gravité de la PAC (Score CRB-65 >= 1 : Confusion, FR >= 30/min, PAS < 90 ou PAD <= 60 mmHg, Âge >= 65 ans) -> Nécessite une hospitalisation.",
    ordonnance: "**Si diagnostic de PAC simple chez l'adulte sain :**\n1. Amoxicilline 1g : 1 comprimé 3 fois par jour pendant 7 jours.\n2. Paracétamol 1g : 1 cp toutes les 6h en cas de fièvre.\n3. Radiographie pulmonaire de contrôle à réaliser à 6 semaines en cas de tabagisme ou > 50 ans.",
    pdf_keywords: ["Pneumologie", "Urgences", "Radio thoracique_"]
  },
  {
    id: 27,
    category: "Pédiatrie",
    title: "CAT devant bronchiolite chez le nourrisson",
    summary: `**1. Diagnostic :**
- Premier épisode de dyspnée expiratoire avec sibilants chez un nourrisson de < 12 mois, dans un contexte d'infection virale haute (rhinopharyngite).
- Clinique : Polypnée, tirage, râles sibilants et sous-crépitants diffus, distension thoracique.

**2. Évaluation de la gravité (Critères HAS) :**
- **Légère** : Alimentation conservée (> 75% des rations), FR normale pour l'âge, pas de signe de lutte marqué, SpO2 >= 92%.
- **Modérée** : Alimentation diminuée (50-75% des rations), tirage modéré, FR élevée.
- **Sévère** : Alimentation effondrée (< 50% des rations), apnées, tirage sévère (battement des ailes du nez, entonnoir xyphoïdien), geignement, SpO2 < 92%, épuisement.

**3. Conduite à tenir :**
- **Forme légère** : Ambulatoire. Mesure clé : **Désobstruction Rhinopharyngée (DRP)** systématique avant les repas et le coucher. Fractionnement des repas. Couchage incliné à 30°. Surveillance parentale étroite.
- **Forme modérée à sévère** : Hospitalisation pour oxygénothérapie (lunettes ou haut débit), hydratation/nutrition par sonde nasogastrique ou IV.
- **Médicaments** : Les bronchodilatateurs (Salbutamol), corticoïdes oraux, et la kinésithérapie respiratoire ne sont plus recommandés en première intention dans le premier épisode simple.`,
    red_flags: "Âge < 6 semaines (risque majeur d'apnée), prématurité < 36 SA de moins de 3 mois, cardiopathie ou pathologie neuromusculaire sous-jacente, prise alimentaire < 50%, épuisement respiratoire, SpO2 < 92%.",
    ordonnance: "1. Sérum physiologique en dosettes : 1 boîte. Réaliser une désobstruction rhinopharyngée (DRP) minutieuse avant chaque repas et au coucher (6 à 8 fois par jour).\n2. Paracétamol sirop pédiatrique : 1 dose-poids toutes les 6 heures en cas de fièvre > 38.5°C et d'inconfort.\n3. Fiche de surveillance parentale expliquant les signes d'alerte pour consulter aux urgences.",
    pdf_keywords: ["Pédiatrie", "Médicaments en Pédiatrie", "Pneumologie"]
  },
  {
    id: 28,
    category: "Pneumologie",
    title: "CAT devant crise d’asthme chez l’adulte et l’enfant",
    summary: `**1. Évaluation clinique de la crise (Asthme Aigu Grave - AAG) :**
- Signes de gravité : Difficulté à parler (phrases courtes ou mots isolés), agitation ou somnolence (hypoxie), FR > 30/min, FC > 120/min (adulte), tirage majeur, DEP (Débit Expiratoire de Pointe) < 50% de la valeur théorique ou personnelle.
- Signe d'extrême urgence : "Silence auscultatoire" (absence de sibilants par débit d'air trop faible), cyanose, sueurs, troubles de conscience.

**2. Prise en charge en urgence (Crise modérée en ambulatoire) :**
- Bêta-2 mimétiques d'action rapide inhalés : Salbutamol (Ventoline).
  - À l'aide d'une chambre d'inhalation (surtout chez l'enfant) : 2 à 4 bouffées (nourrisson) ou 4 à 10 bouffées (grand enfant/adulte) à renouveler toutes les 20 minutes pendant la première heure.
- Corticothérapie orale systématique (sauf si crise très légère résolutive immédiatement) : Prednisolone 1 à 2 mg/kg chez l'enfant (max 50-60mg), 0.5 à 1 mg/kg chez l'adulte pendant 5 à 7 jours.

**3. Si crise sévère (AAG) :**
- Appeler le SAMU.
- Nébulisation continue de Salbutamol (5 mg) + Ipratropium (Atrovent) sous O2 (6L/min).
- Corticoïde IV (Méthylprednisolone).`,
    red_flags: "Incapacité de parler, cyanose, silence auscultatoire, DEP imprenable, agitation/troubles de conscience (nécessite transfert en réanimation).",
    ordonnance: "**Pour l'adulte en crise modérée :**\n1. Ventoline (Salbutamol) 100 µg/dose inhalateur : 2 à 4 bouffées en cas de crise ou de gêne respiratoire, à renouveler si besoin (max 10-15 bouffées/jour).\n2. Solupred (Prednisolone) 20mg : 3 comprimés (soit 60mg) en 1 prise le matin pendant 5 jours.\n3. Référer pour consultation de pneumologie pour équilibrer le traitement de fond.",
    pdf_keywords: ["Pneumologie", "Médicaments des urgences_", "Pédiatrie"]
  },
  {
    id: 29,
    category: "Pneumologie",
    title: "CAT devant hémoptysie",
    summary: `**1. Diagnostic positif et différentiel :**
- Hémoptysie : Rejet de sang rouge vif, aéré, spumeux, lors d'un effort de toux.
- Diagnostic différentiel : Hématémèse (sang noir ou acide rejeté lors d'un effort de vomissement), épistaxis postérieure inhalée puis rejetée par la bouche.

**2. Évaluation de la gravité (Prioritaire) :**
- La gravité dépend de l'abondance (abondante si > 1/2 verre soit ~100ml en une fois ou > 200ml/24h) et du retentissement respiratoire (dyspnée, désaturation) plutôt que de la spoliation sanguine. L'asphyxie est le risque mortel principal.

**3. Démarche diagnostique et étiologique :**
- Causes principales : Cancer bronchique (tabac !), Tuberculose pulmonaire (contexte endémique en Algérie), Dilatation des bronches (DDB), Embolie pulmonaire, Infection pulmonaire aiguë.
- Prescrire systématiquement : Radiographie du thorax, TDM thoracique (Scanner injecté - examen clé), NFS, bilan de crase (TP/TCA).

**4. Conduite à tenir :**
- Repos au lit, décubitus latéral du côté qui saigne (pour protéger le poumon sain d'une inondation alvéolaire).
- Mise à jeun, surveillance de la FC, TA, SpO2.
- Hospitalisation systématique en cas d'hémoptysie de moyenne ou grande abondance ou si cause sous-jacente grave suspectée.`,
    red_flags: "Volume de sang > 100 mL, détresse respiratoire associée, instabilité hémodynamique, patient sous anticoagulants.",
    ordonnance: "**Devant une hémoptysie minime isolée à explorer en urgence :**\n1. Lettre d'orientation urgente pour scanner thoracique et consultation de pneumologie.\n2. NFS, TP, TCA.\n3. Radiographie pulmonaire de face.",
    pdf_keywords: ["Pneumologie", "Urgences", "Radio thoracique_"]
  },
  {
    id: 30,
    category: "Infectiologie / MST",
    title: "Interprétation du bilan de la syphilis",
    summary: `**1. Tests sérologiques :**
- **VDRL** (Test non tréponémique) : Reflète l'activité de la maladie et l'efficacité thérapeutique. Positif dans la syphilis active, diminue après traitement. Peut donner des faux positifs (grossesse, maladies auto-immunes).
- **TPHA** (Test tréponémique) : Très spécifique du tréponème. Reste positif à vie même après traitement efficace ("cicatrice sérologique").

**2. Algorithme d'interprétation :**
- *TPHA (-) et VDRL (-)* : Absence de syphilis (sauf phase très précoce : chancre de < 10 jours).
- *TPHA (+) et VDRL (+)* : Syphilis active (primaire, secondaire ou latente). Traitement nécessaire.
- *TPHA (+) et VDRL (-)* : Deux cas possibles :
  - Syphilis guérie et traitée (cicatrice sérologique).
  - Syphilis très précoce ou syphilis latente tardive.
- *TPHA (-) et VDRL (+)* : Faux positif biologique du VDRL (ou syphilis primaire très débutante).

**3. Traitement (Syphilis précoce : primaire, secondaire ou latente < 1 an) :**
- Traitement de choix : **Benzathine benzylpénicilline (Extencilline)** 2.4 MUI en injection IM unique (après test de sensibilité ou interrogatoire sur l'allergie).
- Si allergie à la pénicilline : Doxycycline 100mg per os 2x/jour pendant 14 jours.`,
    red_flags: "Neurosyphilis (céphalées, troubles psychiatriques, signes neurologiques focaux) ou atteinte oculaire -> Nécessite une sérologie dans le LCR et une pénicilline IV à forte dose pendant 10-14 jours.",
    ordonnance: "**Pour syphilis précoce confirmée :**\n1. Extencilline (Benzathine Benzylpénicilline) 2.4 MUI injectable : 1 flacon. Réaliser 1 injection intramusculaire lente unique (après vérification de l'absence d'allergie).\n2. Prévenir la réaction de Jarisch-Herxheimer (fièvre, céphalées lors de la lyse des tréponèmes) par la prise de Paracétamol.",
    pdf_keywords: ["Bilans", "Infectieux"]
  },
  {
    id: 31,
    category: "Dermatologie",
    title: "CAT devant psoriasis peau / cheveux",
    summary: `**1. Diagnostic :**
- Plaques érythémato-squameuses bien limitées, squames épaisses, blanchâtres, nacrées.
- Sièges de prédilection : Coudes, genoux, région lombo-sacrée, cuir chevelu (plaques débordant la lisière frontale).
- Signe de la tache de bougie et du rosé sanglant (Auspitz) au grattage.

**2. Traitement local du Psoriasis cutané (Première intention) :**
- **Dermocorticoïdes forts** (Classe II ou I : Propionate de clobétasol - Dermoval) associés à un dérivé de la vitamine D3 (Calcipotriol) : 1 application/jour pendant 2 à 4 semaines, puis espacer.
- Émollients pour hydrater et décaper (Urée, Vaseline salicylée à 5-10% si squames très épaisses).

**3. Traitement du Psoriasis du cuir chevelu :**
- Shampoing ou gel contenant du goudron, de l'acide salicylique (pour décaper) ou des corticoïdes locaux (Clobétasol shampoing ou lotion).

**4. Contre-indications absolues :**
- **Corticothérapie par voie générale** (risque majeur de rebond sévère à l'arrêt sous forme de psoriasis pustuleux généralisé, potentiellement mortel).`,
    red_flags: "Psoriasis érythrodermique (atteignant > 90% de la surface corporelle), psoriasis pustuleux généralisé, arthrite psoriasique associée (douleurs articulaires inflammatoires nécessitant un traitement de fond par Méthotrexate).",
    ordonnance: "1. Dermoval (Clobétasol) crème : 1 application par jour le soir sur les plaques de psoriasis cutané pendant 15 jours, puis espacer à 1 application 2 à 3 fois par semaine.\n2. Xamiol (Calcipotriol + Bétaméthasone) gel : 1 application par jour sur le cuir chevelu sec le soir, laisser poser la nuit et laver le matin.\n3. Dexeryl crème (émollient) : Applications généreuses 2 fois par jour.",
    pdf_keywords: ["Dermatologie", "CAT Dermatologie", "Médicaments"]
  },
  {
    id: 32,
    category: "Dermatologie",
    title: "CAT devant eczéma et eczéma surinfecté",
    summary: `**1. Diagnostic :**
- Eczéma aigu : Lésions érythémateuses, vésiculeuses, prurigineuses, suintantes puis croûteuses.
- Eczéma chronique : Plaques lichénifiées, sèches et fissurées.
- Distinguer la dermatite atopique (nourrisson, antécédents personnels/familiaux d'atopie, plis des coudes/genoux) de l'eczéma de contact (allergique, topographie orientant vers l'allergène).

**2. Traitement de l'eczéma non surinfecté :**
- **Dermocorticoïdes** (Betaméthasone - Diprosone) : 1 application par jour jusqu'à disparition des lésions (décroissance progressive conseillée).
- Émollients quotidiens (uniquement sur peau saine/non suintante pour réparer la barrière cutanée).
- Antihistaminiques oraux de 2ème génération (Cétirizine, Desloratadine) si prurit insomniant.

**3. CAT devant un eczéma surinfecté (Impétiginisation) :**
- Présence de croûtes mélicériques (jaune miel), de pustules ou d'un suintement purulent.
- Traitement de la surinfection **avant** ou **en association** avec les dermocorticoïdes.
- Soins locaux antiseptiques (Chlorhexidine) + antibiothérapie locale (Acide fusidique crème) si lésion très localisée.
- Antibiothérapie orale (Pristinamycine ou Amoxicilline + Acide clavulanique) si lésions étendues.`,
    red_flags: "Érythrodermie, surinfection herpétique sur dermatite atopique (Syndrome de Kaposi-Juliusberg : apparition brutale de vésicules ombiliquées douloureuses, fièvre - URGENCE pédiatrique nécessitant Aciclovir IV).",
    ordonnance: "**Pour eczéma aigu non surinfecté :**\n1. Diprosone (Bétaméthasone) crème : 1 application par jour sur les plaques enflammées pendant 7 à 10 jours.\n2. Cétirizine 10mg : 1 comprimé le soir en cas de prurit intense.\n3. Dexeryl crème : 2 applications par jour sur tout le corps (hors plaques rouges).\n\n**Si surinfecté (étendu) :**\n1. Augmentin 1g : 1 cp 3x/j pendant 7 jours.\n2. Chlorhexidine solution aqueuse : Désinfection douce 2x/j.",
    pdf_keywords: ["Dermatologie", "CAT Dermatologie", "Médicaments en Pédiatrie"]
  },
  {
    id: 33,
    category: "Dermatologie",
    title: "CAT devant zona",
    summary: `**1. Diagnostic :**
- Réactivation du virus Varicelle-Zona (VZV) dans un ganglion sensitif.
- Douleurs neuropathiques (brûlures, élancements) unilatérales, radiculaires (intercostales ++), suivies d'une éruption de vésicules groupées en bouquets sur fond érythémateux respectant strictement la ligne médiane.

**2. Traitement symptomatique (Indispensable pour tous) :**
- Toilette quotidienne à l'eau et au savon doux. Antiseptique aqueux (Chlorhexidine) si lésions suintantes pour éviter la surinfection bactérienne.
- Antalgiques : Paracétamol, +/- morphiniques ou Gabapentine/Prégabaline en cas de douleurs neuropathiques intenses. **Pas d'AINS ni de corticoïdes** (risque de fasciite nécrosante ou dissémination).

**3. Antiviraux par voie orale (Valacyclovir 1g 3x/j pendant 7 jours) :**
- Indications formelles :
  - Patient de > 50 ans (pour prévenir les douleurs post-zostériennes - DPZ).
  - Zona ophtalmique (risque de cécité - urgence ophtalmologique associée).
  - Patient immunodéprimé (traitement souvent IV).
  - Doit être débuté dans les 72 heures suivant le début de l'éruption.`,
    red_flags: "Zona ophtalmique (atteinte de l'aile du nez - signe de Hutchinson : témoigne de l'atteinte du nerf naso-ciliaire), zona chez un patient immunodéprimé (risque de zona généralisé).",
    ordonnance: "**Pour un patient de 65 ans avec zona intercostal (débuté depuis 48h) :**\n1. Zelitrex (Valacyclovir) 1000mg : 1 comprimé 3 fois par jour pendant 7 jours.\n2. Chlorhexidine aqueuse solution : 1 application douce sur les lésions 2 fois par jour.\n3. Lyrica (Prégabaline) 75mg : 1 gélule le soir au coucher (à adapter selon tolérance et fonction rénale pour les douleurs neuropathiques).",
    pdf_keywords: ["Dermatologie", "CAT Dermatologie", "Médicaments"]
  },
  {
    id: 34,
    category: "Dermatologie",
    title: "CAT devant acné : traitement de première intention",
    summary: `**1. Évaluation de la sévérité :**
- Acné légère à modérée (comédons, quelques papulo-pustules) vs acné sévère (nombreuses papulo-pustules, nodules, risque de cicatrices).

**2. Traitement de l'Acné Légère (Comédonienne prédominante) :**
- Traitement local exclusif : Rétinoïdes locaux (Adapalène - Différine) pour éliminer les comédons, ou Peroxyde de Benzoyle (Curaspot) pour son action antibactérienne et kératolytique.
- Appliquer le soir sur peau propre et sèche (les rétinoïdes sont photosensibilisants).

**3. Traitement de l'Acné Modérée (Papulo-pustuleuse) :**
- Association locale : Adapalène + Peroxyde de benzoyle (Epiduo) en première intention.
- Si échec après 3 mois ou d'emblée si étendu : Associer un antibiotique oral de la famille des cyclines (**Doxycycline** 100mg/jour) pendant 3 mois maximum (ne jamais prescrire d'antibiotique oral seul sans traitement local associé pour éviter les résistances).

**4. Conseils indispensables :**
- Toilette douce sans frotter (pain dermatologique ou gel nettoyant surgras).
- Hydratation par crème non comédogène (compensant le dessèchement des traitements).
- Protection solaire obligatoire (les cyclines et rétinoïdes sont photosensibilisants).`,
    red_flags: "Acné nodulaire sévère ou échec des cyclines bien conduits -> Référer au dermatologue pour mise sous Isotrétinoïne (Roaccutane) - attention aux règles de prescription strictes chez la femme en âge de procréer (contraception obligatoire, tests de grossesse réguliers).",
    ordonnance: "**Prescription pour Acné modérée :**\n1. Doxycycline 100mg : 1 comprimé par jour au milieu du dîner (à prendre avec un grand verre d'eau, rester assis/debout pendant 30 min après la prise pour éviter les ulcérations œsophagiennes) pendant 3 mois.\n2. Epiduo (Adapalène/Peroxyde de Benzoyle) gel : 1 application fine sur les zones acnéiques le soir après nettoyage, en évitant le contour des yeux et des lèvres. Commencer 1 soir sur 2 si irritation.",
    pdf_keywords: ["Dermatologie", "CAT Dermatologie"]
  },
  {
    id: 35,
    category: "Dermatologie",
    title: "CAT devant urticaire",
    summary: `**1. Diagnostic clinique :**
- Papules érythémato-œdémateuses, surélevées, prurigineuses (ressemblant à des piqûres d'orties), fugaces (chaque lésion dure moins de 24h) et mobiles.

**2. Démarche étiologique :**
- Urticaire aiguë (durée < 6 semaines) vs chronique (> 6 semaines).
- Causes d'urticaire aiguë : Infectieuse (virale ++, surtout chez l'enfant), alimentaire (allergie vraie rare, souvent histaminolibération non immunologique), médicamenteuse (AINS, antibiotiques), physique (froid, effort).

**3. Traitement :**
- Antihistaminique H1 de deuxième génération (Cétirizine, Desloratadine, Ébastine) par voie orale pendant 7 à 10 jours dans les formes aiguës isolées.
- Si urticaire sévère ou résistante : Augmenter la dose de l'antihistaminique jusqu'à 4 fois par jour (hors AMM mais recommandé) plutôt que de prescrire des corticoïdes par voie générale.
- **Les corticoïdes par voie générale sont à éviter** dans l'urticaire aiguë simple car ils favorisent la récidive et la chronicisation à l'arrêt.`,
    red_flags: "Angio-œdème associé (gonflement du visage, des lèvres ou de la langue) avec dysphonie, dyspnée ou hypotension (Anaphylaxie / Choc anaphylactique -> Urgence vitale, Adrénaline IM 0.3 à 0.5 mg à répéter, transfert SAMU).",
    ordonnance: "1. Desloratadine (Aerius) 5mg : 1 comprimé par jour pendant 10 jours (à prendre le soir).\n2. En cas de poussée plus intense : Possibilité de passer à 2 comprimés par jour sur avis médical.",
    pdf_keywords: ["Dermatologie", "CAT Dermatologie", "Médicaments des urgences_"]
  },
  {
    id: 36,
    category: "Dermatologie",
    title: "CAT devant furoncle / furonculose",
    summary: `**1. Diagnostic :**
- Furoncle : Infection bactérienne profonde et nécrosante du follicule pilo-sébacé due au Staphylocoque doré. Lésion nodulaire érythémateuse, chaude, très douloureuse, évoluant vers la fluctuation et l'élimination du bourbillon (nécrose centrale).
- Furonculose : Répétition de furoncles sur plusieurs mois.

**2. Prise en charge d'un furoncle simple :**
- Soins locaux hygiéniques : Pas de manipulation (risque de dissémination). Lavage quotidien à l'eau et au savon doux, protection par un pansement sec.
- Antiseptiques locaux. Pas d'antibiotique local ni général systématique.

**3. Indications de l'antibiothérapie par voie générale (pendant 5 jours) :**
- Furoncle de la face (zone médio-faciale).
- Multiples furoncles ou terrain à risque (diabète, immunodépression).
- Choix : **Pristinamycine** (Pyostacine) 1g 3x/j ou **Oxacilline/Cloxacilline** 1g 3x/j.

**4. En cas de furonculose :**
- Recherche de portage sain (narines, anus, conduits auditifs) chez le patient et son entourage. Décontamination par douches à la Chlorhexidine corps et cheveux + acide fusidique dans les narines pendant 7 jours. Diagnostic du diabète à éliminer.`,
    red_flags: "Furoncle de la face avec fièvre, frissons, céphalées et œdème palpébral (suspicion de staphylococcie maligne de la face avec thrombophlébite du sinus caverneux - URGENCE vitale, nécessite hospitalisation pour antibiothérapie IV).",
    ordonnance: "**Pour furoncle simple de la face ou multiple (Adulte) :**\n1. Pyostacine (Pristinamycine) 500mg : 2 comprimés 3 fois par jour au cours des repas pendant 5 jours.\n2. Biseptine (Chlorhexidine) solution : 1 application 2 fois par jour après lavage de la zone touchée.\n3. Paracétamol 1g : 1 cp toutes les 6 heures si douleur importante.",
    pdf_keywords: ["Dermatologie", "CAT Dermatologie", "Infectieux"]
  },
  {
    id: 37,
    category: "Dermatologie",
    title: "CAT devant teignes / herpès circiné / dermatophytoses",
    summary: `**1. Dermatophytose de la peau glabre (Herpès circiné) :**
- Lésion érythémato-squameuse arrondie ou ovalaire, d'extension centrifuge avec une bordure active vésiculeuse ou squameuse plus marquée et un centre plus clair. Très prurigineuse.
- Traitement : Antifongique local (Kétoconazole, Ciclopiroxolamine, Terbinafine crème) pendant 2 à 4 semaines, 1 à 2 applications par jour. Dépasser la lésion de 2 cm.

**2. Teignes (Dermatophytose du cuir chevelu - Enfant ++) :**
- Alopécie en plaques squameuses (teignes tondantes à grandes plaques dues à Microsporum, ou petites plaques dues à Trichophyton) ou inflammatoires (Kérion).
- Prélèvement mycologique recommandé avant traitement.
- Traitement : **Obligatoirement par voie systémique** + antifongique local (shampoing kétoconazole).
- Griséfuline (pendant 6 à 8 semaines, à prendre au cours d'un repas gras) ou Terbinafine orale (hors AMM teignes en France mais courante).

**3. Intertrigo des plis (ex : pied d'athlète) :**
- Prurit, desquamation ou macération au niveau des plis inter-digitaux ou inguinaux.
- Traitement : Antifongique local en poudre ou crème pendant 2 à 3 semaines. Mesures de séchage minutieux des plis.`,
    red_flags: "Kérion (teigne très inflammatoire purulente) pouvant laisser des cicatrices alopéciques définitives si le traitement systémique est trop tardif.",
    ordonnance: "**Pour herpès circiné simple (Adulte) :**\n1. Kétoconazole (Fungster) 2% crème : 1 application par jour sur les lésions et 2 cm au-delà, pendant 3 semaines.\n\n**Pour Teigne de l'enfant (20 kg) :**\n1. Griséfuline 250mg : 1 comprimé (soit ~10-15 mg/kg/j) par jour à écraser dans une cuillère de yaourt ou de beurre au cours d'un repas pendant 6 semaines.\n2. Kétoconazole shampoing : 2 applications par semaine sur le cuir chevelu.",
    pdf_keywords: ["Dermatologie", "CAT Dermatologie", "Médicaments en Pédiatrie"]
  },
  {
    id: 38,
    category: "Dermatologie",
    title: "CAT devant impétigo",
    summary: `**1. Diagnostic :**
- Infection bactérienne superficielle de la peau due au Staphylocoque doré et/ou au Streptocoque du groupe A. Très contagieux, fréquent chez l'enfant.
- Clinique : Vésiculo-pustules fragiles qui rompent rapidement pour laisser place à des **croûtes jaunâtres mélicériques** (couleur de miel) siégeant préférentiellement autour des orifices (nez, bouche).

**2. Prise en charge :**
- Hygiène stricte : Lavage des mains, ongles courts et propres, éviction scolaire (durée variable selon le traitement, en général 3 jours si traitement oral, pas d'éviction si localisé et couvert).
- Lavage des lésions à l'eau et au savon doux. Ne pas arracher les croûtes.

**3. Traitement localisé (< 5 lésions, surface < 2% de la surface corporelle) :**
- Antibiothérapie locale exclusive : **Acide fusidique** 2% crème ou Mupirocine : 2 à 3 applications par jour pendant 5 jours.

**4. Traitement étendu (> 5 lésions ou évolution rapide) :**
- Antibiothérapie par voie générale (pendant 5 jours) associée aux soins locaux.
- Choix : Cloxacilline/Oxacilline (ou Amoxicilline-Acide clavulanique chez l'enfant), ou Céfadroxil, ou Pristinamycine (adulte).`,
    red_flags: "Apparition de bulles volumineuses (impétigo bulleux du nouveau-né lié à une toxine staphylococcique - risque de syndrome de la peau ébouillantée - hospitalisation en pédiatrie), fièvre élevée, syndrome néphrotique post-streptococcique (surveiller les urines à 3 semaines).",
    ordonnance: "**Pour Impétigo localisé de l'enfant :**\n1. Fucidine (Acide fusidique) 2% crème : 1 application sur les lésions après nettoyage doux à l'eau et au savon, 3 fois par jour pendant 5 jours.\n\n**Pour Impétigo étendu de l'enfant (15 kg) :**\n1. Augmentin sirop (Enfant) : 1 dose-poids (15kg) 3 fois par jour pendant 5 jours.\n2. Fucidine crème : En application locale sur les lésions croûteuses.",
    pdf_keywords: ["Dermatologie", "CAT Dermatologie", "Médicaments en Pédiatrie"]
  },
  {
    id: 39,
    category: "Dermatologie",
    title: "CAT devant gale / poux",
    summary: `**1. Gale (Sarcoptose) :**
- Diagnostic : Prurit à recrudescence nocturne, familial ou collectif.
- Localisations évocatrices : Espaces interdigitaux des mains, face antérieure des poignets, coudes, aisselles, ombilic, fesses, organes génitaux externes (nodules scabieux). Présence de sillons scabieux ou de vésicules perlées.
- **Traitement impératif du patient ET de tous les sujets contacts simultanément**, ainsi que désinfection des vêtements et de la literie (lavage à 60°C ou sac plastique fermé avec acaricide type A-Par pendant 72h).
- Traitement de choix : **Ivermectine** (Stromectol) per os : 200 µg/kg en dose unique, à renouveler obligatoirement à J8-J14 (pour détruire les larves écloses des œufs non touchés par la 1ère prise).
- +/- Traitement local associé (Benzoate de benzyle - Ascabiol) chez l'adulte.

**2. Poux (Pédiculose du cuir chevelu) :**
- Prurit du cuir chevelu, surtout rétro-auriculaire et occipital. Présence de lentes vivantes (collées près de la racine du cheveu) et de poux adultes.
- Traitement de choix : Diméticone lotion (action mécanique étouffante, pas de résistance). Appliquer sur cheveux secs, laisser poser (en général 8h ou selon notice) puis rincer et passer le peigne fin. Répéter à J7-J10.
- Traiter l'entourage si présence de lentes/poux.`,
    red_flags: "Gale hyperkératosique (norvégienne) chez le sujet âgé ou immunodéprimé : extrêmement contagieuse, nécessite une hospitalisation en chambre d'isolement pour traitement lourd combiné oral + local répété.",
    ordonnance: "**Pour le traitement de la Gale (Adulte de 70 kg) :**\n1. Stromectol (Ivermectine) 3mg : 5 comprimés en 1 prise unique à jeun avec un grand verre d'eau (2 heures avant ou après un repas).\n2. À renouveler exactement 10 jours plus tard : 5 comprimés en 1 prise unique.\n3. Spregal ou A-Par aérosol : Pour désinfection de la literie et des vêtements ne passant pas à la machine.",
    pdf_keywords: ["Dermatologie", "CAT Dermatologie"]
  },
  {
    id: 40,
    category: "Dermatologie",
    title: "CAT devant leishmaniose cutanée",
    summary: `**1. Contexte et Diagnostic :**
- Maladie parasitaire endémique en Algérie (zones steppiques et sahariennes ++, transmise par la piqûre d'un phlébotome).
- Clinique : Lésion nodulaire ou ulcéro-croûteuse indolore, siégeant sur les zones découvertes (visage, membres), évoluant sur plusieurs mois (chronique).
- Confirmation : Frottis cutané par grattage de la bordure de la lésion pour mise en évidence des formes amastigotes de *Leishmania*.

**2. Prise en charge :**
- Forme cutanée localisée simple (< 5 lésions, de petite taille, hors zones articulaires ou esthétiques majeures) : **Glucantime (Antimoniate de méglumine) en infiltration intra-lésionnelle** (1 à 2 mL par lésion, 1 à 2 fois par semaine jusqu'à cicatrisation, environ 5-8 séances).
- Formes multiples ou complexes (visage, péri-orificiel) : Glucantime par voie intramusculaire (20 mg/kg/jour pendant 15 à 20 jours). **Bilan rénal, hépatique et ECG préalable obligatoire** (risque de toxicité cardiaque - stibiothérapie et rénale).`,
    red_flags: "Toxicité du Glucantime IM (allongement du QT à l'ECG, cytolyse hépatique, pancréatite biologique) imposant l'arrêt immédiat du traitement.",
    ordonnance: "**Pour Leishmaniose cutanée simple (Infiltration locale) :**\n1. Glucantime ampoules injectables : Infiltration intra-lésionnelle au cabinet médical une fois par semaine pendant 5 à 6 semaines.\n2. Soins locaux : Nettoyage antiseptique et pansement stérile après chaque séance.",
    pdf_keywords: ["Dermatologie", "Dermatologie_", "Infectieux", "Bilans"]
  },
  {
    id: 41,
    category: "Urologie / Néphrologie",
    title: "CAT devant infections urinaires chez l’adulte : homme / femme",
    summary: `**1. Chez la Femme :**
- **Cystite aiguë simple** : Clinique typique (brûlures mictionnelles, pollakiurie, impériosités, absence de fièvre et de douleur lombaire). Bandelette Urinaire (BU) positive (Leucocytes et/ou Nitrites). ECBU inutile.
  - Traitement : **Fosfomycine-trométamol (Monuril)** 3g en dose unique en première intention. Deuxième intention : Pivmécillinam pendant 3 jours.
- **Cystite aiguë à risque de complication** (grossesse, sujet âgé, diabète, insuffisance rénale chronique) : ECBU indispensable.
- **Pyélonéphrite aiguë simple** (Fièvre, frissons, douleur de la fosse lombaire unilatérale, BU +). ECBU indispensable ++.
  - Traitement : Ciprofloxacine 500mg 2x/j ou Lévofloxacine pendant 7 jours (si simple). Si signes de gravité : Hospitalisation pour Ceftriaxone IV.

**2. Chez l'Homme (Infection Urinaire Masculine / Prostatite) :**
- Toute infection urinaire chez l'homme est considérée comme complexe. Clinique : Dysurie, brûlures, fièvre, prostate douloureuse au toucher rectal (TR - à réaliser avec douceur).
- **ECBU obligatoire**.
- Traitement : Fluoroquinolones (Ciprofloxacine) ou Cotrimoxazole (Bactrim) pendant 14 jours minimum (pénétration prostatique).`,
    red_flags: "Choc septique, pyélonéphrite obstructive (calcul bloquant l'uretère vu à l'échographie en urgence - nécessite une dérivation des urines en urgence), rétention aiguë d'urines chez l'homme en prostatite aiguë.",
    ordonnance: "**Pour Cystite simple (Femme) :**\n1. Monuril (Fosfomycine) 3g : 1 sachet à prendre en dose unique le soir au coucher, à distance d'un repas et après avoir vidé la vessie.\n\n**Pour suspicion de Prostatite aiguë (en attente d'ECBU) :**\n1. Ciprofloxacine 500mg : 1 comprimé 2 fois par jour pendant 14 jours (à réadapter selon les résultats de l'antibiogramme de l'ECBU).",
    pdf_keywords: ["Urologie_", "Infectieux", "Bilans"]
  },
  {
    id: 42,
    category: "Gynécologie / Obstétrique",
    title: "CAT devant infections urinaires chez la femme enceinte",
    summary: `**1. Évaluation et Dépistage :**
- Très fréquent en raison des modifications anatomiques et hormonales. Risque important de pyélonéphrite et d'accouchement prématuré.
- Dépistage mensuel systématique par Bandelette Urinaire dès le 4ème mois.
- **Toute BU positive (Leucocytes et/ou Nitrites) chez la femme enceinte impose un ECBU.**

**2. Colonisation urinaire (Bactériurie asymptomatique - ECBU + sans aucun symptôme) :**
- Traiter systématiquement pour éviter l'évolution vers la pyélonéphrite.
- Choix empirique en attente de l'antibiogramme : Amoxicilline 1g 3x/j (si sensible) ou Pivmécillinam ou Nitrofurantoïne (pendant 7 jours).

**3. Cystite aiguë gravidique (Symptomatique) :**
- Traitement probabiliste immédiat (après ECBU) : **Fosfomycine 3g en dose unique** en première intention. Réadapter à l'antibiogramme. Durée totale de 7 jours si autre molécule utilisée.

**4. Pyélonéphrite aiguë gravidique :**
- **Hospitalisation systématique initiale**. Risque de choc septique et de menace d'accouchement prématuré.
- Antibiothérapie IV (Ceftriaxone) puis relais per os guidé par l'antibiogramme pour une durée totale de 10 à 14 jours. ECBU de contrôle régulier.`,
    red_flags: "Fièvre, contractions utérines associées, vomissements rendant impossible le traitement oral, intolérance aux bêta-lactamines.",
    ordonnance: "**Pour Cystite gravidique (en attente des résultats d'ECBU prélevé) :**\n1. Monuril (Fosfomycine) 3g : 1 sachet en dose unique.\n2. Boire abondamment (eau de source) > 2L/jour.\n3. Reprendre contact dès réception de l'antibiogramme (sous 48h) pour confirmer l'efficacité.",
    pdf_keywords: ["Gynecologie_", "Urologie_", "Médicaments et Grossesse"]
  },
  {
    id: 43,
    category: "Pédiatrie",
    title: "CAT devant infections urinaires chez l’enfant",
    summary: `**1. Clinique :**
- Nourrisson : Symptômes très atypiques (fièvre isolée inexpliquée, stagnation pondérale, refus de têter, vomissements, urines fortes).
- Enfant propre : Brûlures mictionnelles, pollakiurie, énurésie secondaire, douleurs abdominales ou lombaires.

**2. Diagnostic :**
- Bandelette urinaire positive (Nitrites et/ou leucocytes). Chez le nourrisson, le prélèvement se fait par poche collectrice (attention aux faux positifs, changer la poche toutes les 30 min) ou par cathétérisme/ponction pubienne en milieu hospitalier.
- **ECBU systématique** en cas de BU positive.

**3. Traitement :**
- **Cystite simple** (rare chez le jeune garçon, possible chez la fille propre sans fièvre) : Amoxicilline-Acide clavulanique (Augmentin) ou Cotrimoxazole pendant 3 à 5 jours.
- **Pyélonéphrite aiguë** (Infection urinaire fébrile) :
  - Si nourrisson < 3 mois ou mauvaise tolérance : Hospitalisation.
  - Si traitement ambulatoire possible : Ceftriaxone en injection IM ou IV unique quotidienne (50 mg/kg/j) ou Céfixime per os (si > 3 mois) pendant 10 jours.
- **Explorations systématiques après un 1er épisode fébrile chez le nourrisson** : Échographie rénale et des voies urinaires (pour rechercher une malformation comme un reflux vésico-urétéral).`,
    red_flags: "Fièvre élevée mal tolérée chez le nourrisson de < 3 mois (risque de sepsis urinaire), vomissements rendant impossible la prise des antibiotiques oraux, uropathie malformative connue.",
    ordonnance: "**Pour pyélonéphrite aiguë de l'enfant de 3 ans (15 kg) en ambulatoire :**\n1. Oroken (Céfixime) 40mg/5ml : 1 dose-poids (15kg) 2 fois par jour pendant 10 jours.\n2. Paracétamol sirop : 1 dose-poids toutes les 6 heures en cas de fièvre.\n3. Échographie rénale à réaliser à distance (sous 15 jours).",
    pdf_keywords: ["Pédiatrie", "Médicaments en Pédiatrie", "Urologie_"]
  },
  {
    id: 44,
    category: "Urologie / Néphrologie",
    title: "CAT devant colique néphrétique",
    summary: `**1. Diagnostic :**
- Douleur lombaire unilatérale, brutale, hyperalgique, irradiant vers les organes génitaux externes.
- Patient agité, recherchant une position antalgique qui n'existe pas ("colique néphrétique = chien fou").
- Souvent accompagnée de signes urinaires (pollakiurie, hématurie macro ou microscopique à la BU) et digestifs (nausées, vomissements, iléus réflexe). Apyrétique (pas de fièvre).

**2. Prise en charge médicale (Crise simple) :**
- Restriction hydrique relative pendant la crise (ne pas boire abondamment pour éviter d'augmenter la pression en amont de l'obstacle).
- Traitement de choix : **AINS** par voie injectable ou orale car ils diminuent l'œdème local et la filtration glomérulaire, réduisant la pression urétérale.
- **Kétoprofène** (Profénid) 100mg IV ou IM, ou per os. Associer du Paracétamol.
- Éliminer le calcul : Tamiser les urines pour essayer de récupérer le calcul pour analyse spectrophotométrique.

**3. Imagerie :**
- Couple Radiographie (ASP) + Échographie rénale et voies urinaires sous 24-48h, ou idéalement un Scanner (Uro-TDM) sans injection.`,
    red_flags: "Colique néphrétique fébrile (Pyélonéphrite obstructive - URGENCE médico-chirurgicale absolue : risque de choc septique rapide, nécessite drainage chirurgical), rein unique, anurie (absence d'urines depuis > 12h), douleur rebelle aux AINS et morphiniques.",
    ordonnance: "1. Profénid (Kétoprofène) 100mg : 1 comprimé matin, midi et soir au cours des repas pendant 5 jours (sauf contre-indication rénale ou ulcéreuse).\n2. Esoméprazole 20mg : 1 gélule par jour (protecteur gastrique).\n3. Tramadol 50mg : 1 gélule toutes les 6 à 8 heures si la douleur persiste sous AINS.\n4. Tamiser les urines à chaque miction.",
    pdf_keywords: ["Urologie_", "Urgences", "Médicaments des urgences_"]
  },
  {
    id: 45,
    category: "Pédiatrie",
    title: "CAT devant fièvre chez l’enfant",
    summary: `**1. Définition et Évaluation clinique :**
- Température rectale >= 38.0°C chez un enfant normalement couvert, au repos.
- Évaluer la tolérance globale : Comportement (réactivité, sourire, cri), coloration cutanée (pâleur, marbrures), respiration (fréquence, tirage), état d'hydratation (fontanelle, pli cutané).

**2. Conduite à tenir :**
- **Nourrisson de < 3 mois : Hospitalisation systématique** pour bilan infectieux complet (NFS, CRP, ECBU, Hémocultures, +/- Ponction lombaire) en raison du risque de sepsis bactérien néonatal sévère.
- **Enfant de > 3 mois bien tolérant** : Prise en charge à domicile.
  - Mesures non médicamenteuses prioritaires : Découvrir l'enfant (sans le grelotter), proposer à boire très régulièrement, ne pas surchauffer la pièce (19-20°C). Le bain tiède n'est plus recommandé (inconfort).
  - Traitement médicamenteux : Uniquement si la fièvre est mal tolérée (inconfort, douleurs). **Paracétamol** en première intention : 15 mg/kg toutes les 6 heures (max 60 mg/kg/jour).
  - Si mauvaise tolérance sous paracétamol seul : Possibilité d'utiliser l'Ibuprofène (10 mg/kg toutes les 6h, max 30 mg/kg/j) en l'absence de contre-indications (varicelle, suspicion de pneumonie ou infection cutanée).

**3. Diagnostic étiologique :**
- Chercher un foyer infectieux : OMA, rhinopharyngite, angine, infection urinaire (faire une BU), éruption cutanée.`,
    red_flags: "Purpura (toute lésion purpurique ne s'effaçant pas à la vitropression associée à la fièvre impose l'injection immédiate de Ceftriaxone IM/IV et l'appel du SAMU pour suspicion de purpura fulminans), troubles de la conscience, hypotonie, geignement, dyspnée sévère.",
    ordonnance: "1. Paracétamol pédiatrique (sirop dose-poids) : 1 dose-poids toutes les 6 heures en cas de fièvre entraînant un inconfort, max 4 doses par jour.\n2. Seringue pour réhydrater régulièrement avec de l'eau ou SRO si troubles digestifs associés.",
    pdf_keywords: ["Pédiatrie", "Médicaments en Pédiatrie", "Urgences"]
  },
  {
    id: 46,
    category: "Gynécologie / Obstétrique",
    title: "CAT devant fièvre chez la femme enceinte",
    summary: `**1. Risques majeurs :**
- La fièvre pendant la grossesse comporte un double risque : tératogène ou inducteur de contractions pour le fœtus, et témoin d'une infection grave pour le couple mère-enfant.
- Deux urgences infectieuses spécifiques à redouter :
  - **Listeriose** : Infection bactérienne alimentaire (*Listeria monocytogenes*). Clinique : Syndrome pseudo-grippal fébrile isolé. Risque d'avortement, mort fœtale ou accouchement prématuré.
  - **Chorioamniotite** : Infection du liquide amniotique (souvent après rupture des membranes). Clinique : Fièvre, tachycardie maternelle et fœtale, utérus douloureux, pertes vaginales malodorantes.

**2. Conduite à tenir systématique :**
- Hospitalisation ou surveillance très étroite selon le terme et la clinique.
- Réaliser : NFS, CRP, ECBU, Hémocultures (si T° > 38.5°C), bilan gynécologique (rythme cardiaque fœtal, échographie).
- Devant tout syndrome pseudo-grippal fébrile inexpliqué chez la femme enceinte : **Prescrire d'emblée une antibiothérapie probabiliste active sur Listeria (Amoxicilline** 3g/jour pendant 10 jours) après prélèvements.

**3. Traitement symptomatique :**
- Paracétamol pour normaliser la température (la fièvre prolongée est nocive pour le fœtus).
- **AINS formellement contre-indiqués** à partir du 6ème mois (24 SA).`,
    red_flags: "Diminution des mouvements fœtaux, contractions utérines douloureuses, liquide amniotique teinté ou malodorant, signes de sepsis maternel.",
    ordonnance: "**En ambulatoire, devant suspicion de listériose (après hémocultures réalisées) :**\n1. Amoxicilline 1g : 1 comprimé 3 fois par jour pendant 10 jours.\n2. Paracétamol 1g : 1 comprimé en cas de fièvre, à renouveler toutes les 6 heures si besoin (max 4/jour).",
    pdf_keywords: ["Médicaments et Grossesse", "Gynécologie_", "Bilans"]
  },
  {
    id: 47,
    category: "Gynécologie / Obstétrique",
    title: "CAT devant infections génitales chez la femme",
    summary: `**1. Diagnostic différentiel des leucorrhées :**
- **Vaginite à Candida (Mycose)** : Prurit vulvaire intense, leucorrhées blanches, épaisses, grumeleuses ("lait caillé"), vagin érythémateux. pH vaginal acide (< 4.5).
  - Traitement : Ovule antifongique local (Econazole LP en dose unique) + crème antifongique sur la vulve pendant 7 jours. Traitement du partenaire inutile si asymptomatique.
- **Vaginose bactérienne (Gardnerella)** : Odeur de "poisson pourri" (accentuée par le sperme ou après les règles), leucorrhées grises, fluides. pH > 4.5.
  - Traitement : Métronidazole (Flagyl) 500mg 2x/j per os pendant 7 jours ou gel local.
- **Vaginite à Trichomonas** : Leucorrhées verdâtres, abondantes, mousseuses, col érythémateux ("en fraise"). MST.
  - Traitement : Métronidazole per os (dose unique 2g ou 500mg 2x/j pendant 7 jours). Traiter impérativement le partenaire.

**2. Infections génitales hautes (IGH - Salpingite, Endométrite) :**
- Clinique : Douleurs pelviennes bilatérales, fièvre, leucorrhées suspectes, douleur à la mobilisation utérine au toucher vaginal.
- Diagnostic urgent par prélèvements vaginaux et PCR (Chlamydia, Gonocoque), échographie pelvienne.
- Traitement : Antibiothérapie probabiliste large associant Ceftriaxone (IM unique) + Doxycycline (per os 14 jours) + Métronidazole (per os 14 jours).`,
    red_flags: "Douleur pelvienne aiguë fébrile avec défense (suspicion de péritonite ou d'abcès du Douglas/tubo-ovarien - nécessite hospitalisation urgente en gynécologie pour traitement IV et drainage éventuel).",
    ordonnance: "**Pour Mycose vaginale simple :**\n1. Econazole LP 150mg ovule : 1 ovule à introduire profondément dans le vagin le soir au coucher en dose unique (à renouveler après 3 jours si prurit persistant).\n2. Econazole 1% crème : 1 application vulvaire 2 fois par jour pendant 7 jours.\n\n**Pour Vaginose bactérienne :**\n1. Flagyl (Métronidazole) 500mg : 1 comprimé matin et soir pendant 7 jours.",
    pdf_keywords: ["Gynécologie_", "Infectieux", "Médicaments et Grossesse"]
  },
  {
    id: 48,
    category: "Endocrinologie",
    title: "CAT devant carence en vitamine D3",
    summary: `**1. Diagnostic biologique :**
- Dosage de la **25-OH-vitamine D** sérique.
- Insuffisance : entre 20 et 30 ng/mL.
- Carence : < 20 ng/mL (sévère si < 10 ng/mL).

**2. Prise en charge (Supplémentation) :**
- **Carence sévère (< 10-15 ng/mL)** : Phase d'attaque par dose de charge de Vitamine D3 (Cholécalciférol).
  - Adulte : 1 ampoule de 100 000 UI ou 200 000 UI de Cholécalciférol (Uvedose) toutes les 2 à 4 semaines pendant 2 à 3 mois, suivie d'un traitement d'entretien.
- **Traitement d'entretien ou carence modérée** : 1 ampoule de 100 000 UI tous les 2 à 3 mois, ou 800 à 2000 UI par jour par voie orale (gouttes de ZymaD).
- Chez l'enfant (prévention systématique) : Supplémentation quotidienne en gouttes (Adrigyl, ZymaD) de la naissance à 18 ans selon les recommandations nationales (généralement 400 à 800 UI/jour chez l'enfant sain).
- Associer des conseils hygiéno-diététiques : Exposition solaire modérée (visage et bras 15 min/jour), alimentation riche en vitamine D (poissons gras, produits laitiers enrichis).`,
    red_flags: "Signes d'hypocalcémie associée (paresthésies péri-buccales, crampes musculaires, spasmes carpo-pédaux - signe de Trousseau) nécessitant un dosage du calcium et magnésium sérique.",
    ordonnance: "**Pour adulte avec carence sévère avérée (< 15 ng/mL) :**\n1. Uvedose (Cholécalciférol) 100 000 UI solution buvable en ampoule : 1 ampoule par voie orale à prendre avec un repas gras, toutes les 2 semaines, au total 4 ampoules (pendant 2 mois).\n2. Puis relais d'entretien : 1 ampoule de 100 000 UI tous les 3 mois.",
    pdf_keywords: ["Endocrinologie_", "Médicaments en Pédiatrie", "Bilans"]
  },
  {
    id: 49,
    category: "Pédiatrie",
    title: "CAT devant les cris chez l'enfant",
    summary: `**1. Démarche diagnostique systématique (Éliminer une cause organique) :**
- Cris ou pleurs excessifs (> 3 heures/jour, > 3 jours/semaine).
- **Examen physique complet de l'enfant déshabillé obligatoire** :
  - Examen ORL (OMA purulente douloureuse).
  - Palpation abdominale (invagination intestinale aiguë, hernie inguinale étranglée).
  - Examen cutané (fil de cheveux ou textile enroulé autour d'un orteil ou du pénis : syndrome du cheveu étrangleur).
  - Examen des yeux (corps étranger, ulcère de cornée - faire un test à la fluorescéine si œil rouge).
  - Palpation des membres (fracture ou traumatisme inaperçu).

**2. Causes fréquentes non graves :**
- **Coliques du nourrisson** (pleurs inconsolables en fin de journée chez un nourrisson de < 4 mois en bonne santé, tonique, avec prise de poids normale).
- RGO douloureux, intolérance aux protéines du lait de vache (IPLV).
- Poussées dentaires (vers 6 mois).
- Fatigue, besoin de succion, manque de sommeil.

**3. Conduite à tenir :**
- Rassurer les parents (prévention du syndrome du bébé secoué ++).
- Si coliques : Massage abdominal, portage, réduction des stimulations. Essai de probiotiques (L. reuteri) ou de siméticone.`,
    red_flags: "Pleurs incessants avec cris aigus ('cri méningé'), hypotonie, accès de pâleur lors des crises de pleurs (invagination intestinale aiguë), fièvre associée, vomissements bilieux, refus alimentaire complet.",
    ordonnance: "**Conseils et traitement de soutien pour coliques du nourrisson :**\n1. Biogaia (Lactobacillus reuteri) gouttes : 5 gouttes par jour directement dans la bouche ou dans un biberon de lait tiède pendant 21 jours.\n2. Calmosine boisson apaisante (phytothérapie) : 1 cuillère à café avant chaque tétée ou biberon (max 6/jour).\n3. Fiche d'information sur la gestion des pleurs du nourrisson et la prévention du secouement.",
    pdf_keywords: ["Pédiatrie", "Médicaments en Pédiatrie", "Urgences"]
  },
  {
    id: 50,
    category: "Ophtalmologie",
    title: "CAT devant œil rouge",
    summary: `**1. Démarche diagnostique (Recherche de signes de gravité) :**
- Évaluer l'**acuité visuelle** (conservée ou diminuée) et la **douleur** (absente, sensation de grain de sable, ou douleur profonde intense).
- Examen clinique : Photophobie, larmoiement, type de rougeur (conjonctivale diffuse, péri-kératique en couronne autour du col, ou localisée).

**2. Diagnostic d'orientation :**
- **Œil rouge non douloureux avec acuité visuelle normale** :
  - *Conjonctivite aiguë* (virale ou bactérienne) : Sécrétions bilatérales (bactérienne) ou claires (virale/allergique), prurit.
  - *Hémorragie sous-conjonctivale* : Rougeur en flaque homogène bien limitée, indolore, suite à un effort de toux ou HTA. Bénin, résolutif spontanément en 2 semaines.
- **Œil rouge douloureux avec baisse de l'acuité visuelle (URGENCES ophtalmologiques)** :
  - *Glaucome Aigu par Fermeture de l'Angle (GAFA)* : Douleur oculaire majeure irradiant dans le territoire trigéminé, œil dur comme de la pierre, pupille en semi-mydriase aréactive, cornée trouble.
  - *Kératite aiguë* : Douleur oculaire superficielle, photophobie importante, test à la fluorescéine positif (ulcération).
  - *Uvéite antérieure* : Douleur sourde profonde, cercle péri-kératique, pupille en myosis.`,
    red_flags: "Baisse de l'acuité visuelle, douleur oculaire profonde, pupille asymétrique (myosis ou mydriase fixe), cornée trouble, traumatisme oculaire récent.",
    ordonnance: "**Pour Conjonctivite bactérienne simple :**\n1. Désinfection oculaire : Dacudoses (sérum physiologique) : Laver l'œil 4 à 6 fois par jour avec une compresse stérile différente pour chaque œil.\n2. Fucithalmic (Acide fusidique) collyre : 1 goutte dans l'œil atteint matin et soir pendant 5 jours.\n*Ne jamais prescrire de collyre corticoïde ou anesthésique local sans avis ophtalmologique (risque de perforation cornéenne en cas d'herpès ou ulcère).*",
    pdf_keywords: ["Ophtalmologie_", "CAT Urgences", "Urgences"]
  },
  {
    id: 51,
    category: "Pédiatrie",
    title: "CAT devant diabète chez l’enfant",
    summary: `**1. Diagnostic :**
- Diabète de type 1 le plus fréquent chez l'enfant.
- Clinique (Syndrome cardinal) : **Polyurie** (énurésie secondaire chez un enfant propre ++), **polydipsie** (soif intense), **polyphagie** associée à un **amincissement rapide**.
- Biologie : Glycémie veineuse >= 2 g/L (11.1 mmol/L) à n'importe quel moment de la journée, ou >= 1.26 g/L à jeun. Présence de glycosurie et cétonurie à la bandelette urinaire.

**2. Conduite à tenir (Urgence médicale) :**
- **Rechercher immédiatement des signes d'acidocétose diabétique** : Odeur acétonémique de l'haleine (pomme de reinette), polypnée (respiration de Kussmaul), nausées/vomissements, douleurs abdominales simulant une urgence chirurgicale, troubles de conscience.
- Si suspicion d'acidocétose (cétonurie positive > 1+ ou cétonémie > 1.5 mmol/L) : **Hospitalisation immédiate en réanimation pédiatrique** pour réhydratation IV et insulinothérapie IVSE. Ne pas injecter d'insuline rapide IM/SC en ambulatoire si acidocétose sans surveillance.
- Si diabète inaugural simple sans acidocétose : Hospitalisation programmée en pédiatrie pour initiation du traitement par insuline sous-cutanée et éducation thérapeutique de l'enfant et de sa famille.`,
    red_flags: "Troubles de la conscience, respiration rapide et profonde (Kussmaul), vomissements répétés, déshydratation sévère chez un enfant suspect de diabète inaugural.",
    ordonnance: "**Bilan d'urgence et lettre d'orientation :**\n1. Lettre d'orientation détaillée décrivant les signes cliniques (perte de poids, polyurie) et les résultats de la bandelette urinaire.\n2. Bandelette urinaire réalisée au cabinet (noter les croix de glucose et de cétones).\n3. Glycémie capillaire.",
    pdf_keywords: ["Pédiatrie", "Endocrinologie_", "Urgences", "Médicaments en Pédiatrie"]
  },
  {
    id: 52,
    category: "Administratif",
    title: "Rédaction d’une lettre d’orientation",
    summary: `**1. Principes de rédaction :**
- La lettre de liaison/d'orientation est un document médical confidentiel mais remis au patient. Elle doit être claire, structurée et contenir toutes les informations utiles pour le spécialiste ou le service d'accueil des urgences.

**2. Structure type de la lettre :**
- En-tête : Coordonnées du médecin généraliste, date et heure (très important en urgence).
- Destinataire : Nom du confrère spécialiste ou "Médecin de garde des urgences de [Nom de l'hôpital]".
- Patient : Nom, prénom, date de naissance.
- Motif de l'orientation (ex: "Je vous adresse ce patient pour suspicion d'appendicite aiguë").
- Histoire de la maladie : Début des symptômes, description clinique, chronologie.
- Examen clinique : Constantes (TA, Pouls, T°, FR, saturation), signes physiques positifs et négatifs importants.
- Antécédents médicaux, chirurgicaux et gynécologiques notables.
- Traitement habituel en cours (joindre ordonnance).
- Premiers gestes ou traitements administrés au cabinet (ex : paracétamol 1g IV à 14h00).`,
    red_flags: "Oubli de mentionner une allergie médicamenteuse grave, oubli de noter l'heure d'administration d'un traitement d'urgence (ex: adrénaline, trinitrine, morphiniques).",
    ordonnance: "**Modèle de rédaction standard :**\n\n*Dr. [Nom] [Prénom]*\n*Médecin Généraliste*\n*Alger, le [Date]*\n\n*A l'attention de Monsieur le Médecin de garde des Urgences de [Hôpital]*\n\n*Objet : Orientation de M./Mme [Nom du patient], né(e) le [Date]*\n\n*Cher Confrère,*\n*Je vous adresse ce jour M./Mme [Nom] pour prise en charge spécialisée d'une [Suspicion diagnostique...]*\n*Cliniquement, le patient présente depuis [Délai] des douleurs de type [Type] associées à [Signes associés].*\n*A l'examen de ce jour à [Heure] : TA: [..], Pouls: [..], T°: [..]°C. On note [Signes physiques].*\n*Antécédents majeurs : [..]*\n*Traitement habituel : [..]*\n*Je vous remercie pour votre collaboration confraternelle.*\n\n*Dr. [Signature]*",
    pdf_keywords: ["Certificats_", "Entretiens_"]
  },
  {
    id: 53,
    category: "Administratif",
    title: "Rédaction d’un certificat médical",
    summary: `**1. Règles déontologiques et juridiques :**
- Le certificat médical engage la responsabilité civile, pénale et disciplinaire du médecin.
- Il doit être rédigé uniquement après examen clinique **physique et récent** du patient.
- Ne jamais attester de faits que l'on n'a pas constatés soi-même. Être purement descriptif et objectif ("M. X présente des lésions compatibles avec...").
- Ne jamais désigner de tiers responsable dans le certificat (ne pas écrire "M. X a été frappé par son voisin Y", mais écrire "M. X déclare avoir été victime d'une agression physique par un tiers").
- Remis en mains propres au patient (sauf dérogations légales : mineurs, majeurs protégés).

**2. Structure générale :**
- Identification du médecin et du patient.
- Mention "rédigé à la demande du patient et remis en mains propres pour valoir ce que de droit".
- Constats cliniques objectifs (lésions, symptômes).
- Date de rédaction (qui peut être différente de la date de constatation des faits, à préciser).`,
    red_flags: "Certificat de complaisance (sans examen physique réel), mention de propos accusateurs envers un tiers, signature antidatée.",
    ordonnance: "**Modèle de certificat descriptif de lésions :**\n\n*Je soussigné, Dr [Nom] [Prénom], certifie avoir examiné ce jour, le [Date] à [Heure], M. [Nom du patient], né le [Date de naissance].*\n*Le patient déclare avoir été victime d'une agression physique le [Date des faits].*\n*L'examen clinique met en évidence les lésions suivantes :*\n*- Une ecchymose de [Dimensions] au niveau de [Localisation anatomique].*\n*- Une dermabrasion linéaire de [Longueur] au niveau de [Localisation].*\n*- Une douleur à la palpation de [Zone], sans impotence fonctionnelle constatée ce jour.*\n*Certificat rédigé à la demande de l'intéressé et remis en mains propres pour faire valoir ce que de droit.*\n\n*Fait à [Ville], le [Date]*\n*Dr [Signature et Cachet]*",
    pdf_keywords: ["Certificats_"]
  },
  {
    id: 54,
    category: "Administratif",
    title: "Rédaction d’un certificat de bonne santé",
    summary: `**1. Objectif et Précautions :**
- Souvent demandé pour l'admission en crèche, le sport scolaire, ou des formalités administratives/assurances.
- Nécessite un examen clinique complet : recherche d'antécédents cardiovasculaires, auscultation cardiaque (recherche de souffle), pulmonaire, examen ostéo-articulaire, contrôle de la TA, poids, taille.
- Vérification du calendrier vaccinal à jour (obligations vaccinales).

**2. Structure :**
- Attestation claire de l'absence de contre-indication apparente constatée ce jour.
- Préciser le but (ex: "pour la pratique du football en compétition").`,
    red_flags: "Délivrer un certificat de sport sans ausculter le patient (risque de mort subite par cardiomyopathie hypertrophique non détectée), attester d'une \"bonne santé\" absolue (préférer la formule \"absence de signes cliniques de contre-indication\").",
    ordonnance: "**Modèle de Certificat de non-contre-indication à la pratique du sport :**\n\n*Je soussigné, Dr [Nom] [Prénom], certifie avoir examiné ce jour M./Mme [Nom du patient], né(e) le [Date].*\n*L'examen clinique de ce jour (incluant une auscultation cardiaque et une mesure de la pression artérielle) n'a pas révélé de signe clinique apparent de contre-indication à la pratique de [Préciser le sport, ex : football en compétition].*\n*Certificat rédigé à la demande de l'intéressé et remis en mains propres pour faire valoir ce que de droit.*\n\n*Fait à [Ville], le [Date]*\n*Dr [Signature/Cachet]*",
    pdf_keywords: ["Certificats_"]
  },
  {
    id: 55,
    category: "Administratif",
    title: "Rédaction d’un certificat de CBU et description des lésions quelconques",
    summary: `**1. Certificat de Coups et Blessures Involontaires ou Volontaires (CBU) :**
- Document médico-légal crucial qui servira au tribunal pour qualifier l'infraction (contravention vs délit) en fonction de l'**ITT (Incapacité Totale de Travail)**.
- L'ITT n'est pas un arrêt de travail professionnel, c'est la période pendant laquelle le patient subit une gêne notable pour accomplir les actes essentiels de la vie quotidienne (se laver, s'habiller, se nourrir). Elle s'applique aussi aux enfants, étudiants et retraités.

**2. Règles de description des lésions (Très précises) :**
- Utiliser les termes anatomiques corrects (ex : face postérieure de l'avant-bras droit, et non \"le bras\").
- Décrire la nature de la lésion : Érosions cutanées (écorchures), ecchymoses (bleus : noter la couleur qui évolue dans le temps pour dater les faits), hématome (collection sanguine fluctuante), plaie (préciser si suturée ou non, dimensions), brûlures (degré, étendue).
- Mesurer précisément les lésions à l'aide d'une règle (ex : \"ecchymose violacée ovalaire de 3 cm sur 2 cm\").
- Évaluer le retentissement psychologique (anxiété majeure, état de choc émotionnel).
- Fixer l'ITT médicale en jours.`,
    red_flags: "Confondre ITT et arrêt de travail (un retraité peut avoir une ITT de 10 jours sans arrêt de travail professionnel), description imprécise des lésions (ex : \"nombreuses blessures sur tout le corps\" sans détails), omettre de décrire l'état psychologique.",
    ordonnance: "**Modèle de certificat médico-légal CBU avec ITT :**\n\n*Je soussigné, Dr [Nom] [Prénom], certifie avoir examiné le [Date] à [Heure] M. [Nom du patient] né le [Date].*\n*Le patient déclare avoir subi une agression physique le [Date des faits] à [Heure].*\n*Les constatations cliniques physiques et psychologiques de ce jour sont :*\n*- Au niveau du visage : Une ecchymose bleutée périorbitaire droite de 4 cm de diamètre.*\n*- Au niveau du thorax : Douleur vive à la palpation de la 5ème côte gauche sans signe d'insuffisance respiratoire.*\n*- État psychologique : Syndrome de stress aigu caractérisé par une hypervigilance et une prostration.* \n*Au vu de ces constatations, j'estime la durée de l'Incapacité Totale de Travail (ITT) au sens médical et médico-légal à : [Nombre en lettres] jours (X jours), sous réserve de complications ultérieures.*\n*Certificat remis en mains propres à l'intéressé...*\n\n*Fait à [Ville], le [Date]*\n*Dr [Signature/Cachet]*",
    pdf_keywords: ["Certificats_"]
  }
];

// Write file
const outputPath = path.join(__dirname, '..', 'cats_db.json');
fs.writeFileSync(outputPath, JSON.stringify(cats, null, 2), 'utf-8');
console.log('Database successfully generated at: ' + outputPath);
