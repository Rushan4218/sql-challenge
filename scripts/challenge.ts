import { readdir, readFile } from "node:fs/promises";
import path from "node:path";

const [command, challengeId] = process.argv.slice(2);

if (command !== "submit") {
  console.error("Usage: pnpm challenge submit <challengeId>");
  process.exit(1);
}

if (!challengeId) {
  console.error("Please provide a challenge ID.");
  console.error("Example: pnpm challenge submit 001");
  process.exit(1);
}

const challengesDir = path.join(process.cwd() + "/challenges");
const entries = await readdir(challengesDir);
const challengeDir = entries.find((entry) =>
  entry.startsWith(`${challengeId}-`),
);

if (!challengeDir) {
  console.error(`Challenge ${challengeId} not found.`);
  process.exit(1);
}

const solutionPath = path.join(challengesDir, challengeDir, "solution.sql");

try {
  const sql = await readFile(solutionPath, "utf8");
  console.log(`Submitting challenge ${challengeId}`);
  console.log(`Solution: ${solutionPath}\n`);
  console.log(sql);
} catch {
  console.error(`No solution.sql found for challenge ${challengeId}`);
  process.exit(1);
}
