# ╭────────────────────────────[ System & Fun ]────────────────────────────╮ #

alias clr="clear && cd && fastfetch"
alias update="sudo pacman -Syu"
alias clean="sudo pacman -Scc"
alias remove="sudo pacman -Rns"
alias search="pacman -Ss"
alias ls="ls --color=auto"
alias ly="yazi"

# ╰────────────────────────────────────────────────────────────────────────╯ #

# ╭──────────────────────────[ Development Shortcuts ]─────────────────────╮ #

# Git Aliases
alias gi="git init"
alias ga="git add"
alias gc="git commit"
alias gp="git push"
alias gl="git pull"
alias gs="git status"
alias gd="git diff"
alias gb="git branch"
alias gco="git checkout"

# ╰────────────────────────────────────────────────────────────────────────╯ #

# ╭──────────────────────────[ PATH Configuration ]────────────────────────╮ #

for dir in /usr/local/bin \
    $HOME/.local/bin \
    $HOME/.cargo/bin
    fish_add_path $dir
end

# ╰────────────────────────────────────────────────────────────────────────╯ #

# ╭──────────────────────────[ Default Apps ]──────────────────────────────╮ #

set -gx BROWSER zen-browser
set -gx EDITOR nvim
set -gx VISUAL nvim

# ╰────────────────────────────────────────────────────────────────────────╯ #

# ╭──────────────────────────[ Starship Prompt ]───────────────────────────╮ #

starship init fish | source

# ╰────────────────────────────────────────────────────────────────────────╯ #

# ╭──────────────────────────[ Zoxide Navigation ]─────────────────────────╮ #

zoxide init fish | source

# ╰────────────────────────────────────────────────────────────────────────╯ #

# ╭──────────────────────────[ Environment Variables ]─────────────────────╮ #

set -gx XDG_CONFIG_HOME "$HOME/.config"
set -gx XDG_CACHE_HOME "$HOME/.cache"
set -gx XDG_DATA_HOME "$HOME/.local/share"
set -gx XDG_STATE_HOME "$HOME/.local/state"

# ╰────────────────────────────────────────────────────────────────────────╯ #

# ╭──────────────────────────[ History Configuration ]─────────────────────╮ #

set -gx HISTSIZE 50000
set -gx SAVEHIST 50000
set -gx HISTFILE "$XDG_STATE_HOME/history"

# ╰────────────────────────────────────────────────────────────────────────╯ #

# ╭──────────────────────────[ Extra Enhancements ]────────────────────────╮ #

# Autojump (if installed) — alternative to zoxide
if type -q autojump
    source (autojump init fish | psub)
end

# Custom greeting message
function fish_greeting
    echo "Welcome back, Abhijeet"
end

# ╰────────────────────────────────────────────────────────────────────────╯ #

# ╭──────────────────────────[ Spicetify]────────────────────────╮ #

fish_add_path /home/masubhaat/.spicetify

# ╰────────────────────────────────────────────────────────────────────────╯ #

# ╭──────────────────────────[ Java Configuration Path]────────────────────────╮ #

# Java PATH
#set -Ux JAVA_HOME /usr/lib/jvm/java-17-openjdk
#set -Ux PATH $JAVA_HOME/bin $PATH

# ╰────────────────────────────────────────────────────────────────────────╯ #

# ╭──────────────────────────[ Git Setup]────────────────────────╮ #

# Start SSH Agent
#if not pgrep -u (whoami) ssh-agent >/dev/null
#eval (ssh-agent -c)
#end

#ssh-add -l >/dev/null 2>&1
#if test $status -ne 0
#ssh-add ~/.ssh/id_ed25519
#end

# ╰────────────────────────────────────────────────────────────────────────╯ #
