# 🚀 Aryan Techie's Dotfiles

> My personal configuration files for a productive Linux development environment

![GitHub repo size](https://img.shields.io/github/repo-size/Aryan-Techie/dotfiles)
![GitHub last commit](https://img.shields.io/github/last-commit/Aryan-Techie/dotfiles)
![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)

## 📋 What's Included

- **🐚 Zsh Configuration**: Enhanced shell with custom aliases, functions, and plugins
- **⚙️ Git Configuration**: Comprehensive git settings with useful aliases
- **💻 VS Code Settings**: Optimized editor configuration
- **🎨 GNOME Desktop**: Complete desktop environment with 30+ extensions
- **🎮 Input Remapper**: Device-specific key and button remapping presets
- **🚀 Ulauncher**: Application launcher with custom shortcuts and extensions
- **✨ Starship Prompt**: Beautiful, informative terminal prompt
- **🛠️ System Scripts**: Automated system maintenance utilities

## 🎯 Key Features

- **Fedora-Optimized**: DNF package management aliases and system utilities
- **Developer-Friendly**: Git shortcuts, development tool aliases, and functions
- **Desktop Customization**: Complete GNOME setup with themes and extensions
- **Hardware Support**: Input device remapping for productivity workflows
- **System Monitoring**: Temperature, fan speed, and system information commands
- **Flatpak Integration**: Easy Flatpak application management
- **Automated Updates**: System update scripts for multiple package managers

## 🚀 Quick Installation

### Prerequisites

- **Zsh** - Primary shell
- **Git** - Version control
- **Starship** - Terminal prompt (`curl -sS https://starship.rs/install.sh | sh`)
- **Atuin** - Shell history (`curl --proto '=https' --tlsv1.2 -LsSf https://setup.atuin.sh | sh`)
- **Ulauncher** - Application launcher (`sudo dnf install ulauncher` or download from [ulauncher.org](https://ulauncher.org/))

### Automatic Installation

```bash
git clone https://github.com/Aryan-Techie/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
chmod +x install.sh
./install.sh
```

## 🚀 Ulauncher Application Launcher

Ulauncher is configured with useful extensions and custom shortcuts for enhanced productivity.

### 📦 Included Extensions

- **Kill Process** - Quickly terminate processes
- **Bluetooth Quick Connect** - Fast Bluetooth device connection
- **GNOME Settings** - Quick access to system settings
- **Turn Off Screen** - Instant screen lock
- **System Commands** - System control shortcuts
- **Window Switcher** - Application window management

### ⚡ Custom Shortcuts

The configuration includes 40+ custom shortcuts for common services:

- **Search Engines**: Google, Stack Overflow, Wikipedia
- **Development**: GitHub, GitLab, AWS Console, Docker Hub
- **Productivity**: Gmail, Calendar, Notion, Todoist
- **Social Media**: LinkedIn, Twitter, Reddit, Discord
- **Entertainment**: YouTube, Spotify, Netflix
- **AI Tools**: ChatGPT, Claude, Perplexity
- **Translation**: Google Translate with smart language detection

### 🔧 Manual Setup

```bash
# Backup existing configs
cp ~/.zshrc ~/.zshrc.backup 2>/dev/null || true
cp ~/.gitconfig ~/.gitconfig.backup 2>/dev/null || true

# Create symlinks
ln -sf ~/.dotfiles/.zshrc ~/.zshrc
ln -sf ~/.dotfiles/.gitconfig ~/.gitconfig
ln -sf ~/.dotfiles/.gitignore_global ~/.gitignore_global
ln -sf ~/.dotfiles/.config/starship.toml ~/.config/starship.toml

# VS Code settings (Linux)
mkdir -p ~/.config/Code/User
ln -sf ~/.dotfiles/Code/User/settings.json ~/.config/Code/User/settings.json

# Ulauncher configuration
mkdir -p ~/.config/ulauncher
ln -sf ~/.dotfiles/.config/ulauncher/* ~/.config/ulauncher/

# Reload shell
source ~/.zshrc
```

## 📁 Repository Structure

```
dotfiles/
├── .config/
│   ├── input-remapper-2/   # Input device remapping presets
│   ├── ulauncher/          # Application launcher configuration
│   └── starship.toml       # Starship prompt configuration
├── Code/User/
│   └── settings.json       # VS Code editor settings
├── gnome/
│   ├── extensions/         # GNOME Shell extensions list
│   ├── settings/           # GNOME desktop configuration
│   └── README.md           # GNOME setup documentation
├── scripts/
│   ├── export-gnome-settings.sh   # GNOME settings export
│   ├── import-gnome-settings.sh   # GNOME settings import
│   ├── install-extensions.sh      # GNOME extensions installer
│   ├── install-themes.sh          # Custom themes installer
│   └── update-system.sh           # System update utility
├── .gitconfig              # Git global configuration with aliases
├── .gitignore              # Repository ignore rules
├── .gitignore_global       # Global gitignore patterns
├── .zshrc                  # Zsh shell configuration
├── install.sh              # Automated setup script
├── LICENSE                 # MIT license
└── README.md               # This documentation
```

## ⚡ Available Commands & Aliases

### 📦 Package Management (Fedora/DNF)
- `sd` - sudo dnf (quick DNF access)
- `sdu` - Update all system packages
- `sdi <package>` - Install package
- `sdr <package>` - Remove package
- `sdc` - Clean package cache

### 🔄 System Control
- `sus` - Suspend system
- `reboot` - Restart system
- `shutdown` - Power off system

### 📱 Flatpak Management
- `fpi <app>` - Install Flatpak app
- `fpr <app>` - Remove Flatpak app
- `fpu` - Update all Flatpak apps
- `fpclean` - Remove unused Flatpaks
- `fpl` - List installed apps
- `fps <term>` - Search for apps

### 🧭 Navigation Shortcuts
- `docs` → ~/Documents
- `down` → ~/Downloads
- `desk` → ~/Desktop
- `pics` → ~/Pictures
- `dotfiles` → ~/.dotfiles
- `..` / `...` / `....` - Navigate up directories

### 🔧 Development Tools
- `g` - Git shortcut
- `gs` - Git status
- `ga` - Git add
- `gc` - Git commit
- `gp` - Git push
- `c` - Open current directory in VS Code
- `py` - Python3
- `ni` / `ns` / `nr` - NPM shortcuts

### 📊 System Information
- `temp` - CPU/GPU temperature
- `fan` - Fan speed (ASUS systems)
- `vit` - Show vitals (temp + fan)
- `myip` - Local IP address
- `meminfo` - Memory usage
- `diskinfo` - Disk usage

### 🛠️ Useful Functions
- `mkcd <dir>` - Create and enter directory
- `extract <file>` - Extract various archive formats
- `psg <process>` - Find process by name
- `dirsize` - Show directory sizes sorted by size

## 🔄 Keeping Updated

```bash
cd ~/.dotfiles
git pull origin main
source ~/.zshrc  # Reload shell configuration
```

## 🛠️ Customization

Add your personal aliases to `.zshrc`:

```bash
# Personal aliases section
alias myalias="your command here"
```

Modify Starship prompt in `.config/starship.toml` to match your preferences.

## 🤝 Contributing

Contributions are welcome! Whether you want to fix bugs, add new features, or improve documentation, here's how you can help:

### 📋 Guidelines

1. **Fork the Repository**
   ```bash
   # Fork on GitHub, then clone your fork
   git clone https://github.com/YOUR_USERNAME/dotfiles.git
   cd dotfiles
   ```

2. **Create a Feature Branch**
   ```bash
   git checkout -b feature/your-feature-name
   # or
   git checkout -b fix/bug-description
   ```

3. **Make Your Changes**
   - Keep changes focused and atomic
   - Test your changes thoroughly
   - Follow existing code style and organization
   - Update documentation if needed

4. **Commit Your Changes**
   ```bash
   git add .
   git commit -m "feat: add useful alias for X"
   # or
   git commit -m "fix: correct path in install script"
   ```

   **Commit Message Format:**
   - `feat:` - New features or aliases
   - `fix:` - Bug fixes
   - `docs:` - Documentation updates
   - `config:` - Configuration changes
   - `refactor:` - Code refactoring

5. **Submit a Pull Request**
   - Push your branch to your fork
   - Create a pull request with a clear description
   - Explain what your changes do and why they're useful

### 💡 Ideas for Contributions

- **New Aliases**: Useful command shortcuts for development
- **Cross-Platform Support**: Adaptations for other Linux distributions
- **New Configurations**: Additional tool configurations (tmux, vim, etc.)
- **Scripts**: Useful automation scripts
- **Documentation**: Improve setup instructions or add tips
- **Themes**: Starship prompt themes or VS Code themes

### 🐛 Reporting Issues

Found a bug or have a suggestion? Please open an issue with:
- Clear description of the problem
- Steps to reproduce (if applicable)
- Your system information (OS, shell version, etc.)
- Expected vs actual behavior

### ✨ Feature Requests

Have an idea for improvement? Open an issue with:
- Clear description of the proposed feature
- Use case and benefits
- Any implementation ideas you might have

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 📞 Contact

- LinkedIn: [Aryan Jangra (@aryantechie)](https://linkedin.com/in/aryantechie/)
- Website: [aryantechie.com](https://aryantechie.com)

---

⭐ **Star this repository if you found it helpful!**