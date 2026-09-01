# 📜 ADR-002 : Abandon du Versionnage par Nom de Fichier & Noms Canoniques Immuables

> **Statut** : Accepté  
> **Date** : 2026-07-28  
> **Décideurs** : Dr. Kibeche Ali Dia Eddine & Lead Architect

---

## 🎯 Contexte & Problématique

Dans les versions antérieures (v1.8 à v1.11), l'évolution du schéma de la base de données était gérée en renommant physiquement les fichiers JSON (ex: `cats_db.json` ➔ `cats_db_v2.json` ➔ `cats_db_v3.json`).

Cette pratique a généré des anomalies critiques :
1. **Dead-Path Write Bug** : Le générateur écrivait dans un nouveau fichier (`_v3`) pendant que l'API de staging ou le client mobile continuait de lire l'ancien fichier (`_v2`).
2. **Prolifération de Fichiers Morts** : Multiples copies incohérentes dans `data/` et `public/data/`.
3. **Complexité Inutile des Routes Express** : Nécessité d'ajouter des switchs conditionnels pour résoudre le bon nom de fichier.

---

## 💡 Décision Architecturale

1. **Noms Canoniques Immuables pour Toujours** :
   - Production : `cats_db.json` (et copie nettoyée pour le client dans `public/data/cats_db.json`).
   - Staging : `cat_db_generator/cats_db_staged.json` (toujours un tableau JSON pur).
   - Sidecar de Métadonnées : `cat_db_generator/cats_db_staged.meta.json` (`schema_version`, `stagedAt`, `migratedFrom`).
2. **Le Versionnage Réside dans les Données** :
   - La version du schéma (`schema_version: "3.5"`) est déclarée dans les métadonnées et validée par programmation.
3. **Outil Unique de Migration** :
   - Tout changement structurel est opéré via le script canonique `node scripts/upgrade_db_schema.js [--clean] [--version X.Y]`.

---

## ⚖️ Conséquences & Bénéfices

### Positives :
- ✅ **Éradication des bugs de chemins morts** : Tous les scripts et composants lisent et écrivent exactement au même emplacement.
- ✅ **Compatibilité descendante garantie** : Le client charge toujours `cats_db.json`.
- ✅ **Traçabilité totale** : Les sauvegardes horodatées sont automatiquement isolées dans le dossier `backups/`.

### Négatives / Contraintes :
- ⚠️ Toute modification de structure nécessite d'exécuter le script de migration formel.
