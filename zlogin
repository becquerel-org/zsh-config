# -*- mode: sh; -*-

[[ -o interactive ]] && fortune | cowsay -W $((COLUMNS-6))
