#!/bin/bash

if [ "$1" == "" ]; then
    echo "Usage: sync.sh <hostname>"
    exit 1
fi

rsync -avzhe ssh --delete ~/.vim/ $1:~/.vim
rsync -avzhe ssh --delete ~/.zsh/ $1:~/.zsh
rsync -avzhe ssh --delete ~/.fzf/ $1:~/.fzf
rsync -avzhe ssh --delete ~/.oh-my-zsh/ $1:~/.oh-my-zsh
rsync -avzhe ssh --delete ~/.composer/ $1:~/.composer
