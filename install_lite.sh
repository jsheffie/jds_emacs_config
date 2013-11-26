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
install_python
install_auto_complete
