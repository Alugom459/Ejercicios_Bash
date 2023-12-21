#!/bin/bash

suma=0

while true; do

    read -p "Introduce un numero (0 para finalizar): " numero


    if [ $numero -eq 0 ]; then
        echo "La suma total es: $suma"
        echo "¡Script terminado!"
        exit 0
    fi


    suma=$((suma + numero))


    echo "Suma parcial: $suma"
done
