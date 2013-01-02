# -*- mode: sh; -*-
autoload -Uz vcs_info

setopt prompt_subst

typeset -A cl
cl+=(WH %F{255})
cl+=(BL %F{075})
cl+=(GR %F{046})
cl+=(YW %F{226})
cl+=(CN %F{044})
cl+=(MG %F{165})
cl+=(RD %F{196})
cl+=(DGR %F{235})
cl+=(R %f)

zstyle ':vcs_info:*' formats \
    '${cl[YW]}(${cl[BL]}%s${cl[WH]}:${cl[GR]}%b${cl[YW]})${cl[R]}'

function set_prompt() {
    local -a LN_CLK LN_USER LN_PWD LN_VENV LN_PMT PROMPT_LINES

    LN_CLK=("${cl[YW]}(${cl[GR]}%*${cl[YW]})${cl[R]}")
    LN_PWD=("${cl[YW]}(${cl[BL]}%~${cl[YW]})${cl[R]}")
    LN_USER=("${cl[WH]}%n${cl[BL]}(%#)${cl[YW]}%m${cl[R]}")
    LN_PMT=("${cl[CN]}:/>${cl[R]}")

    LN_VENV=()

    if [ -n "$VIRTUAL_ENV" ]; then
        local envname="$(basename $VIRTUAL_ENV)"
        LN_VENV=("${cl[YW]}(${cl[BL]}env${cl[WH]}:${cl[GR]}${envname}${cl[YW]})${cl[R]}")
    fi

    PROMPT_LINES+=("%B${LN_CLK}${LN_VENV}${LN_PWD}%b")
    PROMPT_LINES+=("%B${LN_USER}${LN_PMT}%b ")

    PROMPT=${(F)PROMPT_LINES}

    local return_code='%(?..${cl[RD]}%? ↵${cl[R]})'
    RPROMPT="${return_code} %B${vcs_info_msg_0_}%b"
}

function precmd() {
    vcs_info
    set_prompt
}

# zsh-syntax-highlighting settings
typeset -A ZSH_HIGHLIGHT_STYLES

ZSH_HIGHLIGHT_STYLES=(
    'default'                   'fg=bold'
    'path'                      'fg=white,bold'
    'command'                   'fg=044,bold'
    'precommand'                'fg=046,bold'
    'function'                  'fg=046,bold'
    'builtin'                   'fg=046,bold'
    'alias'                     'fg=044,bold'
    'single-hyphen-option'      'fg=white,bold'
    'double-hyphen-option'      'fg=white,bold'
)

# : ${ZSH_HIGHLIGHT_STYLES[default]:=none}
# : ${ZSH_HIGHLIGHT_STYLES[unknown-token]:=fg=red,bold}
# : ${ZSH_HIGHLIGHT_STYLES[reserved-word]:=fg=yellow}
# : ${ZSH_HIGHLIGHT_STYLES[alias]:=fg=green}
# : ${ZSH_HIGHLIGHT_STYLES[builtin]:=fg=green}
# : ${ZSH_HIGHLIGHT_STYLES[function]:=fg=green}
# : ${ZSH_HIGHLIGHT_STYLES[command]:=fg=green}
# : ${ZSH_HIGHLIGHT_STYLES[precommand]:=fg=green,underline}
# : ${ZSH_HIGHLIGHT_STYLES[commandseparator]:=none}
# : ${ZSH_HIGHLIGHT_STYLES[hashed-command]:=fg=green}
# : ${ZSH_HIGHLIGHT_STYLES[path]:=underline}
# : ${ZSH_HIGHLIGHT_STYLES[globbing]:=fg=blue}
# : ${ZSH_HIGHLIGHT_STYLES[history-expansion]:=fg=blue}
# : ${ZSH_HIGHLIGHT_STYLES[single-hyphen-option]:=none}
# : ${ZSH_HIGHLIGHT_STYLES[double-hyphen-option]:=none}
# : ${ZSH_HIGHLIGHT_STYLES[back-quoted-argument]:=none}
# : ${ZSH_HIGHLIGHT_STYLES[single-quoted-argument]:=fg=yellow}
# : ${ZSH_HIGHLIGHT_STYLES[double-quoted-argument]:=fg=yellow}
# : ${ZSH_HIGHLIGHT_STYLES[dollar-double-quoted-argument]:=fg=cyan}
# : ${ZSH_HIGHLIGHT_STYLES[back-double-quoted-argument]:=fg=cyan}
# : ${ZSH_HIGHLIGHT_STYLES[assign]:=none}
