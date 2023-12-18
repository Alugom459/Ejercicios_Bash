#!/bin/bash

if [[ -r $1 ]]
then
echo "El fichero existe y tienes permisos de lectura"
cat $1

elif [[ -e $1 ]]
then
echo "El archivo existe pero no tienes permisos de lectura"
else
echo "El fichero no existe"
fi

