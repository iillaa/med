/**
 * Semantic Vector RAG Engine for Medical PDFs
 * Uses Google AI Studio text-embedding-004 API with local disk caching
 * and pure JavaScript cosine similarity computation.
 */

const fs = require('fs');
const path = require('path');
const debugEmitter = require('./debug-emitter');

const EMBEDDINGS_CACHE_PATH = path.join(__dirname, '..', '..', 'data', 'pdf_embeddings_cache.json');
let memoryEmbeddingsCache = null;

function getEmbeddingsCache() {
  if (memoryEmbeddingsCache) return memoryEmbeddingsCache;
  if (fs.existsSync(EMBEDDINGS_CACHE_PATH)) {
    try {
      memoryEmbeddingsCache = JSON.parse(fs.readFileSync(EMBEDDINGS_CACHE_PATH, 'utf8'));
      return memoryEmbeddingsCache;
    } catch (_) {}
  }
  memoryEmbeddingsCache = {};
  return memoryEmbeddingsCache;
}

function saveEmbeddingsCache() {
  if (!memoryEmbeddingsCache) return;
  try {
    const dataDir = path.dirname(EMBEDDINGS_CACHE_PATH);
    if (!fs.existsSync(dataDir)) fs.mkdirSync(dataDir, { recursive: true });
    fs.writeFileSync(EMBEDDINGS_CACHE_PATH, JSON.stringify(memoryEmbeddingsCache), 'utf8');
  } catch (err) {
    console.warn('[SemanticRAG] Warning: Failed to save embeddings cache:', err.message);
  }
}

/**
 * Computes embedding vector using Google AI Studio text-embedding-004
 */
async function computeEmbedding(text, apiKey) {
  if (!text || typeof text !== 'string' || text.trim().length === 0) return null;
  const key = apiKey || process.env.GOOGLE_API_KEY || process.env.GEMINI_API_KEY;
  if (!key) throw new Error('API Key missing for embedding generation');

  const cleanText = text.replace(/\s+/g, ' ').trim().slice(0, 2048);
  const cache = getEmbeddingsCache();
  if (cache[cleanText]) {
    return cache[cleanText];
  }

  const url = `https://generativelanguage.googleapis.com/v1beta/models/text-embedding-004:embedContent?key=${key}`;
  const res = await fetch(url, {
    method: 'POST',
    headers: { 'Content-Type': 'application/json' },
    body: JSON.stringify({
      model: 'models/text-embedding-004',
      content: {
        parts: [{ text: cleanText }]
      }
    })
  });

  if (!res.ok) {
    const errBody = await res.text();
    throw new Error(`Embedding API failed with HTTP ${res.status}: ${errBody.slice(0, 150)}`);
  }

  const json = await res.json();
  if (!json.embedding || !Array.isArray(json.embedding.values)) {
    throw new Error('Invalid embedding response format from Google AI Studio');
  }

  const vector = json.embedding.values;
  cache[cleanText] = vector;
  saveEmbeddingsCache();
  return vector;
}

/**
 * Mathematical Cosine Similarity between two N-dimensional vectors
 */
function cosineSimilarity(vecA, vecB) {
  if (!Array.isArray(vecA) || !Array.isArray(vecB) || vecA.length !== vecB.length) return 0;
  let dot = 0, normA = 0, normB = 0;
  for (let i = 0; i < vecA.length; i++) {
    dot += vecA[i] * vecB[i];
    normA += vecA[i] * vecA[i];
    normB += vecB[i] * vecB[i];
  }
  if (normA === 0 || normB === 0) return 0;
  return dot / (Math.sqrt(normA) * Math.sqrt(normB));
}

/**
 * Semantic Vector Search across medical PDF slices and extracted text pages
 */
async function searchSemanticPDFs(query, options = {}) {
  const apiKey = options.apiKey || process.env.GOOGLE_API_KEY || process.env.GEMINI_API_KEY;
  const maxResults = options.maxResults || 4;

  try {
    const queryVector = await computeEmbedding(query, apiKey);
    if (!queryVector) return [];

    const { getPdfIndex } = require('./pdf-extractor');
    const allDocs = getPdfIndex();

    const scoredSnippets = [];

    for (const doc of allDocs) {
      const fileName = doc.pdf || 'unknown.pdf';
      const pages = Array.isArray(doc.pages) ? doc.pages : [];

      for (const page of pages) {
        const content = page.content || '';
        if (content.length < 50) continue;

        // Extract substantive clinical block
        const snippet = content.slice(0, 1200);
        let snippetVector = null;

        try {
          snippetVector = await computeEmbedding(snippet, apiKey);
        } catch (_) {
          continue;
        }

        if (snippetVector) {
          const sim = cosineSimilarity(queryVector, snippetVector);
          if (sim >= 0.55) { // Minimum semantic relevance threshold
            scoredSnippets.push({
              pdfFile: fileName,
              page: page.page || 1,
              score: Math.round(sim * 100),
              similarity: sim,
              snippet: snippet,
              quality: doc.quality || 'master'
            });
          }
        }
      }
    }

    scoredSnippets.sort((a, b) => b.similarity - a.similarity);
    const topResults = scoredSnippets.slice(0, maxResults);

    debugEmitter.emitEvent('semantic_rag_search_done', {
      query,
      resultsCount: topResults.length,
      topSimilarity: topResults[0] ? topResults[0].similarity : 0
    });

    return topResults;
  } catch (err) {
    console.warn(`⚠️ [Semantic RAG] Vector search error: ${err.message}. Falling back to lexical search.`);
    return [];
  }
}

module.exports = {
  computeEmbedding,
  cosineSimilarity,
  searchSemanticPDFs
};
