#!/bin/env zsh

## disable syscons bell

sudo zypper install zsh git alacritty chezmoi

git clone https://codeberg.org/onetruffle/dotfiles.git ~/.dotfiles
chezmoi --source ~/.dotfiles apply \
  ~/.zshenv \
  ~/.config/{zsh,starship.toml} \
  ~/.local/bin/setup-{appimages,zsh-deps}

 setup-zsh-deps
 setup-appimages

## brave
sudo zypper install curl
sudo rpm --import https://brave-browser-rpm-release.s3.brave.com/brave-core.asc
sudo zypper addrepo --refresh https://brave-browser-rpm-release.s3.brave.com/x86_64/ brave-browser
sudo zypper install brave-browser
