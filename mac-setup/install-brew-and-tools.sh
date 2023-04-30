#!/bin/bash

source common.sh

bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
(echo; echo 'eval "$(/opt/homebrew/bin/brew shellenv)"') >> ~/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"
echo "export PATH=/opt/homebrew/bin:$PATH" >> ~/.bashrc

if prompt_yes_no "iterm2"; then
    echo "Installing iterm2"
    brew install --cask iterm2
fi

if prompt_yes_no "zsh"; then
    echo "Installing zsh"
    brew install zsh
    echo "export PATH=/opt/homebrew/bin:$PATH" >> ~/.zshrc
    chsh -s /opt/homebrew/bin/zsh
    (echo; echo 'eval "$(/opt/homebrew/bin/brew shellenv)"') >> ~/.zshrc
    eval "$(/opt/homebrew/bin/brew shellenv)"
#    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
    sed -i -e "s/plugins=(git)/plugins=(git zsh-autosuggestions sudo google copydir copyfile copybuffer jsontools)/" ~/.zshrc
fi

if prompt_yes_no "wget"; then
    echo "Installing wget"
    brew install wget
fi

if prompt_yes_no "clipy - clipboard history tool"; then
    echo "Installing clipy - clipboard tool"
    brew install clipy
fi



