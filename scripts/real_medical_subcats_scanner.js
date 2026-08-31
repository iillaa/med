#!/usr/bin/env node
/**
 * Dr.CAT — True Medical Master CAT & Sub-CAT Clinical Taxonomy Engine
 * Built strictly according to Francophone & Algerian Clinical Practice (Vidal Recos / Collège des Enseignants)
 * Master = Core Consultation Pathology
 * Sub-CATs = Specific Clinical Phenotypes, Acute Complications, Decompensations & Special Terrains
 */

const fs = require('fs');
const path = require('path');

const CACHE_DIR = path.join(__dirname, '..', 'data', 'pdf_cache');
const OUTPUT_MD = path.join(__dirname, '..', 'docs', 'candidate_master_subcats_roadmap.md');
const OUTPUT_JSON = path.join(__dirname, '..', 'data', 'master_subcats_report.json');
const TERMUX_DEST = '/storage/emulated/0/termux-files';

const CLINICAL_CATALOG = [
  // ── 1. GASTRO-ENTÉROLOGIE ──
  {
    masterTitle: "Reflux Gastro-Œsophagien & Pathologie Ulcéreuse",
    specialty: "Gastro-entérologie",
    keywords: ["rgo", "pyrosis", "oméprazole", "gaviscon", "ipp", "ulcère", "gastrite"],
    subCats: [
      { id: "1.1", title: "RGO Simple & Pyrosis Postural (Consultation)", keywords: ["rgo simple", "pyrosis", "gaviscon", "oméprazole 20mg"] },
      { id: "1.2", title: "Ulcère Gastro-Duodénal en Poussée Hyperalgique", keywords: ["ulcère gastroduodénal", "ugd", "crampe épigastrique", "ipp double dose"] },
      { id: "1.3", title: "Éradication d'Helicobacter pylori (Quadrithérapie Pylera)", keywords: ["helicobacter pylori", "quadrithérapie", "pylera", "test respiratoire"] },
      { id: "1.4", title: "Hémorragie Digestive Haute Ulcéreuse (Hématémèse / Méléna)", keywords: ["hématémèse", "méléna", "ipp iv forte dose", "fibroscopie 24h"] },
      { id: "1.5", title: "Perforation Ulcéreuse & Péritonite Aiguë", keywords: ["perforation ulcéreuse", "abdomen de bois", "croissant gazeux", "péritonite"] }
    ]
  },
  {
    masterTitle: "Diarrhées Aiguës de l'Adulte & Gastro-Entérites",
    specialty: "Gastro-entérologie",
    keywords: ["diarrhée aiguë", "gastro-entérite", "lopéramide", "racécadotril", "sro"],
    subCats: [
      { id: "2.1", title: "Diarrhée Aiguë Virale / Aqueuse (Gastro-entérite banale)", keywords: ["diarrhée aqueuse", "racécadotril", "tiorfan", "sro"] },
      { id: "2.2", title: "Syndrome Dysentérique Bactérien (Glaires, Sang, Épreintes)", keywords: ["dysenterie", "glairo-sanglante", "shigella", "ciprofloxacine", "azithromycine"] },
      { id: "2.3", title: "Diarrhée du Voyageur (Turista)", keywords: ["turista", "voyageur", "fluoroquinolone", "azithromycine"] },
      { id: "2.4", title: "Colite Pseudo-Membraneuse post-ATB (Clostridioides difficile)", keywords: ["clostridioides difficile", "post-antibiotique", "métronidazole", "vancomycine orale"] },
      { id: "2.5", title: "Toxi-Infection Alimentaire Collective (TIAC fébrile vs toxique)", keywords: ["tiac", "toxi-infection", "staphylocoque", "salmonella", "déclaration dsp"] }
    ]
  },
  {
    masterTitle: "Pathologies Hépato-Biliaires Aiguës",
    specialty: "Gastro-entérologie",
    keywords: ["colique hépatique", "cholécystite", "angiocholite", "murphy", "lithiase biliaire"],
    subCats: [
      { id: "3.1", title: "Colique Hépatique Lithiasique Simple (Murphy apyrétique)", keywords: ["colique hépatique", "murphy apyrétique", "spasfon", "ains"] },
      { id: "3.2", title: "Cholécystite Aiguë Lithiasique (Murphy fébrile / Épaississement)", keywords: ["cholécystite", "murphy fébrile", "épaississement vésiculaire", "amoxicilline clavulanate", "chirurgie"] },
      { id: "3.3", title: "Angiocholite Aiguë Bactérienne (Triade de Charcot : Douleur, Fièvre, Ictère)", keywords: ["angiocholite", "triade de charcot", "ictère fébrile", "cpre", "ceftriaxone métronidazole"] }
    ]
  },
  {
    masterTitle: "Pancréatite Aiguë",
    specialty: "Gastro-entérologie",
    keywords: ["pancréatite", "lipase", "balthazar", "alcool", "lithiase"],
    subCats: [
      { id: "4.1", title: "Pancréatite Aiguë Bénigne / Œdémateuse (Lipase > 3N, Remplissage)", keywords: ["pancréatite bénigne", "lipasémie", "jeûne", "remplissage cristalloïdes"] },
      { id: "4.2", title: "Pancréatite Aiguë Nécrosante Sévère (Score Balthazar, Défaillances)", keywords: ["pancréatite nécrosante", "score balthazar", "scanner 72h", "réanimation"] }
    ]
  },
  {
    masterTitle: "Pathologies Proctologiques & Anales",
    specialty: "Gastro-entérologie",
    keywords: ["hémorroïdes", "thrombose hémorroïdaire", "fissure anale", "abcès anal", "daflon"],
    subCats: [
      { id: "5.1", title: "Crise Hémorroïdaire Congestive Simple (Daflon 6cp/j + Topiques)", keywords: ["crise hémorroïdaire", "daflon", "titannoréine", "veinotonique"] },
      { id: "5.2", title: "Thrombose Hémorroïdaire Externe Hyperalgique (Incision sous AL)", keywords: ["thrombose hémorroïdaire", "incision anesthésie locale", "tuméfaction bleutée"] },
      { id: "5.3", title: "Fissure Anale Aiguë (Syndrome fissuraire, Douleur post-défécatoire)", keywords: ["fissure anale", "douleur post-défécatoire", "laxatif doux", "anesthésique local"] },
      { id: "5.4", title: "Abcès Péri-Anal & Suppurations (Urgence Drainage Chirurgical)", keywords: ["abcès anal", "abcès péri-anal", "drainage chirurgical"] }
    ]
  },
  {
    masterTitle: "Troubles du Transit & Occlusion Intestinale",
    specialty: "Gastro-entérologie",
    keywords: ["constipation", "fécalome", "occlusion", "macrogol", "niveaux hydro-aériques"],
    subCats: [
      { id: "6.1", title: "Constipation Fonctionnelle de l'Adulte (Laxatifs osmotiques Macrogol)", keywords: ["constipation fonctionnelle", "macrogol", "forlax", "fibres"] },
      { id: "6.2", title: "Fécalome Obstructif du Sujet Âgé (Toucher rectal, Normacol, Évacuation)", keywords: ["fécalome", "toucher rectal", "lavement normacol", "évacuation manuelle"] },
      { id: "6.3", title: "Occlusion Intestinale Aiguë (Arrêt matières/gaz, ASP niveaux hydro-aériques)", keywords: ["occlusion", "arrêt matières et gaz", "niveaux hydro-aériques", "sng"] },
      { id: "6.4", title: "Colopathie Fonctionnelle / Syndrome de l'Intestin Irritable", keywords: ["intestin irritable", "colopathie", "météorisme", "spasfon", "duspatalin"] }
    ]
  },
  {
    masterTitle: "Hépatites Virales & Cytolyse Hépatique",
    specialty: "Gastro-entérologie",
    keywords: ["hépatite b", "hépatite c", "transaminases", "ag hbs", "ictère", "cytolyse"],
    subCats: [
      { id: "7.1", title: "Hépatite Aiguë Virale A (Ictère, Transmission féco-orale, Repos)", keywords: ["hépatite a", "ictère", "transmission féco-orale", "repos"] },
      { id: "7.2", title: "Interprétation Sérologique Hépatite B (Ag HBs, Ac anti-HBs/HBc)", keywords: ["hépatite b", "ag hbs", "ac anti-hbs", "ac anti-hbc", "charge virale"] },
      { id: "7.3", title: "Dépistage & Confirmation Hépatite C (Ac anti-VHC, PCR ARN VHC)", keywords: ["hépatite c", "ac anti-vhc", "pcr vhc", "antiviraux à action directe"] },
      { id: "7.4", title: "Interprétation d'une Cytolyse Isolée (Transaminases ALAT/ASAT > 3N)", keywords: ["cytolyse", "transaminases", "alat", "asat", "stéatose", "médicamenteuse"] }
    ]
  },

  // ── 2. PNEUMOLOGIE ──
  {
    masterTitle: "Asthme & Crise d'Asthme de l'Adulte",
    specialty: "Pneumologie",
    keywords: ["asthme", "crise d'asthme", "salbutamol", "ventoline", "dep", "gina", "aag"],
    subCats: [
      { id: "8.1", title: "Asthme Stable & Traitement de Fond GINA (CSI + LABA / Symbicort)", keywords: ["traitement de fond", "corticostéroïde inhalé", "laba", "symbicort", "contrôle gina"] },
      { id: "8.2", title: "Crise d'Asthme Aiguë Modérée (Ventoline 4-10 bouffées + DEP + Corticoïde oral)", keywords: ["crise légère", "salbutamol", "ventoline 4 bouffées", "dep", "corticoïde oral"] },
      { id: "8.3", title: "Asthme Aigu Grave (AAG / Urgence vitale, Nébulisation Salbutamol+Ipratropium)", keywords: ["asthme aigu grave", "aag", "nébulisation salbutamol ipratropium", "oxygène", "transfert réa"] },
      { id: "8.4", title: "Asthme et Grossesse (Règles de sécurité & Poursuite du traitement)", keywords: ["asthme grossesse", "ventoline grossesse", "maintien traitement"] }
    ]
  },
  {
    masterTitle: "Pneumonie Aiguë Communautaire & Bronchite",
    specialty: "Pneumologie",
    keywords: ["pneumonie", "pac", "bronchite", "crépitants", "amoxicilline", "crb65"],
    subCats: [
      { id: "9.1", title: "Bronchite Aiguë Simple du Sujet Sain (Traitement symptomatique / Pas d'ATB)", keywords: ["bronchite aiguë", "toux", "pas d'antibiotique", "paracétamol", "expectorant"] },
      { id: "9.2", title: "Pneumonie Franche Lobaire Typique (Pneumocoque / Amoxicilline 3g/j 7j)", keywords: ["pneumonie franche", "foyer crépitants", "amoxicilline 3g/j", "amox 7 jours"] },
      { id: "9.3", title: "Pneumonie Atypique du Sujet Jeune (Mycoplasme / Azithromycine)", keywords: ["pneumonie atypique", "mycoplasme", "azithromycine", "clarithromycine"] },
      { id: "9.4", title: "Évaluation Gravité PAC (Score CRB-65 & Hospitalisation Ceftriaxone IV)", keywords: ["crb65", "curb65", "hospitalisation pac", "ceftriaxone iv"] }
    ]
  },
  {
    masterTitle: "Broncho-Pneumopathie Chronique Obstructive (BPCO)",
    specialty: "Pneumologie",
    keywords: ["bpco", "exacerbation bpco", "anthonisen", "bronchodilatateur", "vni"],
    subCats: [
      { id: "10.1", title: "BPCO Stable : Traitement de Fond (LAMA Spiriva / LABA / Sevrage tabac)", keywords: ["bpco stable", "lama", "laba", "tiotropium", "spiriva", "sevrage tabagique"] },
      { id: "10.2", title: "Exacerbation Aiguë de BPCO (Critères d'Anthonisen, Augmentin, Corticoïdes 5j)", keywords: ["exacerbation bpco", "anthonisen", "purulence", "augmentin", "corticothérapie courte"] },
      { id: "10.3", title: "Décompensation Respiratoire Hypercapnique & Indications de la VNI", keywords: ["décompensation", "acidose respiratoire", "vni", "ventilation non invasive"] }
    ]
  },
  {
    masterTitle: "Pleurésies & Pneumothorax Spontané",
    specialty: "Pneumologie",
    keywords: ["pleurésie", "épanchement pleural", "pneumothorax", "ponction pleurale", "exsufflation"],
    subCats: [
      { id: "11.1", title: "Pleurésie Liquidienne : Démarche Diagnostique (Critères Light Transsudat/Exsudat)", keywords: ["pleurésie", "ponction pleurale", "protéines", "critères de light", "exsudat"] },
      { id: "11.2", title: "Pleurésie Purulente / Empyème (Drainage d'urgence & Antibiothérapie IV)", keywords: ["pleurésie purulente", "empyème", "drainage thoracique", "amoxicilline clavulanate"] },
      { id: "11.3", title: "Pneumothorax Spontané Primitif (Exsufflation à l'aiguille vs Drainage)", keywords: ["pneumothorax", "tympanisme", "exsufflation", "drainage thoracique"] },
      { id: "11.4", title: "Hémoptysie Aiguë (Gradation du volume, Scanner thoracique, Embolisation)", keywords: ["hémoptysie", "crachat de sang", "gravité hémoptysie", "scanner thoracique"] }
    ]
  },

  // ── 3. CARDIOLOGIE ──
  {
    masterTitle: "Hypertension Artérielle (HTA)",
    specialty: "Cardiologie",
    keywords: ["hta", "hypertension", "urgence hypertensive", "bithérapie", "iec", "sartan", "amlodipine"],
    subCats: [
      { id: "12.1", title: "HTA Essentielle de Consultation (Bithérapie fixe IEC/ARA2 + Inhibiteur calcique)", keywords: ["hta essentielle", "bithérapie fixe", "iec sartan amlodipine", "mapa", "automesure"] },
      { id: "12.2", title: "Poussée Hypertensive Simple (Sans défaillance viscérale / Repos & Réassurance)", keywords: ["poussée hypertensive", "sans souffrance", "repos", "pas de baisse brutale"] },
      { id: "12.3", title: "Urgence Hypertensive & HTA Maligne (Atteinte viscérale, Nicardipine IV titrée)", keywords: ["urgence hypertensive", "hta maligne", "nicardipine iv", "loxen iv", "souffrance viscérale"] },
      { id: "12.4", title: "HTA Gravidique & Prééclampsie (Méthyldopa Aldomet / Labétalol / Protéinurie)", keywords: ["hta gravidique", "prééclampsie", "aldomet", "méthyldopa", "labétalol", "protéinurie"] },
      { id: "12.5", title: "HTA du Sujet Âgé & HTA Systolique Isolée", keywords: ["sujet âgé", "hta systolique", "diurétique thiazidique", "inhibiteur calcique"] }
    ]
  },
  {
    masterTitle: "Syndromes Coronariens Aigus & Angor",
    specialty: "Cardiologie",
    keywords: ["sca st+", "infarctus", "angor", "troponine", "aspirine", "ticagrelor", "coronarographie"],
    subCats: [
      { id: "13.1", title: "SCA ST+ / Infarctus du Myocarde (Reperfusion < 120 min, Dose de charge Aspegic/Ticagrelor)", keywords: ["sca st+", "infarctus", "onde de pardee", "dose de charge aspirine ticagrelor", "coronarographie"] },
      { id: "13.2", title: "SCA ST- / Angor Instable (Score GRACE, Troponine US, Fondaparinux)", keywords: ["sca non st", "angor instable", "troponine us", "score grace", "fondaparinux"] },
      { id: "13.3", title: "Angor Stable d'Effort (Bêtabloquants, Trinitrine sublinguale, Épreuve d'effort)", keywords: ["angor stable", "bêtabloquant", "trinitrine sublinguale", "épreuve d'effort"] },
      { id: "13.4", title: "Péricardite Aiguë Virale Bénigne (Aspirine forte dose 3g + Colchicine 3 mois)", keywords: ["péricardite", "sus-décalage concave", "sous-décalage pq", "aspirine 3g", "colchicine"] }
    ]
  },
  {
    masterTitle: "Insuffisance Cardiaque & Œdème Aigu du Poumon (OAP)",
    specialty: "Cardiologie",
    keywords: ["insuffisance cardiaque", "oap", "furosémide", "lasilix", "fevg", "crépitants"],
    subCats: [
      { id: "14.1", title: "Œdème Aigu du Poumon Cardiogénique (Furosémide IV + Dérivés Nitrés IV + VNI)", keywords: ["oap", "râles crépitants", "furosémide iv", "lasilix iv", "dérivés nitrés iv", "vni"] },
      { id: "14.2", title: "Insuffisance Cardiaque Chronique à FEVG Réduite (Quadrithérapie Entresto, BB, iSGLT2, Spirono)", keywords: ["ic fégv réduite", "iec sartan entresto", "bêtabloquant", "spironolactone", "isglt2"] },
      { id: "14.3", title: "Décompensation Cardiaque Globale (Prise de poids, OMI, Rétention hydrosodée)", keywords: ["décompensation cardiaque", "omi", "turgescence jugulaire", "diurétique boucle"] }
    ]
  },
  {
    masterTitle: "Troubles du Rythme & Thromboembolie",
    specialty: "Cardiologie",
    keywords: ["fibrillation atriale", "fa", "tvp", "embolie pulmonaire", "aod", "wells"],
    subCats: [
      { id: "15.1", title: "Fibrillation Atriale (Score CHA2DS2-VASc & Anticoagulation AOD Eliquis/Xarelto)", keywords: ["fibrillation atriale", "fa", "cha2ds2-vasc", "aod", "eliquis", "xarelto"] },
      { id: "15.2", title: "Tachycardie Jonctionnelle de Bouveret (Manœuvres vagales & Striadyne / Adénosine IV)", keywords: ["bouveret", "tachycardie jonctionnelle", "manœuvres vagales", "adénosine", "striadyne"] },
      { id: "15.3", title: "Thrombose Veineuse Profonde des Membres Inférieurs (Écho-Doppler & AOD curatif)", keywords: ["tvp", "phlébite", "écho-doppler", "signe de homans", "aod", "hbpm"] },
      { id: "15.4", title: "Embolie Pulmonaire Aiguë (Score Wells, D-Dimères, Angioscanner & Anticoagulation)", keywords: ["embolie pulmonaire", "score de wells", "d-dimères", "angioscanner", "anticoagulation curative"] }
    ]
  },

  // ── 4. INFECTIOLOGIE ──
  {
    masterTitle: "Infections Respiratoires & Angines Aiguës",
    specialty: "Infectiologie",
    keywords: ["angine", "tdr", "streptocoque", "mac-isaac", "amoxicilline", "extencilline", "grippe"],
    subCats: [
      { id: "16.1", title: "Angine Streptococcique à TDR Positif (Amoxicilline 6 jours)", keywords: ["angine", "tdr", "mac isaac", "amoxicilline 6 jours", "streptocoque"] },
      { id: "16.2", title: "Angine Virale & Pharyngite Banale (Traitement antalgique pur / Pas d'ATB)", keywords: ["angine virale", "pharyngite", "paracétamol", "pas d'antibiotique"] },
      { id: "16.3", title: "Prophylaxie du RAA en Algérie (Extencilline / Benzathine Pénicilline IM)", keywords: ["raa", "rhumatisme articulaire aigu", "extencilline", "benzathine pénicilline"] },
      { id: "16.4", title: "Grippe Saisonnière & Prescription Précoce d'Oseltamivir chez le Sujet Fragile", keywords: ["grippe saisonnière", "oseltamivir", "tamiflu 75mg", "paracétamol"] }
    ]
  },
  {
    masterTitle: "Méningites & Sepsis / Choc Septique",
    specialty: "Infectiologie",
    keywords: ["méningite", "purpura fulminans", "sepsis", "choc septique", "ceftriaxone", "qsofa"],
    subCats: [
      { id: "17.1", title: "Méningite Bactérienne & Purpura Fulminans (Ceftriaxone IM immédiate, PL)", keywords: ["méningite", "purpura fulminans", "ceftriaxone im immédiate", "ponction lombaire"] },
      { id: "17.2", title: "Méningite Virale Lymphocytaire Bénigne (Liquide clair, Traitement symptomatique)", keywords: ["méningite virale", "liquide clair", "traitement symptomatique"] },
      { id: "17.3", title: "Sepsis & Choc Septique (Score qSOFA, Remplissage 30ml/kg, Noradrénaline)", keywords: ["sepsis", "choc septique", "qsofa", "lactates", "remplissage", "noradrénaline"] }
    ]
  },
  {
    masterTitle: "Fièvres Endémiques d'Algérie",
    specialty: "Infectiologie",
    keywords: ["brucellose", "typhoïde", "fbm", "paludisme", "tuberculose", "doxycycline"],
    subCats: [
      { id: "18.1", title: "Brucellose Aiguë Septicémique (Sérologie Wright, Doxycycline + Rifampicine 6 sem)", keywords: ["brucellose", "sérologie wright", "doxycycline rifampicine", "lait cru"] },
      { id: "18.2", title: "Fièvre Typhoïde (Fièvre en plateau, Tuphos, Ciprofloxacine / Ceftriaxone)", keywords: ["typhoïde", "fièvre en plateau", "dissociation pouls-température", "ciprofloxacine"] },
      { id: "18.3", title: "Fièvre Boutonneuse Méditerranéenne (FBM / Tache noire, Doxycycline 200mg/j)", keywords: ["fbm", "rickettsiose", "tache noire", "doxycycline", "tiques"] },
      { id: "18.4", title: "Paludisme d'Importation (Frottis-Goutte Épaisse, CTA / Artémusate IV si grave)", keywords: ["paludisme", "accès palustre", "goutte épaisse", "artémusate", "cta"] },
      { id: "18.5", title: "Tuberculose Pulmonaire TPM+ (Recherche BK crachats & Quadrithérapie 2RHZE/4RH)", keywords: ["tuberculose", "bk", "rhze", "quadrithérapie antituberculeuse"] }
    ]
  },
  {
    masterTitle: "Infections Sexuellement Transmissibles (IST)",
    specialty: "Infectiologie",
    keywords: ["ist", "écoulement urétral", "syphilis", "extencilline", "chlamydia", "gonocoque"],
    subCats: [
      { id: "19.1", title: "Syndrome d'Écoulement Urétral (Ceftriaxone 1g IM + Azithromycine 2g per os)", keywords: ["écoulement urétral", "urétrite", "ceftriaxone 1g im", "azithromycine 2g per os"] },
      { id: "19.2", title: "Syphilis Primaire & Secondaire (Chancre génital / Extencilline 2.4 M UI IM)", keywords: ["chancre syphilitique", "syphilis", "tpha vdrl", "extencilline"] },
      { id: "19.3", title: "Accident d'Exposition au Sang ou Sexuel (AES / Trithérapie Prophylactique VIH < 48h)", keywords: ["aes", "prophylaxie vih", "trithérapie post-exposition"] }
    ]
  },

  // ── 5. DERMATOLOGIE ──
  {
    masterTitle: "Gale Humaine & Ectoparasitoses",
    specialty: "Dermatologie",
    keywords: ["gale", "sarcopte", "poux", "pédiculose", "ivermectine", "perméthrine", "ascabiol"],
    subCats: [
      { id: "20.1", title: "Gale Commune de l'Adulte (Ivermectine per os 200 µg/kg + Perméthrine topique)", keywords: ["gale commune", "sillons scabieux", "ivermectine stromectol", "perméthrine topique"] },
      { id: "20.2", title: "Gale du Nourrisson & de la Femme Enceinte (Topiques adaptés / Décontamination)", keywords: ["gale nourrisson", "grossesse gale", "traitement adapté", "décontamination literie"] },
      { id: "20.3", title: "Gale Profuse & Hyperkératosique Norvégienne (Sujet âgé / Immunodéprimé)", keywords: ["gale profuse", "gale norvégienne", "croûtes", "isolement"] },
      { id: "20.4", title: "Pédiculose de la Tête (Poux / Lotions Diméticone & Peigne fin)", keywords: ["poux", "pédiculose", "lentes", "lotion diméticone"] }
    ]
  },
  {
    masterTitle: "Infections Cutanées Bactériennes",
    specialty: "Dermatologie",
    keywords: ["impétigo", "érysipèle", "furoncle", "acide fusidique", "amoxicilline", "fasciite"],
    subCats: [
      { id: "21.1", title: "Impétigo Croûteux & Bulleux (Acide fusidique crème vs Augmentin oral)", keywords: ["impétigo", "croûtes mélicériques", "acide fusidique", "fucidine", "amoxicilline clavulanate"] },
      { id: "21.2", title: "Furoncle Simple & Furonculose Récidivante (Décolonisation staphylococcique)", keywords: ["furoncle", "anthrax", "bourbillon", "fucidine", "décolonisation nase"] },
      { id: "21.3", title: "Érysipèle de Jambe (Dermohypodermite bactérienne non nécrosante / Amoxicilline 3g/j)", keywords: ["érysipèle", "bourrelet périphérique", "amoxicilline 3g", "porte d'entrée intertrigo"] },
      { id: "21.4", title: "Dermohypodermite Nécrosante & Fasciite (Urgence Vitale / Débridement chirurgical)", keywords: ["fasciite nécrosante", "crépitation", "anesthésie locale", "chirurgie débridement"] },
      { id: "21.5", title: "Panaris Inflammatoire vs Collecté (Bains Dakin vs Incision chirurgicale)", keywords: ["panaris", "tourniole", "phlegmon gaine", "doigt en crochet", "bains dakin"] }
    ]
  },
  {
    masterTitle: "Dermatoses Érythémato-Squameuses & Allergiques",
    specialty: "Dermatologie",
    keywords: ["eczéma", "dermatite atopique", "psoriasis", "dermocorticoïde", "urticaire"],
    subCats: [
      { id: "22.1", title: "Eczéma de Contact Aigu (Éviction de l'allergène & Dermocorticoïdes classe 2)", keywords: ["eczéma de contact", "suintement", "dermocorticoïde niveau 2", "diprosone"] },
      { id: "22.2", title: "Dermatite Atopique de l'Enfant (Émollients quotidiens + Dermocorticoïdes en poussée)", keywords: ["dermatite atopique", "xérose", "émollient quotidien", "dermocorticoïde poussée"] },
      { id: "22.3", title: "Psoriasis Vulgaire en Plaques (Dermocorticoïde + Dérivé Vitamine D / Daivobet)", keywords: ["psoriasis", "plaques squameuses", "dermocorticoïde calcipotriol", "daivobet"] },
      { id: "22.4", title: "Urticaire Aiguë Simple (Antihistaminiques H1 de 2ème génération / Cétirizine)", keywords: ["urticaire aiguë", "papules prurigineuses", "antihistaminique h1", "cétirizine"] }
    ]
  },
  {
    masterTitle: "Mycoses & Dermatoses Virales",
    specialty: "Dermatologie",
    keywords: ["dermatophytose", "herpès circiné", "teigne", "candidose", "zona", "herpès", "leishmaniose"],
    subCats: [
      { id: "23.1", title: "Dermatophytose de la Peau Glabre & Intertrigo (Herpès circiné / Terbinafine crème)", keywords: ["herpès circiné", "dermatophytose", "bordure active", "terbinafine crème", "éconazole"] },
      { id: "23.2", title: "Teignes du Cuir Chevelu de l'Enfant (Griséofulvine / Terbinafine orale + Éviction)", keywords: ["teigne", "plaque alopécique", "griséofulvine", "terbinafine per os", "examen lampe de wood"] },
      { id: "23.3", title: "Candidoses Cutanéo-Muqueuses (Muguet buccal, Intertrigo des plis / Éconazole)", keywords: ["candidose plis", "muguet buccal", "fond de pli blanc", "nystatine", "bicarbonate"] },
      { id: "23.4", title: "Zona Intercostal & Ophtalmique (Valaciclovir 1g x 3/j précoce, Signe Hutchinson)", keywords: ["zona intercostal", "valaciclovir 1g x 3", "zona ophtalmique", "hutchinson"] },
      { id: "23.5", title: "Leishmaniose Cutanée / Bouton d'Orient (Glucantime intra-lésionnel)", keywords: ["leishmaniose", "bouton d'orient", "glucantime", "infiltration intra-lésionnelle"] }
    ]
  },
  {
    masterTitle: "Brûlures Cutanées & Acné",
    specialty: "Dermatologie",
    keywords: ["brûlure", "wallace", "flammazine", "biafine", "acné", "doxycycline"],
    subCats: [
      { id: "24.1", title: "Brûlures Thermiques Superficielles (1er et 2ème degré superficiel / Biafine, Tulle gras)", keywords: ["brûlure superficielle", "1er degré", "2ème degré", "biafine", "pansement gras", "tulle"] },
      { id: "24.2", title: "Brûlures Profondes & Critères de Transfert aux Grands Brûlés (Règle de Wallace)", keywords: ["brûlure profonde", "3ème degré", "flammazine", "règle de wallace", "transfert grands brûlés"] },
      { id: "24.3", title: "Acné Inflammatoire Papulo-Pustuleuse (Peroxyde de benzoyle + Doxycycline 100mg)", keywords: ["acné inflammatoire", "peroxyde de benzoyle", "doxycycline 100mg", "curacne"] }
    ]
  },

  // ── 6. NÉPHROLOGIE - UROLOGIE ──
  {
    masterTitle: "Infections Urinaires de l'Adulte",
    specialty: "Néphrologie - Urologie",
    keywords: ["cystite", "pyélonéphrite", "pna", "prostatite", "fosfomycine", "ceftriaxone", "ecbu"],
    subCats: [
      { id: "25.1", title: "Cystite Aiguë Simple de la Femme Jeune (Fosfomycine 3g dose unique)", keywords: ["cystite simple", "brûlures mictionnelles", "fosfomycine trométamol", "monuril", "pivmécillinam"] },
      { id: "25.2", title: "Cystite Aiguë Récidivante & Compliquée (ECBU systématique, Nitrofurantoïne)", keywords: ["cystite récidivante", "cystite compliquée", "ecbu", "nitrofurantoïne"] },
      { id: "25.3", title: "Pyélonéphrite Aiguë Simple (PNA ambulatoire / Ciprofloxacine ou C3G)", keywords: ["pna simple", "douleur lombaire", "fièvre", "ceftriaxone", "ciprofloxacine"] },
      { id: "25.4", title: "Pyélonéphrite Grave / Obstructive sur Lithiase (Urgence Drainage JJ & Sepsis)", keywords: ["pna grave", "pna compliquée", "hospitalisation", "obstacle", "sepsis urinaire"] },
      { id: "25.5", title: "Prostatite Aiguë Bactérienne de l'Homme (Toucher rectal douloureux, ATB 14-21j)", keywords: ["prostatite", "toucher rectal douloureux", "fièvre urinaire homme", "fluoroquinolone"] },
      { id: "25.6", title: "Infection Urinaire & Bactériurie chez la Femme Enceinte (Dépistage mensuel)", keywords: ["grossesse infection urinaire", "bactériurie asymptomatique", "amoxicilline grossesse"] }
    ]
  },
  {
    masterTitle: "Lithiase Urinaire & Troubles Mictionnels de l'Homme",
    specialty: "Néphrologie - Urologie",
    keywords: ["colique néphrétique", "lithiase urinaire", "hbp", "rau", "globe vésical", "tamsulosine"],
    subCats: [
      { id: "26.1", title: "Colique Néphrétique Simple (Kétoprofène IV + Spasfon + Restriction hydrique)", keywords: ["colique néphrétique simple", "kétoprofène iv", "ains", "morphine", "tamisage des urines"] },
      { id: "26.2", title: "Colique Néphrétique Compliquée Fébrile / Anurique (Urgence Dérivation JJ)", keywords: ["colique néphrétique fébrile", "rein unique", "anurie", "drainage sonde jj"] },
      { id: "26.3", title: "Hypertrophie Bénigne de la Prostate (HBP symptomatique / Tamsulosine IPSS)", keywords: ["hbp", "adénome", "dysurie", "tamsulosine", "finastéride", "score ipss"] },
      { id: "26.4", title: "Rétention Aiguë d'Urine (Globe vésical / Sondage urinaire vs Cathéter sus-pubien)", keywords: ["rétention aiguë d'urine", "rau", "globe vésical", "sondage urinaire", "cathéter sus-pubien"] }
    ]
  },

  // ── 7. PÉDIATRIE ──
  {
    masterTitle: "Pathologies Respiratoires du Nourrisson & de l'Enfant",
    specialty: "Pédiatrie",
    keywords: ["bronchiolite", "laryngite", "nourrisson", "stridor", "drp", "dexaméthasone"],
    subCats: [
      { id: "27.1", title: "Bronchiolite Aiguë Simple du Nourrisson (DRP sérum phy, Fractionnement)", keywords: ["bronchiolite", "nourrisson", "wheezing", "drp", "fractionnement", "score de wang"] },
      { id: "27.2", title: "Critères d'Hospitalisation de la Bronchiolite (< 6 semaines, Tirage, SpO2 < 92%)", keywords: ["hospitalisation nourrisson", "apnées", "cyanose", "spO2 < 92%"] },
      { id: "27.3", title: "Laryngite Aiguë Sous-Glottique (Toux aboyante, Stridor / Dexaméthasone orale)", keywords: ["laryngite aiguë", "stridor", "toux aboyante", "dexaméthasone orale", "célestène"] },
      { id: "27.4", title: "Asthme du Nourrisson & de l'Enfant (Chambre d'inhalation Babyhaler, Fluticasone)", keywords: ["enfant asthme", "nourrisson", "chambre d'inhalation", "babyhaler", "fluticasone"] }
    ]
  },
  {
    masterTitle: "Urgences & Soins Courants du Nourrisson",
    specialty: "Pédiatrie",
    keywords: ["gea", "sro", "convulsion fébrile", "érythème fessier", "rachitisme", "fièvre 3 mois"],
    subCats: [
      { id: "28.1", title: "Gastro-Entérite Aiguë & Prescription des SRO (Solutions de Réhydratation Orale)", keywords: ["gea", "sro", "adiaril", "ges45", "réhydratation orale"] },
      { id: "28.2", title: "Déshydratation Aiguë du Nourrisson (Perte de poids > 10%, Remplissage IV)", keywords: ["déshydratation", "perte de poids > 10%", "pli cutané", "remplissage iv"] },
      { id: "28.3", title: "Convulsions Fébriles Simples (Crise < 15 min, Diazépam intra-rectal si > 5 min)", keywords: ["convulsion fébrile simple", "diazépam intra-rectal", "valium", "paracétamol"] },
      { id: "28.4", title: "Fièvre Isolée du Nourrisson < 3 mois (Bilan septique systématique & Hospitalisation)", keywords: ["fièvre < 3 mois", "bilan septique", "pl", "hémoculture", "hospitalisation"] },
      { id: "28.5", title: "Prévention Systématique du Rachitisme en Algérie (Vitamine D3 à M1 et M6)", keywords: ["rachitisme", "vitamine d3", "dose de charge 200000", "prévention systématique"] }
    ]
  },

  // ── 8. ORL & STOMATOLOGIE ──
  {
    masterTitle: "Otites Aiguës & Affections Naso-Sinusiennes",
    specialty: "ORL & Stomatologie",
    keywords: ["oma", "otite externe", "sinusite", "épistaxis", "amoxicilline", "tamponnement"],
    subCats: [
      { id: "29.1", title: "Otite Moyenne Aiguë Purulente de l'Enfant (Amoxicilline 80-90 mg/kg/j 8j)", keywords: ["oma purulente", "tympan bombé", "amoxicilline 80mg/kg", "otalgie fébrile"] },
      { id: "29.2", title: "Otite Externe Aiguë de Baignade (Gouttes auriculaires ATB Polydexa)", keywords: ["otite externe", "douleur au tragus", "gouttes auriculaires", "polydexa", "otefa"] },
      { id: "29.3", title: "Sinusite Maxillaire Purulente (Amoxicilline-Clavulanate + Lavages salins)", keywords: ["sinusite maxillaire", "douleur sous-orbitaire unilatérale", "augmentin", "lavages salins"] },
      { id: "29.4", title: "Épistaxis Antérieure vs Postérieure (Compression bidigitale, Mèche hémostatique)", keywords: ["épistaxis", "saignement de nez", "compression bidigitale", "mèche hémostatique", "tamponnement"] },
      { id: "29.5", title: "Abcès Dentaire Aigu & Rage de Dent (Amoxicilline + Métronidazole / Rodogyl)", keywords: ["abcès dentaire", "rage de dent", "cellulite dentaire", "rodogyl", "amoxicilline métronidazole"] }
    ]
  },

  // ── 9. OPHTALMOLOGIE ──
  {
    masterTitle: "L'Œil Rouge & Urgences Ophtalmologiques",
    specialty: "Ophtalmologie",
    keywords: ["conjonctivite", "kératite", "gafa", "fluorescéine", "œil rouge", "chalazion"],
    subCats: [
      { id: "30.1", title: "Conjonctivite Bactérienne, Virale & Allergique (Collyres antiseptiques/ATB)", keywords: ["conjonctivite", "œil rouge non douloureux", "sécrétions purulentes", "collyre antiseptique", "rifamycine"] },
      { id: "30.2", title: "Kératite Aiguë & Ulcère de Cornée (Test Fluorescéine / Contre-indication Corticoïdes)", keywords: ["kératite", "ulcère cornéen", "fluorescéine", "arborisation herpétique", "contre-indication corticoïde"] },
      { id: "30.3", title: "Glaucome Aigu par Fermeture de l'Angle (GAFA / Urgence Diamox IV + Pilocarpine)", keywords: ["gafa", "glaucome aigu", "semi-mydriase aréflexique", "œil dur", "diamox iv", "mannitol"] },
      { id: "30.4", title: "Chalazion & Orgelet Palpébral (Compresses chaudes + Pommade corticoïde-ATB)", keywords: ["chalazion", "orgelet", "glande de meibomius", "compresses chaudes", "pommade corticoïde atb"] }
    ]
  },

  // ── 10. NEUROLOGIE & PSYCHIATRIE ──
  {
    masterTitle: "Pathologies Cérébro-Vasculaires & Céphalées",
    specialty: "Neurologie & Psychiatrie",
    keywords: ["avc ischémique", "ait", "migraine", "céphalée de tension", "fast", "triptan"],
    subCats: [
      { id: "31.1", title: "AVC Ischémique Aigu & Score FAST (Alerte filière Thrombolyse < 4h30)", keywords: ["avc ischémique", "fast", "déficit moteur brutal", "thrombolyse", "scanner irm en urgence"] },
      { id: "31.2", title: "Accident Ischémique Transitoire (AIT / Score ABCD2 & Bilan étiologique d'urgence)", keywords: ["ait", "score abcd2", "déficit régressif", "aspirine", "écho-doppler carotides"] },
      { id: "31.3", title: "Crise de Migraine Aiguë (AINS / Triptans en 1ère intention + Traitement de fond)", keywords: ["migraine aiguë", "hémicrânie", "sumatriptan", "zolmitriptan", "kétoprofène"] },
      { id: "31.4", title: "Céphalée de Tension & Drapeaux Rouges (Horton, Hémorragie méningée, HTIC)", keywords: ["céphalée de tension", "horton", "artère temporale", "fièvre", "raideur de nuque"] }
    ]
  },
  {
    masterTitle: "Radiculalgies & Crises Convulsives",
    specialty: "Neurologie & Psychiatrie",
    keywords: ["sciatique", "cruralgie", "queue de cheval", "épilepsie", "état de mal", "lasegue"],
    subCats: [
      { id: "32.1", title: "Lombosciatique Aiguë Commune L5/S1 (Signe de Lasègue, AINS + Antalgiques)", keywords: ["sciatique", "signe de lasègue", "l5", "s1", "ains", "paracétamol codéine", "repos actif"] },
      { id: "32.2", title: "Syndrome de la Queue de Cheval (Anesthésie en selle, Globe / Urgence chirurgicale)", keywords: ["queue de cheval", "anesthésie en selle", "globe urinaire", "déficit moteur < 3/5", "irm en urgence"] },
      { id: "32.3", title: "État de Mal Épileptique (> 5 min / Clonazépam IV ou Diazépam en Réanimation)", keywords: ["état de mal épileptique", "clonazépam", "rivotril iv", "valium iv", "réanimation"] },
      { id: "32.4", title: "Crise d'Angoisse Aiguë & Attaque de Panique (Contrôle respiratoire & Anxiolyse)", keywords: ["attaque de panique", "crise d'angoisse", "hyperventilation", "rassurer", "alprazolam"] }
    ]
  },

  // ── 11. URGENCES & RÉANIMATION ──
  {
    masterTitle: "Arrêt Cardio-Respiratoire (ACR) & Réanimation",
    specialty: "Urgences & Réanimation",
    keywords: ["arrêt cardio-respiratoire", "acr", "massage cardiaque", "défibrillateur", "dsa", "adrénaline"],
    subCats: [
      { id: "33.1", title: "ACR de l'Adulte : RCP de Base & Défibrillateur (30:2 / DSA)", keywords: ["acr adulte", "massage cardiaque", "30:2", "défibrillateur dsa", "dae"] },
      { id: "33.2", title: "ACR avec Rythme Choquable (FV / Choc électrique + Adrénaline 1mg + Cordarone)", keywords: ["fv choquable", "choc électrique externe", "adrénaline 1mg", "cordarone 300mg"] },
      { id: "33.3", title: "ACR Pédiatrique (5 insufflations initiales puis 15:2 & Adrénaline 10 µg/kg)", keywords: ["acr pédiatrique", "5 insufflations", "15:2", "adrénaline 10mcg/kg"] }
    ]
  },
  {
    masterTitle: "Anaphylaxie & Choc Anaphylactique",
    specialty: "Urgences & Réanimation",
    keywords: ["choc anaphylactique", "adrénaline 0.5mg im", "anaphylaxie", "allergie"],
    subCats: [
      { id: "34.1", title: "Choc Anaphylactique Grade III/IV (Adrénaline IM 0.5 mg cuisse immédiate)", keywords: ["choc anaphylactique", "adrénaline 0.5mg im", "face antérolatérale cuisse", "remplissage"] },
      { id: "34.2", title: "Prescription du Stylo Auto-Injecteur (Anapen / Epipen) & Trousse d'Urgence", keywords: ["anapen", "epipen", "stylo auto-injecteur", "trousse d'urgence"] }
    ]
  },
  {
    masterTitle: "Comas & Urgences Métaboliques Aiguës",
    specialty: "Urgences & Réanimation",
    keywords: ["hypoglycémie sévère", "acidocétose", "hyperkaliémie", "coma glasgow", "g30 iv"],
    subCats: [
      { id: "35.1", title: "Coma Non Traumatique (Score de Glasgow, Dextro & Intubation si Glasgow ≤ 8)", keywords: ["coma", "score de glasgow", "glasgow <= 8 intubation", "glycémie capillaire", "naloxone"] },
      { id: "35.2", title: "Hypoglycémie Sévère du Diabétique (Sérum Glucosé G30% IV / Glucagon IM)", keywords: ["hypoglycémie sévère", "g30 iv", "glucagon im", "resucrage"] },
      { id: "35.3", title: "Acidocétose Diabétique (Réhydratation Sérum Salé 0.9% + Insuline IV titrée)", keywords: ["acidocétose", "haleine cétonique", "respiration kussmaul", "réhydratation salée", "insuline ivse"] },
      { id: "35.4", title: "Hyperkaliémie Menaçante (Signes ECG, Gluconate de Calcium IV, Insuline-Glucose)", keywords: ["hyperkaliémie", "ondes t pointues", "gluconate de calcium", "insuline glucose", "kayexalate"] }
    ]
  },
  {
    masterTitle: "Envenimations & Intoxications Aiguës",
    specialty: "Urgences & Réanimation",
    keywords: ["scorpion grade i", "envenimation scorpion", "vipère", "paracétamol rumack", "monoxyde carbone"],
    subCats: [
      { id: "36.1", title: "Piqûre de Scorpion Grade I (Douleur locale isolée / Surveillance 4h)", keywords: ["scorpion grade i", "douleur locale", "glace", "surveillance 4h", "antalgique"] },
      { id: "36.2", title: "Envenimation Scorpionique Grade II & III (Signes généraux / SAS / Dobutamine en Réa)", keywords: ["envenimation scorpion", "grade ii iii", "sérum antiscorpionique", "sas", "dobutamine"] },
      { id: "36.3", title: "Morsure de Vipère (Gradation de l'œdème & Sérum antivenimeux / Pas de garrot)", keywords: ["morsure vipère", "sérum antivenimeux", "œdème extensif", "garrot contre-indiqué"] },
      { id: "36.4", title: "Intoxication Aiguë au Paracétamol (Nomogramme Rumack & N-Acétylcystéine IV)", keywords: ["intoxication paracétamol", "rumack", "n-acétylcystéine", "fluimucil iv"] },
      { id: "36.5", title: "Intoxication au Monoxyde de Carbone (Oxygène 100% masque haute concentration & Caisson)", keywords: ["monoxyde de carbone", "co", "céphalée nausée", "oxygénothérapie haut débit", "caisson hyperbare"] },
      { id: "36.6", title: "Morsure Animale & Prévention de la Rage (Lavage eau savonneuse + Protocole VAR / SAT)", keywords: ["morsure chien", "rage", "protocole pasteur", "var", "sat"] }
    ]
  },

  // ── 12. RHUMATOLOGIE & TRAUMATOLOGIE ──
  {
    masterTitle: "Rhumatismes Inflammatoires & Microcristallins",
    specialty: "Rhumatologie & Traumatologie",
    keywords: ["goutte", "colchicine 1mg", "arthrite septique", "allopurinol", "acide urique"],
    subCats: [
      { id: "37.1", title: "Accès Aigu de Goutte (Colchicine 1mg + AINS + Glaçage)", keywords: ["goutte", "colchicine 1mg", "accès goutteux", "ains", "glaçage"] },
      { id: "37.2", title: "Traitement Hypo-Uricémiant de Fond (Allopurinol / Cible uricémie < 360 µmol/L)", keywords: ["allopurinol", "fébuxostat", "cible uricémie < 360", "régime hypopurinique"] },
      { id: "37.3", title: "Arthrite Septique Aiguë (Urgence Ponction articulaire purulente, Lavage & ATB IV)", keywords: ["arthrite septique", "articulation rouge chaude fébrile", "ponction liquide purulent", "ceftriaxone iv"] }
    ]
  },
  {
    masterTitle: "Pathologies Dégénératives & Traumatologie Courante",
    specialty: "Rhumatologie & Traumatologie",
    keywords: ["lombalgie", "lumbago", "gonarthrose", "tendinopathie épaule", "entorse cheville", "scaphoïde"],
    subCats: [
      { id: "38.1", title: "Lumbago Aigu d'Effort (Maintien de l'activité physique, AINS + Myorelaxant)", keywords: ["lombalgie aiguë", "lumbago", "ains", "paracétamol", "maintien activité"] },
      { id: "38.2", title: "Gonarthrose / Coxarthrose en Poussée (AINS courte durée + Infiltration corticoïde)", keywords: ["gonarthrose", "coxarthrose", "douleur mécanique", "infiltration acide hyaluronique corticoïde"] },
      { id: "38.3", title: "Tendinopathie de la Coiffe des Rotateurs (Conflit sous-acromial / AINS + Kiné)", keywords: ["épaule douloureuse", "tendinopathie coiffe", "conflit sous-acromial", "néer", "kinésithérapie"] },
      { id: "38.4", title: "Entorse Externe de Cheville (Critères d'Ottawa, Protocole RICE & Attelle Aircast)", keywords: ["entorse cheville", "critères d'ottawa", "protocole rice", "attelle aircast", "glaçage"] },
      { id: "38.5", title: "Suspicion de Fracture du Scaphoïde (Tabatière anatomique, Attelle manchette, Radio J10)", keywords: ["scaphoïde", "tabatière anatomique", "attelle manchette", "radio à j10"] }
    ]
  },

  // ── 13. GYNÉCOLOGIE - OBSTÉTRIQUE ──
  {
    masterTitle: "Urgences Gynécologiques & Grossesse du 1er Trimestre",
    specialty: "Gynécologie - Obstétrique",
    keywords: ["geu", "grossesse extra-utérine", "fausse couche", "salpingite", "métrorragie"],
    subCats: [
      { id: "39.1", title: "Suspicion de Grossesse Extra-Utérine (GEU / Métrorragies, Douleurs & Bêta-HCG)", keywords: ["geu", "grossesse extra-utérine", "bêta-hcg", "échographie endovaginale", "méthotrexate"] },
      { id: "39.2", title: "Menace de Fausse Couche Spontanée (Métrorragies à col fermé / Échographie vitalité)", keywords: ["fausse couche", "avortement spontané", "métrorragie 1er trimestre", "repos", "surveillance"] },
      { id: "39.3", title: "Salpingite Aiguë / Infection Génitale Haute (Ceftriaxone 1g IM + Doxycycline + Flagyl 14j)", keywords: ["salpingite", "infection génitale haute", "ceftriaxone doxycycline métronidazole"] }
    ]
  },
  {
    masterTitle: "Contraception, Vaginites & Santé de la Femme",
    specialty: "Gynécologie - Obstétrique",
    keywords: ["contraception", "pilule", "norlevo", "leucorrhée", "mycose vaginale", "dysménorrhée"],
    subCats: [
      { id: "40.1", title: "Prescription Initiale d'une Contraception Oestro-Progestative (Bilan pré-thrombotique)", keywords: ["contraception régulière", "pilule oestro-progestative", "contre-indications tabac"] },
      { id: "40.2", title: "Contraception d'Urgence Hormonale (Norlevo < 72h vs EllaOne < 120h)", keywords: ["contraception d'urgence", "pilule du lendemain", "lévonorgestrel", "norlevo", "ellaone"] },
      { id: "40.3", title: "Mycose Vaginale & Vaginose Bactérienne (Éconazole ovule LP vs Métronidazole per os)", keywords: ["mycose vaginale", "candida", "prurit vulvaire", "éconazole ovule", "vaginose bactérienne"] },
      { id: "40.4", title: "Dysménorrhée Primaire (AINS acide méfénamique / Ponstyl en début de règles)", keywords: ["dysménorrhée", "règles douloureuses", "acide méfénamique", "ponstyl", "antispasmodique"] },
      { id: "40.5", title: "Mastite Aiguë du Post-Partum (Maintien de l'allaitement + Augmentin si fièvre)", keywords: ["mastite", "engorgement mammaire", "maintien allaitement", "amoxicilline clavulanate"] }
    ]
  },

  // ── 14. ENDOCRINOLOGIE ──
  {
    masterTitle: "Diabète de Type 2 de l'Adulte",
    specialty: "Endocrinologie",
    keywords: ["diabète type 2", "metformine 500mg 850mg 1000mg", "isglt2", "hba1c", "acidocétose"],
    subCats: [
      { id: "41.1", title: "Mise en Route de la Metformine en Titration Progressive (500mg -> 2000mg/j)", keywords: ["diabète type 2", "metformine 500mg 850mg 1000mg", "objectif hba1c", "règles hygiéno-diététiques"] },
      { id: "41.2", title: "Bithérapie / Trithérapie du DT2 (iSGLT2 Jardiance/Forxiga ou aGLP-1 Ozempic)", keywords: ["bithérapie dt2", "isglt2", "jardiance", "forxiga", "aglp1", "ozempic"] },
      { id: "41.3", title: "Surveillance Annuelle du Diabétique (Microalbuminurie, ECG, Fond d'œil, Pieds)", keywords: ["bilan diabète", "fond d'œil", "microalbuminurie", "examen des pieds", "monofilament"] },
      { id: "41.4", title: "Pied Diabétique Infecté & Mal Perforant (Décharge, Soins locaux, Antibiothérapie)", keywords: ["pied diabétique", "mal perforant", "décharge", "amoxicilline acide clavulanique"] }
    ]
  },
  {
    masterTitle: "Pathologies Thyroïdiennes & Métaboliques",
    specialty: "Endocrinologie",
    keywords: ["hypothyroïdie", "hyperthyroïdie", "basedow", "lévothyrox", "vitamine d", "dyslipidémie"],
    subCats: [
      { id: "42.1", title: "Hypothyroïdie Primaire (Lévothyroxine en titration progressive & Contrôle TSH)", keywords: ["hypothyroïdie", "tsh élevée", "lévothyrox", "lévothyroxine 25 50 100"] },
      { id: "42.2", title: "Hyperthyroïdie & Maladie de Basedow (Néomercazole + Bêtabloquant Propranolol)", keywords: ["hyperthyroïdie", "basedow", "tsh effondrée", "néomercazole", "propranolol"] },
      { id: "42.3", title: "Carence en Vitamine D3 (Uvedose 100 000 UI dose de charge puis entretien)", keywords: ["carence vitamine d", "25-oh-vitamine d", "uvedose 100000", "dose de charge"] },
      { id: "42.4", title: "Dyslipidémies & Prévention Cardiovasculaire (Statines Atorvastatine / Cibles LDL-c)", keywords: ["dyslipidémie", "cholestérol ldl", "atorvastatine", "rosuvastatine", "score cardiovasculaire"] }
    ]
  },

  // ── 15. HÉMATOLOGIE ──
  {
    masterTitle: "Anémies & Troubles Hématologiques",
    specialty: "Hématologie",
    keywords: ["anémie ferriprive", "tardyferon", "anémie macrocytaire", "vitamine b12", "thrombopénie"],
    subCats: [
      { id: "43.1", title: "Anémie Microcytaire Ferriprive (Tardyferon 100-200mg/j + Bilan étiologique)", keywords: ["anémie ferriprive", "vgm bas", "ferritine effondrée", "tardyferon", "saignement digestif"] },
      { id: "43.2", title: "Anémie Macrocytaire par Carence B12 / Folates (Dosage sérique & Vit B12 IM)", keywords: ["anémie macrocytaire", "vitamine b12", "folates b9", "maladie de biermer"] },
      { id: "43.3", title: "Démarche Diagnostique devant une Thrombopénie Isolée (Contrôle tube citraté, Purpura)", keywords: ["thrombopénie", "plaquettes basses", "tube citraté", "purpura"] }
    ]
  },

  // ── 16. THÉRAPEUTIQUE & MÉDECINE LÉGALE ──
  {
    masterTitle: "Bonnes Pratiques de Prescription & Législation",
    specialty: "Thérapeutique & Législation",
    keywords: ["ains", "paliers oms", "crat", "certificat cbu", "accident travail"],
    subCats: [
      { id: "44.1", title: "Utilisation Sécurisée des AINS & Paliers 1, 2, 3 de l'OMS pour la Douleur", keywords: ["ains", "règles prescription ains", "ipp protection", "paliers oms", "paracétamol"] },
      { id: "44.2", title: "Prescription Médicamenteuse Pendant la Grossesse & Allaitement (Guide CRAT)", keywords: ["médicaments grossesse", "crat", "tératogénicité", "molécules autorisées"] },
      { id: "44.3", title: "Certificat Médical Initial de Coups et Blessures (CBU / Datation & Calcul ITT)", keywords: ["certificat cbu", "coups et blessures", "description lésions", "itt", "réquisitions"] },
      { id: "44.4", title: "Certificats d'Accident du Travail (Volets initial, prolongation & rechute)", keywords: ["accident du travail", "certificat at", "imputabilité", "soins"] }
    ]
  }
];

function evaluateReadiness(textData) {
  const text = textData.toLowerCase();
  let score = 0;
  const breakdown = { definition: 0, redFlags: 0, dosages: 0, pediatrics: 0, nomenclature: 0 };

  let def = 0;
  if (/définition|definition|physiopathologie|notion/i.test(text)) def += 5;
  if (/diagnostic|clinique|symptômes|symptomes|signes fonctionnels|examen/i.test(text)) def += 6;
  if (/diagnostic différentiel|étiologie|etiologie|causes|facteurs de risque/i.test(text)) def += 5;
  if (/formes cliniques|classification|stades/i.test(text)) def += 4;
  breakdown.definition = Math.min(20, def);
  score += breakdown.definition;

  let red = 0;
  if (/gravité|gravite|drapeau rouge|drapeaux rouges|alerte|danger/i.test(text)) red += 7;
  if (/urgence|hospitalisation|réanimation|reanimation|transfert|soins intensifs/i.test(text)) red += 7;
  if (/choc|détresse|detresse|cyanose|hypotension|tachycardie|sepsis|dyspnée sévère|coma|confusion/i.test(text)) red += 6;
  if (/score|qsofa|crb65|curb65|wells|fine|glasgow|nyha|ottawa/i.test(text)) red += 5;
  breakdown.redFlags = Math.min(25, red);
  score += breakdown.redFlags;

  let dose = 0;
  const dosageMatches = text.match(/\b\d+(?:[\.,]\d+)?\s*(?:mg|g|µg|mcg|ui|ml|mg\/kg|g\/j|mg\/j|ampoules?|cp|comprimés?|gélules?|sachets?|gouttes?)\b/gi) || [];
  if (dosageMatches.length >= 10) dose += 10;
  else if (dosageMatches.length >= 4) dose += 7;
  else if (dosageMatches.length >= 1) dose += 4;

  if (/\b(?:\d+\s*(?:fois|x)\s*\/\s*j(?:our)?|toutes les \d+\s*h|par jour|matin et soir)\b/i.test(text)) dose += 5;
  if (/\b(?:pendant \d+\s*(?:jours?|semaines?|mois)|durée \d+|cure de \d+)\b/i.test(text)) dose += 5;
  if (/première intention|1ère intention|deuxième intention|2ème intention|alternative|en cas d'allergie/i.test(text)) dose += 5;
  breakdown.dosages = Math.min(25, dose);
  score += breakdown.dosages;

  let ped = 0;
  if (/enfant|nourrisson|pédiatr|pediatr|mg\/kg\/j|chez l'enfant/i.test(text)) ped += 6;
  if (/femme enceinte|grossesse|allaitement|tératogène|crat/i.test(text)) ped += 5;
  if (/sujet âgé|personne âgée|insuffisance rénale|clairance|dfg|adaptation posologique/i.test(text)) ped += 4;
  breakdown.pediatrics = Math.min(15, ped);
  score += breakdown.pediatrics;

  let nom = 0;
  const dciList = ['paracétamol', 'amoxicilline', 'acide clavulanique', 'ibuprofène', 'kétoprofène', 'ceftriaxone', 'ciprofloxacine', 'azithromycine', 'métronidazole', 'oméprazole', 'pantoprazole', 'salbutamol', 'prednisolone', 'méthylprednisolone', 'dexaméthasone', 'tramadol', 'morphine', 'lopéramide', 'phloroglucinol', 'spasfon', 'doxycycline', 'valaciclovir', 'aciclovir', 'perméthrine', 'ivermectine', 'artémusate', 'furosémide', 'spironolactone', 'amlodipine', 'ramipril', 'losartan', 'bisoprolol', 'clopidogrel', 'aspirine', 'colchicine', 'allopurinol', 'metformine', 'lévothyroxine', 'tamsulosine', 'fosfomycine', 'diazépam', 'adénosine'];
  let dciCount = 0;
  for (const d of dciList) {
    if (text.includes(d)) dciCount++;
  }
  if (dciCount >= 5) nom += 15;
  else if (dciCount >= 3) nom += 10;
  else if (dciCount >= 1) nom += 5;
  breakdown.nomenclature = Math.min(15, nom);
  score += breakdown.nomenclature;

  let grade = 'C';
  let badge = '🔴 Grade C';
  let action = '🔴 À Éditer / Guideline Externe';
  if (score >= 85) {
    grade = 'A';
    badge = '🟢 Grade A';
    action = '🟢 Prêt Automatique (Riche)';
  } else if (score >= 60) {
    grade = 'B';
    badge = '🟡 Grade B';
    action = '🟡 Enrichissement Léger (Posologies)';
  }

  return { score, grade, badge, action, breakdown, dosageCount: dosageMatches.length, dciCount };
}

async function runScan() {
  console.log('🚀 Loading 77 cached reference books in RAM...');
  const cacheFiles = fs.readdirSync(CACHE_DIR).filter(f => f.endsWith('.json'));
  const books = [];
  let totalPages = 0;
  for (const f of cacheFiles) {
    try {
      const d = JSON.parse(fs.readFileSync(path.join(CACHE_DIR, f), 'utf8'));
      const pages = Array.isArray(d.pages) ? d.pages : [];
      totalPages += pages.length;
      books.push({
        file: d.pdf || f.replace(/\.json$/, ''),
        quality: d.quality || 'offline',
        pages: pages.map((p, idx) => ({ page: p.page || idx + 1, content: p.content || p.text || '' }))
      });
    } catch (_) {}
  }

  console.log(`Loaded ${books.length} books (${totalPages} pages). Scanning authentic Master + Sub-CAT catalog...`);

  const results = [];
  let allSubCats = [];

  for (const master of CLINICAL_CATALOG) {
    const masterMatches = [];
    let masterCombinedText = '';

    for (const b of books) {
      const hitPages = [];
      for (const p of b.pages) {
        const text = p.content.toLowerCase();
        if (master.keywords.some(kw => text.includes(kw.toLowerCase())) && p.content.trim().length > 40) {
          hitPages.push(p.page);
          masterCombinedText += '\n\n' + p.content;
        }
      }

      if (hitPages.length > 0) {
        hitPages.sort((a, b) => a - b);
        const ranges = [];
        let rStart = hitPages[0];
        let rEnd = hitPages[0];
        for (let i = 1; i < hitPages.length; i++) {
          if (hitPages[i] === rEnd + 1) {
            rEnd = hitPages[i];
          } else {
            ranges.push(rStart === rEnd ? `P.${rStart}` : `P.${rStart}-${rEnd}`);
            rStart = hitPages[i];
            rEnd = hitPages[i];
          }
        }
        ranges.push(rStart === rEnd ? `P.${rStart}` : `P.${rStart}-${rEnd}`);

        masterMatches.push({
          book: b.file,
          quality: b.quality,
          pageCount: hitPages.length,
          pageRanges: ranges.join(', ')
        });
      }
    }

    masterMatches.sort((a, b) => b.pageCount - a.pageCount);
    const masterReadiness = evaluateReadiness(masterCombinedText);

    // Evaluate Sub-CATs
    const evaluatedSubCats = [];
    for (const sub of master.subCats) {
      let subCombinedText = '';
      const subMatches = [];

      for (const b of books) {
        const subHitPages = [];
        for (const p of b.pages) {
          const text = p.content.toLowerCase();
          if (sub.keywords.some(kw => text.includes(kw.toLowerCase())) && p.content.trim().length > 30) {
            subHitPages.push(p.page);
            subCombinedText += '\n\n' + p.content;
          }
        }
        if (subHitPages.length > 0) {
          subMatches.push({ book: b.file, pagesCount: subHitPages.length });
        }
      }
      subMatches.sort((a, b) => b.pagesCount - a.pagesCount);
      const subReadiness = evaluateReadiness(subCombinedText || masterCombinedText);

      const subEntry = {
        id: sub.id,
        masterTitle: master.masterTitle,
        specialty: master.specialty,
        title: sub.title,
        readiness: subReadiness,
        topSource: subMatches.length > 0 ? subMatches[0].book : (masterMatches.length > 0 ? masterMatches[0].book : '-')
      };

      evaluatedSubCats.push(subEntry);
      allSubCats.push(subEntry);
    }

    results.push({
      masterTitle: master.masterTitle,
      specialty: master.specialty,
      subCatsCount: master.subCats.length,
      readiness: masterReadiness,
      sources: masterMatches,
      subCats: evaluatedSubCats
    });
  }

  // Master stats
  const mGradeA = results.filter(r => r.readiness.grade === 'A').length;
  const mGradeB = results.filter(r => r.readiness.grade === 'B').length;
  const mGradeC = results.filter(r => r.readiness.grade === 'C').length;

  // Sub-CAT stats
  const sGradeA = allSubCats.filter(s => s.readiness.grade === 'A').length;
  const sGradeB = allSubCats.filter(s => s.readiness.grade === 'B').length;
  const sGradeC = allSubCats.filter(s => s.readiness.grade === 'C').length;

  console.log('\n═══════════════════════════════════════════════════════════════');
  console.log('🩺 AUTHENTIC CLINICAL MASTER + SUB-CAT CLASSIFICATION');
  console.log('═══════════════════════════════════════════════════════════════');
  console.log(`📊 MASTER CATs (Core Consultation Pathologies) Total: ${results.length}`);
  console.log(`   🟢 Grade A (Gold Standard)   : ${mGradeA} (${Math.round((mGradeA/results.length)*100)}%)`);
  console.log(`   🟡 Grade B (Enrichment Ready): ${mGradeB} (${Math.round((mGradeB/results.length)*100)}%)`);
  console.log(`   🔴 Grade C (Low Density)     : ${mGradeC} (${Math.round((mGradeC/results.length)*100)}%)`);
  console.log(`---------------------------------------------------------------`);
  console.log(`📊 SUB-CATs (Complications, Decompensations & Terrains) Total: ${allSubCats.length}`);
  console.log(`   🟢 Grade A (Prêt Automatique): ${sGradeA} (${Math.round((sGradeA/allSubCats.length)*100)}%)`);
  console.log(`   🟡 Grade B (Enrichissement)  : ${sGradeB} (${Math.round((sGradeB/allSubCats.length)*100)}%)`);
  console.log(`   🔴 Grade C (À Éditer Manuel) : ${sGradeC} (${Math.round((sGradeC/allSubCats.length)*100)}%)`);
  console.log('═══════════════════════════════════════════════════════════════\n');

  // JSON report
  const jsonReport = {
    generatedAt: new Date().toISOString(),
    totalBooks: books.length,
    totalPages,
    masterStats: { total: results.length, gradeA: mGradeA, gradeB: mGradeB, gradeC: mGradeC },
    subCatStats: { total: allSubCats.length, gradeA: sGradeA, gradeB: sGradeB, gradeC: sGradeC },
    taxonomy: results
  };

  fs.writeFileSync(OUTPUT_JSON, JSON.stringify(jsonReport, null, 2), 'utf8');

  // Build Comprehensive Markdown Document
  let md = `# 🗺️ Répertoire Clinique Master CAT & Sub-CATs (Dr. CAT Architecture Médicale)\n\n`;
  md += `> **Matrice de Classification Clinique Authentique (${results.length} Masters de Consultation & ${allSubCats.length} Sub-CATs de Complications / Phénotypes)**\n`;
  md += `> Générée le ${new Date().toLocaleDateString('fr-FR', { day: 'numeric', month: 'long', year: 'numeric' })} par le moteur de densité Dr.CAT.\n\n`;
  md += `---\n\n`;

  md += `## 📊 1. Synthèse de la Gradation Clinique (Double Niveau : Masters & Sous-Profils Réels)\n\n`;
  md += `### A. Vue d'Ensemble des Master CATs (Pathologies Majeures de Consultation — ${results.length} Fiches)\n`;
  md += `| Grade | Nombre | Pourcentage | Signification Clinique |\n`;
  md += `| :---: | :---: | :---: | :--- |\n`;
  md += `| 🟢 **Grade A (Gold Standard)** | **${mGradeA}** | **${Math.round((mGradeA/results.length)*100)}%** | Corpus documentaire ultra-complet dans les 77 livres (Score ≥ 85/100). |\n`;
  md += `| 🟡 **Grade B (Prêt à Générer)** | **${mGradeB}** | **${Math.round((mGradeB/results.length)*100)}%** | Base solide, enrichissement mineur recommandé (Score 60–84/100). |\n`;
  md += `| 🔴 **Grade C (Faible Densité)** | **${mGradeC}** | **${Math.round((mGradeC/results.length)*100)}%** | Données fragmentaires dans le corpus (Score < 60/100). |\n\n`;

  md += `### B. Vue d'Ensemble des Sub-CATs (Complications, Décompensations, Formes Graves & Terrains — ${allSubCats.length} Sous-Profils)\n`;
  md += `| Grade | Nombre | Pourcentage | Statut Opérationnel Pour le Médecin |\n`;
  md += `| :---: | :---: | :---: | :--- |\n`;
  md += `| 🟢 **Grade A** | **${sGradeA}** | **${Math.round((sGradeA/allSubCats.length)*100)}%** | 🟢 **Prêt Automatique** : Données posologiques et diagnostiques riches dans le PDF. |\n`;
  md += `| 🟡 **Grade B** | **${sGradeB}** | **${Math.round((sGradeB/allSubCats.length)*100)}%** | 🟡 **Enrichissement Léger** : Posologies présentes, vérifier posologie pédiatrique/grossesse. |\n`;
  md += `| 🔴 **Grade C** | **${sGradeC}** | **${Math.round((sGradeC/allSubCats.length)*100)}%** | 🔴 **À Éditer / Guide Externe** : Nécessite un PDF dédié ou un ajustement manuel du médecin. |\n\n`;

  md += `---\n\n`;

  md += `## 🩺 2. Répertoire Détaillé des Master CATs & Sub-CATs Classifiés par Spécialité\n\n`;

  const bySpecialty = {};
  for (const r of results) {
    if (!bySpecialty[r.specialty]) bySpecialty[r.specialty] = [];
    bySpecialty[r.specialty].push(r);
  }

  for (const [spec, list] of Object.entries(bySpecialty)) {
    list.sort((a, b) => b.readiness.score - a.readiness.score);
    md += `### 🩺 ${spec} (${list.length} Master CATs — ${list.reduce((acc, i) => acc + i.subCatsCount, 0)} Sub-CATs)\n\n`;

    for (const m of list) {
      const r = m.readiness;
      const gBadge = r.grade === 'A' ? '🟢 **Grade A**' : (r.grade === 'B' ? '🟡 **Grade B**' : '🔴 **Grade C**');
      
      let pSrc = '*(À découper)*';
      let sSrc = '-';
      if (m.sources.length > 0) {
        pSrc = `📄 **${m.sources[0].book}** (${m.sources[0].pageRanges})`;
        if (m.sources.length > 1) {
          sSrc = m.sources.slice(1, 3).map(s => `• ${s.book} (${s.pageRanges})`).join('<br>');
        }
      }

      md += `#### 📌 ${m.masterTitle} — ${gBadge} (${r.score}/100)\n`;
      md += `* **Source Principale** : ${pSrc}\n`;
      if (sSrc !== '-') md += `* **Sources Croisées** : ${sSrc}\n`;
      md += `* **Sous-Profils Cliniques Authentiques (Sub-CATs)** :\n\n`;
      md += `| ID | Titre Médical du Sub-CAT (Complication / Terrain / Variante) | Statut & Grade | Score | Action Requise | Source Recommandée |\n`;
      md += `| :---: | :--- | :---: | :---: | :--- | :--- |\n`;

      for (const sub of m.subCats) {
        const subBadge = sub.readiness.grade === 'A' ? '🟢 **Grade A**' : (sub.readiness.grade === 'B' ? '🟡 **Grade B**' : '🔴 **Grade C**');
        md += `| \`${sub.id}\` | **${sub.title}** | ${subBadge} | **${sub.readiness.score}/100** | ${sub.readiness.action} | 📄 ${sub.topSource} |\n`;
      }
      md += `\n---\n\n`;
    }
  }

  // Section 3: Focused Checklist of Grade C Sub-CATs
  const gradeCSubCats = allSubCats.filter(s => s.readiness.grade === 'C');
  gradeCSubCats.sort((a, b) => a.readiness.score - b.readiness.score);

  md += `## 🔴 3. Checklist Prioritaire des Sub-CATs Grade C (Pour Édition Manuelle ou PDF Dédié)\n\n`;
  md += `> Ces **${gradeCSubCats.length} sous-profils** ont un score < 60/100 dans le corpus actuel. Vous pouvez soit les générer avec enrichissement IA, soit fournir un guide PDF complémentaire :\n\n`;
  md += `| ID | Spécialité | Master CAT | Titre du Sub-CAT | Score | Action Recommandée |\n`;
  md += `| :---: | :--- | :--- | :--- | :---: | :--- |\n`;

  for (const c of gradeCSubCats) {
    md += `| \`${c.id}\` | **${c.specialty}** | ${c.masterTitle} | **${c.title}** | 🔴 **${c.readiness.score}/100** | Ajouter guideline court ou éditer dans le Lab |\n`;
  }
  md += `\n---\n\n`;

  md += `*Document d'Architecture Officiel Dr.CAT — Concepteur & Auteur : Dr. Kibeche Ali Dia Eddine*\n`;

  fs.writeFileSync(OUTPUT_MD, md, 'utf8');

  // Copy to Termux destination
  if (fs.existsSync(TERMUX_DEST)) {
    fs.copyFileSync(OUTPUT_MD, path.join(TERMUX_DEST, 'candidate_master_subcats_roadmap.md'));
    fs.copyFileSync(OUTPUT_JSON, path.join(TERMUX_DEST, 'master_subcats_report.json'));
    console.log(`✅ Successfully updated & copied candidate_master_subcats_roadmap.md & master_subcats_report.json to ${TERMUX_DEST}`);
  }
}

runScan().catch(console.error);
