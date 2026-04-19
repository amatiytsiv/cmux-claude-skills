---
name: layout-web
description: Set up a layout for web / frontend development. Claude on the left (70%) + dev-server logs on the right (30%, auto-started).
argument-hint: "[project-directory] [dev-command]"
---

Configure the current cmux workspace as a frontend-development layout.

```
+-------------------+----------+
| Claude (70%)      | dev      |
|                   | server   |
+-------------------+----------+
```

Argument: {{ARGUMENTS}}

## Run

```
cmux-web {{ARGUMENTS}}
```

Argument examples:
- `cmux-web` → current directory, runs `npm run dev`
- `cmux-web ~/myproject` → uses `~/myproject` as cwd, runs `npm run dev`
- `cmux-web ~/myproject "yarn dev"` → custom dev command

## Conditions

- Must be run inside a cmux workspace terminal.
- Only runs when there is exactly 1 pane.
