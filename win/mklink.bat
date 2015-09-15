@echo off

set destDir=%USERPROFILE%
set srcDir=%USERPROFILE%\Dropbox\dotfiles

call :mkHardlink %destDir%\.bashrc       %srcDir%\.bashrc
call :mkHardlink %destDir%\.vimrc        %srcDir%\.vimrc
call :mkHardlink %destDir%\.gvimrc       %srcDir%\.gvimrc
call :mkHardlink %destDir%\.vimperatorrc %srcDir%\.vimperatorrc
call :mkHardlink %destDir%\.vsvim        %srcDir%\win\.vsvim
call :mkHardlink %destDir%\.minttyrc     %srcDir%\win\.minttyrc

if not exist %destDir%\AppData\Roaming\keyhac mkdir %destDir%\AppData\Roaming\keyhac
call :mkHardlink %destDir%\AppData\Roaming\keyhac\config.py %srcDir%\win\keyhac_config.py

if not exist %destDir%\Documents\WindowsPowerShell mkdir %destDir%\Documents\WindowsPowerShell
call :mkHardlink %destDir%\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1 %srcDir%\win\Microsoft.PowerShell_profile.ps1

call :mkJunction %destDir%\.vim        %srcDir%\.vim
call :mkJunction %destDir%\vimfiles    %srcDir%\.vim
call :mkJunction %destDir%\.vimperator %srcDir%\.vimperator
call :mkJunction %destDir%\bin         %srcDir%\win\bin

goto :eof

:mkJunction
    set to=%1
    set from=%2

    if exist %to% (
        echo "Delete %to%"
        rmdir %to%
    )

    mklink /j %to% %from%
exit /b

:mkHardlink
    set to=%1
    set from=%2

    if exist %to% (
        echo "Delete %to%"
        del %to%
    )

    mklink /h %to% %from%
exit /b

:eof
