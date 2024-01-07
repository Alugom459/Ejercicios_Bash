#!/bin/bash

if [ $# -eq 0 ]; then
  echo "Por favor, proporciona un nombre de directorio como parámetro."
  exit 1
fi


directorio=$1

if [ ! -d "$directorio" ]; then
  echo "El directorio '$directorio' no existe."
  exit 1
fi

num_ficheros=$(find "$directorio" -maxdepth 1 -type f | wc -l)
num_subdirectorios=$(find "$directorio" -maxdepth 1 -type d | wc -l)

echo "Estadísticas para el directorio '$directorio':"
echo "Número de ficheros: $num_ficheros"
echo "Número de subdirectorios: $num_subdirectorios"
