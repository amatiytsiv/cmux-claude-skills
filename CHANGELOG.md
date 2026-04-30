# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Added

- Self-healing session mapping (live PID + persistent hook log + stale-aware restore)
- `cmux-snapshot`: live `ps`-based panel↔session capture (`--session-id` + `CMUX_SURFACE_ID`)
  and persistent `session-map.jsonl` lookup before falling back to fuzzy matching
- `cmux-snapshot-track`: Claude `SessionStart` hook script that appends panel↔session records
  to `~/.cmux-snapshots/session-map.jsonl`
- `cmux-claude-resume-all`: bulk `claude --resume <sid>` sender for every restored panel
  (supports `--dry-run`)
- Snapshot surfaces now carry `full_path` and `first_prompt` fields used by the new
  restore decision tree (backward compatible — older snapshots remain readable)

### Changed

- `cmux-restore`: stale-aware decision tree
  (ID match → legacy ID → first_prompt re-resolve → `claude -c` fallback)

## [0.1.0] - 2025-04-19

### Added

- `cmux-organize`: Keyword-based surface classifier (standalone fallback)
- `cmux-reorganize`: Mechanical pane reorganizer — accepts explicit surface group assignments
- `/cmux-kit:organize` skill: AI-powered two-stage pipeline (explore → Claude classifies → reorganize)
- `cmux-snapshot`: Save cmux layout + Claude session IDs as JSON snapshot
- `cmux-restore`: Restore layout + Claude sessions from snapshot (`CMUX_RESTORE_DELAY` env var)
- `cmux-preview`: Live Markdown side-panel preview
- `cmux-skills`: Claude skill dev + file navigation layout
- `cmux-web`: Claude + dev server layout
- `cmux-day-start.example`: Day-start workspace template
- Claude Code plugin manifest (`cmux-kit`)
- `install.sh` / `uninstall.sh`
- `README.md` (English) + `README.ko.md` (Korean)
