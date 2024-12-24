#!/bin/bash

if [ -n "$TMUX" ]; then
    session_name=$(tmux display-message -p '#S')
    if [ "$session_name" = "terminal" ]; then
        tmux rename-window "$(basename "$PWD")"
    fi
fi
