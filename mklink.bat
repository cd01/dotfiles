if exist "%USERPROFILE%\.bashrc" del "%USERPROFILE%\.bashrc"
mklink /h "%USERPROFILE%\.bashrc" "%USERPROFILE%\Dropbox\dotfiles\.bashrc"

if exist "%USERPROFILE%\.vimrc" del "%USERPROFILE%\.vimrc"
mklink /h "%USERPROFILE%\.vimrc" "%USERPROFILE%\Dropbox\dotfiles\.vimrc"

if exist "%USERPROFILE%\.gvimrc" del "%USERPROFILE%\.gvimrc"
mklink /h "%USERPROFILE%\.gvimrc" "%USERPROFILE%\Dropbox\dotfiles\.gvimrc"

if exist "%USERPROFILE%\.vimperatorrc" del "%USERPROFILE%\.vimperatorrc"
mklink /h "%USERPROFILE%\.vimperatorrc" "%USERPROFILE%\Dropbox\dotfiles\.vimperatorrc"

if exist "%USERPROFILE%\.vsvim" del "%USERPROFILE%\.vsvim"
mklink /h "%USERPROFILE%\.vsvim" "%USERPROFILE%\Dropbox\dotfiles\.vsvim"

mklink /d "%USERPROFILE%\vimfiles"                         "%USERPROFILE%\Dropbox\dotfiles\.vim"
mklink /d "%USERPROFILE%\.vimperator"                      "%USERPROFILE%\Dropbox\dotfiles\.vimperator"
mklink /h "%USERPROFILE%\.minttyrc"                        "%USERPROFILE%\Dropbox\dotfiles\.minttyrc"
mklink /h "%USERPROFILE%\AppData\Roaming\keyhac\config.py" "%USERPROFILE%\Dropbox\dotfiles\keyhac_config.py"
mklink /h "%USERPROFILE%\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1" "%USERPROFILE%\Dropbox\dotfiles\Microsoft.PowerShell_profile.ps1"
