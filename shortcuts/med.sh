#!/data/data/com.termux/files/usr/bin/bash
export PATH=/data/data/com.termux/files/usr/bin:$PATH
MED_DIR="/data/data/com.termux/files/home/med"

CMD="$1"
shift 2>/dev/null || true

case "$CMD" in
  start)
    exec "$MED_DIR/shortcuts/start_med.sh" "$@"
    ;;
  local|open)
    exec "$MED_DIR/shortcuts/open_app.sh" "$@"
    ;;
  stop)
    exec "$MED_DIR/shortcuts/stop_med.sh" "$@"
    ;;
  status)
    exec "$MED_DIR/shortcuts/status_med.sh" "$@"
    ;;
  inspect)
    exec "$MED_DIR/shortcuts/inspect_med.sh" "$@"
    ;;
  restart)
    echo "Redémarrage de Dr. CAT..."
    "$MED_DIR/shortcuts/stop_med.sh"
    sleep 1
    exec "$MED_DIR/shortcuts/start_med.sh" "$@"
    ;;
  pm2)
    SUB="$1"
    cd "$MED_DIR"
    case "$SUB" in
      start) npm run pm2:start ;;
      stop) npm run pm2:stop ;;
      restart) npm run pm2:restart ;;
      status|list) npm run pm2:status ;;
      logs) npm run pm2:logs ;;
      *) npm run pm2:status ;;
    esac
    ;;
  build)
    cd "$MED_DIR"
    npm run build
    ;;
  test)
    cd "$MED_DIR"
    npm test
    ;;
  menu)
    exec "$MED_DIR/shortcuts/menu_med.sh"
    ;;
  help|--help|-h|"")
    echo "=================================================="
    echo "         🩺 DR. CAT — GESTIONNAIRE DE COMMANDES   "
    echo "=================================================="
    echo "Usage: med <commande>"
    echo ""
    echo "Commandes disponibles :"
    echo "  med menu      : Affiche le menu interactif"
    echo "  med start     : Démarre avec Cloudflare Tunnel + navigateur"
    echo "  med start --all: Démarre avec Cloudflare + Ngrok"
    echo "  med local     : Démarre en local uniquement (éco-batterie)"
    echo "  med stop      : Arrête le serveur et tous les tunnels"
    echo "  med status    : Affiche l'état d'exécution et les URLs actives"
    echo "  med restart   : Redémarre complètement le serveur et les tunnels"
    echo "  med inspect   : Ouvre l'interface de diagnostic Ngrok (http://localhost:4040)"
    echo "  med pm2       : Gère l'exécution en arrière-plan via PM2 (start, stop, logs, status)"
    echo "  med build     : Recompile les bundles de production (npm run build)"
    echo "  med test      : Lance les tests de validation (npm test)"
    echo "=================================================="
    ;;
  *)
    echo "Commande inconnue: $CMD"
    echo "Tapez 'med help' pour voir la liste des commandes."
    exit 1
    ;;
esac
