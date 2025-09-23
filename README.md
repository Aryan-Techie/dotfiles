# 🚀 Aryan's Dotfiles

> My personal configuration files for a productive development environment

![GitHub repo size](https://img.shields.io/github/repo-size/Aryan-Techie/dotfiles)
![GitHub last commit](https://img.shields.io/github/last-commit/Aryan-Techie/dotfiles)
![GitHub](https://img.shields.io/github/license/Aryan-Techie/dotfiles)

## 📋 What's Included

- **🐚 Shell Configuration**: Zsh with custom aliases and functions
- **⚙️ Git Configuration**: Global git settings and aliases
- **💻 VS Code Settings**: Editor preferences and extensions
- **🛠️ Development Tools**: Various tool configurations

## 🎯 Features

- **Fast Development Workflow**: Custom aliases for common tasks
- **Cross-Platform Support**: Works on Linux, macOS, and Windows (WSL)
- **Modular Structure**: Easy to customize and extend
- **Auto-completion**: Enhanced shell experience with syntax highlighting

## 🚀 Quick Start

### Prerequisites

- Git
- Zsh (recommended) or Bash
- [Starship](https://starship.rs/) prompt
- [Atuin](https://atuin.sh/) for shell history

### Installation

```bash
# Clone the repository
git clone https://github.com/Aryan-Techie/dotfiles.git ~/.dotfiles

# Navigate to the directory
cd ~/.dotfiles

# Run the installation script (coming soon!)
./install.sh
```

### Manual Installation

```bash
# Backup existing configs (optional)
cp ~/.zshrc ~/.zshrc.backup
cp ~/.gitconfig ~/.gitconfig.backup

# Symlink the configs
ln -sf ~/.dotfiles/.zshrc ~/.zshrc
ln -sf ~/.dotfiles/.gitconfig ~/.gitconfig

# For VS Code settings (adjust path as needed)
ln -sf ~/.dotfiles/Code/User/settings.json ~/.config/Code/User/settings.json

# Reload shell
source ~/.zshrc
```

## 📁 File Structure

```
dotfiles/
├── .gitconfig          # Git global configuration
├── .gitignore          # Files to ignore in dotfiles repo
├── .zshrc              # Zsh shell configuration
├── Code/
│   └── User/
│       └── settings.json   # VS Code settings
├── install.sh          # Installation script
└── README.md           # This file
```

## 🛠️ Customization

### Adding Your Own Aliases

Edit `.zshrc` and add your custom aliases:

```bash
# Your custom aliases
alias myalias="your command here"
```

### VS Code Extensions

Install recommended extensions:

```bash
# Material Icon Theme
code --install-extension PKief.material-icon-theme

# Prettier
code --install-extension esbenp.prettier-vscode

# Add more as needed
```

## 🔧 Tools & Dependencies

### Shell Tools
- [Starship](https://starship.rs/) - Cross-shell prompt
- [Atuin](https://atuin.sh/) - Magical shell history
- [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions)
- [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting)

### Development Tools
- [VS Code](https://code.visualstudio.com/) - Code editor
- Git - Version control
- Various programming language tools

## 📝 Available Aliases

### System Management
- `sdu` - Update system packages
- `sdi` - Install packages
- `sdr` - Remove packages
- `sus` - Suspend system

### Flatpak Management
- `fpi` - Install flatpak
- `fpr` - Remove flatpak
- `fpu` - Update flatpaks
- `fpclean` - Clean unused flatpaks

### Navigation
- `docs` - Go to Documents
- `down` - Go to Downloads
- `desk` - Go to Desktop
- `pics` - Go to Pictures

### System Info
- `temp` - Check CPU/GPU temperature
- `fan` - Check fan speed
- `myip` - Show local IP address

## 🔄 Updates

To update your dotfiles:

```bash
cd ~/.dotfiles
git pull origin main
source ~/.zshrc  # Reload shell config
```

## 🤝 Contributing

Feel free to fork this repository and customize it for your needs! If you have suggestions or improvements:

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Submit a pull request

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments

- Inspired by the amazing dotfiles community
- Thanks to all the open-source tool creators
- Special mention to [Starship](https://starship.rs/) and [Atuin](https://atuin.sh/) teams

## 📞 Contact

- GitHub: [@Aryan-Techie](https://github.com/Aryan-Techie)
- Website: [aryantechie.com](https://aryantechie.com)

---

⭐ **Star this repository if you found it helpful!**