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

# cdの引数を絶対パスにしてコマンドヒストリに残す - ももいろテクノロジー
# http://inaz2.hatenablog.com/entry/2014/12/11/015125
if [[ -n "$PS1" ]]; then
    cd() {
        command cd "$@"
        local s=$?
        if [[ ($s -eq 0) && (${#FUNCNAME[*]} -eq 1) ]]; then
            history -s cd $(printf "%q" "$PWD")
        fi
        return $s
    }
fi
