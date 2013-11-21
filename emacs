#!/bin/zsh
if [[ -z $(ps aux | grep 'emacs --daemo[n]') ]]; then;
    emacs --daemon
fi
emacsclient -c
