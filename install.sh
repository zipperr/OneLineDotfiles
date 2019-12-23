#!/bin/bash

download_dotfiles() {
    echo 'Download Dotfiles'
    REPOSITORY_NAME="OneLineDotfiles"
    REPOSITORY_URL="https://github.com/zipperr/"$REPOSITORY_NAME
    DOTFILES_PATH="$HOME/$REPOSITORY_NAME"

    cd $HOME
    if [ -d $DOTFILES_PATH ]; then
        rm -rf $DOTFILES_PATH
    fi

    if type git > /dev/null 2>&1; then
        git clone $REPOSITORY_URL
    else
        curl -sL $REPOSITORY_URL/archive/master.tar.gz | tar xz
        mv $REPOSITORY_NAME"-master" $DOTFILES_PATH
        rm -f $HOME/$REPOSITORY_NAME.tar.gz
    fi
    cd $DOTFILES_PATH
}

setup(){
    echo 'Setup for each OS'
    if [ "$(uname)" == "Darwin" ]; then
        echo 'mac'
    elif [ "$(expr substr $(uname -s) 1 5 > /dev/null 2>&1)" == "MINGW" ]; then
        echo 'windows'
    elif [ "$(expr substr $(uname -s) 1 5 > /dev/null 2>&1)" == "Linux" ]; then
        echo 'linux'
    fi
}

create_symbolic_links(){
    echo 'Create SymbolicLinks'
    export MSYS=winsymlinks:nati
    rm -f $HOME/.vimrc
    rm -f $HOME/.bashrc
    rm -f $HOME/.bash_completion
    rm -f $HOME/.zshrc
    rm -f $HOME/.git-prompt.sh
    rm -f $HOME/.gitconfig
    rm -f $HOME/.gitignore_global
    rm -f $HOME/.minttyrc
    ln -s $HOME/dotfiles/.vimrc $HOME/.vimrc
    ln -s $HOME/dotfiles/.bashrc $HOME/.bashrc
    ln -s $HOME/dotfiles/.bash_completion $HOME/.bash_completion
    ln -s $HOME/dotfiles/.zshrc $HOME/.zshrc
    ln -s $HOME/dotfiles/.git-prompt.sh $HOME/.git-prompt.sh
    ln -s $HOME/dotfiles/.gitconfig $HOME/.gitconfig
    ln -s $HOME/dotfiles/.gitignore_global $HOME/.gitignore_global
    ln -s $HOME/dotfiles/.gitignore_global $HOME/.minttyrc
}

download_dotfiles
setup
create_symbolic_links
