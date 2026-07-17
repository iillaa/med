#!/usr/bin/env node
/**
 * Set a custom admin password for Dr. CAT
 *
 * Usage:
 *   node set_admin_password.js                    # interactive mode
 *   node set_admin_password.js mypassword123       # command-line mode
 *
 * The password is hashed with PBKDF2 (same as server.js) and saved to admin_password.txt
 */

const crypto = require('crypto');
const fs = require('fs');
const path = require('path');

const PASSWORD_FILE = path.join(__dirname, 'admin_password.txt');
const PBKDF2_ITERATIONS = 100000;
const HASH_LENGTH = 64; // bytes
const SALT_LENGTH = 16; // bytes

function hashPassword(password, salt) {
  return crypto.pbkdf2Sync(password, salt, PBKDF2_ITERATIONS, HASH_LENGTH, 'sha512').toString('hex');
}

function getExistingSalt() {
  try {
    const rawContent = fs.readFileSync(PASSWORD_FILE, 'utf-8').trim();
    if (rawContent.includes(':')) {
      return rawContent.split(':')[0];
    }
  } catch (err) {
    // File doesn't exist yet
  }
  return null;
}

async function main() {
  // Get password from command line arg or prompt
  let password;
  if (process.argv[2]) {
    password = process.argv[2];
  } else {
    password = prompt('Enter new admin password: ');
    if (!password) {
      console.error('No password provided. Exiting.');
      process.exit(1);
    }
  }

  if (password.length < 4) {
    console.error('Password must be at least 4 characters.');
    process.exit(1);
  }

  // Use existing salt or generate new one
  let salt = getExistingSalt();
  if (!salt) {
    salt = crypto.randomBytes(SALT_LENGTH).toString('hex');
    console.log(`[INFO] Generated new salt: ${salt}`);
  } else {
    console.log(`[INFO] Using existing salt from admin_password.txt`);
  }

  // Hash and save
  const hash = hashPassword(password, salt);
  await fs.promises.writeFile(PASSWORD_FILE, `${salt}:${hash}`, 'utf-8');

  console.log(`\n=================================================`);
  console.log(`[SUCCESS] Admin password updated!`);
  console.log(`Saved to: ${PASSWORD_FILE}`);
  console.log(`Salt: ${salt}`);
  console.log(`Hash: ${hash}`);
  console.log(`\nYour new admin password is: ${password}`);
  console.log(`=================================================\n`);
  console.log(`[IMPORTANT] Restart the server for changes to take effect:`);
  console.log(`   node server.js`);
}

main().catch(err => {
  console.error('Error setting admin password:', err);
  process.exit(1);
});
