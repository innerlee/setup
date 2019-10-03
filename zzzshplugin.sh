# plugins
git clone git@github.com:zsh-users/zsh-completions ~/.oh-my-zsh/custom/plugins/zsh-completions
git clone git@github.com:zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
git clone git@github.com:zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# dircolors
wget https://raw.githubusercontent.com/arcticicestudio/nord-dircolors/develop/src/dir_colors -O $HOME/.dircolors

# tmux
git clone git@github.com:arcticicestudio/nord-tmux ~/.tmux/themes/nord-tmux
cp .tmux.conf ~/
