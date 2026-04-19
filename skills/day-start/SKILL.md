---
name: day-start
description: Bulk-create a predefined set of cmux workspaces at the start of a day. Workspaces that already exist are skipped.
argument-hint: ""
---

Run `cmux-day-start` to spin up your day's working environment in one shot.

## Run

```
cmux-day-start
```

## Setup

Copy `bin/cmux-day-start.example` to `~/.local/bin/cmux-day-start` and edit the workspace list to match your projects:

```bash
cp /path/to/cmux-claude-skills/bin/cmux-day-start.example ~/.local/bin/cmux-day-start
chmod +x ~/.local/bin/cmux-day-start
# Open the file and edit PROJECTS_ROOT and the create_ws calls
```

## Built-in layout commands

| Command | Description |
|---------|-------------|
| `cmux-skills` | Claude + file explorer |
| `cmux-web [dir] [cmd]` | Claude + dev server |

## After running

Reports the workspaces created and any that were skipped.
