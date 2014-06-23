if exist "%USERPROFILE%\.bashrc" del "%USERPROFILE%\.bashrc"
mklink /h "%USERPROFILE%\.bashrc" "%USERPROFILE%\dotfiles\.bashrc"

if exist "%USERPROFILE%\.vimrc" del "%USERPROFILE%\.vimrc"
mklink /h "%USERPROFILE%\.vimrc" "%USERPROFILE%\dotfiles\.vimrc"

if exist "%USERPROFILE%\.gvimrc" del "%USERPROFILE%\.gvimrc"
mklink /h "%USERPROFILE%\.gvimrc" "%USERPROFILE%\dotfiles\.gvimrc"

if exist "%USERPROFILE%\.vimperatorrc" del "%USERPROFILE%\.vimperatorrc"
mklink /h "%USERPROFILE%\.vimperatorrc" "%USERPROFILE%\dotfiles\.vimperatorrc"

if exist "%USERPROFILE%\.vsvim" del "%USERPROFILE%\.vsvim"
mklink /h "%USERPROFILE%\.vsvim" "%USERPROFILE%\dotfiles\win\.vsvim"

mklink /d "%USERPROFILE%\vimfiles"                         "%USERPROFILE%\dotfiles\.vim"
mklink /d "%USERPROFILE%\.vimperator"                      "%USERPROFILE%\dotfiles\.vimperator"
mklink /h "%USERPROFILE%\.minttyrc"                        "%USERPROFILE%\dotfiles\win\.minttyrc"
mklink /h "%USERPROFILE%\AppData\Roaming\keyhac\config.py" "%USERPROFILE%\dotfiles\win\keyhac_config.py"
mklink /h "%USERPROFILE%\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1" "%USERPROFILE%\dotfiles\win\Microsoft.PowerShell_profile.ps1"
