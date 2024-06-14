#!/bin/bash

set -euo pipefail

# version
GHQ_VERSION=1.6.1
DOTFILES_VERSION=v0.0.1
AQUA_VERSION=v3.0.1

# xdg base directory
XDG_CONFIG_HOME=$HOME/.config
XDG_CACHE_HOME=$HOME/.cache
XDG_DATA_HOME=$HOME/.local/share

# XDG Base Directory
mkdir -p $XDG_CONFIG_HOME
mkdir -p $XDG_CACHE_HOME
mkdir -p $XDG_DATA_HOME


# os/system version
system_name=$(uname -m)
os_name=$(uname -s | tr '[:upper:]' '[:lower:]')


if [ os == "darwin" ] ; then
  if ! xcode-select -p > /dev/null 2>&1 ; then
    xcode-select --install
  fi
fi

if [ os_name == "linux" ] ; then
  pacman -Syu 
  pacman -S curl
  pacman -Sc
fi

# install aqua
curl -sSfL "https://raw.githubusercontent.com/aquaproj/aqua-installer/${AQUA_VERSION}/aqua-installer" | bash
export PATH="${AQUA_ROOT_DIR:-${XDG_DATA_HOME:-$HOME/.local/share}/aquaproj-aqua}/bin:$PATH"
echo "-----installed aqua-----"

cd /tmp
aqua init
aqua g -i rhysd/dotfiles
aqua g -i x-motemen/ghq
aqua i -l

git config --global ghq.root '~/.local/share/ghq-src'
ghq get kaitat/dotfiles
DOTFILES_DIR=$(ghq root)/$(ghq list | grep kaitat/dotfiles)
AQUA_GLOBAL_CONFIG_DIR=$DOTFILES_DIR/aqua
AQUA_GLOBAL_CONFIG=$AQUA_GLOBAL_CONFIG_DIR/aqua.toml
cd $AQUA_GLOBAL_CONFIG_DIR
aqua install -l -a
cd $DOTFILES_DIR
dotfiles link .

echo "-----installed dotfiles-----"

# install homebrew
bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
source $DOTFILES_DIR/bash/bash_profile
echo "-----installed homebrew-----"

brew install fish curl

# install brew package
# export HOMEBREW_BUNDLE_FILE="$HOME/.Brewfile"
brew bundle --global
brew reinstall fish
echo "-----installed brew package-----"

# install fisher
fish -c "curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher"
fish -c "fisher update"
fish -c "fish_update_completions"
echo "-----installed fish package-----"

brew cleanup -s
echo "-----🎉done🎂-----"
