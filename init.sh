#!/bin/bash

# set -euo pipefall

# version
GHQ_VERSION=1.6.1
DOTFILES_VERSION=v0.0.1
AQUA_VERSION=v3.0.0

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

cd /tmp
aqua init
aqua g -i rhysd/dotfiles
aqua g -i x-motemen/ghq
aqua i -l
ghq get kaitat/dotfiles
DOTFILES_DIR=$(ghq root)/$(ghq list | grep kaitat/dotfiles)
AQUA_GLOBAL_CONFIG_DIR=$DOTFILES_DIR/aqua
AQUA_GLOBAL_CONFIG=$AQUA_GLOBAL_CONFIG_DIR/aqua.toml
cd $AQUA_GLOBAL_CONFIG_DIR
aqua install -l -a
dotfiles link .

# install homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
source $DOTFILES_DIR/bash/.bash_profile

brew install fish curl

# install deps via brew
export HOMEBREW_BREWFILE="$HOME/.brewfile"
brew bundle --global
brew reinstall fish

# fisher
fish -c "curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher"
fish -c "fisher update"
fish -c "fish_update_completions"

brew cleanup -s
