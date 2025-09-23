eval "$(starship init zsh)"
eval "$(atuin init zsh)"

source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.config/zsh/plugins/zsh-autocomplete/zsh-autocomplete.plugin.zsh

. "$HOME/.atuin/bin/env"

eval "$(atuin init zsh)"
alias gpus="gpu-switch"
alias gpus="switch-gpu"
alias switchgpu="switch-gpu"
alias sd='sudo dnf'
alias sus="systemctl suspend" #quick suspend

alias sdu='sudo dnf upgrade --refresh -y'     # Quick full system upgrade
alias sdi='sudo dnf install'                  # Install packages faster
alias sdr='sudo dnf remove'                   # Remove packages faster
alias sdc='sudo dnf clean all'                 # Clean package cache

alias fan='sensors asus-isa-0000'    #check fan speed


alias myip='hostname -I' #check local ip


# Flatpak quick commands
alias fpi='flatpak install'
alias fpr='flatpak remove'
alias fpu='flatpak update -y'
alias fps='flatpak search'
alias fpl='flatpak list'
alias fprun='flatpak run'

alias fpclean='flatpak uninstall --unused -y && flatpak repair'

alias fpla='flatpak list --app'

#quick move
alias docs='cd ~/Documents'
alias vids='cd ~/Videos'
alias desk='cd ~/Desktop'
alias pics='cd ~/Pictures'
alias home='cd ~/'
alias down="cd ~/Downloads"
alias music="cd ~/Music"

alias temp='echo "CPU: $(sensors 2>/dev/null | grep "Package id 0:" | awk '\''{print $4}'\'')" && echo "GPU: $(nvidia-smi --query-gpu=temperature.gpu --format=csv,noheader)°C"'

alias vit='temp && fan'
