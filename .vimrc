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

set swapfile
" TODO: なかったら作る
set directory=~/.vimswap
set backup
" TODO: なかったら作る
set backupdir=~/.vimbackup
set noundofile

" settings for golang
set rtp+=$GOROOT/misc/vim 
exe "set rtp+=".globpath($GOPATH, "src/github.com/nsf/gocode/vim")

autocmd BufRead,BufNewFile *.md set filetype=mkd

" >>>>>>>>>>>>>>>>>>>>>>> NeoBundle >>>>>>>>>>>>>>>>>>>>>>>
set nocompatible               " Be iMproved

" if use proxy, enable neneobundle_default_git_protocol.
" let g:neobundle_default_git_protocol='https'

let $VIMFILE_DIR = (has('win32') || has('win64')) ? 'vimfiles' : '.vim'

if has('vim_starting')
    set runtimepath+=~/$VIMFILE_DIR/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/' . $VIMFILE_DIR . '/bundle/'))

" Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'

" Color Scheme
NeoBundle 'chriskempson/base16-vim'
NeoBundle 'w0ng/vim-hybrid'
NeoBundle 'milk.vim'

NeoBundle 'mattn/emmet-vim'
NeoBundle 'mattn/excitetranslate-vim', {'depends': 'mattn/webapi-vim'}
NeoBundle 'tpope/vim-surround'
NeoBundle 'mhinz/vim-startify'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'kien/ctrlp.vim'

NeoBundle 'glidenote/memolist.vim'
NeoBundle 'koron/codic-vim'
NeoBundle 'mattn/googletasks-vim'
NeoBundle 'mattn/sonictemplate-vim'

NeoBundle 'mattn/flappyvird-vim'
NeoBundle 'mattn/yamada-vim'
NeoBundle 'mattn/yamada2-vim'
NeoBundle 'koron/nyancat-vim'
NeoBundle 'rbtnn/puyo.vim'

NeoBundle 'junegunn/vader.vim'

NeoBundle 'Align'
if neobundle#is_installed('Align')
    let g:Align_xstrlen    = 3
    let g:DrChipTopLvlMenu = ""
endif

NeoBundle 'kana/vim-operator-user'
NeoBundle 'tyru/operator-camelize.vim'
if neobundle#is_installed('operator-camelize.vim') && neobundle#is_installed('vim-operator-user')
    map <Leader>c <Plug>(operator-camelize)
    map <Leader>C <Plug>(operator-decamelize)
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
if neobundle#is_installed('jedi-vim')
    autocmd FileType python let b:did_ftplugin = 1
endif

NeoBundleLazy 'mattn/mkdpreview-vim'        , {'autoload': {'filetypes': ['markdown']}}

" Syntax
NeoBundleLazy 'jelera/vim-javascript-syntax', {'autoload': {'filetypes': ['javascript']}}
NeoBundleLazy 'kchmck/vim-coffee-script'    , {'autoload': {'filetypes': ['coffee']}}
NeoBundleLazy 'tpope/vim-markdown'          , {'autoload': {'filetypes': ['markdown']}}
NeoBundleLazy 'nginx.vim'                   , {'autoload': {'filetypes': ['conf']}}
NeoBundleLazy 'PProvost/vim-ps1'            , {'autoload': {'filetypes': ['ps1']}}
NeoBundleLazy 'cd01/poshcomplete-vim'       , {'autoload': {'filetypes': ['ps1']}}
NeoBundleLazy 'elzr/vim-json'               , {'autoload': {'filetypes': ['json']}}
NeoBundleLazy 'kongo2002/fsharp-vim'        , {'autoload': {'filetypes': ['fsharp']}}

" http://c4se.hatenablog.com/entry/2013/12/21/173425
if !exists('g:quickrun_config')
    let g:quickrun_config = {}
endif
let g:quickrun_config.fsharp = {
\   'command': 'fsharpc',
\   'runmode': 'simple',
\   'exec': [
\     '%c /nologo --out:"%S:p:r:gs?/?\?.exe" %s:gs?/?\?',
\     '"%S:p:r:gs?/?\?.exe" %a',
\     ':call delete("%S:p:r.exe")'
\    ],
\   'tempfile': '%{tempname()}.fs',
\ }

call neobundle#end()

filetype plugin indent on     " Required!

NeoBundleCheck                " Installation check.
" <<<<<<<<<<<<<<<<<<<<<<< NeoBundle <<<<<<<<<<<<<<<<<<<<<<<

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

function! PecoOpen()
    for filename in split(system("find . -type f | peco"), "\n")
        execute "edit" filename
    endfor
endfunction
nnoremap <Leader>op :call PecoOpen()<CR>

autocmd FileType ps1 :setl omnifunc=poshcomplete#CompleteCommand

" vim:set et ts=4 sts=0 sw=4 ff=unix:
