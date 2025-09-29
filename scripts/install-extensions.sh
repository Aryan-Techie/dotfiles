#!/bin/bash

# 🧩 GNOME Extensions Installation Script
# Installs GNOME Shell extensions from the extensions list
# Part of dotfiles configuration

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
DOTFILES_DIR="$(dirname "$SCRIPT_DIR")"
GNOME_DIR="$DOTFILES_DIR/gnome"
EXTENSIONS_LIST="$GNOME_DIR/extensions/extensions-list.txt"

echo "🧩 Installing GNOME Shell Extensions..."

# Check if extensions list exists
if [[ ! -f "$EXTENSIONS_LIST" ]]; then
    echo "❌ Extensions list not found at: $EXTENSIONS_LIST"
    exit 1
fi

# Check if GNOME Extensions CLI is available
if ! command -v gnome-extensions &> /dev/null; then
    echo "❌ gnome-extensions command not found!"
    echo "   Please install GNOME Shell extensions manager:"
    echo "   sudo dnf install gnome-extensions-app"
    exit 1
fi

echo "📋 Reading extensions list from: $EXTENSIONS_LIST"

# Function to install extension
install_extension() {
    local extension_id="$1"
    
    echo "🔄 Processing: $extension_id"
    
    # Skip comments and empty lines
    if [[ "$extension_id" =~ ^#.*$ ]] || [[ -z "$extension_id" ]]; then
        return 0
    fi
    
    # Check if already installed
    if gnome-extensions list | grep -q "^$extension_id$"; then
        echo "✅ Already installed: $extension_id"
        gnome-extensions enable "$extension_id" 2>/dev/null || true
        return 0
    fi
    
    echo "⬇️  Installing: $extension_id"
    echo "   Please install manually from: https://extensions.gnome.org/"
    echo "   Search for: $extension_id"
    echo ""
}

# Read and process extensions list
while IFS= read -r extension_id; do
    install_extension "$extension_id"
done < "$EXTENSIONS_LIST"

echo ""
echo "✅ Extension installation process completed!"
echo ""
echo "📝 Manual installation required:"
echo "   1. Visit https://extensions.gnome.org/"
echo "   2. Install the browser extension for easy installation"
echo "   3. Search for and install the extensions listed above"
echo "   4. Enable extensions using: gnome-extensions enable EXTENSION_ID"
echo ""
echo "🔧 Or use GNOME Extensions app:"
echo "   sudo dnf install gnome-extensions-app"
echo "   Launch 'Extensions' from the applications menu"
echo ""
echo "🔄 After installation, restart GNOME Shell:"
echo "   Alt+F2, type 'r', press Enter"