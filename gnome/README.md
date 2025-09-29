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

```
gnome/
├── settings/               # GNOME dconf settings
│   ├── background.dconf    # Desktop wallpaper & background
│   ├── interface.dconf     # Themes, fonts, GTK settings
│   ├── wm.dconf           # Window manager preferences
│   ├── shell.dconf        # GNOME Shell configuration
│   ├── extensions.dconf    # Extension settings
│   ├── keybindings.dconf   # Custom keyboard shortcuts
│   ├── peripherals.dconf   # Mouse, touchpad settings
│   ├── terminal.dconf      # Terminal preferences
│   ├── gtk3-settings.ini   # GTK 3 theme settings
│   └── gtk4-settings.ini   # GTK 4 theme settings
├── extensions/             # Extension information
│   └── extensions-list.txt # List of installed extensions
└── README.md              # This file
```

## 🚀 Quick Setup

### Export Current Settings
```bash
./scripts/export-gnome-settings.sh
```

### Import Settings
```bash
./scripts/import-gnome-settings.sh
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