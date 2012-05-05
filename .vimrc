syntax on

set number

set backspace=2

set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=0
set smartindent

set incsearch

" -------------Vundle---------------------------------------------------------
set nocompatible
filetype off
 
if has("win32") || has("win64")
  set rtp+=~/vimfiles/vundle.git/ 
  call vundle#rc('~/vimfiles/bundle/')
else
  set rtp+=~/.vim/vundle.git/ 
  call vundle#rc()
endif

" vim-scripts リポジトリ (1)
" Bundle "rails.vim"
Bundle 'TwitVim'
Bundle 'surround.vim'
Bundle 'cake.vim'
" Bundle 'matrix.vim'

" github の任意のリポジトリ (2)
" Bundle "tpope/vim-fugitive"
Bundle 'Shougo/neocomplcache'  
Bundle 'Shougo/unite.vim'
Bundle 'Shougo/vimshell'
Bundle 'Shougo/vimproc'
Bundle 'thinca/vim-quickrun'
Bundle "mattn/zencoding-vim"
Bundle "mattn/favstar-vim"
Bundle "mattn/webapi-vim"
Bundle "mattn/googletasks-vim"
Bundle "yuratomo/w3m.vim"
Bundle "altercation/vim-colors-solarized"

" github 以外のリポジトリ (3)
" Bundle "git://git.wincent.com/command-t.git"


filetype plugin indent on
" -------------Vundle---------------------------------------------------------

"swapファイルをまとめて置く場所(DropBox対策)
set swapfile
set directory=~/.vimswap

"backupファイルをまとめて置く場所(DropBox対策)
set backup
set backupdir=~/.vimbackup

let &directory = &backupdir


"=Ricty使ってたら不要========================================================
" highlight zenkakuda cterm=underline ctermfg=black guibg=black
" if has('win32') && !has('gui_running')
" 	" win32のコンソールvimはsjisで設定ファイルを読むので、
" 	" sjisの全角スペースの文字コードを指定してやる
" 	match zenkakuda /\%u8140/
" else
" 	match zenkakuda /　/ "←全角スペース
" endif


"---------------------------------------------------------------------------
" OS毎に.vimの読み込み先を変える{{{
"---------------------------------------------------------------------------
if has("win32") || has("win64")
	:let $VIMFILE_DIR = 'vimfiles'
else
	:let $VIMFILE_DIR = '.vim'
endif
" ～ こっから先、~/.vimを参照する場合、代わりに、~/.$VIMFILE_DIR と書くこと!
"}}}

" helptags ~/$VIMFILE_DIR/doc

" colorscheme ===================================================================================
if has("win32") || has("win64")
else
  colorscheme desert
endif

""" Unite.vim ===================================================================================
" 起動時にインサートモードで開始
let g:unite_enable_start_insert = 1

" インサート／ノーマルどちらからでも呼び出せるようにキーマップ
nnoremap <silent> <C-f> :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
inoremap <silent> <C-f> <ESC>:<C-u>UniteWithBufferDir -buffer-name=files file<CR>
nnoremap <silent> <C-b> :<C-u>Unite buffer file_mru<CR>
inoremap <silent> <C-b> <ESC>:<C-u>Unite buffer file_mru<CR>

" バッファ一覧
nnoremap <silent> ,ub :<C-u>Unite buffer<CR>
" ファイル一覧
nnoremap <silent> ,uf :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
" レジスタ一覧
nnoremap <silent> ,ur :<C-u>Unite -buffer-name=register register<CR>
" 最近使用したファイル一覧
nnoremap <silent> ,um :<C-u>Unite file_mru<CR>
" 全部乗せ
nnoremap <silent> ,ua :<C-u>UniteWithBufferDir -buffer-name=files buffer file_mru bookmark file<CR>

" unite.vim上でのキーマッピング
autocmd FileType unite call s:unite_my_settings()
function! s:unite_my_settings()
  " 単語単位からパス単位で削除するように変更
  imap <buffer> <C-w> <Plug>(unite_delete_backward_path)
  " ESCキーを2回押すと終了する
  nmap <silent><buffer> <ESC><ESC> q
  imap <silent><buffer> <ESC><ESC> <ESC>q
endfunction

""" neocomplcache ===================================================================================
let g:neocomplcache_enable_at_startup = 1 " 起動時に有効化

""" twitvim ===================================================================================
if has('win32')
	:let twitvim_browser_cmd = 'C:\Program Files\Mozilla Firefox\firefox.exe'
else
	:let twitvim_browser_cmd = 'firefox'
endif
let twitvim_count = 200
nnoremap ,tp :<C-u>PosttoTwitter<CR>
nnoremap ,tf :<C-u>FriendsTwitter<CR><C-w>j
nnoremap ,tu :<C-u>UserTwitter<CR><C-w>j
nnoremap ,tr :<C-u>RepliesTwitter<CR><C-w>j
nnoremap ,tn :<C-u>NextTwitter<CR>
nnoremap ,tl :<C-u>ListTwitter list<CR><C-w>j

" autocmd FileType twitvim call s:twitvim_my_settings()
" function! s:twitvim_my_settings()
"     set nowrap
" endfunction

""" w3m.vim ===================================================================================
let g:w3m#disable_vimproc = 1  
let g:w3m#homepage = "http://www.google.co.jp/"
