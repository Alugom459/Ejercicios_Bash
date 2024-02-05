#!/bin/bash

emp_csv=/home/admin01/archivos/empleados.csv
dep_csv=/home/admin01/archivos/departamentos.csv

read -p "Especifique la ruta del fichero empleados.csv: " emp

	if [ "$emp" == "$emp_csv" ]; then

		echo "La ruta es correcta"
	else
		echo "La ruta especificada es incorrecta"
		exit 1
	fi

read -p "Especifique la ruta del fichero departamentos.csv: " dep

	if [ "$dep" == "$dep_csv" ]; then

		echo "La ruta es correcta"
	else
		echo "La ruta especificada es incorrecta"
		exit 1
	fi


	while IFS=";" read -r departamento descripcion; do

		if [ "$departamento" == "departamento"  ]; then
			continue
		fi

		if [ -n "$departamento" ]; then

			if	sudo samba-tool group list | grep -q "$departamento";then
				echo "El grupo ya existe debe eliminarlo para continuar"
				exit 1
			else
				sudo samba-tool group add "$departamento" --description="$descripcion"
				echo "El grupo $departamento se ha creado correctamente"
			fi
	
		fi

	done < "$dep"

	while IFS=";" read -r departamento nombre apellido; do
		empleado="$nombre$apellido"
		pass="Hola0101"

		if [ "$empleado" == "nombreapellido" ]; then
			continue
		fi

		if [ -n "$empleado" ]; then

			if	sudo samba-tool user list | grep -q "$empleado";then
				echo "El usuario que intenta crear ya existe, debe eliminarlo para continuar"
				exit 1
			else
				sudo samba-tool user add "$empleado" "$pass"
				echo "El usuario $empleado se ha creado correctamente"
				sudo samba-tool group addmembers "$departamento" "$empleado"
				echo "El usuario $empleado se ha unido al grupo $departamento"
			fi
		fi

	done < "$emp"
	
