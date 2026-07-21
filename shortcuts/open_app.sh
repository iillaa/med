#!/bin/bash
set -e
export PATH=/data/data/com.termux/files/usr/bin:$PATH
cd /data/data/com.termux/files/home/med

# Kill existing instances if any to avoid port conflicts
pkill -f "node server.js" 2>/dev/null || true
sleep 1

echo "=================================================="
echo "      CLINICAL CAT APP - ACCÈS LOCAL UNIQUEMENT   "
echo "=================================================="
echo ""
echo " Accès Local : http://localhost:3000"
echo " (Ngrok désactivé - Mode économie de batterie)"
echo ""
echo "=================================================="
echo "Démarrage du serveur Node.js..."
echo "Pour arrêter le serveur, fermez ce terminal ou faites Ctrl+C."
echo "=================================================="
echo ""

# Ouvrir automatiquement l'application dans le navigateur
termux-open http://localhost:3000

# Run Node in the foreground so the terminal remains open and logs are visible
node server.js
