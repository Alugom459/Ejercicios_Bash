#!/bin/bash

dep_csv="/home/admin01/archivos/departamentos.csv"
emp_csv="/home/admin01/archivos/empleados.csv"


	while IFS=";" read -r departamento descripcion; do

	if [ "$departamento" == "departamento" ]; then
                continue
	fi
		if [ -n "$departamento" ]; then
			if	sudo samba-tool group list | grep -q "$departamento"; then
				sudo samba-tool group delete "$departamento"

			else
				echo "Los grupos no estan en el sistema"
				exit 1
			fi

		fi

		done < "$dep_csv"



	while IFS=";" read -r departamento nombre apellido; do
	nombre=$(echo "$nombre" | tr -d '\r')
	apellido=$(echo "$apellido" | tr -d '\r')
	empleado="$nombre$apellido"

	if [ "$empleado" == "nombreapellido" ]; then
                continue
	fi

		if [ -n "$nombre$apellido" ]; then
		
			if	sudo samba-tool user list | grep -q "$empleado"; then
				sudo samba-tool user delete "$empleado"

			else
				echo "Los usuarios no estan en el sistema"
			fi
		fi



	done < "$emp_csv"

