
#Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
GRAY='\033[0;37m'
NC='\033[0m'


echo -e "${GREEN} Starting Coding Trainer Development Environment...${NC}"


#function to check prerequisites
check_prerequisites() {
    echo -e " Checking prerequisites..."

     if [ ! -d "node_modules" ]; then
         echo -e "${YELLOW}📦 Installing dependencies...${NC}"
         npm install
     else
         echo -e "${GREEN}✅ Dependencies installed${NC}"
     fi

     # Check Rust (optional check)
     if command -v cargo > /dev/null; then
         RUST_VERSION=$(cargo --version)
         echo -e "${GREEN}✅ Rust: $RUST_VERSION${NC}"
     else
         echo -e "${YELLOW}⚠️  Rust/Cargo not found - Tauri may not work properly${NC}"
         echo -e "${CYAN}   Install from: https://rustup.rs/${NC}"
     fi

     # Check for Tauri CLI
     if npm list -g @tauri-apps/cli > /dev/null 2>&1; then
         echo -e "${GREEN}✅ Tauri CLI installed globally${NC}"
     elif [ -f "node_modules/.bin/tauri" ]; then
         echo -e "${GREEN}✅ Tauri CLI installed locally${NC}"
     else
         echo -e "${YELLOW}📦 Installing Tauri CLI locally...${NC}"
         npm install @tauri-apps/cli
     fi

# Main execution
main() {
    # Change to script directory
    cd "$(dirname "$0")"

    # Verify we're in the right directory
    if [ ! -f "package.json" ] || [ ! -d "src-tauri" ]; then
        echo -e "${RED}❌ This script must be run from the iterator-sentry directory${NC}"
        echo -e "${CYAN}   Current directory: $(pwd)${NC}"
        exit 1
    fi
    # Wait a moment for processes to fully terminate
    sleep 0.5

    # Start the development server
    echo -e "${CYAN}🎯 Starting Tauri development server...${NC}"
    echo -e "${CYAN}📍 Frontend will be available at: http://localhost:3333${NC}"
    echo -e "${CYAN}🖥️  Desktop app will launch automatically${NC}"
    echo ""

    # Start the development server and capture its PID
    npm run tauri dev &
    DEV_PID=$!

    # Wait for the development server
    wait $DEV_PID
}

main "$@"
