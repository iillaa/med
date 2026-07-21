#!/bin/bash
export PATH=/data/data/com.termux/files/usr/bin:$PATH

if ! pgrep -f "ngrok" &>/dev/null; then
  echo "❌ Ngrok n'est pas en cours d'exécution."
  echo "   Lancez 'shortcuts/start_med.sh' d'abord."
  exit 1
fi

echo "Ouverture de l'interface d'inspection Ngrok..."
termux-open http://localhost:4040
