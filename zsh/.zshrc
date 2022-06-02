# path is: ~/.zshrc

export ZSH="/home/yassine/.oh-my-zsh"
ZSH_THEME="crunch"
plugins=(git zsh-autosuggestions zsh-syntax-highlighting zsh-completions)

source $ZSH/oh-my-zsh.sh

export TERM=screen-256color

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -M viins 'jk' vi-cmd-mode
bindkey -M vicmd 'gl' vi-end-of-line
bindkey -M vicmd 'gh' vi-digit-or-beginning-of-line
bindkey -v '^?' backward-delete-char

# Aliases
alias v='nvim'
alias dk='dokku'
alias less='batcat'
alias ld='lazydocker'
alias lg='lazygit'
alias svim='sudo -E nvim'
alias dvim='nvim -d'
alias zc='v ~/.zshrc'
alias hg='history | grep'

alias la='exa -la --group-directories-first'
alias ls='exa -l --group-directories-first'
