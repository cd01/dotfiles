syntax on

set expandtab
set history=2000
set helplang=en,ja
set statusline=%F%m%r%h%w\%=[TYPE=%Y]\[FORMAT=%{&ff}]\[ENC=%{&fileencoding}]
set backspace=2
set tabstop=4
set shiftwidth=4
set softtabstop=0

set spelllang=en,cjk
" set renderoptions=type:directx

set swapfile
set directory=~/.vimswap
set backup
set backupdir=~/.vimbackup

autocmd BufRead,BufNewFile *.md set filetype=mkd

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
NeoBundle 'chriskempson/base16-vim'
NeoBundle 'w0ng/vim-hybrid'
NeoBundle 'milk.vim'
NeoBundle 'sk1418/last256'

NeoBundle 'mattn/emmet-vim'
NeoBundle 'mattn/excitetranslate-vim', {'depends': 'mattn/webapi-vim'}
NeoBundle 'tpope/vim-surround'
NeoBundle 'mhinz/vim-startify'
NeoBundle 'osyo-manga/vim-over'
NeoBundle 'elzr/vim-json'

NeoBundle 'glidenote/memolist.vim'
NeoBundle 'koron/codic-vim'
NeoBundle 'mattn/googletasks-vim'
" ctrlp

NeoBundle 'itchyny/calendar.vim'
if neobundle#is_installed('calendar')
    let g:calendar_google_calendar = 1
    let g:calendar_google_task = 1
endif


NeoBundle 'Align'
if neobundle#is_installed('Align')
    let g:Align_xstrlen    = 3
    let g:DrChipTopLvlMenu = ""
endif

NeoBundleLazy 'nosami/Omnisharp', {
\   'autoload': {'filetypes': ['cs']},
\   'build': {
\     'windows' : 'C:\\Windows\\Microsoft.NET\\Framework\\v4.0.30319\\MSBuild.exe server/OmniSharp.sln /p:Platform="Any CPU"',
\     'mac'     : 'xbuild server/OmniSharp.sln',
\     'unix'    : 'xbuild server/OmniSharp.sln',
\   }
\ }

NeoBundleLazy 'davidhalter/jedi-vim'        , {'autoload': {'filetypes': ['python']}}
autocmd FileType python let b:did_ftplugin = 1

NeoBundleLazy 'mattn/mkdpreview-vim'        , {'autoload': {'filetypes': ['markdown']}}

" Syntax
NeoBundleLazy 'jelera/vim-javascript-syntax', {'autoload': {'filetypes': ['javascript']}}
NeoBundleLazy 'kchmck/vim-coffee-script'    , {'autoload': {'filetypes': ['coffee']}}
NeoBundleLazy 'tpope/vim-markdown'          , {'autoload': {'filetypes': ['markdown']}}
NeoBundleLazy 'nginx.vim'                   , {'autoload': {'filetypes': ['conf']}}
NeoBundleLazy 'PProvost/vim-ps1'            , {'autoload': {'filetypes': ['ps1']}}

filetype plugin indent on     " Required!

NeoBundleCheck                " Installation check.
"======================= NeoBundle =======================

" Vimperator syntax file
" ここを関数にまとめて、ディレクトリとURLを指定したら、
" ないときだけダウンロードするみたいなプラグインにしてもいいかも
" plugin-downloader-vim
let $SYNTAX_DIR = expand('~/' . $VIMFILE_DIR . '/syntax')
let $VIMP_SYNTAX_FILE_URL = "http://vimperator-labs.googlecode.com/hg/vimperator/contrib/vim/syntax/vimperator.vim"
if file_readable($SYNTAX_DIR . '/vimperator.vim') == 0
    if (has('win32') || has('win64'))
        let $PS_COMMAND = '"$(New-Object System.Net.WebClient).DownloadFile(\"' . $VIMP_SYNTAX_FILE_URL . '\", \"' . $SYNTAX_DIR . '/vimperator.vim\")"'
        silent execute "!powershell -Command " . $PS_COMMAND
        silent execute 'source ' . $SYNTAX_DIR . '/vimperator.vim'
    else
        !wget $VIMP_SYNTAX_FILE_URL -P $SYNTAX_DIR
        silent source $SYNTAX_DIR . '/vimperator.vim'
    endif
endif

colorscheme milk

" vim:set et ts=4 sts=0 sw=4 ff=unix:


