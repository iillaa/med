# 📜 ADR-001 : Adoption du Modèle Réseau Hybride Dual-Rail (Edge vs Termux)

> **Statut** : Accepté  
> **Date** : 2026-07-15  
> **Décideurs** : Dr. Kibeche Ali Dia Eddine & Lead Architect

---

## 🎯 Contexte & Problématique

Dr. CAT a deux exigences antinomiques :
1. **Disponibilité mondiale et ultra-rapide** pour les praticiens en consultation sans dépendre de l'allumage d'un serveur domestique.
2. **Capacités avancées d'ingestion OCR, découpage PDF et génération LLM** nécessitant des scripts Node.js lourds, des bibliothèques natives (Ghostscript) et des tokens d'administration sensibles.

Héberger l'ensemble du backend sur un VPS standard aurait entraîné des coûts récurrents, tandis qu'héberger uniquement sur la tablette Termux rendait l'application mobile indisponible dès que la tablette était éteinte ou hors ligne.

---

## 💡 Décision Architecturale

Nous adoptons une architecture **Dual-Rail (Double Rail)** :
- **Rail 1 (Cloudflare Edge Worker)** : Distribue 90% du trafic en lecture seule (assets, fiches JSON `cats_db.json`, PDF optimisés) et sert de buffer pour les suggestions et télémétries via Cloudflare KV.
- **Rail 2 / 3 (Serveur Local Termux / Tunnels)** : Héberge l'environnement d'administration, le PDF Lab, le moteur de génération V3.5 et le dashboard de télémétrie.
- **Passerelle de Synchronisation** : Un secret partagé (`SYNC_SECRET`) permet au serveur Termux de récupérer périodiquement les suggestions utilisateur accumulées sur l'Edge.

---

## ⚖️ Conséquences & Bénéfices

### Positives :
- ✅ **Résilience maximale** : L'application Android et la PWA fonctionnent 24/7/365 avec un temps de réponse inférieur à 40ms.
- ✅ **Coût d'infrastructure nul** : Utilisation du free tier Cloudflare Workers + hardware Android existant.
- ✅ **Sécurité renforcée** : Les clés API Google Gemini et les fonctions destructives ne sont jamais exposées sur le réseau public.

### Négatives / Contraintes :
- ⚠️ Nécessite de maintenir une stricte parité du `SYNC_SECRET` entre `.env` et Cloudflare Wrangler.
- ⚠️ Les suggestions utilisateurs ne sont visibles sur le serveur d'administration qu'après un cycle de synchronisation.
