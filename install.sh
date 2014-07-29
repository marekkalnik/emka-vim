#!/usr/bin/env bash
set -e
DIR="$( cd "$( dirname "{BASH_SOURCE[0]}" )" && pwd )"

# Check if NPM executable exists
command -v npm > /dev/null 2>&1 || { echo "NPM is required for Tern to work. Aborting." >&2; exit 1;}

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
    echo "Installing modules"
    git submodule init
    git submodule update
    cd $DIR/bundle/tern_for_vim && npm install
    echo "Done!"
else
    echo "Installation aborted"
    exit 1
fi
