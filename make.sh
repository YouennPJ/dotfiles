#!/bin/bash
############################
# .make.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
############################

########## Variables

dir=~/dotfiles                    # dotfiles directory
olddir=~/.dotfiles_old             # old dotfiles backup directory
# if [[ "$OSTYPE" == "linux-gnu"* ]]; then
#     files="zshrc zsh config gitconfig"   
# elif [[ "$OSTYPE" == "darwin"* ]]; then
#     files="zshrc zsh config gitconfig"  
files="zshrc zsh config gitconfig"   

##########
echo "Deleting previous backup $olddir"
rm -rf $olddir
echo "...done"

# create dotfiles_old in homedir
echo "Creating $olddir for backup of any existing dotfiles in ~"
mkdir -p $olddir
echo "...done"

# change to the dotfiles directory
echo "Changing to the $dir directory"
cd $dir
echo "...done"

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks 
for file in $files; do
    echo "Moving any existing dotfiles from ~ to $olddir"
    mv ~/.$file ~/.dotfiles_old/
    echo "Copying dotfiles to new directory"
    cp -r $dir/.$file ~/.$file
    echo "...done"
done

# change to the dotfiles directory
echo "Copy binary files to ~"
cp -r ./.local/scripts/* ~/.local/bin/
echo "...done"
