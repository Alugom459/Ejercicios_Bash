#!/bin/bash

read -p "Introduce el numero:" numero

if (( numero % 2 == 0  )); then

	echo "El numero es par"
else
	echo "El numero es inpar"
fi


