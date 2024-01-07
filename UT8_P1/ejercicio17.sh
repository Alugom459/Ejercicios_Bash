#!/bin/bash


if [ "$#" -ne 2 ]; then
    echo "Error: Debes proporcionar dos parámetros."
    exit 1
fi

origen="$1"
destino="$2"

if [ ! -f "$origen" ]; then
    echo "Error: El primer parámetro debe ser un archivo ordinario existente."
    exit 1
fi

if [ -e "$destino" ]; then
    echo "Error: Ya existe un identificador (archivo, directorio, etc.) con el nombre indicado en el segundo parámetro."
    exit 1
fi

cp "$origen" "$destino"
echo "Archivo copiado exitosamente de '$origen' a '$destino'."
