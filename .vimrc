syntax on

set expandtab
set number
set nf=hex
set backspace=2
set tabstop=4
set shiftwidth=4
set softtabstop=0
set cindent
set incsearch
set ff=unix
set fileencodings=utf-8,euc-jp,cp932
set list
set swapfile
set directory=~/.vimswap
set backup
set backupdir=~/.vimbackup
let &directory = &backupdir

set encoding=utf-8
set listchars=tab:»-,trail:_,eol:¶
" set listchars=tab:^-:
set helplang=en,ja

let $VIMFILE_DIR = (has('win32') || has('win64')) ? 'vimfiles' : '.vim'
" helptags ~/$VIMFILE_DIR/doc

"======================= NeoBundle =======================
set nocompatible               " Be iMproved

if has('vim_starting')
  set runtimepath+=~/$VIMFILE_DIR/bundle/neobundle.vim/
endif

call neobundle#rc(expand('~/' . $VIMFILE_DIR . '/bundle/'))

" Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'

" Recommended to install
" After install, turn shell ~/.vim/bundle/vimproc, (n,g)make -f your_machines_makefile
" NeoBundle 'Shougo/vimproc'

" color scheme
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'vim-scripts/Zenburn'
NeoBundle 'vim-scripts/twilight'
NeoBundle 'w0ng/vim-hybrid'
NeoBundle 'chriskempson/base16-vim'
NeoBundle 'tomasr/molokai'
NeoBundle 'jpo/vim-railscasts-theme'
NeoBundle 'nanotech/jellybeans.vim'

NeoBundle 'Lokaltog/vim-powerline'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tpope/vim-surround'
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'mattn/zencoding-vim'
NeoBundle 'scrooloose/nerdcommenter'

NeoBundleLazy 'StanAngeloff/php.vim'        , {'autoload': {'filetypes': ['php']}}
NeoBundleLazy 'shawncplus/phpcomplete.vim'  , {'autoload': {'filetypes': ['php']}}
NeoBundleLazy 'PProvost/vim-ps1'            , {'autoload': {'filetypes': ['ps1']}}
NeoBundleLazy 'davidhalter/jedi-vim'        , {'autoload': {'filetypes': ['python']}}
NeoBundleLazy 'teramako/jscomplete-vim'     , {'autoload': {'filetypes': ['javascript']}}
NeoBundleLazy 'jelera/vim-javascript-syntax', {'autoload': {'filetypes': ['javascript']}}
NeoBundleLazy 'kchmck/vim-coffee-script'    , {'autoload': {'filetypes': ['coffee']}}
NeoBundleLazy 'tpope/vim-markdown'          , {'autoload': {'filetypes': ['markdown']}}
NeoBundleLazy 'mattn/mkdpreview-vim'        , {'autoload': {'filetypes': ['markdown']}}
NeoBundleLazy 'nginx.vim'                   , {'autoload': {'filetypes': ['conf']}}

filetype plugin indent on     " Required!

" Brief help
" :NeoBundleList          - list configured bundles
" :NeoBundleInstall(!)    - install(update) bundles
" :NeoBundleClean(!)      - confirm(or auto-approve) removal of unused bundles

" Installation check.
NeoBundleCheck
"======================= NeoBundle =======================

" powerline
let g:Powerline_colorscheme = 'solarized256'
let g:Powerline_symbols     = 'fancy'
set laststatus=2
set t_Co=256 " Linuxのターミナルのときだけ必要？

autocmd BufRead,BufNewFile *.md   set filetype=mkd
autocmd BufRead,BufNewFile *.ctp  set filetype=php
autocmd FileType php :set dictionary=~/$VIMFILE_DIR/dict/php.dict
let $MYVIMRC='~/Dropbox/dotfiles/.vimrc'

" zencoding
let g:user_zen_settings = {
\    'php' : {
\        'dollar_expr' : 0,
\    },
\}

let g:jedi#autocompletion_command = '<C-Space>'

set runtimepath+=~/$VIMFILE_DIR/userlocal/

" vim:set ts=4 sts=0 sw=4 fenc=utf8 ff=unix:
