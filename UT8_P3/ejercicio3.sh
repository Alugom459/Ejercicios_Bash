#!/bin/bash
function iden (){
	cognom1=$(echo $1 | awk '{print substr($1,1,2)}' )
	cognom2=$(echo $2 | awk '{print substr($1,1,2)}')
	nom=$(echo $3 | awk '{print substr($1,1,1)}')
	echo "$cognom1$cognom2$nom"
}
if [ "$#" -lt 4 ] | [ $# -gt 5 ]; then
	echo "Error. La sintaxis correcta es ./gestionusuarios.sh alta/baja nombre apellido1 apellido2 [grupo]"
	exit 1
fi

a=$(iden "$3" "$4" "$2")
if [ $1=="alta" ] && [ $# -eq 5 ]; then
	useradd -m -s /bin/bash -g $5 $a
elif [ $1=="alta" ]; then
	useradd -m -s /bin/bash $a
elif [ $1=="baja" ]; then
	userdel $a
fi

