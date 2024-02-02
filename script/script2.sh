#!/bin/bash

dep_csv="/home/admin01/archivos/departamentos.csv"
emp_csv="/home/admin01/archivos/empleados.csv"

	while IFS=";" read -r departamento descripcion; do

		if [ -n $departamento ]; then
			sudo samba-tool group delete "$departamento"
		fi

		done < "$dep_csv"


	while IFS=";" read -r departamento nombre apellido; do
	nombre=$(echo "$nombre" | tr -d '\r')
	apellido=$(echo "$apellido" | tr -d '\r')
	empleado="$nombre$apellido"
	if [ -n "$nombre$apellido" ]; then

		sudo samba-tool user delete "$empleado"

		fi

		done < "$emp_csv"

