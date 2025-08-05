#!/usr/bin/zsh

set -a; source ~/.cache/wal/colors.sh; set +a

fuzzel \
    --background="${background}44" \
    --text-color="${color5}FF" \
    --prompt-color="${color2}FF" \
    --placeholder-color="${cursor}FF"  \
    --input-color="${color3}FF"  \
    --match-color="${color4}FF"  \
    --selection-color="${foreground}FF"  \
    --selection-text-color="${color1}FF"  \
    --counter-color="${color6}FF" \
    --border-color="${color7}FF"
