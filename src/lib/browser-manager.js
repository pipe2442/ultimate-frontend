import { chromium } from 'playwright'

export class BrowserManager {
  constructor() {
    this.browser = null
    this.page = null
    this.context = null
    this.isConnectedViaCDP = false
  }

  async detectCDP(port = 9222) {
    try {
      const response = await fetch(`http://localhost:${port}/json/version`, {
        signal: AbortSignal.timeout(2000) // 2 second timeout
      })
      return response.ok
    } catch {
      return false
    }
  }

  async launch(url = 'about:blank', options = {}) {
    const { useCDP = true, cdpPort = 9222 } = options
    
    // Try to connect to existing browser via CDP first
    if (useCDP) {
      const cdpAvailable = await this.detectCDP(cdpPort)
      
      if (cdpAvailable) {
        console.log('✓ Connecting to existing Chrome browser via CDP...')
        try {
          this.browser = await chromium.connectOverCDP(`http://localhost:${cdpPort}`)
          this.isConnectedViaCDP = true
          
          // Get existing contexts
          const contexts = this.browser.contexts()
          
          if (contexts.length > 0) {
            this.context = contexts[0]
            // Use existing tab or create new one
            const pages = this.context.pages()
            this.page = pages[0] || await this.context.newPage()
          } else {
            // Create new context if none exists
            this.context = await this.browser.newContext()
            this.page = await this.context.newPage()
          }
          
          console.log('✓ Connected to your real Chrome browser')
          console.log('  → Using your logged-in sessions (no bot detection!)')
          
          if (url && url !== 'about:blank') {
            await this.page.goto(url)
          }
          
          return this.page
        } catch (error) {
          console.warn('⚠️  Failed to connect via CDP:', error.message)
          console.log('   Falling back to fresh browser...')
        }
      } else {
        console.log('⚠️  Chrome not running with remote debugging')
        console.log('   Start Chrome with: npm run chrome:debug')
        console.log('   Falling back to fresh browser (bot detection may occur)...')
      }
    }
    
    // Fallback to launching new browser
    console.log('🚀 Launching fresh Chromium browser...')
    this.browser = await chromium.launch({ 
      headless: false,
      slowMo: 100
    })
    
    this.isConnectedViaCDP = false
    this.page = await this.browser.newPage()
    
    if (url && url !== 'about:blank') {
      await this.page.goto(url)
    }
    
    return this.page
  }

  async capture() {
    if (!this.page) {
      throw new Error('Browser not launched. Call launch() first.')
    }

    // For CDP connections, search ALL contexts for the active page
    if (this.isConnectedViaCDP) {
      const allPages = this.browser.contexts().flatMap(c => c.pages())
      const activePage = allPages.find(p => {
        const u = p.url()
        return u && u !== '' && u !== 'about:blank' && !u.startsWith('chrome://')
      })
      if (activePage) {
        this.page = activePage
        this.context = activePage.context()
      }
    }

    // Get current URL
    const url = this.page.url()

    if (!url || url === 'about:blank' || url.startsWith('chrome://')) {
      throw new Error('No page to capture. Navigate to a website in Chrome first.')
    }

    let screenshot

    if (this.isConnectedViaCDP) {
      // fullPage doesn't work on CDP-connected pages.
      // Use CDP protocol directly on the real page the user is viewing.
      try {
        const cdpSession = await this.context.newCDPSession(this.page)
        const metrics = await cdpSession.send('Page.getLayoutMetrics')
        // Chrome 90+ uses cssContentSize, older versions use contentSize
        const size = metrics.cssContentSize || metrics.contentSize
        if (!size || !size.width || !size.height) {
          throw new Error('Could not determine page dimensions')
        }
        const result = await cdpSession.send('Page.captureScreenshot', {
          format: 'png',
          captureBeyondViewport: true,
          clip: { x: 0, y: 0, width: size.width, height: size.height, scale: 1 }
        })
        screenshot = Buffer.from(result.data, 'base64')
        await cdpSession.detach()
      } catch (cdpError) {
        console.log('⚠️  Full-page CDP capture failed, capturing viewport only:', cdpError.message)
        screenshot = await this.page.screenshot({ type: 'png' })
      }
    } else {
      screenshot = await this.page.screenshot({ fullPage: true, type: 'png' })
    }

    // Get HTML content
    const html = await this.page.content()

    return {
      url,
      html,
      screenshot, // Buffer
      timestamp: Date.now()
    }
  }

  async close() {
    if (this.isConnectedViaCDP) {
      // Don't close browser when connected via CDP
      // Just disconnect our connection
      console.log('✓ Disconnecting from Chrome (browser will stay open)')
      if (this.browser) {
        await this.browser.close()
      }
    } else {
      // Close the browser we launched
      if (this.browser) {
        await this.browser.close()
      }
    }
  }
}
