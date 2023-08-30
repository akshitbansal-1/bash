#!/bin/bash

prompt_yes_no() {
        read -p "Do you want to install $1? (y/N): " choice
        case $choice in
            [Yy])
		        return 0
                ;;
            *)
                return 1
                ;;
        esac
}

arr=()
print_and_clear() {
    clear;
    arr+=("Installed $1")
    for i in "${arr[@]}"; do echo "$i" ; done
}