---
name: snapshot
description: Save the current cmux layout and Claude session IDs as a JSON snapshot. Used to restore your workspace after a cmux restart.
argument-hint: "[snapshot-name]  default: latest"
---

Save the current cmux layout tree and the Claude session ID attached to each surface.

Argument: {{ARGUMENTS}}

## Run

```
cmux-snapshot {{ARGUMENTS}}
```

If no argument is given, the snapshot is written to `~/.cmux-snapshots/latest.json` (overwritten on every run).

## What gets saved

- The pane tree per workspace (split direction and ratio included)
- Each surface's title, working directory, and whether it hosts a Claude session
- For Claude surfaces, the session ID is matched from `~/.claude/projects/` (CWD-based match first, full search as fallback)

## After running

Reports the number of workspaces saved and a summary of Claude session matches.

## Automation

Register on Claude Code's Stop hook to snapshot automatically at the end of every session:

```json
"hooks": {
  "Stop": [{
    "hooks": [{
      "type": "command",
      "command": "cmux-snapshot latest 2>/dev/null || true"
    }]
  }]
}
```
