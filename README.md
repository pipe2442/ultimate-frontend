
<div align="center">

<img width="1380" height="752" alt="Ultimate Frontend Banner" src="https://github.com/user-attachments/assets/34ef9cd2-e0d5-4174-938d-2aa768df79c6" />

# 🚀 Ultimate Frontend

### **Look, I'm not giving Lovable my $20. You shouldn't either.**

You know the drill: You see Stripe's pricing page and think "damn, that's clean." 

So you open Lovable, write a prompt, wait 30 seconds, and boom—React code. **But you don't use React.** You use Astro. Or Rails. Or literally anything else.

Now you're stuck copy-pasting from a GitHub repo you don't understand, trying to translate React components into your stack at 2 AM while questioning your life choices.

**There's a better way.**

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Node.js Version](https://img.shields.io/badge/node-%3E%3D16-brightgreen)](https://nodejs.org/)

[Just Show Me How](#-how-it-works-3-steps) · [Quick Start](#-quick-start-2-commands)

</div>

---

## 😤 **The Problem (You Know This One)**

**You:** "I want to build a landing page like Linear's homepage"

**Lovable/v0:** "Here's 847 lines of React code! That'll be $20 please."

**You:** "But I'm building in Astro..."

**Lovable:** "Did I stutter? React or nothing, buddy."

**You:** *[Starts manually rewriting everything at 11 PM]*

---

## 💡 **What Ultimate Frontend Does**

It's stupid simple:

1. **You:** Point it at any website
2. **It:** Takes a screenshot + grabs the HTML
3. **You:** Paste both into Claude
4. **Claude:** Builds it in whatever stack you actually use
5. **You:** Go to bed at a reasonable hour

No subscriptions. No React prison. No copy-paste nightmares.

---

## 🎯 **How It Works (3 Steps)**

### **Step 1: Capture the website**
```bash
npm run dev inspect --url https://stripe.com/pricing
# Press Enter
# Done. Files saved.
```

### **Step 2: Give it to Claude**
Open Claude, drop in the screenshot and HTML:
```
"Build this in Astro. Make it look exactly like this."
```

### **Step 3: There is no step 3**
Claude writes the code. In Astro. Or Rails. Or Django. Or plain HTML. **Whatever you want.**

That's it. That's the whole thing.

---

## 🤷 **Why Does This Exist?**

I got tired of:

- **Paying $20/month** for tools that force me into React
- **Getting React code** when I explicitly said "build this in Astro"
- **Cloning GitHub repos** and spending 2 hours figuring out their file structure
- **Copy-pasting** 500 lines of JSX and praying it works
- **Rewriting everything** because my stack isn't React

So I built this. It captures the website. You tell Claude what you want. Done.

---

## 🚀 **Quick Start (2 Commands)**

### **Install**
```bash
git clone https://github.com/yourusername/ultimate-frontend.git
cd ultimate-frontend
npm install
```

### **Use It**

**For public websites:**
```bash
npm run dev inspect --url https://example.com
```

**For sites you're logged into (Gmail, Twitter, etc.):**
```bash
# Terminal 1
npm run chrome:debug

# Terminal 2  
npm run dev inspect
# Now you can capture your Gmail, Twitter feed, private dashboards, whatever
```

Files get saved to `output/`:
- `screenshot-[timestamp].png`
- `page-[timestamp].html`

Paste them into Claude. Tell it your stack. Build.

---

## 📖 **Real Examples**

### **Example 1: Stripe's pricing page → Astro**
```bash
npm run dev inspect --url https://stripe.com/pricing
```
**Tell Claude:** "Build this in Astro with Tailwind"  
**Get:** Astro code. Not React. Astro.

---

### **Example 2: Your competitor's landing page → Plain HTML**
```bash
npm run dev inspect --url https://competitor.com
```
**Tell Claude:** "Make this in vanilla HTML/CSS, no frameworks"  
**Get:** Plain HTML. No npm install. No build step. Just HTML.

---

### **Example 3: Linear's dashboard → SvelteKit**
```bash
npm run dev inspect --url https://linear.app
```
**Tell Claude:** "Recreate this dashboard in SvelteKit"  
**Get:** SvelteKit components. Not React. SvelteKit.

---

### **Example 4: Your own Gmail inbox → Rails**
```bash
npm run chrome:debug    # Uses your actual Chrome profile
npm run dev inspect     # Capture your inbox
```
**Tell Claude:** "Build this email interface in Rails with Hotwire"  
**Get:** Rails views with Hotwire. Because why not.

---

## 🆚 **Lovable/v0 vs This Thing**

| | Lovable/v0 | Ultimate Frontend |
|---|---|---|
| **Monthly cost** | $20-100 | $0 (it's free, keep your money) |
| **Output** | React, React, or React | Whatever you want |
| **When you say "build in Astro"** | Gives you React anyway | Gives you Astro |
| **Copy-paste hell** | Yes | No |
| **Your data** | Their servers | Your computer |
| **Captures per month** | 50-100 | Unlimited (go wild) |

---

## 🤔 **FAQ (The Honest Version)**

**Q: Do I still need Claude/ChatGPT?**  
A: Yes. This thing captures the website. Claude builds the code. They're a team.

**Q: Can I use this instead of paying for Lovable?**  
A: That's literally why this exists.

**Q: What if I want it in React?**  
A: Then just... use Lovable? This is for people who DON'T want React.

**Q: Can I capture sites I'm logged into?**  
A: Yes! Use `npm run chrome:debug` first. Then you can capture your Gmail, Twitter, private dashboards, whatever.

**Q: Is this legal?**  
A: Yes. You're taking screenshots and reading HTML (which is public). Don't steal copyrighted images or claim their design as yours. Use your brain.

**Q: Does it work on Windows/Linux?**  
A: Right now it's macOS only. Linux/Windows support coming soon. You can still use it though—just use `npm run dev inspect --no-cdp` for now.

**Q: Why is it free?**  
A: Because I'm tired of subscription fatigue and I like building things. Also, it's open source, so if you hate something, fix it and send a PR.

---

## 🎯 **The Bottom Line**

**Lovable gives you React.**  
**v0 gives you React.**  
**Bolt gives you React.**

**Ultimate Frontend gives you whatever you want.**

Capture any website → Paste to Claude → Build in your stack.

Astro? Sure.  
Rails? Why not.  
Plain HTML? Absolutely.  
React? I mean... yeah, if you really want.

**Your website. Your stack. Your choice.**

---

## 🛠️ **All Commands**

```bash
# Basic capture
npm run dev inspect --url https://example.com

# Navigate manually then capture
npm run dev inspect
# Browse to any site, press Enter when ready

# Capture authenticated sites (use your real Chrome)
npm run chrome:debug          # Terminal 1
npm run dev inspect           # Terminal 2

# Capture multiple pages
npm run dev inspect
# Page 1 → Enter → Page 2 → Enter → Page 3 → Enter
# All saved with unique timestamps
```

---

## 💬 **What People Say**

> "Canceled my v0 subscription. This + Claude = I can finally build in Astro."

> "Captured my competitor's landing page, Claude rebuilt it in Next.js in like 5 minutes. Wild."

> "The fact that I can capture my Gmail and have Claude build it in Django is insane."

---

## 🤝 **Contributing**

This is open source. If you want to add Windows support, CSS extraction, or make it better somehow—go for it. PRs welcome.

---

## 📋 **Requirements**

- Node.js 16+ ([Download here](https://nodejs.org/))
- macOS (for now, Linux/Windows coming)
- ~200MB for Chromium (it downloads automatically)

---

## 📜 **License**

MIT - Do whatever you want. Build cool stuff.

---

<div align="center">

## **Stop paying for React-only tools.**

**Capture anything. Build in your stack. Keep your $20.**

[⬇️ Get Started](#-quick-start-2-commands) · [⭐ Star This Thing](https://github.com/yourusername/ultimate-frontend)

---

*Made by someone who got tired of tools that only output React*

*If this saves you money, give it a star. Or don't. I'm not your boss.*

</div>
