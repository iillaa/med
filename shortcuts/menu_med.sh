#!/data/data/com.termux/files/usr/bin/bash
export PATH=/data/data/com.termux/files/usr/bin:$PATH
MED_DIR="/data/data/com.termux/files/home/med"
cd "$MED_DIR"

clear
echo "=================================================="
echo "         🩺 DR. CAT — MENU PRINCIPAL              "
echo "=================================================="
echo ""
echo "  1) 🚀 Démarrer avec Cloudflare Tunnel (Recommandé - Sans compte)"
echo "  2) 🌐 Démarrer avec Ngrok + Cloudflare"
echo "  3) 🏠 Démarrer en Local uniquement (Éco-batterie)"
echo "  4) 🛑 Arrêter le Serveur et les Tunnels"
echo "  5) 📊 Vérifier l'État du Serveur"
echo "  6) 📜 Voir les Logs & Activité IA en Direct"
echo "  7) 🔍 Ouvrir l'Inspecteur Ngrok"
echo "  8) ⚙️  Recompiler les Bundles (Build)"
echo "  9) 🧪 Lancer la Suite de Tests"
echo "  0) 🚪 Quitter"
echo ""
echo "=================================================="
read -p "Votre choix [0-9] : " choice

case "$choice" in
  1)
    exec "$MED_DIR/shortcuts/start_med.sh"
    ;;
  2)
    exec "$MED_DIR/shortcuts/start_med.sh" --all
    ;;
  3)
    exec "$MED_DIR/shortcuts/open_app.sh"
    ;;
  4)
    "$MED_DIR/shortcuts/stop_med.sh"
    read -p "Appuyez sur Entrée pour fermer..."
    ;;
  5)
    "$MED_DIR/shortcuts/status_med.sh"
    read -p "Appuyez sur Entrée pour fermer..."
    ;;
  6)
    "$MED_DIR/shortcuts/logs_med.sh"
    ;;
  7)
    "$MED_DIR/shortcuts/inspect_med.sh"
    ;;
  8)
    npm run build
    read -p "Appuyez sur Entrée pour fermer..."
    ;;
  9)
    npm test
    read -p "Appuyez sur Entrée pour fermer..."
    ;;
  0)
    exit 0
    ;;
  *)
    echo "Choix invalide."
    exit 1
    ;;
esac
