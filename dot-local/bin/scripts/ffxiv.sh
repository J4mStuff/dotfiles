#!/usr/bin/sh

unset SDL_VIDEODRIVER

/usr/bin/flatpak run --branch=stable --arch=x86_64 --command=xivlauncher dev.goats.xivlauncher
