# ───────────────────────────[ System & Fun ]─────────────────────────── #

alias clr "clear && fastfetch"
alias update "sudo pacman -Syu"
alias clean "sudo pacman -Scc"
alias remove "sudo pacman -Rns"
alias search "pacman -Ss"

# ───────────────────────────[ Network ]─────────────────────────── #

alias wl "nmcli device wifi list"
alias sw "nmcli device wifi show"
alias wifi "nmcli device wifi connect"
alias wd "nmcli device wifi disconnect"

# ───────────────────────────[ File Management ]─────────────────────────── #

alias ls "eza --icons --git --group-directories-first"
alias la "eza -a --icons --git --group-directories-first"
alias lt "eza -lah --icons --color --no-user --git -T -L 3 --ignore-glob='.git' --group-directories-first"
alias ly yazi
alias .. "cd .."
alias ... "cd ../.."
alias .... "cd ../../.."
alias ..... "cd ../../../.."
alias e thunar
alias x exit
alias cp "cp -i"
alias mv "mv -i"
alias rm "rm -i"
alias mkdir "mkdir -p"

# ───────────────────────────[ Development ]─────────────────────────── #

alias g "git"
alias ga "git add"
alias gc "git commit"
alias gp "git push"
alias gl "git pull"
alias gs "git status"
alias gd "git diff"
alias gb "git branch"
alias gco "git checkout"

# ───────────────────────────[ Tmux Shortcuts ]─────────────────────────── #

alias dot "tmux-sessionizer ~/.dotfiles"
alias tns "tmux new -s"
alias tas "tmux attach -t"
alias tls "tmux list-sessions"
alias tds "tmux detach"
alias tk "tmux kill-session -t"

# Bind Ctrl-f to tmux-sessionizer
bind \cf tmux-sessionizer

# ───────────────────────────[ PATH Configuration ]─────────────────────────── #

fish_add_path "/usr/local/bin"
fish_add_path "$HOME/.local/bin"
fish_add_path "$HOME/.cargo/bin"
set -gx PATH $JAVA_HOME $PATH
set -gx BROWSER zen-browser
set -gx EDITOR nvim
set -gx VISUAL nvim
set -gx TERMINAL alacritty

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

set -gx HISTSIZE 10000
set -gx SAVEHIST 10000
set -gx HISTFILE "$XDG_STATE_HOME/history"
