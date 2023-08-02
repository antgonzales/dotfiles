# Dotfiles

My personal configuration files.

## Installation

01. Install [Homebrew](https://brew.sh/)
02. Install Homebrew dependencies from [Brewfile](./Brewfile)

```console
brew bundle install
```

03. Install [Prezto](https://github.com/sorin-ionescu/prezto)
04. Copy Prezto config to base directory

```console
cp ./.zpreztorc ~/.zpreztorc
```

05. Copy Neovim config to `.config` directory

```console
cp -r ./nvim ~/.config/nvim
```

06. Update Neovim dependencies

```sh
:PackerSync
```

## Credits and inspiration

* [ThePrimeagen's 0 to LSP : Neovim RC From Scratch](https://youtu.be/w7i4amO_zaE)
* [mathias](https://github.com/mathiasbynens/dotfiles/)
* [alrra](https://github.com/alrra/dotfiles/)
* [paulmillr](https://github.com/paulmillr/dotfiles)
* [gf3](https://github.com/gf3/dotfiles)
* [paulirish](https://github.com/paulirish/dotfiles)

## License

This project is licensed under the MIT License.

