# athos

A Text User Interface (TUI) for installing packages and creating web application launchers on Arch Linux.

Based on the omarchy menu for installing webapps and packages.

## Features

- Install official Arch packages via `pacman`
- Install AUR packages via `yay`
- Create desktop launchers for web applications
- Interactive menus powered by `gum` and `fzf`

## Installation

```bash
./install.sh
```

This installs athos to `$HOME/.local/bin/athos` and creates a desktop entry.

## Usage

```bash
athos
```

Or launch from your desktop environment.

## Dependencies

- `gum` - Interactive prompts
- `fzf` - Fuzzy finder
- `yay` - For AUR packages (optional)

Install on Arch: `sudo pacman -S gum fzf yay`
