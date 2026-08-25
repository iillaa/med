const fs = require('fs');
const path = require('path');
const { isAdminRequest: checkIsAdmin } = require('../services/auth-service');
const { state: cache } = require('../services/cache');
const { generateQuizSuiteForCat, exportToPublicQuizDb, QUIZ_STAGED_PATH, QUIZ_PROD_PATH } = require('../../cat_db_generator/lib/quiz-generator-v2');

const PROD_DB_PATH = process.env.CATS_DB_PATH || path.join(__dirname, '..', '..', 'cats_db.json');

function registerQuizGeneratorRoutes(app) {
  function verifyAdminAccess(req, res) {
    if (!checkIsAdmin(req, cache.activeTokens)) {
      res.status(403).json({ error: 'Accès interdit. Vous devez être administrateur pour accéder au Quiz Staging Lab.' });
      return false;
    }
    return true;
  }

  // GET /api/admin/quiz-lab/data -> List all CATs with their quiz staging status
  app.get('/api/admin/quiz-lab/data', (req, res) => {
    if (!verifyAdminAccess(req, res)) return;

    let cats = [];
    if (fs.existsSync(PROD_DB_PATH)) {
      try {
        cats = JSON.parse(fs.readFileSync(PROD_DB_PATH, 'utf8'));
      } catch (e) {}
    }

    let stagedSuites = [];
    if (fs.existsSync(QUIZ_STAGED_PATH)) {
      try {
        stagedSuites = JSON.parse(fs.readFileSync(QUIZ_STAGED_PATH, 'utf8'));
      } catch (e) {}
    }

    let publicVignettes = [];
    if (fs.existsSync(QUIZ_PROD_PATH)) {
      try {
        publicVignettes = JSON.parse(fs.readFileSync(QUIZ_PROD_PATH, 'utf8'));
      } catch (e) {}
    }

    const items = cats.map(cat => {
      const staged = stagedSuites.find(s => s.cat_id === cat.id);
      return {
        id: cat.id,
        title: cat.title,
        category: cat.category,
        hasStagedQuiz: !!staged,
        vignetteCount: staged && Array.isArray(staged.vignettes) ? staged.vignettes.length : 0,
        diagQcmCount: staged && Array.isArray(staged.qcm_diagnostics) ? staged.qcm_diagnostics.length : 0,
        prescQcmCount: staged && Array.isArray(staged.qcm_prescriptions) ? staged.qcm_prescriptions.length : 0,
        redFlagsCount: staged && Array.isArray(staged.red_flags_cases) ? staged.red_flags_cases.length : 0,
        stagedData: staged || null
      };
    });

    res.json({
      totalCats: cats.length,
      stagedCount: stagedSuites.length,
      publicCount: publicVignettes.length,
      items: items
    });
  });

  // POST /api/admin/quiz-lab/generate -> Generate live AI quiz for a specific CAT
  app.post('/api/admin/quiz-lab/generate', async (req, res) => {
    if (!verifyAdminAccess(req, res)) return;

    const { catId } = req.body || {};
    if (!catId) {
      return res.status(400).json({ error: "Identifiant catId manquant." });
    }

    let cats = [];
    if (fs.existsSync(PROD_DB_PATH)) {
      cats = JSON.parse(fs.readFileSync(PROD_DB_PATH, 'utf8'));
    }
    const cat = cats.find(c => c.id === parseInt(catId));
    if (!cat) {
      return res.status(404).json({ error: `CAT introuvable pour l'id: ${catId}` });
    }

    try {
      const suite = await generateQuizSuiteForCat(cat);

      let stagedSuites = [];
      if (fs.existsSync(QUIZ_STAGED_PATH)) {
        try { stagedSuites = JSON.parse(fs.readFileSync(QUIZ_STAGED_PATH, 'utf8')); } catch (_) {}
      }

      const existingIdx = stagedSuites.findIndex(s => s.cat_id === cat.id);
      if (existingIdx >= 0) {
        stagedSuites[existingIdx] = suite;
      } else {
        stagedSuites.push(suite);
      }

      fs.writeFileSync(QUIZ_STAGED_PATH, JSON.stringify(stagedSuites, null, 2), 'utf8');

      res.json({
        success: true,
        message: `Quiz généré avec succès pour : ${cat.title}`,
        suite: suite
      });
    } catch (err) {
      console.error("[QuizLab API Error]", err);
      res.status(500).json({ error: `Erreur lors de la génération du quiz : ${err.message}` });
    }
  });

  // POST /api/admin/quiz-lab/publish -> Publish Staging into public/data/quiz_db.json
  app.post('/api/admin/quiz-lab/publish', (req, res) => {
    if (!verifyAdminAccess(req, res)) return;

    if (!fs.existsSync(QUIZ_STAGED_PATH)) {
      return res.status(400).json({ error: "Aucun staging quiz à publier." });
    }

    try {
      const stagedSuites = JSON.parse(fs.readFileSync(QUIZ_STAGED_PATH, 'utf8'));
      const publicList = exportToPublicQuizDb(stagedSuites);
      fs.writeFileSync(QUIZ_PROD_PATH, JSON.stringify(publicList, null, 2), 'utf8');
      
      res.json({
        success: true,
        message: `Base publique mise à jour (${publicList.length} vignettes publiées).`,
        publishedCount: publicList.length
      });
    } catch (err) {
      res.status(500).json({ error: `Échec de la publication : ${err.message}` });
    }
  });
}

module.exports = { registerQuizGeneratorRoutes };
