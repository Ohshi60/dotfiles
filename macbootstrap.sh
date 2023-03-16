#!/bin/bash
# Setup a fresh OSX install
# Inspired by https://github.com/cg219/dotfiles/blob/master/install.sh

# Todo:
# Add powerline10k
# Iterm2
# change order since oh-my-zsh install seems to stop the script
# ripgrep
# docker

# If the script could be generalized so i can run it on linux machines that would also be awesome



echo "Starting setup"
echo "Enter user info for git"

read -p "Enter name: " full_name
read -p "Enter email: " email


# Setup SSH Key
# Use new algo because github says so

ssh-keygen -t ed25519 -C $email

echo "Public Key Created ..."
echo "Adding public key to ssh-agent..."

eval "$(ssh-agent -s)"

# Create variable that will contain the content of our ssh/config file

f="Host *
  AddKeysToAgent yes
  UseKeychain yes
  IdentityFile ~/.ssh/id_ed25519"

echo "$f" >> ~/.ssh/config

ssh-add --apple-use-keychain ~/.ssh/id_ed25519

# Copy ssh public key to clipboard
pbcopy < ~/.ssh/id_ed25519.pub

echo "SSH public key has been copied to clipboard"
echo "Paste this public key into Github settings"

open https://github.com/settings/keys

read -p "Hit [Enter] to continue once public key is added..."

echo "Setting up git config..."

git config --global user.name $full_name
git config --global user.email $email
git config --global init.defaultBranch main

# Install oh-my-zsh
echo "Installing oh-my-zsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo "Installing Homebrew..."
if test !$(which brew); then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
    # Additional step for apple silicon
    echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi
