import fs from 'fs/promises'
import path from 'path'

export async function writeOutputFile(filename, content) {
  const outputDir = path.resolve(process.cwd(), 'output')
  await fs.mkdir(outputDir, { recursive: true })

  const filePath = path.join(outputDir, filename)
  await fs.writeFile(filePath, content, 'utf8')

  return filePath
}
