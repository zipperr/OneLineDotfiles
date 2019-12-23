#!/bin/bash

DOTFILES_PATH="$HOME/dotfile20191223"
REPOSITORY_NAME="OneLineDotfiles"
REPOSITORY_URL="https://github.com/zipperr/"$REPOSITORY_NAME

download_dotfiles() {
    cd $HOME
    if [ -d $DOTFILES_PATH ]; then
        echo $DOTFILES_PATH"already exists"
    fi

    echo "downloading"
    if type git > /dev/null 2>&1; then

        echo "using git"
        git clone $REPOSITORY_URL
    else
        echo "using curl"
        curl -sL https://github.com/zipperr/OneLineDotfiles/archive/master.tar.gz | tar xz
        mv $REPOSITORY_NAME"-master" $DOTFILES_PATH
    fi
    echo "success"
    cd $DOTFILES_PATH
}

setup(){
    if [ "$(uname)" == "Darwin" ]; then
        echo 'mac'
        # cd ~/dotfiles
        # ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
        # brew tap Homebrew/bundle
        # brew bundle
        # chsh -s /bin/zsh
        # chmod +x ~/dotfiles/pythonSetup.sh
        #
        # sudo nvram SystemAudioVolume=%00
        # defaults write NSGlobalDomain AppleShowAllExtensions -bool true
        # defaults write com.apple.dock autohide-delay -float 0
        # defaults write com.apple.dock autohide-time-modifier -float 0
        # defaults write com.apple.dock autohide -bool true
        # defaults write com.apple.dock mineffect -string "scale"
        # defaults write com.apple.dock springboard-show-duration -int 0
        # defaults write com.apple.dock springboard-hide-duration -int 0
        # killall Dock
        # sudo chflags nohidden ~/Library
        # sudo chflags nohidden /Volumes
        # defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -int 1
        # defaults write -g com.apple.trackpad.scaling 3
        # defaults write NSGlobalDomain com.apple.swipescrolldirection -bool false
        # defaults write com.apple.finder _FXShowPosixPathInTitle -bool true
        # defaults write com.apple.finder AppleShowAllFiles true
        # defaults write com.apple.finder QuitMenuItem -bool true
        # defaults write com.apple.Safari ShowFullURLInSmartSearchField -bool true
        # defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
        # defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true
        # defaults write com.apple.LaunchServices LSQuarantine -bool false
        # defaults write com.apple.CrashReporter DialogType none
        # defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false
        # defaults write com.apple.finder WarnOnEmptyTrash -bool false
        # defaults write com.apple.Safari AutoOpenSafeDownloads -bool false
        # defaults write com.apple.Safari SuppressSearchSuggestions -bool true
        # defaults write com.apple.Safari UniversalSearchEnabled -bool false
        # defaults write -g InitialKeyRepeat -int 12
        # defaults write -g KeyRepeat -int 1
        # defaults write com.apple.screensaver askForPassword -bool false
        # TERM_PROFILE='zip';
        # TERM_PATH='./';
        # CURRENT_PROFILE="$(defaults read com.apple.terminal 'Default Window Settings')";
        # if [ "${CURRENT_PROFILE}" != "${TERM_PROFILE}" ]; then
        #     open "$TERM_PATH$TERM_PROFILE.terminal"
        #     defaults write com.apple.Terminal "Default Window Settings" -string "$TERM_PROFILE"
        #     defaults write com.apple.Terminal "Startup Window Settings" -string "$TERM_PROFILE"
        # fi
        # defaults import com.apple.Terminal "$HOME/Library/Preferences/com.apple.Terminal.plist"
        #
    elif [ "$(expr substr $(uname -s) 1 5)" == "MINGW" ]; then
        echo 'windows'
    elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
        echo 'Linux'
        # while true;do
        #     echo "Start apt-get update&install"
        #     echo "Type 'y' or 'n'"
        #     read answer
        #     case $answer in
        #         y)
        #             sudo apt-get update && sudo apt-get -y dist-upgrade && sudo apt-get -y autoremove && sudo apt-get autoclean
        #             sudo apt-get -y install zsh vim git make python3 python w3m
        #             sudo apt-get -y install gcc cpp g++ perl ruby node.js lua
        #             break
        #             ;;
        #         n)
        #             break
        #             ;;
        #         *)
        #             echo -e "cannot understand $answer.\n"
        #             ;;
        #     esac
        # done
        # chsh -s /usr/bin/zsh
        # localedef -f UTF-8 -i ja_JP ja_JP.UTF-8
        # chmod +x ~/dotfiles/pythonSetup.sh
    fi
}

create_symbolic_links(){
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
}

download_dotfiles
setup
create_symbolic_links
