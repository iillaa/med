# Admin Panel UI Update & Verification

This document outlines the tasks needed to verify and update the Admin Panel UI.

## 1. UI Consistency Check
*   Ensure the Admin Panel matches the design aesthetic (colors, fonts, dark/light mode compatibility) of the rest of the application.
*   Verify that buttons, inputs, and tables are properly styled and responsive on mobile devices.

## 2. Functional Verification
*   Test all admin actions (edit, delete, add) to ensure they work smoothly.
*   Verify that error states and success toasts are displaying correctly and clearly.
*   Check that loading states (spinners on buttons) trigger properly during API requests to prevent double-clicks.

## 3. PDF Indexing UI
*   Ensure the PDF indexer controls inside the panel are intuitive.
*   Verify that status updates (e.g., "Indexing... 10/50 files") are updating the UI correctly so the admin knows the background job is running.
