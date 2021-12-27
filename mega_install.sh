#!/bin/bash

print_in_color () {
    COLOR_GREEN='\033[0;32m'
    COLOR_NORMAL='\033[0;0m'
    echo -e "${COLOR_GREEN}"$1"${COLOR_NORMAL}"
}

is_command_available () {
    type "$1" &> /dev/null; # || [command -v "$1"]
}

print_in_color "setting up git\n"

git config --global user.name "HadHod"
git config --global user.email maciej.mlynarski@gmail.com

git config --list

if is_command_available npm; then
    print_in_color "Installing npm global packages ..."

    npm install -g @angular/cli              # https://www.npmjs.com/package/@angular/cli
    npm install -g npm-check-updates         # https://www.npmjs.com/package/npm-check-updates

    npm ls -g -depth=0                       # show installed global packages
else
    print_in_color "Install npm or nvm"
fi

print_in_color "Done"
