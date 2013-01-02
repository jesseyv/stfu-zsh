#!/usr/bin/env bash

echo "Installing Zsh configs"

if [ -f $HOME/.zshrc ]; then
    echo ".zshrc already exists. Saving to .zshrc.oldconf"
    mv $HOME/.zshrc $HOME/.zshrc.oldconf
fi

if [ -d $HOME/.zsh ]; then
    echo ".zsh dir already exists. Saving to .zsh.oldconf"
    mv $HOME/.zsh $HOME/.zsh.oldconf
fi

echo "Copying new configs"
cp $(pwd)/zshrc $HOME/.zshrc
cp -r $(pwd)/zsh $HOME/.zsh

echo "Done"
