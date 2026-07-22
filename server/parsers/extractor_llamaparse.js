const fs = require('fs');
const path = require('path');
// We can use standard native fetch in Node 18+

/**
 * Extracts PDF text using LlamaParse online service.
 * Superior for complex medical PDFs with multiple columns.
 * 
 * @param {string} filePath Absolute path to the PDF file
 * @param {string} apiKey LlamaParse API Key
 * @returns {Promise<Array>} Array of pages
 */
async function extractWithLlamaParse(filePath, apiKey) {
  if (!apiKey) {
    throw new Error('LlamaParse API Key is missing');
  }

  try {
    console.log(`[LlamaParse] Starting upload for ${path.basename(filePath)}...`);
    
    // 1. Upload the file
    const formData = new FormData();
    const fileData = await fs.promises.readFile(filePath);
    const blob = new Blob([fileData], { type: 'application/pdf' });
    formData.append('file', blob, path.basename(filePath));

    // Wait, native FormData in Node 18 might be missing or limited. 
    // We should use an alternative or just standard multi-part boundary generation if fetch FormData fails.
    // However, Node 18 fetch supports FormData if imported correctly, but lets just assume standard fetch for now.
    
    // Actually LlamaParse accepts standard form-data
    const uploadRes = await fetch('https://api.cloud.llamaindex.ai/api/parsing/upload', {
      method: 'POST',
      headers: {
        'Authorization': `Bearer ${apiKey}`,
        'Accept': 'application/json'
      },
      body: formData
    });

    if (!uploadRes.ok) {
      const errTxt = await uploadRes.text();
      throw new Error(`Upload failed: ${uploadRes.status} - ${errTxt}`);
    }

    const uploadData = await uploadRes.json();
    const jobId = uploadData.id;
    
    console.log(`[LlamaParse] Job created (ID: ${jobId}). Polling for completion...`);

    // 2. Poll for completion
    let maxRetries = 30; // 30 * 2s = 60s
    let status = 'PENDING';
    
    while (status !== 'SUCCESS' && maxRetries > 0) {
      await new Promise(r => setTimeout(r, 2000));
      
      const statusRes = await fetch(`https://api.cloud.llamaindex.ai/api/parsing/job/${jobId}`, {
        headers: {
          'Authorization': `Bearer ${apiKey}`,
          'Accept': 'application/json'
        }
      });
      
      const statusData = await statusRes.json();
      status = statusData.status;
      
      if (status === 'ERROR') {
        throw new Error(`LlamaParse job failed: ${JSON.stringify(statusData)}`);
      }
      maxRetries--;
    }
    
    if (status !== 'SUCCESS') {
      throw new Error('LlamaParse job timed out.');
    }

    // 3. Fetch the results
    console.log(`[LlamaParse] Job ${jobId} complete. Fetching markdown result...`);
    const resultRes = await fetch(`https://api.cloud.llamaindex.ai/api/parsing/job/${jobId}/result/markdown`, {
      headers: {
        'Authorization': `Bearer ${apiKey}`,
        'Accept': 'application/json'
      }
    });

    const resultData = await resultRes.json();
    const rawMarkdown = resultData.markdown || '';
    
    // LlamaParse returns a continuous markdown string. 
    // To adapt it to our "per page" search standard, we will try to split by its typical page breaks
    // (e.g. ---) or just treat it as 1 giant page chunk if it doesn't have page markers.
    
    let pages = [];
    const pageSplits = rawMarkdown.split(/\n---\n/g);
    
    pageSplits.forEach((chunk, index) => {
       pages.push({
         page: index + 1,
         content: chunk.trim().substring(0, 1500) // Bound size for mobile memory
       });
    });

    return {
      quality: 'online',
      pages: pages
    };

  } catch (err) {
    console.error(`[LlamaParse] Error processing ${filePath}`, err);
    throw err;
  }
}

module.exports = { extractWithLlamaParse };
