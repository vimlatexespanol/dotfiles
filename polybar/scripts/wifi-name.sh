#!/bin/bash

icon_connected=""     # Ícono Wi-Fi conectado
icon_disconnected=""  # Ícono sin conexión

# Buscar si hay alguna conexión activa de tipo wifi
wifi_info=$(nmcli -t -f TYPE,STATE,CONNECTION device | grep '^wifi:')

# Dividir por campos
wifi_state=$(echo "$wifi_info" | cut -d: -f2)
wifi_name=$(echo "$wifi_info" | cut -d: -f3)

if [[ "$wifi_state" == "connected" && -n "$wifi_name" ]]; then
    echo "$icon_connected  $wifi_name"
else
    echo "$icon_disconnected  Sin Wi-Fi"
fi
