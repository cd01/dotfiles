colorscheme hybrid

" Windowsで開いたら全画面
if has("win32") || has("win64")
  autocmd GUIEnter * simalt ~x
endif

set background=dark
set guioptions-=m
set guioptions-=T

set guifont=Envy_Code_R_for_Powerline:h13.5
set guifontwide=Envy_Code_R_for_Powerline:h13.5
set encoding=utf-8
let g:Powerline_symbols = 'fancy'
