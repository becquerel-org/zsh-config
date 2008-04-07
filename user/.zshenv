setopt ALL_EXPORT

# Locale
LANG="en_GB.UTF-8"
LANGUAGE="en_GB.UTF-8"

# PATHS
typeset -U path
path=(~/local/bin ${path})
#typeset -U fpath
#fpath=(~/.zsh/.zfunc ${fpath})

setopt NO_ALL_EXPORT

# Aliases
if [[ ! -o interactive ]] && [[ -r ${ZHOME}/.zalias ]]; then
	. ${ZHOME}/.zalias
fi

# vim:ft=zsh
