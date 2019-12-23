#!/bin/bash

if [ -d $DOTFILES_PATH ]; then
    echo "あああ"
else
    echo "fjaklsd"
    if type git > /dev/null 2>&1; then
        git clone https://github.com/zipperr/OneLineDotfiles
    else
        curl -sL https://github.com/zipperr/OneLineDotfiles/archive/master.tar.gz | tar xz
        mv dotfiles-master dotfilesTest
    fi
    echo "ajskldf"
fi
