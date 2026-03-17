import { BrowserManager } from "../lib/browser-manager.js";
import { waitForEnter } from "../lib/terminal-input.js";
import {
  writeOutputFile,
  generateTimestampedName,
} from "../lib/file-writer.js";

export async function inspectCommand(options) {
  const { url } = options;
  const browserManager = new BrowserManager();

  try {
    console.log("🌐 Launching browser...\n");

    // Launch browser
    await browserManager.launch(url);

    if (!url || url === "about:blank") {
      console.log("✓ Browser opened (blank page)");
      console.log("  Navigate to any website you want to capture");
    } else {
      console.log(`✓ Browser opened: ${url}`);
    }

    // Main capture loop
    let captureCount = 0;
    let shouldContinue = true;

    while (shouldContinue) {
      await waitForEnter("\n📸 Press Enter to capture (or Ctrl+C to quit)...");

      console.log("⏳ Capturing...");

      // Capture screenshot and HTML
      const {
        url: currentUrl,
        html,
        screenshot,
      } = await browserManager.capture();

      // Generate filenames with timestamp
      const htmlFilename = generateTimestampedName("page", "html");
      const screenshotFilename = generateTimestampedName("screenshot", "png");

      // Save files
      const htmlPath = await writeOutputFile(htmlFilename, html);
      const screenshotPath = await writeOutputFile(
        screenshotFilename,
        screenshot,
      );

      captureCount++;

      console.log(`\n✓ Capture #${captureCount} saved:`);
      console.log(`  📄 HTML: ${htmlPath}`);
      console.log(`  📷 Screenshot: ${screenshotPath}`);
      console.log(`  🔗 URL: ${currentUrl}`);

      // Ask if user wants to capture again
      console.log(
        "\n  → Browser is still open. Make changes and press Enter again.",
      );
      console.log("  → Or press Ctrl+C to quit and close browser.");
    }
  } catch (error) {
    if (
      error.message.includes("Target closed") ||
      error.message.includes("Browser closed")
    ) {
      console.log("\n✓ Browser closed by user");
    } else {
      console.error("\n✗ Error:", error.message);
    }
  } finally {
    // Cleanup on exit
    await browserManager.close();
    console.log("\n👋 Browser closed. Goodbye!");
  }
}
