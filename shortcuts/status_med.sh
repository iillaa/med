#!/data/data/com.termux/files/usr/bin/bash
export PATH=/data/data/com.termux/files/usr/bin:$PATH

echo "=================================================="
echo "         ÉTAT DE CLINICAL CAT APP                 "
echo "=================================================="

if pgrep -f "node server.js" &>/dev/null; then
  echo "🟢 Serveur Node.js : en cours d'exécution (port 3000)"
else
  echo "🔴 Serveur Node.js : arrêté"
fi

if pgrep -f "ngrok" &>/dev/null; then
  echo "🟢 Tunnel Ngrok   : en cours d'exécution"
  URL=$(curl -s http://127.0.0.1:4040/api/tunnels 2>/dev/null | grep -o 'https://[^"]*ngrok-free.dev' | head -n 1 || true)
  if [[ -n "$URL" ]]; then
    echo "   URL publique    : $URL"
  else
    echo "   ⚠️  URL introuvable (vérifiez l'inspecteur Ngrok)"
  fi
else
  echo "🔴 Tunnel Ngrok   : arrêté"
fi

if pgrep -f "cloudflared" &>/dev/null; then
  echo "🟢 Tunnel Cloudflare : en cours d'exécution"
else
  echo "🔴 Tunnel Cloudflare : arrêté"
fi

echo ""
echo "=================================================="
