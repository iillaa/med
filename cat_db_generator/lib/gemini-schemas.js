/**
 * Gemini OpenAPI Native Response Schemas
 * Used by Google AI Studio API for Constrained Decoding (Guaranteed Valid JSON output).
 */

const MASTER_CAT_SCHEMA = {
  type: 'OBJECT',
  properties: {
    category: {
      type: 'STRING',
      description: 'Spécialité médicale principale (ex: Cardiologie, Pneumologie, Pédiatrie)'
    },
    title: {
      type: 'STRING',
      description: 'Titre clinique précis (ex: CAT devant une Lombalgie Aiguë)'
    },
    search_keywords: {
      type: 'ARRAY',
      items: { type: 'STRING' },
      description: 'Mots-clés, synonymes, signes cliniques et abréviations médicales'
    },
    summary: {
      type: 'STRING',
      description: 'Synthèse diagnostique et CAT structurée avec accordéons markdown (# 1. ..., # 2. ...)'
    },
    red_flags: {
      type: 'STRING',
      description: 'Signes d\'alarme et critères d\'hospitalisation / réorientation urgente'
    },
    ordonnance: {
      type: 'STRING',
      description: 'Ordonnance type de cabinet en 4 sections avec posologies exactes, DCI et durée'
    },
    sub_cats: {
      type: 'ARRAY',
      items: {
        type: 'OBJECT',
        properties: {
          id: { type: 'STRING' },
          label: { type: 'STRING', description: 'Intitulé clinique du sous-profil (ex: Femme Enceinte, Sujet Âgé)' },
          summary: { type: 'STRING', description: 'Démarche diagnostique adaptée à ce sous-profil' },
          red_flags: { type: 'STRING', description: 'Signes de gravité spécifiques à cette population' },
          ordonnance: { type: 'STRING', description: 'Prescription adaptée au terrain avec molécules sécurisées' }
        },
        required: ['label', 'summary', 'red_flags', 'ordonnance']
      },
      description: 'Sous-fiches contextuelles par terrain ou gravité'
    }
  },
  required: ['category', 'title', 'summary', 'red_flags', 'ordonnance']
};

const SUB_CAT_SCHEMA = {
  type: 'OBJECT',
  properties: {
    label: {
      type: 'STRING',
      description: 'Intitulé clinique du sous-profil (ex: Femme Enceinte, Sujet Âgé, Forme Grave)'
    },
    summary: {
      type: 'STRING',
      description: 'Démarche diagnostique et CAT adaptée au terrain avec accordéons markdown'
    },
    red_flags: {
      type: 'STRING',
      description: 'Signes d\'alarme spécifiques à ce profil'
    },
    ordonnance: {
      type: 'STRING',
      description: 'Prescription thérapeutique sécurisée adaptée à cette situation'
    }
  },
  required: ['label', 'summary', 'red_flags', 'ordonnance']
};

module.exports = {
  MASTER_CAT_SCHEMA,
  SUB_CAT_SCHEMA
};
