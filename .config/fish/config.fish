# =============================================================================
# CachyOS + Personal Fish Configuration
# =============================================================================
# Author      : Abhijeet Thakur
# Description : Modular Fish shell configuration with aliases, functions,
#               environment setup, and command completion notifications.
# =============================================================================

# =============================================================================
# DONE Plugin — Command Completion Notifications
# =============================================================================
# Auto-loaded from ~/.config/fish/conf.d/done.fish
# Sends notifications when long-running commands finish
source ~/.config/fish/conf.d/done.fish

# =============================================================================
# Greeting & Startup Banner
# =============================================================================
function fish_greeting
    microfetch
    echo "Welcome back, Abhijeet"
end

# =============================================================================
# Man Pages & Pager
# =============================================================================
# Improve man page readability using bat
set -x MANROFFOPT -c
set -x MANPAGER "sh -c 'col -bx | bat -l man -p'"

# =============================================================================
# DONE Plugin — Optional Overrides
# =============================================================================
# Minimum duration (ms) before notification triggers
set -U __done_min_cmd_duration 10000

# Notification urgency: low | normal | critical
set -U __done_notification_urgency_level low

# =============================================================================
# Environment Bootstrap
# =============================================================================
# Load optional personal profile (PATH overrides, secrets, etc.)
if test -f ~/.fish_profile
    source ~/.fish_profile
end

# =============================================================================
# PATH Management
# =============================================================================
# Add common binary directories if they exist
for dir in \
    ~/.local/bin \
    ~/Applications/depot_tools \
    /usr/local/bin \
    $HOME/.cargo/bin
    if test -d $dir
        if not contains -- $dir $PATH
            set -p PATH $dir
        end
    end
end

# =============================================================================
# Key Bindings — !! and !$ History Expansion
# =============================================================================
function __history_previous_command
    switch (commandline -t)
        case "!"
            commandline -t $history[1]
            commandline -f repaint
        case "*"
            commandline -i !
    end
end

function __history_previous_command_arguments
    switch (commandline -t)
        case "!"
            commandline -t ""
            commandline -f history-token-search-backward
        case "*"
            commandline -i '$'
    end
end

# Bind keys depending on keybinding mode
if test "$fish_key_bindings" = fish_vi_key_bindings
    bind -Minsert ! __history_previous_command
    bind -Minsert '$' __history_previous_command_arguments
else
    bind ! __history_previous_command
    bind '$' __history_previous_command_arguments
end

# =============================================================================
# Custom Functions
# =============================================================================

# Show command history with timestamps
function history
    builtin history --show-time='%F %T '
end

# Backup a file to <filename>.bak
function backup --argument filename
    cp $filename $filename.bak
end

# Smart copy: recursive if source is a directory
function copy
    set count (count $argv | tr -d \n)

    if test "$count" = 2; and test -d "$argv[1]"
        set from (echo $argv[1] | trim-right /)
        set to (echo $argv[2])
        command cp -r $from $to
    else
        command cp $argv
    end
end

# =============================================================================
# Aliases
# =============================================================================

# -------------------------------- Listing -------------------------------- #
alias ls='eza -al --color=always --group-directories-first --icons'
alias la='eza -a  --color=always --group-directories-first --icons'
alias ll='eza -l  --color=always --group-directories-first --icons'
alias lt='eza -aT --color=always --group-directories-first --icons'
alias l.="eza -a | grep -e '^\.'"

# -------------------------------- System --------------------------------- #
alias clr="clear && cd && microfetch"
alias update="sudo pacman -Syu"
alias clean="sudo pacman -Scc"
alias remove="sudo pacman -Rns"
alias search="pacman -Ss"
alias mirror="sudo cachyos-rate-mirrors"
alias fixpacman="sudo rm /var/lib/pacman/db.lck"
alias grubup="sudo grub-mkconfig -o /boot/grub/grub.cfg"
alias cleanup='sudo pacman -Rns (pacman -Qtdq)'
alias jctl="journalctl -p 3 -xb"

alias tarnow='tar -acf '
alias untar='tar -zxvf '
alias psmem='ps auxf | sort -nr -k 4'
alias psmem10='ps auxf | sort -nr -k 4 | head -10'
alias hw='hwinfo --short'
alias big="expac -H M '%m\t%n' | sort -h | nl"
alias gitpkg='pacman -Q | grep -i "\-git" | wc -l'
alias tb='nc termbin.com 9999'
alias rip="expac --timefmt='%Y-%m-%d %T' '%l\t%n %v' | sort | tail -200 | nl"

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'

alias dir='dir --color=auto'
alias vdir='vdir --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias please='sudo'

# -------------------------------- Apps ----------------------------------- #
alias ly='yazi'
alias wget='wget -c'

# -------------------------------- Git ------------------------------------ #
alias gi='git init'
alias ga='git add'
alias gc='git commit'
alias gp='git push'
alias gl='git pull'
alias gs='git status'
alias gd='git diff'
alias gb='git branch'
alias gco='git checkout'

# =============================================================================
# Prompt & Navigation Tools
# =============================================================================
starship init fish | source
zoxide init fish | source

# Autojump (if installed)
if type -q autojump
    source (autojump init fish | psub)
end

# =============================================================================
# Default Applications
# =============================================================================
set -gx BROWSER zen-browser
set -gx EDITOR nvim
set -gx VISUAL nvim

# =============================================================================
# XDG Base Directories
# =============================================================================
set -gx XDG_CONFIG_HOME "$HOME/.config"
set -gx XDG_CACHE_HOME "$HOME/.cache"
set -gx XDG_DATA_HOME "$HOME/.local/share"
set -gx XDG_STATE_HOME "$HOME/.local/state"

# =============================================================================
# History Configuration
# =============================================================================
set -gx HISTSIZE 50000
set -gx SAVEHIST 50000
set -gx HISTFILE "$XDG_STATE_HOME/history"

# =============================================================================
# Java (Optional)
# =============================================================================
set -Ux JAVA_HOME /usr/lib/jvm/java-17-openjdk
set -Ux PATH $JAVA_HOME/bin $PATH

# =============================================================================
# SSH Agent (Optional)
# =============================================================================
if not pgrep -u (whoami) ssh-agent >/dev/null
    eval (ssh-agent -c)
end

ssh-add -l >/dev/null 2>&1; or ssh-add ~/.ssh/id_ed25519
