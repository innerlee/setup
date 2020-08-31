#!/bin/bash

# plugins
git clone git@github.com:zsh-users/zsh-completions $HOME/.oh-my-zsh/custom/plugins/zsh-completions
git clone git@github.com:zsh-users/zsh-autosuggestions $HOME/.zsh/zsh-autosuggestions
git clone git@github.com:zsh-users/zsh-syntax-highlighting.git "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"/plugins/zsh-syntax-highlighting
