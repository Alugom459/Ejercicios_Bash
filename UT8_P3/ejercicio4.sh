#!/bin/bash

function iden() {
    cognom1=$(echo $1 | awk '{print substr($1,1,2)}' )
    cognom2=$(echo $2 | awk '{print substr($1,1,2)}')
    nom=$(echo $3 | awk '{print substr($1,1,1)}')
    echo "$cognom1$cognom2$nom"
}

if [ "$#" -lt 1 ] || [ "$#" -gt 2 ]; then
    echo "Error. La sintaxis correcta es ./gestionusuarios.sh <ruta_del_fichero>"
    exit 1
fi

file_path=$1

while IFS=, read -r action nombre apellido1 apellido2 grupo; do
    if [ "$action" == "alta" ] && [ "$grupo" ]; then
        a=$(iden "$apellido1" "$apellido2" "$nombre")
        useradd -m -s /bin/bash -G "$grupo" -c "$nombre" "$a"
    else
        a=$(iden "$apellido1" "$apellido2" "$nombre")
        useradd -m -s /bin/bash -c "$nombre" "$a"
    fi
done < "$file_path"
