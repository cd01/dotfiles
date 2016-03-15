syntax on

set expandtab
set statusline=%F%m%r%h%w\%=[TYPE=%Y]\[FORMAT=%{&ff}]\[ENC=%{&fileencoding}]
set shiftwidth=4

if !isdirectory(expand("~/.vimswap"))
    call mkdir(expand("~/.vimswap"), "p")
endif
set swapfile
set directory=~/.vimswap

if !isdirectory(expand("~/.vimbackup"))
    call mkdir(expand("~/.vimbackup"), "p")
endif
set backup
set backupdir=~/.vimbackup

if !isdirectory(expand("~/.vimundofile"))
    call mkdir(expand("~/.vimundofile"), "p")
endif
set undofile
set undodir=~/.vimundofile

let $VIMFILE_DIR = (has('win32') || has('win64')) ? 'vimfiles' : '.vim'

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
    autocmd FileType python let b:did_ftplugin = 1
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
