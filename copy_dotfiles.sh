#!/usr/bin/sh

# This script will copy all files listed in the "paths"
# variable to the current working directory.

declare -a paths=(
"/home/gunnar/.vimrc"
"/home/gunnar/.bashrc"
"/home/gunnar/.tmux.conf"
"/home/gunnar/.config/elinks/elinks.conf"
"/home/gunnar/Documents/kekaflix/vim/vimtraining"
"/etc/ssh/ssh_banner"
)

#copy the dotfiles to the current dir (git repo)
for dotfile in ${paths[@]}; do
		current=${dotfile}
		cp $current $(pwd)
		echo "Copying $current"
done
