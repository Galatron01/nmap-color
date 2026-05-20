#!/usr/bin/env bash
set -e

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BIN_DIR="$HOME/.local/bin"
FISH_FUNCTIONS="$HOME/.config/fish/functions"
ZSHRC="$HOME/.zshrc"

rm -f "$BIN_DIR/nmap-color"
echo "[-] Removed $BIN_DIR/nmap-color"

rm -f "$FISH_FUNCTIONS/nmap.fish"
echo "[-] Removed $FISH_FUNCTIONS/nmap.fish"

if [ -f "$ZSHRC" ]; then
    # Remove the two lines added by install.sh
    sed -i "\|# nmap-dracula: Dracula-themed nmap colorizer|d" "$ZSHRC"
    sed -i "\|source \"$REPO_DIR/shell/nmap.zsh\"|d" "$ZSHRC"
    echo "[-] Removed zsh config from $ZSHRC"
fi

echo ""
echo "Uninstalled. Reload your shell to take effect."
