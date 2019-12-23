#!/bin/bash

DOTFILES_PATH="$HOME/dotfilesTest"
if [ -d $DOTFILES_PATH ]; then
    echo "already exists"
else
    echo "downloading"
    if type git > /dev/null 2>&1; then
        git clone https://github.com/zipperr/OneLineDotfiles
    else
        curl -sL https://github.com/zipperr/OneLineDotfiles/archive/master.tar.gz | tar xz
        mv dotfiles-master dotfilesTest
    fi
    echo "success"
fi
