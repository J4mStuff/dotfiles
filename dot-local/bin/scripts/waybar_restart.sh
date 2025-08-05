#!/usr/bin/bash

set -a; source ~/.cache/wal/colors.sh; set +a

killall -SIGUSR2 waybar

hyprctl keyword general:col.active_border "rgba(${color1:1}ee)" "rgba(${color2:1}ee)" "45deg"
hyprctl keyword general:col.inactive_border "rgba(${color3:1}ff)"
