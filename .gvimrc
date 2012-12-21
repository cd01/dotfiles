colorscheme solarized

" Windowsで開いたら全画面
if has("win32") || has("win64")
  autocmd GUIEnter * simalt ~x
endif

set background=dark
set guioptions-=m
set guioptions-=T

set guifont=Ricty_Diminished_Discord_for_Po:h13
set guifontwide=Ricty_Diminished_Discord:h13
set encoding=utf-8
let g:Powerline_symbols = 'fancy'
