#!/bin/bash

# A wrapper script for setting up cscope in emacs:
# However: I did get it goinig with xemacs.el

pwd=$PWD
echo "Finding..."
find $pwd -name "*.py" > "$pwd/cscope.files"
find $VIRTUAL_ENV  -name "*.py" >> "$pwd/cscope.files"
file_count=`cat $pwd/cscope.files|wc -l`
echo "Appended [$file_count] files to [cscope.files]"

# =============
# Pycscope
# =============
# I did not get pycscope.py to work properly
# Used to generate cscope files for 'well-cscope'
# but really for emacs.
# https://github.com/portante/pycscope
# pip install pycscope
# Generate a cscope.out file.
# pycscope -R
