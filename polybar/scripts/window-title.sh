#!/bin/bash

#xprop -id "$(xprop -root _NET_ACTIVE_WINDOW | awk '{print $5}')" WM_NAME | cut -d '"' -f 2
#
## Si no hay ventana activa (ID es 0x0), no mostramos nada
#
#if [ "$win_id" = 0x0 ] || [ -z "$win_id" ]; then
#    echo ""
#    exit 0
#fi
#
## Obtener el título de la ventana
#title=$(xprop -id "$win_id" WM_NAME | cut -d '"' -f 2)
#
## Si el título está vacío, mostrar algo opcional
#if [ -z "$title" ]; then
#    echo ""
#else
#    echo "$title"
#fi
#
#max-length=60
#if [ ${#title} -gt $max_length ]; then
#    echo "${title:0:$max_length}..."
#else
#    echo "$title"
#fi
# Obtener el ID de la ventana activa
win_id=$(xprop -root _NET_ACTIVE_WINDOW 2>/dev/null | awk '{print $5}')

# Verificar si el ID es válido (evitar 0x0, vacío o fallo)
if [[ -z "$win_id" || "$win_id" = "0x0" ]]; then
    echo ""
    exit 0
fi

# Obtener el título de la ventana, redirigir errores también
title=$(xprop -id "$win_id" WM_NAME 2>/dev/null | cut -d '"' -f 2)

## Verificar si se obtuvo algo
#if [ -z "$title" ]; then
#    echo ""
#else
#    echo "$title"
#fi
max_length=60
if [ -z "$title" ]; then
    echo ""
elif [ ${#title} -gt $max_length ]; then
    echo "${title:0:$max_length}..."
else
    echo "$title"
fi
