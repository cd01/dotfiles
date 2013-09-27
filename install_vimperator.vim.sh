#!/bin/sh

syntaxFileURL=http://vimperator-labs.googlecode.com/hg/vimperator/contrib/vim/syntax/vimperator.vim

if test -d ~/.vim; then
    vimSyntaxDir=~/.vim/syntax
elif test -d ~/vimfiles; then
    vimSyntaxDir=~/vimfiles/syntax
fi

if ! test -d $vimSyntaxDir; then
    mkdir -p $vimSyntaxDir
fi

if test -d $vimSyntaxDir && ! test -f $vimSyntaxDir/vimperator.vim; then
    wget $syntaxFileURL -O $vimSyntaxDir/vimperator.vim
fi

