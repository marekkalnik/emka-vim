#!/usr/bin/env bash
set -e
DIR="$( cd "$( dirname "{BASH_SOURCE[0]}" )" && pwd )"

read -p "This will REMOVE your .vimrc and .vim directory. Press Y to confirm." -n 1 -r
echo # move to new line

if [[ $REPLY =~ ^[Yy]$ ]]
then
    echo "Removing old installation"
    rm ~/.vimrc
    rm ~/.vim
    echo "Creating symlinks"
    ln -s $DIR/vimrc ~/.vimrc
    ln -sT $DIR ~/.vim
    echo "Done!"
else
    echo "Installation aborted"
    exit 1
fi
