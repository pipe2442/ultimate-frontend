import { Command } from "commander";
import { inspectCommand } from "./commands/inspect.js";
import { screenshotCommand } from "./commands/screenshot.js";
import { cloneCommand } from "./commands/clone.js";

export async function run() {
  const program = new Command();
  program
    .name("ultimate-frontend")
    .description("Inspect a browser UI and help recreate it locally")
    .version("0.1.0");
  program
    .command("inspect")
    .description("Inspect the current page")
    .option("-u, --url <url>", "URL to open in browser (default: blank page)")
    .action(inspectCommand);
  program
    .command("screenshot")
    .description("Take a screenshot of the current page")
    .action(screenshotCommand);
  program
    .command("clone")
    .description("Generate a clone plan from the current UI")
    .action(cloneCommand);
  await program.parseAsync(process.argv);
}
