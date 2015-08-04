# export EDITOR='atom -nw'
export EDITOR='subl -w'

export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad

export GOPATH=$HOME/code/go
export PATH=$PATH:$GOPATH/bin

SHOW_GIT=true

# export PS1="\e[30;1m\h:\W \u\$ \e[0m"
function parse_git_branch {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\[\1\]/'
}

DULL=0
BRIGHT=1
FG_BLACK=30
FG_BLUE=34
FG_VIOLET=35
FG_WHITE=37
BG_NULL=00
ESC="\033"
NORMAL="\[$ESC[m\]"

GRAY="\[$ESC[${DULL};${FG_BLACK}m\]"
RESET="\[$ESC[${DULL};${FG_WHITE};${BG_NULL}m\]"
BLUE="\[$ESC[${DULL};${FG_BLUE}m\]"
VIOLET="\[$ESC[${DULL};${FG_VIOLET}m\]"
BRIGHT_BLUE="\[$ESC[${BRIGHT};${FG_BLUE}m\]"

if $SHOW_GIT ; then
  export PS1="${GRAY}\u@\h${NORMAL}:${BLUE}\w${VIOLET}\$(parse_git_branch)${RESET}\$ "
else
  export PS1="${GRAY}\u@\h${NORMAL}:${BLUE}\w${RESET}\$ "
fi

# if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

source /usr/local/opt/autoenv/activate.sh

export BASH_CONF="bash_profile"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
