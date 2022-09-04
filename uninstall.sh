#!/bin/bash

# uninstall vim
rm -rf ~/.vim
rm -rf ~/.vimrc
rm -rf ~/.vimrc.custom.config
rm -rf ~/.vimrc.custom.plugins
rm -rf ~/.ycm_extra_conf.py
echo "Uninstall vim!"

# uninstall tmux
rm -rf ~/.tmux.conf
rm -rf ~/.tmux.conf.local

echo "Uninstall tmux!"

echo "Done!"

