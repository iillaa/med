#!/usr/bin/env node
/**
 * Dr.CAT — Corpus Density Scanner & Clinical Readiness Matrix Engine
 * Phase 2 & 3 of REBUILD_CORPUS_MASTER_PLAN.md
 *
 * Scans all 77+ cached offline medical textbooks (data/pdf_cache/*.json),
 * extracts candidate pathologies, evaluates clinical completeness (0-100 pts),
 * and generates the interactive candidate roadmap (docs/candidate_cats_roadmap.md).
 */

const fs = require('fs');
const path = require('path');

const CACHE_DIR = path.join(__dirname, '..', 'data', 'pdf_cache');
const ROADMAP_PATH = path.join(__dirname, '..', 'docs', 'candidate_cats_roadmap.md');
const REPORT_JSON_PATH = path.join(__dirname, '..', 'data', 'corpus_density_report.json');

const KNOWN_PATHOLOGIES = [
  // Gastro-entérologie
  { title: "Intoxication alimentaire & Toxi-infection", specialty: "Gastro-entérologie", keywords: ["toxi-infection", "alimentaire", "salmonella", "staphylocoque", "vomissement"] },
  { title: "Diarrhée aiguë de l'adulte", specialty: "Gastro-entérologie", keywords: ["diarrhée", "selles liquides", "réhydratation", "lopéramide", "racécadotril"] },
  { title: "Reflux Gastro-Œsophagien (RGO) et Gastrite", specialty: "Gastro-entérologie", keywords: ["rgo", "pyrosis", "brûlure épigastrique", "ipp", "oméprazole"] },
  { title: "Constipation de l'adulte", specialty: "Gastro-entérologie", keywords: ["constipation", "laxatif", "macrogol", "fibres", "exonération"] },
  { title: "Colique hépatique et Lithiase biliaire", specialty: "Gastro-entérologie", keywords: ["colique hépatique", "murphy", "échographie abdominale", "antispasmodique"] },
  { title: "Cholécystite aiguë lithiasique", specialty: "Gastro-entérologie", keywords: ["cholécystite", "murphy fébrile", "épaississement paroi", "antibiothérapie", "chirurgie"] },
  { title: "Hépatites virales B et C", specialty: "Gastro-entérologie", keywords: ["hépatite b", "hépatite c", "transaminases", "ag hbs", "sérologie"] },
  { title: "Pathologie hémorroïdaire (Crise & Grossesse)", specialty: "Gastro-entérologie", keywords: ["hémorroïdes", "thrombose hémorroïdaire", "veinotonique", "crise hémorroïdaire"] },
  { title: "Hémorragie digestive haute", specialty: "Gastro-entérologie", keywords: ["hémorragie digestive", "méléna", "hématémèse", "ulcère", "fibroscopie", "culot"] },
  { title: "Ulcère gastro-duodénal et Helicobacter pylori", specialty: "Gastro-entérologie", keywords: ["ulcère gastro-duodénal", "helicobacter pylori", "quadrithérapie", "ipp"] },

  // Pneumologie
  { title: "Asthme aigu et Crise d'asthme", specialty: "Pneumologie", keywords: ["asthme", "crise d'asthme", "salbutamol", "ventoline", "dep", "corticoïde"] },
  { title: "Pneumonie aiguë communautaire (PAC)", specialty: "Pneumologie", keywords: ["pneumonie", "foyer crépitants", "amoxicilline", "curb-65", "crb65", "radiographie"] },
  { title: "Exacerbation de BPCO", specialty: "Pneumologie", keywords: ["bpco", "exacerbation", "bronchodilatateur", "anthonisen", "dyspnée"] },
  { title: "Bronchite aiguë de l'adulte sain", specialty: "Pneumologie", keywords: ["bronchite aiguë", "toux", "expectoration", "pas d'antibiotique systématique"] },
  { title: "Pleurésie et Épanchement pleural", specialty: "Pneumologie", keywords: ["pleurésie", "épanchement pleural", "ponction pleurale", "matité"] },
  { title: "Embolie pulmonaire", specialty: "Pneumologie", keywords: ["embolie pulmonaire", "wells", "genève", "d-dimères", "angioscanner", "anticoagulation"] },

  // Cardiologie
  { title: "Hypertension Artérielle (HTA) & Urgence Hypertensive", specialty: "Cardiologie", keywords: ["hta", "hypertension", "urgence hypertensive", "iec", "sartan", "amlodipine"] },
  { title: "Syndrome Coronarien Aigu (SCA / Infarctus)", specialty: "Cardiologie", keywords: ["syndrome coronarien", "infarctus", "troponine", "ecg", "st+", "angor", "aspirine"] },
  { title: "Insuffisance cardiaque aiguë et OAP", specialty: "Cardiologie", keywords: ["insuffisance cardiaque", "oap", "crépitants", "furosémide", "lasilix", "bnp"] },
  { title: "Fibrillation Atriale (FA)", specialty: "Cardiologie", keywords: ["fibrillation atriale", "fa", "anticoagulation", "cha2ds2-vasc", "bêtabloquant"] },
  { title: "Thrombose Veineuse Profonde (TVP / Phlébite)", specialty: "Cardiologie", keywords: ["thrombose veineuse", "phlébite", "écho-doppler", "hbpm", "anticoagulant"] },

  // Infectiologie
  { title: "Angine aiguë et Pharyngite (TDR)", specialty: "Infectiologie", keywords: ["angine", "tdr", "streptocoque", "mac-isaac", "amoxicilline"] },
  { title: "Méningites infectieuses aiguës", specialty: "Infectiologie", keywords: ["méningite", "raideur de nuque", "ponction lombaire", "purpura fulminans", "ceftriaxone"] },
  { title: "Sepsis et Choc septique", specialty: "Infectiologie", keywords: ["sepsis", "choc septique", "qsofa", "lactates", "remplissage", "noradrénaline"] },
  { title: "Fièvre typhoïde et Salmonelloses", specialty: "Infectiologie", keywords: ["typhoïde", "salmonellose", "fièvre en plateau", "dissociation pouls-température", "fluoroquinolone"] },
  { title: "Brucellose aiguë et subaiguë", specialty: "Infectiologie", keywords: ["brucellose", "fièvre ondulante", "sérologie wright", "doxycycline", "rifampicine"] },
  { title: "Paludisme d'importation", specialty: "Infectiologie", keywords: ["paludisme", "accès palustre", "goutte épaisse", "frottis", "artémusate", "cta"] },
  { title: "Tuberculose pulmonaire et ganglionnaire", specialty: "Infectiologie", keywords: ["tuberculose", "bk", "crachats", "rhze", "quadrithérapie antituberculeuse"] },

  // Dermatologie
  { title: "Gale humaine et Pédiculose", specialty: "Dermatologie", keywords: ["gale", "sarcopte", "prurit nocturne", "ivermectine", "perméthrine", "ascabiol"] },
  { title: "Impétigo de l'enfant et de l'adulte", specialty: "Dermatologie", keywords: ["impétigo", "croûtes mélicériques", "acide fusidique", "amoxicilline-clavulanate"] },
  { title: "Érysipèle et Dermohypodermite bactérienne", specialty: "Dermatologie", keywords: ["érysipèle", "dermohypodermite", "bourrelet", "amoxicilline", "streptocoque"] },
  { title: "Zona et Herpès cutanéo-muqueux", specialty: "Dermatologie", keywords: ["zona", "herpès", "vésicules", "radiculaire", "valaciclovir", "aciclovir"] },
  { title: "Acné vulgaire et inflammatoire", specialty: "Dermatologie", keywords: ["acné", "comédons", "peroxyde de benzoyle", "doxycycline", "rétinoïde"] },
  { title: "Urticaire aiguë et Œdème de Quincke", specialty: "Dermatologie", keywords: ["urticaire", "papules", "antihistaminique", "œdème de quincke", "adrénaline"] },
  { title: "Eczéma de contact et Dermatite atopique", specialty: "Dermatologie", keywords: ["eczéma", "dermatite atopique", "dermocorticoïde", "émollient", "prurit"] },
  { title: "Psoriasis vulgaire", specialty: "Dermatologie", keywords: ["psoriasis", "plaques érythémato-squameuses", "dermocorticoïde", "calcipotriol"] },
  { title: "Dermatophytoses et Mycoses cutanées", specialty: "Dermatologie", keywords: ["dermatophytose", "herpès circiné", "teigne", "intertrigo", "antifongique", "terbinafine"] },
  { title: "Furoncle et Furonculose", specialty: "Dermatologie", keywords: ["furoncle", "folliculite", "staphylocoque", "drainage", "antibiothérapie"] },
  { title: "Leishmaniose cutanée", specialty: "Dermatologie", keywords: ["leishmaniose", "bouton d'orient", "glucantime", "antimoine"] },
  { title: "Panaris et Phlegmon des gaines", specialty: "Dermatologie", keywords: ["panaris", "tourniole", "phlegmon", "chirurgie", "antibiotique"] },

  // Néphrologie - Urologie
  { title: "Colique néphrétique aiguë", specialty: "Néphrologie - Urologie", keywords: ["colique néphrétique", "lithiase urinaire", "ains", "kétoprofène", "morphine", "scanner sans injection"] },
  { title: "Cystite aiguë simple et à risque de complication", specialty: "Néphrologie - Urologie", keywords: ["cystite", "brûlures mictionnelles", "fosfomycine", "trométamol", "pivmécillinam", "ecbu"] },
  { title: "Pyélonéphrite aiguë (PNA)", specialty: "Néphrologie - Urologie", keywords: ["pyélonéphrite", "pna", "fièvre", "douleur lombaire", "ceftriaxone", "fluoroquinolone", "ecbu"] },
  { title: "Prostatite aiguë bactérienne", specialty: "Néphrologie - Urologie", keywords: ["prostatite", "toucher rectal douloureux", "fièvre urinaire", "fluoroquinolone"] },
  { title: "Rétention aiguë d'urine", specialty: "Néphrologie - Urologie", keywords: ["rétention aiguë d'urine", "globe vésical", "sondage urinaire", "cathéter sus-pubien"] },
  { title: "Insuffisance rénale aiguë", specialty: "Néphrologie - Urologie", keywords: ["insuffisance rénale aiguë", "créatinine", "oligurie", "anurie", "hyperkaliémie"] },

  // Pédiatrie
  { title: "Bronchiolite aiguë du nourrisson", specialty: "Pédiatrie", keywords: ["bronchiolite", "nourrisson", "wheezing", "désobstruction rhinopharyngée", "drp", "score de wang"] },
  { title: "Gastro-entérite aiguë et Déshydratation du nourrisson", specialty: "Pédiatrie", keywords: ["gastro-entérite", "déshydratation", "sro", "perte de poids", "pli cutané"] },
  { title: "Convulsions fébriles de l'enfant", specialty: "Pédiatrie", keywords: ["convulsion fébrile", "enfant", "diazépam", "rectiole", "fièvre"] },
  { title: "Laryngite aiguë sous-glottique", specialty: "Pédiatrie", keywords: ["laryngite", "toux aboyante", "dyspnée laryngée", "dexaméthasone", "bétaméthasone"] },
  { title: "Fièvre isolée chez le nourrisson de moins de 3 mois", specialty: "Pédiatrie", keywords: ["fièvre nourrisson", "moins de 3 mois", "bilan septique", "hospitalisation"] },

  // ORL & Stomatologie
  { title: "Otite moyenne aiguë (OMA)", specialty: "ORL & Stomatologie", keywords: ["otite moyenne aiguë", "oma", "tympan congestif", "amoxicilline", "otalgie"] },
  { title: "Sinusite aiguë maxillaire et frontale", specialty: "ORL & Stomatologie", keywords: ["sinusite", "douleur sous-orbitaire", "amoxicilline", "amoxicilline-acide clavulanique"] },
  { title: "Épistaxis de l'adulte", specialty: "ORL & Stomatologie", keywords: ["épistaxis", "saignement de nez", "tamponnement", "mèche", "pression bidigitale"] },
  { title: "Vertige positionnel paroxystique bénin (VPPB)", specialty: "ORL & Stomatologie", keywords: ["vertige", "vppb", "dix-hallpike", "manœuvre libératoire", "semont"] },

  // Ophtalmologie
  { title: "Conjonctivite aiguë bactérienne et virale", specialty: "Ophtalmologie", keywords: ["conjonctivite", "sécrétions", "collyre", "antiseptique", "antibiotique local"] },
  { title: "Kératite et Ulcère cornéen (Fluorescéine)", specialty: "Ophtalmologie", keywords: ["kératite", "fluorescéine", "test à la fluorescéine", "douleur oculaire", "photophobie"] },
  { title: "Glaucome Aigu par Fermeture de l'Angle (GAFA)", specialty: "Ophtalmologie", keywords: ["gafa", "glaucome aigu", "œil dur", "semi-mydriase", "diamox", "urgence ophtalmologique"] },
  { title: "Orgelet et Chalazion", specialty: "Ophtalmologie", keywords: ["chalazion", "orgelet", "paupière", "pommade antibiotique", "compresses chaudes"] },

  // Neurologie & Psychiatrie
  { title: "Accident Vasculaire Cérébral (AVC) et AIT", specialty: "Neurologie & Psychiatrie", keywords: ["avc", "accident vasculaire cérébral", "déficit neurologique", "thrombolyse", "fast", "irm cérébrale"] },
  { title: "Crise d'épilepsie et État de mal épileptique", specialty: "Neurologie & Psychiatrie", keywords: ["épilepsie", "crise tonicoclonique", "clonazépam", "rivotril", "benzodiazépine"] },
  { title: "Céphalée aiguë et Migraine", specialty: "Neurologie & Psychiatrie", keywords: ["migraine", "céphalée", "triptan", "hémicrânie", "aura", "ains"] },
  { title: "Sciatique et Cruralgie commune", specialty: "Neurologie & Psychiatrie", keywords: ["sciatique", "cruralgie", "radiculalgie", "lasegue", "ains", "antalgique"] },
  { title: "Crise d'angoisse aiguë et Attaque de panique", specialty: "Neurologie & Psychiatrie", keywords: ["crise d'angoisse", "attaque de panique", "hyperventilation", "anxiolytique", "rassurer"] },

  // Urgences & Réanimation
  { title: "Choc Anaphylactique", specialty: "Urgences & Réanimation", keywords: ["choc anaphylactique", "anaphylaxie", "adrénaline", "im", "remplissage", "œdème de laryx"] },
  { title: "Arrêt Cardio-Respiratoire (ACR)", specialty: "Urgences & Réanimation", keywords: ["arrêt cardio-respiratoire", "acr", "massage cardiaque", "défibrillateur", "dsa", "adrénaline"] },
  { title: "Coma non traumatique de l'adulte", specialty: "Urgences & Réanimation", keywords: ["coma", "glasgow", "dextro", "glycémie capillaire", "intubation"] },
  { title: "Intoxication médicamenteuse aiguë", specialty: "Urgences & Réanimation", keywords: ["intoxication", "surdosage", "paracétamol", "charbon activé", "antidote", "n-acétylcystéine"] },
  { title: "Morsures et Piqûres envenimantes (Scorpion, Vipère)", specialty: "Urgences & Réanimation", keywords: ["envenimation", "piqûre de scorpion", "morsure de vipère", "sérum antivenimeux", "douleur locale"] },

  // Rhumatologie & Traumatologie
  { title: "Lombalgie aiguë et Lumbago", specialty: "Rhumatologie & Traumatologie", keywords: ["lombalgie", "lumbago", "drapeaux rouges", "ains", "paracétamol", "kinésithérapie"] },
  { title: "Goutte aiguë (Arthrite microcristalline)", specialty: "Rhumatologie & Traumatologie", keywords: ["goutte", "accès goutteux", "colchicine", "ains", "hyperuricémie", "gros orteil"] },
  { title: "Entorse de la cheville", specialty: "Rhumatologie & Traumatologie", keywords: ["entorse cheville", "ottawa", "rice", "attelle", "glace", "ains"] },

  // Gynécologie - Obstétrique
  { title: "Leucorrhées et Vaginites infectieuses", specialty: "Gynécologie - Obstétrique", keywords: ["leucorrhée", "vaginite", "mycose", "trichomonas", "vaginose", "métronidazole", "ovule"] },
  { title: "Métrorragies du 1er trimestre et Grossesse Extra-Utérine (GEU)", specialty: "Gynécologie - Obstétrique", keywords: ["geu", "grossesse extra-utérine", "métrorragie", "bêta-hcg", "échographie pelvienne"] },
  { title: "Prise en charge de la Contraception d'urgence", specialty: "Gynécologie - Obstétrique", keywords: ["contraception d'urgence", "lévonorgestrel", "ulipristal", "norlevo", "ellaone"] },

  // Administratif & Législation
  { title: "Rédaction d'une lettre d'orientation médicale", specialty: "Administratif & Législation", keywords: ["lettre d'orientation", "confrère", "antécédents", "motif d'adressage", "ordonnance"] },
  { title: "Rédaction d'un certificat médical de constatation initiale (CBU)", specialty: "Administratif & Législation", keywords: ["certificat médical", "cbu", "lésions", "itt", "médico-légal", "réquisitions"] },
  { title: "Rédaction d'un certificat de non contre-indication au sport", specialty: "Administratif & Législation", keywords: ["certificat sport", "non contre-indication", "aptitude", "examen clinique", "ecg"] }
];

function evaluateClinicalReadiness(textData, pagesCount) {
  const text = textData.toLowerCase();
  let score = 0;
  const breakdown = { definition: 0, redFlags: 0, dosages: 0, pediatrics: 0, nomenclature: 0 };

  // 1. Définition & Diagnostic (20 pts)
  let defScore = 0;
  if (/définition|definition|physiopathologie|notion/i.test(text)) defScore += 5;
  if (/diagnostic|clinique|symptômes|symptomes|signes fonctionnels|examen/i.test(text)) defScore += 6;
  if (/diagnostic différentiel|étiologie|etiologie|causes|facteurs de risque/i.test(text)) defScore += 5;
  if (/formes cliniques|classification|stades/i.test(text)) defScore += 4;
  breakdown.definition = Math.min(20, defScore);
  score += breakdown.definition;

  // 2. Drapeaux Rouges & Gravité (25 pts)
  let redScore = 0;
  if (/gravité|gravite|drapeau rouge|drapeaux rouges|alerte|danger/i.test(text)) redScore += 7;
  if (/urgence|hospitalisation|réanimation|reanimation|transfert|soins intensifs/i.test(text)) redScore += 7;
  if (/choc|détresse|detresse|cyanose|hypotension|tachycardie|sepsis|dyspnée sévère|coma|confusion/i.test(text)) redScore += 6;
  if (/score|qsofa|crb65|curb65|wells|fine|glasgow|nyha/i.test(text)) redScore += 5;
  breakdown.redFlags = Math.min(25, redScore);
  score += breakdown.redFlags;

  // 3. Posologies (25 pts)
  let doseScore = 0;
  const dosageMatches = text.match(/\b\d+(?:[\.,]\d+)?\s*(?:mg|g|µg|mcg|ui|ml|mg\/kg|g\/j|mg\/j|ampoules?|cp|comprimés?|gélules?|sachets?|gouttes?)\b/gi) || [];
  if (dosageMatches.length >= 10) doseScore += 10;
  else if (dosageMatches.length >= 4) doseScore += 7;
  else if (dosageMatches.length >= 1) doseScore += 4;

  if (/\b(?:\d+\s*(?:fois|x)\s*\/\s*j(?:our)?|toutes les \d+\s*h|par jour|matin et soir)\b/i.test(text)) doseScore += 5;
  if (/\b(?:pendant \d+\s*(?:jours?|semaines?|mois)|durée \d+|cure de \d+)\b/i.test(text)) doseScore += 5;
  if (/première intention|1ère intention|deuxième intention|2ème intention|alternative|en cas d'allergie/i.test(text)) doseScore += 5;
  breakdown.dosages = Math.min(25, doseScore);
  score += breakdown.dosages;

  // 4. Pédiatrie / Terrains (15 pts)
  let pedScore = 0;
  if (/enfant|nourrisson|pédiatr|pediatr|mg\/kg\/j|chez l'enfant/i.test(text)) pedScore += 6;
  if (/femme enceinte|grossesse|allaitement|tératogène|crat/i.test(text)) pedScore += 5;
  if (/sujet âgé|personne âgée|insuffisance rénale|clairance|dfg|adaptation posologique/i.test(text)) pedScore += 4;
  breakdown.pediatrics = Math.min(15, pedScore);
  score += breakdown.pediatrics;

  // 5. Nomenclature (15 pts)
  let nomScore = 0;
  const dciKeywords = [
    'paracétamol', 'amoxicilline', 'acide clavulanique', 'ibuprofène', 'kétoprofène',
    'ceftriaxone', 'ciprofloxacine', 'azithromycine', 'métronidazole', 'oméprazole',
    'pantoprazole', 'salbutamol', 'prednisolone', 'méthylprednisolone', 'dexaméthasone',
    'tramadol', 'morphine', 'lopéramide', 'phloroglucinol', 'spasfon', 'doxycycline',
    'valaciclovir', 'aciclovir', 'perméthrine', 'ivermectine', 'artémusate', 'furosémide'
  ];
  let matchedDci = 0;
  for (const dci of dciKeywords) {
    if (text.includes(dci)) matchedDci++;
  }
  if (matchedDci >= 5) nomScore += 15;
  else if (matchedDci >= 3) nomScore += 10;
  else if (matchedDci >= 1) nomScore += 5;
  breakdown.nomenclature = Math.min(15, nomScore);
  score += breakdown.nomenclature;

  let grade = 'C';
  let gradeBadge = '🔴 Grade C';
  if (score >= 85) {
    grade = 'A';
    gradeBadge = '🟢 Grade A (Gold Standard)';
  } else if (score >= 60) {
    grade = 'B';
    gradeBadge = '🟡 Grade B (Prêt avec enrichissement)';
  }

  return {
    score,
    grade,
    gradeBadge,
    breakdown,
    dosageCount: dosageMatches.length,
    matchedDciCount: matchedDci
  };
}

async function runScanner() {
  console.log('═══════════════════════════════════════════════════════════════');
  console.log('🩺 Dr.CAT — Corpus Density Scanner & Clinical Roadmap Engine');
  console.log('═══════════════════════════════════════════════════════════════\n');

  if (!fs.existsSync(CACHE_DIR)) {
    console.error('❌ Cache directory not found:', CACHE_DIR);
    process.exit(1);
  }

  const cacheFiles = fs.readdirSync(CACHE_DIR).filter(f => f.endsWith('.json'));
  console.log(`📚 Found ${cacheFiles.length} cached medical reference books.\n`);

  console.log('⏳ Ingesting and indexing book passages in RAM...');
  const corpusBooks = [];
  let totalIndexedPages = 0;

  for (const file of cacheFiles) {
    try {
      const raw = fs.readFileSync(path.join(CACHE_DIR, file), 'utf-8');
      const data = JSON.parse(raw);
      const pdfName = data.pdf || file.replace(/\.json$/, '');
      const pages = Array.isArray(data.pages) ? data.pages : [];
      totalIndexedPages += pages.length;

      corpusBooks.push({
        file: pdfName,
        quality: data.quality || 'offline',
        pages: pages.map((p, idx) => ({
          page: p.page || idx + 1,
          content: p.content || p.text || ''
        }))
      });
    } catch (err) {
      console.warn(`⚠️ Warning: Could not parse cache file ${file}:`, err.message);
    }
  }

  console.log(`✅ Loaded ${corpusBooks.length} books (${totalIndexedPages} total pages indexed).\n`);
  console.log('🔍 Cross-referencing candidate pathologies and calculating clinical readiness scores...\n');

  const evaluatedPathologies = [];

  for (const patho of KNOWN_PATHOLOGIES) {
    const matchingOccurrences = [];
    let combinedText = '';

    for (const book of corpusBooks) {
      const matchingPagesInBook = [];

      for (const p of book.pages) {
        const pText = p.content.toLowerCase();
        const titleMatch = patho.keywords.some(kw => pText.includes(kw.toLowerCase()));
        if (titleMatch && p.content.trim().length > 50) {
          matchingPagesInBook.push(p.page);
          combinedText += '\n\n' + p.content;
        }
      }

      if (matchingPagesInBook.length > 0) {
        matchingPagesInBook.sort((a, b) => a - b);
        const ranges = [];
        let rStart = matchingPagesInBook[0];
        let rEnd = matchingPagesInBook[0];

        for (let i = 1; i < matchingPagesInBook.length; i++) {
          if (matchingPagesInBook[i] === rEnd + 1) {
            rEnd = matchingPagesInBook[i];
          } else {
            ranges.push(rStart === rEnd ? `P.${rStart}` : `P.${rStart}-${rEnd}`);
            rStart = matchingPagesInBook[i];
            rEnd = matchingPagesInBook[i];
          }
        }
        ranges.push(rStart === rEnd ? `P.${rStart}` : `P.${rStart}-${rEnd}`);

        matchingOccurrences.push({
          book: book.file,
          quality: book.quality,
          pageCount: matchingPagesInBook.length,
          pageRanges: ranges.join(', ')
        });
      }
    }

    matchingOccurrences.sort((a, b) => b.pageCount - a.pageCount);

    const readiness = evaluateClinicalReadiness(combinedText, matchingOccurrences.reduce((acc, m) => acc + m.pageCount, 0));

    evaluatedPathologies.push({
      title: patho.title,
      specialty: patho.specialty,
      sources: matchingOccurrences,
      totalMatchedPages: matchingOccurrences.reduce((acc, m) => acc + m.pageCount, 0),
      readiness
    });
  }

  const gradeACount = evaluatedPathologies.filter(p => p.readiness.grade === 'A').length;
  const gradeBCount = evaluatedPathologies.filter(p => p.readiness.grade === 'B').length;
  const gradeCCount = evaluatedPathologies.filter(p => p.readiness.grade === 'C').length;

  console.log('═══════════════════════════════════════════════════════════════');
  console.log('📊 CLINICAL READINESS SUMMARY');
  console.log('═══════════════════════════════════════════════════════════════');
  console.log(`Total Pathologies Evaluated : ${evaluatedPathologies.length}`);
  console.log(`🟢 Grade A (Gold Standard)   : ${gradeACount} (${Math.round((gradeACount/evaluatedPathologies.length)*100)}%)`);
  console.log(`🟡 Grade B (Enrichment ready): ${gradeBCount} (${Math.round((gradeBCount/evaluatedPathologies.length)*100)}%)`);
  console.log(`🔴 Grade C (Low Density)     : ${gradeCCount} (${Math.round((gradeCCount/evaluatedPathologies.length)*100)}%)`);
  console.log('═══════════════════════════════════════════════════════════════\n');

  fs.writeFileSync(REPORT_JSON_PATH, JSON.stringify({
    generatedAt: new Date().toISOString(),
    totalBooks: corpusBooks.length,
    totalPages: totalIndexedPages,
    summary: { total: evaluatedPathologies.length, gradeA: gradeACount, gradeB: gradeBCount, gradeC: gradeCCount },
    pathologies: evaluatedPathologies
  }, null, 2), 'utf-8');

  generateMarkdownRoadmap(evaluatedPathologies, {
    totalBooks: corpusBooks.length,
    totalPages: totalIndexedPages,
    gradeACount,
    gradeBCount,
    gradeCCount
  });

  console.log(`🎉 Roadmap successfully generated at: docs/candidate_cats_roadmap.md`);
  console.log(`💾 Machine-readable report saved at: data/corpus_density_report.json\n`);
}

function generateMarkdownRoadmap(pathologies, stats) {
  let md = `# 🗺️ Feuille de Route Clinique Interactive & Matrice de Préparation (Dr. CAT)\n\n`;
  md += `> **Matrice de production clinique générée automatiquement** le ${new Date().toLocaleDateString('fr-FR', { day: 'numeric', month: 'long', year: 'numeric' })} par le *Corpus Density Scanner*.\n`;
  md += `> Ce document constitue votre carnet de bord pour la Phase 4 (Découpage Visual Slicer dans le PDF Lab) et la Phase 5 (Génération & Validation RAG).\n\n`;
  md += `---\n\n`;

  md += `## 📊 1. Synthèse Globale du Corpus Offline\n\n`;
  md += `| Indicateur | Valeur |\n`;
  md += `| :--- | :---: |\n`;
  md += `| **Manuels & Référentiels Médicaux Indexés** | **${stats.totalBooks} ouvrages** |\n`;
  md += `| **Volume Total de Pages Scannées** | **${stats.totalPages.toLocaleString()} pages** |\n`;
  md += `| **Pathologies candidates évaluées** | **${pathologies.length} pathologies** |\n`;
  md += `| 🟢 **Grade A (Gold Standard - Score ≥ 85/100)** | **${stats.gradeACount} fiches** (${Math.round((stats.gradeACount/pathologies.length)*100)}%) |\n`;
  md += `| 🟡 **Grade B (Prêt pour découpage & enrichissement - Score 60-84)** | **${stats.gradeBCount} fiches** (${Math.round((stats.gradeBCount/pathologies.length)*100)}%) |\n`;
  md += `| 🔴 **Grade C (Nécessite consensus dédié - Score < 60)** | **${stats.gradeCCount} fiches** (${Math.round((stats.gradeCCount/pathologies.length)*100)}%) |\n\n`;

  md += `---\n\n`;

  md += `## 📋 2. Guide d'Action pour le Médecin (Phase 4 & Phase 5)\n\n`;
  md += `1. **Sélectionner une fiche cible** dans le tableau ci-dessous (priorité aux 🟢 **Grade A** et 🟡 **Grade B**).\n`;
  md += `2. **Ouvrir le PDF Lab** sur votre tablette : \`http://localhost:3000\` ➔ Onglet **PDF Ingestion & Visual Curation Lab**.\n`;
  md += `3. **Découper le chapitre source** : Cliquez sur le document maître cité dans la colonne *Source Principale*, cadrez la page de début et de fin, puis cliquez sur **"✂️ Découper & Sauvegarder en Staging"** *(0 tokens consommés)*.\n`;
  md += `4. **Générer & Valider dans le Generator Lab** : Ouvrez le Staging Studio, appliquez les règles de validation clinique, et validez en production en 1 clic.\n\n`;

  md += `---\n\n`;

  const bySpecialty = {};
  for (const p of pathologies) {
    if (!bySpecialty[p.specialty]) bySpecialty[p.specialty] = [];
    bySpecialty[p.specialty].push(p);
  }

  md += `## 🩺 3. Matrice Clinique par Spécialité\n\n`;

  for (const [specialty, items] of Object.entries(bySpecialty)) {
    items.sort((a, b) => b.readiness.score - a.readiness.score);

    md += `### 🩺 ${specialty} (${items.length} fiches)\n\n`;
    md += `| Suivi | Titre Pathologie | Score | Grade | Source Principale (Pages) | Sources Complémentaires |\n`;
    md += `| :---: | :--- | :---: | :---: | :--- | :--- |\n`;

    for (const item of items) {
      const r = item.readiness;
      const gradeIcon = r.grade === 'A' ? '🟢 **A**' : (r.grade === 'B' ? '🟡 **B**' : '🔴 **C**');
      
      let primarySource = '*(Aucune source directe)*';
      let secondarySources = '-';

      if (item.sources.length > 0) {
        const pSrc = item.sources[0];
        primarySource = `📄 **${pSrc.book}**<br>(${pSrc.pageRanges})`;

        if (item.sources.length > 1) {
          secondarySources = item.sources.slice(1, 3).map(s => `• ${s.book} (${s.pageRanges})`).join('<br>');
        }
      }

      md += `| \`[ ]\` | **${item.title}** | **${r.score}/100** | ${gradeIcon} | ${primarySource} | ${secondarySources} |\n`;
    }

    md += `\n`;
  }

  md += `---\n\n`;
  md += `*Document généré par Dr.CAT CLI — Plateforme Médicale d'Aide à la Décision Thérapeutique.* \n`;
  md += `*Auteur & Architecte : Dr. Kibeche Ali Dia Eddine*\n`;

  fs.writeFileSync(ROADMAP_PATH, md, 'utf-8');
}

if (require.main === module) {
  runScanner().catch(console.error);
}

module.exports = { runScanner, evaluateClinicalReadiness };
