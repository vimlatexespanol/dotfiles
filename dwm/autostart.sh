#!/bin/bash

feh --bg-scale ~/.config/bspwm/wallpaper.jpg &
picom &
emacs --daemon &
udiskie --no-tray --automont --notify &
setxkbmap -layout latam &
exec ~/.config/dwm/statusbar.sh &
