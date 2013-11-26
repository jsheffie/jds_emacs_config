#!/bin/bash

self="$(readlink -f ${BASH_SOURCE[0]})"
this_dir="$(dirname $self)"
. $this_dir/emacs_plugins.sh

# ---------------------------------------------------------------------------- #
# Psudo Main                                                                   #
# ---------------------------------------------------------------------------- #
if [ ! -d ${emacs_plugins_dir} ]; then
    error "Directory does not exist [${emacs_plugins_dir}]"
fi
install_dot_emacs
install_pycscope
install_cedet
install_ecb
install_lintnodesh
install_python
install_javascript
install_coffee
install_yasnippet
install_lintnode
install_flymake
install_auto_complete
install_nxml
install_css
