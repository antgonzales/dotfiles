.PHONY: stow unstow restow clean

# Stow all dotfiles
stow:
	stow -t ~ bat editorconfig ghostty git nvim zsh

# Unstow all dotfiles
unstow:
	stow -t ~ -D bat editorconfig ghostty git nvim zsh

# Restow (unstow then stow) all dotfiles
restow:
	stow -t ~ -R bat editorconfig ghostty git nvim zsh

# Clean broken symlinks in home directory
clean:
	find ~ -maxdepth 3 -type l -exec test ! -e {} \; -delete 2>/dev/null || true

# Show what would be stowed
dry-run:
	stow -t ~ -n bat editorconfig ghostty git nvim zsh