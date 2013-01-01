syntax on


set number
set backspace=2
" set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=0
set cindent
set incsearch
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

" OS毎に.vimの読み込み先を変える
let $VIMFILE_DIR = (has("win32") || has("win64")) ? 'vimfiles' : '.vim'
" helptags ~/$VIMFILE_DIR/doc

" Unvundle
runtime bundle/unbundle/unbundle.vim

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
let g:Powerline_symbols     = 'fancy'
set laststatus=2
set t_Co=256 " Linuxのターミナルのときだけ？

" markdown
autocmd BufRead,BufNewFile *.md  set filetype=mkd

" zencoding
let g:user_zen_settings = {
\    'php' : {
\        'dollar_expr' : 0,
\    },
\}

autocmd FileType php :set dictionary=~/$VIMFILE_DIR/dict/php.dict

nnoremap ,v :edit ~/Dropbox/dotfiles/.vimrc<CR>

" vim:set ts=4 sts=0 sw=4 fenc=utf8 ff=unix:
