#!/bin/bash

source common.sh

echo "Installing rosetta"
if prompt_yes_no "rosetta - to run intel compatible softwares"; then
    softwareupdate --install-rosetta
fi

if prompt_yes_no "docker"; then
    echo "Installing docker"
    brew install --cask docker
    export PATH="$PATH:/Applications/Docker.app/Contents/Resources/bin/" >> ~/.zshrc
    open -a Docker
    sleep 15
    docker run -d hello-world &
fi

if prompt_yes_no "k8s"; then
    echo "Installing k8s"
    brew install kubectl
    brew install minikube
    minikube start
fi
