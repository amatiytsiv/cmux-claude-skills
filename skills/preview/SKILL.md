---
name: preview
description: Open a markdown file in cmux's side panel as a live preview. Auto-refreshes when the file changes.
argument-hint: "<file.md>"
---

Open a markdown file in cmux's built-in viewer. Lets you watch a doc update in real time while Claude edits it.

Argument: {{ARGUMENTS}}

## Run order

1. If a file path is given, open it directly:
   ```
   cmux-preview {{ARGUMENTS}}
   ```

2. If no argument is given:
   - Find the most recently modified `.md` file in the current directory and show it
   - Confirm with the user which file to open before running

3. After opening, report: "preview opened: `<filename>`".

## Notes

- The cmux markdown viewer auto-refreshes when the file changes.
- Paths are converted to absolute, so it works from any directory.
