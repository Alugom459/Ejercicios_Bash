#!/bin/bash


read -p "Introduce el primer numero:" num1
read -p  "Introduce el segundo numero:" num2

if [[ $num1 -gt $num2 ]]
then

echo "El primer numero es mayor"

elif [[ $num1 -lt $num2 ]]
then

echo "El segundo numero es mayor"

else

echo "Los numeros son iguales"

fi
