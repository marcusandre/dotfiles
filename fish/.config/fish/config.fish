if not status is-interactive
    return 0
end

set -U fish_greeting
set -x LC_ALL en_US.UTF-8

set -gx XDG_CACHE_HOME $HOME/.cache
set -gx XDG_CONFIG_HOME $HOME/.config
set -gx XDG_DATA_HOME $HOME/.local/share
set -gx XDG_STATE_HOME $HOME/.local/state

fish_add_path -mg /usr/local/bin
fish_add_path -mg /opt/homebrew/bin
fish_add_path -mg $HOME/.local/share/bob/nvim-bin
fish_add_path -mg $HOME/go/bin
fish_add_path -mg $HOME/.cargo/bin
fish_add_path -mg $HOME/bin

alias ll='ls -l'

alias d="git diff --stat"
alias s="git status -s"
alias gd="git diff"
alias gl="git ll"
alias gp="git push"
alias gg='nvim -c "Neogit"'
alias gu="git upgrade"
alias gr="cd (git rev-parse --show-toplevel)"
alias gap="git add . -p"
