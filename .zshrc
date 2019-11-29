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

[[ -s $HOME/.autojump/etc/profile.d/autojump.sh ]] && source $HOME/.autojump/etc/profile.d/autojump.sh

eval $(thefuck --alias)

alias jp='cd ..'
alias sw='swatch -l'
alias gitsub='git submodule update --init --recursive'

proxy_on () { export https_proxy=61.160.210.234:808; }
proxy_off () { export https_proxy=''; }
vidres () { ffprobe -v error -select_streams v:0 -show_entries stream=width,height -of csv=s=x:p=0 $1 }
vidnframe () { ffmpeg -i $1 -vcodec copy -f rawvideo -y /dev/null 2>&1 | tr ^M '\n' | awk '/^frame=/ {print $2}' | tail -n 1 }
lswc () { ls | wc -l }
