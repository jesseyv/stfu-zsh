# set up vars
local MT_VIRTUALENVS="$HOME/.virtualenvs"

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
####################

# set up virtualenvwrapper
if [ ! -f /usr/local/bin/virtualenvwrapper.sh ]; then

    echo "virtualenvwrapper is not installed"

else

    export WORKON_HOME=$MT_VIRTUALENVS
    source /usr/local/bin/virtualenvwrapper.sh
    # we handle virtualenvs in our theme so
    VIRTUAL_ENV_DISABLE_PROMPT=true
fi

# color wrapper setup
[ -d "$HOME/.cw" ] && export PATH="$HOME/.cw/def:$PATH"
