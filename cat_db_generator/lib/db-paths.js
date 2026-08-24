/**
 * Canonical database path resolution for the CAT Generator pipeline.
 *
 * Naming rule (v1.12.0+): version lives INSIDE the data (`_meta.schema_version`)
 * and in the admin UI — NEVER in filenames. Fixed names forever:
 *   - Production : cats_db.json            (served to clients after metadata strip)
 *   - Staging    : cat_db_generator/cats_db_staged.json
 *
 * Legacy names (cats_db_v3_generated.json / cats_db_v2_generated.json) are
 * transparently migrated on first access. Use scripts/upgrade_db_schema.js for
 * an explicit, backed-up migration.
 */

const fs = require('fs');
const path = require('path');

const STAGING_DB_PATH = path.join(__dirname, '..', 'cats_db_staged.json');
const STAGING_META_PATH = path.join(__dirname, '..', 'cats_db_staged.meta.json');
const LEGACY_DB_PATHS = [
  path.join(__dirname, '..', 'cats_db_v3_generated.json'),
  path.join(__dirname, '..', 'cats_db_v2_generated.json')
];
const CURRENT_SCHEMA_VERSION = '3.5';

function readStagingMeta() {
  try {
    return JSON.parse(fs.readFileSync(STAGING_META_PATH, 'utf8'));
  } catch (_) {
    return null;
  }
}

/**
 * Resolves the staging DB path, transparently migrating any legacy file to the
 * canonical `cats_db_staged.json` name (legacy original is preserved untouched).
 */
function getStagingDbPath() {
  if (fs.existsSync(STAGING_DB_PATH)) return STAGING_DB_PATH;
  for (const legacy of LEGACY_DB_PATHS) {
    if (fs.existsSync(legacy)) {
      try { fs.copyFileSync(legacy, STAGING_DB_PATH); } catch (_) {}
      if (fs.existsSync(STAGING_DB_PATH)) return STAGING_DB_PATH;
      return legacy;
    }
  }
  return STAGING_DB_PATH;
}

module.exports = {
  STAGING_DB_PATH,
  STAGING_META_PATH,
  LEGACY_DB_PATHS,
  CURRENT_SCHEMA_VERSION,
  getStagingDbPath,
  readStagingMeta
};
