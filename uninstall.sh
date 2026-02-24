#!/usr/bin/env bash

set -e

INSTALL_DIR="${INSTALL_DIR:-$HOME/.local/bin}"
CONFIG_DIR="$HOME/.local/share/athos"
WEBAPP_DIR="$HOME/.local/share/webapps"

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

log_info() { echo -e "${GREEN}[INFO]${NC} $1"; }
log_warn() { echo -e "${YELLOW}[WARN]${NC} $1"; }
log_error() { echo -e "${RED}[ERROR]${NC} $1"; }

uninstall_files() {
	log_info "Removing athos files..."

	rm -f "$INSTALL_DIR/athos"
	rm -f "$INSTALL_DIR/athos-tui"
	rm -f "$INSTALL_DIR/athos-launch-webapp"
	rm -f "$INSTALL_DIR/logo.txt"
	rmdir "$INSTALL_DIR" 2>/dev/null || true

	rm -rf "$CONFIG_DIR"

	rm -f "$HOME/.local/share/applications/athos.desktop"
	rm -f "$HOME/.local/share/icons/hicolor/256x256/apps/athos.png"

	rm -rf "$WEBAPP_DIR"

	if command -v update-desktop-database &>/dev/null; then
		update-desktop-database "$HOME/.local/share/applications" 2>/dev/null || true
	fi

	if command -v gtk-update-icon-cache &>/dev/null; then
		gtk-update-icon-cache -f -t "$HOME/.local/share/icons/hicolor" 2>/dev/null || true
	fi

	log_info "Removing PATH entries from shell configs..."

	if [[ -f "$HOME/.bashrc" ]]; then
		sed -i '/# athos/,/export PATH="\$HOME\/.local\/bin:\$PATH"/d' "$HOME/.bashrc" 2>/dev/null || true
	fi

	if [[ -f "$HOME/.zshrc" ]]; then
		sed -i '/# athos/,/export PATH="\$HOME\/.local\/bin:\$PATH"/d' "$HOME/.zshrc" 2>/dev/null || true
	fi

	if [[ -f "$HOME/.config/fish/config.fish" ]]; then
		sed -i '/# athos/,/fish_add_path -g \$HOME\/.local\/bin/d' "$HOME/.config/fish/config.fish" 2>/dev/null || true
	fi

	log_info "Uninstallation complete!"
}

main() {
	echo "athos Uninstaller"
	echo "=================="
	echo
	echo "This will remove:"
	echo "  - athos binaries and scripts"
	echo "  - Desktop entry and icon"
	echo "  - Web apps created by athos"
	echo "  - Shell configuration entries"
	echo

	if [[ $1 == "--system" ]] || [[ $1 == "-s" ]]; then
		log_info "Removing system-wide installation..."
		sudo rm -f /usr/bin/athos
		sudo rm -f /usr/bin/athos-pkg-install
		sudo rm -f /usr/bin/athos-pkg-remove
		sudo rm -f /usr/bin/athos-pkg-aur-install
		sudo rm -f /usr/bin/athos-pkg-aur-remove
		sudo rm -f /usr/bin/athos-webapp-install
		sudo rm -f /usr/bin/athos-webapp-remove
		sudo rm -f /usr/bin/athos-launch-webapp
		sudo rm -f /usr/bin/athos-utils.sh
		sudo rm -f /usr/share/athos/logo.txt
		sudo rm -f /usr/share/icons/hicolor/256x256/apps/athos.png
		sudo rm -f /usr/share/applications/athos.desktop
		sudo rmdir /usr/share/athos 2>/dev/null || true
		log_info "System-wide files removed"
		echo
	elif [[ $EUID -ne 0 ]]; then
		read -p "Continue? [y/N] " -n 1 -r
		echo
		if [[ ! $REPLY =~ ^[Yy]$ ]]; then
			exit 1
		fi
	fi

	uninstall_files
}

main "$@"
