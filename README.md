# Dotfiles

My personal configuration files managed with GNU Stow.

## What's Included

- **Neovim**: LazyVim configuration with Rose Pine theme and modern LSP setup
- **Ghostty**: Terminal emulator with Rose Pine Moon theme and transparency
- **Git**: Global git configuration with aliases and settings
- **Zsh**: Shell configuration with Prezto framework
- **Bat**: Syntax highlighting for `cat` command
- **EditorConfig**: Consistent coding styles across editors

## Quick Start

1. **Install dependencies**:

   ```bash
   brew bundle install
   ```

2. **Stow all configurations**:

   ```bash
   make stow
   ```

3. **Install Prezto** (if not already installed):

   ```bash
   git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
   ```

## Makefile Commands

The included Makefile provides convenient commands for managing your dotfiles:

- `make stow` - Install all dotfiles by creating symlinks
- `make unstow` - Remove all symlinks
- `make restow` - Refresh all symlinks (unstow + stow)
- `make dry-run` - Preview changes without applying them
- `make clean` - Remove broken symlinks from home directory

## Manual Setup

If you prefer manual control over individual packages:

```bash
# Install individual packages
stow -t ~ nvim
stow -t ~ ghostty
stow -t ~ git

# Or install everything at once
stow -t ~ */

# Remove a specific package
stow -t ~ -D nvim
```

## Directory Structure

Each directory represents a "package" that gets symlinked to your home directory:

```
dotfiles/
├── nvim/.config/nvim/           → ~/.config/nvim/
├── ghostty/.config/ghostty/     → ~/.config/ghostty/
├── git/.gitconfig               → ~/.gitconfig
├── zsh/.zpreztorc               → ~/.zpreztorc
├── bat/.config/bat/             → ~/.config/bat/
├── editorconfig/.editorconfig   → ~/.editorconfig
└── Makefile                     # Convenience commands
```

## Requirements

- macOS (tested on latest versions)
- [Homebrew](https://brew.sh/)
- GNU Stow (installed via `brew bundle install`)
- Zsh shell

## Customization

### Neovim

The Neovim configuration uses LazyVim as a base. Customize by editing files in `nvim/.config/nvim/lua/`:

- `plugins/plugins.lua` - Add or modify plugins
- `config/options.lua` - Vim options and settings
- `config/keymaps.lua` - Custom key mappings

### Ghostty

Theme and appearance settings are in `ghostty/.config/ghostty/config`. The Rose Pine Moon theme provides a cohesive look with Neovim.

### Git

Global git settings are in `git/.gitconfig`. Add your personal information:

```bash
git config --global user.name "Your Name"
git config --global user.email "your.email@example.com"
```

## Troubleshooting

### Stow Conflicts

If stow reports conflicts, you may have existing files. Either:

1. Back up and remove conflicting files
2. Use `make clean` to remove broken symlinks
3. Use `make restow` to refresh everything

### Neovim Issues

- Ensure LazyVim plugins are installed: `:Lazy sync`
- Check for errors: `:checkhealth`
- Update plugins: `:Lazy update`

## Credits and Inspiration

- [ThePrimeagen's 0 to LSP : Neovim RC From Scratch](https://youtu.be/w7i4amO_zaE)
- [LazyVim](https://github.com/LazyVim/LazyVim) - Neovim configuration framework
- [Rose Pine](https://rosepinetheme.com/) - Color scheme
- [mathias](https://github.com/mathiasbynens/dotfiles/)
- [alrra](https://github.com/alrra/dotfiles/)
- [paulmillr](https://github.com/paulmillr/dotfiles)

## License

This project is licensed under the MIT License.

