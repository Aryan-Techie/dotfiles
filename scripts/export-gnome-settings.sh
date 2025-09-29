#!/bin/bash

# Export GNOME Settings Safely - No Sensitive Data
# This script exports only safe, non-sensitive GNOME desktop configurations

set -e

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
GNOME_DIR="$DOTFILES_DIR/gnome"

echo "🔒 Exporting GNOME settings safely (no sensitive data)..."

# Create directories
mkdir -p "$GNOME_DIR"/{settings,extensions,themes}

# ====================================
# SAFE SETTINGS TO EXPORT
# ====================================

echo "📋 Exporting desktop appearance settings..."
# Desktop appearance (wallpaper path will be generic)
dconf dump /org/gnome/desktop/background/ | sed 's|file:///home/[^/]*/|file:///home/USER/|g' > "$GNOME_DIR/settings/background.dconf"

echo "📋 Exporting interface settings..."
# Interface settings (themes, fonts, etc.)
dconf dump /org/gnome/desktop/interface/ > "$GNOME_DIR/settings/interface.dconf"

echo "📋 Exporting window manager settings..."
# Window manager settings
dconf dump /org/gnome/desktop/wm/ > "$GNOME_DIR/settings/wm.dconf"

echo "📋 Exporting peripheral settings..."
# Mouse and touchpad settings
dconf dump /org/gnome/desktop/peripherals/ > "$GNOME_DIR/settings/peripherals.dconf"

echo "📋 Exporting input sources..."
# Keyboard layouts and input methods (safe)
dconf dump /org/gnome/desktop/input-sources/ > "$GNOME_DIR/settings/input-sources.dconf"

echo "📋 Exporting shell settings..."
# GNOME Shell settings (extensions, favorite apps)
dconf dump /org/gnome/shell/ | \
  grep -v "last-selected-power-profile" | \
  grep -v "remember-mount-password" | \
  grep -v "network-manager-applet" > "$GNOME_DIR/settings/shell.dconf"

echo "📋 Exporting extension settings..."
# Extension settings (filtered for sensitivity)
dconf dump /org/gnome/shell/extensions/ | \
  sed 's|/home/[^/]*/|/home/USER/|g' | \
  grep -v "api-key" | \
  grep -v "token" | \
  grep -v "password" | \
  grep -v "secret" > "$GNOME_DIR/settings/extensions.dconf"

echo "📋 Exporting GTK settings..."
# GTK settings
if [ -f ~/.config/gtk-3.0/settings.ini ]; then
    cp ~/.config/gtk-3.0/settings.ini "$GNOME_DIR/settings/gtk3-settings.ini"
fi

if [ -f ~/.config/gtk-4.0/settings.ini ]; then
    cp ~/.config/gtk-4.0/settings.ini "$GNOME_DIR/settings/gtk4-settings.ini"
fi

# ====================================
# EXTENSION LIST (NO SENSITIVE DATA)
# ====================================

echo "📋 Creating extensions list..."
cat > "$GNOME_DIR/extensions/extensions-list.txt" << EOF
# GNOME Shell Extensions Installed
# Install these extensions manually or use the install script

$(ls ~/.local/share/gnome-shell/extensions/ | sort)
EOF

# ====================================
# SAFE KEYBINDINGS
# ====================================

echo "📋 Exporting keybindings..."
# Custom keybindings (filtered)
dconf dump /org/gnome/settings-daemon/plugins/media-keys/ > "$GNOME_DIR/settings/keybindings.dconf"
dconf dump /org/gnome/desktop/wm/keybindings/ > "$GNOME_DIR/settings/wm-keybindings.dconf"

# ====================================
# TERMINAL SETTINGS (IF USING GNOME TERMINAL)
# ====================================

echo "📋 Exporting terminal settings..."
if dconf list /org/gnome/terminal/ > /dev/null 2>&1; then
    dconf dump /org/gnome/terminal/ | \
      sed 's|/home/[^/]*/|/home/USER/|g' > "$GNOME_DIR/settings/terminal.dconf"
fi

# ====================================
# CLEAN UP SENSITIVE DATA
# ====================================

echo "🧹 Cleaning up any remaining sensitive data..."

# Remove any files that might contain sensitive info
find "$GNOME_DIR" -name "*.dconf" -exec sed -i '/password/d' {} \;
find "$GNOME_DIR" -name "*.dconf" -exec sed -i '/secret/d' {} \;
find "$GNOME_DIR" -name "*.dconf" -exec sed -i '/token/d' {} \;
find "$GNOME_DIR" -name "*.dconf" -exec sed -i '/api-key/d' {} \;
find "$GNOME_DIR" -name "*.dconf" -exec sed -i '/credential/d' {} \;

# Replace actual username with placeholder in all files
find "$GNOME_DIR" -type f -exec sed -i "s|/home/$(whoami)/|/home/USER/|g" {} \;
find "$GNOME_DIR" -type f -exec sed -i "s|$(whoami)|USER|g" {} \;

# ====================================
# VERIFICATION
# ====================================

echo "🔍 Verifying no sensitive data remains..."
if grep -r -i "password\|secret\|token\|api-key\|credential" "$GNOME_DIR" 2>/dev/null; then
    echo "⚠️  WARNING: Potential sensitive data found! Please review manually."
    exit 1
else
    echo "✅ All exports are clean - no sensitive data detected!"
fi

echo ""
echo "🎉 GNOME settings exported safely to: $GNOME_DIR"
echo ""
echo "📁 Exported files:"
find "$GNOME_DIR" -type f | sort

echo ""
echo "🔒 Security note: All personal paths have been replaced with /home/USER/"
echo "📝 Review the files before committing to ensure no sensitive data leaked!"