# navigation
alias ..="cd .."
alias -="cd -"

# listing
alias ls="ls -GFh"
alias la="ls -la"
alias lh="ls -lah"
alias ls1="ls -1"

# misc
alias cp="cp -iv"
alias mv="mv -iv"
alias rm="rm -iv"
alias rf="rm -rf"
alias sudo="sudo "
alias week="date +%V"
alias m="make "
alias s="subl ."
alias ngrep="grep --line-number --color"
alias pubkey="more ~/.ssh/id_rsa.pub | pbcopy | printf '=> Public key copied to clipboard.\n'"
alias ip="ifconfig | grep 'inet ' | grep -v 127.0.0.1 | cut -d\   -f2"
alias rmds="find . -name \".DS_Store\" | xargs rm"
alias npw="pwgen -Bs 16 1"
alias godeps="go get ./.."

# git aliases
alias gl="git log --pretty=oneline --abbrev-commit --graph --decorate"
alias gd="git diff"
alias ga="git add"
alias gst="git status"
alias gs="git status -sb"
alias gbd="git branch -D"
alias gca="git commit -a -m"
alias gm="git merge --no-ff"
alias gpt="git push --tags"
alias gp="git push"
alias gpa="git push --all"
alias gu="git checkout -- ."
alias grh="git reset --hard"
alias gco="git checkout"
alias gba="git branch -a"
alias gfp="git fetch origin --prune"

# docker aliases
alias dst="docker stop (docker ps -a -q)"
alias drm="docker rm (docker ps -a -q)"
alias drmi="docker rmi (docker images -q)"
alias dclean="dst; drm; drmi"

# vagrant aliases
alias vup="vagrant up"
alias vha="vagrant halt"
alias vst="vagrant status"
alias vdf="vagrant destroy -f; rm -rf .vagrant"
