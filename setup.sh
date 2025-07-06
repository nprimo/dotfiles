#!/usr/bin/env bash

sudo apt update && sudo apt upgrade -y

# package to be installed
packages=(
    "git"
    "curl"
    "build-essential" # gcc etc
    "wl-clipboard"
    "fish"
    "stow"
)

sudo apt autoremove

for p in ${packages[@]}; do
    sudo apt install "$p"
done

# Add starship
if ! starship --version > /dev/null 2>&1; then
    curl -sS https://starship.rs/install.sh | sh
fi

# Add nix
if ! nix --version > /dev/null 2>&1; then
    sh <(curl -L https://nixos.org/nix/install) --daemon
fi
