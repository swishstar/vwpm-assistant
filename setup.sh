#!/usr/bin/env bash
# =============================================================================
# Rosy — Business OS Setup Script
# Run this once on any new machine to bootstrap the full environment.
# Usage: ./setup.sh
# =============================================================================

set -e  # Exit on first error

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
BOLD='\033[1m'
NC='\033[0m' # No color

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo ""
echo -e "${BOLD}============================================${NC}"
echo -e "${BOLD}  Rosy — Business OS Setup${NC}"
echo -e "${BOLD}============================================${NC}"
echo ""

# -----------------------------------------------------------------------------
# Step 1: Check required tools
# -----------------------------------------------------------------------------
echo -e "${BLUE}[1/5] Checking required tools...${NC}"

check_tool() {
  if ! command -v "$1" &>/dev/null; then
    echo -e "${RED}  ✗ $1 is not installed.${NC}"
    echo -e "    $2"
    MISSING_TOOLS=true
  else
    echo -e "${GREEN}  ✓ $1 found: $(command -v "$1")${NC}"
  fi
}

MISSING_TOOLS=false
check_tool git    "Install via: xcode-select --install (macOS) or https://git-scm.com"
check_tool node   "Install via: https://nodejs.org (LTS version recommended)"
check_tool npm    "Included with Node.js — install Node.js first"

if [ "$MISSING_TOOLS" = true ]; then
  echo ""
  echo -e "${RED}Setup cannot continue until the missing tools above are installed.${NC}"
  echo -e "See ${BOLD}SETUP_GUIDE.md${NC} for detailed installation instructions."
  exit 1
fi

# Optional tools (advisory only — setup continues if missing)
echo ""
echo -e "${BLUE}  Checking optional tools...${NC}"
if ! command -v ffmpeg &>/dev/null; then
  echo -e "${YELLOW}  ⚠ ffmpeg not found — needed for II Talks audio conversion (m4a → mp3).${NC}"
  echo -e "    Install via: ${BOLD}brew install ffmpeg${NC}"
else
  echo -e "${GREEN}  ✓ ffmpeg found: $(command -v ffmpeg)${NC}"
fi

echo ""

# -----------------------------------------------------------------------------
# Step 2: Copy mcp.json.example → .cursor/mcp.json
# -----------------------------------------------------------------------------
echo -e "${BLUE}[2/5] Setting up MCP configuration...${NC}"

MCP_EXAMPLE="$SCRIPT_DIR/.cursor/mcp.json.example"
MCP_TARGET="$SCRIPT_DIR/.cursor/mcp.json"

if [ -f "$MCP_TARGET" ]; then
  echo -e "${YELLOW}  ⚠ .cursor/mcp.json already exists — skipping copy.${NC}"
  echo -e "    (Delete it and re-run if you want to reset from the example.)"
else
  if [ -f "$MCP_EXAMPLE" ]; then
    cp "$MCP_EXAMPLE" "$MCP_TARGET"
    echo -e "${GREEN}  ✓ Created .cursor/mcp.json from example template.${NC}"
    echo -e "${YELLOW}  ⚠ ACTION REQUIRED: Open .cursor/mcp.json and fill in your real credentials.${NC}"
  else
    echo -e "${RED}  ✗ .cursor/mcp.json.example not found. Is the repo complete?${NC}"
    exit 1
  fi
fi

echo ""

# -----------------------------------------------------------------------------
# Step 3: Copy .env.example → .env
# -----------------------------------------------------------------------------
echo -e "${BLUE}[3/5] Setting up environment variables...${NC}"

ENV_EXAMPLE="$SCRIPT_DIR/.env.example"
ENV_TARGET="$SCRIPT_DIR/.env"

if [ -f "$ENV_TARGET" ]; then
  echo -e "${YELLOW}  ⚠ .env already exists — skipping copy.${NC}"
else
  if [ -f "$ENV_EXAMPLE" ]; then
    cp "$ENV_EXAMPLE" "$ENV_TARGET"
    echo -e "${GREEN}  ✓ Created .env from example template.${NC}"
    echo -e "${YELLOW}  ⚠ ACTION REQUIRED: Open .env and fill in your credentials.${NC}"
  else
    echo -e "${RED}  ✗ .env.example not found. Is the repo complete?${NC}"
    exit 1
  fi
fi

echo ""

# -----------------------------------------------------------------------------
# Step 4: Install Node.js dependencies
# -----------------------------------------------------------------------------
echo -e "${BLUE}[4/5] Installing Node.js dependencies...${NC}"

PACKAGE_JSON="$SCRIPT_DIR/package.json"

if [ ! -f "$PACKAGE_JSON" ]; then
  echo -e "${YELLOW}  No package.json found — creating a minimal one for script dependencies.${NC}"
  cat > "$PACKAGE_JSON" << 'EOF'
{
  "name": "business-assistant-scripts",
  "version": "1.0.0",
  "description": "Puppeteer automation scripts for Rosy",
  "private": true,
  "scripts": {
    "test": "echo \"No tests configured yet\""
  },
  "dependencies": {}
}
EOF
  echo -e "${GREEN}  ✓ Created package.json.${NC}"
fi

cd "$SCRIPT_DIR"
npm install --silent
echo -e "${GREEN}  ✓ Node.js dependencies installed.${NC}"

echo ""

# -----------------------------------------------------------------------------
# Step 5: Verify inbox and training folders exist
# -----------------------------------------------------------------------------
echo -e "${BLUE}[5/5] Verifying workspace folders...${NC}"

for dir in inbox training; do
  if [ ! -d "$SCRIPT_DIR/$dir" ]; then
    mkdir -p "$SCRIPT_DIR/$dir"
    echo -e "${GREEN}  ✓ Created $dir/ folder.${NC}"
  else
    echo -e "${GREEN}  ✓ $dir/ folder exists.${NC}"
  fi
done

echo ""

# -----------------------------------------------------------------------------
# Done
# -----------------------------------------------------------------------------
echo -e "${BOLD}============================================${NC}"
echo -e "${GREEN}${BOLD}  Setup complete!${NC}"
echo -e "${BOLD}============================================${NC}"
echo ""
echo -e "${BOLD}Next steps:${NC}"
echo ""
echo -e "  1. ${YELLOW}Fill in your credentials:${NC}"
echo -e "       Open ${BOLD}.cursor/mcp.json${NC} and replace all placeholder values."
echo -e "       Open ${BOLD}.env${NC} and replace all placeholder values."
echo -e "       See ${BOLD}.env.example${NC} for descriptions of each credential."
echo ""
echo -e "  2. ${YELLOW}Open this folder in Cursor:${NC}"
echo -e "       File → Open Folder → select this directory."
echo ""
echo -e "  3. ${YELLOW}Read the welcome file:${NC}"
echo -e "       Open ${BOLD}01_START_HERE.md${NC} in Cursor to see Rosy's capabilities."
echo ""
echo -e "  4. ${YELLOW}Start Rosy:${NC}"
echo -e "       Open Cursor's AI chat and type: ${BOLD}Status${NC}"
echo ""
echo -e "For full setup documentation, see: ${BOLD}SETUP_GUIDE.md${NC}"
echo ""
