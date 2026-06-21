const fs = require('fs');
const path = require('path');

const DB_FILE = path.join(__dirname, 'cats_db.json');

if (!fs.existsSync(DB_FILE)) {
  console.error("Database file cats_db.json not found!");
  process.exit(1);
}

// Safe atomic JSON writer
function safeWriteJsonSync(filePath, data) {
  const tempPath = filePath + '.tmp';
  const backupPath = filePath + '.bak';
  
  try {
    const jsonString = JSON.stringify(data, null, 2);
    if (fs.existsSync(filePath)) {
      fs.copyFileSync(filePath, backupPath);
    }
    fs.writeFileSync(tempPath, jsonString, 'utf-8');
    fs.renameSync(tempPath, filePath);
  } catch (err) {
    console.error(`[Data Integrity Error] Failed to write atomically:`, err);
    if (fs.existsSync(tempPath)) {
      try { fs.unlinkSync(tempPath); } catch (_) {}
    }
    throw err;
  }
}

const db = JSON.parse(fs.readFileSync(DB_FILE, 'utf-8'));

const examensMap = {
  1: "- Biologie : Ionogramme sanguin, urée, créatinine (uniquement si signes de déshydratation clinique ou terrain fragile).\n- Bactériologie : Coproculture avec recherche de Salmonella, Shigella, Campylobacter (si diarrhée glaireuse/sanglante ou fièvre élevée).",
  2: "- Diarrhée aiguë : Bilan biologique (NFS, CRP, créatinine) si signes de déshydratation. Coproculture et examen parasitologique des selles si retour de voyage ou suspicion parasitaire.\n- Diarrhée chronique : NFS, CRP, albuminémie, ferritinémie, thyroïde (TSH), sérologie maladie cœliaque (Ac anti-transglutaminase IgA), coloscopie complète avec biopsies étagées.",
  3: "- Vomissements : Glycémie capillaire (éliminer acidocétose), ionogramme sanguin complet (recherche hypokaliémie ou alcalose métabolique), TDM cérébrale (si suspicion d'HTIC ou céphalées associées).\n- RGO : Endoscopie digestive haute (FOGD) systématique si > 50 ans, signes d'alarme (dysphagie, amaigrissement, anémie) ou résistance au traitement par IPP.",
  4: "- Imagerie : ASP (uniquement en urgence si suspicion d'occlusion - arrêt des matières et gaz).\n- Endoscopie : Coloscopie totale recommandée si constipation d'apparition récente après 50 ans ou associée à des signes d'alarme (rectorragies, amaigrissement).",
  5: "- Imagerie : Échographie abdominale en première intention (examen clé : met en évidence des calculs vésiculaires avec voies biliaires normales).\n- Biologie : Bilan hépatique complet (ASAT, ALAT, Bilirubine, PAL, GGT) et lipasémie (pour éliminer une pancréatite associée) systématiques.",
  6: "- Imagerie : Échographie abdominale en urgence (signes de cholécystite : épaississement de la paroi vésiculaire > 4mm, Murphy échographique, calcul enclavé dans le collet).\n- Biologie : NFS (recherche hyperleucocytose), CRP (syndrome inflammatoire), bilan hépatique complet et lipasémie.",
  7: "- Biologie : Transaminases (ASAT, ALAT), TP/INR, Facteur V (évaluation de la fonction hépatique). Bilan biologique d'hépatite virale spécifique (Ag HBs, Ac anti-VHB, Ac anti-VHC, charge virale par PCR ARN/ADN si positive).\n- Imagerie : Échographie abdominale (évaluation morphologique du foie, recherche de cirrhose ou carcinome hépatocellulaire).",
  8: "- Biologie (Bilan de première intention pour exclure une cause organique) : NFS, CRP, TSH (thyroïde), sérologie maladie cœliaque (Ac anti-transglutaminase) et examen parasitologique des selles.",
  9: "- Anuscopie / Rectosigmoïdoscopie : Indispensable pour confirmer le diagnostic et exclure une autre pathologie colorectale basse.\n- Biologie : NFS (recherche d'anémie ferriprive en cas de rectorragies fréquentes).",
  10: "- Biologie : Aucun examen en cas de forme bénigne. Ionogramme sanguin, urée, créatinine, glycémie uniquement si déshydratation modérée à sévère ou échec de réhydratation orale.\n- Bactériologie/Virologie : Coproculture ou PCR fécale uniquement si selles sanglantes, épidémie en collectivité ou terrain immunodéprimé.",
  11: "- Biologie : Bilan hépatique complet (ASAT/ALAT très élevées, bilirubine totale/libre), TP/INR et Facteur V (indispensables pour exclure une hépatite fulminante), sérologies virales (VHA, VHB, VHC, EBV, CMV, HSV).",
  12: "- Imagerie cérébrale (TDM sans injection en urgence ou IRM) : Indispensable si céphalée brutale (\"coup de tonnerre\"), fièvre associée, déficit neurologique focal, modification récente du type de céphalée ou sujet de > 50 ans.\n- Ponction Lombaire : Réalisée en urgence après imagerie si suspicion de méningite ou d'hémorragie méningée à scanner normal.",
  13: "- Imagerie : Radiographie de la colonne lombaire (face + profil) non systématique en aigu (sauf suspicion de fracture/tassement). IRM lombaire en URGENCE absolue en cas de déficit moteur progressif (< 3/5) ou de syndrome de la queue de cheval.\n- Biologie : NFS, CRP, VS uniquement en cas de suspicion de cause infectieuse (spondylodiscite) ou tumorale.",
  14: "- Biologie : NFS (anémie microcytaire hypochrome), Ferritinémie (effondrée, < 30 ng/mL), Coefficient de saturation de la sidérophiline.\n- Recherche étiologique : Recherche de sang dans les selles, FOGD + Coloscopie (systématique chez l'homme et la femme ménopausée).",
  15: "- Biologie : NFS (anémie macrocytaire, VGM > 100 fL), taux de réticulocytes (arégénérative, < 120 000), dosage sérique de Vitamine B12 et d'acide folique (Folates).\n- Autres examens : Myélogramme (médullogramme) si suspicion de syndrome myélodysplasique ou leucémie. FOGD (recherche de maladie de Biermer).",
  16: "- Diagnostic Rapide : Test de Diagnostic Rapide (TDR) du Streptocoque A (si disponible chez le praticien).\n- Biologie : NFS, CRP (uniquement en cas de suspicion de complication locale comme un phlegmon ou d'état général altéré).",
  17: "- Biologie urgente : NFS avec formule sanguine (PNN < 500/mm³). Hémocultures répétées si fièvre.\n- Diagnostic étiologique : Myélogramme (médullogramme) indispensable en urgence pour éliminer une hémopathie aiguë ou confirmer une agranulocytose toxique/médicamenteuse.",
  18: "- Consultation ORL : Nasofibroscopie laryngée indispensable pour éliminer une lésion suspecte (cancer) chez un patient tabagique/alcoolique.\n- Endoscopie : FOGD si suspicion de reflux gastro-œsophagien (RGO) comme cause de la pharyngite chronique.",
  19: "- Imagerie : Aucun examen en première intention si paralysie faciale a frigore de Bell typique. IRM cérébrale avec injection si paralysie bilatérale, progressive, récidivante ou associée à d'autres déficits crâniens.\n- Biologie : Sérologie de Lyme (selon le contexte géographique).",
  20: "- Otoscopie : Examen diagnostique clé.\n- Aucun examen complémentaire requis.",
  21: "- Biologie : Bilan d'hémostase (TP, TCA, Plaquettes, NFS) uniquement si saignement abondant, récidivant, suspicion de coagulopathie ou si le patient est sous traitement anticoagulant.",
  22: "- Otoscopie : Examen diagnostique clé.\n- Imagerie : TDM des rochers en urgence uniquement en cas de suspicion de mastoïdite (douleur rétro-auriculaire, décollement du pavillon de l'oreille).",
  23: "- Diagnostic clinique (l'oxymétrie de pouls SpO2 aide à évaluer la gravité).\n- Imagerie : Radiographie du cou (profil) ou pulmonaire inutile en première intention (ne doit pas retarder l'administration de corticoïdes ou d'adrénaline).",
  24: "- Imagerie : Radiographie pulmonaire en urgence uniquement si signes de détresse respiratoire, crépitants localisés à l'auscultation ou suspicion de pneumonie bactérienne secondaire.\n- Virologie : PCR grippe non systématique en médecine générale (réservée aux cas graves ou épidémies en collectivité).",
  25: "- Diagnostic clinique.\n- Imagerie : Radiographie pulmonaire de face recommandée uniquement en cas de doute avec une pneumonie (fièvre persistante > 3 jours, expectoration purulente abondante chez le sujet âgé, ou anomalie auscultatoire localisée).",
  26: "- Imagerie : Radiographie pulmonaire (face + profil) indispensable (confirme le diagnostic en montrant un foyer d'alvéolite ou un infiltrat).\n- Biologie : NFS, CRP (évaluation de l'inflammation), oxymétrie de pouls (SpO2). Gaz du sang si SpO2 < 92%.",
  27: "- Diagnostic clinique.\n- Évaluation : Oxymétrie de pouls (SpO2) indispensable.\n- Imagerie : Radiographie pulmonaire inutile en première intention (réservée aux formes sévères nécessitant l'hospitalisation ou en cas de suspicion de complication : atélectasie, pneumothorax).",
  28: "- Mesures de débit : Mesure du Débit Expiratoire de Pointe (DEP) par Peak Flow et mesure de la saturation (SpO2) systématiques.\n- Biologie : Gaz du sang artériel si crise sévère ou SpO2 < 92%.\n- Imagerie : Radiographie pulmonaire si suspicion de pneumothorax, pneumomédiastin ou pneumonie associée.",
  29: "- Imagerie : Radiographie pulmonaire (face + profil) en urgence, TDM thoracique (angio-scanner indispensable pour évaluer l'arbre vasculaire et rechercher une embolie, cancer ou dilatation des bronches).\n- Endoscopie : Fibroscopie bronchique indispensable pour localiser le saignement et faire des biopsies.",
  30: "- Biologie (Bilan sérologique indispensable) : TPHA et VDRL (pour le diagnostic initial et le suivi de la décroissance des anticorps à 6 et 12 mois).",
  31: "- Diagnostic clinique.\n- Imagerie : Radiographie des mains, des pieds et des articulations douloureuses uniquement si suspicion de rhumatisme psoriasique associé.\n- Biologie : Facteur rhumatoïde et Ac anti-CCP (pour éliminer une polyarthrite rhumatoïde si atteinte articulaire).",
  32: "- Diagnostic clinique.\n- Exploration allergologique : Patch tests (tests cutanés) recommandés uniquement si suspicion d'eczéma de contact allergique pour identifier l'allergène en cause.",
  33: "- Diagnostic clinique.\n- Examen spécialisé : Examen ophtalmologique à la lampe à fente (avec test à la fluorescéine) systématique et en urgence en cas de suspicion d'atteinte oculaire (zona ophtalmique).",
  34: "- Diagnostic clinique.\n- Biologie : Bilan hormonal (testostérone libre, DHEA, rapport LH/FSH) uniquement chez la femme présentant des signes cliniques de syndrome des ovaires polykystiques ou d'hyperandrogénie (hirsutisme, cycles irréguliers).",
  35: "- Urticaire aiguë : Aucun examen nécessaire.\n- Urticaire chronique (> 6 semaines) : NFS, CRP/VS, TSH (recherche de pathologie thyroïdienne auto-immune). Éventuellement bilan d'allergologie si point d'appel clair.",
  36: "- Bactériologie : Prélèvement bactériologique (pus) avec antibiogramme si furonculose récidivante ou échec du traitement antibiotique.\n- Biologie : Glycémie à jeun (à la recherche d'un diabète sous-jacent favorisant).",
  37: "- Mycologie : Prélèvement mycologique (squames et cheveux) indispensable avant d'initier tout traitement antifongique oral (examen direct au microscope + culture sur milieu de Sabouraud).\n- Examen à la lumière de Wood.",
  38: "- Diagnostic clinique.\n- Bactériologie : Prélèvement bactériologique cutané uniquement en cas d'impétigo très étendu, résistant au traitement ou récidivant (recherche de Staphylocoque doré résistant à la méticilline - SARM).",
  39: "- Diagnostic clinique.\n- Prélèvement cutané par grattage de sillon scabieux au microscope (non systématique, utile en cas de doute diagnostique pour visualiser le sarcopte, ses œufs ou ses excréments).",
  40: "- Parasitologie (Confirmation diagnostique obligatoire) : Prélèvement cutané par grattage du bord actif de la lésion pour examen direct (coloration de Giemsa à la recherche de corps de Leishman) et culture ou PCR spécifique.",
  41: "- Biologie urinaire : Bandelette urinaire (BU) systématique (recherche nitrites et leucocytes).\n- Bactériologie : Examen Cytobactériologique des Urines (ECBU) systématique uniquement si cystite compliquée, récidivante, atypique ou chez la femme enceinte.",
  42: "- Biologie urinaire (Dépistage systématique mensuel) : Bandelette urinaire (BU) et ECBU.\n- Imagerie : Échographie rénale et des voies urinaires en urgence si pyélonéphrite gravidique (recherche d'obstacle lithiasique ou dilatation).",
  43: "- Biologie urinaire : ECBU systématique (prélèvement par poche stérile ou jet de milieu selon l'âge).\n- Imagerie : Échographie rénale et des voies urinaires systématique après un premier épisode de pyélonéphrite chez le garçon ou récidivant chez la fille (dépistage malformatif : reflux vésico-urétéral). Cystographie rétrograde discutée ensuite.",
  44: "- Imagerie (Examens clés) : Couple Radiographie ASP + Échographie rénale et des voies urinaires, OU TDM abdomino-pelvien sans injection (scanner low-dose : examen de référence pour identifier la taille et la localisation du calcul).\n- Biologie : Créatininémie (évaluation fonction rénale), bandelette urinaire (hématurie).",
  45: "- Biologie urinaire : Bandelette urinaire systématique (éliminer infection urinaire chez le nourrisson/enfant fébrile).\n- Biologie sanguine : NFS, CRP, PCT, hémocultures (uniquement si suspicion d'infection bactérienne sévère).\n- Autres examens : Ponction lombaire en urgence si signes de méningite ou nourrisson de < 3 mois mal toléré.",
  46: "- Biologie systématique : NFS, CRP, ECBU, Hémocultures répétées (recherche systématique de Listeria monocytogenes).\n- Imagerie/Obstétrique : Échographie obstétricale avec enregistrement du rythme cardiaque fœtal (RCF).",
  47: "- Bactériologie/Mycologie : Prélèvement vaginal avec examen direct et culture (recherche de Candida albicans, Trichomonas vaginalis, Gardnerella vaginalis, vaginose bactérienne).",
  48: "- Biologie : Dosage sérique de la 25-hydroxyvitamine D [25(OH)D] (carence définie par un taux < 20 ng/mL). Calcémie, phosphorémie, créatininémie, PTH si carence sévère ou suspicion d'ostéomalacie.",
  49: "- Diagnostic clinique après examen complet minutieux (recherche de fissure anale, hernie, cheveu étrangleur d'orteil, otite).\n- Biologie urinaire : Bandelette urinaire (BU) pour exclure une infection urinaire silencieuse.\n- Aucun bilan biologique ou radiologique invasif n'est requis en première intention.",
  50: "- Évaluation clinique : Mesure de l'acuité visuelle systématique.\n- Examen spécialisé : Lampe à fente avec test à la fluorescéine (recherche d'ulcère cornéen ou corps étranger), mesure de la pression intraoculaire (si suspicion de glaucome aigu).",
  51: "- Biologie : Glycémie à jeun (diagnostic confirmé si > 1,26 g/L à deux reprises), HbA1c (hémoglobine glyquée, objectif individuel, généralement < 7%).\n- Bilan de retentissement annuel : Créatininémie avec calcul du DFG, microalbuminurie des 24h, bilan lipidique complet, examen ophtalmologique (fond d'œil).",
  52: "- Exploration cardiaque : ECG 12 dérivations systématique en URGENCE absolue (recherche d'infarctus SCA, trouble du rythme, embolie).\n- Biologie : Dosage de la Troponine ultra-sensible (si suspicion de syndrome coronaire aigu).\n- Imagerie : Radiographie pulmonaire (suspicion d'OAP, pneumothorax, pneumonie). Gaz du sang si détresse respiratoire.",
  53: "- Aucun examen complémentaire systématique pour un certificat de non-contre-indication simple.\n- ECG de repos recommandé pour la pratique sportive en compétition chez le jeune (12-35 ans, selon les recommandations ESC) ou après 40 ans si facteurs de risque cardiovasculaires.",
  54: "- Suivi clinique : Évaluation de la croissance (poids, taille, PC sur les courbes) et examen sensoriel (audition, vision).\n- Aucun examen complémentaire systématique en l'absence de point d'appel clinique.",
  55: "- Imagerie : Radiographie osseuse en cas de suspicion de fracture ou traumatisme physique. Échographie ou TDM en fonction de la localisation du traumatisme (ex: TDM cérébrale si traumatisme crânien avec perte de connaissance).\n- Évaluation médico-légale clinique rigoureuse."
};

db.forEach(cat => {
  const examens = examensMap[cat.id];
  if (examens) {
    let summary = cat.summary;
    
    // Extract existing orientation text
    let orientationText = "";
    const orientRegex = /\*\*4\.\s*Orientation\s*\/[\s\S]*?-\s*([\s\S]*)/i;
    const orientMatch = summary.match(orientRegex);
    if (orientMatch) {
      orientationText = orientMatch[1].trim();
    } else {
      const orient5Regex = /\*\*5\.\s*Orientation\s*\/[\s\S]*?-\s*([\s\S]*)/i;
      const orient5Match = summary.match(orient5Regex);
      if (orient5Match) {
        orientationText = orient5Match[1].trim();
      }
    }
    
    // Strip old Orientation and Examens sections to avoid duplication
    summary = summary.replace(/\*\*4\.\s*Orientation[\s\S]*/i, '').trim();
    summary = summary.replace(/\*\*5\.\s*Orientation[\s\S]*/i, '').trim();
    summary = summary.replace(/\*\*4\.\s*Examens\s*complémentaires[\s\S]*/i, '').trim();
    
    // Append the new section 4 (Examens) and 5 (Orientation)
    summary += `\n\n**4. Examens complémentaires :**\n${examens}`;
    if (orientationText) {
      summary += `\n\n**5. Orientation / Avis Spécialisé :**\n- ${orientationText}`;
    }
    
    cat.summary = summary;
  }
});

safeWriteJsonSync(DB_FILE, db);
console.log("Database updated successfully with Examens Complémentaires!");
