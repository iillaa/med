const { PDFParse } = require('pdf-parse');
const fs = require('fs');

/**
 * Basic offline extractor using pdf-parse.
 * Used as a fallback if LlamaParse is unavailable or fails.
 * 
 * @param {string} filePath Absolute path to the PDF file
 * @returns {Promise<Array>} Array of pages { page: number, content: string }
 */
async function extractWithOffline(filePath) {
  try {
    const dataBuffer = await fs.promises.readFile(filePath);
    
    const parser = new PDFParse({ data: dataBuffer });
    const res = await parser.getText();
    
    const pages = res.pages.map(p => ({
      page: p.num,
      content: (p.text || '').trim()
    }));

    await parser.destroy();
    
    return {
      quality: 'offline',
      pages: pages
    };
  } catch (err) {
    console.error(`[Offline Extractor] Failed to parse ${filePath}`, err);
    throw err;
  }
}

module.exports = { extractWithOffline };
