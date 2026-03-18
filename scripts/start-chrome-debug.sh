#!/bin/bash

# Colors for output
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

echo ""
echo -e "${BLUE}🔧 Starting Chrome with Remote Debugging${NC}"
echo ""

# Check if Chrome is already running on port 9222
if curl -s --max-time 2 http://localhost:9222/json/version > /dev/null 2>&1; then
    echo -e "${GREEN}✓ Chrome is already running with remote debugging!${NC}"
    echo ""
    echo -e "You can now run: ${GREEN}npm run dev inspect${NC}"
    echo ""
    exit 0
fi

# Detect Chrome
CHROME_PATH=""
CHROME_NAME=""

if [ -f "/Applications/Google Chrome.app/Contents/MacOS/Google Chrome" ]; then
    CHROME_PATH="/Applications/Google Chrome.app/Contents/MacOS/Google Chrome"
    CHROME_NAME="Google Chrome"
elif [ -f "/Applications/Brave Browser.app/Contents/MacOS/Brave Browser" ]; then
    CHROME_PATH="/Applications/Brave Browser.app/Contents/MacOS/Brave Browser"
    CHROME_NAME="Brave Browser"
fi

if [ -z "$CHROME_PATH" ]; then
    echo -e "${RED}❌ Could not find Chrome or Brave${NC}"
    echo ""
    echo "Please install Google Chrome from:"
    echo "  https://www.google.com/chrome/"
    echo ""
    exit 1
fi

echo "Found: $CHROME_NAME"
echo ""

# Directory for Chrome with debugging (separate from your main profile)
DEBUG_DIR="$HOME/.chrome-with-debugging"

# Check if we need to set up the profile
if [ ! -d "$DEBUG_DIR/Default" ]; then
    echo -e "${YELLOW}First-time setup: Creating debugging profile...${NC}"
    echo ""
    echo "This will copy your current Chrome profile (including logins)"
    echo "to a separate directory for debugging."
    echo ""
    echo "Size: ~100-500MB depending on your browsing data"
    echo "This only happens once."
    echo ""
    
    mkdir -p "$DEBUG_DIR"
    
    # Copy the Default profile (with your sessions)
    if [ -d "$HOME/Library/Application Support/Google/Chrome/Default" ]; then
        echo "Copying your Chrome profile..."
        cp -R "$HOME/Library/Application Support/Google/Chrome/Default" "$DEBUG_DIR/"
        
        # Copy Local State (needed for Chrome to work)
        cp "$HOME/Library/Application Support/Google/Chrome/Local State" "$DEBUG_DIR/" 2>/dev/null || true
        
        echo -e "${GREEN}✓ Profile copied successfully${NC}"
        echo ""
    else
        echo -e "${YELLOW}Note: Using fresh profile (no existing sessions found)${NC}"
        echo ""
    fi
fi

# Close existing Chrome if running
if pgrep -x "$CHROME_NAME" > /dev/null; then
    echo -e "${YELLOW}⚠️  $CHROME_NAME is currently running${NC}"
    echo ""
    echo "Closing Chrome to enable debugging..."
    pkill "$CHROME_NAME" 2>/dev/null
    sleep 3
    
    # Force kill if needed
    if pgrep -x "$CHROME_NAME" > /dev/null; then
        pkill -9 "$CHROME_NAME" 2>/dev/null
        sleep 2
    fi
fi

# Start Chrome with debugging
echo -e "${BLUE}Starting Chrome with debugging...${NC}"
echo ""

"$CHROME_PATH" \
  --remote-debugging-port=9222 \
  --user-data-dir="$DEBUG_DIR" \
  > /dev/null 2>&1 &

CHROME_PID=$!

# Wait for Chrome to start (max 20 seconds)
echo "Waiting for Chrome to start..."
CHROME_STARTED=false

for i in {1..20}; do
    if curl -s --max-time 1 http://localhost:9222/json/version > /dev/null 2>&1; then
        CHROME_STARTED=true
        echo ""
        echo -e "${GREEN}✓ Chrome started successfully with remote debugging!${NC}"
        echo ""
        echo -e "${GREEN}✓ Using your Chrome profile (with saved logins)${NC}"
        echo -e "${GREEN}✓ Remote debugging active on port 9222${NC}"
        echo ""
        echo -e "Now run: ${GREEN}npm run dev inspect${NC}"
        echo ""
        echo -e "${YELLOW}Important:${NC}"
        echo "  • This Chrome has a copy of your sessions from when you first ran this script"
        echo "  • To update sessions: delete ~/.chrome-with-debugging and run this again"
        echo "  • Your main Chrome profile is NOT affected"
        echo ""
        exit 0
    fi
    
    echo -n "."
    sleep 1
done

# Failed to start
echo ""
echo ""
echo -e "${RED}❌ Chrome started but remote debugging didn't activate${NC}"
echo ""
echo "Please try manually:"
echo ""
echo -e "${GREEN}\"$CHROME_PATH\" --remote-debugging-port=9222 --user-data-dir=\"$HOME/.chrome-with-debugging\" &${NC}"
echo ""
echo "Then wait 10 seconds and run: npm run dev inspect"
echo ""

exit 1
