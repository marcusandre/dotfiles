all:
	@/opt/homebew/bin/stow --verbose --target=$$HOME --restow */

delete:
	@stow --verbose --target=$$HOME --delete */
