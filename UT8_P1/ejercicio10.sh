#!/bin/bash



if (( $1 % 2 == 0  )); then

	echo "El numero es par"
else
	echo "El numero es inpar"
fi

if [[ -z $1 ]]
then
	echo "ERROR: Es necesario introducir un parametro"

fi
