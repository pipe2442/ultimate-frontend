import readline from "readline";

export function waitForEnter(message = "Press Enter to capture...") {
  return new Promise((resolve) => {
    const rl = readline.createInterface({
      input: process.stdin,
      output: process.stdout,
    });
    rl.question(`\n${message}\n`, () => {
      rl.close();
      resolve();
    });
  });
}
