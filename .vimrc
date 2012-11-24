syntax on

set number
set backspace=2
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=0
set cindent
set incsearch
set fileencodings=iso-2022-jp-3,iso-2022-jp,euc-jisx0213,euc-jp,utf-8,ucs-bom,euc-jp,euc-ms,cp932
set list
set listchars=tab:^-,trail:-
" if has("win32") || has("win64")
"   set encoding=cp932
"   set termencoding=cp932
" endif

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
Bundle 'Zenburn'
Bundle 'molokai'
Bundle 'desert.vim'

" github の任意のリポジトリ (2)
Bundle 'thinca/vim-quickrun'
Bundle "mattn/zencoding-vim"
Bundle "mattn/mkdpreview-vim"
Bundle "mattn/webapi-vim"
Bundle "yuratomo/w3m.vim"
Bundle "altercation/vim-colors-solarized"
Bundle "nanotech/jellybeans.vim"
Bundle 'PProvost/vim-ps1'
" ↓ここから3つTweetVim関連
Bundle "basyura/TweetVim"
Bundle "tyru/open-browser.vim"
Bundle "basyura/twibill.vim"

" Win CUIのときはPowerline Off
if !((has("win32") || has("win64")) && !has("gui_running"))
    Bundle "Lokaltog/vim-powerline"
    colorscheme mrkn256
endif

filetype plugin indent on
" -------------Vundle---------------------------------------------------------

" swapファイルをまとめて置く場所(DropBox対策)
set swapfile
set directory=~/.vimswap

" backupファイルをまとめて置く場所(DropBox対策)
set backup
set backupdir=~/.vimbackup
let &directory = &backupdir

" OS毎に.vimの読み込み先を変える
if has("win32") || has("win64")
	:let $VIMFILE_DIR = 'vimfiles'
else
	:let $VIMFILE_DIR = '.vim'
endif
" ～ こっから先、~/.vimを参照する場合、代わりに、~/.$VIMFILE_DIR と書くこと!

helptags ~/$VIMFILE_DIR/doc

" colorscheme
if !(has("win32") || has("win64"))
    set t_Co=256
    colorscheme lucius
endif

" tweetvim
nnoremap ,tt :<C-u>TweetVimCommandSay
nnoremap ,tl :<C-u>TweetVimListStatuses list<CR>
let g:tweetvim_display_separator = 0
let g:tweetvim_tweet_per_page = 200

" w3m.vim
let g:w3m#disable_vimproc = 1
let g:w3m#homepage = "http://www.google.co.jp/"

" powerline
let g:Powerline_mode_v  = "VISUAL"
let g:Powerline_mode_V  = "V:LINE"
let g:Powerline_mode_cv = "V:BLOCK"
let g:Powerline_mode_s  = "SELECT"
let g:Powerline_mode_S  = "S:LINE"
let g:Powerline_mode_cs = "S:BLOCK"
let g:Powerline_mode_i  = "INSERT"
let g:Powerline_mode_R  = "REPLACE"
let g:Powerline_mode_n  = "NORMAL"

" markdown
autocmd BufRead,BufNewFile *.md  set filetype=mkd
