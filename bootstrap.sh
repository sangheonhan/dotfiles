#!/bin/bash

cd "$(dirname "$0")"

git pull

function doIt() {
	rsync --exclude ".git/" --exclude ".DS_Store" --exclude "bootstrap.sh" --exclude "README.md" -av . ~
}

if [ ! -d ~/.vim/bundle/Vundle.vim ]; then
	git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
else
    (cd ~/.vim/bundle/Vundle.vim && git pull)
fi

if [ ! -d ~/.dircolors-solarized/ ]; then
	git clone https://github.com/seebi/dircolors-solarized.git ~/.dircolors-solarized
else
    (cd ~/.dircolors-solarized/ && git pull)
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

# Install Vundle
vim +PluginInstall +qall
vim +PluginClean! +qall

# Reload tmux configration
tmux source-file ~/.tmux.conf

# Install zsh & Oh My Zsh
if [ ! -d ~/.oh-my-zsh ]; then
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh) --unattended"
fi

# Install Fuzzy Finder
if [ ! -d ~/.fzf ]; then
	git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
	~/.fzf/install --all
fi

rsync -av .zshrc ~
