import { chromium } from 'playwright'
export class BrowserManager {
  constructor() {
    this.browser = null
    this.page = null
  }
  async launch(url = 'about:blank') {
    // Launch browser in headed mode (visible window)
    this.browser = await chromium.launch({ 
      headless: false,
      // Slow down operations so you can see what's happening
      slowMo: 100
    })
    
    // Create a new page
    this.page = await this.browser.newPage()
    
    // Navigate to URL if provided
    if (url && url !== 'about:blank') {
      await this.page.goto(url)
    }
    
    return this.page
  }
  async capture() {
    if (!this.page) {
      throw new Error('Browser not launched. Call launch() first.')
    }
    // Get current URL
    const url = this.page.url()
    
    // Capture screenshot as buffer
    const screenshot = await this.page.screenshot({ 
      fullPage: true,
      type: 'png'
    })
    
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
    if (this.browser) {
      await this.browser.close()
    }
  }
}
