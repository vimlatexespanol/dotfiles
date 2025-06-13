#!/bin/bash

# Verifica si cmus está corriendo
if ! pgrep -x cmus > /dev/null; then
    echo ""
    exit
fi

# Obtiene información de cmus
info=$(cmus-remote -Q 2>/dev/null)
if [ $? -ne 0 ]; then
    echo ""
    exit
fi

# Extrae estado, artista, título, posición y duración
status=$(echo "$info" | grep "status " | cut -d ' ' -f 2)
artist=$(echo "$info" | grep "tag artist " | cut -d ' ' -f 3-)
title=$(echo "$info" | grep "tag title " | cut -d ' ' -f 3-)
position=$(echo "$info" | grep "position " | cut -d ' ' -f 2)
duration=$(echo "$info" | grep "duration " | cut -d ' ' -f 2)

# Si no hay artista o título, usa el nombre del archivo
if [ -z "$artist" ] || [ -z "$title" ]; then
    title=$(echo "$info" | grep "file " | cut -d '/' -f 2-)
fi

# Convierte posición y duración a minutos:segundos
pos_minutes=$(printf "%02d" $(($position / 60)))
pos_seconds=$(printf "%02d" $(($position % 60)))
dur_minutes=$(printf "%02d" $(($duration / 60)))
dur_seconds=$(printf "%02d" $(($duration % 60)))

# Define íconos según el estado
case "$status" in
    "playing") icon="▶" ;;
    "paused") icon="⏸" ;;
    *) icon="" ;;
esac

# Salida para Polybar
echo "$icon $artist - $title [$pos_minutes:$pos_seconds/$dur_minutes:$dur_seconds]"
