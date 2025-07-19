#!/usr/bin/zsh

search_string=$(fuzzel --dmenu --lines 0 --placeholder "Type your search" | sed 's/ /+/g')

if [[ -z "$search_string" ]]; then
    exit
fi

/var/lib/flatpak/exports/bin/app.zen_browser.zen --new-tab "https://kagi.com/search?q=$search_string"

