# Hybrid PDF Indexing Architecture

Your core idea is fantastic. To build this for the long term and ensure the Dr.CAT app's search remains incredibly fast and accurate, there are three critical improvements to your basic implementation that we must add:

### Improvement A: Hashing instead of `mtime` & `size`
Right now, the script checks if a file changed by looking at the file size and the "last modified" date (`mtime`). This is fragile. If you move files around, the `mtime` changes, and the script will waste API credits re-parsing files that haven't actually changed. 
**The Fix:** We will generate a **SHA-256 Hash** (a digital fingerprint) of the PDF content. If the fingerprint matches the cache, we 100% guarantee we don't need to re-parse it, no matter the file date.

### Improvement B: Rate-Limit Concurrency
If you drop 50 PDFs into the folder and run the online indexer, you will immediately trigger a "DDoS" block from the free-tier API providers because you are sending too many requests per second.
**The Fix:** We will implement a queue with a concurrency limit (e.g., process 2 PDFs at a time) and automatic retry logic with backoff.

### Improvement C: The "Memory Crash" Threat (Crucial)
Your plan ends with "bundle all these together for 1 big `pdf_index.json` file". If you have 50 medical books, that single JSON file could become 50MB+ of raw text. When your mobile web app tries to load a 50MB JSON file into memory, the browser will crash.
**The Fix:** The bundler will still create the big file for your backend vault, but for the mobile app, we will compile it into an **Inverted Search Index** (using a library like `FlexSearch`). This compresses the search data so the app searches instantly without loading the entire text into memory.

---

## 2. Online Services: Where & How to Get Access

Since the immediate goal is to extract clean, readable text from complex medical PDFs (which often have columns and tables that break offline parsers), we need an online API that specializes in document layout analysis.

### Primary Choice: LlamaParse
*   **Why:** Even though it's famous for AI, it is simply the best tool right now for taking messy PDFs and extracting the text perfectly without mashing columns together.
*   **Cost:** Generous Free Tier (1,000 pages per day).
*   **How to get access:**
    1. Go to [cloud.llamaindex.ai](https://cloud.llamaindex.ai/)
    2. Sign in with GitHub or Google.
    3. Click on **API Keys** on the left menu.
    4. Click **Generate New Key**.
    5. You will paste this key into a `.env` file in our project (`LLAMAPARSE_API_KEY=llx-your-key-here`).

### Backup Choice: OCR.space (For Scans)
*   **Why:** If a PDF is just scanned images (no selectable text), LlamaParse might struggle without its premium vision mode. OCR.space is a fast, entirely free fallback for extracting raw text from scanned image PDFs.
*   **Cost:** 500 requests per day entirely free.
*   **How to get access:** Go to [ocr.space/ocrapi](https://ocr.space/ocrapi) and enter an email. A free API key is instantly emailed to you.

---

## 3. The Technical Plan & Folder Structure

We will structure the backend like this:

```text
med/
├── .env                           <-- Stores your API Keys securely
├── data/
│   ├── pdf_cache/                 <-- THE VAULT (stores individual JSON files)
│   │   ├── book1.pdf.json         <-- Quality: "online"
│   │   └── book2.pdf.json         <-- Quality: "offline"
├── server/
│   ├── parsers/
│   │   ├── extractor_llamaparse.js <-- API integration logic
│   │   └── extractor_poppler.js    <-- Local fallback logic
│   └── pdf_extractor.js           <-- The "Black Box" Strategy Manager
└── index_pdfs.js                  <-- The Bundler (Creates the final search index)
```

### Step-by-Step Execution:
1.  **Setup Environment:** Install `dotenv` to manage the API keys securely, and ensure `poppler` is installed on Termux for the offline fallback.
2.  **Build the Extractors:** Write the isolated scripts for LlamaParse and Poppler.
3.  **Build the Strategy Manager:** Write `pdf_extractor.js` to handle the Hash checking, the Quality tracking (`"online"` vs `"offline"`), and the fallback logic.
4.  **Rewrite the Bundler:** Update `index_pdfs.js` to scan the vault and bundle the cached results cleanly.

Review this plan. Once you get your LlamaParse API key, click **Proceed** and I will start coding the infrastructure.
