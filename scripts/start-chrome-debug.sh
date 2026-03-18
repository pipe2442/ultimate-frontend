#!/bin/bash

# Colors for output
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

echo ""
echo -e "${YELLOW}🔧 Starting Chrome with Remote Debugging...${NC}"
echo ""

# Check if Chrome is already running on port 9222
if curl -s http://localhost:9222/json/version > /dev/null 2>&1; then
    echo -e "${GREEN}✓ Chrome is already running with remote debugging!${NC}"
    echo ""
    echo -e "You can now run: ${GREEN}npm run dev inspect${NC}"
    echo ""
    exit 0
fi

# Detect Chrome location
CHROME_PATH=""
CHROME_NAME=""

if [ -f "/Applications/Google Chrome.app/Contents/MacOS/Google Chrome" ]; then
    CHROME_PATH="/Applications/Google Chrome.app/Contents/MacOS/Google Chrome"
    CHROME_NAME="Google Chrome"
elif [ -f "/Applications/Brave Browser.app/Contents/MacOS/Brave Browser" ]; then
    CHROME_PATH="/Applications/Brave Browser.app/Contents/MacOS/Brave Browser"
    CHROME_NAME="Brave Browser"
elif [ -f "/Applications/Microsoft Edge.app/Contents/MacOS/Microsoft Edge" ]; then
    CHROME_PATH="/Applications/Microsoft Edge.app/Contents/MacOS/Microsoft Edge"
    CHROME_NAME="Microsoft Edge"
fi

if [ -z "$CHROME_PATH" ]; then
    echo -e "${RED}❌ Could not find Chrome, Brave, or Edge${NC}"
    echo ""
    echo "Please install Google Chrome from:"
    echo "  https://www.google.com/chrome/"
    echo ""
    exit 1
fi

echo "Found: $CHROME_NAME"
echo ""

# Check if browser is running
if pgrep -x "$CHROME_NAME" > /dev/null; then
    echo -e "${YELLOW}⚠️  $CHROME_NAME is currently running (without debugging enabled)${NC}"
    echo ""
    echo "Please close Chrome completely and run this script again."
    echo ""
    echo "To close Chrome:"
    echo "  1. Click on Chrome"
    echo "  2. Press ⌘Q (Command+Q)"
    echo "  3. Run this script again: npm run chrome:debug"
    echo ""
    echo -e "${YELLOW}Alternative:${NC} Close Chrome now and this script will auto-start it..."
    echo -e "Press Ctrl+C to cancel or wait 10 seconds..."
    
    # Wait 10 seconds for user to close Chrome
    for i in {10..1}; do
        if ! pgrep -x "$CHROME_NAME" > /dev/null; then
            echo ""
            echo -e "${GREEN}✓ Chrome closed!${NC}"
            break
        fi
        echo -n "$i... "
        sleep 1
    done
    echo ""
    
    # If still running, force close
    if pgrep -x "$CHROME_NAME" > /dev/null; then
        echo "Force closing Chrome..."
        osascript -e "quit app \"$CHROME_NAME\"" 2>/dev/null
        sleep 3
        
        # If STILL running, kill it
        if pgrep -x "$CHROME_NAME" > /dev/null; then
            pkill -9 "$CHROME_NAME" 2>/dev/null
            sleep 2
        fi
    fi
fi

# Launch Chrome with debugging
echo "Starting Chrome with remote debugging..."
open -a "$CHROME_NAME" --args --remote-debugging-port=9222

# Wait for Chrome to start (max 15 seconds)
echo "Waiting for Chrome to start..."
for i in {1..15}; do
    if curl -s http://localhost:9222/json/version > /dev/null 2>&1; then
        echo ""
        echo -e "${GREEN}✓ Chrome started successfully with remote debugging!${NC}"
        echo ""
        echo -e "Remote debugging active: ${GREEN}http://localhost:9222${NC}"
        echo ""
        echo -e "Now run: ${GREEN}npm run dev inspect${NC}"
        echo ""
        echo -e "${YELLOW}Note:${NC} Keep Chrome open while using Ultimate Frontend."
        echo "      The tool will connect to this Chrome instance."
        echo ""
        exit 0
    fi
    sleep 1
done

# Failed to start
echo ""
echo -e "${RED}❌ Failed to start Chrome with remote debugging${NC}"
echo ""
echo "Please try running this command manually:"
echo ""
echo -e "${GREEN}open -a \"$CHROME_NAME\" --args --remote-debugging-port=9222${NC}"
echo ""
exit 1
