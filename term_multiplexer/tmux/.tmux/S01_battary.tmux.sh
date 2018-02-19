#!/bin/bash

# Skip if the machine don't have battery.
[ -e '/sys/class/power_supply/BAT0' ] || exit 0

tmux set -ag @tpm_plugins ' tmux-plugins/tmux-battery'

current_status_right=$(tmux show-options -gqv status-right)
tmux set-option -g status-right "#{battery_status_fg} Battery: #{battery_icon} #{battery_percentage} #{battery_remain}$current_status_right"
# Use nerd font icon.
tmux set -g @batt_charged_icon       '🔋' # U+1F50B
tmux set -g @batt_attached_icon      '' # '\\uf071'
tmux set -g @batt_full_charge_icon   '' # '\\uf240'
tmux set -g @batt_high_charge_icon   '' # '\\uf241'
tmux set -g @batt_medium_charge_icon '' # '\\uf242'
tmux set -g @batt_low_charge_icon    '' # '\\uf244'
