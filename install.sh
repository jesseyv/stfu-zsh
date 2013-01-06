#!/usr/bin/env bash

echo "Installing Zsh configs"

if [ -f $(readlink -f ~/.zshrc) ]; then
    echo ".zshrc already exists. Saving to .zshrc.oldconf"
    mv ~/.zshrc ~/.zshrc.oldconf
fi

if [ -d $(readlink -f ~/.zsh) ]; then
    echo ".zsh dir already exists. Saving to .zsh.oldconf"
    mv ~/.zsh ~/.zsh.oldconf.d
fi

echo "Copying new configs"
ln -s -f $(readlink -f ./zshrc) ~/.zshrc
ln -s -f $(readlink -f ./zsh) ~/.zsh

echo "Done"

