#!/bin/bash

if [[ -d $1 ]]
then
echo "El fichero existe y se trata de un directorio"

elif [[ -f $1 ]]
then
echo "El fichero existe y se trata de un archivo regular"

else
echo "El fichero no existe"
fi

