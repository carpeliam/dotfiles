#!/usr/bin/env bash

## HOMEBREW
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew install git bash-completion ruby ack node golang yarn direnv todo-txt
brew cask install iterm2 google-chrome visual-studio-code slack shiftit dropbox flux

## BASH-IT
git clone --depth=1 https://github.com/Bash-it/bash-it.git ~/.bash_it
~/.bash_it/install.sh --silent
bash-it enable plugin git go todo visual-studio-code
bash-it enable alias git

echo 'eval "$(direnv hook bash)"' >> ~/.bashrc

./git_config.sh

echo "Configure Dropbox before running sync_ssh_keys.sh."