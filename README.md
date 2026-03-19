
<img width="1380" height="752" alt="uf" src="https://github.com/user-attachments/assets/34ef9cd2-e0d5-4174-938d-2aa768df79c6" />


# Ultimate Frontend

> Inspect any website and capture its structure - a CLI tool for frontend developers

Ultimate Frontend is a command-line tool that opens a browser, lets you navigate to any website, and captures screenshots along with the HTML source code. Perfect for analyzing UIs, creating documentation, or archiving web pages.

## Features

- **Connect to your real Chrome browser** - No bot detection! Use your logged-in sessions
- Launch a real browser (powered by Playwright)
- Navigate to any website or start with a blank page
- Capture full-page screenshots and HTML source
- Multiple captures in one session
- Timestamped output files (never overwrites)
- Interactive and easy to use
- **Works with Gmail, Lovable, and other sites that detect automation**

## Installation

```bash
npm install
```

The browser binaries (Chromium) will be automatically downloaded during installation (~200MB).

## Quick Start

### Fastest Way (5 seconds)

```bash
# 1. Install
npm install

# 2. Run
npm run dev inspect
```

That's it! A browser opens, navigate anywhere, press Enter to capture.

---

## Recommended Setup: Use Your Real Chrome (No Bot Detection!)

Sites like Gmail, Lovable, and others detect automation. With this method, you use your real Chrome with all your logins!

### Step 1: Start Chrome with debugging

```bash
npm run chrome:debug
```

**First time only:**
- Copies your Chrome profile (includes all your saved logins)
- Takes ~1 minute (~100-500MB)
- You only do this once!

### Step 2: Run the tool

Open a **new terminal** and run:

```bash
npm run dev inspect
```

**Done!** The tool connects to your Chrome with all your logged-in sessions!

**Benefits:**
- ✅ No bot detection
- ✅ Use all your logged-in sessions
- ✅ Keep your extensions and bookmarks
- ✅ Faster than launching a fresh browser

---

## Alternative: Fresh Browser

If you don't need logged-in sessions or want a clean browser:

```bash
npm run dev inspect --no-cdp
```

**Note:** This launches a fresh Chromium instance. Sites may detect it as a bot.

---

## Usage

### Basic Usage

Open a blank browser and navigate anywhere:

```bash
npm run dev inspect
```

### Open a Specific URL

```bash
npm run dev inspect --url https://example.com
```

### How It Works

1. Run the `inspect` command
2. A browser window opens
3. Navigate to any website you want to capture
4. **Press `Enter` in the terminal to capture**
5. Screenshot and HTML are saved to `./output/`
6. Make changes or navigate to another page
7. Press `Enter` again for another capture
8. Press `Ctrl+C` when done

### Output

All captures are saved to the `output/` directory with timestamps:

```
output/
├── page-2026-03-17T10-30-45-123Z.html
├── screenshot-2026-03-17T10-30-45-123Z.png
├── page-2026-03-17T10-35-22-456Z.html
└── screenshot-2026-03-17T10-35-22-456Z.png
```

**Never overwrites!** Each capture gets a unique timestamp.

---

## Commands

### `inspect`

Launch a browser and capture screenshots + HTML.

```bash
npm run dev inspect [options]
```

**Options:**
- `-u, --url <url>` - URL to open (default: blank page)
- `--no-cdp` - Launch fresh browser instead of connecting to existing Chrome

**Examples:**

```bash
# Connect to your real Chrome (recommended)
npm run chrome:debug    # Terminal 1: Start Chrome
npm run dev inspect     # Terminal 2: Connect and capture

# Start with blank page
npm run dev inspect

# Open a specific URL
npm run dev inspect --url https://github.com

# Use fresh browser (bot detection may occur)
npm run dev inspect --no-cdp

# Shorthand
npm run dev inspect -u https://google.com
```

---

## Troubleshooting

### "Chrome not running with remote debugging"

If you see this warning:

**Solution:**

```bash
npm run chrome:debug
```

This will close your current Chrome and start a debugging-enabled version. Then run `npm run dev inspect` again.

---

### Need to refresh your sessions?

The debugging Chrome uses a copy of your profile from the first time you ran the script. To update:

```bash
# Delete the debugging profile
rm -rf ~/.chrome-with-debugging

# Run the script again to copy fresh sessions
npm run chrome:debug
```

---

### Browser doesn't open

If you see an "Executable doesn't exist" error, install the browsers manually:

```bash
npx playwright install chromium
```

---

### Permission issues

Make sure you have write permissions in the project directory. Output files are saved to `./output/`.

---

### Sites still detect bot (even with CDP)

Very rare, but if a site still detects automation:

1. Make sure you're using `npm run chrome:debug` first
2. The tool should show "✓ Connected to your real Chrome browser"
3. If it shows "Launching fresh browser", CDP connection failed
4. Try refreshing your profile: `rm -rf ~/.chrome-with-debugging && npm run chrome:debug`

---

### Manual Chrome start (if script fails)

```bash
# Close Chrome completely
pkill -9 "Google Chrome"

# Start with debugging
/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome \
  --remote-debugging-port=9222 \
  --user-data-dir="$HOME/.chrome-with-debugging" &

# Wait 5 seconds, then run
npm run dev inspect
```

---

## Requirements

- Node.js 16+
- ~200MB disk space for browser binaries
- macOS (Linux/Windows support coming soon)

## Roadmap

- [ ] Parse HTML to detect UI components (navbar, hero, footer)
- [ ] Generate markdown reports with component analysis
- [ ] Extract and analyze CSS styles
- [ ] Generate React/Vue/HTML code from captured UIs
- [ ] Browser extension for easier capturing
- [ ] Plugin system for custom analyzers

## Contributing

Contributions are welcome! This is an open-source project.

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## License

MIT

## Author

**mr_code**

---

Made with ❤️ for the frontend community
