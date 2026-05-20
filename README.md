# nmap-dracula

Dracula-themed true-color output for nmap. Works with **fish** and **zsh**.

![Dracula palette](https://draculatheme.com/static/img/hero/dracula.png)

## Colors

| Element | Color |
|---|---|
| `open` | green `#50fa7b` |
| `closed` | red `#ff5555` |
| `filtered` | orange `#ffb86c` |
| port number | purple `#bd93f9` |
| service / script output | cyan `#8be9fd` |
| scan report / headers | pink `#ff79c6` |
| start / done lines | yellow `#f1fa8c` |
| misc (MAC, not shown) | grey `#6272a4` |

## Install

```bash
git clone https://github.com/youruser/nmap-dracula.git ~/nmap-dracula
cd ~/nmap-dracula
chmod +x install.sh nmap-color
./install.sh
```

The installer symlinks everything so a `git pull` automatically applies updates.

## Usage

```bash
# Colorized automatically via shell function
nmap -sV 192.168.1.1

# Sudo scans — pipe manually
sudo nmap -sV 192.168.1.0/24 | nmap-color

# Pipe saved output
cat scan.txt | nmap-color
```

## Uninstall

```bash
./uninstall.sh
```

## Requirements

- Python 3 (stdlib only)
- A terminal with true-color (24-bit) support
