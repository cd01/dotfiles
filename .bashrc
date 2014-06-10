alias l="ls -la"
alias ls="ls -G"
alias x="exit"

# Mingw
if test $OS = "Windows_NT" ; then
    alias vim="vim -u NONE"
    alias gvim="~/tools/vim/gvim.exe"
    alias ls='/bin/ls -F --color=tty --show-control-chars'
    alias less='/bin/less -r'
    set meta-flag on
    set convert-meta off
    set output-meta on
fi

