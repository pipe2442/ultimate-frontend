# Ultimate Frontend

> Inspect any website and capture its structure - a CLI tool for frontend developers

Ultimate Frontend is a command-line tool that opens a browser, lets you navigate to any website, and captures screenshots along with the HTML source code. Perfect for analyzing UIs, creating documentation, or archiving web pages.

## Features

- Launch a real browser (powered by Playwright)
- Navigate to any website or start with a blank page
- Capture full-page screenshots and HTML source
- Multiple captures in one session
- Timestamped output files (never overwrites)
- Interactive and easy to use

## Installation

```bash
npm install
```

The browser binaries (Chromium) will be automatically downloaded during installation.

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
4. Press `Enter` in the terminal to capture
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

## Commands

### `inspect`

Launch a browser and capture screenshots + HTML.

```bash
npm run dev inspect [options]
```

**Options:**
- `-u, --url <url>` - URL to open (default: blank page)

**Examples:**

```bash
# Start with blank page
npm run dev inspect

# Open a specific URL
npm run dev inspect --url https://github.com

# Shorthand
npm run dev inspect -u https://google.com
```

## Troubleshooting

### Browser doesn't open

If you see an "Executable doesn't exist" error, install the browsers manually:

```bash
npx playwright install chromium
```

### Permission issues

Make sure you have write permissions in the project directory. Output files are saved to `./output/`.

## Requirements

- Node.js 16+
- ~200MB disk space for browser binaries

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
