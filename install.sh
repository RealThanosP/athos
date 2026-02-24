#!/usr/bin/env bash

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
INSTALL_DIR="${INSTALL_DIR:-$HOME/.local/bin}"
CONFIG_DIR="$HOME/.local/share/athos"

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

log_info() { echo -e "${GREEN}[INFO]${NC} $1"; }
log_warn() { echo -e "${YELLOW}[WARN]${NC} $1"; }
log_error() { echo -e "${RED}[ERROR]${NC} $1"; }

check_deps() {
	local missing=()

	for cmd in gum fzf; do
		if ! command -v "$cmd" &>/dev/null; then
			missing+=("$cmd")
		fi
	done

	if ((${#missing[@]} > 0)); then
		log_warn "Missing dependencies: ${missing[*]}"
		echo
		echo "Install with:"
		echo "  Arch:    sudo pacman -S ${missing[*]}"
		echo "  Ubuntu:  brew install ${missing[*]}"
		echo
		read -p "Continue anyway? [y/N] " -n 1 -r
		echo
		if [[ ! $REPLY =~ ^[Yy]$ ]]; then
			exit 1
		fi
	fi

	if ! command -v yay &>/dev/null; then
		log_warn "yay not found - AUR packages will not work"
		echo "Install with: sudo pacman -S yay"
		echo
	fi
}

install_files() {
	log_info "Installing athos to $INSTALL_DIR..."

	mkdir -p "$INSTALL_DIR"
	mkdir -p "$CONFIG_DIR"

	cp "$SCRIPT_DIR/athos" "$INSTALL_DIR/athos"
	chmod +x "$INSTALL_DIR/athos"

	if [[ -f "$SCRIPT_DIR/logo.txt" ]]; then
		cp "$SCRIPT_DIR/logo.txt" "$CONFIG_DIR/logo.txt"
		cp "$SCRIPT_DIR/logo.txt" "$INSTALL_DIR/logo.txt"
	fi

	if [[ ! -e "$INSTALL_DIR/athos-tui" ]]; then
		ln -sf "$INSTALL_DIR/athos" "$INSTALL_DIR/athos-tui"
	fi

	if command -v update-desktop-database &>/dev/null; then
		update-desktop-database "$HOME/.local/share/applications" 2>/dev/null || true
	fi

	log_info "Creating desktop entry..."

	mkdir -p "$HOME/.local/share/applications"
	mkdir -p "$HOME/.local/share/icons/hicolor/256x256/apps"
	cp "$SCRIPT_DIR/icon.png" "$HOME/.local/share/icons/hicolor/256x256/apps/athos.png"

	if command -v gtk-update-icon-cache &>/dev/null; then
		gtk-update-icon-cache -f -t "$HOME/.local/share/icons/hicolor" 2>/dev/null || true
	fi

	cat >"$HOME/.local/share/applications/athos.desktop" <<EOF
[Desktop Entry]
Version=1.0
Name=athos
Comment=Package and Web App Installer
Exec=$INSTALL_DIR/athos
Icon=athos
Terminal=true
Type=Application
Categories=System;PackageManager;
Keywords=install;package;aur;webapp;
EOF

	log_info "Adding to PATH..."

	if [[ -f "$HOME/.bashrc" ]] && ! grep -q "\.local/bin" "$HOME/.bashrc" 2>/dev/null; then
		echo "" >>"$HOME/.bashrc"
		echo "# athos" >>"$HOME/.bashrc"
		echo 'export PATH="$HOME/.local/bin:$PATH"' >>"$HOME/.bashrc"
		log_info "Added PATH to ~/.bashrc"
	fi

	if [[ -f "$HOME/.zshrc" ]] && ! grep -q "\.local/bin" "$HOME/.zshrc" 2>/dev/null; then
		echo "" >>"$HOME/.zshrc"
		echo "# athos" >>"$HOME/.zshrc"
		echo 'export PATH="$HOME/.local/bin:$PATH"' >>"$HOME/.zshrc"
		log_info "Added PATH to ~/.zshrc"
	fi

	mkdir -p "$HOME/.config/fish"
	if [[ ! -f "$HOME/.config/fish/config.fish" ]]; then
		touch "$HOME/.config/fish/config.fish"
	fi
	if ! grep -q "\.local/bin" "$HOME/.config/fish/config.fish" 2>/dev/null; then
		echo "" >>"$HOME/.config/fish/config.fish"
		echo "# athos" >>"$HOME/.config/fish/config.fish"
		echo 'fish_add_path -g $HOME/.local/bin' >>"$HOME/.config/fish/config.fish"
		log_info "Added PATH to Fish config"
	fi

	log_info "Installation complete!"
}

main() {
	echo "athos Installer"
	echo "=================="
	echo

	check_deps
	install_files

	echo
	echo "Run with: athos"
	echo "Or find 'athos' in your app launcher"
	echo
	echo "NOTE: Please restart your terminal or run:"
	echo "  source ~/.bashrc  # or ~/.zshrc or source config.fish"
}

main "$@"
