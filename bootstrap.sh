#!/bin/bash
cd "$(dirname "$0")"
git pull
function doIt() {
	rsync --exclude ".git/" --exclude ".DS_Store" --exclude "bootstrap.sh" --exclude "README.md" -av . ~
}
if [ ! -d ~/.vim/bundle/vundle ]; then
	git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/vundle
fi

if [ "$1" == "--force" -o "$1" == "-f" ]; then
	doIt
else
	read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1
	echo
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		doIt
	fi
fi
unset doIt
source ~/.bash_profile

# Install Vundle
vim +BundleInstall +qall

# Reload tmux configration
tmux source-file ~/.tmux.conf
