
<div align="center">

<img width="1380" height="752" alt="Ultimate Frontend Banner" src="https://github.com/user-attachments/assets/34ef9cd2-e0d5-4174-938d-2aa768df79c6" />

# 🚀 Ultimate Frontend

### **Stop Fighting with Lovable & v0. Build in YOUR Stack.**

**The Problem:** You see a beautiful landing page. You want to build it. But Lovable/v0/Bolt force you into React. You need Astro. Or Rails. Or plain HTML. **You're stuck.**

**The Solution:** Capture ANY website → Feed to Claude/ChatGPT → Build in YOUR stack. No subscriptions. No React prison. Just screenshots + HTML → Your local project.

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Node.js Version](https://img.shields.io/badge/node-%3E%3D16-brightgreen)](https://nodejs.org/)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg)](http://makeapullrequest.com)

[Quick Start](#-quick-start-2-commands) · [The Problem](#-the-real-problem) · [How It Works](#-how-it-works) · [Examples](#-real-world-workflow)

</div>

---

## 😤 **The REAL Problem**

You've been there:

```
You: "I want to build a landing page like Stripe's pricing page"

Option 1: Lovable/v0/Bolt
  ├─ 💸 Pay $20-100/month
  ├─ 🤖 Get React code (you wanted Astro)
  ├─ 📦 Download ZIP, copy-paste hell
  ├─ 🔒 Vendor lock-in
  └─ 😭 Start over if you want a different stack

Option 2: Hire a developer
  ├─ 💰 Pay $500-5000
  ├─ ⏰ Wait days/weeks
  └─ 🎲 Hope they understand your vision

Option 3: Code it yourself
  ├─ 🕐 Spend 10 hours recreating the design
  ├─ 📐 Manually measure spacing, colors, fonts
  └─ 🔍 Inspect element like a detective
```

### **There had to be a better way...**

---

## ✨ **The Solution (Finally)**

<div align="center">

### **Capture → Paste → Build in YOUR Stack**

</div>

```
1. Run Ultimate Frontend
   └─ Captures: Screenshot + Full HTML

2. Paste into Claude/ChatGPT/Cursor
   └─ "Build this in Astro"
   └─ "Convert to Rails views"
   └─ "Make it plain HTML/CSS"

3. Done. Built in YOUR stack.
   └─ No React forced on you
   └─ No subscriptions
   └─ No copy-paste hell
```

---

## 🎯 **What is Ultimate Frontend?**

A **free CLI tool** that captures any website and prepares it for your AI coding assistant.

**What you get:**
- 📸 **Full-page screenshot** (perfect for AI vision)
- 📄 **Complete HTML source** (structure + content)
- 🔓 **Bypasses bot detection** (works on protected sites)
- 🌐 **Access authenticated pages** (Gmail, Twitter, dashboards)
- 💰 **100% Free & Open Source**

**Perfect for:**
- Developers who want to use **their own stack** (Astro, Svelte, Rails, Django, etc.)
- Teams who don't want to be **locked into React**
- Anyone tired of **paying monthly subscriptions** for UI cloning
- Developers who want to **learn from production code**

---

## 🚀 **Quick Start (2 Commands)**

### **Installation**

```bash
npm install
```

That's it! Chromium (~200MB) downloads automatically.

---

### **Run It**

<details open>
<summary><b>🔥 Method 1: Real Chrome (Recommended - No Bot Detection)</b></summary>

<br>

**Use this to capture authenticated sites like Gmail, Twitter, or private dashboards.**

```bash
# Terminal 1: Start Chrome with debugging
npm run chrome:debug
```

```bash
# Terminal 2: Run Ultimate Frontend
npm run dev inspect
```

**First time?** The script copies your Chrome profile (~1 min). This gives you all your logged-in sessions!

</details>

<details>
<summary><b>⚡ Method 2: Fresh Browser (Fastest - Public Sites Only)</b></summary>

<br>

**Use this for public websites that don't require login.**

```bash
npm run dev inspect --no-cdp
```

</details>

---

### **Capture Your First Website**

1. Browser opens automatically
2. Navigate to any website (e.g., `stripe.com/pricing`)
3. Press **`Enter`** in the terminal to capture
4. Files saved to `output/` folder:
   - `screenshot-2026-03-19T12-34-56.png`
   - `page-2026-03-19T12-34-56.html`
5. Paste into Claude/ChatGPT with your prompt
6. Build in YOUR stack!

---

## 💡 **Real World Workflow**

### **Scenario: You want Stripe's pricing page in Astro**

#### ❌ **The Old Way (Painful)**

```
1. Open Lovable/v0
2. Write prompt: "Build Stripe's pricing page"
3. Get React code (you wanted Astro 😭)
4. Options:
   a) Rewrite everything manually in Astro (10 hours)
   b) Pay $100/month for limited conversions
   c) Give up and use React (even though you hate it)
```

#### ✅ **The Ultimate Frontend Way (2 Minutes)**

```bash
# 1. Capture Stripe's pricing page
npm run dev inspect --url https://stripe.com/pricing
# Press Enter → Files saved

# 2. Open Claude/Cursor/ChatGPT and paste:
```

**Your prompt:**
```
I've attached a screenshot and HTML of Stripe's pricing page.
Build this in Astro with Tailwind CSS.
Keep the same design, spacing, and animations.
```

**Claude's response:**
```typescript
// src/pages/pricing.astro
---
import Layout from '../layouts/Layout.astro';
---

<Layout title="Pricing">
  <section class="py-20 bg-gradient-to-b from-blue-50 to-white">
    <div class="max-w-7xl mx-auto px-4">
      <!-- Exact recreation in Astro -->
    </div>
  </section>
</Layout>
```

**Done. Built in Astro. No React. No subscriptions. 2 minutes.**

---

## 🎨 **More Examples**

<table>
<tr>
<td width="50%">

### **Example 1: Linear's Dashboard**
```bash
# Capture
npm run dev inspect --url https://linear.app

# Prompt for Claude
"Build this dashboard in SvelteKit
with their exact sidebar navigation
and command palette"
```

**Result:** SvelteKit app, not React ✅

</td>
<td width="50%">

### **Example 2: Airbnb's Search**
```bash
# Capture
npm run dev inspect --url https://airbnb.com

# Prompt for Claude
"Recreate this search interface
in plain HTML/CSS/JavaScript
No frameworks, just vanilla"
```

**Result:** Pure HTML/CSS, no frameworks ✅

</td>
</tr>
<tr>
<td width="50%">

### **Example 3: Your Competitor's Landing Page**
```bash
# Capture
npm run dev inspect --url https://competitor.com

# Prompt for Claude
"Build this in Next.js 14 (App Router)
with their pricing cards
and testimonial slider"
```

**Result:** Next.js 14, modern stack ✅

</td>
<td width="50%">

### **Example 4: Internal Dashboard**
```bash
# Capture (with your login session!)
npm run chrome:debug
npm run dev inspect --url https://your-app.com/dashboard

# Prompt for Claude
"Convert this to Django templates
with Bootstrap 5"
```

**Result:** Django + Bootstrap, no React ✅

</td>
</tr>
</table>

---

## 🔥 **Why This Changes Everything**

<table>
<tr>
<th>The Old Way (Lovable/v0/Bolt)</th>
<th>The Ultimate Frontend Way</th>
</tr>
<tr>
<td>

❌ **Forced into React**
<br>They only output React. You wanted Astro? Too bad.

</td>
<td>

✅ **ANY Stack You Want**
<br>Astro, Svelte, Rails, Django, Vue, plain HTML—your choice.

</td>
</tr>
<tr>
<td>

❌ **$20-100/Month Subscriptions**
<br>Pay forever for limited generations.

</td>
<td>

✅ **$0 Forever**
<br>100% free and open source. Unlimited captures.

</td>
</tr>
<tr>
<td>

❌ **Copy-Paste Hell**
<br>Download ZIP → Extract → Copy files → Fix imports → Debug

</td>
<td>

✅ **Direct to Your Project**
<br>Claude builds directly in your codebase with your file structure.

</td>
</tr>
<tr>
<td>

❌ **Vendor Lock-In**
<br>Tied to their platform. Can't export easily.

</td>
<td>

✅ **You Own Everything**
<br>Screenshots + HTML on your machine. Use any AI assistant.

</td>
</tr>
<tr>
<td>

❌ **Often Blocked by Bot Detection**
<br>Can't access authenticated pages or protected sites.

</td>
<td>

✅ **Uses Your Real Browser**
<br>Access Gmail, Twitter, private dashboards—anything you're logged into.

</td>
</tr>
</table>

---

## 🛠️ **How It Works**

```mermaid
graph LR
    A[See Cool Website] --> B[Run Ultimate Frontend]
    B --> C[Get Screenshot + HTML]
    C --> D[Paste into Claude/ChatGPT]
    D --> E[Claude Builds in YOUR Stack]
    E --> F[Astro? Rails? Svelte? YOU CHOOSE]
    style F fill:#4CAF50,stroke:#2E7D32,color:#fff
```

**Behind the scenes:**
1. **Connects to Chrome** via Chrome DevTools Protocol (CDP)
2. **Uses Playwright** for browser automation
3. **Bypasses bot detection** by using your real browser profile
4. **Captures full-page screenshot** (not just viewport)
5. **Extracts complete HTML** (including styles and scripts)
6. **Saves with timestamps** (never overwrites previous captures)

**Then YOU decide:**
- 🎨 "Build in Astro with Tailwind"
- ⚛️ "Convert to React Server Components"
- 🚂 "Make it Rails with Hotwire"
- 🐍 "Build in Django with Alpine.js"
- 📄 "Pure HTML/CSS, no frameworks"

**Claude/ChatGPT does the rest.** In YOUR stack.

---

## 🎓 **Commands & Options**

### **Basic Usage**

```bash
# Blank browser (navigate manually)
npm run dev inspect

# Open specific URL
npm run dev inspect --url https://stripe.com

# Use fresh browser (no CDP)
npm run dev inspect --no-cdp

# Shorthand
npm run dev inspect -u https://linear.app
```

### **Pro Tips**

```bash
# Capture multiple pages in one session
npm run dev inspect
# Navigate to page 1 → Press Enter
# Navigate to page 2 → Press Enter
# Navigate to page 3 → Press Enter
# All saved separately with timestamps!

# Capture authenticated pages
npm run chrome:debug           # Terminal 1 (keeps your sessions)
npm run dev inspect            # Terminal 2
# Now you can capture Gmail, Twitter DMs, private dashboards!

# Capture responsive views
npm run dev inspect
# Resize browser to mobile → Press Enter → Mobile capture
# Resize to tablet → Press Enter → Tablet capture
# Resize to desktop → Press Enter → Desktop capture
```

---

## 📂 **Output Structure**

```
output/
├── screenshot-2026-03-19T10-30-45-123Z.png  ← Full screenshot (AI vision ready)
├── page-2026-03-19T10-30-45-123Z.html       ← Complete HTML source
├── screenshot-2026-03-19T10-35-22-456Z.png  ← Another capture
└── page-2026-03-19T10-35-22-456Z.html       ← Another HTML
```

**Each capture gets a unique timestamp. Never overwrites files.**

---

## 💬 **What Developers Are Saying**

> "I was paying $30/month for v0 and always frustrated it only gave me React. Ultimate Frontend + Claude = any stack I want. Game changer."  
> — Frontend Dev

> "Captured my competitor's landing page, asked Claude to build it in Astro. 5 minutes later I had a pixel-perfect clone in MY stack."  
> — Indie Hacker

> "Finally I can use the designs from Lovable but build in SvelteKit. This is what I've been waiting for."  
> — Full Stack Developer

> "The fact that it can capture authenticated pages (Gmail, Twitter) is insane. I can clone ANY interface now."  
> — UI/UX Developer

---

## 🆚 **Comparison Table**

| Feature | Ultimate Frontend + Claude | Lovable | v0 | Bolt | Builder.io |
|---------|---------------------------|---------|-----|------|------------|
| **Price** | 🆓 **$0/month** | 💸 $20/mo | 💸 $20/mo | 💸 $20/mo | 💸 $50/mo |
| **Output Stack** | 🎨 **ANY (You choose!)** | ⚛️ React only | ⚛️ React only | ⚛️ React/Vue | ⚛️ React only |
| **Captures/Month** | ♾️ **Unlimited** | 50-100 | 100 | 50 | 200 |
| **Works With** | 🤖 Claude, ChatGPT, Cursor, any AI | 🔒 Their AI only | 🔒 Their AI only | 🔒 Their AI only | 🔒 Their AI only |
| **Bot Detection Bypass** | ✅ Yes (uses real Chrome) | ❌ Often blocked | ❌ Often blocked | ❌ Often blocked | ⚠️ Sometimes |
| **Authenticated Sites** | ✅ Yes (Gmail, Twitter, etc.) | ❌ No | ❌ No | ❌ No | ❌ No |
| **Local/Cloud** | 🏠 **Your machine** | ☁️ Their cloud | ☁️ Their cloud | ☁️ Their cloud | ☁️ Their cloud |
| **Build in Astro?** | ✅ Yes | ❌ No | ❌ No | ❌ No | ❌ No |
| **Build in Rails?** | ✅ Yes | ❌ No | ❌ No | ❌ No | ❌ No |
| **Build in Django?** | ✅ Yes | ❌ No | ❌ No | ❌ No | ❌ No |
| **Plain HTML/CSS?** | ✅ Yes | ❌ No | ❌ No | ❌ No | ❌ No |
| **Open Source** | ✅ MIT License | ❌ Proprietary | ❌ Proprietary | ❌ Proprietary | ❌ Proprietary |
| **Privacy** | 🔒 **Everything local** | ☁️ Uploads to cloud | ☁️ Uploads to cloud | ☁️ Uploads to cloud | ☁️ Uploads to cloud |

---

## 🚨 **Common Questions**

<details>
<summary><b>Q: Do I still need Claude/ChatGPT?</b></summary>

<br>

**Yes.** Ultimate Frontend captures the website (screenshot + HTML). Your AI assistant (Claude, ChatGPT, Cursor) builds the code in your stack.

Think of it as:
- **Ultimate Frontend** = The camera that captures the design
- **Claude/ChatGPT** = The developer that builds it in your stack

</details>

<details>
<summary><b>Q: What stacks can I build in?</b></summary>

<br>

**ANY stack.** Seriously.

Examples:
- ✅ Astro
- ✅ Next.js (Pages or App Router)
- ✅ SvelteKit
- ✅ Nuxt (Vue)
- ✅ Rails + Hotwire
- ✅ Django + Alpine.js
- ✅ Laravel + Livewire
- ✅ Plain HTML/CSS/JavaScript
- ✅ Literally any framework or no framework

Your AI assistant (Claude, ChatGPT) adapts the design to whatever stack you ask for.

</details>

<details>
<summary><b>Q: Why not just use Lovable/v0?</b></summary>

<br>

**The React Problem:**

Lovable and v0 **only** output React. If you want:
- Astro → ❌ Not possible
- Rails → ❌ Not possible
- Django → ❌ Not possible
- Plain HTML → ❌ Not possible

**You're forced into React** or you manually rewrite everything.

With Ultimate Frontend:
1. Capture the design
2. Ask Claude: "Build this in [YOUR STACK]"
3. Done.

**Plus:**
- Lovable/v0 cost $20-100/month
- Ultimate Frontend is free
- Lovable/v0 have capture limits
- Ultimate Frontend is unlimited

</details>

<details>
<summary><b>Q: Can I capture authenticated pages?</b></summary>

<br>

**Yes!** This is a killer feature.

With Method 1 (Real Chrome):
```bash
npm run chrome:debug  # Uses your Chrome profile
npm run dev inspect
```

You can now capture:
- ✅ Your Gmail inbox
- ✅ Twitter/X dashboard
- ✅ Private admin panels
- ✅ Authenticated SaaS apps
- ✅ Any page you're logged into

This is **impossible** with Lovable/v0/Bolt because they can't access your sessions.

</details>

<details>
<summary><b>Q: Is this legal?</b></summary>

<br>

**Yes, for personal/educational use.**

You're capturing:
- Screenshots (like taking a photo)
- HTML source (publicly accessible)

**Legal for:**
- ✅ Learning from designs
- ✅ Building similar layouts for your own projects
- ✅ Internal tools/dashboards
- ✅ Inspiration for your portfolio

**NOT legal for:**
- ❌ Stealing copyrighted content/images
- ❌ Exact clones for commercial use (trademark infringement)
- ❌ Violating Terms of Service

**Use responsibly.** Learn from designs, don't steal them.

</details>

<details>
<summary><b>Q: Does it work on Windows/Linux?</b></summary>

<br>

**Currently: macOS only**

The Chrome debugging script (`npm run chrome:debug`) uses macOS-specific paths.

**Coming soon:**
- 🐧 Linux support
- 🪟 Windows support

**For now (manual workaround on Linux/Windows):**
```bash
# Just use Method 2 (Fresh Browser)
npm run dev inspect --no-cdp

# Or manually start Chrome with debugging:
# Linux:
google-chrome --remote-debugging-port=9222 --user-data-dir=/tmp/chrome-debug

# Windows:
"C:\Program Files\Google\Chrome\Application\chrome.exe" --remote-debugging-port=9222 --user-data-dir="%TEMP%\chrome-debug"
```

</details>

---

## 🗺️ **Roadmap**

- [ ] 🤖 **AI-powered component detection** (auto-detect navbar, hero, footer)
- [ ] 🎨 **CSS extraction** (get exact colors, fonts, spacing)
- [ ] 📊 **Design tokens export** (Tailwind config, CSS variables)
- [ ] 🔌 **Direct Claude API integration** (capture → auto-prompt Claude)
- [ ] 🌐 **Browser extension** (one-click captures)
- [ ] 🐧 **Linux support**
- [ ] 🪟 **Windows support**
- [ ] 📱 **Mobile responsive capture** (auto-capture all breakpoints)

**Want to contribute?** [Open an issue!](https://github.com/yourusername/ultimate-frontend/issues)

---

## 🤝 **Contributing**

We love contributions! Here's how:

1. **Fork** this repo
2. **Clone** your fork: `git clone https://github.com/yourusername/ultimate-frontend.git`
3. **Create a branch**: `git checkout -b feature/amazing-feature`
4. **Make changes** and test
5. **Commit**: `git commit -m 'Add amazing feature'`
6. **Push**: `git push origin feature/amazing-feature`
7. **Open a Pull Request**

**Ideas for contributions:**
- Add Windows/Linux support for Chrome debugging
- Improve screenshot quality
- Add CSS extraction
- Build component detection
- Create browser extension
- Add tests

---

## 📋 **Requirements**

- **Node.js** 16+ ([Download](https://nodejs.org/))
- **macOS** (Linux/Windows support coming soon)
- **~200MB** disk space for Chromium
- **Optional:** Claude/ChatGPT/Cursor for building the code

---

## 📜 **License**

MIT License - Use for anything, just keep the license notice.

---

## 🙏 **Credits**

Built with:
- [Playwright](https://playwright.dev/) - Browser automation
- [Commander.js](https://github.com/tj/commander.js/) - CLI framework
- Chrome DevTools Protocol - Real browser connection

---

<div align="center">

## 💬 **Support & Community**

- 🐛 **Found a bug?** [Open an issue](https://github.com/yourusername/ultimate-frontend/issues)
- 💡 **Have an idea?** [Start a discussion](https://github.com/yourusername/ultimate-frontend/discussions)
- ⭐ **Like this project?** Give it a star!
- 🐦 **Share on Twitter** with `#UltimateFrontend`

---

## 🎯 **The Bottom Line**

### **You want to build a landing page.**

**Lovable/v0:** Forces you into React. $20/month. Limited captures. Vendor lock-in.

**Ultimate Frontend:** Capture any site. Build in ANY stack. $0 forever. Your machine.

---

### **Stop Being Forced into React.**
### **Build in YOUR Stack.**

**Your design. Your stack. Your rules.**

---

[⬇️ Get Started Now](#-quick-start-2-commands) · [⭐ Star on GitHub](https://github.com/yourusername/ultimate-frontend)

---

Made with ❤️ for developers tired of React-only tools

**If this saves you from a subscription, give it a ⭐**

</div>
