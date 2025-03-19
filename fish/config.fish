if status is-interactive

    # ───────────────────────────[ Bang Bang command ]─────────────────────────── #

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

    bind ! __history_previous_command
    bind '$' __history_previous_command_arguments

    # ───────────────────────────[ Aliases ]─────────────────────────── #

    alias ls "eza --icons --git --group-directories-first"
    alias la "eza -a --icons --git --group-directories-first"
    alias lt "eza -lah --icons --color --no-user --git -T -L 3 --ignore-glob='.git' --group-directories-first"
    alias lf yazi
   #alias rm trash

    # Quick navigation
    alias .. "cd .."
    alias ... "cd ../.."
    alias .... "cd ../../.."
    alias ..... "cd ../../../.."

    # Quick access
    # alias e thunar
    # alias x exit
    # alias lg lazy
    

    # SSH-agent
      function start_ssh_agent
      if not pgrep ssh-agent > /dev/null
          eval (ssh-agent -c)
          ssh-add ~/.ssh/id_rsa
      end
     end
     start_ssh_agent


    # System & fun
    alias clr "clear && fastfetch"
    alias ttc "tty-clock -SsctC5"

    # ───────────────────────────[ Network ]─────────────────────────── #
    
    alias wl "nmcli device wifi list"
    alias sw "nmcli device wifi show"

    # Tmux shortcuts
    alias dot "tmux-sessionizer ~/.dotfiles"
    alias tns "tmux new -s"
    alias tas "tmux attach -t"
    alias tls "tmux list-sessions"
    alias tds "tmux detach"
    bind \cf tmux-sessionizer

    # ───────────────────────────[ PATH Configuration ]─────────────────────────── #
    fish_add_path "$HOME/.local/scripts/" "/usr/local/bin"

    set -gx PATH $JAVA_HOME $PATH
    set -gx BROWSER zen-browser

    # ───────────────────────────[ Starship Prompt ]─────────────────────────── #
    starship init fish | source

    # ───────────────────────────[ Zoxide for Smart Navigation ]─────────────────────────── #
    zoxide init fish | source
    
    # ───────────────────────────[ Anaconda ]───────────────────────────>
    #anaconda init fish | source /home/masubhaat/anaconda3/bin/activate
    
end

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!

if test -f /home/masubhaat/anaconda3/bin/conda
    eval /home/masubhaat/anaconda3/bin/conda "shell.fish" "hook" $argv | source
else
    if test -f "/home/masubhaat/anaconda3/etc/fish/conf.d/conda.fish"
        . "/home/masubhaat/anaconda3/etc/fish/conf.d/conda.fish"
    else
        set -x PATH "/home/masubhaat/anaconda3/bin" $PATH
    end
end

# <<< conda initialize <<<

