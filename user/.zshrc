# vim:ft=zsh -*- mode: SH -*-

. ~/.zsh/.zshenv

# einit vbox ~path
hash -d vbox_home=/home/creidiki/projects/einit/vbox-home

# Completion
[[ -r ${ZHOME}/.zcompinstall ]] && . ${ZHOME}/.zcompinstall

# keybindings
# zkbd keymaps in $ZHOME/.zkbd or /etc/zkbd are loaded automatically

# load local alias files
if [[ -r ${ZHOME}/.zalias ]]; then
	. ${ZHOME}/.zalias
fi
