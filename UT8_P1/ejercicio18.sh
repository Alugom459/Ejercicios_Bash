#!/bin/bash


if id "$1" &>/dev/null; then
    echo "El usuario $1 en el sistema."


    if who | grep -wq "$1"; then
        echo "El usuario $1 ha iniciado sesion."
    else
        echo "El usuario $1 no ha iniciado sesion."
    fi
else
    echo "El usuario $1 no esta en el sistema."
fi
