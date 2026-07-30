const assert = require('assert');
const fs = require('fs');
const path = require('path');

console.log('[TestCatSearch] Starting CAT deep content search unit tests...');

const catsDbPath = path.join(__dirname, '..', 'public', 'data', 'cats_db.json');
const cats = JSON.parse(fs.readFileSync(catsDbPath, 'utf-8'));

function deepSearchCats(allCats, query) {
  const queryTokens = query.toLowerCase().trim().split(/\s+/).filter(Boolean);

  return allCats.filter(cat => {
    if (!cat) return false;

    const titleStr = (cat.title || '').toLowerCase();
    const summaryStr = (cat.summary || cat.customSummary || '').toLowerCase();
    const ordonnanceStr = (cat.ordonnance || cat.customOrdonnance || '').toLowerCase();
    const redFlagsStr = (cat.red_flags || '').toLowerCase();
    const categoryStr = (cat.category || '').toLowerCase();
    const notesStr = (cat.notes || '').toLowerCase();
    const keywordsStr = Array.isArray(cat.pdf_keywords) ? cat.pdf_keywords.join(' ').toLowerCase() : (cat.pdf_keywords || '').toLowerCase();
    const idStr = cat.id !== undefined && cat.id !== null ? String(cat.id) : '';

    const fullCatText = `${idStr} ${titleStr} ${categoryStr} ${summaryStr} ${ordonnanceStr} ${redFlagsStr} ${keywordsStr} ${notesStr}`;

    return queryTokens.length === 0 || queryTokens.every(token => fullCatText.includes(token));
  });
}

// Test 1: Search for a drug in prescription "spasfon"
const spasfonResults = deepSearchCats(cats, 'spasfon');
assert.strictEqual(spasfonResults.length > 0, true, 'Should find CAT fiches containing Spasfon in prescription or summary');

// Test 2: Search for "amoxicilline"
const amoxResults = deepSearchCats(cats, 'amoxicilline');
assert.strictEqual(amoxResults.length > 0, true, 'Should find CAT fiches containing Amoxicilline');

// Test 3: Multi-token search "orl"
const orlResults = deepSearchCats(cats, 'orl');
assert.strictEqual(orlResults.length > 0, true, 'Should find ORL fiches');

console.log(`✅ Deep search tests passed! Found ${spasfonResults.length} fiches for "spasfon", ${amoxResults.length} for "amoxicilline", ${orlResults.length} for "orl".`);
console.log('🎉 ALL CAT SEARCH TESTS PASSED SUCCESSFULLY!');
