/**
 * Medical Sources Registry & Reference Authority Manager
 * Optimized for Algerian Medical Practice (Algerian National Guidelines + French Consensus + International Standards)
 */

const REPUTABLE_MEDICAL_SOURCES = [
  // --- 🇩🇿 Algerian National Resources (Legal & Local Context) ---
  {
    id: 'sante_gov_dz',
    name: 'Ministère de la Santé (Algérie)',
    domain: 'sante.gov.dz',
    authority: 1.0,
    category: 'National Legal & Clinical Guidelines',
    description: 'Official Algerian Ministry of Health guidelines, AMM authorizations, maternal/neonatal protocols, and national oncology guides.'
  },
  {
    id: 'cnpm_dz',
    name: 'Centre National de Pharmacovigilance (CNPM Algérie)',
    domain: 'cnpm.org.dz',
    authority: 1.0,
    category: 'Algerian Pharmacovigilance & Immunization',
    description: 'Algerian drug safety monitoring, national immunization schedules, and pharmacovigilance alerts.'
  },
  {
    id: 'sami_dz',
    name: 'Société Algérienne de Médecine Interne (SAMI)',
    domain: 'samidz.com',
    authority: 0.98,
    category: 'Algerian Clinical Consensus',
    description: 'Algerian internal medicine consensus for metabolic syndromes, cardiovascular risk, and local population pathologies.'
  },

  // --- 🇫🇷 French Clinical Resources (Direct Bedside Practice) ---
  {
    id: 'msd_manual',
    name: 'Manuel MSD (MSD Manuals - Professionnels)',
    domain: 'msdmanuals.com',
    authority: 1.0,
    category: 'Global Medical Encyclopedia',
    description: 'Comprehensive, peer-reviewed clinical decision manual available in French.'
  },
  {
    id: 'guideline_care',
    name: 'Guideline.care',
    domain: 'guideline.care',
    authority: 0.98,
    category: 'Primary Care & Emergency Algorithms',
    description: 'Streamlined clinical decision algorithms covering 400+ primary care and emergency medicine presentations.'
  },
  {
    id: 'medg',
    name: 'MedG (Encyclopédie Médicale collaborative)',
    domain: 'medg.fr',
    authority: 0.97,
    category: 'Collaborative Medical Synthesis',
    description: 'Highly detailed diagnostic steps, differentials, and multi-tier medical workflows.'
  },
  {
    id: 'vidal',
    name: 'Vidal France',
    domain: 'vidal.fr',
    authority: 1.0,
    category: 'Pharmacology & Drug Monograph',
    description: 'Official French pharmaceutical database for drug dosages, indications, and contraindications.'
  },
  {
    id: 'has',
    name: 'Haute Autorité de Santé (HAS)',
    domain: 'has-sante.fr',
    authority: 1.0,
    category: 'Clinical Guidelines',
    description: 'Official French national clinical recommendations and care pathways.'
  },
  {
    id: 'sfmu',
    name: 'Société Française de Médecine d\'Urgence (SFMU)',
    domain: 'sfmu.org',
    authority: 0.98,
    category: 'Emergency & Urgent Care Protocols',
    description: 'French emergency medicine clinical decision protocols and CAT algorithms.'
  },
  {
    id: 'ansm',
    name: 'Agence Nationale de Sécurité du Médicament (ANSM)',
    domain: 'ansm.sante.fr',
    authority: 1.0,
    category: 'Drug Safety & Alerts',
    description: 'Official drug safety warnings, black-box alerts, and prescribing restrictions.'
  },
  {
    id: 'msf',
    name: 'Médecins Sans Frontières (MSF Clinical Guides)',
    domain: 'medicalguidelines.msf.org',
    authority: 0.95,
    category: 'Primary & Outpatient Care Protocols',
    description: 'Practical clinical guidelines for outpatient treatment and essential drugs.'
  },

  // --- 🇬🇧 International & Academic Resources ---
  {
    id: 'uptodate',
    name: 'UpToDate Clinical Support',
    domain: 'uptodate.com',
    authority: 1.0,
    category: 'Evidence-Based Global Consensus',
    description: 'Peer-reviewed clinical decision support system.'
  },
  {
    id: 'bmj_bestpractice',
    name: 'BMJ Best Practice',
    domain: 'bestpractice.bmj.com',
    authority: 0.99,
    category: 'Clinical Step-by-Step Guidance',
    description: 'Step-by-step guidance on initial presentations, differentials, and management.'
  },
  {
    id: 'medscape',
    name: 'Medscape Reference',
    domain: 'reference.medscape.com',
    authority: 0.96,
    category: 'Medical Reference & Drug Interaction',
    description: 'Comprehensive medical references, clinical calculators, and drug interaction checkers.'
  },
  {
    id: 'who',
    name: 'World Health Organization (WHO / OMS)',
    domain: 'who.int',
    authority: 0.95,
    category: 'Global Clinical Guidelines',
    description: 'International clinical protocols for infectious diseases and essential medicines.'
  }
];

const VALID_CATEGORIES = [
  'Gastro-entérologie',
  'Cardiologie',
  'Pneumologie',
  'Pédiatrie',
  'Gynécologie-Obstétrique',
  'Gynécologie / Obstétrique',
  'Dermatologie',
  'ORL / Ophtalmologie',
  'ORL',
  'Ophtalmologie',
  'Neurologie / Psychiatrie',
  'Neurologie',
  'Psychiatrie',
  'Rhumatologie / Traumatologie',
  'Rhumatologie',
  'Traumatologie',
  'Hématologie',
  'Infectiologie',
  'Infectiologie / MST',
  'Urologie / Néphrologie',
  'Urologie',
  'Néphrologie',
  'Endocrinologie',
  'Stomatologie',
  'Odontostomatologie',
  'Urgences',
  'Administratif'
];

/**
 * Builds search query URL suggestions for online verification
 */
function buildSearchQueries(title) {
  const cleanTitle = title.replace(/^cat\s+devant\s+/i, '').trim();
  return REPUTABLE_MEDICAL_SOURCES.map(source => ({
    sourceId: source.id,
    sourceName: source.name,
    domain: source.domain,
    queryUrl: `https://www.google.com/search?q=${encodeURIComponent(cleanTitle + ' site:' + source.domain)}`
  }));
}

module.exports = {
  REPUTABLE_MEDICAL_SOURCES,
  VALID_CATEGORIES,
  buildSearchQueries
};
