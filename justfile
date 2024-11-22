all:
    @/opt/homebrew/bin/stow --no-folding --target=$HOME --restow */

delete:
    @/opt/homebrew/bin/stow --target=$HOME --delete */
