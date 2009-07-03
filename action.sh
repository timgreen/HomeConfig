#!/bin/bash

function getConfigList() {
    find . -maxdepth 1 -exec basename '{}' \; \
    | grep -vx "." \
    | grep -vx ".git" \
    | grep -vx "action.sh" \
    | grep -vx "list" \
    | grep -vx ".gitignore"
}

function check() {
    for i in $(getConfigList); do
        [ -e ~/$i ] && echo $i
    done
}

function installConfig() {
    for i in $(getConfigList); do
	rm -fr ~/"$i"
        ln -sf "$PWD"/"$i" ~/"$i"
    done
}

function removeConfig() {
    for i in $(getConfigList); do
         rm -rf ~/"$i"
    done
}

case "$1" in
    check)
        check
        ;;
    install)
        installConfig
        ;;
    rm)
        removeConfig
        ;;
    *)
        getConfigList
        ;;
esac
