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

Launching the speedbar
M-x speedbar

Howto get speedbar to show file tagged information?
ECB is what you want Emacs Code Browser.
Which requires CEDET
M-x ecb-activate

M-x global-linenum-mode  ( for line numbering ) 


-------------------------------
Get the javascript lint stuff working.
-------------------------------
$ cur
$ lintnode.sh


Home: 11/26/2013: Running: GNU Emacs 23.4.1
Home: 11/29/2013: Running: GNU Emacs 24.??
Work: 11/26/2013: Running: GNU Emacs 24.1.1

Home: updating 23 -> 24 notes:
 Issue with CEDET.

 - I just needed to update to point to the cedet-1.1 lib 

 - problem launching ecb-activate
    if: Symbol's value as variable is void: stack-trace-on-error
    Solved by setting:
    (setq stack-trace-on-error t)
