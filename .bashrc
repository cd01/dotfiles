alias l="ls -la"
alias x="exit"

# Mingw
if test $OS = "Windows_NT" ; then
    alias vim="~/tools/vim/gvim.exe"
    alias gvim="~/tools/vim/gvim.exe"
    alias ls='/bin/ls -F --color=tty --show-control-chars'
    alias less='/bin/less -r'
    set meta-flag on
    set convert-meta off
    set output-meta on
    source ~/bin/mintty-color/my-color
fi

# powerline-shell
function _update_ps1() {
   export PS1="$(~/powerline-shell.py $?)"
}
export PROMPT_COMMAND="_update_ps1"

# rupa/j2
export JPY=~/bin/j2/j.py # tells j.sh where the python script is
. ~/bin/j2/j.sh          # provides the j() function

# rupa/z
. ~/bin/z/z.sh
