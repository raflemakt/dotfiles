#!/bin/bash

#################### Gunnar Myhre 2021 ###########################
#  _   _                 _     _____ _    _ ______ _      _      
# | | | |               | |   / ____| |  | |  ____| |    | |     
# | |_| |__   ___  _ __ | | _| (___ | |__| | |__  | |    | |     
# | __| '_ \ / _ \| '_ \| |/ /\___ \|  __  |  __| | |    | |     
# | |_| | | | (_) | | | |   < ____) | |  | | |____| |____| |____ 
#  \__|_| |_|\___/|_| |_|_|\_\_____/|_|  |_|______|______|______|
######################## ThonkSHELL ##############################
# My default tmux session with 5 windows:
# 1:Home  2:Dev  3:More  4:Git  5:IRC
#
# Designed for 1080p monitor with 211 col x 58 lines terminal in fullscreen
#
# XFCE panel shortcut and keyboard shortcut command:
# alacritty -t thonkpad-control -o "window.startup_mode=Fullscreen"
#       --hold -e bash -lc ~/repos/dotfiles/thonkSHELL.sh


session="thonk"

tmux has-session -t $session 2>/dev/null

if [ $? != 0 ]; then
    # If it doesn't already exist, create the default tmux session
    tmux new-session -d -s $session -x- -y-


    # Home-window
    tmux rename-window -t 1 Home
    tmux split-window -t Home -h
    tmux split-window -t Home -v
    tmux split-window -t Home -v
    tmux resize-pane -t 2 -x 88 -y 1
    tmux resize-pane -t 3 -y 24

    tmux select-pane -t 1
    tmux send-keys 'cat /etc/ssh/ssh_banner' C-m

    tmux select-pane -t 2
    tmux send-keys 'topbar' C-m

    tmux select-pane -t 3
    tmux send-keys 'neofetch' C-m

    tmux select-pane -t 4
    tmux send-keys 'htop' C-m


    # Dev-window
    tmux new-window -n Dev


    # More-window
    tmux new-window -n More

    
    # Git-window
    tmux new-window -n Git


    # IRC-window
    tmux new-window -n IRC
    tmux split-window -t IRC -h
    tmux split-window -t IRC -v
    tmux select-window -t IRC
    tmux resize-pane -t 2 -x 53 -y 1

    tmux select-pane -t 1
    tmux send-keys 'irssi' C-m

    tmux select-pane -t 2
    tmux send-keys 'topbar' C-m

    tmux select-pane -t 3
    tmux send-keys 'hn' C-m


    # Attach to the session
    tmux set -t $session status-style 'bg=colour14 fg=colour0'
    tmux set -t $session pane-active-border-style 'fg=colour4'

    tmux select-window -t Home
    tmux attach-session -t $session
else
    # If session already exists, attach to it
    tmux attach-session -t $session
fi

