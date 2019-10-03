eval $(dircolors -b $HOME/.dircolors)
zstyle ':completion:*' list-colors "${(@s.:.)LS_COLORS}"

ZSH_THEME="ys"

plugins=(git git-extras yarn zsh-completions zsh-syntax-highlighting)

autoload -Uz compinit && compinit
export ZSH_DISABLE_COMPFIX=true

alias ls="ls --color=tty 2>/dev/null"
unsetopt BG_NICE
export PYTHONDONTWRITEBYTECODE=1
bindkey '^]' autosuggest-accept
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

[[ -s /home/lizz/.autojump/etc/profile.d/autojump.sh ]] && source /home/lizz/.autojump/etc/profile.d/autojump.sh

eval $(thefuck --alias)

proxy_on () { export https_proxy=61.160.210.234:808; }
proxy_off () { export https_proxy=''; }
