#!/bin/bash
set -e
export PATH=/data/data/com.termux/files/usr/bin:$PATH

echo "=================================================="
echo "         ARRÊT DE CLINICAL CAT APP                "
echo "=================================================="

pkill -f "node server.js" 2>/dev/null && echo "🛑 Serveur Node.js arrêté." || echo "ℹ️  Serveur Node.js n'était pas en cours d'exécution."
pkill -f "ngrok" 2>/dev/null && echo "🛑 Tunnel Ngrok arrêté." || echo "ℹ️  Tunnel Ngrok n'était pas en cours d'exécution."

echo "=================================================="
echo "Tout est propre."
echo "=================================================="
