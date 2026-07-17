Gemini, read the `HANDOFF_TO_GEMINI.md` file that Kilo just wrote. It contains the full context.

Your mission: Fix the UI/UX regressions in the Vue 3 app (`med-vue/`).

**Priority Order (Start with these 3 first):**

1. **Fix CSS variables**: In `med-vue/src/main.ts`, add `import '../public/style.css';` to load the original theme. This will instantly restore dark mode, colors, and fonts.

2. **Fix layout structure**: Update `med-vue/src/App.vue` to match the original vanilla layout exactly (fixed sidebar, mobile header with overlay, scrollable main).

3. **Restore visual components**: Add the missing sidebar collapse, tab switching in workspace, prescription variants, shimmer skeletons, and toast notifications.

**Rules:**
- Do NOT change the Pinia stores or API logic – they are correct.
- Do NOT delete the `public/` folder – it contains the static assets.
- Rebuild and test after each major fix: `cd med-vue && npm run build`
- Commit after each fix: `git add . && git commit -m "fix(ui): restored [specific UI element]"`

Start with the CSS import, then the layout, then the missing interactions.