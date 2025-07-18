# ───────────────────────────[ System & Fun ]─────────────────────────── #

alias clr "clear && cd && fastfetch"
alias update "sudo pacman -Syu"
alias clean "sudo pacman -Scc"
alias remove "sudo pacman -Rns"
alias search "pacman -Ss"
alias ly "yazi"
# ───────────────────────────[ Development ]─────────────────────────── #

alias g git
alias ga "git add"
alias gc "git commit"
alias gp "git push"
alias gl "git pull"
alias gs "git status"
alias gd "git diff"
alias gb "git branch"
alias gco "git checkout"

# ───────────────────────────[ PATH Configuration ]─────────────────────────── #

fish_add_path /usr/local/bin
fish_add_path "$HOME/.local/bin"
fish_add_path "$HOME/.cargo/bin"
set -gx BROWSER zen-browser
set -gx EDITOR nvim
set -gx VISUAL nvim

# ───────────────────────────[ Starship Prompt ]─────────────────────────── #

starship init fish | source

# ───────────────────────────[ Zoxide for Smart Navigation ]─────────────────────────── #

zoxide init fish | source

# ───────────────────────────[ Environment Variables ]─────────────────────────── #

set -gx XDG_CONFIG_HOME "$HOME/.config"
set -gx XDG_CACHE_HOME "$HOME/.cache"
set -gx XDG_DATA_HOME "$HOME/.local/share"
set -gx XDG_STATE_HOME "$HOME/.local/state"

# ───────────────────────────[ History Configuration ]─────────────────────────── #

set -gx HISTSIZE 50000
set -gx SAVEHIST 50000
set -gx HISTFILE "$XDG_STATE_HOME/history"

# ───────────────────────────[ JAVA-PATH Configuration ]─────────────────────────── #
set -Ux JAVA_HOME /usr/lib/jvm/java-24-openjdk
set -Ux PATH $JAVA_HOME/bin $PATH
