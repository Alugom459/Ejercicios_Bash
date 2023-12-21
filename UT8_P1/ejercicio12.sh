#!/bin/bash


function sumar {

	echo $((num1+num2))
}

function restar {

	echo $((num1-num2))
}

function dividir {

	echo $((num1/num2))
}

function multiplicar {

	echo $((num1*num2))
}

while true; do
    echo "Menu:"
    echo "1 - Sumar"
    echo "2 - Restar"
    echo "3 - Dividir"
    echo "4 - Multiplicar"
    echo "0 - Salir"

    read -p "Seleccione una opcion: " opcion


    case $opcion in
        1)
            read -p "Ingrese el primer numero: " num1
            read -p "Ingrese el segundo numero: " num2
            sumar
            ;;
        2)
            read -p "Ingrese el primer numero: " num1
            read -p "Ingrese el segundo numero: " num2
            restar
            ;;
        3)
            read -p "Ingrese el primer numero: " num1
            read -p "Ingrese el segundo numero: " num2
            dividir
            ;;
        4)
            read -p "Ingrese el primer numero: " num1
            read -p "Ingrese el segundo numero: " num2
            multiplicar
            ;;
        0)
            echo "Saliendo"
            exit 0
            ;;

    esac
done





