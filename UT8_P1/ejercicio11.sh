#!/bin/bash

numero=108

aleatorio=$(($RANDOM%101))

while [[ numero -ne aleatorio  ]]
do
	read -p "Introduce el numero a adivinar: " numero
	if [[ numero -lt aleatorio ]]; then
		echo "El numero introducido es mayor"

	elif [[ numero -gt aleatorio ]]; then
		echo "El numero introducido es menor"

	else
		echo "El numero es el correcto"

fi

done

