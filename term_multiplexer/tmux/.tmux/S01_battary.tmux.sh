#!/bin/bash

# Skip if the machine don't have battery.
[ -e '/sys/class/power_supply/BAT0' ] || exit 0

tmux set -ag @tpm_plugins ' tmux-plugins/tmux-battery'

current_status_right=$(tmux show-options -gqv status-right)
tmux set-option -g status-right "#{battery_status_fg} Battery: #{battery_icon} #{battery_percentage} #{battery_remain}$current_status_right"

# Use nerd font icon.
tmux set -g @batt_icon_status_charged  '' # nf-mdi-battery_plus
tmux set -g @batt_icon_status_charging '⚡' #
tmux set -g @batt_icon_status_discharging 'ﮤ' # nf-mdi-power_plug_off
tmux set -g @batt_icon_charge_tier8    '' # nf-mdi-battery_10
tmux set -g @batt_icon_charge_tier7    '' # nf-mdi-battery_20
tmux set -g @batt_icon_charge_tier6    '' # nf-mdi-battery_30
tmux set -g @batt_icon_charge_tier5    '' # nf-mdi-battery_40
tmux set -g @batt_icon_charge_tier4    '' # nf-mdi-battery_50
tmux set -g @batt_icon_charge_tier3    '' # nf-mdi-battery_60
tmux set -g @batt_icon_charge_tier2    '' # nf-mdi-battery_70
tmux set -g @batt_icon_charge_tier1    '' # nf-mdi-battery_80
