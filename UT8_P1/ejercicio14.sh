#!/bin/bash
if [ ! -e "$1" ]; then
    echo "La ruta proporcionada no existe."
    exit
fi



ls -la $1 | awk '{print substr($1, 1, 1), $NF}' | tail -n +4
ls -la $1 | awk '{print substr($1, 1, 1), $NF}' | tail -n +4 | wc -l 
