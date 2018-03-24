#!/bin/bash

print_in_color () {
    COLOR_GREEN='\033[0;32m'
    COLOR_NORMAL='\033[0;0m'
    echo -e "${COLOR_GREEN}"$1"${COLOR_NORMAL}"
}

is_command_exists () {
    type "$1" &> /dev/null; # || [command -v "$1"]
}

install_package () {
    if is_command_exists "$1"; then
        print_in_color "$1 already installed"
    else
        print_in_color "Installing $1 ..."
        sudo apt-get install "$1"
    fi
}

print_in_color "Installing linux packages ..."

install_package vim
# install_package nvm
install_package htop

dpkg --list | grep 'vim\|nvm\|htop'

print_in_color "linux packages installed\n"

if is_command_exists npm; then
    print_in_color "Installing npm global packages ..."

    npm install -g @angular/cli              # https://www.npmjs.com/package/@angular/cli
    npm install -g npm-check-updates         # https://www.npmjs.com/package/npm-check-updates
    npm install -g create-react-native-app   # https://www.npmjs.com/package/create-react-native-app

    npm ls -g -depth=0                       # show installed global packages
else
    print_in_color "Install npm"
fi

print_in_color "Done"
