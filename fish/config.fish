set -U fish_greeting

set -x LC_ALL en_US.UTF-8

set -x GIT_EDITOR "nvim"
set -x EDITOR "nvim"
set -x VISUAL "nvim"
set -x MANPAGER "nvim -c 'set ft=man' -"

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
    atuin init fish | source
end

if type -q zoxide
    zoxide init fish | source
end

if type -q starship
    starship init fish | source
end

if type -q mise
    mise activate fish | source
end

alias l="ls -a"
alias ll="ls -la"
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

function ef --description "Skim through files and open them in nvim"
    rg --files | sk --preview="bat {} --color=always" | xargs -r nvim
end

function eg --description "Skim through lines and open them in nvim"
    sk -m --ansi -i -c 'rg --line-number  "{}"'| awk -F':' '{print "+"$2, $1}' | xargs -r nvim
end
