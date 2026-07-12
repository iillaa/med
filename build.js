const fs = require('fs');
const path = require('path');

function rebuildClientAssets() {
  const publicDataDir = path.join(__dirname, 'public', 'data');
  if (!fs.existsSync(publicDataDir)) {
    fs.mkdirSync(publicDataDir, { recursive: true });
  }

  // Copy cats_db.json
  fs.copyFileSync(
    path.join(__dirname, 'cats_db.json'),
    path.join(publicDataDir, 'cats_db.json')
  );
  console.log("Copied cats_db.json to public/data/");

  // Copy pdf_index.json and generate pdf_list.json
  const pdfIndexSource = path.join(__dirname, 'pdf_index.json');
  if (fs.existsSync(pdfIndexSource)) {
    fs.copyFileSync(
      pdfIndexSource,
      path.join(publicDataDir, 'pdf_index.json')
    );
    console.log("Copied pdf_index.json to public/data/");

    // Generate lightweight pdf_list.json for fast rendering of lists
    try {
      const rawData = fs.readFileSync(pdfIndexSource, 'utf-8');
      const index = JSON.parse(rawData);
      const list = index.map(doc => doc.pdf);
      fs.writeFileSync(
        path.join(publicDataDir, 'pdf_list.json'),
        JSON.stringify(list, null, 2),
        'utf-8'
      );
      console.log("Generated and copied pdf_list.json to public/data/");
    } catch (err) {
      console.error("Error generating pdf_list.json during build:", err);
    }
  } else {
    console.warn("pdf_index.json not found, skipping copy and list generation.");
  }

  // Generate public/js/remote_config.js from remote_server_config.json
  const configFile = path.join(__dirname, 'remote_server_config.json');
  const configJsPath = path.join(__dirname, 'public', 'js', 'remote_config.js');
  let remoteServerUrl = '';
  let remoteServerUrls = [];
  let primaryProvider = null;
  
  if (fs.existsSync(configFile)) {
    try {
      const content = fs.readFileSync(configFile, 'utf-8');
      const parsed = JSON.parse(content);
      if (Array.isArray(parsed.urls)) {
        remoteServerUrls = parsed.urls;
        remoteServerUrl = remoteServerUrls[0] || '';
      } else if (parsed.url) {
        remoteServerUrls = [parsed.url];
        remoteServerUrl = parsed.url;
      }
      primaryProvider = parsed.primaryProvider || null;
    } catch (err) {
      console.error("Error reading remote_server_config.json during build:", err);
    }
  }

  try {
    fs.writeFileSync(
      configJsPath,
      `export const REMOTE_SERVER_URL = ${JSON.stringify(remoteServerUrl)};\nexport const REMOTE_SERVER_URLS = ${JSON.stringify(remoteServerUrls)};\nexport const REMOTE_SERVER_CONFIG = ${JSON.stringify({ primaryProvider, urls: remoteServerUrls })};\n`,
      'utf-8'
    );
    console.log(`Generated public/js/remote_config.js with ${remoteServerUrls.length} URL(s): ${remoteServerUrls.join(', ') || '(none)'}`);
  } catch (err) {
    console.error("Error writing remote_config.js during build:", err);
  }
}

module.exports = { rebuildClientAssets };

// If run directly from the command line
if (require.main === module) {
  rebuildClientAssets();
}

