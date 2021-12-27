#!/bin/bash

print() {
  COLOR_GREEN='\033[0;32m'
  COLOR_DEFAULT='\033[0;0m'
  echo -e "${COLOR_GREEN}"$1"${COLOR_DEFAULT}"
}

is_command_available() {
  type "$1" &> /dev/null; # || [command -v "$1"]
}

install_package() {
  if is_command_available "$1"; then
    print "$1 already installed"
  else
    print "Installing $1 ..."
    sudo apt-get install "$1"
  fi
}

print "Installing linux packages ..."

sudo apt-get update

install_package vim
install_package htop
install_package kdenlive
install_package flameshot

dpkg --list | grep 'vim\|htop\|kdenlive\|flameshot'

print "Done\n"
