#!/bin/bash

# Import GNOME Settings Safely
# This script imports GNOME desktop configurations from dotfiles

set -e

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
GNOME_DIR="$DOTFILES_DIR/gnome"

echo "🔧 Importing GNOME settings from dotfiles..."

if [ ! -d "$GNOME_DIR" ]; then
    echo "❌ GNOME settings directory not found: $GNOME_DIR"
    exit 1
fi

# ====================================
# BACKUP CURRENT SETTINGS
# ====================================

echo "💾 Creating backup of current settings..."
BACKUP_DIR="$HOME/.config/dotfiles-backup/gnome-$(date +%Y%m%d-%H%M%S)"
mkdir -p "$BACKUP_DIR"

# Backup current dconf settings
dconf dump /org/gnome/ > "$BACKUP_DIR/current-gnome-settings.dconf" 2>/dev/null || true

echo "📁 Backup created at: $BACKUP_DIR"

# ====================================
# IMPORT SETTINGS
# ====================================

echo "📋 Importing desktop appearance..."
if [ -f "$GNOME_DIR/settings/background.dconf" ]; then
    # Replace USER placeholder with actual username
    sed "s|/home/USER/|$HOME/|g" "$GNOME_DIR/settings/background.dconf" | dconf load /org/gnome/desktop/background/
fi

echo "📋 Importing interface settings..."
if [ -f "$GNOME_DIR/settings/interface.dconf" ]; then
    dconf load /org/gnome/desktop/interface/ < "$GNOME_DIR/settings/interface.dconf"
fi

echo "📋 Importing window manager settings..."
if [ -f "$GNOME_DIR/settings/wm.dconf" ]; then
    dconf load /org/gnome/desktop/wm/ < "$GNOME_DIR/settings/wm.dconf"
fi

echo "📋 Importing peripheral settings..."
if [ -f "$GNOME_DIR/settings/peripherals.dconf" ]; then
    dconf load /org/gnome/desktop/peripherals/ < "$GNOME_DIR/settings/peripherals.dconf"
fi

echo "📋 Importing input sources..."
if [ -f "$GNOME_DIR/settings/input-sources.dconf" ]; then
    dconf load /org/gnome/desktop/input-sources/ < "$GNOME_DIR/settings/input-sources.dconf"
fi

echo "📋 Importing shell settings..."
if [ -f "$GNOME_DIR/settings/shell.dconf" ]; then
    dconf load /org/gnome/shell/ < "$GNOME_DIR/settings/shell.dconf"
fi

echo "📋 Importing extension settings..."
if [ -f "$GNOME_DIR/settings/extensions.dconf" ]; then
    # Replace USER placeholder with actual username
    sed "s|/home/USER/|$HOME/|g" "$GNOME_DIR/settings/extensions.dconf" | dconf load /org/gnome/shell/extensions/
fi

echo "📋 Importing keybindings..."
if [ -f "$GNOME_DIR/settings/keybindings.dconf" ]; then
    dconf load /org/gnome/settings-daemon/plugins/media-keys/ < "$GNOME_DIR/settings/keybindings.dconf"
fi

if [ -f "$GNOME_DIR/settings/wm-keybindings.dconf" ]; then
    dconf load /org/gnome/desktop/wm/keybindings/ < "$GNOME_DIR/settings/wm-keybindings.dconf"
fi

echo "📋 Importing terminal settings..."
if [ -f "$GNOME_DIR/settings/terminal.dconf" ]; then
    sed "s|/home/USER/|$HOME/|g" "$GNOME_DIR/settings/terminal.dconf" | dconf load /org/gnome/terminal/
fi

# ====================================
# GTK SETTINGS
# ====================================

echo "📋 Importing GTK settings..."
if [ -f "$GNOME_DIR/settings/gtk3-settings.ini" ]; then
    mkdir -p ~/.config/gtk-3.0
    cp "$GNOME_DIR/settings/gtk3-settings.ini" ~/.config/gtk-3.0/settings.ini
fi

if [ -f "$GNOME_DIR/settings/gtk4-settings.ini" ]; then
    mkdir -p ~/.config/gtk-4.0
    cp "$GNOME_DIR/settings/gtk4-settings.ini" ~/.config/gtk-4.0/settings.ini
fi

# ====================================
# EXTENSIONS INFO
# ====================================

echo ""
echo "🧩 GNOME Extensions List:"
if [ -f "$GNOME_DIR/extensions/extensions-list.txt" ]; then
    echo "📋 The following extensions were exported from the original setup:"
    echo ""
    grep -v "^#" "$GNOME_DIR/extensions/extensions-list.txt" | sort
    echo ""
    echo "💡 Install these extensions manually from GNOME Extensions website:"
    echo "   https://extensions.gnome.org/"
    echo ""
    echo "🚀 Or use the GNOME Extensions Manager (recommended):"
    echo "   flatpak install flathub com.mattjakeman.ExtensionManager"
fi

echo ""
echo "✅ GNOME settings imported successfully!"
echo ""
echo "🔄 To apply all changes, please:"
echo "   1. Log out and log back in, OR"
echo "   2. Restart GNOME Shell: Alt+F2, type 'r', press Enter"
echo ""
echo "💾 Your previous settings are backed up at:"
echo "   $BACKUP_DIR"