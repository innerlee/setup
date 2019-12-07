#!/bin/bash

# plugins
git clone git@github.com:zsh-users/zsh-completions ~/.oh-my-zsh/custom/plugins/zsh-completions
git clone git@github.com:zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
git clone git@github.com:zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
