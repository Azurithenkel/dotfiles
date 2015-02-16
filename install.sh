#!/bin/bash

#Initialize and update all submodules.
echo Initializing git submodules.
git submodule init && git submodule update

# Remove all dotfiles from the home directory if present.
echo Removing any existing dotfiles from your home directory.
rm -rf ~/.emacs ~/.emacs.d ~/.bashrc ~/.bash_profile ~/.gitconfig ~/.hgrc ~/.config/awesome ~/.dircolors ~/.Xresources ~/.Xdefaults

# Initialize symlinks.
echo Creating symlinks in your home directory that point to this dotfiles repository.
ln -s "$PWD/.emacs" ~/.emacs
ln -s "$PWD/.emacs.d" ~/.emacs.d
ln -s "$PWD/.bashrc" ~/.bashrc
ln -s "$PWD/.bash_profile" ~/.bash_profile
ln -s "$PWD/.gitconfig" ~/.gitconfig
ln -s "$PWD/.hgrc" ~/.hgrc
ln -s "$PWD/.dircolors" ~/.dircolors
[ ! -f /tmp/foo.txt ] && mkdir ~/.config
ln -s "$PWD/.config/awesome" ~/.config/awesome
ln -s "$PWD/.Xresources" ~/.Xresources
ln -s "$PWD/.Xresources" ~/.Xdefaults
xrdb -m ~/.Xresources

# Finished.
echo Dotfiles installation complete.
