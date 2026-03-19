
<div align="center">

<img width="1380" height="752" alt="Ultimate Frontend Banner" src="https://github.com/user-attachments/assets/34ef9cd2-e0d5-4174-938d-2aa768df79c6" />

# 🚀 Ultimate Frontend

### **I'm not paying $20/month for Lovable or v0 anymore.**

See a cool website? Want to build it?

**The problem:** Lovable and v0 only give you React code. But you use Astro. Or Rails. Or plain HTML.

**The solution:** Ultimate Frontend captures any website (screenshot + HTML) → You paste it to Claude → Claude builds it in **YOUR stack**.

Not React. Not their choice. **Your stack.**

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Node.js Version](https://img.shields.io/badge/node-%3E%3D16-brightgreen)](https://nodejs.org/)

[Get Started](#-quick-start) · [How It Works](#-how-it-works) · [Why This Exists](#-why-i-built-this)

</div>

---

## 😤 **Why I Built This**

I was paying $20/month for v0. Every time I prompted it:

```
Me: "Build a landing page like Stripe's pricing"
v0: "Here's your React code!"
Me: "But I need it in Astro..."
v0: "🤷 React or nothing"
```

**I was tired of:**
- Paying monthly for a tool that forces me into React
- Copy-pasting code from downloaded ZIPs
- Rewriting everything manually when I need a different stack

**So I built Ultimate Frontend.**

---

## 💡 **How It Works (Super Simple)**

```
1. You see a website you like
   ↓
2. Run: npm run dev inspect --url https://cool-site.com
   ↓
3. Ultimate Frontend captures:
   • Screenshot (full page)
   • HTML source code
   ↓
4. Paste both into Claude/ChatGPT
   ↓
5. Say: "Build this in [YOUR STACK]"
   ↓
6. Done. Built in your stack.
```

---

## 🎯 **Real Example**

Let's say you want to build Stripe's pricing page in Astro:

### **Step 1: Capture it**
```bash
npm run dev inspect --url https://stripe.com/pricing
# Press Enter
# Files saved: screenshot.png + page.html
```

### **Step 2: Paste to Claude**
Open Claude, attach the screenshot and HTML, then say:
```
"Build this pricing page in Astro with Tailwind. 
Keep the same layout and animations."
```

### **Step 3: Done**
Claude writes the Astro code. In your project. With your file structure.

**That's it.**

---

## ✨ **What You Get**

```bash
output/
├── screenshot-2026-03-19T12-34-56.png    # Full-page screenshot
└── page-2026-03-19T12-34-56.html         # Complete HTML
```

Paste these into any AI assistant:
- Claude
- ChatGPT
- Cursor
- Whatever you use

Tell it your stack:
- "Build in Astro"
- "Convert to Rails views"
- "Make it SvelteKit"
- "Plain HTML/CSS only"
- "Django templates"

**Your choice. Your stack.**

---

## 🚀 **Quick Start**

### **Install**
```bash
git clone https://github.com/yourusername/ultimate-frontend.git
cd ultimate-frontend
npm install
```

### **Run**

**Option 1: Public websites (fastest)**
```bash
npm run dev inspect --url https://example.com
# Press Enter to capture
# Done!
```

**Option 2: Authenticated sites (Gmail, Twitter, etc.)**
```bash
# Terminal 1
npm run chrome:debug

# Terminal 2
npm run dev inspect
# Now you can capture sites you're logged into!
```

### **Use it**
1. Files saved to `output/` folder
2. Open Claude or ChatGPT
3. Attach the screenshot and HTML
4. Say: "Build this in [your stack]"
5. Build!

---

## 🆚 **vs. Lovable/v0**

| | Lovable/v0 | Ultimate Frontend |
|---|---|---|
| **Price** | $20-100/month | Free |
| **Stack** | React only | ANY stack you want |
| **Captures** | 50-100/month | Unlimited |
| **Your data** | Their cloud | Your computer |
| **Works with** | Their AI only | Claude, ChatGPT, Cursor, any AI |

---

## 📖 **More Examples**

### **Example: Landing page in plain HTML**
```bash
npm run dev inspect --url https://linear.app
```
Then tell Claude: *"Make this in plain HTML and CSS, no frameworks"*

### **Example: Dashboard in SvelteKit**
```bash
npm run dev inspect --url https://vercel.com/dashboard
```
Then tell Claude: *"Build this dashboard in SvelteKit with their sidebar navigation"*

### **Example: Your competitor's site in Next.js**
```bash
npm run dev inspect --url https://competitor.com
```
Then tell Claude: *"Recreate this in Next.js 14 with App Router"*

---

## 🤔 **FAQ**

**Q: Do I still need Claude/ChatGPT?**  
Yes. Ultimate Frontend captures the website. Claude builds the code.

**Q: What stacks can I use?**  
ANY. Astro, Next.js, SvelteKit, Rails, Django, Vue, plain HTML—whatever you want.

**Q: Why not just screenshot it myself?**  
You can! But Ultimate Frontend also grabs the HTML source, which helps Claude understand the structure better.

**Q: Can I capture authenticated pages?**  
Yes! Use Method 2 (chrome:debug) and you can capture Gmail, Twitter, private dashboards—anything you're logged into.

**Q: Is this better than Lovable?**  
If you want to use anything other than React, yes. Lovable only outputs React. This lets you use any stack.

**Q: How much does it cost?**  
$0. It's free and open source.

---

## 🛠️ **Commands**

```bash
# Capture a specific URL
npm run dev inspect --url https://example.com

# Capture whatever you navigate to
npm run dev inspect

# Use your real Chrome (for authenticated sites)
npm run chrome:debug          # Terminal 1
npm run dev inspect           # Terminal 2

# Capture multiple pages
npm run dev inspect
# Navigate to page 1 → Press Enter
# Navigate to page 2 → Press Enter
# Navigate to page 3 → Press Enter
```

---

## 💬 **What People Are Saying**

> "Stopped paying for v0. Now I just capture with this and build in Astro. Perfect."

> "Finally I can clone designs without being forced into React."

> "Captured my competitor's landing page, Claude built it in Rails in 5 minutes."

---

## 🎯 **Bottom Line**

**Lovable and v0 are great, but they force you into React.**

If you want to build in:
- Astro
- SvelteKit
- Rails
- Django
- Plain HTML
- Or literally anything else

**Use Ultimate Frontend.**

Capture any website. Give it to Claude. Build in your stack.

Simple as that.

---

## 🤝 **Contributing**

This is open source. PRs welcome!

Ideas:
- Windows/Linux support
- CSS extraction
- Component detection
- Browser extension

---

## 📋 **Requirements**

- Node.js 16+
- macOS (Windows/Linux coming soon)
- ~200MB for Chromium

---

## 📜 **License**

MIT - Do whatever you want with it.

---

<div align="center">

## **Stop paying for tools that force you into React.**

**Capture any website. Build in your stack. Free forever.**

[⬇️ Get Started](#-quick-start) · [⭐ Star on GitHub](https://github.com/yourusername/ultimate-frontend)

---

Made by a developer tired of React-only tools

</div>
