#!/bin/bash

get_sink(){
    sinks=$(pactl list short sinks | grep alsa | awk '{print $1, $7}')

    runningSink=$(echo "$sinks" | grep "RUNNING" | head -n 1 | awk '{print $1}')

    if [ -n "$runningSink" ]
    then
        echo "$runningSink"
    else
        firstSink=$(echo "$sinks" | head -n 1 | awk '{print $1}')
        echo "$firstSink"
    fi
}

get_volume_with_icon(){
    volume=$(get_volume)

    if [[ $volume -gt 60 ]]; then
        echo "  $volume%"
    elif [[ $volume -gt 30 ]]; then
        echo " $volume%"
    elif [[ $volume -gt 0 ]]; then
        echo " $volume%"
    else
        echo " "
    fi
}

# Get Volume
get_volume() {
    WP_OUTPUT=$(wpctl get-volume "$(get_sink)")

    if [[ $WP_OUTPUT =~ ^Volume:[[:blank:]]([0-9]+)\.([0-9]{2})([[:blank:]].MUTED.)?$ ]]; then
        if [[ -n ${BASH_REMATCH[3]} ]]; then
            printf "MUTE\n"
        else
            echo $((10#${BASH_REMATCH[1]}${BASH_REMATCH[2]}))
        fi
    fi
}


# Notify
notify_user() {
    notify-send -h string:x-canonical-private-synchronous:sys-notify -u low -i "$(get_icon)" "Volume : $(get_volume) %"
}

# Increase Volume
inc_volume() {
    pamixer --sink "$(get_sink)" -i 5 && notify_user
}

# Decrease Volume
dec_volume() {
    pamixer --sink "$(get_sink)" -d 5 && notify_user
}

# Toggle Mute
toggle_mute() {
    wpctl set-mute "$(get_sink)" toggle
}

# Execute accordingly
if [[ "$1" == "--get-volume-with-icon" ]]; then
    get_volume_with_icon
elif [[ "$1" == "--inc" ]]; then
    inc_volume
elif [[ "$1" == "--dec" ]]; then
    dec_volume
elif [[ "$1" == "--toggle" ]]; then
    toggle_mute
elif [[ "$1" == "--get-sink" ]]; then
    get_sink
else
    get_volume
fi
