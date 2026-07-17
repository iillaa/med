const fs = require('fs');
const path = require('path');

const DB_FILE = path.join(__dirname, '..', 'data', 'cats_db.json');

if (!fs.existsSync(DB_FILE)) {
  console.error("Database file cats_db.json not found!");
  process.exit(1);
}

const db = JSON.parse(fs.readFileSync(DB_FILE, 'utf-8'));

const orientations = {
  1: "Avis Gastro-entérologue si symptômes prolongés (>48h), suspicion de germe invasif (Salmonella/Shigella) ou terrain fragile. Hospitalisation urgente si déshydratation sévère ou choc septique.",
  2: "Avis Gastro-entérologue si diarrhée chronique (>4 semaines) pour explorations (coloscopie, examens parasitologiques de selles) ou suspicion de MICI (Maladie de Crohn, RCH).",
  3: "Avis Gastro-entérologue si RGO résistant à un traitement par IPP bien conduit après 4 semaines, ou en cas de signes d'alarme (dysphagie, amaigrissement) pour programmer une FOGD. Avis urgent si vomissements incoercibles.",
  4: "Avis Gastro-entérologue si constipation opiniâtre résistante aux RHD et laxatifs, ou de survenue récente chez un sujet de > 50 ans (indication formelle de coloscopie).",
  5: "Avis Chirurgien Généraliste/Viscéral systématique pour planifier une cholécystectomie programmée suite à l'épisode douloureux afin d'éviter les récidives et complications.",
  6: "Avis Chirurgien Viscéral en URGENCE pour hospitalisation, antibiothérapie IV et cholécystectomie précoce (dans les 24-72h) en cas de cholécystite aiguë. Avis Gastro-entérologue/Réanimateur si suspicion d'angiocholite.",
  7: "Avis Gastro-entérologue / Hépatologue systématique devant toute hépatite B ou C chronique active (Ag HBs + ou ARN VHC +) pour initiation du traitement antiviral et surveillance.",
  8: "Avis Gastro-entérologue si les douleurs abdominales ou troubles du transit persistent malgré l'utilisation d'antispasmodiques adaptés (pour éliminer une pathologie organique).",
  9: "Avis Gastro-entérologue ou Proctologue si saignements fréquents entraînant une anémie, échec du traitement médical bien conduit (indication de ligatures élastiques ou chirurgie d'Hemorrhoidectomie).",
  10: "Avis Pédiatre / Urgences Pédiatriques en urgence si déshydratation clinique modérée à sévère (>5-10% de perte de poids), vomissements incoercibles interdisant la prise de SRO, ou léthargie.",
  11: "Avis Pédiatre en cas de suspicion d'hépatite fulminante (somnolence, troubles du comportement, TP < 50% - hospitalisation urgente en soins intensifs pédiatriques).",
  12: "Avis Neurologue si céphalée quotidienne, résistance aux triptans et AINS associés, suspicion de céphalée par abus médicamenteux, ou pour instaurer un traitement de fond complexe.",
  13: "Avis Rhumatologue si douleur persistant > 4-6 semaines sous traitement médical. Avis Neurochirurgien/Chirurgien orthopédique en URGENCE si déficit moteur (<3/5) ou syndrome de la queue de cheval.",
  14: "Avis Gynécologue si anémie liée à des ménorragies/polypes. Avis Gastro-entérologue systématique chez l'homme et la femme ménopausée pour réaliser FOGD + Coloscopie à la recherche d'une lésion digestive tumorale.",
  15: "Avis Hématologue si suspicion de syndrome myélodysplasique ou anomalie de la NFS (bi/pancytopénie). Avis Gastro-entérologue si carence en B12 confirmée pour exclure la Maladie de Biermer (FOGD pour biopsie).",
  16: "Avis ORL si angines récidivantes (> 5-6 épisodes par an) pour discuter d'une amygdalectomie. Avis Chirurgien ORL en urgence si phlegmon amygdalien (trismus, déviation de la luette).",
  17: "Avis Hématologue en urgence si agranulocytose constatée à la NFS (PNN < 500). Avis Interniste/Immunologue si suspicion de maladie dysimmunitaire générale (Lupus, etc.).",
  18: "Avis ORL si pharyngite chronique traînante chez un patient exposé au tabac/alcool (nécessité d'exclure un carcinome épidermoïde des voies aérodigestives supérieures).",
  19: "Avis ORL / Neurologue si absence de début de récupération après 3-4 semaines, ou en cas de paralysie faciale récidivante ou bilatérale. Avis Ophtalmologue en urgence si kératite d'exposition.",
  20: "Avis ORL si échec d'extraction après ramollissement, suspicion de perforation tympanique préexistante, ou douleur vive provoquée lors de l'irrigation.",
  21: "Avis ORL en urgence si épistaxis incoercible après tamponnement antérieur double, ou si saignement postérieur (nécessité de tamponnement postérieur ou cautérisation sous endoscopie).",
  22: "Avis ORL si OMA récidivantes (>3-4 épisodes en 6 mois) pour discuter de la pose d'aérateurs transtympaniques (yoyos) et/ou adénoïdectomie.",
  23: "Avis Pédiatre ou Réanimateur Pédiatrique en urgence si absence d'amélioration ou aggravation du tirage/stridor après prise de corticoïdes oraux (nécessité d'adrénaline nébulisée ou intubation).",
  24: "Avis Pneumologue / Réanimateur en urgence si détresse respiratoire aiguë chez un patient âgé, BPCO ou insuffisant cardiaque. Avis Infectiologue si suspicion de grippe maligne.",
  25: "Avis Pneumologue si toux persistant > 3 semaines (recherche d'un asthme toux ou d'une BPCO débutante) ou si expectorations purulentes répétées chez un patient tabagique.",
  26: "Avis Pneumologue si absence de réponse clinique à 72h d'antibiothérapie adaptée (recherche d'une résistance bactérienne ou d'une complication type pleurésie).",
  27: "Avis Pédiatre / Urgences Pédiatriques systématique si prise alimentaire < 50%, signes de lutte respiratoire marqués (battement des ailes du nez, geignement), ou saturation SpO2 < 92%.",
  28: "Avis Pneumologue (Adulte) ou Pédiatre (Enfant) systématique après toute crise modérée à sévère pour réévaluation du traitement de fond. Avis Réanimateur en urgence si asthme aigu grave.",
  29: "Avis Pneumologue en urgence pour investigations rapides (Scanner thoracique + Fibroscopie bronchique) devant toute hémoptysie, même minime, afin d'exclure un cancer ou une tuberculose active.",
  30: "Avis Dermatologue / Infectiologue en cas de syphilis tertiaire (neurologique, cardiovasculaire), chez la femme enceinte, ou en cas de non-décroissance du titre VDRL à 6-12 mois post-traitement.",
  31: "Avis Dermatologue si psoriasis étendu (>10% de la surface corporelle), résistant aux traitements locaux de première intention, ou s'il existe des arthralgies inflammatoires associées (Rhumatologue).",
  32: "Avis Dermatologue en cas d'eczéma sévère résistant aux dermocorticoïdes ou d'eczéma surinfecté récidivant. Avis Allergologue pour la réalisation de tests cutanés (patch tests).",
  33: "Avis Ophtalmologue systématique et en URGENCE pour tout zona ophtalmique (risque d'atteinte cornéenne ou uvéite). Avis Dermatologue si zona nécrotique ou chez l'immunodéprimé.",
  34: "Avis Dermatologue en cas d'acné sévère nodulaire/conglobata, risque élevé de cicatrices définitives, ou en cas d'échec du traitement antibiotique oral bien conduit après 3 mois (pour traitement par Isotrétinoïne).",
  35: "Avis Dermatologue / Allergologue si urticaire chronique (> 6 semaines) pour bilan étiologique approfondi. Avis Réanimateur en urgence si choc anaphylactique ou angio-œdème laryngé.",
  36: "Avis Dermatologue si furonculose récidivante pour protocole de décontamination cutanée familial. Avis Chirurgien si furoncle fluctuant nécessitant une incision/drainage.",
  37: "Avis Dermatologue si teigne résistante au traitement par griséfuline orale ou en cas de kérion très inflammatoire avec risque d'alopécie cicatricielle définitive.",
  38: "Avis Dermatologue ou Pédiatre en cas d'impétigo très étendu, d'impétigo bulleux du nouveau-né (urgence pédiatrique pour antibiothérapie IV), ou de rechutes fréquentes.",
  39: "Avis Dermatologue si échec de deux traitements bien conduits (suspicion de résistance ou de gale profuse/hyperkératosique nécessitant une prise en charge spécialisée).",
  40: "Avis Dermatologue systématique en cas de leishmaniose cutanée complexe (visage, péri-orificielle, articulaire, > 5 lésions) pour traitement intramusculaire ou alternatives sous surveillance.",
  41: "Avis Urologue chez l'homme après un 1er épisode d'infection urinaire (recherche d'anomalie prostatique/sténose). Avis Urologue ou Gynécologue chez la femme si cystites récidivantes (>4/an).",
  42: "Avis Gynécologue-Obstétricien systématique pour la surveillance fœtale et le suivi en cas de pyélonéphrite gravidique ou d'infections urinaires récidivantes au cours de la grossesse.",
  43: "Avis Pédiatre ou Urologue Pédiatrique systématique après un premier épisode de pyélonéphrite chez le garçon ou récidivant chez la fille pour planifier le bilan malformatif (recherche de reflux vésico-urétéral).",
  44: "Avis Urologue en urgence si colique néphrétique fébrile (urgence vitale - drainage chirurgical immédiat), rein unique, anurie (>12h) ou douleur rebelle aux antalgiques majeurs.",
  45: "Avis Pédiatre / Urgences Pédiatriques si nourrisson de < 3 mois (hospitalisation systématique), mauvaise tolérance clinique (léthargie, geignement, purpura) ou fièvre persistante inexpliquée.",
  46: "Avis Gynécologue-Obstétricien en URGENCE pour hospitalisation, bilan infectieux materno-fœtal complet et surveillance du rythme cardiaque fœtal (recherche de listériose ou chorioamniotite).",
  47: "Avis Gynécologue si suspicion d'infection génitale haute (salpingite, endométrite) pour bilan échographique et antibiothérapie adaptée, ou en cas de vaginites mycosiques récidivantes.",
  48: "Avis Rhumatologue ou Endocrinologue si carence sévère associée à une ostéoporose fracturaire, une hyperparathyroïdie secondaire ou des anomalies de la calcémie.",
  49: "Avis Pédiatre / Urgences Pédiatriques en urgence si cris continus associés à des accès de pâleur (suspicion d'invagination intestinale aiguë), fièvre, ou anomalies de l'examen physique.",
  50: "Avis Ophtalmologue en URGENCE devant tout œil rouge douloureux avec baisse de l'acuité visuelle (GAFA, uvéite antérieure, kératite aiguë) ou en cas de traumatisme oculaire.",
  51: "Avis Pédiatre-Endocrinologue en urgence absolue pour hospitalisation systématique en cas de diabète de type 1 inaugural (risque vital d'acidocétose).",
  52: "Avis au spécialiste correspondant (selon la pathologie suspectée) ou au médecin d'accueil des urgences en détaillant l'histoire de la maladie et les constantes vitales.",
  53: "Avis Médecin Légiste en cas de doute sur la rédaction du certificat ou si les constatations cliniques suggèrent un litige médico-légal complexe (violences graves).",
  54: "Avis Pédiatre ou spécialiste concerné si l'examen de bonne santé révèle une anomalie de croissance staturo-pondérale, un retard de développement psychomoteur ou un souffle cardiaque.",
  55: "Avis Médecin Légiste ou réquisition pour description officielle des lésions complexes en vue d'une procédure judiciaire."
};

const extraKeywords = {
  1: ["ioniques"],
  2: ["ioniques"],
  3: ["Ordonnances"],
  4: ["ioniques"],
  5: ["ASP", "ECG", "Ordonnances"],
  6: ["ASP", "Ordonnances"],
  7: ["Infectieux"],
  8: ["Ordonnances", "m茅dicaments"],
  9: ["Gross猫sse"],
  10: ["ioniques", "Urgences"],
  11: ["ioniques"],
  12: ["R茅flexes"],
  13: ["R茅flexes"],
  14: ["Bilans"],
  15: ["Bilans"],
  16: ["m茅dicaments"],
  17: ["Bilans"],
  19: ["R茅flexes", "Ophtalmologie"],
  20: ["ORL"],
  22: ["m茅dicaments"],
  23: ["Urgences"],
  24: ["Radio thoracique"],
  25: ["Radio thoracique", "Ordonnances"],
  26: ["Radio thoracique", "Ordonnances"],
  27: ["Radio thoracique", "Urgences"],
  28: ["Radio thoracique", "Urgences", "Ordonnances"],
  29: ["Radio thoracique", "Urgences"],
  32: ["m茅dicaments"],
  33: ["Ophtalmologie"],
  35: ["Urgences"],
  36: ["Infectieux"],
  37: ["m茅dicaments"],
  38: ["m茅dicaments"],
  40: ["Bilans"],
  41: ["Bilans"],
  42: ["Gross猫sse"],
  43: ["Urgences"],
  44: ["ASP", "Ordonnances", "Urgences"],
  45: ["Urgences", "m茅dicaments"],
  46: ["Gross猫sse", "Bilans"],
  47: ["Gross猫sse"],
  48: ["Bilans", "ioniques"],
  49: ["Urgences", "R茅flexes"],
  50: ["Urgences"],
  51: ["Urgences", "je没ne"],
  53: ["Certificats"],
  54: ["Certificats"],
  55: ["Certificats"]
};

// Apply updates to database fiches
db.forEach(cat => {
  const orientation = orientations[cat.id];
  const extras = extraKeywords[cat.id] || [];

  if (orientation) {
    // Append Orientation section to summary
    const newSection = `\n\n**4. Orientation / Avis Spécialisé :**\n- ${orientation}`;
    // Check if it already has this section, if so replace it, otherwise append
    if (cat.summary.includes('**4. Orientation')) {
      // Replace existing
      cat.summary = cat.summary.replace(/\*\*4\. Orientation \/ Avis Sp\u00e9cialis\u00e9 :[\s\S]*/, `**4. Orientation / Avis Spécialisé :**\n- ${orientation}`);
    } else {
      cat.summary += newSection;
    }
  }

  // Add extra keywords
  if (extras.length > 0) {
    if (!cat.pdf_keywords) cat.pdf_keywords = [];
    extras.forEach(kw => {
      if (!cat.pdf_keywords.includes(kw)) {
        cat.pdf_keywords.push(kw);
      }
    });
  }
});

fs.writeFileSync(DB_FILE, JSON.stringify(db, null, 2), 'utf-8');
console.log("Successfully updated default medical summaries and keywords in database!");
