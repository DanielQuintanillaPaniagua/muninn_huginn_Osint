#!/bin/bash

# Colores
RED='\033[0;31m'
DARKRED='\033[1;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
GRAY='\033[1;30m'
WHITE='\033[1;37m'
NC='\033[0m'

function show_banner() {
    clear
    
    # Efecto de aparición
    echo -e "${GRAY}"
    echo "Invocando a los cuervos de Odín..."
    sleep 0.5
    clear
    
    echo -e "${DARKRED}"
    cat << "EOF"
                         _.---.._             _.---.._
                      .-'   /\   `-.       .-'   /\   `-.
                    .'     //\\     `.   .'     //\\     `.
                   /      //  \\      \ /      //  \\      \
                  |   O  ((    ))  O  |   O  ((    ))  O   |
                  |      \\  //       |      \\  //        |
                   \      \\//       / \      \\//        /
                    `.     \/      .'   `.     \/       .'
                      `-..__  __..-'       `-..__  __..-'
                          `||`                 `||`
                         _||||_               _||||_
                        (______)             (______)
                        
                       H U G I N N         M U N I N N
                         ᚺᚢᚷᛁᚾᚾ               ᛗᚢᚾᛁᚾᚾ
                       "Thought"            "Memory"

    ═══════════════════════════════════════════════════════════════
                                                                    
        ▓█████▄  ▄▄▄       ██▀███   ██ ▄█▀    ▒█████    ██████  
        ▒██▀ ██▌▒████▄    ▓██ ▒ ██▒ ██▄█▒    ▒██▒  ██▒▒██    ▒  
        ░██   █▌▒██  ▀█▄  ▓██ ░▄█ ▒▓███▄░    ▒██░  ██▒░ ▓██▄    
        ░▓█▄   ▌░██▄▄▄▄██ ▒██▀▀█▄  ▓██ █▄    ▒██   ██░  ▒   ██▒ 
        ░▒████▓  ▓█   ▓██▒░██▓ ▒██▒▒██▒ █▄   ░ ████▓▒░▒██████▒▒ 
         ▒▒▓  ▒  ▒▒   ▓▒█░░ ▒▓ ░▒▓░▒ ▒▒ ▓▒   ░ ▒░▒░▒░ ▒ ▒▓▒ ▒ ░ 
         ░ ▒  ▒   ▒   ▒▒ ░  ░▒ ░ ▒░░ ░▒ ▒░     ░ ▒ ▒░ ░ ░▒  ░ ░ 
         ░ ░  ░   ░   ▒     ░░   ░ ░ ░░ ░    ░ ░ ░ ▒  ░  ░  ░   
           ░          ░  ░   ░     ░  ░          ░ ░        ░   
         ░                                                       

    ═══════════════════════════════════════════════════════════════
    ║                                                             ║
    ║               ODIN'S INTELLIGENCE NETWORK                   ║
    ║                                                             ║
    ║         "Two ravens fly across the nine realms,             ║
    ║          gathering secrets from the shadows..."             ║
    ║                                                             ║
    ║                    [ Version1.0 ]                           ║
    ║               [  OSINT Framework v1.0 ]                     ║
    ║                                                             ║
    ╚═════════════════════════════════════════════════════════════╝
EOF
    echo -e "${NC}"
    
    # Mensaje de bienvenida
    echo -e "${PURPLE}                   The ravens are watching ${NC}"
    echo ""
}

show_banner

# Función para buscar en LinkedIn
function search_linkedin() {
    echo -e "\n${CYAN}[*] Buscando en LinkedIn${NC}"
    read -p "Ingresa el nombre de usuario o nombre completo: " USERNAME
    
    # Búsqueda por URL directa
    URL="https://www.linkedin.com/in/$USERNAME"
    STATUS=$(curl -s -o /dev/null -w "%{http_code}" -L "$URL")
    
    if [ "$STATUS" == "200" ] || [ "$STATUS" == "999" ]; then
        echo -e "${GREEN}[+] Perfil encontrado: $URL${NC}"
    else
        echo -e "${RED}[-] No se encontró el perfil${NC}"
    fi
    
    # Búsqueda en Google
    echo -e "\n${YELLOW}[*] Búsqueda alternativa en Google:${NC}"
    SEARCH_URL="https://www.google.com/search?q=site:linkedin.com+$USERNAME"
    echo -e "${BLUE}$SEARCH_URL${NC}"
}

# Función para buscar en YouTube
function search_youtube() {
    echo -e "\n${CYAN}[*] Buscando en YouTube${NC}"
    read -p "Ingresa el nombre del canal o usuario: " USERNAME
    
    # Búsqueda por diferentes formatos de URL
    URL1="https://www.youtube.com/@$USERNAME"
    URL2="https://www.youtube.com/c/$USERNAME"
    URL3="https://www.youtube.com/user/$USERNAME"
    
    echo -e "${YELLOW}[*] Verificando URLs...${NC}"
    
    for URL in "$URL1" "$URL2" "$URL3"; do
        STATUS=$(curl -s -o /dev/null -w "%{http_code}" -L "$URL")
        if [ "$STATUS" == "200" ]; then
            echo -e "${GREEN}[+] Canal encontrado: $URL${NC}"
            break
        fi
    done
    
    # Búsqueda directa
    SEARCH_URL="https://www.youtube.com/results?search_query=$USERNAME"
    echo -e "${BLUE}[*] Búsqueda: $SEARCH_URL${NC}"
}

# Función para buscar en Facebook
function search_facebook() {
    echo -e "\n${CYAN}[*] Buscando en Facebook${NC}"
    read -p "Ingresa el nombre de usuario o nombre completo: " USERNAME
    
    # URL de perfil
    URL="https://www.facebook.com/$USERNAME"
    STATUS=$(curl -s -o /dev/null -w "%{http_code}" -L "$URL")
    
    if [ "$STATUS" == "200" ]; then
        echo -e "${GREEN}[+] Perfil encontrado: $URL${NC}"
    else
        echo -e "${RED}[-] No se encontró el perfil directo${NC}"
    fi
    
    # Búsqueda en Facebook
    SEARCH_URL="https://www.facebook.com/search/top?q=$USERNAME"
    echo -e "${BLUE}[*] Búsqueda: $SEARCH_URL${NC}"
}

# Función para buscar en Instagram
function search_instagram() {
    echo -e "\n${CYAN}[*] Buscando en Instagram${NC}"
    read -p "Ingresa el nombre de usuario: " USERNAME
    
    URL="https://www.instagram.com/$USERNAME"
    STATUS=$(curl -s -o /dev/null -w "%{http_code}" -L "$URL")
    
    if [ "$STATUS" == "200" ]; then
        echo -e "${GREEN}[+] Perfil encontrado: $URL${NC}"
        
        # Intentar obtener información básica
        echo -e "${YELLOW}[*] Obteniendo información...${NC}"
        curl -s "$URL/?__a=1&__d=dis" | grep -o '"username":"[^"]*"' | head -1
    else
        echo -e "${RED}[-] No se encontró el perfil${NC}"
    fi
}

# Función para buscar en Twitter/X
function search_twitter() {
    echo -e "\n${CYAN}[*] Buscando en Twitter/X${NC}"
    read -p "Ingresa el nombre de usuario (sin @): " USERNAME
    
    URL="https://twitter.com/$USERNAME"
    STATUS=$(curl -s -o /dev/null -w "%{http_code}" -L "$URL")
    
    if [ "$STATUS" == "200" ]; then
        echo -e "${GREEN}[+] Perfil encontrado: $URL${NC}"
    else
        echo -e "${RED}[-] No se encontró el perfil${NC}"
    fi
    
    # Búsqueda alternativa
    SEARCH_URL="https://twitter.com/search?q=$USERNAME"
    echo -e "${BLUE}[*] Búsqueda: $SEARCH_URL${NC}"
}

# Función para buscar en GitHub
function search_github() {
    echo -e "\n${CYAN}[*] Buscando en GitHub${NC}"
    read -p "Ingresa el nombre de usuario: " USERNAME
    
    URL="https://github.com/$USERNAME"
    STATUS=$(curl -s -o /dev/null -w "%{http_code}" -L "$URL")
    
    if [ "$STATUS" == "200" ]; then
        echo -e "${GREEN}[+] Perfil encontrado: $URL${NC}"
        
        # Obtener información de repositorios
        echo -e "${YELLOW}[*] Repositorios públicos:${NC}"
        curl -s "https://api.github.com/users/$USERNAME/repos" | \
            grep -o '"name": "[^"]*"' | head -5
    else
        echo -e "${RED}[-] No se encontró el perfil${NC}"
    fi
}

# Función para buscar en TODAS las plataformas
function search_all() {
    echo -e "\n${CYAN}[*] Búsqueda completa en todas las plataformas${NC}"
    read -p "Ingresa el nombre de usuario a buscar: " USERNAME
    
    echo -e "\n${YELLOW}═══════════════════════════════════${NC}"
    echo -e "${YELLOW}  Iniciando búsqueda completa...${NC}"
    echo -e "${YELLOW}═══════════════════════════════════${NC}"
    
    # Declarar plataformas
    declare -A PLATFORMS=(
        ["LinkedIn"]="https://www.linkedin.com/in/$USERNAME"
        ["Facebook"]="https://www.facebook.com/$USERNAME"
        ["Instagram"]="https://www.instagram.com/$USERNAME"
        ["Twitter"]="https://twitter.com/$USERNAME"
        ["GitHub"]="https://github.com/$USERNAME"
        ["YouTube"]="https://www.youtube.com/@$USERNAME"
        ["TikTok"]="https://www.tiktok.com/@$USERNAME"
        ["Reddit"]="https://www.reddit.com/user/$USERNAME"
        ["Pinterest"]="https://www.pinterest.com/$USERNAME"
        ["Telegram"]="https://t.me/$USERNAME"
    )
    
    # Buscar en cada plataforma
    for PLATFORM in "${!PLATFORMS[@]}"; do
        URL="${PLATFORMS[$PLATFORM]}"
        echo -e "\n${CYAN}[*] Verificando $PLATFORM...${NC}"
        
        STATUS=$(curl -s -o /dev/null -w "%{http_code}" -L "$URL" --max-time 5)
        
        if [ "$STATUS" == "200" ] || [ "$STATUS" == "999" ]; then
            echo -e "${GREEN}[+] ✓ Encontrado en $PLATFORM: $URL${NC}"
        else
            echo -e "${RED}[-] ✗ No encontrado en $PLATFORM${NC}"
        fi
        
        sleep 1  # Pausa para no saturar
    done
    
    echo -e "\n${YELLOW}═══════════════════════════════════${NC}"
    echo -e "${GREEN}[✓] Búsqueda completa finalizada${NC}"
    echo -e "${YELLOW}═══════════════════════════════════${NC}"
}

# Menú principal
function show_menu() {
    echo -e "\n${YELLOW}┌─────────────────────────────────┐${NC}"
    echo -e "${YELLOW}│${NC}     ${CYAN}MENÚ DE BÚSQUEDA${NC}          ${YELLOW}│${NC}"
    echo -e "${YELLOW}└─────────────────────────────────┘${NC}"
    echo -e "${GREEN}1)${NC} Buscar en LinkedIn"
    echo -e "${GREEN}2)${NC} Buscar en YouTube"
    echo -e "${GREEN}3)${NC} Buscar en Facebook"
    echo -e "${GREEN}4)${NC} Buscar en Instagram"
    echo -e "${GREEN}5)${NC} Buscar en Twitter/X"
    echo -e "${GREEN}6)${NC} Buscar en GitHub"
    echo -e "${GREEN}7)${NC} ${YELLOW}Buscar en TODAS las plataformas${NC}"
    echo -e "${GREEN}8)${NC} Salir"
    echo ""
}

# Loop principal
while true; do
    show_banner
    show_menu
    read -p "Selecciona una opción [1-8]: " OPTION
    
    case $OPTION in
        1) search_linkedin ;;
        2) search_youtube ;;
        3) search_facebook ;;
        4) search_instagram ;;
        5) search_twitter ;;
        6) search_github ;;
        7) search_all ;;
        8) 
            echo -e "\n${GREEN}[✓] Saliendo... ¡Hasta luego!${NC}"
            exit 0
            ;;
        *)
            echo -e "\n${RED}[!] Opción inválida${NC}"
            ;;
    esac
    
    echo ""
    read -p "Presiona ENTER para continuar..."
done
