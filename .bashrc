alias l="ls -la"
alias x="exit"

export GIT_EDITOR=vim
export GOPATH=~/.go
export PATH=$GOPATH/bin:$PATH

if [[ "$OSTYPE" == "msys" ]]; then
    alias gvim="~/tools/vim/gvim.exe"
    alias ls='/bin/ls -F --color=tty --show-control-chars'
    alias less='/bin/less -r'
    alias posh='winpty powershell'
    alias python3='winpty python3'
    alias python='winpty python'
    set meta-flag on
    set convert-meta off
    set output-meta on
else
    alias ls="ls -G"

    export GTK_IM_MODULE=fcitx
    export XMODIFIERS=@im=fcitx
    export QT_IM_MODULE=fcitx
fi
