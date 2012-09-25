colorscheme jellybeans 

" Windowsで開いたら全画面
if has("win32") || has("win64")
  autocmd GUIEnter * simalt ~x
endif

set background=dark
set guifont=Ricty:h11
set guioptions-=m
set guioptions-=T
