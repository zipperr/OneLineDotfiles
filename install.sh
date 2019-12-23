#!/bin/bash

download_dotfiles() {
    REPOSITORY_NAME="OneLineDotfiles"
    REPOSITORY_URL="https://github.com/zipperr/"$REPOSITORY_NAME
    DOTFILES_PATH="$HOME/$REPOSITORY_NAME"

    cd $HOME
    if [ -d $DOTFILES_PATH ]; then
        rm -rf $DOTFILES_PATH
    fi

    echo "downloading"
    if type git > /dev/null 2>&1; then
        echo "using git"
        git clone $REPOSITORY_URL
    else
        echo "using curl"
        curl -sL $REPOSITORY_URL/archive/master.tar.gz | tar xz
        mv $REPOSITORY_NAME"-master" $DOTFILES_PATH
        rm -f $HOME/$REPOSITORY_NAME.tar.gz
    fi
    echo "success"
    cd $DOTFILES_PATH
}

setup(){
    if [ "$(uname)" == "Darwin" ]; then
        echo 'mac'
    elif [ "$(expr substr $(uname -s) 1 5)" == "MINGW" ]; then
        echo 'windows'
    elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
        echo 'linux'
    fi
}

create_symbolic_links(){
    if [ "$(expr substr $(uname -s) 1 5)" == "MINGW" ]; then
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
    else
        sudo rm $HOME/.vimrc
        sudo rm $HOME/.bashrc
        sudo rm $HOME/.bash_completion
        sudo rm $HOME/.zshrc
        sudo rm $HOME/.git-prompt.sh
        sudo rm $HOME/.gitconfig
        sudo rm $HOME/.gitignore_global
        sudo rm $HOME/.minttyrc
        ln -s $HOME/dotfiles/.vimrc $HOME/.vimrc
        ln -s $HOME/dotfiles/.bashrc $HOME/.bashrc
        ln -s $HOME/dotfiles/.bash_completion $HOME/.bash_completion
        ln -s $HOME/dotfiles/.zshrc $HOME/.zshrc
        ln -s $HOME/dotfiles/.git-prompt.sh $HOME/.git-prompt.sh
        ln -s $HOME/dotfiles/.gitconfig $HOME/.gitconfig
        ln -s $HOME/dotfiles/.gitignore_global $HOME/.gitignore_global
        ln -s $HOME/dotfiles/.gitignore_global $HOME/.minttyrc
    fi
}

download_dotfiles
setup
create_symbolic_links
