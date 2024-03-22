#!/bin/bash

source common.sh

# Array to store the functions
functions=("install_brew" "install_iterm2" "install_zsh" "install_clipy" "install_rosetta" 
           "install_docker" "install_k8s" "install_go" "install_java" "install_cpp" 
           "install_mongo" "install_python"
           "install_node" "install_cassandra" "install_redis" "install_postgresql" 
           "install_kafka" "install_mysql" "install_vscode" 
           "install_elasticsearch" "install_postman" "install_jetbrains_toolbox" "install_chrome"
           )

# Array to store the corresponding prompts
prompts=("Brew needs to be installed to download the software. Install Brew?" "iTerm2" 
         "Zsh" "Clipy - clipboard history tool" "Rosetta - to run intel compatible softwares" 
         "Docker" "Kubernetes (kubectl and minikube)" "Golang (Go programming language)" 
         "Java" "C++ (GCC compiler and stdc++.h)" "MongoDB" "Python3" 
         "Node.js and NVM" "Apache Cassandra" "Redis" 
         "PostgreSQL" "Apache Kafka" "MySQL" "Visual Studio Code" "Elasticsearch" "Postman"
         "Jetbrain Toolbox - To install intellij IDEs" "Chrome")

# Initialize an array to store user responses
responses=()

echo "Enter your password: "
sudo echo

# Function to install Brew
install_brew() {
    echo | bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" # echo to mimic an enter
    (echo; echo 'eval "$(/opt/homebrew/bin/brew shellenv)"') >> ~/.zprofile
    eval "$(/opt/homebrew/bin/brew shellenv)"
    echo "export PATH=/opt/homebrew/bin:$PATH" >> ~/.bashrc
}

# Function to install iTerm2
install_iterm2() {
    echo "Installing iTerm2"
    brew install --cask iterm2
    print_and_clear "iterm2"
}

install_zsh_bg() {
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
    echo "export PATH=/opt/homebrew/bin:$PATH" >> ~/.zshrc
    # chsh -s /opt/homebrew/bin/zsh
    (echo; echo 'eval "$(/opt/homebrew/bin/brew shellenv)"') >> ~/.zshrc
    eval "$(/opt/homebrew/bin/brew shellenv)"
    sed -i -e "s/plugins=(git)/plugins=(git zsh-autosuggestions sudo copyfile copybuffer jsontools)/" ~/.zshrc
    exit
}

# Function to install Zsh
install_zsh() {
    echo "Installing Zsh"
    install_zsh_bg &
}

# Function to install Clipy
install_clipy() {
    echo "Installing Clipy - clipboard history tool"
    brew install clipy
    open -a /Applications/Clipy.app/
    print_and_clear "clipy"
}

# Function to install Rosetta
install_rosetta() {
    echo "Installing Rosetta to run Intel-compatible softwares"
    echo "A" | softwareupdate --install-rosetta
    print_and_clear "rosetta"
}

# Function to install Docker
install_docker() {
    echo "Installing Docker"
    brew install --cask docker
    export PATH="$PATH:/Applications/Docker.app/Contents/Resources/bin/" >> ~/.zshrc
    open -a Docker
    echo "Waiting for docker to start...."
    sleep 25 # wait for docker to start
    docker run -d hello-world &
    print_and_clear "docker"
}

# Function to install Kubernetes (kubectl and minikube)
install_k8s() {
    echo "Installing Kubernetes (kubectl and minikube)"
    brew install kubectl
    brew install minikube
    minikube start
    print_and_clear "k8s"
}

# Function to install Golang
install_go() {
    echo "Installing Golang"
    mkdir $HOME/go
    mkdir -p $HOME/go/src/github.com/user
    echo "export GOPATH=$HOME/go/src/github.com/user" >> ~/.zshrc
    echo 'export GOROOT="$(brew --prefix golang)/libexec"' >> ~/.zshrc
    echo "export PATH=$PATH:$GOPATH/bin" >> ~/.zshrc
    echo "export PATH=$PATH:$GOROOT/bin" >> ~/.zshrc
    brew install go
    go get golang.org/x/tools/cmd/godoc
    print_and_clear "go"
}

# Function to install Java
install_java() {
    echo "Installing Java"
    brew install java
    sudo ln -sfn /opt/homebrew/opt/openjdk/libexec/openjdk.jdk /Library/Java/JavaVirtualMachines/openjdk.jdk
    print_and_clear "java"
}

# Function to install C++ (GCC compiler and stdc++.h)
install_cpp() {
    echo "Installing C++"
    brew install gcc
    cd /Library/Developer/CommandLineTools/usr/include/c++/v1
    sudo mkdir bits && cd bits
    sudo curl -o stdc++.h https://github.com/Archies13Singh/cpp-important-packages-file/blob/main/stdc++.h
    print_and_clear "cpp"
}

# Function to install MongoDB
install_mongo() {
    echo "Installing MongoDB 6.0"
    brew tap mongodb/brew
    brew install mongodb-community@6.0
    brew services start mongodb-community@6.0
    print_and_clear "mongodb"
}

# Function to install Python
install_python() {
    echo "Installing Python"
    brew install python3
    print_and_clear "python3"
}

# Function to install Node.js and NVM
install_node() {
    echo "Installing Node.js and NVM"
    brew install nvm
    mkdir ~/.nvm
    [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"
    [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"
    echo "source ~/.nvm/nvm.sh" >> ~/.zshrc
    nvm install node
    print_and_clear "node"
}

# Function to install Apache Cassandra
install_cassandra() {
    echo "Installing Apache Cassandra"
    brew install cassandra
    print_and_clear "cassandra"
}

# Function to install Redis
install_redis() {
    echo "Installing Redis"
    brew install redis
    print_and_clear "redis"
}

# Function to install PostgreSQL
install_postgresql() {
    echo "Installing PostgreSQL"
    brew install postgresql@14
    print_and_clear "postgresql"
}

# Function to install Apache Kafka
install_kafka() {
    echo "Installing Apache Kafka"
    brew install kafka
    print_and_clear "kafka"
}

# Function to install MySQL
install_mysql() {
    echo "Installing MySQL"
    brew install mysql
    print_and_clear "mysql"
}

# Function to install Visual Studio Code
install_vscode() {
    echo "Installing Visual Studio Code"
    brew install --cask visual-studio-code
    print_and_clear "vs-code"
}

# Function to install Elasticsearch
install_elasticsearch() {
    echo "Installing Elasticsearch"
    brew tap elastic/tap
    brew install elastic/tap/elasticsearch-full
    print_and_clear "elasticsearch"
}

# Function to install Postman
install_postman() {
    echo "Installing Postman"
    brew install --cask postman
    print_and_clear "postman"
}

install_jetbrains_toolbox() {
    echo "Installing jetbrains toolbox"
    brew install --cask jetbrains-toolbox
    print_and_clear "Jetbrains Toolbox"
}

install_chrome() {
    echo "Installing chrome"
    brew install --cask google-chrome
    print_and_clear "Chrome"
}

# Initialize an array to store user responses
responses=()

# Iterate through prompts and collect responses
for i in "${!prompts[@]}"; do
    if prompt_yes_no "${prompts[$i]}"; then
        responses+=("$i")
    fi
done

# Execute the relevant functions based on user responses
for response in "${responses[@]}"; do
    function_name="${functions[$response]}"
    $function_name
done

