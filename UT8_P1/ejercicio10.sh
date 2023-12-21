#!/bin/bash


if (($1 >= 2)) && (($1 == 2 || $1 % 2 != 0)); then
    for ((i = 3; i * i <= $1; i += 2)); do
        if (($1 % i == 0)); then

	exit 0
        fi
    done

    echo "$1 es un numero primo."
else
    echo "$1 no es un numero primo."
fi
