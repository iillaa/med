#!/data/data/com.termux/files/usr/bin/bash
export PATH=/data/data/com.termux/files/usr/bin:$PATH
MED_DIR="/data/data/com.termux/files/home/med"
cd "$MED_DIR"

LOGS_DIR="$MED_DIR/logs"
SERVER_LOG="$LOGS_DIR/server-out.log"
AI_LOG="$LOGS_DIR/ai_operations.log"
ERR_LOG="$LOGS_DIR/server-err.log"

mkdir -p "$LOGS_DIR"
touch "$SERVER_LOG" "$AI_LOG" "$ERR_LOG"

# Color constants
C_RESET="\033[0m"
C_CYAN="\033[1;36m"
C_GREEN="\033[1;32m"
C_YELLOW="\033[1;33m"
C_RED="\033[1;31m"
C_BLUE="\033[1;34m"
C_MAGENTA="\033[1;35m"

# Colorize log lines in stream
colorize_stream() {
  while IFS= read -r line; do
    if [[ "$line" =~ \[ERROR\]|❌|error|failed|FAIL ]]; then
      echo -e "${C_RED}${line}${C_RESET}"
    elif [[ "$line" =~ \[WARN\]|⚠️|warning ]]; then
      echo -e "${C_YELLOW}${line}${C_RESET}"
    elif [[ "$line" =~ \[AI\ Smart\ Slicer\]|🤖|✨|Gemini|LlamaParse ]]; then
      echo -e "${C_CYAN}${line}${C_RESET}"
    elif [[ "$line" =~ \[PDF\ Lab\]|✂️|📂|💎|Compressed|✅ ]]; then
      echo -e "${C_GREEN}${line}${C_RESET}"
    elif [[ "$line" =~ \[HTTP\]|\[Providers\]|\[Auth\] ]]; then
      echo -e "${C_BLUE}${line}${C_RESET}"
    else
      echo -e "${line}"
    fi
  done
}

if [[ "$1" == "--ai" ]]; then
  echo -e "${C_CYAN}=== 🤖 ACTIVITÉ IA & DÉCOUPAGE PDF EN DIRECT ===${C_RESET}"
  tail -n 50 -f "$AI_LOG" | colorize_stream
  exit 0
fi

if [[ "$1" == "--err" ]]; then
  echo -e "${C_RED}=== ❌ ERREURS RÉCENTES DU SERVEUR ===${C_RESET}"
  tail -n 50 -f "$ERR_LOG" | colorize_stream
  exit 0
fi

if [[ "$1" == "--all" || "$1" == "-f" ]]; then
  echo -e "${C_GREEN}=== 📡 JOURNAL DU SERVEUR EN DIRECT (CTRL+C pour quitter) ===${C_RESET}"
  tail -n 60 -f "$SERVER_LOG" | colorize_stream
  exit 0
fi

# Interactive Menu
clear
echo -e "${C_CYAN}══════════════════════════════════════════════════${C_RESET}"
echo -e "${C_CYAN}       🩺 DR. CAT — JOURNAL DES LOGS EN DIRECT     ${C_RESET}"
echo -e "${C_CYAN}══════════════════════════════════════════════════${C_RESET}"
echo ""
echo -e "  1) 📡 ${C_GREEN}Suivi Global en Direct${C_RESET} (Tous les flux : requêtes, PDF, IA)"
echo -e "  2) 🤖 ${C_CYAN}Activité IA & Découpage PDF${C_RESET} (Gemini, Slicer, LlamaParse)"
echo -e "  3) ❌ ${C_RED}Journal des Erreurs Uniquement${C_RESET} (server-err.log)"
echo -e "  4) 📋 ${C_YELLOW}Afficher les 80 dernières lignes${C_RESET} (Sans streaming)"
echo -e "  5) 🧹 ${C_MAGENTA}Vider / Réinitialiser les fichiers de logs${C_RESET}"
echo -e "  6) 🚪 Quitter"
echo ""
echo -e "${C_CYAN}══════════════════════════════════════════════════${C_RESET}"
read -p "Votre choix [1-6] : " choice

case "$choice" in
  1)
    echo -e "\n${C_GREEN}Connexion au flux en direct (Faites Ctrl+C pour arrêter)...${C_RESET}\n"
    tail -n 50 -f "$SERVER_LOG" | colorize_stream
    ;;
  2)
    echo -e "\n${C_CYAN}Filtrage Activité IA en direct (Faites Ctrl+C pour arrêter)...${C_RESET}\n"
    tail -n 50 -f "$AI_LOG" | colorize_stream
    ;;
  3)
    echo -e "\n${C_RED}Journal des erreurs (Faites Ctrl+C pour arrêter)...${C_RESET}\n"
    tail -n 50 -f "$ERR_LOG" | colorize_stream
    ;;
  4)
    echo -e "\n${C_YELLOW}Dernières lignes du journal :${C_RESET}\n"
    tail -n 80 "$SERVER_LOG" | colorize_stream
    echo ""
    read -p "Appuyez sur Entrée pour continuer..."
    ;;
  5)
    > "$SERVER_LOG"
    > "$AI_LOG"
    > "$ERR_LOG"
    echo -e "\n${C_GREEN}✅ Les fichiers de logs ont été vidés avec succès !${C_RESET}\n"
    read -p "Appuyez sur Entrée pour continuer..."
    ;;
  6)
    exit 0
    ;;
  *)
    echo "Choix invalide."
    exit 1
    ;;
esac
