#!/bin/bash


if [[ -z $1 ]]
then
echo "ERROR: Es necesario introducir dos parametros (./ejercicio2.sh <parametro1> <parametro2>) "

elif [[ -z $2 ]]
then
echo "ERROR: Es necesario introducir un segundo parametro"

else
echo $(($1+$2))

fi
