# 🚀 Chrome Debugging Setup - Complete Guide

## Why Do We Need This?

Chrome **requires** a separate user data directory to enable remote debugging. You cannot use your default Chrome profile directly with debugging enabled.

**Solution:** We create a copy of your Chrome profile at `~/.chrome-with-debugging` that includes all your logged-in sessions.

---

## Quick Start (Recommended)

### Step 1: Run the Setup Script

```bash
npm run chrome:debug
```

**What it does:**
1. Checks if Chrome is running (closes it if needed)
2. Creates `~/.chrome-with-debugging` directory
3. Copies your Chrome profile (first time only, ~100-500MB)
4. Starts Chrome with debugging enabled
5. Preserves all your logins and sessions

**First time:** Takes ~1 minute to copy profile
**After that:** Starts instantly

### Step 2: Use Ultimate Frontend

```bash
npm run dev inspect
```

You'll see:
```
✓ Connecting to existing Chrome browser via CDP...
✓ Connected to your real Chrome browser
  → Using your logged-in sessions (no bot detection!)
```

---

## How It Works

### The Problem

Chrome's security model:
- Default profile: `/Library/Application Support/Google/Chrome`
- Remote debugging: **Requires different directory**
- Error without it: `DevTools remote debugging requires a non-default data directory`

### The Solution

1. **Copy your profile:**
   ```bash
   cp -R "~/Library/Application Support/Google/Chrome/Default" ~/.chrome-with-debugging/
   ```

2. **Start Chrome with debugging:**
   ```bash
   /Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome \
     --remote-debugging-port=9222 \
     --user-data-dir="$HOME/.chrome-with-debugging"
   ```

3. **Connect from Ultimate Frontend:**
   - Playwright connects to `localhost:9222`
   - Uses your copied profile (with sessions)
   - No bot detection!

---

## Manual Setup (If Script Fails)

### Option 1: Quick Command

```bash
# Close Chrome
pkill -9 "Google Chrome"

# Create profile copy (first time only)
mkdir -p ~/.chrome-with-debugging
cp -R ~/Library/Application\ Support/Google/Chrome/Default ~/.chrome-with-debugging/

# Start Chrome with debugging
/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome \
  --remote-debugging-port=9222 \
  --user-data-dir="$HOME/.chrome-with-debugging" &

# Wait 5 seconds
sleep 5

# Verify it's working
curl http://localhost:9222/json/version

# Run Ultimate Frontend
npm run dev inspect
```

### Option 2: Step by Step

**1. Close Chrome completely:**
```bash
pkill -9 "Google Chrome"
```

**2. Create debugging profile (first time only):**
```bash
mkdir -p ~/.chrome-with-debugging
cp -R ~/Library/Application\ Support/Google/Chrome/Default ~/.chrome-with-debugging/
cp ~/Library/Application\ Support/Google/Chrome/Local\ State ~/.chrome-with-debugging/
```

**3. Start Chrome with debugging:**
```bash
/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome \
  --remote-debugging-port=9222 \
  --user-data-dir="$HOME/.chrome-with-debugging" > /dev/null 2>&1 &
```

**4. Wait and verify:**
```bash
sleep 5
curl http://localhost:9222/json/version
```

You should see JSON output. If you do, it's working! ✅

**5. Run Ultimate Frontend:**
```bash
npm run dev inspect
```

---

## Updating Your Sessions

The debugging Chrome uses a **snapshot** of your profile from when you first ran the script.

To update with fresh logins:

```bash
# Delete old profile
rm -rf ~/.chrome-with-debugging

# Run setup again (will copy fresh profile)
npm run chrome:debug
```

---

## Troubleshooting

### Port 9222 not responding

**Check if Chrome is running:**
```bash
pgrep -fl "Google Chrome"
```

**Check if port is active:**
```bash
lsof -i :9222
```

**If port is busy:**
```bash
# Kill whatever is using it
lsof -ti:9222 | xargs kill -9

# Restart Chrome
npm run chrome:debug
```

### Chrome opens but no debugging

Make sure you're using `--user-data-dir` that is **NOT** your default Chrome directory.

**Bad (won't work):**
```bash
--user-data-dir="$HOME/Library/Application Support/Google/Chrome"
```

**Good (works):**
```bash
--user-data-dir="$HOME/.chrome-with-debugging"
```

### Profile copy failed

If the profile copy fails (no space, permissions, etc.):

```bash
# Use a fresh profile (no sessions)
/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome \
  --remote-debugging-port=9222 \
  --user-data-dir="$HOME/.chrome-debug-empty" &
```

You'll need to log in manually to sites.

### Chrome won't close

```bash
# Force kill all Chrome processes
pkill -9 "Google Chrome"
pkill -9 "Google Chrome Helper"

# Wait
sleep 3

# Try again
npm run chrome:debug
```

---

## Testing

Verify everything works:

```bash
# 1. Start Chrome with debugging
npm run chrome:debug

# 2. In another terminal, check port
curl http://localhost:9222/json/version

# 3. Run Ultimate Frontend
npm run dev inspect

# 4. Navigate to Gmail or Lovable
# 5. Press Enter to capture
# 6. Should work without bot detection!
```

---

## FAQ

**Q: Will this affect my normal Chrome?**
A: No. Your regular Chrome profile at `~/Library/Application Support/Google/Chrome` is never modified.

**Q: Can I use my normal Chrome while debugging?**
A: No. Only one Chrome instance can run at a time on macOS. The debugging Chrome replaces it temporarily.

**Q: Do I need to copy my profile every time?**
A: No. Only the first time. After that, the script reuses `~/.chrome-with-debugging`.

**Q: How do I get fresh sessions?**
A: Delete `~/.chrome-with-debugging` and run `npm run chrome:debug` again.

**Q: Can I use Brave or Edge?**
A: Yes! The script auto-detects Brave. For Edge, same concept applies.

**Q: What if I want to use a different profile?**
A: Replace `Default` with your profile name:
```bash
cp -R ~/Library/Application\ Support/Google/Chrome/Profile\ 1 ~/.chrome-with-debugging/Default
```

---

## Summary

✅ **What works:** Copying profile → separate directory → Chrome with debugging
❌ **What doesn't work:** Using default profile with debugging (Chrome prevents this)
🎯 **Result:** Your sessions + no bot detection

Happy debugging! 🚀
