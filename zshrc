# -*- mode: sh -*-
# Enable history appending instead of overwriting.
setopt APPEND_HISTORY

# is 1000 a sane default?
export HISTFILE=~/.zhistory
export HISTSIZE=1000
export SAVEHIST=1000

# Set colorful ls/grep only on color terminals.
# Zsh terminfo module keeps things simple :)
autoload -Uz zsh/terminfo
if [[ "$terminfo[colors]" -ge 8 ]]; then
    # Enable colors for ls, etc.  Prefer ~/.dir_colors
    if type -p dircolors >/dev/null ; then
        if [[ -f ~/.dir_colors ]] ; then
            eval $(dircolors -b ~/.dir_colors)
        elif [[ -f /etc/DIR_COLORS ]] ; then
            eval $(dircolors -b /etc/DIR_COLORS)
        fi
    fi

    # turn on colours in grep and ls
    alias ls='ls --color=auto'
    alias grep='grep --colour=auto'
    alias egrep='egrep --colour=auto'
    alias fgrep='fgrep --colour=auto'
    
    # turn on colours in completion, disable trailing idents
    zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
    setopt NO_LIST_TYPES

    # set the gentoo prompt
    autoload -Uz promptinit
    promptinit; prompt gentoo
else
    # no colours, so use trailing idents
    alias ls="ls --classify"

    export PS1='%n@%m %1~ $# '
    export PS2='%n@%m %1~ %_> '
    export PS3='%n@%m %1~ ?# '
fi

# Change the window title of X terminals
autoload -Uz xterm_title_setup
xterm_title_setup

# site options and configuration
[[ -r /etc/zsh/zoptions ]] && . /etc/zsh/zoptions
