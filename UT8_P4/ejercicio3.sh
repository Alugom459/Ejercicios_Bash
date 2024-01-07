#!/bin/bash


directorio_origen="$PWD"


directorio_cuarentena="/root/cuarentena/"


palabra="Hack"


find "$directorio_origen" -type f -exec grep -l "$palabra" {} + | while read -r archivo; do
    echo "Moviendo $archivo a $directorio_cuarentena"
    mv "$archivo" "$directorio_cuarentena"
done

echo "Proceso completado"
