Dotfiles VIM
============

The Vim split of my dotfiles.

##Requirements

This config has been tested on Ubuntu 14.04 using Vim 7.4.
Git is required to run automatic installer.

##Tern requirements

Tern is a JavaScript analysis library. 
It requires node and npm to run and install correctly.

Caution:
The NVM version of nodejs won't work. If you use NVM (which I strongly suggest),
make also a global executable of node. To copy your current version use:

    n=$(which node);n=${n%/bin/node}; chmod -R 755 $n/bin/*; sudo cp -r $n/{bin,lib,share} /usr/local

Thanks for [DigitalOcean] for this handy oneliner.

[DigitalOcean]: https://www.digitalocean.com/community/tutorials/how-to-install-node-js-with-nvm-node-version-manager-on-a-vps#installation
