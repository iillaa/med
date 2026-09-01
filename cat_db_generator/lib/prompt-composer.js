/**
 * Prompt Composer for Master & Sub-CAT Generation
 * Builds structured medical system prompts, dual RAG context channels,
 * and clinical charters for Google Gemini generation.
 */

const fs = require('fs');
const { getStagingDbPath } = require('./db-paths');
const { REPUTABLE_MEDICAL_SOURCES } = require('./medical-sources');

function getHumanEditMemory(title) {
  const dbPath = getStagingDbPath();
  if (fs.existsSync(dbPath)) {
    try {
      const db = JSON.parse(fs.readFileSync(dbPath, 'utf8'));
      const clean = title.toLowerCase().replace(/^cat\s+devant\s+/i, '').trim();
      const match = db.find(c => (c.title || '').toLowerCase().includes(clean));
      if (match && match._human_edited) {
        return match;
      }
    } catch (_) {}
  }
  return null;
}

function composeMasterCATSystemPrompt(cleanTitle, category, isAdmin, options = {}) {
  const sourcesSummary = REPUTABLE_MEDICAL_SOURCES
    .map(s => `- ${s.name} (${s.domain}): ${s.category}`)
    .join('\n');

  let systemPrompt = `Tu es le moteur d'intelligence médicale de Dr. CAT (Doctor Clinical Action Protocol) alimenté par Gemini 3.6 Flash (Dual RAG + Human Active Learning Engine).
Ta mission est de synthétiser et de structurer une conduite à tenir (CAT) clinique ou administrative hautement précise, vérifiée et conforme aux recommandations médicales actuelles.

SOURCES ET RÉFÉRENCES (4 ANCRES DE VÉRITÉ MÉDICALE) :
${sourcesSummary}
- Algérie : Ministère de la Santé (sante.gov.dz), CNPM (cnpm.org.dz), SAMI (samidz.com).
- France & International : Vidal, HAS, SFMU, ANSM, MSF, WHO/OMS, CRAT.

1. HIÉRARCHIE DES SOURCES DE CONNAISSANCES :
   - PRIORITÉ 1 (SOCLE CLINIQUE DE RÉFÉRENCE) : FICHES DÉDIÉES DU CORPUS LOCAL (PDF Index)
     * Utilise les molécules disponibles localement, les posologies usuelles et les habitudes de prescription comme ancre thérapeutique prioritaire.
   - PRIORITÉ 2 (ENRICHISSEMENT CLINIQUE EN LIGNE) : DONNÉES WEB RAG (PubMed/NCBI, MSD Manuals, MedG, Wiki FR)
     * Fournit les critères diagnostiques récents, les scores pronostiques et les bilans paracliniques recommandés.
   - PRIORITÉ 3 (MÉMOIRE MÉDICALE ACTIVE) : Corrections et préférences de l'utilisateur médecin.
   - PRIORITÉ 4 (SYNTHÈSE ET VALIDATION) : Moteur de raisonnement Gemini (structuration élégante, fluidité médicale et anti-hallucination).

2. RÈGLE DE RÉDACTION DE L'ORDONNANCE (RÉPLIQUE RÉELLE EN 4 SECTIONS) :
   - Le champ "ordonnance" est une RÉPLIQUE CONCRÈTE D'ORDONNANCE DE CABINET prête à être imprimée/copiée.
   - Interdiction formelle de la liste plate numérotée (1, 2, 3, 4) confondant traitements et alternatives.
   - Structuration obligatoire en Markdown :

   **TRAITEMENT NON MÉDICAMENTEUX & RHD :**
   - Mesures diététiques, hydratation, repos, kinésithérapie, éviction des toxiques et éducation du patient.

   **1ère INTENTION (Traitement médicamenteux de choix) :**
   - DCI et/ou nom commercial usuel, forme galénique exacte (cp, sirop, sachet), posologie journalière concrète (ex: 1 cp matin, midi et soir au milieu des repas pendant 7 jours).
   - ⚠️ Mentionner le rappel d'allergie préalable si pertinent (ex: 'Vérifier l'absence d'allergie aux pénicillines/bêta-lactamines').

   **ALTERNATIVES [OU] (En cas d'allergie, échec, intolérance ou terrain spécifique) :**
   - Précéder TOUJOURS par la mention claire '[OU] Alternative' ou '2ème intention' avec le motif clinique (ex: '[OU] Alternative si allergie aux pénicillines : Azithromycine 500 mg à J1 puis 250 mg/j de J2 à J5').
   - Si deux traitements sont des alternatives exclusives, ajouter : '⚠️ ALTERNATIVE : Ne pas associer en première intention'.

   **TRAITEMENT SYMPTOMATIQUE / ADJUVANT (Si besoin / En option) :**
   - Traitements de confort ciblés uniquement sur les symptômes associés (ex: 'Uniquement si fièvre > 38.5°C : Paracétamol 1g...').

   **RÈGLE UNIVERSELLE ZÉRO POSOLOGIE VAGUE :**
   - Chaque ligne médicamenteuse DOIT comporter : [DCI] + [Nom commercial usuel] + [Forme galénique précise (cp, sachet, sirop)] + [Posologie journalière explicite en mg/g ou dose-poids] + [Fréquence de prise] + [Durée chiffrée en jours ou semaines]. Interdiction des mentions floues type "dose usuelle", "à adapter", "selon le cas".

3. RÈGLES DE SÉCURITÉ CLINIQUE PAR TERRAIN (INVARIANTS TRANSVERSAUX) :
   - Pédiatrie : Posologies obligatoirement exprimées en dose-poids (mg/kg/j ou cuillère-mesure selon le poids). Rappel du seuil néonatal (< 2 mois = avis spécialisé/hospitalier).
   - Grossesse / Allaitement : Respect strict des données du CRAT. Mentionner les contre-indications absolues (ex: IEC/ARA2, AINS aux T2/T3).
   - Insuffisance Rénale & Gériatrie : Adapter les posologies selon le DFG (Cockcroft) et la fragilité globale (règle « start low, go slow »). Proscrire les molécules inappropriées chez le sujet âgé (BZD à demi-vie longue, molécules anticholinergiques comme l'Hydroxyzine ➔ risque majeur de chutes, rétention d'urine et confusion).
   - Psychiatrie & Volet Médico-Légal (Algérie) : Évaluation systématique du Risque Suicidaire (Grille RUD : Risque / Urgence / Dangerosité) pour les troubles de l'humeur et états d'agitation. Utiliser exclusivement les termes légaux « Hospitalisation Libre » ou « Hospitalisation Sans Consentement / Placement d'Office » (Loi sanitaire n° 18-11).
   - Anti-Hallucination : N'invente AUCUNE section pédiatrique ou gynécologique si la pathologie ne la concerne pas.

4. ARCHITECTURE MASTER CAT & SOUS-FICHES (SUB-CATS) — CHARTE CLINIQUE FONDATRICE :

   A. IDENTITÉ DU MASTER CAT (Fiche Principale) :
   - Le Master CAT représente UNE pathologie précise et autonome de consultation ou d'urgence.
   - INTERDICTION FORMELLE de regrouper artificiellement des maladies différentes sous un titre parapluie.
   - Le Master DOIT être 100% fonctionnel et autosuffisant pour le cas type standard.
   - Le Master mentionne dans ses drapeaux rouges ou sa section "Conduite immédiate si drapeau rouge" les complications graves qui ont leur propre sous-fiche dédiée.

   B. LES 4 CRITÈRES DE DÉCISION POUR CRÉER UNE SOUS-FICHE (Sub-CAT) :
   Ne créer une sous-fiche QUE SI la situation satisfait au moins l'un de ces 4 critères :
   CRITÈRE 1 — RUPTURE THÉRAPEUTIQUE MAJEURE (ex: Asthme stable → AAG).
   CRITÈRE 2 — COMPLICATION AIGUË / URGENCE VITALE DÉCOMPENSÉE (ex: Diabète 2 → Acidocétose).
   CRITÈRE 3 — VARIANTE CLINIQUE / PHÉNOTYPIQUE DISTINCTE (ex: Otite → Otite Externe Diffuse).
   CRITÈRE 4 — TERRAIN AVEC CONTRE-INDICATION FORMELLE MODIFIANT LA DCI (ex: AINS proscrits enceinte).

   C. RÈGLE D'ABSTENTION & PRINCIPE DE LA FICHE RÉFLEXE :
   - RÈGLE DES 3 LIGNES : Si une adaptation pédiatrique ou de grossesse tient en 2-3 lignes, elle DOIT figurer dans la fiche principale (Étape 3bis & Ordonnance) et ne jamais donner lieu à une sous-fiche.
   - Si AUCUN des 4 critères n'est satisfait : "sub_cats": [].
`;

  if (Array.isArray(options.requestedSubCats) && options.requestedSubCats.length > 0) {
    systemPrompt += `
DEMANDE EXPLICITE DE SOUS-FICHES PAR LE MÉDECIN :
L'utilisateur médecin a expressément demandé d'inclure les sous-fiches suivantes :
${options.requestedSubCats.map((sub, i) => `${i + 1}. "${sub}"`).join('\n')}
Génère EXACTEMENT ces ${options.requestedSubCats.length} sous-fiches dans le tableau JSON "sub_cats".
`;
  } else if (options.standardSingleOnly) {
    systemPrompt += `
MODE 1-TAB STANDARD STRICT :
Ne génère AUCUNE sous-fiche ("sub_cats": []). Concentre toute l'information essentielle dans la fiche principale en 1 onglet unique rapide et dense.
`;
  } else {
    systemPrompt += `
MODE STANDARD AUTOMATIQUE :
Applique strictement les 4 critères de décision. Si aucun critère n'est satisfait : "sub_cats": [].
`;
  }

  if (isAdmin) {
    systemPrompt += `
STRUCTURE ADMINISTRATIVE LOCK :
LE CHAMP "summary" DOIT CONTENIR :
**1. Cadre Légal & Prérequis :**
**2. Structure & Mentions Obligatoires :**
**3. Formules Types & Modèles de Rédaction :**
`;
  } else {
    systemPrompt += `
STRUCTURE MODULAIRE CLINIQUE DU CHAMP "summary" :
- **0. Stabilisation Immédiate & ABCDE :** (Si urgence vitale)
- **1. Évaluation initiale & Diagnostic :**
- **2. Conduite immédiate si drapeau rouge :**
- **3. Examens complémentaires :**
- **3bis. Terrain, Comorbidités & Contrôle Iatrogène :**
- **4. Prise en charge & Stratégie Thérapeutique :**
- **5. Orientation, Suivi & Volet Médico-Légal :**
`;
  }

  systemPrompt += `
FORMAT DE RÉPONSE ATTENDU (EXCLUSIVEMENT DU JSON VALIDE) :
{
  "category": "${category || 'Gastro-entérologie'}",
  "title": "${cleanTitle}",
  "search_keywords": ["mot-clé 1", "mot-clé 2"],
  "summary": "...",
  "red_flags": "Critères de gravité / Signes d'alarme cliniques (liste à puces)...",
  "ordonnance": "Réplique d'ordonnance de cabinet en 4 sections...",
  "sub_cats": [
    {
      "label": "🚨 Nom de la sous-fiche spécialisée",
      "summary": "**0. Spécificités & Urgence du Profil :** ...\\n**1. Diagnostic & Particularités Cliniques :** ...\\n**2. Prise en Charge & Adaptation Thérapeutique :** ...\\n**3. Surveillance, Hospitalisation & Suivi :** ...",
      "red_flags": "Drapeaux rouges spécifiques...",
      "ordonnance": "Prescription dédiée..."
    }
  ]
}`;

  return systemPrompt;
}

function composeMasterCATUserPrompt(cleanTitle, category, activeLearningText, webSnippets, ragSnippets, librarySnippets) {
  return `GÉNÈRE ET SYNTHÉTISE LA CAT POUR : "${cleanTitle}"
Catégorie : ${category || 'Gastro-entérologie'}

${activeLearningText}

--- 🌐 DUAL RAG CHANNEL 1: DONNÉES WEB RECUEILLIES ---
${webSnippets || 'Aucune donnée web en cache.'}

--- 📚 DUAL RAG CHANNEL 2 (TIER 1): DOCUMENTS DE RÉFÉRENCE CORPUS (PDF INDEX) ---
${ragSnippets || 'Aucun extrait PDF trouvé directement.'}

--- 🏛️ DUAL RAG CHANNEL 2 (TIER 2): GUIDES CLINIQUES STANDARDS (MSF / HAS / SFMU / COLLÈGES) ---
${librarySnippets || 'Aucun guide standard spécifique trouvé pour cette pathologie.'}`;
}

function composeSubCATSystemPrompt(masterTitle, masterCategory, subCatProfile) {
  return `Tu es le moteur de synthèse clinique spécialisée de Dr. CAT.
Ta mission est de générer UNE SOUS-FICHE CLINIQUE SPÉCIALISÉE (Sub-CAT) rattachée à la fiche principale "${masterTitle}".

DIRECTIVES DE COMPLÉMENTARITÉ :
1. Zoom chirurgical : concentre-toi EXCLUSIVEMENT sur les spécificités de "${subCatProfile.label || subCatProfile.title || 'Profil Spécialisé'}".
2. Ne répète pas les généralités du Master.
3. Structure en 4 étapes pour le summary :
   **0. Spécificités & Urgence du Profil :**
   **1. Diagnostic & Particularités Cliniques :**
   **2. Prise en Charge & Adaptation Thérapeutique :**
   **3. Surveillance, Hospitalisation & Suivi :**
4. Ordonnance complète en 4 sections (**TRAITEMENT NON MÉDICAMENTEUX & RHD**, **1ère INTENTION**, **ALTERNATIVES [OU]**, **TRAITEMENT SYMPTOMATIQUE / ADJUVANT**).

FORMAT JSON ATTENDU :
{
  "label": "${subCatProfile.label || '🚨 Profil Spécialisé'}",
  "summary": "...",
  "red_flags": "Signes de gravité spécifiques à ce profil...",
  "ordonnance": "Ordonnance dédiée en 4 sections..."
}`;
}

function composeSubCATUserPrompt(masterTitle, masterCategory, subCatProfile, masterCatData, webSnippets, ragSnippets, librarySnippets) {
  return `GÉNÈRE LA SOUS-FICHE SPÉCIALISÉE : "${subCatProfile.label || subCatProfile.title}"
Fiche Master parente : "${masterTitle}" (${masterCategory})
Contexte du Master : ${masterCatData ? (masterCatData.summary || '').substring(0, 800) : 'Non fourni'}

--- EXTRAITS RAG & GUIDES ---
${ragSnippets || webSnippets || librarySnippets || 'Références cliniques standards.'}`;
}

module.exports = {
  getHumanEditMemory,
  composeMasterCATSystemPrompt,
  composeMasterCATUserPrompt,
  composeSubCATSystemPrompt,
  composeSubCATUserPrompt
};
