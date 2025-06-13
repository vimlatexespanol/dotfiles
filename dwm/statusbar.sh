#!/bin/bash

# Función para obtener el porcentaje de batería y estado de conexión
battery() {
    # Busca la batería (puede ser BAT0 o BAT1)
    if [ -d "/sys/class/power_supply/BAT0" ]; then
        BAT="BAT0"
    elif [ -d "/sys/class/power_supply/BAT1" ]; then
        BAT="BAT1"
    else
        echo "No battery"
        return
    fi

    # Obtiene el porcentaje de batería y el estado
    capacity=$(cat /sys/class/power_supply/$BAT/capacity)
    status=$(cat /sys/class/power_supply/$BAT/status)

    # Muestra el estado (Charging o Discharging)
    echo "Batería: $capacity% ($status)"
}

# Función para obtener la fecha y hora
datetime() {
    echo "$(date '+%Y-%m-%d %H:%M')"
}

# Bucle para actualizar la barra de estado
while true; do
    # Combina la información y actualiza la barra
    xsetroot -name "$(battery) | $(datetime)"
    sleep 5  # Actualiza cada 5 segundos
done
