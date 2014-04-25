#!/usr/bin/env bash
DIR="$( cd "$( dirname "{BASH_SOURCE[0]}" )" && pwd )"
rm ~/.vimrc
ln -s $DIR/vimrc ~/.vimrc
ln -sT $DIR ~/.vim
