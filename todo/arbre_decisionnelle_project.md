# Arbre Décisionnel (Decision Tree) - Future Project Plan

## 1. Project Vision
Instead of building a massive, resource-heavy AI pipeline locally to generate decision trees from scratch, this project will act as a **lightweight frontend shell**. It will leverage existing public, high-quality medical decision trees and integrate them seamlessly into the Dr.CAT ecosystem.

## 2. Core Strategy
*   **The Frontend Shell:** A clean, interactive UI inside the Dr.CAT app that allows doctors to navigate complex medical algorithms step-by-step.
*   **Data Sourcing (Public Trees):** The app will pull data from established, publicly available decision tree repositories or APIs rather than parsing them from raw medical PDFs locally.
*   **Translation Layer:** Since many high-quality decision trees are in English, the system will use a script or a lightweight translation API to convert these algorithms into French on the fly (or pre-translated during a build step).
*   **AI Integration (Optional/Targeted):** Use AI strictly as a "tweaking" tool or an interactive assistant to guide the user through the pre-existing tree, rather than using AI to *build* the tree from raw data.

## 3. Technical Requirements
*   **Data Format:** The trees will need to be stored or fetched as structured JSON (e.g., nodes, choices, and outcomes).
*   **UI Components:** 
    *   Interactive flowchart/node viewer.
    *   Step-by-step wizard interface for mobile viewing.
*   **Translation Script:** A Node.js build script that scrapes or downloads English decision trees and uses a translation API (like Google Translate or DeepL) to generate a French `.json` database.

## 4. Why This Approach is Superior
By decoupling this from the PDF Indexer project:
1.  **Saves Space:** You don't need gigabytes of raw training data or complex layout parsers on the device.
2.  **Saves Power:** The heavy lifting is done by external public sources and translation scripts, keeping the Dr.CAT app fast and lightweight.
3.  **Faster Delivery:** You can launch a highly functional "Arbre Décisionnel" feature much sooner by wrapping existing data in a beautiful UI.
