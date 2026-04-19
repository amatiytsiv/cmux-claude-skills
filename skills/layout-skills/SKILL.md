---
name: layout-skills
description: Set up a layout for Claude skill / plugin development. Claude on the left (70%) + file explorer on the right (30%).
argument-hint: "[skills-directory]  default: ~/.claude"
---

Configure the current cmux workspace as a Claude-skill development layout.

```
+-------------------+----------+
| Claude (70%)      | ls / grep|
|  skill design     | files    |
+-------------------+----------+
```

Argument: {{ARGUMENTS}}

## Run

```
cmux-skills {{ARGUMENTS}}
```

If no argument is given, the file-explorer pane opens at `~/.claude`.

## Conditions

- Must be run inside a cmux workspace terminal.
- Only runs when there is exactly 1 pane.
