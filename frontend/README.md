# Dr. CAT — Frontend

Vue 3 + Vite frontend for the Dr. CAT clinical review app.

## Tech Stack

- Vue 3 (Composition API, `<script setup>`)
- Vue Router 5
- Pinia (state management)
- TypeScript
- Vite 8
- Vue DevTools

## Project Structure

```
frontend/
├── src/
│   ├── views/           # Page components (Workspace, Dashboard, Quiz, Cats, Admin, Pdfs)
│   ├── components/      # Reusable Vue components
│   ├── stores/          # Pinia stores (cats, quiz, app)
│   ├── router/          # Vue Router routes
│   ├── assets/css/      # Modular CSS (variables, sidebar, layout, workspace, dashboard)
│   ├── utils/           # Storage, haptics, markdown helpers
│   ├── api/             # HTTP client
│   ├── types/           # TypeScript interfaces
│   ├── composables/     # Shared composables (quiz generator)
│   ├── App.vue
│   └── main.ts
├── index.html
├── vite.config.ts
└── package.json
```

## Scripts

```sh
npm install          # Install dependencies
npm run dev          # Start dev server at http://localhost:5173
npm run build        # Production build → ../public/
npm run type-check   # vue-tsc type checking
npm run lint         # ESLint + Oxlint + Prettier
```

## Environment

- Node.js: `^22.18.0 || >=24.12.0`
- Backend API: proxied to `http://localhost:3000` in dev via `vite.config.ts`

## Build Output

`npm run build` outputs to `../public/`, which is served by the Express backend at `/`.
