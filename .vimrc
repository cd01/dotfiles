syntax on
set nocompatible
set expandtab
set shiftwidth=4

set statusline=%F%m%r%h%w\%=[TYPE=%Y]\[FORMAT=%{&ff}]\[ENC=%{&fileencoding}]

let $VIMFILE_DIR=(has('win32') || has('win64')) ? 'vimfiles' : '.vim'

let s:swapdirpath="~/var/vim/swap"
if !isdirectory(expand(s:swapdirpath))
    call mkdir(expand(s:swapdirpath), "p")
endif
set swapfile
set directory=~/var/vim/swap

let s:backupdirpath="~/var/vim/backup"
if !isdirectory(expand(s:backupdirpath))
    call mkdir(expand(s:backupdirpath), "p")
endif
set backup
set backupdir=~/var/vim/backup

let s:undodirpath="~/var/vim/undofiles"
if !isdirectory(expand(s:undodirpath))
    call mkdir(expand(s:undodirpath), "p")
endif
set undofile
set undodir=~/var/vim/undofiles

" golang
if isdirectory(expand("$GOROOT/misc/vim"))
    set rtp+=$GOROOT/misc/vim 
    exe "set rtp+=".globpath($GOPATH, "src/github.com/nsf/gocode/vim")
endif

if filereadable(expand("~/$VIMFILE_DIR/bundle/vim-unbundle/plugin/unbundle.vim"))
    runtime bundle/vim-unbundle/plugin/unbundle.vim
endif

if isdirectory(expand("~/$VIMFILE_DIR/bundle/operator-camelize.vim"))
    map <Leader>c <Plug>(operator-camelize)
    map <Leader>C <Plug>(operator-decamelize)
endif

if isdirectory(expand("~/$VIMFILE_DIR/ftbundle/python/jedi-vim"))
    autocmd FileType python let b:did_ftplugin=1
endif

if isdirectory(expand("~/$VIMFILE_DIR/ftbundle/ps1/poshcomplete-vim"))
    autocmd FileType ps1 :setl omnifunc=poshcomplete#CompleteCommand
endif

if executable("jvgrep")
    set grepprg=jvgrep
endif

set nrformats=

set noequalalways
set winminwidth=8

" vim:set et sw=4 ff=unix:
