# 🎮 Input Remapper Configuration

This directory contains input remapper presets for various devices including keyboards, mice, and other input devices.

## 📁 What's Included

- **Device-specific presets** for multiple input devices
- **Key mappings** and **macro configurations**
- **Mouse button remapping** for productivity workflows
- **Hotkey configurations** for system controls

## 🔧 Supported Devices

- **2.4G Mouse** - Copy/paste shortcuts
- **AT Translated Set 2 keyboard** - Keyboard remapping
- **Asus WMI hotkeys** - System hotkey customizations
- **CB Astra** - Gaming/productivity mouse
- **SONiX Cosmic Byte Astra** - Gaming peripherals
- **ZEB-THUNDER MAX** - Audio device controls
- **Sleep Button** - Power management
- **Video Bus** - Media controls

## 🚀 Installation

### Prerequisites
```bash
# Install input-remapper
sudo dnf install input-remapper  # Fedora
# or
sudo apt install input-remapper  # Ubuntu/Debian
```

### Setup
```bash
# Copy presets to system location
cp -r .config/input-remapper-2 ~/.config/

# Start input-remapper service
sudo systemctl enable input-remapper
sudo systemctl start input-remapper

# Launch GUI configuration
input-remapper-gtk
```

## 📋 Preset Details

### Mouse Configurations
- **Copy/Paste shortcuts** - Right+left click for copy, middle click for paste
- **Productivity mappings** - Custom button assignments for workflow optimization

### Keyboard Mappings
- **System shortcuts** - Custom key combinations for system controls
- **Window management** - Super key combinations for desktop navigation

### Hardware Controls
- **ASUS hotkeys** - Function key remapping for ASUS devices
- **Media controls** - Volume, brightness, and media playback controls

## 🔧 Customization

1. **Launch input-remapper-gtk**
2. **Select your device** from the dropdown
3. **Load existing preset** or create new mappings
4. **Test configurations** before applying
5. **Save and apply** your changes

## ⚠️ Notes

- **Device hashes** are unique to each device and safe to share
- **Origin hashes** help identify specific device inputs
- **Mappings are portable** across similar devices
- **Restart required** after major configuration changes

## 🔄 Backup & Restore

```bash
# Backup current config
cp -r ~/.config/input-remapper-2 ~/backup-input-remapper

# Restore from dotfiles
cp -r /path/to/dotfiles/.config/input-remapper-2 ~/.config/

# Restart service
sudo systemctl restart input-remapper
```

## 🛠️ Troubleshooting

- **Device not detected**: Check if device is connected and recognized by system
- **Mappings not working**: Ensure input-remapper service is running
- **Permission issues**: Run input-remapper with proper permissions
- **Conflicts**: Check for conflicting input management tools

---

💡 **Tip**: Use input-remapper-gtk to visually configure and test your mappings before applying them.