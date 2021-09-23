#!/bin/bash

tmux set -ag @tpm_plugins ' tmux-plugins/tmux-net-speed'

current_status_right=$(tmux show-options -gqv status-right)
tmux set-option -g status-right "$current_status_right #{net_speed}"
current_status_right_length=$(tmux show-options -gqv status-right-length)

tmux set-option -g @net_speed_format "🡇%9s 🡅%9s"
# width = 1 + 9 + 1 + 1 + 9 = 21

tmux set-option -g status-right-length $(($current_status_right_length + 21))
