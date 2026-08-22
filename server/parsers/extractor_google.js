const fs = require('fs');
const path = require('path');

/**
 * Extracts PDF text using Google Gemini API (gemini-1.5-flash).
 * 
 * @param {string} filePath Absolute path to the PDF file
 * @param {string} apiKey Google Gemini API Key
 * @returns {Promise<Array>} Array of pages { page: number, content: string }
 */
async function extractWithGoogle(filePath, apiKey) {
  if (!apiKey) {
    throw new Error('Google API Key is missing');
  }

  try {
    console.log(`[Google Gemini] Starting extraction for ${path.basename(filePath)}...`);
    
    // Read file and convert to Base64
    const fileData = await fs.promises.readFile(filePath);
    const base64Data = fileData.toString('base64');
    
    // We use gemini-3.6-flash for fast, high-quality multimodal medical extraction
    const model = 'gemini-3.6-flash';
    const url = `https://generativelanguage.googleapis.com/v1beta/models/${model}:generateContent?key=${apiKey}`;
    
    const payload = {
      contents: [
        {
          parts: [
            {
              inlineData: {
                mimeType: "application/pdf",
                data: base64Data
              }
            },
            {
              text: "Extract all the text from this document accurately. Preserve the reading order and layout as best as possible. Do not add any conversational filler, only output the text of the document. If there are clear page breaks or distinct sections, separate them with '---'."
            }
          ]
        }
      ],
      generationConfig: {
        temperature: 0.1
      }
    };

    const res = await fetch(url, {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json'
      },
      body: JSON.stringify(payload)
    });

    if (!res.ok) {
      const errTxt = await res.text();
      throw new Error(`Google API failed: ${res.status} - ${errTxt}`);
    }

    const data = await res.json();
    
    // Safely extract the text response
    let rawText = '';
    if (data.candidates && data.candidates[0] && data.candidates[0].content && data.candidates[0].content.parts) {
      rawText = data.candidates[0].content.parts.map(p => p.text).join('\n');
    } else {
      throw new Error('Google API returned unexpected response format');
    }
    
    // Gemini returns a continuous string. We split it similar to LlamaParse.
    let pages = [];
    const pageSplits = rawText.split(/\n---\n/g);
    
    if (pageSplits.length === 1) {
      // If no page breaks were generated, just chunk it safely by character count to avoid blowing up memory
      const chunkSize = 2500;
      for (let i = 0; i < rawText.length; i += chunkSize) {
        pages.push({
          page: Math.floor(i / chunkSize) + 1,
          content: rawText.substring(i, i + chunkSize)
        });
      }
    } else {
      pageSplits.forEach((chunk, index) => {
        pages.push({
          page: index + 1,
          content: (chunk || '').trim()
        });
      });
    }

    return {
      quality: 'online-google',
      pages: pages
    };

  } catch (err) {
    console.error(`[Google Extractor] Failed to parse ${filePath}`, err);
    throw err;
  }
}

module.exports = {
  extractWithGoogle
};
