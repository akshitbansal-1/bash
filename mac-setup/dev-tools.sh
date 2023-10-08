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
    print_and_clear "go"
fi

if prompt_yes_no "java"; then
    echo "Installing java"
    brew install java
    sudo ln -sfn /opt/homebrew/opt/openjdk/libexec/openjdk.jdk /Library/Java/JavaVirtualMachines/openjdk.jdk
    print_and_clear "java"
fi

# Installs the C++ compiler and necessary packages using Homebrew, creates a directory and downloads a header file from GitHub. 
if prompt_yes_no "cpp"; then
    echo "Installing cpp"
    brew install gcc
    cd /Library/Developer/CommandLineTools/usr/include/c++/v1
    sudo mkdir bits && cd bits
    sudo curl -o stdc++.h https://github.com/Archies13Singh/cpp-important-packages-file/blob/main/stdc++.h
    print_and_clear "cpp"
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
    print_and_clear "mongodb"
fi

if prompt_yes_no "mongodb-compass"; then
    echo "Installing mongodb-compass"
    brew install --cask mongodb-compass
    print_and_clear "mongo-compass"
fi


if prompt_yes_no "python"; then
    echo "Installing python"
    brew install python3
    print_and_clear "python"
fi

if prompt_yes_no "helm - k8s-UI"; then
    echo "Installing helm"
    brew install kubernetes-helm
    print_and_clear "helm"
fi

if prompt_yes_no "node"; then
    echo "Installing node"
    brew install nvm
    mkdir ~/.nvm
    [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"
    [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"
    echo "source ~/.nvm/nvm.sh" >> ~/.zshrc
    nvm install node
    print_and_clear "node"
fi

if prompt_yes_no "cassandra"; then
    echo "Installing cassandra"
    brew install cassandra
    print_and_clear "cassandra"
fi

if prompt_yes_no "redis"; then
    echo "Installing redis"
    brew install redis
    print_and_clear "redis"
fi

if prompt_yes_no "postgresql"; then
    echo "Installing postgresql"
    brew install postgresql@14
    print_and_clear "postgresql"
fi

if prompt_yes_no "kafka"; then
    echo "Installing kafka"
    brew install kafka
    print_and_clear "kafka"
fi

if prompt_yes_no "postgresql-pgadmin"; then
    echo "Installing pgadmin"
    brew install --cask pgadmin4
    print_and_clear "pgadmin"
fi

if prompt_yes_no "mysql"; then
    echo "Installing mySQL"
    brew install mysql
    print_and_clear "mysql"
fi

if prompt_yes_no "grafana"; then
    echo "Installing grafana"
    brew install grafana
    print_and_clear "grafana"
fi

if prompt_yes_no "vscode"; then
    echo "Installing vscode"
    brew install --cask visual-studio-code
    print_and_clear "vs-code"
fi


if prompt_yes_no "Elasticsearch"; then
    echo "Installing elasticsearch"
    brew tap elastic/tap
    brew install elastic/tap/elasticsearch-full
    print_and_clear "elasticsearch"
fi

if prompt_yes_no "postman"; then
    echo "Installing postman"
    brew install --cask postman
    print_and_clear "postman"
fi
