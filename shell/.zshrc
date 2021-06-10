# Set up the prompt

autoload -Uz promptinit
promptinit
prompt walters

setopt histignorealldups sharehistory

# Use emacs keybindings even if our EDITOR is set to vi
bindkey -e

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

# Use modern completion system
autoload -Uz compinit
compinit

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
zstyle ':completion:*' menu select
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
#zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
#zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'
PATH=$HOME/opt:$PATH
PATH=$HOME/opt/cask/bin:$PATH
PATH=/usr/pgadmin4/bin:$PATH
PATH=/sbin:$PATH


alias ls='ls --color=auto'
alias brt5='sudo tee /sys/class/backlight/amdgpu_bl0/brightness <<< 5'
alias brt20='sudo tee /sys/class/backlight/amdgpu_bl0/brightness <<< 20'
alias brt100='sudo tee /sys/class/backlight/amdgpu_bl0/brightness <<< 100'
alias brt200='sudo tee /sys/class/backlight/amdgpu_bl0/brightness <<< 200'
alias nmrestart='sudo systemctl restart NetworkManager'

export PATH=$PATH:/var/lib/node/bin:$HOME/go/bin
export GOPATH=$HOME/projects/gocode
export GOROOT=$HOME/go
export PATH=$PATH:~/.platformio/penv/bin
