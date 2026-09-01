# 📜 ADR-004 : Adoption de la Télémétrie Auto-Hébergée & Agrégation par Empreinte SHA-256

> **Statut** : Accepté  
> **Date** : 2026-08-18  
> **Décideurs** : Dr. Kibeche Ali Dia Eddine & Lead Architect

---

## 🎯 Contexte & Problématique

Pour superviser la stabilité de l'application cliente en conditions réelles sans alourdir le binaire :
- L'utilisation de SDKs tiers (Sentry, Firebase Crashlytics, Datadog) posait des problèmes majeurs de **confidentialité médicale**, augmentait la taille de l'APK de 8 à 15 Mo et introduisait une dépendance envers des services SaaS payants.
- À l'inverse, l'absence de télémétrie laissait l'équipe dans l'ignorance totale des crashs au démarrage ou des anomalies spécifiques à certains modèles de smartphones (Xiaomi, Samsung, etc.).

---

## 💡 Décision Architecturale

Nous développons notre propre sous-système de **Crash Intelligence Auto-Hébergé** :
1. **Zéro Dépendance Externe** : Un intercepteur client ultra-léger (< 2 Ko dans `public/js/debug-console.js`).
2. **Calcul d'Empreinte Déterministe SHA-256** : Fusion automatique des crashs identiques (`server/services/telemetry-service.js`).
3. **Escalade Dynamique de Sévérité** : Transition automatique `warning` ➔ `error` ➔ `critical` selon le volume et la diversité des appareils touchés.
4. **Anonymisation Native** : Zéro collecte de données nominatives ou de termes de recherche médicale.

---

## ⚖️ Conséquences & Bénéfices

### Positives :
- ✅ **Confidentialité médicale absolue** : Données hébergées exclusivement sur l'infrastructure du projet.
- ✅ **Performance** : Zéro impact sur le temps de premier affichage (First Paint).
- ✅ **Dashboard intégré** : Visualisation directe dans le panneau d'administration (`/api/admin/telemetry`).

### Négatives / Contraintes :
- ⚠️ Nécessite de maintenir les routes de réception et les mécanismes de rotation de logs côté backend.
