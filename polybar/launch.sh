#!/usr/bin/env bash

# Termina instancias previas de polybar
killall -q polybar

# Espera a que terminen los procesos

while pgrep -u $UID -x polybar > /dev/null; do sleep 1; done

# Lanza Polybar

polybar --config=~/.config/polybar/config.ini example &
