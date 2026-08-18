---
name: explain-diff-html
description: Explain a code change, diff, branch, or pull request as a rich interactive HTML document. Use when the user asks for a detailed visual explanation of code changes.
disable-model-invocation: true
---

# Explain Diff

Make a rich, interactive explanation of the specified code change.

## Content

Include these sections:

- **Background:** Explain the existing system relevant to the change. Explore surrounding code broadly. Include deep background for beginners (clearly marked as skippable for experienced readers), followed by narrower background directly relevant to the change.
- **Intuition:** Explain the core idea, not every detail. Use concrete examples with toy data. Use figures and diagrams liberally.
- **Code:** Walk through changes at a high level. Group and order changes for understanding.
- **Quiz:** Create five medium-difficulty interactive multiple-choice questions. On selection, show whether the answer is correct and explain why.

## Output

- Output one self-contained HTML file with inline CSS and JavaScript.
- Make it one long page with section headers and a table of contents. Do not use tabs for top-level structure.
- Use responsive styling suitable for phones.
- Write the file outside the code repository in a global location. Filename must start with today's date in `YYYY-MM-DD-` format so files remain time-sorted and out of version control. Example: `/tmp/2026-01-12-explanation-<slug>.html`.
- Write with the clarity and flow of Martin Kleppmann, making it engaging and written in classic style. Keep transitions smooth.
- Use a small number of reusable diagram families. Useful families include a simplified UI, and a system/data-flow diagram with example data.
- Never use ASCII diagrams. Use simple HTML for diagrams and HTML lists for lists.
- Use `<pre>` for code blocks. If a custom styled element is used instead, its CSS must include `white-space: pre-wrap`.
- Before saving, scan every code block in the HTML source and confirm its CSS includes `white-space: pre` or `pre-wrap`.
- Use callouts for key concepts, definitions, and important edge cases.
