#!/bin/bash

emp_csv=/home/admin01/archivos/empleados.csv
dep_csv=/home/admin01/archivos/departamentos.csv


	while IFS=";" read -r departamento nombre apellido; do
		empleados="$nombre$apellido"
		if [ "$empleados" == "nombreapellido" ]; then
			continue
		fi
			if [ -n "$empleados" ]; then

				if	sudo samba-tool user list | grep -q "$empleados";then
					sudo samba-tool user delete "$empleados"
					echo "Se han eliminado correctamente"
				else
					echo "Los usuarios no existen no se pueden eliminar"
					exit 1
				fi
			fi

	done < $emp_csv

	while IFS=";" read -r departamento descripcion; do
		if [ "$departamento" == "departamento" ]; then
			continue
		fi
			if [ -n "$departamento" ]; then

				if	sudo samba-tool group list | grep -q "$departamento"; then
					sudo samba-tool group delete "$departamento"
				else
					echo "Los grupos no existen no se pueden eliminar"
					exit 1
				fi
			fi

	done < $dep_csv
