#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='\[\e[0;96m\]\u@\h\[\e[m\]:\[\e[1;96m\]\w\[\e[m\]\\$ '
