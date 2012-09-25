syntax on

set number
set backspace=2
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=0
set smartindent
set incsearch
set fileencodings=iso-2022-jp-3,iso-2022-jp,euc-jisx0213,euc-jp,utf-8,ucs-bom,euc-jp,euc-ms,cp932
if has("win32") || has("win64")
  set encoding=cp932
  set termencoding=cp932
endif

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
Bundle 'surround.vim'
Bundle 'cake.vim'
Bundle 'css_color.vim'
Bundle 'Zenburn'
Bundle 'molokai'
Bundle 'desert.vim'

" github の任意のリポジトリ (2)
" Bundle 'Shougo/neocomplcache'  
" Bundle 'Shougo/unite.vim'
Bundle 'Shougo/vimshell'
Bundle 'Shougo/vimproc'
Bundle 'thinca/vim-quickrun'
Bundle "mattn/zencoding-vim"
Bundle "mattn/webapi-vim"
Bundle "yuratomo/w3m.vim"
Bundle "thinca/vim-guicolorscheme"
Bundle "altercation/vim-colors-solarized"
Bundle "Lokaltog/vim-powerline"
" ↓ここから3つTweetVim関連
Bundle "basyura/TweetVim"
Bundle "tyru/open-browser.vim"
Bundle "basyura/twibill.vim"
" CakePHP Viewのシンタックスvim-cakehtmlをgithubに公開 - さかなチキンぱん。
" http://d.hatena.ne.jp/naberon/20101012/vim_cakehtml
Bundle "naberon/vim-cakehtml"
Bundle "nanotech/jellybeans.vim"

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
  set t_Co=256
  " colorscheme desert_cui
  colorscheme lucius
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

""" tweetvim ===================================================================================
nnoremap ,tt :<C-u>TweetVimCommandSay 
nnoremap ,tl :<C-u>TweetVimListStatuses list<CR>

let g:tweetvim_display_separator = 0
let g:tweetvim_tweet_per_page = 200

""" w3m.vim ===================================================================================
let g:w3m#disable_vimproc = 1  
let g:w3m#homepage = "http://www.google.co.jp/"

" set filetype
autocmd BufNewFile,BufRead *.vimrc set filetype=vim
autocmd BufNewFile,BufRead *.vimperatorrc set filetype=vim

" powerline
let g:Powerline_mode_v = "VISUAL"
let g:Powerline_mode_V = "V:LINE"
let g:Powerline_mode_cv = "V:BLOCK"
let g:Powerline_mode_s = "SELECT"
let g:Powerline_mode_S = "S:LINE"
let g:Powerline_mode_cs = "S:BLOCK"
let g:Powerline_mode_i = "INSERT"
let g:Powerline_mode_R = "REPLACE"
let g:Powerline_mode_n = "NORMAL"
