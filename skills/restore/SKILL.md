---
name: restore
description: Restore a snapshot saved by cmux-snapshot. Rebuilds workspace layouts and reattaches Claude sessions.
argument-hint: "[snapshot-name-or-path]  default: latest snapshot"
---

Restore the cmux layout and Claude sessions from a saved snapshot.

Argument: {{ARGUMENTS}}

## Run

```
cmux-restore {{ARGUMENTS}}
```

## Restore order

1. Load the snapshot file (default: `~/.cmux-snapshots/latest.json`)
2. Create each workspace with `cmux new-workspace`
3. Recreate the pane tree recursively with `cmux new-split`
4. Send `cd <dir>` to each surface
5. For Claude surfaces:
   - With a session ID: `claude --resume <id>` to restore the exact session
   - Without one: `claude -c` to resume the most recent session

## Timing

If your machine is slow or restoration fails partway, increase the delay between cmux commands:

```bash
CMUX_RESTORE_DELAY=1.0 cmux-restore
```

## Notes

- cmux.app must be running.
- Session ID matching is best-effort. If the Claude session index (`~/.claude/projects/`) isn't available, `claude -c` is used as a fallback.
