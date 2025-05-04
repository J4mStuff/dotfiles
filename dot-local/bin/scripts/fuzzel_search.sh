#!/usr/bin/sh

search_string=$(fuzzel --dmenu --lines 0 --placeholder "Type your search" | sed 's/ /+/g')

if [[ -z "$search_string" ]]; then
    exit
fi

librewolf --new-tab "https://kagi.com/search?q=$search_string"

