#!/bin/bash

#  _   _                 _     _____ _    _ ______ _      _      
# | | | |               | |   / ____| |  | |  ____| |    | |     
# | |_| |__   ___  _ __ | | _| (___ | |__| | |__  | |    | |     
# | __| '_ \ / _ \| '_ \| |/ /\___ \|  __  |  __| | |    | |     
# | |_| | | | (_) | | | |   < ____) | |  | | |____| |____| |____ 
#  \__|_| |_|\___/|_| |_|_|\_\_____/|_|  |_|______|______|______|
#         - Default TMUX session script - Gunnar Myhre 2021


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
    tmux split-window -t Git -v
    tmux select-window -t Git
    tmux resize-pane -t 1 -y 6

    tmux select-pane -t 1
    tmux send-keys 'python /home/gunnar/prosj/useful/git_statusbar.py' C-m

    tmux select-pane -t 2
    tmux send-keys 'cd /home/gunnar/repos && clear' C-m


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
    # Session already exists, attach to it
    tmux attach-session -t $session
fi

