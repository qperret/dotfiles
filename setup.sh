#!/bin/bash

# Quick and dirty setup

# ViM plug
if [[ ! -f ~/.vim/autoload/plug.vim ]]; then
    # Installing Vim Plug via curl
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    echo "Please run :PlugInstall in ViM to install all the plugins"
fi


if [[ ! -f ~/.vimrc ]]; then
    ln -s ~/.dotfiles/vimrc ~/.vimrc
fi


# Install FZF
if [[ ! -f ~/.fzf.bash ]]; then
    git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
    echo "Installing FZF"
    ~/.fzf/install
fi
