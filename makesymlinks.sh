#!/bin/bash

dir=.dotfiles
olddir=.dotfiles_old
files=".bashrc .config .vim .vimrc"


echo -n "Creating $olddir for backup of any existing dotfiles in ~ ..."
mkdir -p ~/$olddir
echo "done"

echo "Changing to the #dir directory..."
cd ~/$dir
echo "done"

for file in $files; do
	echo "Moving any existing dotfiles from ~ to $olddir"
	mv ~/$file ~/$olddir
	echo "Creating symlink to $file in home dir."
	ln -s ~/$dir/$file ~/$file
done
