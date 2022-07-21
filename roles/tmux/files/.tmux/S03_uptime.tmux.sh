#!/bin/bash

tmux set -ag @tpm_plugins ' robhurring/tmux-uptime'

current_status_right=$(tmux show-options -gqv status-right)
tmux set-option -g status-right "$current_status_right #[fg=color232,bg=color253] #{uptime}   "
current_status_right_length=$(tmux show-options -gqv status-right-length)

tmux set-option -g status-right-length $(($current_status_right_length + 20))
