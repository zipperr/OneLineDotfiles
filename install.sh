#!/bin/bash

DOTFILES_PATH="$HOME/dotfilesTest"

if [ -d $DOTFILES_PATH ]; then
    echo "already exists"
else
    echo "downloading"
    if type git > /dev/null 2>&1; then

        echo "using git"
        git clone https://github.com/zipperr/OneLineDotfiles
    else
        echo "using curl"
        curl -sL https://github.com/zipperr/OneLineDotfiles/archive/master.tar.gz | tar xz
        mv dotfiles-master dotfilesTest
    fi
    echo "success"
fi
