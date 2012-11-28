syntax on

set number
set backspace=2
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=0
set cindent
set incsearch
set fileencodings=utf-8,euc-jp,cp932
set list
set listchars=tab:^-,trail:-
set swapfile
set directory=~/.vimswap
set backup
set backupdir=~/.vimbackup
let &directory = &backupdir

" OS毎に.vimの読み込み先を変える
let $VIMFILE_DIR = (has("win32") || has("win64")) ? 'vimfiles' : '.vim'
helptags ~/$VIMFILE_DIR/doc

" Unvundle
runtime bundle/vim-unbundle/unbundle.vim

" Tweetvim
nnoremap ,tt :<C-u>TweetVimCommandSay
nnoremap ,tl :<C-u>TweetVimListStatuses list<CR>
let g:tweetvim_display_separator = 0
let g:tweetvim_tweet_per_page = 200

" w3m.vim
let g:w3m#disable_vimproc = 1
let g:w3m#homepage = "http://www.google.co.jp/"

" powerline
let g:Powerline_colorscheme = "solarized256"
let g:Powerline_mode_v      = "VISUAL"
let g:Powerline_mode_V      = "V:LINE"
let g:Powerline_mode_cv     = "V:BLOCK"
let g:Powerline_mode_s      = "SELECT"
let g:Powerline_mode_S      = "S:LINE"
let g:Powerline_mode_cs     = "S:BLOCK"
let g:Powerline_mode_i      = "INSERT"
let g:Powerline_mode_R      = "REPLACE"
let g:Powerline_mode_n      = "NORMAL"

" markdown
autocmd BufRead,BufNewFile *.md  set filetype=mkd
