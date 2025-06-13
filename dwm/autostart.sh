#!/bin/bash

feh --bg-scale ~/.config/bspwm/wallpaper.jpg &
picom &
emacs --daemon &
udiskie --no-tray --automont --notify &
exec ~/.config/dwm/statusbar.sh &
