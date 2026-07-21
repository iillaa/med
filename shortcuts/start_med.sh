#!/bin/bash
set -e
export PATH=/data/data/com.termux/files/usr/bin:$PATH
cd /data/data/com.termux/files/home/med

# Nettoyage automatique de Ngrok à la fermeture du script
trap 'pkill -f "ngrok" 2>/dev/null || true' EXIT

# Kill existing instances if any to avoid port conflicts
pkill -f "node server.js" 2>/dev/null || true
pkill -f "ngrok" 2>/dev/null || true
sleep 1

# Detect ngrok binary
NGROK_CMD=""
if command -v ngrok &>/dev/null; then
  NGROK_CMD="ngrok"
elif [[ -x "./ngrok" ]]; then
  NGROK_CMD="./ngrok"
else
  echo "❌ Ngrok introuvable. Installez-le ou placez le binaire dans le dossier du projet."
  exit 1
fi

echo "Démarrage du tunnel Ngrok en arrière-plan..."
nohup $NGROK_CMD http 3000 --log=stdout > ngrok.log 2>&1 &
NGROK_PID=$!

# Wait for Ngrok to establish the tunnel (up to 15 seconds)
echo "Attente de l'établissement du tunnel public..."
URL=""
for i in {1..15}; do
  URL=$(curl -s http://127.0.0.1:4040/api/tunnels 2>/dev/null | grep -o 'https://[^"]*ngrok-free.dev' | head -n 1 || true)
  if [[ -n "$URL" ]]; then
    break
  fi
  sleep 1
done

if [[ -z "$URL" ]]; then
  echo "⚠️  Impossible de récupérer l'URL publique après 15s."
  echo "   Vérifiez 'ngrok.log' (limite de session, erreur réseau, etc.)."
  echo "   Arrêt du tunnel..."
  kill $NGROK_PID 2>/dev/null || true
  exit 1
fi

echo ""
echo "✅ Tunnel actif : $URL"
echo ""

# Sync the new URL into remote_server_config.json
echo "Mise à jour de remote_server_config.json..."
node set_server_provider.js "$URL"
echo ""

# Wait for config write to settle
sleep 1

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
