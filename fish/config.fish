# ───────────────────────────[ System & Fun ]─────────────────────────── #

alias clr "clear && fastfetch"

# ───────────────────────────[ Network ]─────────────────────────── #

alias wl "nmcli device wifi list"
alias sw "nmcli device wifi show"

# ───────────────────────────[ Aliases ]─────────────────────────── #

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

# ───────────────────────────[ Tmux Shortcuts ]─────────────────────────── #

alias dot "tmux-sessionizer ~/.dotfiles"
alias tns "tmux new -s"
alias tas "tmux attach -t"
alias tls "tmux list-sessions"
alias tds "tmux detach"

# Bind Ctrl-f to tmux-sessionizer
bind \cf tmux-sessionizer

# ───────────────────────────[ PATH Configuration ]─────────────────────────── #

fish_add_path "/usr/local/bin"
set -gx PATH $JAVA_HOME $PATH
set -gx BROWSER zen-browser

# ───────────────────────────[ Starship Prompt ]─────────────────────────── #

starship init fish | source

# ───────────────────────────[ Zoxide for Smart Navigation ]─────────────────────────── #

zoxide init fish | source

# ───────────────────────────[ Conda Initialization ]─────────────────────────── #

# !! Contents within this block are managed by 'conda init' !!

if test -f /home/masubhaat/miniconda3/bin/conda
    eval /home/masubhaat/miniconda3/bin/conda "shell.fish" "hook" $argv | source
else if test -f "/home/masubhaat/miniconda3/etc/fish/conf.d/conda.fish"
    source "/home/masubhaat/miniconda3/etc/fish/conf.d/conda.fish"
else
    set -x PATH "/home/masubhaat/miniconda3/bin" $PATH
end

# <<< conda initialize <<< 
