#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return


### Aliases
alias ls='ls -al --color=auto'
alias em='emacsclient -t'
alias ysyu='yaourt -Syu'
alias y='yaourt '
alias yada='yadm add'
alias yadc='yadm commit -m'
alias yadp='yadm push -u origin master'


### Variables
export PATH="${PATH}:~/bin:$HOME/.node_modules/bin"
export EDITOR="emacsclient -t "
export VISUAL="emacsclient -t "
export npm_config_prefix=~/.node_modules



PS1='[\u@\h \W]\$ '
