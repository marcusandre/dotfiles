#
# Zsh
#

# Register Hooks
autoload -U add-zsh-hook

# Load completions
if [ -d /usr/local/share/zsh-completions ]; then
  fpath=(/usr/local/share/zsh-completions $fpath)
fi

# Load all configuration files
for config (~/.zsh/*.zsh); do
  source $config
done

# Check if zplug is installed
if [[ ! -d ~/.zplug ]]; then
  git clone https://github.com/zplug/zplug ~/.zplug
  source ~/.zplug/init.zsh && zplug update --self
fi

# Initialize zplug
source ~/.zplug/init.zsh

# Install and manage plugins
zplug "rupa/z", use:z.sh
zplug "mafredri/zsh-async", from:github
zplug "sindresorhus/pure", use:pure.zsh, from:github, as:theme
zplug "zsh-users/zsh-syntax-highlighting"

# Install packages that have not been installed yet
if ! zplug check --verbose; then
  printf "Install? [y/N]: "
  if read -q; then
    echo; zplug install
  else
    echo
  fi
fi

# Apply plugins
zplug load

# Load and activate fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
