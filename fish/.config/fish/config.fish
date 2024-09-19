if not status is-interactive
    return 0
end

set -U fish_greeting
#set -g fish_key_bindings fish_vi_key_bindings

set -x LC_ALL en_US.UTF-8

set -gx XDG_CONFIG_HOME $HOME/.config
set -gx XDG_DATA_HOME $HOME/.local/share
set -gx XDG_CACHE_HOME $HOME/.cache
set -gx XDG_STATE_HOME $HOME/.local/state

set -x GOPATH $HOME

set -x PATH /usr/local/bin /usr/local/sbin /usr/bin /bin /usr/sbin /sbin

if test -d $HOME/bin
    set -x PATH $PATH $HOME/bin
end

if test -d /opt/homebrew/bin
    set -x PATH $PATH /opt/homebrew/bin
end

if test -d $HOME/go/bin
    set -x PATH $PATH $HOME/go/bin
end

if test -d $HOME/.cargo/bin
    set -x PATH $PATH $HOME/.cargo/bin
end

if test -d $HOME/.local/share/ocaml
    set -x PATH $PATH $HOME/.local/share/ocaml
end

if test -f $HOME/.opam/opam-init/init.fish
    source $HOME/.opam/opam-init/init.fish >/dev/null 2>/dev/null; or true
end

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

if type -q thefuck
    thefuck --alias | source
end

if command -v eza >/dev/null
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
