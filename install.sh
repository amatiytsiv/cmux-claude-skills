#!/usr/bin/env zsh
# install.sh: install cmux-claude-skills binaries into ~/.local/bin
# Usage: ./install.sh

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
# Override the install path with the CMUX_BIN_DIR env var
BIN_DIR="${CMUX_BIN_DIR:-$HOME/.local/bin}"
BIN_SRC="$SCRIPT_DIR/bin"

echo "=== cmux-claude-skills install ==="

# Check that the cmux CLI exists
if ! command -v cmux &>/dev/null; then
  echo ""
  echo "⚠️  Warning: cmux CLI not found."
  echo "   Install cmux.app and make sure the cmux CLI is on your PATH."
  echo "   https://cmux.app"
  echo ""
fi

# Create ~/.local/bin if needed
if [[ ! -d "$BIN_DIR" ]]; then
  mkdir -p "$BIN_DIR"
  echo "→ created: $BIN_DIR"
fi

# PATH check
if [[ ":$PATH:" != *":$BIN_DIR:"* ]]; then
  echo ""
  echo "⚠️  '$BIN_DIR' is not on your PATH."
  echo "   Add this to ~/.zshrc or ~/.bashrc:"
  echo '   export PATH="$HOME/.local/bin:$PATH"'
  echo ""
fi

# Install symlinks
INSTALLED=0
SKIPPED=0

for src in "$BIN_SRC"/cmux-*; do
  name="$(basename "$src")"

  # Skip .example files (user customizes them manually)
  if [[ "$name" == *.example ]]; then
    echo "  skip (template): $name"
    SKIPPED=$((SKIPPED + 1))
    continue
  fi

  dest="$BIN_DIR/$name"
  chmod +x "$src"

  if [[ -L "$dest" ]]; then
    ln -sfn "$src" "$dest"
    echo "  update: $name → $dest"
  elif [[ -e "$dest" ]]; then
    echo "  skip (exists, not a symlink): $dest"
    SKIPPED=$((SKIPPED + 1))
    continue
  else
    ln -sfn "$src" "$dest"
    echo "  install: $name → $dest"
  fi
  INSTALLED=$((INSTALLED + 1))
done

echo ""
echo "✓ install complete: ${INSTALLED} installed, ${SKIPPED} skipped"
echo ""
echo "Next steps:"
echo "  1. Customize cmux-day-start:"
echo "     cp $BIN_SRC/cmux-day-start.example $BIN_DIR/cmux-day-start"
echo "     chmod +x $BIN_DIR/cmux-day-start"
echo "     \$EDITOR $BIN_DIR/cmux-day-start"
echo ""
echo "  2. Install as a Claude Code plugin (optional):"
echo "     /plugin marketplace add sanghun0724/cmux-claude-skills"
echo "     /plugin install cmux-kit"
