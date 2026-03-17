import fs from "fs/promises";
import path from "path";

export async function writeOutputFile(filename, content, encoding = "utf8") {
  const outputDir = path.resolve(process.cwd(), "output");
  await fs.mkdir(outputDir, { recursive: true });
  const filePath = path.join(outputDir, filename);

  // If content is a Buffer (binary), write without encoding
  if (Buffer.isBuffer(content)) {
    await fs.writeFile(filePath, content);
  } else {
    await fs.writeFile(filePath, content, encoding);
  }
  return filePath;
}
export function generateTimestampedName(base, extension) {
  const timestamp = new Date().toISOString().replace(/[:.]/g, "-");
  return `${base}-${timestamp}.${extension}`;
}
