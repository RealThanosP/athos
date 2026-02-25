#!/usr/bin/env bash

# Common utility functions for athos scripts

LOGO_FILE="/usr/share/athos/logo.txt"

# Function to display the athos logo
show_logo() {
    clear
    echo -e "\033[32m"
    if [[ -f "$LOGO_FILE" ]]; then
        cat "$LOGO_FILE"
    else
        echo "athos"
    fi
    echo -e "\033[0m"
    echo
}

# Function to show a "Done" message
show_done() {
    echo
    gum spin --spinner "globe" --title "Done! Press any key to close..." -- bash -c 'read -n 1 -s'
}

# Function to check for dependencies
check_deps() {
    local deps=("$@")
    local missing=()

    for dep in "${deps[@]}"; do
        if ! command -v "$dep" &>/dev/null; then
            missing+=("$dep")
        fi
    done

    if (( ${#missing[@]} > 0 )); then
        echo "Missing dependencies: ${missing[*]}"
        echo "Install with: sudo pacman -S ${missing[*]}"
        exit 1
    fi
}
