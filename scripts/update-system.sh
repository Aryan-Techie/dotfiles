#!/bin/bash

# Update system script
# Quick system update for different package managers

set -e

print_status() {
    echo -e "\033[0;34m[INFO]\033[0m $1"
}

print_success() {
    echo -e "\033[0;32m[SUCCESS]\033[0m $1"
}

print_error() {
    echo -e "\033[0;31m[ERROR]\033[0m $1"
}

update_system() {
    print_status "Updating system packages..."
    
    if command -v dnf &> /dev/null; then
        print_status "Using DNF (Fedora/RHEL)"
        sudo dnf upgrade --refresh -y
        sudo dnf autoremove -y
        
    elif command -v apt &> /dev/null; then
        print_status "Using APT (Ubuntu/Debian)"
        sudo apt update && sudo apt upgrade -y
        sudo apt autoremove -y
        
    elif command -v pacman &> /dev/null; then
        print_status "Using Pacman (Arch Linux)"
        sudo pacman -Syu --noconfirm
        
    elif command -v zypper &> /dev/null; then
        print_status "Using Zypper (openSUSE)"
        sudo zypper refresh && sudo zypper update -y
        
    elif command -v brew &> /dev/null; then
        print_status "Using Homebrew (macOS)"
        brew update && brew upgrade
        brew cleanup
        
    else
        print_error "No supported package manager found"
        exit 1
    fi
    
    print_success "System packages updated successfully"
}

update_flatpaks() {
    if command -v flatpak &> /dev/null; then
        print_status "Updating Flatpak applications..."
        flatpak update -y
        flatpak uninstall --unused -y
        print_success "Flatpak applications updated"
    fi
}

update_snap() {
    if command -v snap &> /dev/null; then
        print_status "Updating Snap packages..."
        sudo snap refresh
        print_success "Snap packages updated"
    fi
}

main() {
    echo "🔄 System Update Script"
    echo "======================="
    
    update_system
    update_flatpaks
    update_snap
    
    echo ""
    print_success "All updates completed! 🎉"
}

main "$@"