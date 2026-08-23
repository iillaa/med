#!/data/data/com.termux/files/usr/bin/bash
export PATH=/data/data/com.termux/files/usr/bin:$PATH

if ! pgrep -f "ngrok" &>/dev/null; then
  echo "❌ Ngrok n'est pas en cours d'exécution."
  echo "   Lancez 'shortcuts/start_med.sh' d'abord."
  exit 1
fi

echo "Ouverture de l'interface d'inspection Ngrok..."
if command -v termux-open &>/dev/null; then
  termux-open http://localhost:4040 2>/dev/null || true
elif command -v xdg-open &>/dev/null; then
  xdg-open http://localhost:4040 2>/dev/null || true
elif command -v open &>/dev/null; then
  open http://localhost:4040 2>/dev/null || true
fi
