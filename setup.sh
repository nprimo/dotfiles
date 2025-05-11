#!/usr/bin/env bash

sudo apt update && sudo apt upgrade 

# package to be installed
packages=(
    "git"
    "curl"
    "build-essential" # gcc etc
    "wl-clipboard"
    "fish"
)

sudo apt autoremove

for p in ${packages[@]}; do
    sudo apt install "$p"
done

# Add starship
if ! starship --version 2>&1 > /dev/null; then
    curl -sS https://starship.rs/install.sh | sh
fi

# Add nix
if ! nix --version 2>&1 > /dev/null; then
    sh <(curl -L https://nixos.org/nix/install) --daemon
fi
