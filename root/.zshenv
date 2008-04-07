setopt ALL_EXPORT

# Locale
LANG="en_GB.UTF-8"
LANGUAGE="en_GB.UTF-8"

# PATHS

setopt NO_ALL_EXPORT

# Aliases
if [[ ! -o interactive ]] && [[ -r ${ZHOME}/.zalias ]]; then
	. ${ZHOME}/.zalias
fi

# vim:ft=zsh
