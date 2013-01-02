# set up vars
local ZDIR=$HOME/.zsh
local PLUGINDIR=$ZDIR/plugins

source $ZDIR/aliases.zsh

# set up basic tools

####################
if [[ "$TERM" == "xterm" ]]; then
    export TERM="xterm-256color"
fi

####################
source $ZDIR/theme.zsh

####################
source $PLUGINDIR/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh


export WORKON_HOME=$HOME/.venvs
source /usr/local/bin/virtualenvwrapper.sh
VIRTUAL_ENV_DISABLE_PROMPT=true
