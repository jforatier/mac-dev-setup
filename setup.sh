#!/bin/sh

# Color Variables
RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color

# Ask for the administrator password upfront.
sudo -v

# Keep Sudo Until Script is finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Check if OSX Command line tools are installed
if type xcode-select >&- && xpath=$( xcode-select --print-path ) &&
test -d "${xpath}" && test -x "${xpath}" ; then
    ###############################################################################
    # Computer Settings                                                           #
    ###############################################################################
    
    # Install Git
    echo "Installing Git"
    brew install git
    
    echo -e "${RED}Please enter your git name? (Ex: John Doe) ${NC}"
    read name
    echo -e "${RED}Please enter your git email? (Ex: john.doe@anywhere.io) ${NC}"
    read email
    
    clear
    
    git config --global user.name "$name"
    
    git config --global user.email "$email"
    
    git config --global color.ui true
    
    git config --global credential.helper osxkeychain
    
    git config --global core.editor "code --wait"
    
    git config --global merge.tool vscode
    
    git config --global mergetool.vscode.cmd 'code --wait $MERGED'
    
    git config --global diff.tool vscode
    
    git config --global difftool.vscode.cmd 'code --wait --diff $LOCAL $REMOTE'
    
    ###############################################################################
    # Install Applications                                                        #
    ###############################################################################
    
    # Install Homebrew
    echo "Installing Homebrew"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    
    
    clear
    echo -e "${RED}Install NodeJS? ${NC}[y/N]"
    read -n 1 -r
    echo    # (optional) move to a new line
    if [[ $REPLY =~ ^[Yy]$ ]]
    then
        # Install Nodejs
        echo "Installing NVM"
        curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash
        
        export NVM_DIR="/Users/${id -un}/.nvm"
        [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm so we dont have to reboot the terminal
        
        #Installing Nodejs
        
        echo "Installing Nodejs"
        nvm install node
        nvm use node
    fi
    
    clear
    echo -e "${RED}Install Python? ${NC}[y/N]"
    read -n 1 -r
    echo    # (optional) move to a new line
    if [[ $REPLY =~ ^[Yy]$ ]]
    then
        # Install Python
        brew install python
    fi
    
    clear
    echo -e "${RED}Install Ruby?${NC} [y/N]"
    read -n 1 -r
    echo    # (optional) move to a new line
    if [[ $REPLY =~ ^[Yy]$ ]]
    then
        # Install ruby
        brew install gpg
        command curl -sSL https://rvm.io/mpapis.asc | gpg --import -
        \curl -L https://get.rvm.io | bash -s stable
        source ~/.rvm/scripts/rvm
        rvm install ruby-2.3.1
        
        gem install bundler
        gem install rails
    fi
    
    clear
    echo -e "${RED}Install Cocoapods?${NC} [y/N]"
    read -n 1 -r
    echo    # (optional) move to a new line
    if [[ $REPLY =~ ^[Yy]$ ]]
    then
        # Install Cocoapods
        sudo gem install cocoapods
    fi
    
    clear
    echo -e "${RED}Setup for Java Development? ${NC}[y/N]"
    read -n 1 -r
    echo    # (optional) move to a new line
    if [[ $REPLY =~ ^[Yy]$ ]]
    then
        brew install \
        java \
        intellij-idea-ce \
        eclipse-ide \
        eclipse-java
    fi
    
    clear
    echo -e "${RED}Setup For Android Developemnt?${NC} [y/N]"
    read -n 1 -r
    echo    # (optional) move to a new line
    if [[ $REPLY =~ ^[Yy]$ ]]
    then
        brew install \
        java \
        android-studio \
        intellij-idea-ce
    fi
    
    clear
    echo -e "${RED}Install Databases? ${NC}[y/N]"
    read -n 1 -r
    echo    # (optional) move to a new line
    if [[ $REPLY =~ ^[Yy]$ ]]
    then
        brew install mysql
        brew install postgresql
        brew install mongo
        brew install redis
        brew install elasticsearch
        
        # Install mysql workbench
        brew install --appdir="/Applications" mysqlworkbench
    fi
    
    
    clear
    
    # Install EMacs
    echo "Installing EMacs"
    brew install emacs --with-cocoa
    brew linkapps emacs
    
    echo "Installing Apps"
    brew install --cask
    brew install \
    google-chrome \
    visual-studio-code \
    fork \
    macdown \
    google-drive \
    iterm2 \
    scratch  \
    rocket \
    keepassxc \
    devutils \
    cleanshot
    
    echo "Shell Suite"
    brew install \
    zsh \
    zsh-completions \
    zsh-syntax-highlighting
    
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
    git clone git://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions
    git clone git://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
    
    echo "Cleaning Up Files"
    brew cleanup
    
    clear
    
    echo "${GREEN}Enjoy the script ?! Make sure to go to the Github Repo (https://github.com/jforatier/mac-dev-setup) and Star it! If you have any issues, just put them there, and all suggestions and contributions are appreciated!"
    
else
    echo "Need to install the OSX Command Line Tools (or XCode) First! Starting Install..."
    # Install XCODE Command Line Tools
    xcode-select --install
fi