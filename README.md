# Dotfiles

My personal configuration files managed with GNU Stow.

## What's Included

- **AI tools**: Shared Caveman skills and Ponytail preferences for Codex and Claude Code
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

## AI skills and Ponytail

`make stow` links the `ai` package along with the other configurations:

- `ai/.agents/skills/` holds a snapshot of all 20 installed Caveman skills.
- `ai/.claude/skills/` links each skill to the shared `.agents` copy, so Codex
  and Claude Code use the same files. Supporting scripts are included.
- `ai/.config/ponytail/config.json` sets Ponytail's default mode to `full`
  for both applications. `PONYTAIL_DEFAULT_MODE`, when set, overrides it.

Caveman remains available on demand: `$caveman` in Codex or `/caveman` in
Claude Code. Saving the skills does not enable Caveman automatically.

### Install Ponytail

Install the host applications separately and ensure Node.js is on the PATH
available to their hooks. The tested Ponytail version is **4.9.0**; these
commands install the marketplace's available version, not a pinned snapshot.

In a terminal, install for Codex:

```bash
codex plugin marketplace add DietrichGebert/ponytail
codex plugin add ponytail@ponytail
```

In Codex, open `/hooks`, review and trust Ponytail's hooks, then start a new
thread. Restart the Codex desktop app if it is running.

Inside Claude Code, submit each command as a separate prompt:

```text
/plugin marketplace add DietrichGebert/ponytail
/plugin install ponytail@ponytail
```

Ponytail's source is https://github.com/DietrichGebert/ponytail.
Keep plugin caches, hook trust records, credentials, and session state local;
only the shared preferences and this installation recipe belong in dotfiles.

### Existing installations and updates

Before first stowing on an existing machine, back up conflicting skill folders
and Ponytail configuration outside the repository, then replace them with the
Stow links. Run `make dry-run` before `make stow`; do not overwrite unrelated
skills or application settings. `make unstow` removes links without deleting
the tracked snapshots. Restore the backups after unstowing to undo a migration.

Update Caveman deliberately: obtain the desired upstream version separately,
replace the corresponding snapshots, update the provenance table below, and
review the diff. Avoid running an updater against the Stow-managed copies.

### Caveman snapshot provenance

Source: https://github.com/JuliusBrussee/caveman.git

Snapshot copied from the installed skills on 2026-09-07. The installer recorded
folder hashes rather than an upstream commit; these hashes describe its
installation record and are not Git commit pins. Source paths are
`skills/<name>/SKILL.md`. Files in Git preserve the actual snapshot.

| Skill | Installer folder hash |
| --- | --- |
| `cavecrew` | `58b9a0bdb00d97953bfc840cb4dc3b38faf03759` |
| `caveman` | `efae5ae14e1ace5f456e895abb9e5643925a754c` |
| `caveman-commit` | `7b600195c1d3cdd277dc608c56384c86afb7ec11` |
| `caveman-compress` | `e4c735238a624b04c75af8b486ca5e05775dcff8` |
| `caveman-discover` | `d43d2ff7268e8df5db2198977b79b765b723b9d9` |
| `caveman-evidence-review` | `50875bf7d4a1ce7a64d92cc4127b3c63c2e0701a` |
| `caveman-explore` | `f26926e617ca8108e7ab77a9f6e100c228888ffe` |
| `caveman-help` | `6c85e34cfd4166be893224b7f39c6379d38c8b0c` |
| `caveman-learn` | `908fae7ced871b3505fecc7c7d294d5f9dd39ca8` |
| `caveman-manage` | `0a94a5cc3a4fd218b07d8853e4065e9a513fe51f` |
| `caveman-optimize` | `3311c453a59a8a27ad0555949e24fea81daf77fa` |
| `caveman-review` | `515d07fbd383fb9a15ad94647d133f681dc56197` |
| `caveman-setup` | `be2dfccebf403aa38e16bb39e367a3f045e24b07` |
| `caveman-stats` | `c0fb6ec46cd22173f570edfdd20463d0f7aea67c` |
| `investigate-first` | `c20174862b4748fc26ce55192a8431e9ef662947` |
| `lean-build` | `47bc09c3509d7f58f0f890836ab7f382987fd487` |
| `migration` | `b1066e51b4e7cb9a943554a98c3810653ccff059` |
| `safe-refactor` | `49fd11fcfa4fd63ab175380ed8f80b992090e5e4` |
| `surgical-patch` | `f7316a9431eff84811b6fd100af70e6984751c91` |
| `verify-and-stop` | `daaaceac55b83384dc3685c3b946699b9bc29331` |

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

