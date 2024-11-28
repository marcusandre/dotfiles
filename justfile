all:
    @/opt/homebrew/bin/stow --verbose --target=$HOME --restow */

delete:
    @/opt/homebrew/bin/stow --verbose --target=$HOME --delete */

fmt:
    @stylua nvim/.config/nvim/ -v
