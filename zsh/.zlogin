# == ENVIRONMENT
if [[ -f $HOME/.private.zsh ]]; then
  source $HOME/.private.zsh
fi

# == PATH
export GOPATH="$HOME/go"
export PATH="$HOME/bin:$PATH:/usr/local/sbin:$GOPATH/bin:/usr/local/opt/go/libexec/bin"

# == FZF

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# == Z

[ -f /usr/local/etc/profile.d/z.sh ] && source /usr/local/etc/profile.d/z.sh

# == EDITOR
export EDITOR=vim
