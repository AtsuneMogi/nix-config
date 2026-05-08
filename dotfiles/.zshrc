# language
export LANG=en_US.UTF-8
# ls colors
export LSCOLORS=gxfxcxdxbxegedabagacad
# aliases
alias gpp="g++"
alias ls="ls -GF"
alias sl="ls"
alias l='ls -C'
alias la='ls -A'
alias ll='ls -alF'
alias v="vim"
# zsh history
ZSH_AUTOSUGGEST_STRATEGY=(history)
export HISTFILE=${HOME}/.zsh_history
export HISTSIZE=1000
export SAVEHIST=100000
setopt hist_ignore_dups
setopt EXTENDED_HISTORY
# git
autoload -Uz vcs_info
precmd() { vcs_info }
zstyle ':vcs_info:git:*' formats '(%b)'
# prompt
setopt PROMPT_SUBST
PROMPT=$'%B%F{green}%n@%m%B%F{white}:%B%F{blue}%~ %B%F{yellow}${vcs_info_msg_0_} \n%b%(?.%F{green}%#.%F{red}%#%f) %F{white}'
##### added by zinit's installer #####
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi
source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit
##########
# plugins
zinit light zsh-users/zsh-autosuggestions
zinit light zdharma/fast-syntax-highlighting
zinit ice depth=1
zinit light jeffreytse/zsh-vi-mode
