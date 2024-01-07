#!/bin/bash


if [ "$(date +%u)" -eq 7 ]; then

    rm -rf /tmp/*
    echo "Carpeta temporal limpiada exitosamente el $(date)"
else
    echo "Hoy no es domingo. No se realizará la limpieza."
fi

# Cron -> 0 2 * * 0 /ruta/a/ejercicio7.sh
