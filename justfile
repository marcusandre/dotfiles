all:
    @/opt/homebrew/bin/stow --no-folding --verbose --target=$HOME --restow */

delete:
    @/opt/homebrew/bin/stow --verbose --target=$HOME --delete */
