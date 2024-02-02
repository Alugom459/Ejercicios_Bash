#!/bin/bash

#Especificamos las variables para los ficheros csv
dep_csv="/home/admin01/archivos/departamentos.csv"
emp_csv="/home/admin01/archivos/empleados.csv"

#Introducir por pantalla la ruta de departamentos.csv y comprobar si existe
read -p "Especifique la ruta del archivo departamentos.csv: " dep

	if [ $dep_csv == $dep ]; then
		echo "El archivo fue proporcionado correctamente"

	else
		echo "El archivo no existe o la ruta especificada no es correcta"
		exit 1
	fi


#Introducir por pantalla la ruta de empleados.csv y comprobar si existe
read -p "Especifique la ruta del archivo empleados.csv: " emp

	if [ "$emp_csv" == "$emp" ]; then
		echo "El archivo fue proporcionado correctamente"

	else
		echo "El archivo no existe o la ruta especificada no es correcta"
		exit 1
	fi


#Creación de los grupos y detección de errores si uno de estos ya existe
	while IFS=";" read -r departamento descripcion; do
#linea que ignora el encabezado departamento
	if [ "$departamento" == "departamento" ]; then
		continue
	fi
		if [ -n "$departamento" ]; then

			if	sudo samba-tool group list | grep -q "$departamento"; then
				echo "ya existe el grupo, pruebe a eliminarlo y vuelva a ejecutar el script"
				echo "También puede ejecutar el fichero script2.sh para eliminar los grupos"
				exit 1
			else
				sudo samba-tool group add "$departamento"  --description="$descripcion"
				echo "Se ha creado el grupo $departamento correctamente"
			fi
		fi

	done < "$dep_csv"


#Creando usuarios y detección de errores si ya existen
	while IFS=";" read -r departamento nombre apellido; do
		nombre=$(echo "$nombre" | tr -d '\r')
		apellido=$(echo "$apellido" | tr -d '\r')
		empleado="$nombre$apellido"
		pass="Hola0101"
#linea que ignora el encabezado nombreapellido
	if [ "$empleado" == "nombreapellido" ]; then
		continue
	fi

		if [ -n "$empleado" ]; then

			if	sudo samba-tool user list | grep -q "$empleado"; then
				echo "Ya existe el usuario, pruebe a eliminarlo y vuelva a ejecutar el script"
				echo "También puede ejecutar el fichero script2.sh para eliminar los usuarios y grupos"
				exit 1

			else
				sudo samba-tool user add "$empleado" "$pass"
				sudo samba-tool group addmembers "$departamento" "$empleado"
			fi
		fi

	done < "$emp_csv"
