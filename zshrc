# set up vars
local ZDIR=~/.zsh
local ZPLUGINDIR=$ZDIR/plugins

fpath=($ZDIR/functions $fpath)

source $ZDIR/aliases.zsh

# set up basic tools

####################
if [[ "$TERM" == "xterm" ]]; then
    export TERM="xterm-256color"
fi

####################
source $ZDIR/theme.zsh

####################
source $ZPLUGINDIR/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh


export WORKON_HOME=$HOME/.venvs
source /usr/local/bin/virtualenvwrapper.sh
VIRTUAL_ENV_DISABLE_PROMPT=true

# color wrapper setup
[ -d "$HOME/.cw" ] && export PATH="$HOME/.cw/def:$PATH"
