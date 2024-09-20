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
fish_add_path -mg $HOME/go/bin
fish_add_path -mg $HOME/.cargo/bin
fish_add_path -mg $HOME/bin

set -x GOPATH $HOME

if type -q nvim
    set -gx EDITOR nvim
    set -gx VISUAL nvim
    set -gx MANPAGER 'nvim +Man!'
else
    set -gx EDITOR vim
end

if type -q fzf
    fzf --fish | source

    if command -sq bat
        set -gx FZF_CTRL_T_OPTS "--ansi --preview 'bat -f -p --line-range :300 {}'"
    else
        set -gx FZF_CTRL_T_OPTS "--preview 'cat {}'"
    end
end

# Homebrew
set -gx HOMEBREW_NO_EMOJI 1
set -gx HOMEBREW_NO_ANALYTICS 1

if type -q atuin
    atuin init fish --disable-up-arrow | source
end

if type -q rg
    set -gx RIPGREP_CONFIG_PATH $XDG_CONFIG_HOME/ripgrep/.ripgreprc
end

if type -q zoxide
    zoxide init fish | source
end

if type -q jj
    set -x JJ_CONFIG ~/.config/jj/config.toml
    jj util completion fish | source
end

if type -q direnv
    direnv hook fish | source
end

if type -q mise
    mise activate fish | source
end

if type -q eza
    alias ls='eza --icons'
    alias ll='eza -la --icons'
else
    alias ll='ls -l'
end

alias d="git diff --stat"
alias s="git status -s"
alias gd="git diff"
alias gl="git ll"
alias gp="git push"
alias gg='nvim -c "Neogit"'
alias gu="git upgrade"
alias gr="cd (git rev-parse --show-toplevel)"
alias gap="git add . -p"
