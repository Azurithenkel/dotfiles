#!/bin/bash

#Initialize and update all submodules.
echo Initializing git submodules.
git submodule init && git submodule update

# Remove all dotfiles from the home directory if present.
echo Removing any existing dotfiles from your home directory.
rm -rf ~/.bashrc ~/.bash_profile ~/.gitconfig ~/.hgrc ~/.config/awesome ~/.dircolors ~/.Xresources ~/.Xdefaults ~/.mplayer ~/.complete ~/.Xmodmap

# Initialize symlinks.
echo Creating symlinks in your home directory that point to this dotfiles repository.
ln -sf "$PWD/.bashrc" ~/.bashrc
ln -sf "$PWD/.bash_profile" ~/.bash_profile
ln -sf "$PWD/.complete" ~/.complete
ln -sf "$PWD/.gitconfig" ~/.gitconfig
ln -sf "$PWD/.hgrc" ~/.hgrc
ln -sf "$PWD/.dircolors" ~/.dircolors
[ ! -d ~/.config ] && mkdir ~/.config
ln -sf "$PWD/.config/awesome" ~/.config/awesome
mkdir ~/.mplayer
ln -sf "$PWD/.mplayer/config" ~/.mplayer/config
ln -sf "$PWD/.Xresources" ~/.Xresources
ln -sf "$PWD/.Xresources" ~/.Xdefaults
xrdb -m ~/.Xresources
ln -sf "$PWD/.Xmodmap" ~/.Xmodmap

# Update mime
mkdir -p ~/.local/share/mime/packages
ln -sf "$PWD/application-x-javaws.xml" ~/.local/share/mime/packages/application-x-javaws.xml
update-mime-database ~/.local/share/mime

# Finished.
echo Dotfiles installation complete.
