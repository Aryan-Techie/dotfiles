#!/bin/bash

# Aryan's Dotfiles Installation Script
# This script will set up your development environment with custom configurations

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Helper functions
print_status() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

print_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Check if running on supported system
check_system() {
    print_status "Checking system compatibility..."
    
    if [[ "$OSTYPE" == "linux-gnu"* ]]; then
        SYSTEM="linux"
        print_success "Linux system detected"
    elif [[ "$OSTYPE" == "darwin"* ]]; then
        SYSTEM="macos"
        print_success "macOS system detected"
    elif [[ "$OSTYPE" == "msys" || "$OSTYPE" == "cygwin" ]]; then
        SYSTEM="windows"
        print_success "Windows system detected"
    else
        print_error "Unsupported system: $OSTYPE"
        exit 1
    fi
}

# Backup existing files
backup_files() {
    print_status "Creating backups of existing configurations..."
    
    BACKUP_DIR="$HOME/.dotfiles_backup_$(date +%Y%m%d_%H%M%S)"
    mkdir -p "$BACKUP_DIR"
    
    files_to_backup=(
        ".zshrc"
        ".bashrc"
        ".gitconfig"
        ".gitignore_global"
    )
    
    for file in "${files_to_backup[@]}"; do
        if [[ -f "$HOME/$file" ]]; then
            cp "$HOME/$file" "$BACKUP_DIR/"
            print_success "Backed up $file"
        fi
    done
    
    # Backup VS Code settings
    if [[ -f "$HOME/.config/Code/User/settings.json" ]]; then
        mkdir -p "$BACKUP_DIR/.config/Code/User"
        cp "$HOME/.config/Code/User/settings.json" "$BACKUP_DIR/.config/Code/User/"
        print_success "Backed up VS Code settings"
    fi
    
    print_success "Backups created in $BACKUP_DIR"
}

# Create symlinks
create_symlinks() {
    print_status "Creating symbolic links..."
    
    DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
    
    # Shell configurations
    ln -sf "$DOTFILES_DIR/.zshrc" "$HOME/.zshrc"
    ln -sf "$DOTFILES_DIR/.gitconfig" "$HOME/.gitconfig"
    ln -sf "$DOTFILES_DIR/.gitignore_global" "$HOME/.gitignore_global"
    
    print_success "Shell and git configurations linked"
    
    # VS Code settings
    if command -v code &> /dev/null; then
        mkdir -p "$HOME/.config/Code/User"
        ln -sf "$DOTFILES_DIR/Code/User/settings.json" "$HOME/.config/Code/User/settings.json"
        print_success "VS Code settings linked"
    else
        print_warning "VS Code not found, skipping VS Code configuration"
    fi

    # Input Remapper presets
    if [[ -d "$DOTFILES_DIR/.config/input-remapper-2" ]]; then
        print_status "Setting up Input Remapper presets..."
        mkdir -p "$HOME/.config"
        cp -r "$DOTFILES_DIR/.config/input-remapper-2" "$HOME/.config/"
        print_success "Input Remapper presets installed"
        print_status "Note: Install input-remapper package and restart service to use presets"
    fi
}

# Install dependencies
install_dependencies() {
    print_status "Installing dependencies..."
    
    case $SYSTEM in
        "linux")
            # Detect package manager
            if command -v dnf &> /dev/null; then
                print_status "Using DNF package manager"
                sudo dnf install -y zsh git curl wget
                
                # Install zsh plugins
                if [[ ! -f /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh ]]; then
                    sudo dnf install -y zsh-autosuggestions
                fi
                
                if [[ ! -f /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]]; then
                    sudo dnf install -y zsh-syntax-highlighting
                fi
                
            elif command -v apt &> /dev/null; then
                print_status "Using APT package manager"
                sudo apt update
                sudo apt install -y zsh git curl wget
                sudo apt install -y zsh-autosuggestions zsh-syntax-highlighting
                
            elif command -v pacman &> /dev/null; then
                print_status "Using Pacman package manager"
                sudo pacman -S --noconfirm zsh git curl wget
                sudo pacman -S --noconfirm zsh-autosuggestions zsh-syntax-highlighting
            fi
            ;;
        "macos")
            if command -v brew &> /dev/null; then
                print_status "Using Homebrew"
                brew install zsh git curl wget
                brew install zsh-autosuggestions zsh-syntax-highlighting
            else
                print_warning "Homebrew not found. Please install dependencies manually."
            fi
            ;;
    esac
    
    # Install Starship prompt
    if ! command -v starship &> /dev/null; then
        print_status "Installing Starship prompt..."
        curl -sS https://starship.rs/install.sh | sh -s -- -y
        print_success "Starship installed"
    else
        print_success "Starship already installed"
    fi
    
    # Install Atuin
    if ! command -v atuin &> /dev/null; then
        print_status "Installing Atuin shell history..."
        curl --proto '=https' --tlsv1.2 -LsSf https://setup.atuin.sh | sh
        print_success "Atuin installed"
    else
        print_success "Atuin already installed"
    fi
}

# Set Zsh as default shell
set_default_shell() {
    if [[ "$SHELL" != "$(which zsh)" ]]; then
        print_status "Setting Zsh as default shell..."
        chsh -s "$(which zsh)"
        print_success "Zsh set as default shell (restart terminal to take effect)"
    else
        print_success "Zsh is already the default shell"
    fi
}

# Main installation process
main() {
    echo -e "${BLUE}"
    echo "╔══════════════════════════════════════╗"
    echo "║        Aryan's Dotfiles Setup        ║"
    echo "║                                      ║"
    echo "║   This will configure your system    ║"
    echo "║   with custom development settings   ║"
    echo "╚══════════════════════════════════════╝"
    echo -e "${NC}"
    
    # Ask for confirmation
    read -p "Do you want to continue? (y/N): " -n 1 -r
    echo
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        print_warning "Installation cancelled"
        exit 0
    fi
    
    check_system
    backup_files
    create_symlinks
    install_dependencies
    set_default_shell
    
    echo -e "${GREEN}"
    echo "╔══════════════════════════════════════╗"
    echo "║           Setup Complete!            ║"
    echo "║                                      ║"
    echo "║   Please restart your terminal or    ║"
    echo "║   run 'source ~/.zshrc' to reload   ║"
    echo "║                                      ║"
    echo "║   Enjoy your new setup! 🚀           ║"
    echo "╚══════════════════════════════════════╝"
    echo -e "${NC}"
    
    print_status "Next steps:"
    echo "  1. Restart your terminal"
    echo "  2. Run 'starship init zsh' if needed"
    echo "  3. Configure Atuin with 'atuin register' (optional)"
    echo "  4. Install VS Code extensions you like"
    echo ""
    print_success "Happy coding!"
}

# Run main function
main "$@"