#!/bin/bash
set -e
export PATH=/data/data/com.termux/files/usr/bin:$PATH
cd /data/data/com.termux/files/home/med

# Nettoyage automatique des tunnels à la fermeture du script
trap 'pkill -f "ngrok" 2>/dev/null || true; pkill -f "cloudflared" 2>/dev/null || true' EXIT

# Kill existing instances if any to avoid port conflicts
pkill -f "node server.js" 2>/dev/null || true
pkill -f "ngrok" 2>/dev/null || true
pkill -f "cloudflared" 2>/dev/null || true
sleep 1

# Detect ngrok binary
NGROK_CMD=""
if [[ -x "./ngrok" ]]; then
  NGROK_CMD="./ngrok"
elif command -v ngrok &>/dev/null; then
  NGROK_CMD="ngrok"
elif [[ -x "/data/data/com.termux/files/home/med/ngrok" ]]; then
  NGROK_CMD="/data/data/com.termux/files/home/med/ngrok"
fi

# Detect cloudflared binary
HAS_CLOUDFLARED=false
if command -v cloudflared &>/dev/null; then
  HAS_CLOUDFLARED=true
fi

echo "Démarrage des tunnels de communication (Ngrok / Cloudflare)..."

# Ensure Termux DNS resolv.conf exists for Go binaries
if [[ ! -f "/data/data/com.termux/files/usr/etc/resolv.conf" ]]; then
  echo "nameserver 8.8.8.8" > /data/data/com.termux/files/usr/etc/resolv.conf
  echo "nameserver 1.1.1.1" >> /data/data/com.termux/files/usr/etc/resolv.conf
fi

if [[ -n "$NGROK_CMD" ]]; then
  if command -v termux-chroot &>/dev/null; then
    nohup termux-chroot $NGROK_CMD http 3000 --url=rendition-duchess-dry.ngrok-free.dev --log=stdout > ngrok.log 2>&1 &
  else
    nohup $NGROK_CMD http 3000 --url=rendition-duchess-dry.ngrok-free.dev --log=stdout > ngrok.log 2>&1 &
  fi
  NGROK_PID=$!
fi

if [[ "$HAS_CLOUDFLARED" == "true" ]]; then
  if [[ -f "$HOME/.cloudflared/config.yml" ]]; then
    nohup cloudflared tunnel run > cloudflared.log 2>&1 &
    CF_PID=$!
    CF_NAMED_MODE=true
  else
    nohup cloudflared tunnel --url http://localhost:3000 > cloudflared.log 2>&1 &
    CF_PID=$!
    CF_NAMED_MODE=false
  fi
fi

echo "Attente de l'établissement des tunnels publics..."
URL=""
CF_URL=""
for i in {1..15}; do
  if [[ -z "$URL" && -n "$NGROK_CMD" ]]; then
    URL=$(curl -s http://127.0.0.1:4040/api/tunnels 2>/dev/null | grep -o 'https://[^"]*ngrok-free.dev' | head -n 1 || true)
  fi
  if [[ -z "$CF_URL" && "$HAS_CLOUDFLARED" == "true" ]]; then
    if [[ "$CF_NAMED_MODE" == "true" ]]; then
      # Named tunnel is active with drcat.is-a.dev / cfargotunnel.com
      CF_URL="https://drcat.dr-cat.workers.dev"
    else
      CF_URL=$(grep -o 'https://[^"]*\.trycloudflare\.com' cloudflared.log 2>/dev/null | head -n 1 || true)
    fi
  fi
  if [[ ( -n "$URL" || -z "$NGROK_CMD" ) && ( -n "$CF_URL" || "$HAS_CLOUDFLARED" == "false" ) ]]; then
    break
  fi
  sleep 1
done

ACTIVE_URLS=()
if [[ -z "$URL" && -n "$NGROK_CMD" ]]; then
  URL="https://rendition-duchess-dry.ngrok-free.dev"
fi
if [[ -n "$URL" ]]; then ACTIVE_URLS+=("$URL"); fi
if [[ -n "$CF_URL" ]]; then ACTIVE_URLS+=("$CF_URL"); fi

if [[ ${#ACTIVE_URLS[@]} -eq 0 ]]; then
  echo "⚠️  Impossible de récupérer une URL publique après 15s."
  echo "   Vérifiez 'ngrok.log' et 'cloudflared.log'."
  exit 1
fi

URL_STRING=$(IFS=,; echo "${ACTIVE_URLS[*]}")
echo "Mise à jour du registre des serveurs (remote_server_config.json)..."
node set_server_provider.js --reset "$URL_STRING"
sleep 1

echo "=================================================="
echo "      CLINICAL CAT APP - DISTRIBUTEUR PUBLIC      "
echo "=================================================="
echo ""
echo " Accès Local          : http://localhost:3000"
if [[ -n "$CF_URL" ]]; then
echo " Accès Cloudflare     : $CF_URL"
fi
if [[ -n "$URL" ]]; then
echo " Accès Ngrok          : $URL"
fi
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
