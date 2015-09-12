syntax on

set expandtab
set history=2000
set helplang=en,ja
set spelllang=en,cjk
set statusline=%F%m%r%h%w\%=[TYPE=%Y]\[FORMAT=%{&ff}]\[ENC=%{&fileencoding}]
set backspace=2
set tabstop=4
set shiftwidth=4
set softtabstop=0

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
set rtp+=$GOROOT/misc/vim 
exe "set rtp+=".globpath($GOPATH, "src/github.com/nsf/gocode/vim")

" go get github.com/mattn/files
if executable("files")
    let g:ctrlp_user_command = 'files -p %s'
endif

runtime bundle/vim-unbundle/plugin/unbundle.vim

autocmd FileType markdown,rst,gitcommit setl cpt+=kspell
autocmd FileType ps1 :setl omnifunc=poshcomplete#CompleteCommand
autocmd BufRead,BufNewFile *.md set filetype=mkd

" vim:set et ts=4 sts=0 sw=4 ff=unix:
