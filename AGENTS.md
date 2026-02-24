# GEMINI.md for athos Installer

## Project Overview

This project, "athos Installer," is a collection of Bash scripts designed to provide a Text User Interface (TUI) for installing packages and creating web application launchers, primarily targeting Arch Linux-based systems. The core application, `athos`, utilizes `gum` and `fzf` to offer interactive menus for selecting and installing official Arch packages via `pacman`, Arch User Repository (AUR) packages via `yay`, and generating `.desktop` entries for web applications. The project aims to streamline the setup process for common software and web applications, presenting a user-friendly command-line interface.

## Building and Running

### Installation

To install the `athos` application and its necessary components, execute the `install.sh` script:

```bash
./install.sh
```

This script will install `athos` to `$HOME/.local/bin/athos`, create a symlink `$HOME/.local/bin/athos` pointing to it, copy `logo.txt` to `$HOME/.local/share/athos/logo.txt`, and create a desktop entry (`athos.desktop`) for easy launching from your desktop environment.

### Running the TUI

After successful installation, you can launch the athos TUI in one of two ways:

1.  **From the terminal:**
    ```bash
    athos
    ```
2.  **From your desktop's application launcher:** Search for "athos".

### Dependencies

The `install.sh` script checks for the following dependencies and provides installation guidance:

*   **`gum`**: A tool for glamorous shell scripts, used for interactive prompts and menus.
*   **`fzf`**: A general-purpose command-line fuzzy finder, used for interactive searching and selection of packages.
*   **`yay` (optional)**: An AUR helper, required for installing packages from the Arch User Repository. If `yay` is not found, AUR package installation functionality will be unavailable.

## Development Conventions

*   **Scripting Language**: The project is primarily developed using Bash scripting.
*   **Interactive User Interface**: The application heavily relies on external tools `gum` and `fzf` to create an interactive Text User Interface (TUI), providing a more engaging user experience than standard shell prompts.
*   **Package Management Integration**: Directly integrates with Arch Linux's `pacman` and the `yay` AUR helper for robust package management capabilities.
*   **Desktop Integration**: Features the creation of `.desktop` files, allowing the TUI and user-created web application launchers to be easily accessible from desktop environments.
*   **Modularity**: While the main `athos` script incorporates most of the core logic (like showing the logo, displaying completion messages, and handling package/webapp installations), there are also separate standalone scripts (e.g., `athos-pkg-install`, `athos-show-logo`, `athos-show-done`). These individual scripts might represent earlier modular components, provide alternative direct invocation points, or serve as internal helpers, though `athos` itself implements similar functionalities directly.
