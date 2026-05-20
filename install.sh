#!/usr/bin/env bash
set -e

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BIN_DIR="$HOME/.local/bin"
FISH_FUNCTIONS="$HOME/.config/fish/functions"
ZSHRC="$HOME/.zshrc"
ZSH_SOURCE_LINE="source \"$REPO_DIR/shell/nmap.zsh\""

mkdir -p "$BIN_DIR"

# Install the colorizer binary
ln -sf "$REPO_DIR/nmap-color" "$BIN_DIR/nmap-color"
chmod +x "$REPO_DIR/nmap-color"
echo "[+] Linked nmap-color -> $BIN_DIR/nmap-color"

# Fish
if command -v fish &>/dev/null; then
    mkdir -p "$FISH_FUNCTIONS"
    ln -sf "$REPO_DIR/shell/nmap.fish" "$FISH_FUNCTIONS/nmap.fish"
    echo "[+] Linked nmap.fish -> $FISH_FUNCTIONS/nmap.fish"
fi

# Zsh
if command -v zsh &>/dev/null && [ -f "$ZSHRC" ]; then
    if ! grep -qF "$ZSH_SOURCE_LINE" "$ZSHRC"; then
        echo "" >> "$ZSHRC"
        echo "# nmap-dracula: Dracula-themed nmap colorizer" >> "$ZSHRC"
        echo "$ZSH_SOURCE_LINE" >> "$ZSHRC"
        echo "[+] Added source line to $ZSHRC"
    else
        echo "[=] Zsh already configured, skipping"
    fi
fi

echo ""
echo "Done. Reload your shell or run:"
echo "  fish:  source ~/.config/fish/functions/nmap.fish"
echo "  zsh:   source ~/.zshrc"
