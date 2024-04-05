set -U fish_greeting
# set -g fish_key_bindings fish_vi_key_bindings

set -x LC_ALL en_US.UTF-8

set -x GIT_EDITOR "nvim"
set -x EDITOR "nvim"
set -x VISUAL "nvim"
set -x PAGER "moar"

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

if type -q atuin
    atuin init fish --disable-up-arrow | source
end

if type -q zoxide
    zoxide init fish | source
end

if type -q jj
    jj util completion fish | source
end

if type -q starship
    starship init fish | source
end

if type -q mise
    mise activate fish | source
end

if command -v eza > /dev/null
    alias l='eza'
    alias ls='eza'
    alias ll='eza -l'
    alias lll='eza -la'
else
    alias l='ls'
    alias ll='ls -l'
    alias lll='ls -la'
end

alias cat='bat --paging=never'
alias rf="rm -fr"
alias e="nvim"

alias d="git diff --stat"
alias s="git status -s"
alias gd="git diff"
alias gl="git ll"
alias gp="git push"
alias gu="git upgrade"
alias gr="cd (git rev-parse --show-toplevel)"
alias gap="git add . -p"

function less
    command less -i -M -R -S -X -F $argv
end

function mkdir
    command mkdir -p $argv
end

function md -d "Create a new directory and cd into it"
    mkdir -p -- $argv
    if test $status = 0
        cd $argv
    end
end

function t -d "List directory as tree with n levels"
    eza --tree --level=$argv
end

function ef -d "Skim through files and open them in nvim"
    rg --files | sk --preview="bat {} --color=always" | xargs -r nvim
end

function eg -d "Skim through lines and open them in nvim"
    sk -m --ansi -i -c 'rg --line-number  "{}"'| awk -F':' '{print "+"$2, $1}' | xargs -r nvim
end
