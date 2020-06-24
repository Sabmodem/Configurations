#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

alias ls='ls --color=auto'
alias emacs='emacs -nw'
PS1='\[\e[0;36m\]\u@\h\[\e[m\]:\[\e[1;36m\]\w\[\e[m\]\\$ '
