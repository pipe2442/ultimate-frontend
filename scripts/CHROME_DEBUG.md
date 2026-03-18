# Chrome Remote Debugging - Quick Start

If the `npm run chrome:debug` script doesn't work, you can start Chrome with debugging manually:

## Quick Command (Copy & Paste)

**Close Chrome completely first** (⌘Q), then run:

```bash
open -a "Google Chrome" --args --remote-debugging-port=9222
```

Or for the background process:

```bash
/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome --remote-debugging-port=9222 &
```

## Verify It's Working

Check if debugging is active:

```bash
curl http://localhost:9222/json/version
```

If you see JSON output, it's working! ✅

## Then Run Ultimate Frontend

```bash
npm run dev inspect
```

## For Other Browsers

**Brave:**
```bash
open -a "Brave Browser" --args --remote-debugging-port=9222
```

**Edge:**
```bash
open -a "Microsoft Edge" --args --remote-debugging-port=9222
```

## Troubleshooting

**Port already in use:**
```bash
lsof -ti:9222 | xargs kill -9
```

**Chrome won't close:**
```bash
pkill -9 "Google Chrome"
```
