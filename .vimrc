syntax on

set expandtab
set history=2000
set helplang=en,ja
set statusline=%F%m%r%h%w\%=[TYPE=%Y]\[FORMAT=%{&ff}]\[ENC=%{&fileencoding}]
" set backspace=2
" set tabstop=4
" set shiftwidth=4
" set softtabstop=0

set swapfile
set directory=~/.vimswap
set backup
set backupdir=~/.vimbackup

autocmd BufRead,BufNewFile *.md   set filetype=mkd

"======================= NeoBundle =======================
set nocompatible               " Be iMproved

" if use proxy, enable neneobundle_default_git_protocol.
" let g:neobundle_default_git_protocol='https'

let $VIMFILE_DIR = (has('win32') || has('win64')) ? 'vimfiles' : '.vim'

if has('vim_starting')
    set runtimepath+=~/$VIMFILE_DIR/bundle/neobundle.vim/
endif

call neobundle#rc(expand('~/' . $VIMFILE_DIR . '/bundle/'))

" Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'

" Color Scheme
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'vim-scripts/Zenburn'
NeoBundle 'vim-scripts/twilight'
NeoBundle 'w0ng/vim-hybrid'
NeoBundle 'chriskempson/base16-vim'
NeoBundle 'tomasr/molokai'
NeoBundle 'jpo/vim-railscasts-theme'
NeoBundle 'nanotech/jellybeans.vim'
NeoBundle 'junegunn/seoul256.vim'
NeoBundle 'milk.vim'

NeoBundle 'mattn/emmet-vim'
NeoBundle 'mattn/excitetranslate-vim', {'depends': 'mattn/webapi-vim'}
" NeoBundle 'tpope/vim-surround'
NeoBundle 'Align'
let g:Align_xstrlen    = 3
let g:DrChipTopLvlMenu = ""

NeoBundleLazy 'davidhalter/jedi-vim'        , {'autoload': {'filetypes': ['python']}}
NeoBundleLazy 'mattn/mkdpreview-vim'        , {'autoload': {'filetypes': ['markdown']}}

" Syntax
NeoBundleLazy 'jelera/vim-javascript-syntax', {'autoload': {'filetypes': ['javascript']}}
NeoBundleLazy 'kchmck/vim-coffee-script'    , {'autoload': {'filetypes': ['coffee']}}
NeoBundleLazy 'tpope/vim-markdown'          , {'autoload': {'filetypes': ['markdown']}}
NeoBundleLazy 'nginx.vim'                   , {'autoload': {'filetypes': ['conf']}}
" NeoBundleLazy 'PProvost/vim-ps1'            , {'autoload': {'filetypes': ['ps1']}}

filetype plugin indent on     " Required!

NeoBundleCheck                " Installation check.
"======================= NeoBundle =======================

colorscheme milk

" vim:set et ts=4 sts=0 sw=4 ff=unix fenc=utf8:

