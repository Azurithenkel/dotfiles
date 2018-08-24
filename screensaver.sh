#!/bin/sh

HOME=/home/tp
GIF=$HOME/.screensaver/screensaver$XSCREENSAVER_WINDOW.gif

mkdir -p $HOME/.screensaver/images

OLDGIFS=$HOME/.screensaver/screensaver*.gif
GIFFILES=($HOME/.screensaver/images/*.gif)

rm $OLDGIFS
ln -sf "${GIFFILES[RANDOM % ${#GIFFILES[@]}]}" $GIF
gifview --animate --min-delay 5 --window $XSCREENSAVER_WINDOW $GIF
