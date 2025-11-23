#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias brave='/usr/bin/brave --force-device-scale-factor=0.7'
PS1='[\u@\h \W]\$ '
