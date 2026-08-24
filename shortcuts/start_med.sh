#!/data/data/com.termux/files/usr/bin/bash
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

echo "=================================================="
echo "      CLINICAL CAT APP - DÉMARRAGE DU SERVEUR     "
echo "=================================================="

# Ensure Termux DNS resolv.conf exists for Go binaries
if [[ ! -f "/data/data/com.termux/files/usr/etc/resolv.conf" ]]; then
  mkdir -p /data/data/com.termux/files/usr/etc
  echo "nameserver 8.8.8.8" > /data/data/com.termux/files/usr/etc/resolv.conf
  echo "nameserver 1.1.1.1" >> /data/data/com.termux/files/usr/etc/resolv.conf
fi

# Check ngrok authtoken
HAS_NGROK_AUTH=false
if [[ -n "$NGROK_CMD" ]]; then
  if $NGROK_CMD config check &>/dev/null; then
    HAS_NGROK_AUTH=true
  fi
fi

ENABLE_NGROK=false
if [[ "$1" == "--ngrok" || "$1" == "--all" || "$HAS_NGROK_AUTH" == "true" ]]; then
  if [[ -n "$NGROK_CMD" ]]; then
    ENABLE_NGROK=true
  fi
fi

if [[ "$ENABLE_NGROK" == "true" || "$HAS_CLOUDFLARED" == "true" ]]; then
  echo "Démarrage des tunnels de communication..."

  if [[ "$ENABLE_NGROK" == "true" ]]; then
    if [[ "$HAS_NGROK_AUTH" == "true" ]]; then
      if command -v termux-chroot &>/dev/null; then
        nohup termux-chroot $NGROK_CMD http 3000 --url=rendition-duchess-dry.ngrok-free.dev --log=stdout > ngrok.log 2>&1 &
      else
        nohup $NGROK_CMD http 3000 --url=rendition-duchess-dry.ngrok-free.dev --log=stdout > ngrok.log 2>&1 &
      fi
    else
      nohup $NGROK_CMD http 3000 --log=stdout > ngrok.log 2>&1 &
    fi
  fi

  if [[ "$HAS_CLOUDFLARED" == "true" ]]; then
    if [[ -f "$HOME/.cloudflared/config.yml" ]]; then
      nohup cloudflared tunnel run > cloudflared.log 2>&1 &
      CF_NAMED_MODE=true
    else
      nohup cloudflared tunnel --url http://localhost:3000 > cloudflared.log 2>&1 &
      CF_NAMED_MODE=false
    fi
  fi

  echo "Attente de l'établissement des tunnels publics..."
  URL=""
  CF_URL=""
  for i in {1..15}; do
    if [[ -z "$URL" && "$ENABLE_NGROK" == "true" ]]; then
      URL=$(curl -s http://127.0.0.1:4040/api/tunnels 2>/dev/null | grep -o 'https://[^"]*ngrok-free.dev' | head -n 1 || true)
    fi
    if [[ -z "$CF_URL" && "$HAS_CLOUDFLARED" == "true" ]]; then
      if [[ "$CF_NAMED_MODE" == "true" ]]; then
        CF_URL="https://drcat.dr-cat.workers.dev"
      else
        CF_URL=$(grep -o 'https://[a-zA-Z0-9-]*\.trycloudflare\.com' cloudflared.log 2>/dev/null | grep -v 'api\.trycloudflare\.com' | head -n 1 || true)
      fi
    fi
    if [[ ( -n "$URL" || "$ENABLE_NGROK" == "false" ) && ( -n "$CF_URL" || "$HAS_CLOUDFLARED" == "false" ) ]]; then
      break
    fi
    sleep 1
  done
fi

ACTIVE_URLS=()
# Rail 1 (Priorité 1) : Cloudflare Worker permanent (Edge 24/7)
ACTIVE_URLS+=("https://drcat.dr-cat.workers.dev")

# Rail 2 (Priorité 2) : Ngrok Termux (Admin / Serveur direct)
if [[ -n "$URL" ]]; then ACTIVE_URLS+=("$URL"); fi

# Rail 3 (Priorité 3) : Cloudflare tunnel temporaire (Backup Termux)
if [[ -n "$CF_URL" && "$CF_URL" != "https://drcat.dr-cat.workers.dev" ]]; then ACTIVE_URLS+=("$CF_URL"); fi

URL_STRING=$(IFS=,; echo "${ACTIVE_URLS[*]}")
echo "Mise à jour du registre des serveurs (remote_server_config.json)..."
node set_server_provider.js --reset "$URL_STRING" 2>/dev/null || true
sleep 1

echo "=================================================="
echo "      CLINICAL CAT APP - SERVEUR EN LIGNE         "
echo "=================================================="
echo ""
echo " 🏠 Accès Local (Termux)     : http://localhost:3000"
echo " 🌐 Rail 1 (Cloudflare Edge) : https://drcat.dr-cat.workers.dev"
if [[ -n "$URL" ]]; then
echo " 🔒 Rail 2 (Tunnel Ngrok)    : $URL"
fi
if [[ -n "$CF_URL" && "$CF_URL" != "https://drcat.dr-cat.workers.dev" ]]; then
echo " ⚡ Rail 3 (Tunnel CF Termux): $CF_URL"
fi
echo " 🛠️  Inspecteur Ngrok         : http://localhost:4040"
echo ""
echo "=================================================="
echo "Démarrage du serveur Node.js..."
echo "Pour arrêter le serveur, fermez ce terminal ou faites Ctrl+C."
echo "=================================================="
echo ""

# Ouvrir automatiquement l'application dans le navigateur
if command -v termux-open &>/dev/null; then
  termux-open http://localhost:3000 2>/dev/null || true
elif command -v xdg-open &>/dev/null; then
  xdg-open http://localhost:3000 2>/dev/null || true
elif command -v open &>/dev/null; then
  open http://localhost:3000 2>/dev/null || true
fi

# Run Node in the foreground so the terminal remains open and logs are visible
node server.js
