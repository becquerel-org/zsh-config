# -*- mode: sh; -*-
# Don't go any further if the norcs option is set 
[[ -o rcs ]] || return 0

export ZDOTDIR="${HOME}/.zsh"

# Use ZHOME as the prefix for user configuration files
# Hash zhome=ZHOME to provide ~zhome usage from the word go :)
export ZHOME=${ZDOTDIR:-${HOME}}
hash -d zhome=${ZHOME}

# If not interactive or not a login shell, source zprofile
if [[ ! -o interactive ]] || [[ ! -o login ]]; then
    . /etc/zsh/zprofile
fi

# If not interactive, source aliases
if [[ ! -o interactive ]] && [[ -r /etc/zsh/zalias ]]; then
    . /etc/zsh/zalias
fi
