# nmap-color

A Python script that adds Dracula-themed colour coding to nmap output. Works as a wrapper (run nmap directly) or as a pipe filter.

---

## Colours

| Colour | Meaning |
|--------|---------|
| Green | Open port / host up |
| Red | Closed port / host down |
| Yellow | Filtered port |
| Orange | Open\|filtered / warnings |
| Cyan | Port numbers / headers |
| Purple | Service names / OS detection |
| Pink | Scan report / host lines |
| Gray | Meta info / timing / scripts |

---

## Installation

**1. Download the script**

```bash
curl -sL https://raw.githubusercontent.com/Galatron01/nmap-color/main/nmap-color -o ~/.local/bin/nmap-color
chmod +x ~/.local/bin/nmap-color
```

**2. Make sure `~/.local/bin` is in your PATH**

```bash
# bash/zsh
echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.bashrc

# fish
fish_add_path ~/.local/bin
```

---

## Usage

### As a wrapper (recommended)

Replaces the `nmap` command — just use it like nmap:

```bash
nmap-color -v -Pn -p- -sS -sU --min-rate=1000 10.10.10.1
nmap-color -sV -p 80,443 example.com
nmap-color --script=vuln 10.10.10.1
```

Scans requiring root (`-sS`, `-sU`, `-O` etc.) are automatically escalated via `sudo`.

### As a pipe filter

Pipe existing nmap output through it:

```bash
nmap -sV 10.10.10.1 | nmap-color
```

---

## Shell integration

### Fish shell — override the `nmap` command

Create `~/.config/fish/functions/nmap.fish`:

```fish
function nmap --description 'nmap with Dracula colour-coded output'
    if test -t 1
        python3 ~/.local/bin/nmap-color $argv
    else
        command nmap $argv
    end
end
```

Now just type `nmap` as normal — colour output is automatic.

### Bash/Zsh — alias

Add to your `~/.bashrc` or `~/.zshrc`:

```bash
alias nmap='nmap-color'
```

---

## How it works

The script uses Python's `re` module to match nmap output line patterns and wrap each line in ANSI escape codes using the Dracula colour palette.

**Two modes:**

- **Wrapper mode** — detects if stdin is a terminal, runs `nmap` as a subprocess with your args, streams and colourises output line by line
- **Filter mode** — if stdin is a pipe, reads and colourises each line as it arrives

**Auto sudo escalation** — if your scan flags require root (`-sS`, `-sU`, `-O`, etc.) and you're not already root, the script prepends `sudo` automatically.

---

## Colour reference (Dracula palette)

```
#50fa7b  Green  — open / host up
#ff5555  Red    — closed / host down
#f1fa8c  Yellow — filtered
#ffb86c  Orange — open|filtered / warnings
#8be9fd  Cyan   — port numbers / column headers
#bd93f9  Purple — service names / OS details
#ff79c6  Pink   — scan report / host lines
#6272a4  Gray   — meta / timing / script output
#f8f8f2  White  — default text
```
