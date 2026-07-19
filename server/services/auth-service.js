const crypto = require('crypto');
const path = require('path');
const fs = require('fs');
const { state: cache } = require('./cache');

const PASSWORD_FILE = path.join(__dirname, '..', '..', 'admin_password.txt');
const ADMIN_TOKEN_TTL = 12 * 60 * 60 * 1000;
const MAX_LOGIN_ATTEMPTS = 5;
const LOGIN_RATE_LIMIT_MS = 5 * 60 * 1000;

const loginAttempts = new Map();

function hashPassword(password, salt) {
  return crypto.pbkdf2Sync(password, salt, 100000, 64, 'sha512').toString('hex');
}

async function initAdminPassword() {
  try {
    const exists = await fs.promises.access(PASSWORD_FILE).then(() => true).catch(() => false);
    if (exists) {
      const rawContent = (await fs.promises.readFile(PASSWORD_FILE, 'utf-8')).trim();
      if (rawContent.includes(':')) {
        const parts = rawContent.split(':');
        cache.adminPasswordSalt = parts[0];
        cache.adminPasswordHash = parts[1];
      } else {
        cache.adminPasswordSalt = crypto.randomBytes(16).toString('hex');
        cache.adminPasswordHash = hashPassword(rawContent, cache.adminPasswordSalt);
        await fs.promises.writeFile(PASSWORD_FILE, `${cache.adminPasswordSalt}:${cache.adminPasswordHash}`, 'utf-8');
        console.log(`[SECURITY] Migrated plain-text password in ${PASSWORD_FILE} to PBKDF2 hash.`);
      }
    } else {
      let plainPassword;
      if (process.env.ADMIN_PASSWORD) {
        plainPassword = process.env.ADMIN_PASSWORD;
        console.log(`[SECURITY] Using ADMIN_PASSWORD from environment variable.`);
      } else {
        plainPassword = crypto.randomBytes(16).toString('hex');
      }
      cache.adminPasswordSalt = crypto.randomBytes(16).toString('hex');
      cache.adminPasswordHash = hashPassword(plainPassword, cache.adminPasswordSalt);
      await fs.promises.writeFile(PASSWORD_FILE, `${cache.adminPasswordSalt}:${cache.adminPasswordHash}`, 'utf-8');
      console.log(`[SECURITY] Admin password generated and saved to: ${PASSWORD_FILE}`);
    }
  } catch (err) {
    console.error("Error loading or generating admin password:", err);
  }
}

function isAdminRequest(req, activeTokens) {
  const token = req.headers['x-admin-token'];
  if (!token || !activeTokens.has(token)) return false;
  const entry = activeTokens.get(token);
  if (Date.now() > entry.expiresAt) {
    activeTokens.delete(token);
    return false;
  }
  return true;
}

function createToken() {
  return crypto.randomBytes(16).toString('hex');
}

module.exports = {
  ADMIN_TOKEN_TTL,
  MAX_LOGIN_ATTEMPTS,
  LOGIN_RATE_LIMIT_MS,
  loginAttempts,
  hashPassword,
  initAdminPassword,
  isAdminRequest,
  createToken
};
