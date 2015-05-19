autoload -U compinit promptinit colors select-word-style url-quote-magic zmv
zle -N self-insert url-quote-magic
select-word-style bash
compinit -i
promptinit

# history
export HISTFILE=~/.zsh/histfile
export HISTSIZE=10000
export SAVEHIST=500000
# readonly HISTFILE
setopt hist_ignore_space
setopt append_history
setopt hist_ignore_dups
setopt share_history
setopt extendedglob

# environment setup
export EDITOR=vim
export VISUAL=vim
export PAGER=less

# prompt
setopt prompt_subst

PROMPT='
%{%F{magenta}%}%n%{%f%F{white}%} @ %{%f%F{yellow}%}%m%{%f%F{white}%} : %{%f%F{green}%}%6~%{%f%}
%{%(!.%F{red}%}#%{.%F{white}%}$%{)%f%} '

# Navigation
alias ..="cd .."

# Directory Listings
alias ls="ls -GFh"
alias la="ls -la"

# Misc
alias cp="cp -iv"
alias mv="mv -iv"
alias rm="rm -iv"
alias rf="rm -rf"
alias sudo="sudo "
alias week="date +%V"
alias m="make "
alias s="subl ."
alias ip="ifconfig | grep 'inet ' | grep -v 127.0.0.1 | cut -d\   -f2"
alias myip="curl icanhazip.com"
alias rmds="find . -name \".DS_Store\" | xargs rm"

# Git aliases
alias gl="git log --pretty=oneline --abbrev-commit --graph --decorate"
alias gd="git diff"
alias ga="git add"
alias gst="git status"
alias gs="git status -sb"
alias gca="git commit -a"
alias gcm="git checkout master"
alias gm="git merge --no-ff"
alias gpt="git push --tags"
alias gp="git push"
alias gpa="git push --all"
alias gu="git checkout -- ."
alias grh="git reset --hard"
alias gco="git checkout"
alias gba="git branch -a"
alias gfp="git fetch origin --prune"
alias gr='cd "$(git rev-parse --show-toplevel)"'

# Vagrant aliases
alias vup="vagrant up"
alias vha="vagrant halt"
alias vst="vagrant status"
alias vdf="vagrant destroy -f; rm -rf .vagrant"

# zsh-completions
fpath=(/usr/local/share/zsh-completions $fpath)

# z
. `brew --prefix`/etc/profile.d/z.sh
