# == ENVIRONMENT
if [[ -f $HOME/.private.zsh ]]; then
  source $HOME/.private.zsh
fi

# == PATH
export WORK="$HOME/Developer"
export GOPATH="$HOME/go"
export PATH="$HOME/bin:$PATH:/usr/local/sbin:$GOPATH/bin:/usr/local/opt/go/libexec/bin"

[ -d $WORK/homebrew/bin ] && export PATH="$WORK/homebrew/bin:$PATH"

export NVM_DIR="$HOME/.nvm"
[ -s "$(brew --prefix)/opt/nvm/nvm.sh" ] && \. "$(brew --prefix)/opt/nvm/nvm.sh"
[ -s "$(brew --prefix)/opt/nvm/etc/bash_completion.d/nvm" ] && \. "$(brew --prefix)/opt/nvm/etc/bash_completion.d/nvm"

# == FZF

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# == Z

[ -f /usr/local/etc/profile.d/z.sh ] && source /usr/local/etc/profile.d/z.sh

# == EDITOR
export EDITOR=vim
