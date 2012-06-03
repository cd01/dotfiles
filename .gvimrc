colorscheme solarized 

" 開いたら全画面
if has("win32") || has("win64")
  autocmd GUIEnter * simalt ~x
endif

set background=dark
set guifont=Ricty:h13
set guioptions-=m
set guioptions-=T
