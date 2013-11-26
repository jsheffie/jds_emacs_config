# Setup print functions.
#typeset -r status_col=60

# for Color/print functions.
typeset -r color_red="echo -en \\033[0;31m"
typeset -r color_yellow="echo -en \\033[0;33m"
typeset -r color_blue="echo -en \\033[0;34m"
typeset -r color_teal="echo -en \\033[0;36m"
typeset -r color_black="echo -en \\033[0;39m"
#typeset -r color_fushsia="echo -en \\033[0;35m"
#typeset -r color_green="echo -en \\033[0;32m"

#typeset -r color_bold_red="echo -en \\033[1;31m"
#typeset -r color_bold_green="echo -en \\033[1;32m"
#typeset -r color_bold_yellow="echo -en \\033[1;33m"
#typeset -r color_bold_blue="echo -en \\033[1;34m"
#typeset -r color_bold_fushsia="echo -en \\033[1;35m"
#typeset -r color_bold_teal="echo -en \\033[1;36m"
#typeset -r color_bold_black="echo -en \\033[1;39m"

typeset -r color_normal=$color_black
typeset -r color_info=$color_teal
typeset -r color_success=$color_green
typeset -r color_warning=$color_blue
typeset -r color_failure=$color_red

# ---------------------------------------------------------------------------- #
move_echo_to()
{
    echo -en "\\033[${1}G"
}

echo_success()
{
    echo -n "  ["
    $color_success
    echo -n "  OK  "
    $color_normal
    echo "] $1"
}
info()
{
    $color_info
    echo "$1"
    $color_normal
}
echo_warning()
{
    echo -n "  ["
    $color_warning
    echo -n "  OK  "
    $color_normal
    echo "] $1"
}

error()
{
    echo -n "  ["
    $color_failure
    echo -n "ERROR"
    $color_normal
    echo "] $1"
    exit 1
}


# ---------------------------------------------------------------------------- #
# ---------------------------------------------------------------------------- #
# ---------------------------------------------------------------------------- #
emacs_plugins_dir="$HOME/emacs/plugins"
# ---------------------------------------------------------------------------- #
# Python:                                                                      #
#    - python.el mode ( built-in )                                             #
#      http://lists.gnu.org/archive/html/emacs-devel/2012-04/msg00583.html     #
#    - python-mode.el, which is the most comprehensive                         #
# ---------------------------------------------------------------------------- #
install_python() {
    cd ${emacs_plugins_dir}
    ver="6.1.2"
    if [ -d "python-mode.el-${ver}" ]; then 
        echo_warning "Already Installed: Python python-mode.el"
    else
        info "Installing: Python python-mode.el"
        curl -o python-mode.el-${ver}.tar.gz -k https://launchpadlibrarian.net/149149704/python-mode.el-${ver}.tar.gz
        tar -zxf python-mode.el-${ver}.tar.gz 
        ln -s python-mode.el-${ver} python-mode.el 
        rm -f python-mode.el-${ver}.tar.gz
    fi
}
# ---------------------------------------------------------------------------- #
# Collection of Emacs Development Tools:  CDET http://cedet.sourceforge.net/   #
# ---------------------------------------------------------------------------- #
install_cedet() {
    cd ${emacs_plugins_dir}
    ver="1.1"
    if [ -d "cedet-${ver}" ]; then 
        echo_warning "Already Installed: CEDET"
    else
        info "Installing: CEDET"
        #curl -o cedet-${ver}.tar.gz http://sourceforge.net/projects/ecb/files/latest/download
        tar -zxf cedet-${ver}.tar.gz 
        ln -s cedet-${ver} cedet 
        rm -f cedet-${ver}.tar.gz
    fi
}
# ---------------------------------------------------------------------------- #
# Emacs Code Browser: (depends on CDET)                                        #
# ---------------------------------------------------------------------------- #
install_ecb() {
    cd ${emacs_plugins_dir}
    ver="2.40"
    if [ -d "ecb-${ver}" ]; then 
        echo_warning "Already Installed: ECB Emacs Code Browser"
    else
        info "Installing: ECB Emacs Code Browser"
        #curl -o ecb-${ver}.tar.gz http://sourceforge.net/projects/ecb/files/latest/download
        tar -zxf ecb-${ver}.tar.gz 
        ln -s ecb-${ver} ecb 
        rm -f ecb-${ver}.tar.gz
    fi
}
# ---------------------------------------------------------------------------- #
# auto-complete:                                                               #
# ---------------------------------------------------------------------------- #
install_auto_complete() {
    cd ${emacs_plugins_dir}
    ver="1.3.1"
    if [ -d "auto-complete-${ver}" ]; then 
        echo_warning "Already Installed: auto-complete"
    else
        info "Installing: auto-complete"
        curl -o auto-complete-${ver}.tar.bz2 http://cx4a.org/pub/auto-complete/auto-complete-${ver}.tar.bz2
        tar -jxf auto-complete-${ver}.tar.bz2 
        ln -s auto-complete-${ver} auto-complete 
        rm -f auto-complete-${ver}.tar.bz2
    fi
}
# ---------------------------------------------------------------------------- #
# Javascript: currnetly built into emacs                                       #
# ---------------------------------------------------------------------------- #
install_javascript() {
    echo_warning "Already Installed: javascript ( PASS: its built into emacs)"
}
# ---------------------------------------------------------------------------- #
# nxml: currnetly built into emacs                                             #
# ---------------------------------------------------------------------------- #
install_nxml() {
    echo_warning "Already Installed: nxml ( PASS: its built into emacs )"
}
# ---------------------------------------------------------------------------- #
# css: currnetly built into emacs                                              #
# ---------------------------------------------------------------------------- #
install_css() {
    echo_warning "Already Installed: css ( PASS: its built into emacs )"
}
# ---------------------------------------------------------------------------- #
# Coffee: https://github.com/defunkt/coffee-mode                               #
#         Worth noting there is a lint version ( this is not it )              #
# ---------------------------------------------------------------------------- #
install_coffee() {
    cd ${emacs_plugins_dir}
    ver="0.4.1.1"
    if [ -f coffee-mode.el ]; then 
        echo_warning "Already Installed: Javascript coffee-mode.el"
    else
        info "Installing: Javascript coffee-mode.el"
        
        curl -o coffee-mode.el -k http://elpa.gnu.org/packages/coffee-mode-${ver}.el
    fi
}
# ---------------------------------------------------------------------------- #
# yasnippet:                                                                   #
# ---------------------------------------------------------------------------- #
install_yasnippet() {
    cd ${emacs_plugins_dir}
    if [ -d "yasnippet" ]; then 
        echo_warning "Already Installed: yasnippet ( git update..??)"
    else
        info "Installing: yasnippet"
        git clone https://github.com/capitaomorte/yasnippet.git
    fi
}
# ---------------------------------------------------------------------------- #
# lintnode:                                                                    #
# ---------------------------------------------------------------------------- #
install_lintnode() {
    cd ${emacs_plugins_dir}
    if [ -d "lintnode" ]; then 
        echo_warning "Already Installed: lintnode ( git update..??)"
    else
        info "Installing: lintnode"
        git clone https://github.com/davidmiller/lintnode.git
        cd lintnode
        npm install express connect-form haml underscore
    fi
}
# ---------------------------------------------------------------------------- #
# flymake-cursor: Note: installing this into the lintnode dir                  #
# ---------------------------------------------------------------------------- #
install_flymake() {
    if [ -d "${emacs_plugins_dir}/lintnode/" ]; then 
        cd ${emacs_plugins_dir}/lintnode/
        if [ -f flymake-cursor.el ]; then 
            echo_warning "Already Installed: flymake-cursor.el"
        else
            info "Installing: flymake-cursor.el"
            curl -o flymake-cursor.el http://www.emacswiki.org/emacs/download/flymake-cursor.el
        fi
    else
        error "Dependand lintnode is not in place"
    fi
}

# ---------------------------------------------------------------------------- #
# install .emacs file                                                          #
# ---------------------------------------------------------------------------- #
install_dot_emacs(){
    cd ${this_dir}
    info "Installing my [.emacs] file"
    cp .emacs ~/.emacs
}
# ---------------------------------------------------------------------------- #
# install pycscope_maker.sh                                                    #
# ---------------------------------------------------------------------------- #
install_pycscope(){
    cd ${this_dir}
    if [ -f "/usr/bin/pycscope_maker.sh" ]; then 
        echo_warning "Already Installed: pycscope_maker.sh"
    else
        info "Installing: pycscope_maker.sh"
        sudo cp ./utils/pycscope_maker.sh /usr/bin/
        sudo chmod 755 /usr/bin/pycscope_maker.sh
    fi
}
# ---------------------------------------------------------------------------- #
# install lintnode.sh                                                          #
# ---------------------------------------------------------------------------- #
install_lintnodesh(){
    if [ -f "/usr/bin/lintnode.sh" ]; then 
        echo_warning "Already Installed: lintnode.sh"
    else
        info "Installing: lintnode"
        sudo cp ./utils/lintnode.sh /usr/bin/
        sudo chmod 755 /usr/bin/lintnode.sh
    fi
}
