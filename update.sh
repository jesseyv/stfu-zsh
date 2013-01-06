#!/usr/bin/env zsh

local ZCONFDIR=$(dirname $(readlink -f $0))

echo "Zsh configs update script"

echo "Updating repo"

git pull

echo "Updating links"

ln -s -f $ZCONFDIR/zshrc ~/.zshrc
ln -s -f $ZCONFDIR/zsh ~/.zsh

echo "Sourcing ~/.zshrc"

source ~/.zshrc

echo "Done"

