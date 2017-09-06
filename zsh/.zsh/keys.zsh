#
# Key Bindings
#

bindkey -v

# Open the current line in Vim
autoload -U edit-command-line
bindkey -M vicmd v edit-command-line
zle -N edit-command-line

# Push the current line to buffer stack and return to PS1
bindkey "^Q" push-input

# Search forward/backward through the history
bindkey '^N' history-search-forward
bindkey '^P' history-search-backward

# Move between beginning and end of line
bindkey '^A' beginning-of-line
bindkey '^E' end-of-line

# Jump from word to word
bindkey "^F" emacs-forward-word
bindkey "^B" emacs-backward-word

# Normalize weird backspace behaviour
bindkey '^?' backward-delete-char
bindkey '^[[3~' delete-char
