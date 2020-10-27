# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=100
setopt autocd extendedglob nomatch notify
unsetopt beep
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/sabmodem/.zshrc'
zstyle ':completion:*' menu select

autoload -Uz compinit
compinit
# # End of lines added by compinstall
autoload -U compinit promptinit
compinit
promptinit

# Эта настройка установит тему walters для приглашения командной строки
prompt walters

export EDITOR=/usr/bin/emacs
export ARDUINO_DIR=~/opt/arduino
export ARDMK_DIR=/home/sabmodem/Arduino-Makefile
export AVR_TOOLS_DIR=/usr

alias ls='ls --color=auto'
alias emacs='emacs -nw'
# alias mc='mc -b'
alias ard='~/opt/arduino/arduino'
alias brt255='sudo tee /sys/class/backlight/amdgpu_bl0/brightness <<< 255'
alias brt200='sudo tee /sys/class/backlight/amdgpu_bl0/brightness <<< 200'
alias brt100='sudo tee /sys/class/backlight/amdgpu_bl0/brightness <<< 100'
alias brt50='sudo tee /sys/class/backlight/amdgpu_bl0/brightness <<< 50'
alias brt20='sudo tee /sys/class/backlight/amdgpu_bl0/brightness <<< 20'

export PATH="$PATH":"$HOME/.pub-cache/bin"
