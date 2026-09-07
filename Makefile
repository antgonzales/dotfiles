.PHONY: stow unstow restow clean dry-run

# Stow all dotfiles
stow:
	stow -t ~ ai bat editorconfig ghostty git nvim tmux zsh

# Unstow all dotfiles
unstow:
	stow -t ~ -D ai bat editorconfig ghostty git nvim tmux zsh

# Restow (unstow then stow) all dotfiles
restow:
	stow -t ~ -R ai bat editorconfig ghostty git nvim tmux zsh

# Clean broken symlinks in home directory
clean:
	find ~ -maxdepth 3 -type l -exec test ! -e {} \; -delete 2>/dev/null || true

# Show what would be stowed
dry-run:
	stow -t ~ -n ai bat editorconfig ghostty git nvim tmux zsh
