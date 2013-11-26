Usage Notes:
================

## Using cscope with python code.
Set the $VIRTUAL_ENV env variable.
If you have virtualenv_wrapper installed its:
   $ workon <virtualenv_project>
   $ cd ~/workspace/<python_project_dir>
   $ pycscope_maker.sh
This will output a cscope.files file.

When you fire up emacs: with xcscope enabled
it will find this cscope.files file.

Stuff I use:
M-f10 ( toggle search buffer)
F3    ( find global definition)
M-left ( back) 


