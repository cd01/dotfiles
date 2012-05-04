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

" vim-scripts ���|�W�g�� (1)
" Bundle "rails.vim"
Bundle 'TwitVim'
Bundle 'surround.vim'
Bundle 'cake.vim'
" Bundle 'matrix.vim'

" github �̔C�ӂ̃��|�W�g�� (2)
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

" github �ȊO�̃��|�W�g�� (3)
" Bundle "git://git.wincent.com/command-t.git"


filetype plugin indent on
" -------------Vundle---------------------------------------------------------

"swap�t�@�C�����܂Ƃ߂Ēu���ꏊ(DropBox�΍�)
set swapfile
set directory=~/.vimswap

"backup�t�@�C�����܂Ƃ߂Ēu���ꏊ(DropBox�΍�)
set backup
set backupdir=~/.vimbackup

let &directory = &backupdir


highlight zenkakuda cterm=underline ctermfg=black guibg=black
if has('win32') && !has('gui_running')
	" win32�̃R���\�[��vim��sjis�Őݒ�t�@�C����ǂނ̂ŁA
	" sjis�̑S�p�X�y�[�X�̕����R�[�h���w�肵�Ă��
	match zenkakuda /\%u8140/
else
	match zenkakuda /�@/ "���S�p�X�y�[�X
endif


"---------------------------------------------------------------------------
" OS����.vim�̓ǂݍ��ݐ��ς���{{{
"---------------------------------------------------------------------------
if has('win32')
	:let $VIMFILE_DIR = 'vimfiles'
else
	:let $VIMFILE_DIR = '.vim'
endif
" �` ���������A~/.vim���Q�Ƃ���ꍇ�A����ɁA~/.$VIMFILE_DIR �Ə�������!
"}}}

" helptags ~/$VIMFILE_DIR/doc

" colorscheme
if has("win32") || has("win64")
else
  colorscheme desert
endif

""" Unite.vim
" �N�����ɃC���T�[�g���[�h�ŊJ�n
let g:unite_enable_start_insert = 1

" �C���T�[�g�^�m�[�}���ǂ��炩��ł��Ăяo����悤�ɃL�[�}�b�v
nnoremap <silent> <C-f> :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
inoremap <silent> <C-f> <ESC>:<C-u>UniteWithBufferDir -buffer-name=files file<CR>
nnoremap <silent> <C-b> :<C-u>Unite buffer file_mru<CR>
inoremap <silent> <C-b> <ESC>:<C-u>Unite buffer file_mru<CR>

" �o�b�t�@�ꗗ
nnoremap <silent> ,ub :<C-u>Unite buffer<CR>
" �t�@�C���ꗗ
nnoremap <silent> ,uf :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
" ���W�X�^�ꗗ
nnoremap <silent> ,ur :<C-u>Unite -buffer-name=register register<CR>
" �ŋߎg�p�����t�@�C���ꗗ
nnoremap <silent> ,um :<C-u>Unite file_mru<CR>
" �S���悹
nnoremap <silent> ,ua :<C-u>UniteWithBufferDir -buffer-name=files buffer file_mru bookmark file<CR>

" unite.vim��ł̃L�[�}�b�s���O
autocmd FileType unite call s:unite_my_settings()
function! s:unite_my_settings()
  " �P��P�ʂ���p�X�P�ʂō폜����悤�ɕύX
  imap <buffer> <C-w> <Plug>(unite_delete_backward_path)
  " ESC�L�[��2�񉟂��ƏI������
  nmap <silent><buffer> <ESC><ESC> q
  imap <silent><buffer> <ESC><ESC> <ESC>q
endfunction

""" neocomplcache
let g:neocomplcache_enable_at_startup = 1 " �N�����ɗL����

""" twitvim
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

""" w3m.vim
let g:w3m#disable_vimproc = 1  
let g:w3m#homepage = "http://www.google.co.jp/"
