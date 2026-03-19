# AI Agent Development Guide

> **For AI coding agents working on the Ultimate Frontend codebase**

This document provides comprehensive guidelines, conventions, and best practices for AI agents contributing to Ultimate Frontend.

---

## 📋 Table of Contents

- [Project Overview](#-project-overview)
- [Quick Start](#-quick-start)
- [Code Style & Conventions](#-code-style--conventions)
- [Architecture](#-architecture)
- [Key Implementation Details](#-key-implementation-details)
- [Development Workflow](#-development-workflow)
- [Testing](#-testing)
- [Common Tasks](#-common-tasks)
- [Troubleshooting](#-troubleshooting)

---

## 🎯 Project Overview

**Ultimate Frontend** is a free, open-source CLI tool that captures website screenshots and HTML source code without bot detection.

### Core Functionality

- **Screenshot & HTML Capture**: Uses Playwright to capture full-page screenshots and HTML
- **CDP Integration**: Connects to real Chrome via Chrome DevTools Protocol to bypass bot detection
- **Session Persistence**: Leverages user's Chrome profile for authenticated sites (Gmail, Twitter, etc.)
- **Timestamped Output**: Saves captures to `output/` with unique ISO timestamps

### Technology Stack

| Component | Technology | Purpose |
|-----------|-----------|---------|
| **Runtime** | Node.js (ESM) | JavaScript execution environment |
| **Browser Automation** | Playwright | Control browser, capture screenshots |
| **CLI Framework** | Commander.js | Command-line interface |
| **Browser Connection** | Chrome DevTools Protocol (CDP) | Connect to real Chrome |
| **Shell Scripting** | Bash | Chrome debugging setup |

### Project Goals

1. **Free Alternative**: Provide a no-cost alternative to paid tools (Lovable, v0, Builder.io)
2. **Bot Detection Bypass**: Use real Chrome sessions to avoid automation detection
3. **Developer Experience**: Simple, intuitive CLI for frontend developers
4. **Privacy First**: All processing happens locally (no cloud uploads)

---

## 🚀 Quick Start

### Installation

```bash
# Install dependencies (includes Chromium download ~200MB)
npm install
```

### Development Commands

```bash
# Run CLI in development mode
npm run dev <command> [options]

# Examples
npm run dev inspect                      # Open blank browser
npm run dev inspect --url https://example.com  # Open specific URL
npm run dev inspect --no-cdp             # Force fresh browser (no CDP)
npm run dev screenshot                   # Screenshot command (placeholder)
npm run dev clone                        # Clone command (placeholder)
```

### Chrome Debugging Setup

```bash
# Start Chrome with remote debugging (enables CDP)
npm run chrome:debug

# What this script does:
# 1. Copies Chrome profile to ~/.chrome-with-debugging (first time: ~1 min)
# 2. Starts Chrome with --remote-debugging-port=9222
# 3. Verifies debugging port is active (up to 20 seconds)
```

### Recommended Development Setup

**Terminal 1:**
```bash
npm run chrome:debug  # Start Chrome with debugging
```

**Terminal 2:**
```bash
npm run dev inspect   # Run the tool
```

---

## 🎨 Code Style & Conventions

### Module System

✅ **Use ESM modules only**
- `package.json` has `"type": "module"`
- Always include `.js` extension in imports
- No CommonJS (`require`, `module.exports`)

```javascript
// ✅ Correct
import { BrowserManager } from './lib/browser-manager.js'

// ❌ Wrong
import { BrowserManager } from './lib/browser-manager'  // Missing .js
const { BrowserManager } = require('./lib/browser-manager')  // CommonJS
```

### Import Order

Follow this strict order for imports:

```javascript
// 1. External packages (from node_modules)
import { chromium } from 'playwright'
import { Command } from 'commander'

// 2. Node.js built-in modules
import fs from 'fs/promises'
import path from 'path'
import readline from 'readline'

// 3. Local modules (with .js extension)
import { BrowserManager } from '../lib/browser-manager.js'
import { waitForEnter } from '../lib/terminal-input.js'
```

### Formatting Rules

| Rule | Standard | Example |
|------|----------|---------|
| **Indentation** | 2 spaces (no tabs) | `  const foo = 'bar'` |
| **Quotes** | Double quotes | `"hello"` not `'hello'` |
| **Semicolons** | Follow file's existing style | Check before adding |
| **Line Length** | 80-100 characters | Break long lines |
| **Trailing Commas** | Yes (multiline only) | `{ a, b, }` |
| **Blank Lines** | 1 between functions | Improve readability |

### Naming Conventions

```javascript
// Files: kebab-case
browser-manager.js
terminal-input.js
start-chrome-debug.sh

// Classes: PascalCase
class BrowserManager {}
class FileWriter {}

// Functions: camelCase
function inspectCommand() {}
async function waitForEnter() {}

// Constants: camelCase for config, SCREAMING_SNAKE_CASE for true constants
const outputDir = './output'
const DEFAULT_URL = 'about:blank'

// Private/Internal: Underscore prefix
_internalHelper() {}
```

### Error Handling Pattern

```javascript
// Always use try-catch-finally for async operations
async function commandName(options) {
  const browserManager = new BrowserManager()
  
  try {
    await browserManager.launch(url)
    // ... command logic
  } catch (error) {
    // Handle specific errors with helpful messages
    if (error.message.includes('Target closed')) {
      console.log('\n✓ Browser closed by user')
    } else if (error.message.includes('ECONNREFUSED')) {
      console.error('\n✗ Could not connect to Chrome on port 9222')
      console.log('  Run: npm run chrome:debug')
    } else {
      console.error('\n✗ Error:', error.message)
    }
  } finally {
    // ALWAYS cleanup resources
    await browserManager.close()
    console.log('\n👋 Goodbye!')
  }
}

// Throw descriptive errors
if (!this.page) {
  throw new Error('Browser not launched. Call launch() first.')
}
```

### Console Output Standards

Use emojis for visual clarity and consistent formatting:

```javascript
// Status messages
console.log('🌐 Launching browser...')
console.log('🚀 Starting capture...')
console.log('📸 Taking screenshot...')

// Success
console.log('✓ Connected to Chrome')
console.log('✓ Capture saved successfully')

// Warnings
console.log('⚠️  Chrome not running with debugging')
console.log('⚠️  Using fresh browser (bot detection may occur)')

// Errors
console.error('\n✗ Error: Browser failed to launch')

// Info (indent sub-items with 2 spaces)
console.log('✓ Capture #1 saved:')
console.log('  📄 HTML: output/page-2026-03-19.html')
console.log('  📷 Screenshot: output/screenshot-2026-03-19.png')
console.log('  🔗 URL: https://example.com')
```

### Async/Await Guidelines

```javascript
// ✅ Always use async/await
async function doSomething() {
  const result = await fetchData()
  return result
}

// ❌ Don't use raw Promises
function doSomething() {
  return fetchData().then(result => result)
}

// ❌ Don't use callbacks
function doSomething(callback) {
  fetchData((err, result) => callback(err, result))
}

// ✅ Handle rejections with try-catch
try {
  await riskyOperation()
} catch (error) {
  console.error('Operation failed:', error.message)
}
```

### Documentation (JSDoc)

Optional but recommended for complex functions:

```javascript
/**
 * Launches browser with optional CDP connection
 * @param {string} url - URL to navigate to (default: blank page)
 * @param {Object} options - Launch options
 * @param {boolean} options.useCDP - Whether to use Chrome DevTools Protocol
 * @returns {Promise<void>}
 * @throws {Error} If browser fails to launch
 */
async function launch(url, options = {}) {
  // Implementation
}
```

---

## 🏗️ Architecture

### Directory Structure

```
ultimate-frontend/
├── bin/
│   └── cli.js                    # Executable entry point (#!/usr/bin/env node)
├── src/
│   ├── index.js                  # Commander.js CLI setup
│   ├── commands/                 # Command implementations
│   │   ├── inspect.js           # Main inspect command (interactive capture)
│   │   ├── screenshot.js        # Screenshot command (placeholder)
│   │   └── clone.js             # Clone command (placeholder)
│   └── lib/                      # Shared utilities
│       ├── browser-manager.js   # Browser lifecycle & CDP connection
│       ├── file-writer.js       # File I/O with timestamp generation
│       └── terminal-input.js    # User input (waitForEnter)
├── scripts/
│   └── start-chrome-debug.sh    # Bash script for Chrome CDP setup
├── output/                       # Generated captures (gitignored)
├── package.json
└── README.md
```

### Command Pattern

Each command follows this structure:

```javascript
// src/commands/example-command.js
import { BrowserManager } from '../lib/browser-manager.js'

export async function exampleCommand(options) {
  // 1. Parse and validate options
  const { url, cdp } = options
  
  // 2. Initialize dependencies
  const browserManager = new BrowserManager()
  
  // 3. Main logic with error handling
  try {
    console.log('🌐 Starting command...')
    
    await browserManager.launch(url, { useCDP: cdp })
    const result = await browserManager.capture()
    
    console.log('✓ Command completed')
  } catch (error) {
    // Handle specific errors
    if (error.message.includes('Target closed')) {
      console.log('\n✓ Browser closed by user')
    } else {
      console.error('\n✗ Error:', error.message)
    }
  } finally {
    // 4. Always cleanup
    await browserManager.close()
  }
}
```

### Browser Manager Pattern

The `BrowserManager` class handles all browser operations:

```javascript
class BrowserManager {
  constructor() {
    this.browser = null
    this.page = null
    this.usingCDP = false
  }
  
  // 1. Launch browser (with CDP detection)
  async launch(url, options = {}) { }
  
  // 2. Capture screenshot + HTML
  async capture() { }
  
  // 3. Close browser (never closes user's Chrome if using CDP)
  async close() { }
}
```

**Usage Pattern:**

```javascript
const browserManager = new BrowserManager()

try {
  await browserManager.launch(url)      // Step 1
  const data = await browserManager.capture()  // Step 2
} finally {
  await browserManager.close()          // Step 3 (always)
}
```

### Data Flow

```
User Input (CLI)
      ↓
src/index.js (Commander.js routing)
      ↓
src/commands/*.js (Command logic)
      ↓
lib/browser-manager.js (Browser control)
      ↓
lib/file-writer.js (Save to disk)
      ↓
output/ directory (Timestamped files)
```

---

## 🔑 Key Implementation Details

### Chrome DevTools Protocol (CDP)

**Why CDP?**
- Connects to existing Chrome without triggering bot detection
- Preserves user's logged-in sessions (cookies, authentication)
- Extensions and bookmarks available
- Faster than launching fresh browser

**How CDP Detection Works:**

```javascript
// 1. Try to connect to debugging port
const response = await fetch('http://localhost:9222/json/version')

// 2a. If successful: Connect to existing Chrome
if (response.ok) {
  const { webSocketDebuggerUrl } = await response.json()
  browser = await chromium.connectOverCDP(webSocketDebuggerUrl)
  console.log('✓ Connected to your real Chrome browser')
}

// 2b. If failed: Fall back to fresh browser
else {
  browser = await chromium.launch()
  console.log('⚠️  Launching fresh browser (bot detection may occur)')
}
```

**CDP Requirements:**
- Chrome must be started with `--remote-debugging-port=9222`
- Chrome must use non-default profile: `--user-data-dir=~/.chrome-with-debugging`
- Port 9222 must be accessible (takes 5-10 seconds to activate)

### File Naming Convention

All output files use **ISO 8601 timestamps** to prevent overwrites:

```javascript
// Format: base-YYYY-MM-DDTHH-MM-SS-MSSZ.extension
page-2026-03-19T12-34-56-789Z.html
screenshot-2026-03-19T12-34-56-789Z.png

// Implementation
function generateTimestampedName(base, extension) {
  const timestamp = new Date().toISOString().replace(/[:.]/g, '-')
  return `${base}-${timestamp}.${extension}`
}
```

**Benefits:**
- Never overwrites existing files
- Chronologically sortable
- Unique per millisecond
- Human-readable

### Binary vs. Text File Handling

```javascript
// Screenshots: Binary buffers (no encoding)
const screenshot = await page.screenshot({ fullPage: true })  // Buffer
await fs.writeFile(path, screenshot)  // No encoding option

// HTML: Text (UTF-8 encoding)
const html = await page.content()  // String
await fs.writeFile(path, html, 'utf8')  // Explicit encoding

// Auto-detection in file-writer.js
async function writeOutputFile(filename, content) {
  if (Buffer.isBuffer(content)) {
    await fs.writeFile(filepath, content)  // Binary
  } else {
    await fs.writeFile(filepath, content, 'utf8')  // Text
  }
}
```

### Chrome Profile Copying

**First-time setup** (handled by `scripts/start-chrome-debug.sh`):

1. **Source:** `~/Library/Application Support/Google/Chrome/Default/`
2. **Destination:** `~/.chrome-with-debugging/Default/`
3. **Size:** ~100-500MB (depends on browsing data)
4. **Duration:** ~30-60 seconds
5. **Includes:** Cookies, sessions, passwords, history, bookmarks

**Why copy instead of using original?**
- Chrome won't allow debugging on default profile
- Prevents conflicts with user's main Chrome instance
- Isolates debugging environment

---

## 🔄 Development Workflow

### Adding a New Command

**Example: Adding a `convert` command**

**Step 1:** Create command file
```javascript
// src/commands/convert.js
export async function convertCommand(options) {
  const { format } = options
  console.log(`🔄 Converting to ${format}...`)
  // Implementation
}
```

**Step 2:** Register in CLI
```javascript
// src/index.js
import { convertCommand } from './commands/convert.js'

program
  .command('convert')
  .description('Convert captured HTML to another format')
  .option('-f, --format <type>', 'Output format (md, pdf, etc.)')
  .action(convertCommand)
```

**Step 3:** Test
```bash
npm run dev convert --format md
```

### Modifying Browser Behavior

**Browser launch options:**
```javascript
// src/lib/browser-manager.js

async launch(url, options = {}) {
  // Add new launch arguments
  this.browser = await chromium.launch({
    headless: false,  // Always visible
    args: [
      '--start-maximized',  // New: Start maximized
      '--disable-notifications',  // New: Disable popups
    ]
  })
}
```

**Capture options:**
```javascript
// src/lib/browser-manager.js

async capture() {
  // Modify screenshot settings
  const screenshot = await this.page.screenshot({
    fullPage: true,
    type: 'png',  // New: Force PNG format
    quality: 100,  // New: Max quality
  })
}
```

### Changing Output Format

**Add new file type:**
```javascript
// src/lib/file-writer.js

export async function writeOutputFile(filename, content, format = 'auto') {
  const filepath = path.join(outputDir, filename)
  
  if (format === 'json') {
    // New: JSON output support
    await fs.writeFile(filepath, JSON.stringify(content, null, 2), 'utf8')
  } else if (Buffer.isBuffer(content)) {
    await fs.writeFile(filepath, content)
  } else {
    await fs.writeFile(filepath, content, 'utf8')
  }
}
```

### Git Workflow

**Important:** Only commit when explicitly asked by the user.

```bash
# ❌ Don't automatically commit
# ✅ Wait for user to request commit

# When user asks to commit:
git add .
git commit -m "Descriptive message"

# Commit message format:
# - Imperative mood: "Add feature" not "Added feature"
# - Clear description of changes
# - Reference issues if applicable
```

---

## 🧪 Testing

### Current Testing Approach

**No formal test framework exists yet.** Use manual testing:

**Test Checklist:**

```bash
# 1. CDP Connection Test
npm run chrome:debug  # Terminal 1
npm run dev inspect   # Terminal 2
# → Should see: "✓ Connected to your real Chrome browser"

# 2. Capture Test
# → Navigate to example.com
# → Press Enter
# → Verify files in output/:
ls -lh output/
# → Should have screenshot-*.png and page-*.html

# 3. CDP Fallback Test
npm run dev inspect --no-cdp
# → Should see: "⚠️  Launching fresh browser"

# 4. URL Option Test
npm run dev inspect --url https://github.com
# → Should open GitHub directly

# 5. Multiple Capture Test
npm run dev inspect
# → Press Enter 3 times
# → Verify 6 files in output/ (3 HTML + 3 PNG)

# 6. Error Handling Test
npm run dev inspect  # Without chrome:debug first
# → Should gracefully fall back to fresh browser
```

### Future Testing (Roadmap)

- [ ] Add Jest or Vitest for unit tests
- [ ] Mock Playwright for faster tests
- [ ] Add integration tests for CDP connection
- [ ] Add E2E tests with real browser
- [ ] Add CI/CD pipeline (GitHub Actions)

---

## 📝 Common Tasks

### Task 1: Add New CLI Option

**Example: Add `--timeout` option**

```javascript
// src/index.js
program
  .command('inspect')
  .description('Inspect the current page')
  .option('-u, --url <url>', 'URL to open')
  .option('-t, --timeout <ms>', 'Page load timeout in milliseconds', '30000')  // New
  .action(inspectCommand)

// src/commands/inspect.js
export async function inspectCommand(options) {
  const { url, timeout } = options
  
  await browserManager.launch(url, {
    timeout: parseInt(timeout)  // Use the option
  })
}
```

### Task 2: Add Console Logging

**Use consistent emoji patterns:**

```javascript
// Progress indicators
console.log('🌐 Launching browser...')
console.log('🔍 Detecting CDP...')
console.log('📸 Capturing screenshot...')
console.log('💾 Saving files...')

// Success states
console.log('✓ Browser launched')
console.log('✓ Screenshot captured')

// Warnings
console.log('⚠️  CDP not available')
console.log('⚠️  Using fallback mode')

// Errors
console.error('✗ Failed to connect')

// Info lists
console.log('Saved files:')
console.log('  📄 page.html')
console.log('  📷 screenshot.png')
```

### Task 3: Handle New Error Type

```javascript
// src/commands/inspect.js

try {
  await browserManager.launch(url)
} catch (error) {
  // Add new error handler
  if (error.message.includes('ERR_CONNECTION_REFUSED')) {
    console.error('\n✗ Could not connect to Chrome')
    console.log('  Make sure Chrome is running: npm run chrome:debug')
  } else if (error.message.includes('Target closed')) {
    console.log('\n✓ Browser closed by user')
  } else {
    console.error('\n✗ Error:', error.message)
  }
}
```

### Task 4: Modify Output Directory

```javascript
// src/lib/file-writer.js

// Change from ./output to ./captures
const outputDir = path.join(process.cwd(), 'captures')

// Ensure directory exists
await fs.mkdir(outputDir, { recursive: true })
```

---

## 🚨 Troubleshooting

### CDP Connection Issues

**Problem:** "Chrome not running with remote debugging"

**Diagnosis:**
```bash
# Check if Chrome is listening on port 9222
curl http://localhost:9222/json/version

# Expected: JSON response with browser info
# Error: Connection refused = Chrome not running with debugging
```

**Solutions:**
```bash
# Solution 1: Start Chrome with debugging
npm run chrome:debug

# Solution 2: Verify debugging directory exists
ls -la ~/.chrome-with-debugging/

# Solution 3: Manual Chrome start (macOS)
/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome \
  --remote-debugging-port=9222 \
  --user-data-dir="$HOME/.chrome-with-debugging" &

# Wait 10 seconds for port to activate
sleep 10
curl http://localhost:9222/json/version
```

### Bot Detection Still Occurring

**Problem:** Sites detect automation even with CDP

**Diagnosis:**
```bash
# Check console output for CDP connection
npm run dev inspect

# ✓ Good: "✓ Connected to your real Chrome browser"
# ✗ Bad: "⚠️  Launching fresh browser"
```

**Solutions:**
```bash
# Solution 1: Refresh Chrome profile
rm -rf ~/.chrome-with-debugging
npm run chrome:debug

# Solution 2: Verify Chrome process
ps aux | grep chrome | grep 9222

# Solution 3: Kill zombie Chrome processes
pkill -9 "Google Chrome"
npm run chrome:debug
```

### File Permission Errors

**Problem:** "EACCES: permission denied"

**Solutions:**
```bash
# Solution 1: Check output directory permissions
ls -ld output/
chmod 755 output/

# Solution 2: Verify disk space
df -h .

# Solution 3: Check file ownership
ls -la output/
```

### Profile Copy Failures

**Problem:** "Could not copy Chrome profile"

**Solutions:**
```bash
# Solution 1: Check source profile exists
ls -la ~/Library/Application\ Support/Google/Chrome/Default/

# Solution 2: Check disk space (profiles can be 500MB+)
df -h ~

# Solution 3: Manual copy
cp -R ~/Library/Application\ Support/Google/Chrome/Default \
      ~/.chrome-with-debugging/
```

### Port Already in Use

**Problem:** "Port 9222 is already in use"

**Solutions:**
```bash
# Solution 1: Find process using port
lsof -i :9222

# Solution 2: Kill process
kill -9 <PID>

# Solution 3: Use different port (requires code change)
# Edit scripts/start-chrome-debug.sh
--remote-debugging-port=9223
```

---

## 📚 Additional Resources

### Important Files to Know

| File | Purpose | When to Edit |
|------|---------|--------------|
| `package.json` | Dependencies, scripts | Adding new commands/deps |
| `src/index.js` | CLI routing | Registering new commands |
| `src/lib/browser-manager.js` | Browser control | Modifying launch/capture |
| `scripts/start-chrome-debug.sh` | Chrome CDP setup | Changing Chrome flags |

### Platform-Specific Notes

**macOS** (current focus):
- Chrome path: `/Applications/Google Chrome.app/Contents/MacOS/Google Chrome`
- Profile path: `~/Library/Application Support/Google/Chrome/Default/`
- Tested on macOS Sonoma+

**Linux** (future):
- Chrome path: `/usr/bin/google-chrome` or `/usr/bin/chromium`
- Profile path: `~/.config/google-chrome/Default/`

**Windows** (future):
- Chrome path: `C:\Program Files\Google\Chrome\Application\chrome.exe`
- Profile path: `%LOCALAPPDATA%\Google\Chrome\User Data\Default`

### Performance Considerations

- **Chrome profile copy:** ~100-500MB, 30-60 seconds (first time only)
- **Chrome startup:** 5-10 seconds for debugging port to activate
- **Page load:** Depends on network/site (wait for `networkidle` state)
- **Screenshot:** ~1-3 seconds for full-page capture
- **HTML extraction:** < 100ms

### Security Notes

- **Never commit** `.env` files or credentials
- **Chrome profile copy** contains sensitive data (cookies, passwords)
- **Output files** may contain authentication tokens in HTML
- **Port 9222** is accessible to localhost only (safe)

---

## 🎯 Best Practices Summary

1. ✅ **Always use ESM** - No CommonJS
2. ✅ **Include .js extensions** in imports
3. ✅ **Follow import order** - External → Built-in → Local
4. ✅ **Use try-catch-finally** for async operations
5. ✅ **Always cleanup** resources in `finally`
6. ✅ **Use emoji prefixes** in console output
7. ✅ **Prefer async/await** over Promises
8. ✅ **Add JSDoc** for complex functions
9. ✅ **Test manually** before committing
10. ✅ **Ask before committing** - User controls git

---

## 📞 Questions?

If something is unclear or you encounter an issue not covered here:

1. Check existing code for patterns
2. Review the troubleshooting section
3. Test changes manually before committing
4. Ask the user for clarification if needed

**Remember:** This is a developer tool used by real people. Prioritize stability and clear error messages over feature complexity.

---

*Last updated: March 19, 2026*
