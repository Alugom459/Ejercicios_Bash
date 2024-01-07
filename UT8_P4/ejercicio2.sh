#!/bin/bash
if [ "$#" -eq 0 ]; then
    echo "Uso: $0 [ahora | Numero de minutos]"
    exit 1
fi

if [ "$1" == "ahora" ]; then
    echo "Apagando el equipo ahora..."
    sudo shutdown -h now
elif [[ "$1" =~ ^[0-9]+$ ]]; then
    echo "Apagando el equipo en $1 minutos..."
    sudo shutdown -h +$1
else
    echo "Opción no válida. Uso: $0 [ahora | N minutos]"
    exit 1
fi
