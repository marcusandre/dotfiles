all:
    /opt/homebrew/bin/stow --verbose --target=$HOME --restow */

delete:
    stow --verbose --target=$HOME --delete */

fmt:
    fish_indent -w fish/.config/fish/config.fish
    stylua ./nvim/.config/nvim/**/*.lua
