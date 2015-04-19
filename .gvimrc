set go=

if (has('win32') || has('win64'))
    autocmd GUIEnter * simalt ~x
    set renderoptions=type:directx
    set renderoptions=type:directx,renmode:5,taamode:2
    set guifont=Ricty_Diminished_Discord:h13.5:b
    set guifontwide=Ricty_Diminished_Discord:h13.5:b
endif
