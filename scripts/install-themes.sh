#!/bin/bash

# 🎨 Theme Installation Script
# Downloads and installs custom themes from official repositories
# Part of dotfiles configuration

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

# Create directories
create_directories() {
    print_status "Creating theme directories..."
    mkdir -p "$HOME/.themes"
    mkdir -p "$HOME/.local/share/icons"
    mkdir -p "/tmp/theme-downloads"
}

# Install Marble Shell Theme
install_marble_theme() {
    print_status "Installing Marble Shell Theme..."
    
    cd "/tmp/theme-downloads"
    
    if [[ ! -d "Marble-shell-theme" ]]; then
        git clone https://github.com/imarkoff/Marble-shell-theme.git
    fi
    
    cd "Marble-shell-theme"
    
    # Install the blue dark variant (as shown in your config)
    if [[ -d "Marble-blue-dark" ]]; then
        cp -r "Marble-blue-dark" "$HOME/.themes/"
        print_success "Marble-blue-dark theme installed"
    else
        print_warning "Marble-blue-dark variant not found, installing all variants"
        cp -r Marble-* "$HOME/.themes/" 2>/dev/null || true
    fi
}

# Install WhiteSur Icon Theme
install_whitesur_icons() {
    print_status "Installing WhiteSur Icon Theme..."
    
    cd "/tmp/theme-downloads"
    
    if [[ ! -d "WhiteSur-icon-theme" ]]; then
        git clone https://github.com/vinceliuice/WhiteSur-icon-theme.git
    fi
    
    cd "WhiteSur-icon-theme"
    
    # Make the install script executable and run it
    chmod +x install.sh
    
    # Install with default settings (includes dark variant)
    ./install.sh
    
    print_success "WhiteSur icon theme installed"
}

# Install McMojave Cursors
install_mcmojave_cursors() {
    print_status "Installing McMojave Cursors..."
    
    cd "/tmp/theme-downloads"
    
    if [[ ! -d "McMojave-cursors" ]]; then
        git clone https://github.com/vinceliuice/McMojave-cursors.git
    fi
    
    cd "McMojave-cursors"
    
    # Make the install script executable and run it
    chmod +x install.sh
    
    # Install cursors
    ./install.sh
    
    print_success "McMojave cursors installed"
}

# Update icon cache
update_icon_cache() {
    print_status "Updating icon caches..."
    
    # Update system icon cache
    if command -v gtk-update-icon-cache &> /dev/null; then
        for theme_dir in "$HOME/.local/share/icons"/*; do
            if [[ -d "$theme_dir" && -f "$theme_dir/index.theme" ]]; then
                theme_name=$(basename "$theme_dir")
                print_status "Updating cache for $theme_name..."
                gtk-update-icon-cache "$theme_dir" 2>/dev/null || true
            fi
        done
        print_success "Icon caches updated"
    else
        print_warning "gtk-update-icon-cache not found, skipping cache update"
    fi
}

# Clean up temporary files
cleanup() {
    print_status "Cleaning up temporary files..."
    rm -rf "/tmp/theme-downloads"
    print_success "Cleanup completed"
}

# Main installation function
main() {
    echo "🎨 Installing Custom Themes"
    echo "============================"
    echo
    
    # Check for git
    if ! command -v git &> /dev/null; then
        print_error "Git is required but not installed. Please install git first."
        exit 1
    fi
    
    create_directories
    
    echo
    print_status "This will install the following themes:"
    echo "  🔵 Marble Shell Theme (GTK theme)"
    echo "  ⚪ WhiteSur Icon Theme (macOS Big Sur icons)"
    echo "  🖱️  McMojave Cursors (macOS Mojave cursors)"
    echo
    
    read -p "Continue? (y/N): " -n 1 -r
    echo
    
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        install_marble_theme
        echo
        install_whitesur_icons
        echo
        install_mcmojave_cursors
        echo
        update_icon_cache
        echo
        cleanup
        
        echo
        echo "🎉 Theme installation completed!"
        echo
        echo "📝 Next steps:"
        echo "   1. Apply themes using GNOME Tweaks or Extensions app"
        echo "   2. Or run: ./scripts/import-gnome-settings.sh"
        echo "   3. Log out and log back in for full effect"
        echo
        echo "🎨 Installed themes:"
        echo "   • GTK Theme: Marble-blue-dark"
        echo "   • Icon Theme: WhiteSur / WhiteSur-dark"  
        echo "   • Cursor Theme: McMojave-cursors"
    else
        print_status "Installation cancelled"
        cleanup
    fi
}

# Run main function
main "$@"