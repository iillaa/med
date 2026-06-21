#!/bin/bash
export PATH=/data/data/com.termux/files/usr/bin:$PATH
cd /data/data/com.termux/files/home/med

# Nettoyage automatique de Ngrok à la fermeture du script
trap 'pkill -f "ngrok http"' EXIT

# Kill existing instances if any to avoid port conflicts
pkill -f "node server.js"
pkill -f "ngrok http"

echo "Démarrage du tunnel Ngrok en arrière-plan..."
nohup termux-chroot ./ngrok http 3000 --log=stdout > ngrok.log 2>&1 &

# Wait for Ngrok to establish the tunnel dynamically (up to 12 seconds)
echo "Attente de l'établissement du tunnel public..."
URL=""
for i in {1..12}; do
  URL=$(curl -s http://127.0.0.1:4040/api/tunnels | grep -o 'https://[^"]*ngrok-free.dev' | head -n 1)
  if [ ! -z "$URL" ]; then
    break
  fi
  sleep 1
done

if [ -z "$URL" ]; then
  echo "⚠️  Impossible de récupérer l'URL publique."
  echo "Veuillez vérifier 'ngrok.log' pour voir les erreurs (ex: limite de session, problème réseau)."
fi

echo "=================================================="
echo "      CLINICAL CAT APP - DISTRIBUTEUR PUBLIC      "
echo "=================================================="
echo ""
echo " Accès Local          : http://localhost:3000"
echo " Accès Public         : $URL"
echo " Interface Inspecteur : http://localhost:4040"
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



