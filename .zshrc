# ====================================
# Aryan Techie's Zsh Configuration
# ====================================

# Initialize prompt and history
eval "$(starship init zsh)"
eval "$(atuin init zsh)"

# ====================================
# Plugin Loading
# ====================================

# Zsh plugins - install via package manager
[[ -f /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh ]] && source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
[[ -f /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]] && source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Local zsh plugins
[[ -f ~/.config/zsh/plugins/zsh-autocomplete/zsh-autocomplete.plugin.zsh ]] && source ~/.config/zsh/plugins/zsh-autocomplete/zsh-autocomplete.plugin.zsh

# Atuin environment
[[ -f "$HOME/.atuin/bin/env" ]] && . "$HOME/.atuin/bin/env"

# ====================================
# System Management Aliases
# ====================================

# Package management (DNF/Fedora)
alias sd='sudo dnf'
alias sdu='sudo dnf upgrade --refresh -y'     # Quick full system upgrade
alias sdi='sudo dnf install'                  # Install packages faster
alias sdr='sudo dnf remove'                   # Remove packages faster
alias sdc='sudo dnf clean all'                # Clean package cache

# System utilities
alias sus="systemctl suspend"                 # Quick suspend
alias reboot="sudo systemctl reboot"          # Quick reboot
alias shutdown="sudo systemctl poweroff"      # Quick shutdown

# ====================================
# Flatpak Management
# ====================================

alias fpi='flatpak install'
alias fpr='flatpak remove'
alias fpu='flatpak update -y'
alias fps='flatpak search'
alias fpl='flatpak list'
alias fprun='flatpak run'
alias fpla='flatpak list --app'
alias fpclean='flatpak uninstall --unused -y && flatpak repair'

# ====================================
# Navigation Shortcuts
# ====================================

alias docs='cd ~/Documents'
alias vids='cd ~/Videos'
alias desk='cd ~/Desktop'
alias pics='cd ~/Pictures'
alias home='cd ~/'
alias down="cd ~/Downloads"
alias music="cd ~/Music"
alias dotfiles="cd ~/.dotfiles"

# Directory operations
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

# ====================================
# Git Shortcuts
# ====================================

alias g='git'
alias gs='git status'
alias ga='git add'
alias gc='git commit'
alias gp='git push'
alias gl='git pull'
alias gd='git diff'
alias gb='git branch'
alias gco='git checkout'
alias gcb='git checkout -b'

# ====================================
# Development Aliases
# ====================================

# Code editors
alias c='code .'
alias n='nano'

# Python
alias py='python3'
alias pip='pip3'
alias venv='python3 -m venv'
alias activate='source venv/bin/activate'

# Node.js
alias ni='npm install'
alias ns='npm start'
alias nr='npm run'
alias nt='npm test'

# ====================================
# System Information
# ====================================

alias myip='hostname -I'                      # Check local IP
alias fan='sensors asus-isa-0000'            # Check fan speed
alias temp='echo "CPU: $(sensors 2>/dev/null | grep "Package id 0:" | awk '\''{print $4}'\'')" && echo "GPU: $(nvidia-smi --query-gpu=temperature.gpu --format=csv,noheader)°C" 2>/dev/null || echo "GPU: N/A"'
alias vit='temp && fan'                      # Vitals check
alias meminfo='free -h'                      # Memory information
alias diskinfo='df -h'                       # Disk information

# ====================================
# Useful Functions
# ====================================

# Create and enter directory
mkcd() {
    mkdir -p "$1" && cd "$1"
}

# Extract various archive types
extract() {
    if [ -f $1 ] ; then
        case $1 in
            *.tar.bz2)   tar xjf $1     ;;
            *.tar.gz)    tar xzf $1     ;;
            *.bz2)       bunzip2 $1     ;;
            *.rar)       unrar e $1     ;;
            *.gz)        gunzip $1      ;;
            *.tar)       tar xf $1      ;;
            *.tbz2)      tar xjf $1     ;;
            *.tgz)       tar xzf $1     ;;
            *.zip)       unzip $1       ;;
            *.Z)         uncompress $1  ;;
            *.7z)        7z x $1        ;;
            *)           echo "'$1' cannot be extracted via extract()" ;;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}

# Find process by name
psg() {
    ps aux | grep -v grep | grep "$@" -i --color=always
}

# File size in current directory
dirsize() {
    du -sh * | sort -hr
}
