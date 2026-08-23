# Legal & Compliance Todo

This document outlines the standard legal and compliance features we need to discuss and implement for the app/website.

## 1. Cookie Consent Banner (RGPD/GDPR)
*   **What it is:** The pop-up that asks users to accept or reject cookies.
*   **Why we need it:** If the app uses analytics, saves user progress locally (like `localStorage`), or tracks anything, European and international laws require user consent.
*   **Implementation:** A simple, non-intrusive bottom banner that users can accept to dismiss.

## 2. Terms of Service (Conditions Générales d'Utilisation - CGU)
*   **What it is:** The rules for using the app.
*   **Why we need it:** Protects you legally by stating what users can and cannot do.
*   **Implementation:** A dedicated page linked in the footer.

## 3. Privacy Policy (Politique de Confidentialité)
*   **What it is:** Explains what data you collect (if any) and how it is used.
*   **Why we need it:** Mandatory for almost all websites, especially in healthcare contexts (even if you don't collect patient data, you must explicitly state that you don't).

## 4. Medical Disclaimer (Avis de Non-responsabilité Médicale)
*   **What it is:** A warning that this app is an educational tool, not a substitute for professional clinical judgment.
*   **Why we need it:** **CRITICAL** for any medical app. Protects you from liability if a user makes a clinical error while referencing your app.
*   **Implementation:** A short disclaimer displayed on the homepage or in the app footer.

## 5. Software Licenses (Licences)
*   **What it is:** Acknowledging the open-source tools we used (like PDF.js, FontAwesome).
*   **Why we need it:** Required by the creators of those free tools.
*   **Implementation:** A simple "Crédits / Open Source" page.
