#!/bin/bash

# Install command-line tools using Homebrew

# (Optionally) Turn off brew's analytics https://docs.brew.sh/Analytics
# brew analytics off

# Make sure we’re using the latest Homebrew
brew update

# Upgrade any already-installed formulae
brew upgrade


# GNU core utilities (those that come with OS X are outdated)
brew install coreutils
brew install moreutils
# GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed
brew install findutils
# GNU `sed`
brew install gnu-sed


# Updated shells
# Note: don’t forget to add `/usr/local/bin/<EACHSHELL>` to `/etc/shells` before running `chsh`.
brew install zsh

# Install wget
brew install wget

# Install more recent versions of some OS X tools
brew install neovim
brew install grep
brew install openssh

# github util
brew install gh
# nicer git diffs
brew install git-delta


# Install other useful binaries
brew install fzf
brew install bat

# json stuff
brew install jq gron

# will probably need these at some point
brew install automake cmake go rust

# Remove outdated versions from the cellar
brew cleanup
