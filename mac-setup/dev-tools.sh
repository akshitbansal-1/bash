#!/bin/bash
# source common.sh
if prompt_yes_no "go"; then
    echo "Installing golang"
    mkdir $HOME/go
    mkdir -p $HOME/go/src/github.com/user
    echo "export GOPATH=$HOME/go/src/github.com/user" >> ~/.zshrc
    echo 'export GOROOT="$(brew --prefix golang)/libexec"' >> ~/.zshrc
    echo "export PATH=$PATH:$GOPATH/bin" >> ~/.zshrc
    echo "export PATH=$PATH:$GOROOT/bin" >> ~/.zshrc
    brew install go
    go get golang.org/x/tools/cmd/godoc
fi

if prompt_yes_no "java"; then
    echo "Installing java"
    brew install java
    sudo ln -sfn /opt/homebrew/opt/openjdk/libexec/openjdk.jdk /Library/Java/JavaVirtualMachines/openjdk.jdk
fi

if prompt_yes_no "cpp"; then
    echo "Installing cpp"
    brew install gcc
    cd /Library/Developer/CommandLineTools/usr/include/c++/v1
    sudo mkdir bits && cd bits
    sudo curl -o stdc++.h https://github.com/Archies13Singh/cpp-important-packages-file/blob/main/stdc++.h
fi

# if prompt_yes_no "openlens"; then
#     echo "Installing openlens"
#     brew install openlens@6.2.5
# fi

if prompt_yes_no "mongodb"; then
    echo "Installing mongo"
    brew tap mongodb/brew
    brew install mongodb-community@6.0
    brew services start mongodb-community@6.0
fi


if prompt_yes_no "python"; then
    echo "Installing python"
    brew install python3
fi

if prompt_yes_no "helm"; then
    echo "Installing helm"
    brew install kubernetes-helm
fi

if prompt_yes_no "node"; then
    echo "Installing node"
    brew install nvm
    mkdir ~/.nvm
    [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"
    [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"
    echo "source ~/.nvm/nvm.sh" >> ~/.zshrc
    nvm install node
fi

if prompt_yes_no "cassandra"; then
    echo "Installing cassandra"
    brew install cassandra
fi

if prompt_yes_no "redis"; then
    echo "Installing redis"
    brew install redis
fi

if prompt_yes_no "postgresql"; then
    echo "Installing postgresql"
    brew install postgresql
fi

if prompt_yes_no "grafana"; then
    echo "Installing grafana"
    brew install grafana
fi

if prompt_yes_no "vscode"; then
    echo "Installing vscode"
    brew install --cask visual-studio-code
fi

if prompt_yes_no "postman"; then
    echo "Installing postman"
    brew install --cask postman
fi
