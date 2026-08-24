#!/usr/bin/env node
/**
 * Safe staging-DB schema upgrade & migration.
 *
 * - Detects legacy staging files (cats_db_v3_generated.json / cats_db_v2_generated.json)
 *   and migrates them to the canonical `cat_db_generator/cats_db_staged.json`.
 * - Backs up every source file into backups/ before touching anything.
 * - Runs full medical/schema validation on every entry (report only — never blocks
 *   migration, because warnings are expected on legacy data).
 * - Stamps `_meta: { schema_version, stagedAt, migratedFrom }` into the staged DB.
 * - Legacy originals are KEPT unless `--clean` is passed.
 *
 * Usage:
 *   node scripts/upgrade_db_schema.js            # migrate + stamp + report
 *   node scripts/upgrade_db_schema.js --clean    # same, but delete legacy files after success
 *   node scripts/upgrade_db_schema.js --version 3.6   # re-stamp an existing staged DB to a new version
 */

const fs = require('fs');
const path = require('path');

const ROOT = path.join(__dirname, '..');
const GEN_DIR = path.join(ROOT, 'cat_db_generator');
const STAGED_PATH = path.join(GEN_DIR, 'cats_db_staged.json');
const META_PATH = path.join(GEN_DIR, 'cats_db_staged.meta.json');
const LEGACY_PATHS = [
  path.join(GEN_DIR, 'cats_db_v3_generated.json'),
  path.join(GEN_DIR, 'cats_db_v2_generated.json')
];
const BACKUP_DIR = path.join(ROOT, 'backups');

function loadMetaSidecar() {
  try { return JSON.parse(fs.readFileSync(META_PATH, 'utf8')); } catch (_) { return null; }
}

const args = process.argv.slice(2);
const clean = args.includes('--clean');
const versionIdx = args.indexOf('--version');
const targetVersion = versionIdx !== -1 ? String(args[versionIdx + 1] || '') : null;

function backup(file) {
  if (!fs.existsSync(BACKUP_DIR)) fs.mkdirSync(BACKUP_DIR, { recursive: true });
  const stamp = new Date().toISOString().replace(/[:.]/g, '-');
  const dest = path.join(BACKUP_DIR, `${path.basename(file, '.json')}_pre_migration_${stamp}.json`);
  fs.copyFileSync(file, dest);
  return dest;
}

function loadEntries(file) {
  const raw = JSON.parse(fs.readFileSync(file, 'utf8'));
  if (Array.isArray(raw)) return { entries: raw, meta: null };
  // Object-form (from older experiments): unwrap embedded entries + _meta
  const { _meta, ...rest } = raw;
  const entriesKey = Object.keys(rest)[0];
  return { entries: Array.isArray(rest[entriesKey]) ? rest[entriesKey] : [], meta: _meta || null };
}

function main() {
  const { validateCAT } = require(path.join(ROOT, 'cat_db_generator', 'lib', 'medical-validator'));
  const { CURRENT_SCHEMA_VERSION } = require(path.join(ROOT, 'cat_db_generator', 'lib', 'db-paths'));

  console.log('🛡️  Staging DB schema upgrade\n=============================');

  let sourceFile = null;
  let sourceLabel = null;

  if (fs.existsSync(STAGED_PATH)) {
    sourceFile = STAGED_PATH;
    sourceLabel = 'cats_db_staged.json (already canonical)';
    if (!targetVersion && !clean) {
      console.log(`✔ ${sourceLabel} already in place. Nothing to do.`);
      console.log('  Use --version X.Y to re-stamp, or --clean to purge legacy leftovers.');
      process.exit(0);
    }
  } else {
    sourceFile = LEGACY_PATHS.find(p => fs.existsSync(p)) || null;
    if (!sourceFile) {
      console.log('ℹ️ No staged or legacy staging database found. Nothing to do.');
      process.exit(0);
    }
    sourceLabel = path.basename(sourceFile);
  }

  const backupPath = backup(sourceFile);
  console.log(`📦 Backup: ${backupPath}`);

  const { entries, meta: existingMeta } = loadEntries(sourceFile);
  const priorMeta = existingMeta || loadMetaSidecar();
  console.log(`📋 Loaded ${entries.length} CAT entries from ${sourceLabel}`);

  let validCount = 0;
  const problems = [];
  entries.forEach((cat, i) => {
    const v = validateCAT(cat);
    if (v.valid) { validCount++; return; }
    problems.push({ index: i + 1, id: cat.id, title: cat.title, errors: v.errors.slice(0, 3) });
  });
  console.log(`✅ Schema validation: ${validCount}/${entries.length} entries fully valid.`);
  if (problems.length) {
    console.log(`⚠️  ${problems.length} legacy entr(ies) have validation issues (informational, not blocking):`);
    problems.slice(0, 10).forEach(p =>
      console.log(`   #${p.index} (ID ${p.id}) "${p.title}":\n      - ${p.errors.join('\n      - ')}`));
    if (problems.length > 10) console.log(`   …and ${problems.length - 10} more.`);
  }

  // Staged DB MUST remain a pure JSON array — every consumer (server routes,
  // llm-engine human-memory) parses it as an array. Version metadata goes into
  // a sidecar file so filenames stay fixed and consumers never break.
  fs.writeFileSync(STAGED_PATH, JSON.stringify(entries, null, 2), 'utf8');
  const finalVersion = targetVersion || (priorMeta && priorMeta.schema_version) || CURRENT_SCHEMA_VERSION;
  const metaPayload = {
    schema_version: finalVersion,
    stagedAt: new Date().toISOString(),
    migratedFrom: path.basename(sourceFile),
    totalEntries: entries.length,
    note: 'Version lives here and in the admin UI — never in filenames.'
  };
  fs.writeFileSync(META_PATH, JSON.stringify(metaPayload, null, 2), 'utf8');
  console.log(`💾 Canonical staged DB written: cat_db_generator/cats_db_staged.json (${entries.length} entries, pure array)`);
  console.log(`🏷️  Sidecar meta written: cats_db_staged.meta.json (schema_version=${finalVersion})`);

  if (clean) {
    for (const legacy of LEGACY_PATHS) {
      if (fs.existsSync(legacy)) {
        fs.unlinkSync(legacy);
        console.log(`🧹 Removed legacy file: ${path.basename(legacy)}`);
      }
    }
  } else {
    const leftovers = LEGACY_PATHS.filter(p => fs.existsSync(p));
    if (leftovers.length) {
      console.log(`ℹ️ Legacy files kept: ${leftovers.map(p => path.basename(p)).join(', ')}`);
      console.log('   Run again with --clean to remove them after verifying the app.');
    }
  }

  console.log('\n🎉 Done. The Generator Lab UI now reports this schema_version via /api/admin/cat-generator/data.');
}

main();
