# 🎨 GNOME Desktop Configuration

This directory contains safely exported GNOME desktop settings, themes, and extension configurations.

## 🔒 Security Notice

**All sensitive information has been removed**, including:
- ❌ Personal file paths (replaced with `/home/USER/`)
- ❌ Passwords and credentials
- ❌ API keys and tokens
- ❌ Private network configurations
- ❌ User-specific identifiers

## 📁 Directory Structure

## 📁 Directory Structure

```
gnome/
├── extensions/             # GNOME Shell extensions list
├── settings/               # GNOME desktop configuration files
└── README.md               # This documentation
```

## 🎨 Required Themes

This configuration uses the following custom themes that need to be installed:

### **GTK Themes**
- **Marble-blue-dark** - Dark blue GTK theme for applications
  - 📦 Source: [Marble Shell Theme](https://github.com/imarkoff/Marble-shell-theme)
  - 🎯 Variant: Blue Dark

### **Icon Themes** 
- **WhiteSur-dark** - macOS Big Sur inspired dark icon theme
  - 📦 Source: [WhiteSur Icon Theme](https://github.com/vinceliuice/WhiteSur-icon-theme)
  - 🎯 Variant: Dark

### **Cursor Themes**
- **McMojave-cursors** - macOS Mojave inspired cursor theme
  - 📦 Source: [McMojave Cursors](https://github.com/vinceliuice/McMojave-cursors)

## 🚀 Installation

### Install Themes (Recommended)
```bash
# Automated theme installation
./scripts/install-themes.sh
```

### Manual Theme Installation
```bash
# Marble Shell Theme
git clone https://github.com/imarkoff/Marble-shell-theme.git
cd Marble-shell-theme
cp -r Marble-blue-dark ~/.themes/

# WhiteSur Icon Theme  
git clone https://github.com/vinceliuice/WhiteSur-icon-theme.git
cd WhiteSur-icon-theme
./install.sh

# McMojave Cursors
git clone https://github.com/vinceliuice/McMojave-cursors.git
cd McMojave-cursors
./install.sh
```

### Apply GNOME Settings
```bash
# Import all desktop settings (includes theme preferences)
./scripts/import-gnome-settings.sh
```

### Export Current Settings
```bash
./scripts/export-gnome-settings.sh
```

## 🧩 Extensions Included

The following GNOME Shell extensions are part of this configuration:

- **App Indicator Support** - System tray support
- **Blur My Shell** - Background blur effects
- **Caffeine** - Prevent screen lock
- **Clipboard Indicator** - Clipboard manager
- **Color Picker** - Screen color picker
- **Dash to Dock** - Customizable dock
- **Emoji Copy** - Easy emoji insertion
- **GSConnect** - Android device integration
- **Just Perfection** - GNOME customization
- **Space Bar** - Workspace indicator
- **Unite** - Window decorations
- **User Themes** - Custom shell themes
- And many more...

## 🎨 Themes & Appearance

### Included Settings:
- **GTK Theme Configuration** - Application theming
- **Icon Theme Settings** - System icons
- **Font Configuration** - System fonts
- **Window Decorations** - Title bars and borders
- **Shell Theme** - GNOME Shell appearance

### Manual Setup Required:
- **Icon Themes** - Download separately
- **GTK Themes** - Install from system packages
- **Fonts** - Install required fonts
- **Extensions** - Install from GNOME Extensions

## ⌨️ Keyboard Shortcuts

Custom keybindings are included for:
- **Window Management** - Tiling, switching, moving
- **Application Launching** - Quick app access
- **System Controls** - Volume, brightness, screenshots
- **Custom Commands** - Terminal, file manager

## 🔧 Manual Steps After Import

1. **Install GNOME Extensions:**
   ```bash
   # Using Extension Manager (recommended)
   flatpak install flathub com.mattjakeman.ExtensionManager
   
   # Or visit: https://extensions.gnome.org/
   ```

2. **Install Themes (if needed):**
   ```bash
   # Install popular themes
   sudo dnf install adwaita-gtk2-theme
   sudo dnf install gnome-themes-extra
   ```

3. **Install Fonts:**
   ```bash
   # Install common fonts used in configuration
   sudo dnf install google-roboto-fonts
   sudo dnf install fira-code-fonts
   sudo dnf install jetbrains-mono-fonts
   ```

4. **Restart GNOME Shell:**
   - **Alt + F2** → type `r` → **Enter**
   - Or log out and log back in

## 🛠️ Customization

### Adding New Settings:
1. Make your changes in GNOME Settings
2. Run `./scripts/export-gnome-settings.sh`
3. Review the exported files
4. Commit changes to dotfiles

### Extension Settings:
Most extension settings are included in `extensions.dconf`. However, some extensions may require manual configuration.

## 🚨 Troubleshooting

### Settings Not Applied:
- Ensure dconf is installed: `sudo dnf install dconf`
- Restart GNOME Shell after importing
- Check that extensions are enabled

### Extensions Not Working:
- Install extensions manually first
- Enable them in Extensions app
- Restart GNOME Shell
- Import settings again

### Theme Issues:
- Ensure theme packages are installed
- Check GTK theme compatibility
- Reset to default if problems occur

## 🔄 Backup & Restore

The import script automatically creates backups at:
```
~/.config/dotfiles-backup/gnome-YYYYMMDD-HHMMSS/
```

To restore from backup:
```bash
dconf load /org/gnome/ < ~/.config/dotfiles-backup/gnome-*/current-gnome-settings.dconf
```

## 📝 Notes

- **Safe Export**: All personal data is sanitized before export
- **Cross-Machine**: Works across different installations
- **Fedora Optimized**: Tested on Fedora with GNOME
- **Regular Updates**: Re-export settings after major changes

---

💡 **Tip**: Always review exported settings before committing to ensure no sensitive data is included!