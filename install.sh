#!/bin/bash

#Initialize and update all submodules.
echo Initializing git submodules.
git submodule init && git submodule update

# Remove all dotfiles from the home directory if present.
echo Removing any existing dotfiles from your home directory.
rm -rf ~/.bashrc ~/.bash_profile ~/.gitconfig ~/.hgrc ~/.config/awesome ~/.dircolors ~/.Xresources ~/.Xdefaults ~/.mplayer ~/.complete

# Initialize symlinks.
echo Creating symlinks in your home directory that point to this dotfiles repository.
ln -s "$PWD/.bashrc" ~/.bashrc
ln -s "$PWD/.bash_profile" ~/.bash_profile
ln -s "$PWD/.complete" ~/.complete
ln -s "$PWD/.gitconfig" ~/.gitconfig
ln -s "$PWD/.hgrc" ~/.hgrc
ln -s "$PWD/.dircolors" ~/.dircolors
[ ! -d ~/.config ] && mkdir ~/.config
ln -s "$PWD/.config/awesome" ~/.config/awesome
mkdir ~/.mplayer
ln -s "$PWD/.mplayer/config" ~/.mplayer/config
ln -s "$PWD/.Xresources" ~/.Xresources
ln -s "$PWD/.Xresources" ~/.Xdefaults
xrdb -m ~/.Xresources
ln -s "$PWD/.Xmodmap" ~/.Xmodmap

# Finished.
echo Dotfiles installation complete.
