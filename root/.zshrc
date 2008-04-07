# vim:ft=zsh -*- mode: SH -*-

. ~/.zsh/.zshenv

# Completion
[[ -r ${ZHOME}/.zcompinstall ]] && . ${ZHOME}/.zcompinstall

# keybindings
# zkbd keymaps in $ZHOME/.zkbd or /etc/zkbd are loaded automatically

# load local alias file
[[ -r ${ZHOME}/.zalias ]] && . ${ZHOME}/.zalias

# vim:ft=zsh
