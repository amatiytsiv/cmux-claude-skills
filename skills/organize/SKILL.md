---
name: organize
description: Classify a cmux workspace's surfaces (tabs) by context using the AI and rearrange them into panes. No hardcoded keywords — Claude reads each tab title and decides where it belongs.
argument-hint: "[workspace-ref]  e.g. workspace:1"
---

Walks the tabs in a cmux workspace and lets Claude classify each one based on context, then rearranges them.

Argument: {{ARGUMENTS}}

## Run order

### Step 1: identify the workspace

If no argument is given, check `$CMUX_WORKSPACE_ID` first.
If neither is available, ask the user for a workspace reference.

```bash
WORKSPACE={{ARGUMENTS}}  # or $CMUX_WORKSPACE_ID
```

### Step 2: explore the current structure

```bash
# Check pane count
cmux list-panes --workspace $WORKSPACE

# Already 2+ panes → "already organized", exit
# Exactly 1 pane → continue

# Collect surfaces (tabs)
FIRST_PANE=$(cmux list-panes --workspace $WORKSPACE | grep -oE "pane:[0-9]+" | head -1)
cmux list-pane-surfaces --workspace $WORKSPACE --pane $FIRST_PANE
```

Build a list of surface IDs and titles.

### Step 3: AI classification (Claude judges directly)

Read each tab's title and place it into one of these groups:

| Group | Criteria |
|-------|----------|
| **research** | Information gathering, learning, references, document exploration |
| **tools** | Dev tools, skills, plugins, configuration |
| **work** | Active code, tasks, project work (stays in the main pane) |

> Decide by **context**, not by keywords.
> Example: "Claude API docs" → research; "claude skill work in progress" → work.

Show the classification result as a table and ask the user to confirm:

```
surface:1  [work]     "my-app build debugging"
surface:2  [research] "SwiftUI layout reference"
surface:3  [tools]    "cmux skill development"
surface:4  [work]     "PR review"
```

Confirm before proceeding. Adjust if the user requests changes.

### Step 4: rearrange

Once confirmed, call `cmux-reorganize`:

```bash
cmux-reorganize \
  --research "surface:2" \
  --tools "surface:3" \
  $WORKSPACE
```

### Step 5: report

- Summarize the new pane count and which surfaces went where.
- Run `cmux tree --workspace $WORKSPACE` to show the final layout.

## Notes

- If `cmux-reorganize` is not on PATH, run `install.sh` first.
- Always show the classification to the user and confirm before executing the rearrange.
- If a surface title is empty or unrecognizable, classify it as `work`.
