all:
    stow --verbose --target=$HOME --restow */

delete:
    stow --verbose --target=$HOME --delete */

fmt:
    fish_indent -w fish/.config/fish/**/*.fish
    stylua nvim/.config/nvim/
